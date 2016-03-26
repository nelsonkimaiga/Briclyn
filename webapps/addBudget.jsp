<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ include file="sessionchk.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link type="text/css" rel="StyleSheet" href="css/style.css" />
<link type="text/css" rel="StyleSheet" href="css/menu.css" />
<title>Add Budget</title>
<script>
function trim(s) 
{
    return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
}
function validate()
{
		if(trim(document.frm.sBudgetName.value)=="")
		{
			alert("Please fill Budget name");
			document.frm.sBudgetName.focus();
			return false;
		}
		else if(trim(document.frm.iMinBudget.value)=="")
		{
			alert("Please fill minimum budget");
			document.frm.iMinBudget.focus();
			return false;
		}
		else if(trim(document.frm.iMaxBudget.value)=="")
		{
			alert("Please fill maximum Budget");
			document.frm.iMaxBudget.focus();
			return false;
		}
}

function isNumberKey(evt)
{
 var charCode = (evt.which) ? evt.which : event.keyCode

  if (charCode > 31 && (charCode < 48 || charCode > 57))
  {	
	return false;
  }
 return true;
}

function init()
{
  document.frm.sBudgetName.focus();
} 
</script> 
</head>

<body onLoad="init()">
<form name="frm" action="saveBudget.jsp" onSubmit="return validate()">
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
   <td width="23%">&nbsp;</td>
    <td colspan="2"><%=nullconv((String)request.getAttribute("error"))%></td>
  </tr>
 
  <tr>
    <td>&nbsp;</td>
    <td width="72%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><h3>Add Budget</h3></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Budget  Name</td>
    <td><input type="text" name="sBudgetName" size="60"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   <tr>
    <td>Budget Minimum  </td>
    <td><input type="text" name="iMinBudget" size="15" onKeyPress="return isNumberKey(event)"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Budget Maximum  </td>
    <td><input type="text" name="iMaxBudget" size="15" onKeyPress="return isNumberKey(event)"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="goSubmit" value="Save" /></td>
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
