<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
		Connection conn=null;
		conn=dbConn.getConnection();
		
		PreparedStatement psState=null;
		ResultSet rsState=null;
		
		String sqlState="SELECT * FROM countrymaster c ";
		psState=conn.prepareStatement(sqlState);
		rsState=psState.executeQuery();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link type="text/css" rel="StyleSheet" href="css/style.css" />
<link type="text/css" rel="StyleSheet" href="css/menu.css" />
<title>Add State</title>
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
<form name="frm" action="saveState.jsp" onSubmit="return validate()">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5%">&nbsp;</td>
    <td width="90%"><div class="header"><%@ include file="comman/header.jsp"%></div></td>
    <td width="5%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><%@ include file="comman/logo.jsp"%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><%@include file="/comman/menu.jsp"%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20%" valign="top"><div id="leftbar"><%@include file="menu.jsp" %></div></td>
        <td width="5%" valign="top">&nbsp;</td>
        <td width="75%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="21%">&nbsp;</td>
    <td colspan="2"><%=nullconv((String)request.getAttribute("error"))%></td>
  </tr>
  <tr>
    <td colspan="3"><h3>Add State</h3></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="75%">&nbsp;</td>
    <td width="4%">&nbsp;</td>
  </tr>
  <tr>
    <td>State Name</td>
    <td><input type="text" name="sStateName" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Country Under</td>
    <td><select name="iCountryID" class="smalltextbox">
        <option value="" >-- Select Country --</option>
        <%
     while (rsState.next())
     {
      %>
        <option value="<%=rsState.getInt("iCountryID") %>"><%=rsState.getString("sCountryName")%></option>
        <%
      }
      %>
      </select></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="submit" value="Save" /></td>
    <td>&nbsp;</td>
  </tr>
</table></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div class="footer"><%@ include file="comman/footer.jsp"%></div></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
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
