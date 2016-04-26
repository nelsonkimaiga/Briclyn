<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ include file="sessionchk.jsp"%>
<%
	String iListIDs=nullconv(request.getParameter("iListID"));    
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";     
%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Upload Property</title>
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
		var chge="Are you sure to Upload Image!";
		if(confirm(chge)==false)
		{  
		   return false;
		}
		
		document.frm.action="servlet/Upload";
		document.frm.method="post"
		document.frm.enctype="multipart/form-data"
	} 
	function goBack()
	{
//		document.frm.action="myList.jsp";
//		document.frm.method="post"
//		document.frm.submit(); 
                window.history.back();
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
                    <form name="frm" onSubmit="return validate()" >
                        <input type="hidden" name="iListID" value="<%=iListIDs%>">
                        <%=nullconv((String)request.getAttribute("error"))%>
                        <h3>Upload Property</h3>
                        <fieldset>
                            <input type="file" name="uProperty" />
                        </fieldset>
                        <button type="submit" class="button success" name="submit" value="Upload">Upload</button>  &nbsp;&nbsp;<button type="" class="button alert" name="cancel" value="Cancel" onClick="goBack()">Cancel</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
