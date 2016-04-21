<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
	Connection conn = null;
	conn=dbConn.getConnection();
	
	PreparedStatement psEditProfile=null;
	
	String sFirstName=request.getParameter("sFirstName");
	String sLastName=request.getParameter("sLastName");
	String iCityID=request.getParameter("iCityID");
	String iLocation=request.getParameter("iLocation");
	String sRegEmail=request.getParameter("sRegEmail");
	String dd=request.getParameter("dd");
	String mm=request.getParameter("mm");
	String yyyy=request.getParameter("yyyy");
	String iDateBirth=yyyy+"-"+mm+"-"+dd;
	String sRegGender=request.getParameter("sRegGender");
	String iUserContact=request.getParameter("iUserContact");
	String sUserID=request.getParameter("sUserID");
	String sPassword=request.getParameter("sPassword");
	String sCPassword=request.getParameter("sCPassword");
	String sStatus=request.getParameter("sStatus");
	
	String sModifiedBy=nullconv((String)session.getAttribute("sUserID"));
	
	String sqlEditProfile=null;
	
	try{
		sqlEditProfile="update registration set sRegEmail=?, sFirstName=?, sLastName=?, iDateBirth=?, sRegGender=?, iCityID=?, iLocation=?, iUserContact=?, sModifiedBy=?, sModifiedDate=sysdate() where sUserID=?";
		psEditProfile=conn.prepareStatement(sqlEditProfile);
		psEditProfile.setString(1,sRegEmail);
		psEditProfile.setString(2,sFirstName);
		psEditProfile.setString(3,sLastName);
		psEditProfile.setString(4,iDateBirth);
		psEditProfile.setString(5,sRegGender);
		psEditProfile.setString(6,iCityID);
		psEditProfile.setString(7,iLocation);
		psEditProfile.setString(8,iUserContact);
		psEditProfile.setString(9,sModifiedBy);
		psEditProfile.setString(10,sModifiedBy);
		psEditProfile.executeUpdate();
	}
	catch(Exception e)
	{
	   e.printStackTrace();
	   response.sendRedirect("myProfile.jsp");
	}
%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Edit Profile Succesful</title>
        <!--foundation zurb-->
        <link rel="stylesheet" href="css/foundation.css" />
        <link type="text/css" rel="StyleSheet" href="css/style.css"/>
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    </head>
<body>
    <%@include file="/comman/menu.jsp"%>
    <div class="row">
        <div class="medium-4 large-4 columns" id="sidemenu">
            <%@include file="menu.jsp" %>
        </div>
        <div class="medium-8 large-8 columns">
            <h2>Profile is Updated successfully!</h2>
        </div>
    </body>
    </html>
<%
	try{
		 if(psEditProfile!=null){
			 psEditProfile.close();
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