<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%
	Connection conn=null;
	conn=dbConn.getConnection();
	
	ResultSet rsBudget=null;
	PreparedStatement psBudget=null;
	
	PreparedStatement psCity=null;
	ResultSet rsCity=null;
	
	PreparedStatement psLocation=null;
	ResultSet rsLocation=null;
	
	PreparedStatement psProperty=null;
	ResultSet rsProperty=null;

	try{
		String sqlBudget="SELECT * FROM budgetmaster u ";
		psBudget=conn.prepareStatement(sqlBudget);
		rsBudget=psBudget.executeQuery();
		
		String sqlCity="SELECT * FROM citymaster c ";
		psCity=conn.prepareStatement(sqlCity);
		rsCity=psCity.executeQuery();
		
		String sqlLocation="SELECT * FROM locationmaster c ";
		psLocation=conn.prepareStatement(sqlLocation);
		rsLocation=psLocation.executeQuery();
		
		String sqlProperty="SELECT * FROM propertymaster c ";
		psProperty=conn.prepareStatement(sqlProperty);
		rsProperty=psProperty.executeQuery();
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
        <title>Search List</title>
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
			if(document.frm.tranType.value=="")
			{
				alert("Please fill your transaction type");
				document.frm.tranType.focus();
				return false;
			}
			else if(document.frm.property_type.value=="")
			{
				alert("Please fill your property type");
				document.frm.property_type.focus();
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
                    <br>
                    <form name="frm" action="searchPost.jsp" method="post" onsubmit="return validate()">
                        <fieldset>
                            <label class="labels">Transaction Type</label>
                            <select name="tranType">
                                <option value="1">Buy</option>
                                <option value="2">Rent / Lease</option>
                            </select>
                        </fieldset>
                        <fieldset>
                            <label class="labels">Property Type</label>
                            <select name="propertyType">
                                <option value="" >-- Select Property --</option>
        <%
		 while (rsProperty.next())
		 {
		%>
                <option value="<%=rsProperty.getInt("iPropertyID") %>"><%=rsProperty.getString("sPropertyName")%></option>
        <%
		 }
		%>
                            </select>
                        </fieldset>
                            <fieldset>
                                <label class="labels">City</label>
                                <select name="iCityID" class="smalltextbox">
                                    <option value="default" disabled>Select City</option>
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
                                        <option value="default" disabled>Select Location</option>
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
                                        <label class="labels">Area</label>
                                        <input type="text" name="iArea" onKeyPress="return isNumberKey(event)" placeholder="Area">
                                    </fieldset>
                                    <fieldset>
                                        <label class="labels">Budget</label>
                                        <select name="iBudgetID">
                                            <option value="">-- Select Budget --</option>
        <%
	   while(rsBudget.next())
	   {
	   %>
           <option value="<%=rsBudget.getInt("iBudgetID")%>"><%=rsBudget.getString("sBudgetName")%></option>
       <%
	   }
       %>
      </select>
                                    </fieldset>
      <fieldset>
          <label class="labels">Bedroom</label>
          <select name='bedroom'>
              <option value="">Select Room</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
              <option value="11">11+</option>
          </select>
      </fieldset>
      <fieldset>
          <label class="labels">Floor Number</label>
          <select name='floornumber'>
                <option value="1">Basement</option>
                <option value="2">Ground Floor</option>
                <option value="3">1</option>
                <option value="4">2</option>
                <option value="5">3</option>
                <option value="6">4</option>
                <option value="7">5</option>
                <option value="8">6</option>
                <option value="9">7</option>
                <option value="10">8</option>
                <option value="11">9</option>
                <option value="12">10</option>
                <option value="13">10+</option>
          </select>
      </fieldset>
      <button type="submit" name="Submit" value="Search" class="button success">Search</button>
      <button type="reset" name="Reset" value="Reset" class="button alert">Reset</button>
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
		 if(psProperty!=null){
			 psProperty.close();
		 }
		 if(psBudget!=null){
			 psBudget.close();
		 }
		 
		 if(rsCity!=null){
			 rsCity.close();
		 }
		 if(rsLocation!=null){
			 rsLocation.close();
		 }
		 if(rsProperty!=null){
			 rsProperty.close();
		 }
		 if(rsBudget!=null){
			 rsBudget.close();
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