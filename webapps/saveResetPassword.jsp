<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%
	Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");

	PreparedStatement psInsertPwd=null;
	PreparedStatement psDeletePwd=null;
	
	String sEmail=request.getParameter("sEmail");
	String sRandPwd=request.getParameter("sRandPwd");
	
	String sPassword=request.getParameter("sPwd");
	String sOldPwd=request.getParameter("sCPwd");
	
	String sqlUpdateRegistration=null;
	String sqlDeleteForgetPassword=null;
	
	PreparedStatement psProfile=null;
	ResultSet rsProfile=null;
	conn.setAutoCommit(false);
	try{
		String sqlProfile="SELECT sUserID FROM registration r where sRegEmail=? and sForgetPassword=password(?) and sStatus='A'";
		psProfile=conn.prepareStatement(sqlProfile);
		psProfile.setString(1,sEmail);
		psProfile.setString(2,sRandPwd);
		rsProfile=psProfile.executeQuery();
		
		if(rsProfile.next())
		{
		 sqlUpdateRegistration="update registration set sPassword=password('"+sPassword+"'), sForgetPassword='', sModifiedBy='self', sModifiedDate=sysdate() where sRegEmail='"+sEmail+"'";
		 psInsertPwd=conn.prepareStatement(sqlUpdateRegistration);
		 psInsertPwd.executeUpdate();
		 
		 sqlDeleteForgetPassword="delete from forget_password where sEmailID=? and sRandPwd=?";
		 psDeletePwd=conn.prepareStatement(sqlDeleteForgetPassword);
		 psDeletePwd.setString(1,sEmail);
		 psDeletePwd.setString(2,sRandPwd);
		 psDeletePwd.executeUpdate();
		 
		 conn.commit();
		}
		else{
		 int c=1/0;
		}
	}
	catch(Exception e)
	{
	   e.printStackTrace();
	   response.sendRedirect("resetPassword.jsp?e="+sEmail+"&p="+sRandPwd);
	}
	finally
	{
	  conn.setAutoCommit(true);
	}


%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Change Password</title>
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
        <h2>Password has been Updated successfully!</h2>
    </div>
</body>
</html>
<%
   try{
		 if(psInsertPwd!=null){
			 psInsertPwd.close();
		 }
		 if(psProfile!=null){
			 psProfile.close();
		 }
		 if(psProfile!=null){
			 psProfile.close();
		 }
		 
		 if(psDeletePwd!=null){
			 psDeletePwd.close();
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