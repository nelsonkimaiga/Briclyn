<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
	Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");

	PreparedStatement psCity=null;
	ResultSet rsCity=null;
	
	PreparedStatement psLocation=null;
	ResultSet rsLocation=null;
	
	PreparedStatement psProfile=null;
	ResultSet rsProfile=null;
	
	String sSUserID=nullconv((String)session.getAttribute("sUserID"));
	String sFirstName="";
	String sLastName="";
	String iCityID="";
	String iLocation="";
	String sRegEmail="";
	String dd="";
	String mm="";
	String yyyy="";
	String iDateBirth="";
	String sRegGender="";
	String iUserContact="";
	String sPassword="";
	String sCPassword="";
    
	try{
		String sqlCity="SELECT * FROM citymaster c ";
		psCity=conn.prepareStatement(sqlCity);
		rsCity=psCity.executeQuery();
		
		String sqlLocation="SELECT * FROM locationmaster c ";
		psLocation=conn.prepareStatement(sqlLocation);
		rsLocation=psLocation.executeQuery();
		
		String sqlProfile="SELECT * FROM registration r where sUserID='"+sSUserID+"'";
		psProfile=conn.prepareStatement(sqlProfile);
		rsProfile=psProfile.executeQuery();
		
		if(rsProfile.next())
		{
		   sFirstName=nullconv(rsProfile.getString("sFirstName"));
		   sLastName=nullconv(rsProfile.getString("sLastName"));
		   iCityID=nullconv(rsProfile.getString("iCityID"));
		   iLocation=nullconv(rsProfile.getString("iLocation"));
		   sRegEmail=nullconv(rsProfile.getString("sRegEmail"));
		   iDateBirth=nullconv(rsProfile.getString("iDateBirth"));
		   sRegGender=nullconv(rsProfile.getString("sRegGender"));
		   iUserContact=nullconv(rsProfile.getString("iUserContact"));
		}
		yyyy=iDateBirth.substring(0,4);
		mm=iDateBirth.substring(5,7);
		dd=iDateBirth.substring(8,10);
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
        <title>My Profile</title>
        <!--foundation zurb-->
        <link rel="stylesheet" href="css/foundation.css" />
        <link type="text/css" rel="StyleSheet" href="css/style.css"/>
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <script>
function validate()
{
		if(document.frm.sFirstName.value=="")
		{
			alert("Please fill your first name");
			document.frm.sFirstName.focus();
			return false;
		}
		else if(document.frm.sLastName.value=="")
		{
			alert("Please fill last name value");
			document.frm.sLastName.focus();
			return false;
		}
		else if(document.frm.sRegEmail.value=="")
		{
			alert("Please fill email value");
			document.frm.sRegEmail.focus();
			return false;
		}
		else if(document.frm.sRegGender.value=="")
		{
			alert("Please fill gender value");
			document.frm.sRegGender.focus();
			return false;
		}
		else if(document.frm.iCityID.value=="")
		{
			alert("Please fill city value");
			document.frm.iCityID.focus();
			return false;
		}
		else if(document.frm.iLocation.value=="")
		{
			alert("Please fill location value");
			document.frm.iLocation.focus();
			return false;
		}
		else if(document.frm.iUserContact.value=="")
		{
			alert("Please fill contact value");
			document.frm.iUserContact.focus();
			return false;
		}
		
	var chge="Are you sure to Modify!";
	if(confirm(chge)==false)
	{  
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
                <%@include file="menu.jsp"%>
            </div>
            <div class="medium-8 large-8 columns">
                <%=nullconv((String)request.getAttribute("error"))%>
                <h4>My Information</h4>
                <form name="frm" action="editProfile.jsp" method="post" onsubmit="return validate()">
                    <fieldset>
                        <label class="labels">First Name</label>
                        <input type="text" name="sFirstName" value="<%=sFirstName%>">
                    </fieldset>
                    <fieldset>
                        <label class="labels">Last Name</label>
                        <input type="text" name="sLastName" value="<%=sLastName%>">
                    </fieldset>
                    <fieldset>
                        <label class="labels">Region</label>
                        <select name="iCityID" class="smalltextbox">
                            <%
                                while (rsCity.next())
                                {
                                    if(rsCity.getString("iCityID").equalsIgnoreCase(iCityID))
                                    {
                            %>
                            <option value="<%=rsCity.getInt("iCityID") %>" selected="selected"><%=rsCity.getString("iCityName")%></option>
                            <%}
	 else
	 {
	  %>
          <option value="<%=rsCity.getInt("iCityID") %>"><%=rsCity.getString("iCityName")%></option>
	 <%
	 }
     }
      %>
                        </select>
                    </fieldset>
                        <fieldset>
                            <label class="labels">Location</label>
                            <select name="iLocation" class="smalltextbox" id="iLocation">
                                      <%
       while (rsLocation.next())
     {
	 if(rsLocation.getString("iLocationID").equalsIgnoreCase(iLocation))
	 {
	 %>
	  <option value="<%=rsLocation.getInt("iLocationID") %>" selected="selected"><%=rsLocation.getString("iLocationName")%></option>
	 <%
	 }
	 else
	 {
	  %>
	  <option value="<%=rsLocation.getInt("iLocationID") %>"><%=rsLocation.getString("iLocationName")%></option>
	 <%
	 }
    }
    %>
                            </select>
                        </fieldset>
                            <fieldset>
                                <label class="labels">Email</label>
                                <input type="text" name="sRegEmail" value="<%=sRegEmail%>" size="50">
                            </fieldset>
                            <fieldset>
                                <label class="labels">Date of Birth</label>
                                <div class="row large-12 large-centered columns">
                                    <div class="large-4 columns">
                                        <input  type="text"  name="dd" maxlength="2" value="<%=dd%>"  style='width:250px;' />
                                    </div>
                                    <div class="large-4 columns">
                                        <select name="mm"  class="smalldropdown" >
                                            <option value = '01' <%if(mm.equalsIgnoreCase("1")){out.println("selected='true'");}%>>Jan </option>
                                            <option value = '02' <%if(mm.equalsIgnoreCase("2")){out.println("selected='true'");}%>>Feb </option>
                                            <option value = '03' <%if(mm.equalsIgnoreCase("3")){out.println("selected='true'");}%>>Mar </option>
                                            <option value = '04' <%if(mm.equalsIgnoreCase("4")){out.println("selected='true'");}%>>Apr </option>
                                            <option value = '05' <%if(mm.equalsIgnoreCase("5")){out.println("selected='true'");}%>>May </option>
                                            <option value = '06' <%if(mm.equalsIgnoreCase("6")){out.println("selected='true'");}%>>Jun </option>
                                            <option value = '07' <%if(mm.equalsIgnoreCase("7")){out.println("selected='true'");}%>>Jul </option>
                                            <option value = '08' <%if(mm.equalsIgnoreCase("8")){out.println("selected='true'");}%>>Aug </option>
                                            <option value = '09' <%if(mm.equalsIgnoreCase("9")){out.println("selected='true'");}%>>Sep </option>
                                            <option value = '10' <%if(mm.equalsIgnoreCase("10")){out.println("selected='true'");}%> >Oct </option>
                                            <option value = '11' <%if(mm.equalsIgnoreCase("11")){out.println("selected='true'");}%> >Nov </option>
                                            <option value = '12' <%if(mm.equalsIgnoreCase("12")){out.println("selected='true'");}%>>Dec </option>
                                        </select>
                                    </div>
                                    <div class="large-4 columns">
                                        <input type="text" name="yyyy" maxlength="4" value="<%=yyyy%>" style='width:250px;'  />
                                    </div>
                                </div>
                            </fieldset>
                                    <fieldset>
                                        <label class="labels">Gender</label>
                                        <select name="sRegGender">
                                            <option value="Male" <%if(sRegGender.equalsIgnoreCase("Male")){out.println("selected='true'");}%>>Male</option>
                                            <option value="Female" <%if(sRegGender.equalsIgnoreCase("Female")){out.println("selected='true'");}%> >Female</option>
                                        </select>
                                    </fieldset>
                                        <fieldset>
                                            <label class="labels">Phone Number</label>
                                            <input type="text" name="iUserContact" value="<%=iUserContact%>"/>
                                        </fieldset>
                                        <button class="button secondary" type="submit" name="Submit" value="Submit">Edit Profile</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
<%
	try{
		 if(psCity!=null){
			 psCity.close();
		 }
		 if(psLocation!=null){
			 psLocation.close();
		 }
		 if(psProfile!=null){
			 psProfile.close();
		 }
		 
		 if(rsCity!=null){
			 rsCity.close();
		 }
		 if(rsLocation!=null){
			 rsLocation.close();
		 }
		 if(rsProfile!=null){
			 rsProfile.close();
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