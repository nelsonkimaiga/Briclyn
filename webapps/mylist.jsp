<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.text.*,java.util.*,java.io.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>

<%
	Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");
	
	ResultSet rsMyList=null;
	PreparedStatement psMyList=null;
//        ResultSet rsPropertyName = null;
//        PreparedStatement psPropertyName = null;
//        ResultSet rsCityName = null;
//        PreparedStatement psCityName = null;
	PreparedStatement psCurrency=null;
	ResultSet rsCurrency=null;
	
	PreparedStatement psAppImage=null;
	ResultSet rsAppImage=null;
	
	PreparedStatement psAppImageURL=null;
	ResultSet rsAppImageURL=null;
	
	String sCurrency="";
	
	String sSUserID=nullconv((String)session.getAttribute("sUserID"));
	
	String sApprovalOptionListImage="";
	String sURLUploadImage="uLoad.jsp";
	String sImageURL="";
	
	String img=null;
	int imglen=0;
	byte [] img_arr=null;
	
	try{
		String sqlAppImage="SELECT cIsImageApprovalNeed FROM list_approval";
		psAppImage=conn.prepareStatement(sqlAppImage);
		rsAppImage=psAppImage.executeQuery();
		if(rsAppImage.next())
		{
		  sApprovalOptionListImage=rsAppImage.getString("cIsImageApprovalNeed");
		}
	     
		String sqlAppImageURL="SELECT iLAImageID, iListID, bImage FROM list_album where iListID=? and cStatus='A'";
		psAppImageURL=conn.prepareStatement(sqlAppImageURL);
		
//		String sqlMyList="SELECT l.iListID, l.sUserID, l.iTransactionType, l.iPropertyID, l.sPropertyAddress, l.iCityID, l.iLocalityID, l.iArea, l.iTotalPrice, l.iBaths, l.dCreatedDate FROM list_requirement l where l.cStatus='A' and l.sUserID='"+nullconv(sSUserID)+"' order by l.dCreatedDate desc";
//		psMyList=conn.prepareStatement(sqlMyList);
//		rsMyList=psMyList.executeQuery();
                String sqlMyList="SELECT l.iListID, l.sUserID, l.iTitle, l.iTransactionType, l.iPropertyID, l.sPropertyAddress, l.iCityID, l.iLocalityID, l.iArea, l.iTotalPrice, l.iBaths, l.dCreatedDate FROM listings l where l.cStatus='A' and l.sUserID='"+nullconv(sSUserID)+"' order by l.dCreatedDate desc";
                psMyList=conn.prepareStatement(sqlMyList);
                rsMyList=psMyList.executeQuery();
//                //query for fetching property names
//                String sqlPropertyName="SELECT sPropertyName from propertymaster";
//                psPropertyName=conn.prepareStatement(sqlPropertyName);
//                rsPropertyName=psPropertyName.executeQuery();
//                
//                //query for fetching city names
//                String sqlCityName="SELECT iCityName from citymaster";
//                psCityName=conn.prepareStatement(sqlCityName);
//                rsCityName=psPropertyName.executeQuery();
		
		String sqlCurrency="SELECT sCurrencyName, sSymbol FROM currency b where sStatus='A'";
		psCurrency=conn.prepareStatement(sqlCurrency);
		rsCurrency=psCurrency.executeQuery();
		if(rsCurrency.next())
		{
		  sCurrency=rsCurrency.getString("sSymbol");
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>My List</title>
        <!--foundation zurb-->
        <link rel="stylesheet" href="css/foundation.css" />
        <link type="text/css" rel="StyleSheet" href="css/style.css"/>
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-1.2.6.js"></script>
        <script type="text/javascript" src="js/jquery.cycle.all.js"></script>
        <script src="js/checkbox.js" type="text/javascript"></script>
        <script>
            function validate()
            {
                var chge="Are you sure to Delete List!";
		if(confirm(chge)==false)
		{  
		   return false;
		}
	} 
	
	function cancalit()
	{
		history.back();
	}
	
	function goRecord(iListID)
	{
	  var pathURL="deleteList.jsp";
	  window.open(pathURL+"?iListID="+iListID,"_self");
	}
	
	function goSubmitForm()
	{
	var chge="Are you sure to Delete!";
		if(confirm(chge)==false)
		{  
		   return false;
		}
	}
	function onErrorLoad(im)
	{
		var id="im"+im;
		document.getElementById(id).src="proImage/blank.jpg";
		document.getElementById(id).style.width="1px";
		document.getElementById(id).style.height="1px";
	}
	
	function openWindow(iListID)
	{
		window.open("display.jsp?iListID="+iListID,'my','status=no,menubar=no,scrollbars=yes,toolbar=no,resize=yes');
	}
            </script>
    </head>
    <body>
        <%@include file="/comman/menu.jsp"%>
        <script>
            fieldSName("iListID","frm");
                </script>
                <div class="container">
                    <form name="frm" action="dList.jsp" onSubmit="return goSubmitForm()">
                        <input type="hidden" name="iPageID" value="My">
                    <%=nullconv((String)request.getAttribute("error"))%>
                    <div class="container">
                        <div class="row">
                            <div class="medium-4 large-4 columns" id="sidemenu">
                                <%@include file="menu.jsp" %>
                            </div>
                            <div class="medium-8 large-8 columns">
                                <h3>My List of Property </h3>
                                <div class="large-12 large-centered columns">
                                    <table width="100%" border="0" cellspacing="=0" cellpadding="0">
                                        <thead>
                                            <tr>
                                                <th class="hspry brt brl"><input type="checkbox" name="allCheck" onClick="selectallMe()" styleClass="ch" /></th>
                                                <th class="hspry brt brl">Location</th>
                                                <th class="hspry brt brl">Specification</th>
                                                <th class="hspry brt brl">Price</th>
                                                <th class="hspry brt brl brr">Contact</th>
                                            </tr>
                                        </thead>    
                          <%
  boolean nextRow=false;
   
   String br="";
   while(rsMyList.next())
   {
    nextRow=true;
    
   String trans=rsMyList.getString("iTransactionType");
   
   if(trans.equalsIgnoreCase("1"))
   {
     trans="for Sale";
   }
   else
   {
     trans="for Rent";
   }
   int iListID=rsMyList.getInt("iListID");   
  %>
                                           <tbody>
                                               <tr>
                                                   <td class="pd brt brb brl"><input type="checkbox" name="iListID" onClick="selectall()" styleClass="ch" value="<%=iListID%>"/>  <img src="proImage/<%=iListID%>.jpg" id="im<%=iListID%>" onError="onErrorLoad('<%=iListID%>')" onClick="openWindow('<%=iListID%>')" width="90" height="100">&nbsp;</td>
                                                   <td class="pd brt brb brl" onClick="goRecord('<%=iListID%>')"><%=rsMyList.getString("iPropertyID")%> <%=trans%><br> <%=rsMyList.getString("sPropertyAddress")%><br><%=rsMyList.getString("iCityID")%> <br><%=rsMyList.getString("iLocalityID")%></td>
                                                   <td class="pd brt brb brl" onClick="goRecord('<%=iListID%>')">Area <%=rsMyList.getString("iArea")%><br><%=rsMyList.getString("iBaths")%>Baths</td>
                                                   <td class="pd brt brb brl" onclick="goRecord('<%=iListID%>')"><%=sCurrency%> <%=rsMyList.getString("iTotalPrice")%> <br></td>
                                                   <td class="pd brt brb brl brr" onClick="goRecord('<%=iListID%>')">Posted Date: <%=getDateFormat(rsMyList.getTimestamp("dCreatedDate"),"dd.MMM.yyyy hh:mm a")%> <br><br></td>
                                               </tr>
                                               <tr>
                                                   <td id="nCl">
                                <%
	//////  This is for approval image option
        if(sApprovalOptionListImage.equalsIgnoreCase("Y"))
        {
            sURLUploadImage="uploadAppImage.jsp";
            psAppImageURL.setInt(1,iListID);
            rsAppImageURL=psAppImageURL.executeQuery();
            if(rsAppImageURL.next())
            {
                img=rsAppImageURL.getString("bImage");
		imglen=img.length();
		img_arr = new byte[imglen];
		InputStream rd_img=rsAppImageURL.getBinaryStream("bImage");
		rd_img.read(img_arr, 0, imglen);
		
		response.reset();
		response.setContentType("image/jpeg");
		response.getOutputStream().write(img_arr,0,imglen);
		response.getOutputStream().flush();
	  }
   } 
   /////  End of approval image option list
   %>
                                                   </td>
                                                   <td id="nCl">&nbsp;</td>
                                                   <td id="nCl">&nbsp;</td>
                                                   <td id="nCl">&nbsp;</td>
                                                   <td height="25" class="brb brl brr" align="center" id="nCl" >
                                                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                           <tr>
                                                               <td align="right"><img src="images/photo.jpg" /></td>
                                                               <td align="left" style="padding-left:5px"><a href="<%=sURLUploadImage%>?iListID=<%=iListID%>">Upload Photo</a></td>
                                                           </tr>
                                                       </table>
                                                   </td>
                                               </tr>
                                               <tr>
                                                    <td id="nCl">&nbsp;</td>
                                                    <td id="nCl">&nbsp;</td>
                                                    <td id="nCl">&nbsp;</td>
                                                    <td id="nCl">&nbsp;</td>
                                                    <td id="nCl">&nbsp;</td>
                                               </tr>
                        <%}
if(nextRow==false)
{
                        %>
                                                  <tr>
                                                      <td colspan="5" align="center" height="50" class="pd brt  brb brl brr">No records is found</td>
                                                  </tr>
                        <%}
                        %>    
                                            </tbody>
                                    </table>
                                            <button type="submit" class="button primary" name="DeleteAll" styleClass="bD" value="Delete">Delete</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
    </body>
</html>
<%
	try{
		 if(psMyList!=null){
			 psMyList.close();
		 }
		 if(rsMyList!=null){
			 rsMyList.close();
		 }
		 if(psCurrency!=null){
			 psCurrency.close();
		 }
		 if(rsCurrency!=null){
			 rsCurrency.close();
		 }
		 if(psAppImage!=null){
			 psAppImage.close();
		 }
		 if(rsAppImage!=null){
			 rsAppImage.close();
		 }
		 
		 
		 if(conn!=null){
		  conn.close();
		 }
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>