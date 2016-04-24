<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
	Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");

	PreparedStatement psEditProperty=null;
	
	String sPropertyName=request.getParameter("sPropertyName");
	String iPropertyID=request.getParameter("iPropertyID");
	String sSessionUserID=(String)session.getAttribute("sUserID");
	String sqlEditProperty=null;
	
	try{
		sqlEditProperty="update propertymaster set sPropertyName=?,iPropertyID=?,sModifiedBy=?, dModifiedDate=sysdate() where iPropertyID=?";
		
		psEditProperty=conn.prepareStatement(sqlEditProperty);
		psEditProperty.setString(1,sPropertyName);
		psEditProperty.setInt(2,nullIntconv(iPropertyID));
		psEditProperty.setString(3,sSessionUserID);
		psEditProperty.setInt(4,nullIntconv(iPropertyID));
		
		psEditProperty.executeUpdate();
	}
	catch(Exception e)
	{
	   e.printStackTrace();
	   response.sendRedirect("editProperty.jsp");
	}
%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Edit Property</title>
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
        <h2>Property has been Updated successfully!</h2>
    </div>
</body>
</html>
<%
	try{
		 if(psEditProperty!=null){
			 psEditProperty.close();
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