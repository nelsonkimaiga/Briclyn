<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.text.*,java.util.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
    Connection conn=null;
	conn=dbConn.getConnection();
	
	PreparedStatement psdetailResponses=null;
	ResultSet rsdetailResponses=null;
	
	String iMessageID=nullconv(request.getParameter("iMessageID")); 
	
	String sTitle="";
	String sMessage="";
	
	String sqldetailResponse="SELECT iMessageID, sUserID, iPostID, iListID, sSubject, tMessage FROM response r where iMessageID=?";
	psdetailResponses=conn.prepareStatement(sqldetailResponse);
	psdetailResponses.setString(1,iMessageID);
	rsdetailResponses=psdetailResponses.executeQuery();
	
	if(rsdetailResponses.next())
	{
	  sTitle=rsdetailResponses.getString("sSubject");
	  sMessage=rsdetailResponses.getString("tMessage");
	}
	    
%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>List Details Response</title>
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
        <br>
        <div class="container">
            <div class="row">
                <div class="medium-4 large-4 columns" id="sidemenu">
                    <%@include file="menu.jsp" %>
                </div>
                <div class="medium-8 large-8 columns">
                    <h3>Response Details </h3>
                    <form name="responsesForm">
                        <fieldset>
                            <label>Subject</label>
                            <input type="text" value="<%=sTitle%>" readonly>
                        </fieldset>
                        <fieldset>
                            <label>Message</label>
                            <input type="text" value="<%=sMessage%>" readonly>
                        </fieldset>
                        <a href="javascript:history.back()"> go to Previous  &lt;&lt;</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
<%
	try{
		 if(psdetailResponses!=null){
			 psdetailResponses.close();
		 }
		 if(rsdetailResponses!=null){
			 rsdetailResponses.close();
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
