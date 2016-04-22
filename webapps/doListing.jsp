<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
	Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");
	
	Statement stList=null;
	stList = conn.createStatement();

	String iTransactionType=request.getParameter("tranType");
	String iPropertyID=request.getParameter("propertyType");
	String sPropertyAddress=request.getParameter("sPropertyAddress");
	String iCityID=request.getParameter("iCityID");
	String iLocalityID=request.getParameter("iLocation");
	String iArea=request.getParameter("iArea");
	String iTotalPrice=request.getParameter("iTotalPrice");
	String cPriceNegotiable=request.getParameter("cPriceNegotiable");
	String iBedroom=request.getParameter("bedroom");
	String iNFloor=request.getParameter("floornumber");
	
	String sqlInsertlist_requirement=null;
	
	String sSessionUserID=(String)session.getAttribute("sUserID");
	
	PreparedStatement psListApprovalOption=null;
	ResultSet rsListApprovalOption=null;
	
	String appYes="A";
	
	try{
		String sqlListApprovalOption="SELECT cIsApprovalNeed FROM list_approval";
		psListApprovalOption=conn.prepareStatement(sqlListApprovalOption);
		rsListApprovalOption=psListApprovalOption.executeQuery();
		
		if(rsListApprovalOption.next())
		{
		  appYes=rsListApprovalOption.getString("cIsApprovalNeed");
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	
	try{
		sqlInsertlist_requirement="insert into list_requirement(sUserID, iTransactionType, iPropertyID, sPropertyAddress, iCityID, iLocalityID, iArea, iTotalPrice, iBedRoom, iNFloor, cPriceNegotiable, cStatus, sCreatedBy, dCreatedDate)"
									+"values('"+sSessionUserID+"', '"+iTransactionType+"', '"+iPropertyID+"', '"+sPropertyAddress+"', '"+iCityID+"', '"+iLocalityID+"', '"+iArea+"', '"+iTotalPrice+"', '"+iBedroom+"', '"+iNFloor+"', '"+cPriceNegotiable+"','"+appYes+"', '"+sSessionUserID+"', sysdate())";
		
		stList.executeUpdate(sqlInsertlist_requirement);
	}
	catch(Exception e)
	{
		e.printStackTrace();
		response.sendRedirect("create-listing.jsp");
	}
%>
	<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>list</title>
        <!--foundation zurb-->
        <link rel="stylesheet" href="css/foundation.css" />
        <link type="text/css" rel="StyleSheet" href="css/style.css"/>
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-1.2.6.js"></script>
        <script type="text/javascript" src="js/jquery.cycle.all.js"></script>
    <body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5%">&nbsp;</td>
    <td width="90%"><div class="header"><%@ include file="comman/header.jsp"%></div></td>
    <td width="5%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><%@ include file="comman/logo.jsp"%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><%@include file="/comman/menu.jsp"%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20%" valign="top"><div id="leftbar"><%@include file="menu.jsp" %></div></td>
        <td width="5%" valign="top">&nbsp;</td>
        <td width="75%" valign="top"><h2>Property Listing is saved successfully!</h2></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div class="footer"><%@ include file="comman/footer.jsp"%></div></td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
<%
	try{
		 if(stList!=null){
			 stList.close();
		 }
		 if(psListApprovalOption!=null){
			 psListApprovalOption.close();
		 }
		 
		 if(rsListApprovalOption!=null){
			 rsListApprovalOption.close();
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