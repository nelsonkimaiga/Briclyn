<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ include file="sessionchk.jsp"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Add Country</title>
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
		if(document.frm.sCountryName.value=="")
		{
			alert("Please fill country name");
			document.frm.sCountryName.focus();
			return false;
		}
}
function init()
{
  document.frm.sCountryName.focus();
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
            <form name="frm" action="saveCountry.jsp" onSubmit="return validate()">
                <fieldset>
                    <label>Country Name</label>
                    <input type="text" name="sCountryName" placeholder="Country">
                </fieldset>
                <button type="submit" name="submit" value="Save" class="button success">Save</button>
            </form>
        </div>
    </div>
</body>
</html>
