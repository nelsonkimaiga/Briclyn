<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ include file="sessionchk.jsp"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Change Password</title>
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
		if(document.frm.sOldPwd.value=="")
		{
			alert("Please fill your old password");
			document.frm.sOldPwd.focus();
			return false;
		}
		else if(document.frm.sPassword.value=="")
		{
			alert("Please fill password");
			document.frm.sPassword.focus();
			return false;
		}
		else if(document.frm.sCPassword.value=="")
		{
			alert("Please fill confirm password");
			document.frm.sCPassword.focus();
			return false;
		}
		if(document.frm.sCPassword.value!=document.frm.sPassword.value)
		{
		    alert("Password and  confirm password is not matched");
			document.frm.sPassword.focus();
			document.frm.sCPassword.value="";
			document.frm.sPassword.value="";
			return false;
		} 
		
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
                    <form name="frm" action="savePwd.jsp" method="post" onsubmit="return validate()">
                        <fieldset>
                            <label class="labels">Old Password</label>
                            <input type="password" name="sOldPwd" placeholder="Old Password"/>
                        </fieldset>
                        <fieldset>
                            <label class="labels">New Password</label>
                            <input type="password" name="sPassword" placeholder="New Password"/>
                        </fieldset>
                        <fieldset>
                            <label class="labels">Confirm Password</label>
                            <input type="password" name="sCPassword" placeholder="Confirm Password"/>
                        </fieldset>
                        <button type="submit" class="button secondary" name="Submit" value="Change">Change Password</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
