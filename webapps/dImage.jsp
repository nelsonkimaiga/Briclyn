<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.io.*,java.text.*,java.util.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%@include file="function.jsp"%>
<%
 Connection conn=null;
 conn=dbConn.getConnection();
 
  String iListID=request.getParameter("iListID");
  boolean successOne =false;
    
	String sUserTypeSession=nullconv((String)session.getAttribute("iUserType"));
	String sSessonUserID=nullconv((String)session.getAttribute("sUserID"));
	boolean sPendingID=false;
	if(!(sUserTypeSession).equals(""))
	{
	  if(sUserTypeSession.equalsIgnoreCase("1"))
	  {
		 sPendingID=true;
	  }
	}
	
	PreparedStatement psOptions=null;
	ResultSet rsOptions=null;
    try{
			
            String sqlOption="SELECT sUserID FROM list_requirement l  where l.iListID='"+nullconv(iListID)+"' and sUserID='"+sSessonUserID+"'";
      	    psOptions=conn.prepareStatement(sqlOption);
			rsOptions=psOptions.executeQuery();
			if(rsOptions.next())
   			{
			   sPendingID=true;
			}
	}
	catch(Exception e)
	{
	  e.printStackTrace();
	  request.setAttribute("error","<span class='sSError'>&nbsp; Error: Image is not deleted successfully&nbsp; </span>");
	  RequestDispatcher dispatch = request.getRequestDispatcher("/display.jsp");
	  dispatch.forward(request, response);
	}
 	
  if(sPendingID==true){		
    successOne = (new File(getServletContext().getRealPath("")+File.separator+"proImage"+File.separator+iListID+".jpg")).delete();
  }
  if(successOne==true)
  {
            request.setAttribute("error","<span class='sSuccess'>&nbsp; Data is deleted successfully&nbsp; </span>");
		    RequestDispatcher dispatch = request.getRequestDispatcher("/display.jsp");
		    dispatch.forward(request, response);
  }
  else
  {
      request.setAttribute("error","<span class='sSError'>&nbsp; Error: Image is not deleted successfully&nbsp; </span>");
	  RequestDispatcher dispatch = request.getRequestDispatcher("/display.jsp");
	  dispatch.forward(request, response);
  }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>delete Image</title>
</head>

<body>
</body>
</html>
