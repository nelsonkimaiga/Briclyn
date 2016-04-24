<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
	Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");
	
	PreparedStatement psInsertLocation=null;
	
	String iCityID=request.getParameter("iCityID");
	String sLocationName=request.getParameter("sLocationName");
	String sSessionUserID=(String)session.getAttribute("sUserID");
	
	String sqlInsertLocation=null;
	
	try{
		sqlInsertLocation="insert into locationmaster (iLocationName,iCityID, iLocationStatus, sCreatedBy, dCreatedDate)"
											+"values('"+sLocationName+"','"+iCityID+"','A','"+sSessionUserID+"',sysdate())";
		psInsertLocation=conn.prepareStatement(sqlInsertLocation);
		psInsertLocation.executeUpdate();
	}
	catch(Exception e)
	{
	   e.printStackTrace();
	   response.sendRedirect("addLocation.jsp");
	}
%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Save Location</title>
        <!--foundation zurb-->
        <link rel="stylesheet" href="css/foundation.css" />
        <link type="text/css" rel="StyleSheet" href="css/style.css"/>
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-1.2.6.js"></script>
        <script type="text/javascript" src="js/jquery.cycle.all.js"></script>
</head>
<body>
    <%@include file="/comman/menu.jsp"%>
    <div class="medium-4 columns large-4 columns">
        <%@include file="menu.jsp" %>
    </div>
    <div class="medium-8 large-4 columns">
        <h2>Location has been saved successfully!</h2>
    </div>
</body>
</html>
<%
   try{
		 if(psInsertLocation!=null){
			 psInsertLocation.close();
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