<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.text.*,java.util.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
	Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");

	ResultSet rsOptions=null;
	PreparedStatement psOptions=null;
	PreparedStatement psCurrency=null;
	ResultSet rsCurrency=null;

	String iListIDs=nullconv(request.getParameter("iListID"));           

	String sCurrency="";

	try{
		String sqlOption="SELECT l.iListID, l.sUserID, l.iTransactionType, l.iPropertyID,sPropertyName, l.sPropertyAddress, l.iCityID, l.iLocalityID, l.iArea, l.iTotalPrice, l.iBedRoom, l.iNFloor, l.cPriceNegotiable, l.dCreatedDate,c.iCityName,lc.iLocationName,r.sRegEmail,sFirstName, sLastName,iUserContact FROM listings l left join citymaster c on c.iCityID=l.iCityID left join locationmaster lc on lc.iLocationID=l.iLocalityID left join registration r on r.sUserID=l.sUserID left join propertymaster p on p.iPropertyID=l.iPropertyID where l.cStatus='A' and l.iListID="+nullIntconv(iListIDs)+"";
		psOptions=conn.prepareStatement(sqlOption);
		rsOptions=psOptions.executeQuery();
		
		String sqlCurrency="SELECT sCurrencyName, sSymbol FROM currency b where sStatus='A'";
		psCurrency=conn.prepareStatement(sqlCurrency);
		rsCurrency=psCurrency.executeQuery();
		if(rsCurrency.next())
		{
		 sCurrency=rsCurrency.getString("sSymbol");
		}
	}
	catch(Exception e)
	{
	    e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link type="text/css" rel="StyleSheet" href="css/style.css" />
<link type="text/css" rel="StyleSheet" href="css/menu.css" />
<title>Delete List</title>
<script>
 function validate()
 {
	var chge="Are you sure to Delete List!";
	if(confirm(chge)==false)
	{  
	   return false;
	}
 } 
 
 function cancalit()
 {
   history.back();
 }
 
 function onErrorLoad(im)
  {
    var id="im"+im;
	document.getElementById(id).src="proImage/blank.jpg";
	document.getElementById(id).style.width="1px";
	document.getElementById(id).style.height="1px";
  }
 </script>  
</head>

<body>
<form name="frm" action="saveDList.jsp" onSubmit="return validate()">
  <input type="hidden" name="iListID" value="<%=iListIDs%>">
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
    <td width="28%">&nbsp;</td>
    <td width="72%"><%=nullconv((String)request.getAttribute("error"))%></td>
  </tr>
  <tr>
    <td colspan="2"><h3>Delete List of Property </h3></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="br">
        <tr>
          <th width="16%" height="26" class="hspry">&nbsp;</th>
          <th width="20%" class="hspry">Location</th>
          <th width="25%" class="hspry">Specification</th>
          <th width="11%" class="hspry">Price</th>
          <th width="28%" class="hspry">Contact</th>
        </tr>
        <%
   if(rsOptions.next())
   {
   String neo=rsOptions.getString("cPriceNegotiable");
   String trans=rsOptions.getString("iTransactionType");
   if(neo.equalsIgnoreCase("Y"))
   {
     neo="Negotiable";
   }
   else
   {
     neo="Not Negotiable";
   }
   
   if(trans.equalsIgnoreCase("1"))
   {
     trans="for Sale";
   }
   else
   {
     trans="for Rent";
   }
   int iListID=rsOptions.getInt("iListID");
  %>
        <tr>
          <td class="pd"><img src="proImage/<%=iListID%>.jpg" id="im<%=iListID%>" onError="onErrorLoad('<%=iListID%>')" width="90" height="100">&nbsp;</td>
          <td class="pd"><%=rsOptions.getString("sPropertyName")%> <%=trans%><br>
            <%=rsOptions.getString("sPropertyAddress")%> <br>
            <%=rsOptions.getString("iCityName")%> <br>
            <%=rsOptions.getString("iLocationName")%></td>
          <td class="pd">Area <%=rsOptions.getString("iArea")%> sq. ft <br>
            <%=rsOptions.getString("iBedRoom")%> Bedrooms</td>
          <td class="pd"><%=sCurrency%> <%=rsOptions.getString("iTotalPrice")%> <br>
            <%=neo%></td>
          <td class="pd">Posted Date: <%=getDateFormat(rsOptions.getTimestamp("dCreatedDate"),"dd.MMM.yyyy hh:mm a")%> <br>
            <br>
            <span style="text-transform:capitalize"><%=rsOptions.getString("sFirstName")%> <%=rsOptions.getString("sLastName")%></span><br>
            Contact: <%=rsOptions.getString("iUserContact")%><br>
            Email: <%=rsOptions.getString("sRegEmail")%><br>
            &nbsp;</td>
        </tr>
        <%}%>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="submit" value="Delete" style="font-weight:bold"/>
      <input type="button" name="cancel" value="Cancel" onClick="cancalit()"/></td>
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
		 if(psOptions!=null){
			 psOptions.close();
		 }
		 if(rsOptions!=null){
			 rsOptions.close();
		 }
		 if(psCurrency!=null){
			 psCurrency.close();
		 }
		 if(rsCurrency!=null){
			 rsCurrency.close();
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