<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.text.*" errorPage=""%>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%
Connection conn=null;
conn=dbConn.getConnection();
Statement st=null;
ResultSet rsOptions=null;

st = conn.createStatement();
PreparedStatement psOptions=null;

PreparedStatement psCity=null;
ResultSet rsCity=null;

PreparedStatement psLocation=null;
ResultSet rsLocation=null;

PreparedStatement psProperty=null;
ResultSet rsProperty=null;
try{
			
            String sqlOption="SELECT * FROM budgetmaster u ";
      	    psOptions=conn.prepareStatement(sqlOption);
			rsOptions=psOptions.executeQuery();
			
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
{}

 %>
<!DOCTYPE html>
<html>
    <head>
        <title>Briclyn</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
        <!--foundation-->
        <link rel="stylesheet" type="text/css" href="css/foundation.css">
        <link rel="stylesheet" type="text/css" href="css/app.css">
        <link rel="stylesheet" type="text/css" href="css/foundation-icons.css">      
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <!--foundation icons-->
        <link href='https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css' rel="stylesheet" type="text/css">
            <script type="text/javascript" src="js/jquery-1.2.6.js"></script>
            <script type="text/javascript" src="js/jquery.cycle.all.js"></script>
            <script>
                $.fn.cycle.defaults.timeout = 6000;
                $(function() {
                    // run the code in the markup!
                     $('#s3').cycle({ 
                         fx:     'fade',
                         speed:   300,
                         timeout: 3000,
                         next:   '#s3',
                         pause:   1
                     });
                 });
                              </script>
    <body>
        <div class="container">
            <div class="row">
                <div class="large-8 large-centered columns">
                    <h2>Search For Property Here</h2>
                    <form name="fSearch" method="post" action="searchRes.jsp">
                        <fieldset>
                            <label>Transaction Type</label>
                            <select name="tranType">
                                <option value="1">Buy</option>
                                <option value="2">Rent</option>
                            </select>
                        </fieldset>
                        <fieldset>
                            <label>Property Type</label>
                            <select name="property_type" onChange="javascript:disable_combo(this.value,'frm_first');">
                                           <%
                                               while (rsProperty.next())
                                               {
                                           %>
                                <option value="<%=rsProperty.getInt("iPropertyID") %>"><%=rsProperty.getString("sPropertyName")%></option>
      <%}
      %>
                            </select>
                        </fieldset>
                            <fieldset>
                                <label>City</label>
                                <select name="iCityID">
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
                                    <label>Location</label>
                                    <select name="iLocation">
                                        <option value="null" selected>Select Location</option>
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
                                        <label>Budget</label>
                                        <select name="budget">
                                            <option value="">-- Select Budget --</option>
                                            <%
                                                while(rsOptions.next())
                                                {
                                            %>
                                            <option value="<%=rsOptions.getInt("iBudgetID")%>"><%=rsOptions.getString("sBudgetName")%></option>
                                            <%}
                                            %>
                                        </select>
                                    </fieldset>
                                        <button type="submit" class="button success">Search</button>
                    </form>
                </div>
            </div>
        </div>
        
<script>callETabID('0')</script>
</body>
</html>
