<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%
		Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");
		
		PreparedStatement psCountry=null;
		ResultSet rsCountry=null;
		
		PreparedStatement psCity=null;
		ResultSet rsCity=null;
		
		PreparedStatement psLocation=null;
		ResultSet rsLocation=null;
		
		try{
		    String sqlCountry="SELECT * FROM countrymaster c ";
			psCountry=conn.prepareStatement(sqlCountry);
			rsCountry=psCountry.executeQuery();
			
			String sqlCity="SELECT * FROM citymaster c";
			psCity=conn.prepareStatement(sqlCity);
			rsCity=psCity.executeQuery();
			
			String sqlLocation="SELECT * FROM locationmaster c";
			psLocation=conn.prepareStatement(sqlLocation);
			rsLocation=psLocation.executeQuery();
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
        <title>Briclyn Registration</title>
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

function validateEmail(emailValue) 
{
	var objRegExp  = /(^[a-z]([a-z_\.]*)@([a-z_\.]*)([.][a-z]{3})$)|(^[a-z]([a-z_\.]*)@([a-z_\.]*)(\.[a-z]{3})(\.[a-z]{2})*$)/i;

    return objRegExp.test(emailValue);
}

function validate()
{
		var str=/^[A-Za-z][.A-Za-z ]{0,100}$/;

		if((trim(document.frm.sFirstName.value)=="") || str.test(trim(document.frm.sFirstName.value))==false)
		{
			alert("Please fill your first name and should be characters only");
			document.frm.sFirstName.focus();
			return false;
		}
		else if(trim(document.frm.sLastName.value)=="" || str.test(trim(document.frm.sLastName.value))==false)
		{
			alert("Please fill last name value and should be characters only");
			document.frm.sLastName.focus();
			return false;
		}
		else if(trim(document.frm.iCountryID.value)=="")
		{
			alert("Select Country");
			document.frm.iCountryID.focus();
			return false;
		}
		else if(trim(document.frm.iCityID.value)=="")
		{
			alert("Please fill city value");
			document.frm.iCityID.focus();
			return false;
		}
		else if(trim(document.frm.iLocation.value)=="")
		{
			alert("Please fill location value");
			document.frm.iLocation.focus();
			return false;
		}
		else if((trim(document.frm.sRegEmail.value)=="") || validateEmail(document.frm.sRegEmail.value)==false)
		{
			alert("Please fill email value and should be email format");
			document.frm.sRegEmail.focus();
			return false;
		}
		else if(trim(document.frm.dd.value)=="DD" || (trim(document.frm.dd.value)<1) || (trim(document.frm.dd.value)>31))
		{
			alert("Please fill date of birth value");
			document.frm.dd.focus();
			return false;
		}
		else if(trim(document.frm.yyyy.value)=="YYYY" || trim(document.frm.yyyy.value).length<4)
		{
			alert("Please fill date of birth value");
			document.frm.yyyy.focus();
			return false;
		}
		else if(trim(document.frm.sRegGender.value)=="")
		{
			alert("Please fill gender value");
			document.frm.sRegGender.focus();
			return false;
		}
		else if(trim(document.frm.iUserContact.value)=="")
		{
			alert("Please fill contact value");
			document.frm.iUserContact.focus();
			return false;
		}
		else if(trim(document.frm.sUserID.value)=="")
		{
			alert("Please fill username value");
			document.frm.sUserID.focus();
			return false;
		}
		else if(trim(document.frm.sPassword.value)=="")
		{
			alert("Please fill password value");
			document.frm.sPassword.focus();
			return false;
		}
		else if(trim(document.frm.sCPassword.value)=="")
		{
			alert("Please fill your confirmation password");
			document.frm.sCPassword.focus();
			return false;
		}
		
		if(trim(document.frm.sPassword.value)!=trim(document.frm.sCPassword.value)!="")
		{
		    alert("Password and confirmation password is not matched");
			document.frm.sCPassword.focus();
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
	  document.frm.sFirstName.focus();
}
</script>
</head>
    <body onload="init()">
        <%@include file="/comman/menu.jsp"%>
        <div class="container large-6 large-centered columns">
            <%=nullconv((String)request.getAttribute("error"))%>
            <form name="frm" action="regBriclyn.jsp" method="post" autocomplete="off" onsubmit="return validate()" >
                <h4 class="labels">Business Information</h4>
                <fieldset>
                    <label class="labels"></label>
                    <select name="iUserLevel" class="smalldropdown" >
                        <option value="1">Individual User</option>
                        <option value="2">Agent/Brokers</option>
                        <option value="3">Builder</option>
                        <option value="4">Corporate</option>
                    </select>
                </fieldset>
                <hr>Personal Information</hr>
                <fieldset>
                    <label class="labels">First Name</label>
                    <input type="text" name="sFirstName" placeholder="First Name">
                </fieldset>
                <fieldset>
                    <label class="labels">Last Name</label>
                    <input type="text" name="sLastName" placeholder="Last Name">
                </fieldset>
                <fieldset>
                    <label class="labels">Country</label>
                    <select name="iCountryID">
                        <option value="" >-- Select Country --</option>
     <%
     while (rsCountry.next())
     {
      %>
      <option value="<%=rsCountry.getInt("iCountryID") %>"><%=rsCountry.getString("sCountryName")%></option>
      <%
      }
      %>
    </select>
                </fieldset>
    <fieldset>
        <label class="labels">City</label>
        <select name="iCityID">
            <option value="" >-- Select City --</option>
     <%
     while (rsCity.next())
     {
      %>
      <option value="<%=rsCity.getInt("iCityID") %>"><%=rsCity.getString("iCityName")%></option>
      <%
      }
      %>
    </select>
    </fieldset>
    <fieldset>
        <label class="labels">Location</label>
        <select name="iLocation" class="smalltextbox" id="iLocation">
            <option value="" >-- Select Location --</option>
      <%
       while (rsLocation.next())
     {
      %>
      <option value="<%=rsLocation.getInt("iLocationID") %>"><%=rsLocation.getString("iLocationName")%></option>
      <%
      }
      %>
        </select> 
    </fieldset>
        <fieldset>
            <label class="labels">Email</label>
            <input type="email" name="sRegEmail" placeholder="Email">
        </fieldset>
                                    <fieldset>
                                        <label class="labels">Date of Birth</label>
                                <div class="row large-12 large-centered columns">
                                    <div class="large-4 columns">
                                        <input  type="text"  name="dd" maxlength="2" placeholder="DD"  style='width:150px;' onKeyPress="return isNumberKey(event)">
                                    </div>
                                    <div class="large-4 columns">
                                        <select name="mm"  class="smalldropdown" >
                                            <option value = '01' >Jan </option>
                                            <option value = '02' >Feb </option>
                                            <option value = '03' >Mar </option>
                                            <option value = '04' >Apr </option>
                                            <option value = '05' >May </option>
                                            <option value = '06' >Jun </option>
                                            <option value = '07' >Jul </option>
                                            <option value = '08' >Aug </option>
                                            <option value = '09' >Sep </option>
                                            <option value = '10' >Oct </option>
                                            <option value = '11' >Nov </option>
                                            <option value = '12' >Dec </option>
                                        </select>
                                    </div>
                                    <div class="large-4 columns">
                                        <input type="text" name="yyyy" maxlength="4" placeholder="YYYY" style='width:200px;'  onKeyPress="return isNumberKey(event)">
                                    </div>
                                </div>
                            </fieldset>
        <fieldset>
            <label class="labels">Gender</label>
            <select name="sRegGender" class="smalldropdown" >
                <option value="Male">Male</option>
                <option value="Female" >Female</option>
            </select>
        </fieldset>
        <fieldset>
            <label class="labels">Phone Number</label>
            <input type="text" name="iUserContact" onKeyPress="return isNumberKey(event)" placeholder="Phone Number">
        </fieldset>
        <br>
        <h3>User Login Information</h3>
        <fieldset>
            <label class="labels">Create Username</label>
            <input type="text" name="sUserID" placeholder="Username">            
        </fieldset>
        <fieldset>
            <label class="labels">Password</label>
            <input type="password" name="sPassword" placeholder="Password">
        </fieldset>
        <fieldset>
            <label class="labels">Confirm Password</label>
            <input type="password" name="sCPassword" placeholder="Confirm Password">
        </fieldset>
        <button type="submit" name="Submit" class="button success" value="Register">Register</button>
            </form>
        </div>
        <script>callETabID('2')</script>
    </body>
</html>
<%
	try{
	     if(psCountry!=null){
			 psCountry.close();
		 }
		 if(psCity!=null){
			 psCity.close();
		 }
		 if(psLocation!=null){
			 psLocation.close();
		 }
		 
		 if(rsCity!=null){
			 rsCity.close();
		 }
		 if(rsLocation!=null){
			 rsLocation.close();
		 }
		 if(rsCountry!=null){
			 rsCountry.close();
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