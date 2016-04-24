<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.Random" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%
	Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");
	
	PreparedStatement psProfile=null;
	ResultSet rsProfile=null;
	
	Random rNumber = new Random();
	
	long getRdm = 	Math.abs(rNumber.nextLong());
	
	String sEmailID=nullconv(request.getParameter("emailID"));  
	PreparedStatement psForgetPassword=null;
	PreparedStatement psGenerateForgetPassword=null;
	
	try{
	    String sqlProfile="SELECT sUserID FROM registration r where sRegEmail=? and sStatus='A'";
		psProfile=conn.prepareStatement(sqlProfile);
		psProfile.setString(1,sEmailID);
		rsProfile=psProfile.executeQuery();
		
		if((rsProfile.next()))
		{
			String sqlForgetPassword="insert into forget_password (sEmailID,sRandPwd, sStatus) values('"+sEmailID+"','"+getRdm+"','P')";
			psForgetPassword=conn.prepareStatement(sqlForgetPassword);
			psForgetPassword.executeUpdate();
			
			String sqlGenerateForgetPassword="update registration set sForgetPassword=password(?) where sRegEmail='"+sEmailID+"'";
			psGenerateForgetPassword=conn.prepareStatement(sqlGenerateForgetPassword);
			psGenerateForgetPassword.setLong(1,getRdm);
			psGenerateForgetPassword.executeUpdate();
		}
		else
		{
		  response.sendRedirect("forget.jsp?error=No Email Found");
		  return;
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
		response.sendRedirect("forget.jsp");
	}
	
%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Forget Password</title>
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
        <h2>A new password has been sent to you on email!</h2>
    </div>
</body>
</html>
<%
	try{
		 if(psForgetPassword!=null){
			 psForgetPassword.close();
		 }
		 if(psGenerateForgetPassword!=null){
			 psGenerateForgetPassword.close();
		 }
		 if(psProfile!=null){
			 psProfile.close();
		 }
		 
		 if(rsProfile!=null){
			 rsProfile.close();
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