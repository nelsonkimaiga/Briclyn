<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
	Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");
	
	PreparedStatement psInsertBudget=null;
	String sBudgetName=request.getParameter("sBudgetName");
	String iMinBudget=request.getParameter("iMinBudget");
	String iMaxBudget=request.getParameter("iMaxBudget");
	
	String sSessionUserID=(String)session.getAttribute("sUserID");
	String sqlInsertBudget=null;
	try{
	
	sqlInsertBudget="insert into budgetmaster (sBudgetName, iMinBudget, iMaxBudget, sCreatedBy, dCreatedDate)"
										+"values(?,?,?,?,sysdate())";
	
	psInsertBudget=conn.prepareStatement(sqlInsertBudget);
	psInsertBudget.setString(1,sBudgetName);
	psInsertBudget.setString(2,iMinBudget);
	psInsertBudget.setString(3,iMaxBudget);
	psInsertBudget.setString(4,sSessionUserID);
	psInsertBudget.executeUpdate();
	}
	catch(Exception e)
	{
	   e.printStackTrace();
	   response.sendRedirect("addBudget.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link type="text/css" rel="StyleSheet" href="css/style.css" />
<link type="text/css" rel="StyleSheet" href="css/menu.css" />
<title>Save Budget</title>
</head>

<body>
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
        <td width="75%" valign="top"><h2>Budget is saved successfully!</h2></td>
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

</body>
</html>
<%
        try{
             if(psInsertBudget!=null){
                 psInsertBudget.close();
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