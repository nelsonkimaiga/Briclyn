<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%--<%@ include file="sessionchk.jsp"%>--%>
<%
	Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");

	PreparedStatement psInsertPwd=null;
	
	String sPassword=request.getParameter("sPassword");
	String sOldPwd=request.getParameter("sOldPwd");
	String sModifiedBy=nullconv((String)session.getAttribute("sUserID"));
	
	String sqlUpdateRegistration=null;
	
	PreparedStatement psProfile=null;
	ResultSet rsProfile=null;
	
	try{
		String sqlProfile="SELECT sUserID FROM registration r where sUserID='"+sModifiedBy+"' and sPassword=password('"+sOldPwd+"')";
		psProfile=conn.prepareStatement(sqlProfile);
		rsProfile=psProfile.executeQuery();
		
		if(rsProfile.next())
		{
		 sqlUpdateRegistration="update registration set sPassword=password('"+sPassword+"'), sModifiedBy='"+sModifiedBy+"', sModifiedDate=sysdate() where sUserID='"+sModifiedBy+"'";
		 psInsertPwd=conn.prepareStatement(sqlUpdateRegistration);
		 psInsertPwd.executeUpdate();
		}
		else{
		 int c=1/0;
		}
	}
	catch(Exception e)
	{
	   e.printStackTrace();
	   response.sendRedirect("chgPwd.jsp");
	}


%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Save Password</title>
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
        <div class="container">
            <div class="row">
                <div class="medium-4 large-4 columns" id="sidemenu">
                    <%@include file="menu.jsp" %>
                </div>
                <div class="medium-8 large-8 columns">
                    <h2>Password has been changed successfully!</h2>
                </div>
            </div>
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