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
		sqlInsertlist_requirement="insert into list_requirement(sUserID, iTransactionType, iPropertyID, sPropertyAddress, iCityID, iLocalityID, iArea, iTotalPrice, iBaths, cStatus, sCreatedBy, dCreatedDate)"
									+"values('"+sSessionUserID+"', '"+iTransactionType+"', '"+iPropertyID+"', '"+sPropertyAddress+"', '"+iCityID+"', '"+iLocalityID+"', '"+iArea+"', '"+iTotalPrice+"', '"+iBedroom+"', '"+appYes+"', '"+sSessionUserID+"', sysdate())";
		
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
        <%@include file="/comman/menu.jsp"%>
        <div class="container">
            <div class="row">
                <div class="medium-4 large-4 columns" id="sidemenu">
                    <%@include file="menu.jsp" %>
                </div>
                <br>
                <div class="medium-8 large-8 columns">
                    <h2>Your property listing has been added and saved successfully!</h2>
                </div>
            </div>
        </div>
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