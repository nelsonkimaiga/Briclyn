<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.text.*,java.util.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
		Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");
		
		PreparedStatement psResponse=null;
		ResultSet rsResponse=null;
		
		String sSUserID=nullconv((String)session.getAttribute("sUserID"));
		
		try{
			String sqlResponse="SELECT r.iMessageID, r.sUserID, r.iPostID, r.iListID, r.sSubject, r.tMessage, r.sStatus,"
			                    +" r.sRead, r.sCreatedBy, r.sCreatedDate,l.sUserID,sRegEmail,sFirstName, sLastName,iUserContact"
								+"    FROM response r "
								+"	  left join list_requirement l on l.iListID=r.iListID "
								+"	  left join registration g on g.sUserID=r.sUserID "
								+"	        where l.sUserID=? order by r.sCreatedDate desc";
			psResponse=conn.prepareStatement(sqlResponse);
			psResponse.setString(1,sSUserID);
			rsResponse=psResponse.executeQuery();
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
        <title>My Response</title>
        <!--foundation zurb-->
        <link rel="stylesheet" href="css/foundation.css" />
        <link type="text/css" rel="StyleSheet" href="css/style.css"/>
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-1.2.6.js"></script>
        <script type="text/javascript" src="js/jquery.cycle.all.js"></script>
        <script>
            function goRecord(iMessageID)
            {
                window.open("viewResponse.jsp?iMessageID="+iMessageID,"_self")
            }
                </script>
    </head>
    <body>
        <%@include file="/comman/menu.jsp"%>
        <div class="container">
            <div class="row">
                <div class="medium-4 large-4 columns" id="sidemenu">
                    <%@include file="menu.jsp"%>
                </div>
                <div class="medium-8 large-8 columns">
                    <h3> Response I Got </h3>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <thead>
                            <tr>
                                <th class="hspry">List ID</th>
                                <th class="hspry">Subject</th>
                                <th class="hspry">Message</th>
                                <th class="hspry">Sent By</th>
                            </tr>                            
                        </thead>
                        <tbody>
     <%
	 boolean nextRow=false;
     while (rsResponse.next())
     {
	   nextRow=true;
      %>
                        </tbody>
                        <tr>
                            <td style="padding-left:5px; cursor:pointer">List ID: <a href="myMList.jsp?iListID=<%=rsResponse.getString("iListID")%>" class="lnk"><%=rsResponse.getString("iListID")%></a> <br>Posted: <%=getDateFormat(rsResponse.getTimestamp("sCreatedDate"),"dd.MMM.yyyy hh:mm a")%></td>
                            <td onclick="goRecord('<%=rsResponse.getInt("iMessageID") %>')"><%=rsResponse.getString("sSubject")%></td>
                            <td onclick="goRecord('<%=rsResponse.getInt("iMessageID") %>')"><%=nullconv(rsResponse.getString("tMessage"))%></td>
                            <td onclick="goRecord('<%=rsResponse.getInt("iMessageID") %>')"><span style="text-transform:capitalize"><%=rsResponse.getString("sFirstName")%> <%=rsResponse.getString("sLastName")%></span><br> Contact: <%=rsResponse.getString("iUserContact")%><br> Email: <%=rsResponse.getString("sRegEmail")%></td>
                        </tr>
                        <%}
if(nextRow==false)
{
                        %>
                        <h3 align="center">No messages found</h3>
  <%}
  %>
                    </table>
                </body>
                </html>
<%
	try{
		 if(psResponse!=null){
			 psResponse.close();
		 }
		 if(rsResponse!=null){
			 rsResponse.close();
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