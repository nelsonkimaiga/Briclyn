<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>login</title>
        <!--foundation zurb-->
        <link rel="stylesheet" href="css/foundation.css" />
        <link type="text/css" rel="StyleSheet" href="css/style.css"/>
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-1.2.6.js"></script>
        <script type="text/javascript" src="js/jquery.cycle.all.js"></script>
<script>
    function trim(s) 
	{
		return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
	}

	function validateForm()
	{
		if(trim(document.frmLogin.login.value)=="")
		{
		  alert("Login empty");
		  document.frmLogin.login.focus();
		  return false;
		}
		else if(trim(document.frmLogin.pwd.value)=="")
		{
		  alert("password empty");
		  document.frmLogin.pwd.focus();
		  return false;
		}
	}
	
	function init()
	{
	  document.frmLogin.login.focus();
	}
</script>
    </head>
    <body onload="init()">
        <!--dynamic navbar-->
        <%@include file="/comman/menu.jsp"%>
        <div class="container">
            <div class="row">
                <div class="medium-4 large-4 columns">
                    <%@include file="menu.jsp" %>
                </div>        
                <%=nullconv(request.getParameter("error"))%>
                <div class="medium-8 large-8 columns">
                    <h3>Login</h3>
                <form name="frmLogin" action="doLogin.jsp" onsubmit="return validateForm()" method="post">
                    <fieldset>
                        <label class="labels">Username</label>
                        <input type="text" name="login" placeholder="Username"/>
                    </fieldset>
                    <fieldset>
                        <label class="labels">Password</label>
                        <input type="password" name="pwd" placeholder="Password"/>
                    </fieldset>
                    <button type="submit" name="submit" class="button secondary">Login</button>
                    <br>
                    <a href="forget.jsp"><span>Forget password</span></a> &nbsp;&nbsp;<a href="register.jsp">New User</a>
                </form>
                </div>
            </div>
        </div>
                <script>callETabID('5')</script>
    </body>
</html>
