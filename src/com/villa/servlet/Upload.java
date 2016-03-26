package com.villa.servlet;

import com.oreilly.servlet.MultipartRequest;
import net.sf.jmimemagic.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class Upload extends HttpServlet {

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String tempfile =  File.createTempFile("temp","1").getParent();
		MultipartRequest multi =new MultipartRequest(request, tempfile,8072442);
		
		String iListID=multi.getParameter("iListID");
		File newfile=null;
		newfile=new File(getServletContext().getRealPath("")+File.separator+"proImage"+File.separator+iListID+".jpg");
		
		Enumeration files = multi.getFileNames();
		
		while (files.hasMoreElements()) 
		{
			String name = (String)files.nextElement();
			String filename = multi.getFilesystemName(name);
			String type = multi.getContentType(name);
			File f = multi.getFile(name);
			FileInputStream fin=new FileInputStream(f);
			
			ImageInfo info=new ImageInfo();
			info.setInput(fin);
			
			info.check();
			
			if(info.getFormat()==0)
			{
				fin.close();
				fin=new FileInputStream(f);
				if((iListID)!=null && !(iListID).equals("") && !(iListID).equals("0"))
				{
					FileOutputStream fos=new FileOutputStream(newfile);
					int sizeofit = 500000;	
					if(Math.round(f.length())<3000000)
					{
					try{
					   sizeofit = Math.round(f.length());
					    byte byteImage[]=new byte[sizeofit];
						fin.read(byteImage);
						fos.write(byteImage);
						fos.close();
						request.setAttribute("error", "<span class='sSuccess'>&nbsp;&nbsp;  Uploaded successfully &nbsp;&nbsp;</span>");
					 }
					 catch(Exception e)
					 {
						 request.setAttribute("error", "<span class='sSError'>&nbsp;&nbsp; Error: Image is not uploaded&nbsp;&nbsp; </span>"); 
					 }
					}
					else
					{
						request.setAttribute("error", "<span class='sSError'>&nbsp;&nbsp; Error: Image should be less than 3MB &nbsp;&nbsp; </span>"); 
					}
				}
				else
				{
					 request.setAttribute("error", "<span class='sSError'>&nbsp;&nbsp; Error: Image is not uploaded&nbsp;&nbsp; </span>"); 
				}
			}
			else
			{
					request.setAttribute("error", "<span class='sSError'> &nbsp;&nbsp;You can only upload the Image in Jpeg format &nbsp;&nbsp;</span>");
			}
			
			
			fin.close();
			f.delete();
			
		 }
		RequestDispatcher dispatch = request.getRequestDispatcher("../uLoad.jsp");
		dispatch.forward(request, response);
		return;
	}

}
