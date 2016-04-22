<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
		Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");
		
		PreparedStatement psCountry=null;
		ResultSet rsCountry=null;
		
		try{
			String sqlCountry="SELECT * FROM countrymaster c ";
			psCountry=conn.prepareStatement(sqlCountry);
			rsCountry=psCountry.executeQuery();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>View Country</title>
        <!--foundation zurb-->
        <link rel="stylesheet" href="css/foundation.css" />
        <link type="text/css" rel="StyleSheet" href="css/style.css"/>
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-1.2.6.js"></script>
        <script type="text/javascript" src="js/jquery.cycle.all.js"></script>
<script>
	function goRecord(iCountryID)
	{
	  window.open("editCountry.jsp?iCountryID="+iCountryID,"_self")
	}
</script>
    </head>
    <body>
        <%@include file="/comman/menu.jsp"%>
        <div class="container">
            <div class="row">
                <div class="medium-4 large-4 columns" id="sidemenu">
                    <%@include file="menu.jsp" %>
                </div>
                <div class="medium-8 large-8 columns">
                    <%=nullconv((String)request.getAttribute("error"))%>
                    <h3>View Country</h3>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <thead>
                            <tr>
                                <th>Country Name</th>
                            </tr>
                        </thead>
                        <tbody>
                                    <%
     while (rsCountry.next())
     {
      %>
      <tr>
                        <td onclick="goRecord('<%=rsCountry.getInt("iCountryID") %>')" style="padding-left:5px; cursor:pointer"><%=rsCountry.getString("sCountryName")%></td>
      </tr>
              <%
	 }
	%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
<%
	try{
		 if(psCountry!=null){
			 psCountry.close();
		 }
		 if(rsCountry!=null){
			 rsCountry.close();
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