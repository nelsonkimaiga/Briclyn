<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
	Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");
	
	PreparedStatement psEditCountry=null;
	
	String sCountryName=request.getParameter("sCountryName");
	String iCountryID=request.getParameter("iCountryID");
	
	String sSessionUserID=(String)session.getAttribute("sUserID");
	
	String sqlEditCountry=null;
	try{
		sqlEditCountry="update countrymaster set sCountryName='"+sCountryName+"' where iCountryID="+nullIntconv(iCountryID)+"";
		psEditCountry=conn.prepareStatement(sqlEditCountry);
		psEditCountry.executeUpdate();
	}
	catch(Exception e)
	{
	   e.printStackTrace();
	   response.sendRedirect("editCountry.jsp");
	}
%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Edit Country</title>
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
    <div  class="container">
        <div class="row">
            <div class="medium-4 large-4 columns" id="sidemenu">
                <%@include file="menu.jsp"%>
            </div>
            <div class="medium-4 large-8 columns">
                <br>
                <h3>Country Updated Successfully.</h3>
            </div>
        </div>
    </div>
</body>
</html>
<%
	try{
		 if(psEditCountry!=null){
			 psEditCountry.close();
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