<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
		Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");
		
		PreparedStatement psState=null;
		ResultSet rsState=null;
		
		String sqlState="SELECT * FROM countrymaster c ";
		psState=conn.prepareStatement(sqlState);
		rsState=psState.executeQuery();
%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Add State</title>
        <!--foundation zurb-->
        <link rel="stylesheet" href="css/foundation.css" />
        <link type="text/css" rel="StyleSheet" href="css/style.css"/>
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-1.2.6.js"></script>
        <script type="text/javascript" src="js/jquery.cycle.all.js"></script>
<script>
function validate()
{
		if(document.frm.sStateName.value=="")
		{
			alert("Please fill State name");
			document.frm.sStateName.focus();
			return false;
		}
		if(document.frm.iCountryID.value=="")
		{
			alert("Please fill Country name");
			document.frm.iCountryID.focus();
			return false;
		}
 } 
function init()
{
  document.frm.sStateName.focus();
} 
</script>
    </head>
    <body onLoad="init()">
        <%@include file="/comman/menu.jsp"%>
        <div class="row">
            <div class="medium-4 large-4 columns" id="sidemenu">
            <%@include file="menu.jsp" %>
            </div>
            <div class="medium-4 large-8 columns">
                <%=nullconv((String)request.getAttribute("error"))%>
                <h3>Add State</h3>
                <form name="frm" action="saveState.jsp" onSubmit="return validate()">
                    <fieldset>
                        <label class="labels">County Name</label>
                        <input type="text" name="sStateName" placeholder="County Name">
                    </fieldset>
                    <fieldset>
                        <label class="labels">Under</label>
                        <select name="iCountryID" class="smalltextbox">
                            <option value="" >-- Select Country --</option>
                            <%
                                while (rsState.next())
     {
      %>
      <option value="<%=rsState.getInt("iCountryID") %>"><%=rsState.getString("sCountryName")%></option>
        <%
      }
      %>
                        </select>
                    </fieldset>
                    <button type="submit" name="submit" value="Save" class="button success">Save</button>
                </form>
            </div>
        </div>
    </body>
</body>
</html>
<%
        try{
             if(psState!=null){
                 psState.close();
             }
             if(rsState!=null){
                 rsState.close();
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
