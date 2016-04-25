<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.text.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%
    Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");
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
    {
    }
%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Home page</title>
        <!--foundation zurb-->
        <link rel="stylesheet" href="css/foundation.css" />
        <link type="text/css" rel="StyleSheet" href="css/style.css"/>
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-1.2.6.js"></script>
        <script type="text/javascript" src="js/jquery.cycle.all.js"></script>
        <script>
            $.fn.cycle.defaults.timeout = 6000;
            $(function() {
//     run the code in the markup!
     $('#s3').cycle({ 
         fx:     'fade', 
         speed:   300, 
         timeout: 3000, 
         next:   '#s3', 
         pause:   1 
     });
 });
        </script>
    </head>
    <body>
        <!--dynamic navbar-->
        <%@include file="/comman/menu.jsp"%>
        <br>
        <div class="large-6 large-centered columns">
            <form name="fSearch" method="post" action="searchRes.jsp">
                <h5 class="hdng">Search your property</h5>
                <fieldset>
                    <label class="labels">Transaction Type</label>
                    <select  name="tranType">
                        <option value="1">Buy</option>
                        <option value="2">Rent/Lease</option>
                    </select>
                </fieldset>
                <fieldset>
                    <label class="labels">Property Type</label>
                    <select name="property_type" class="textbox" onChange="javascript:disable_combo(this.value,'frm_first');">
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
                        <label class="labels">City</label>
                        <select name="iCityID" class="smalltextbox">
                            <option value="" >-- Select City --</option>
                            <%
                                while (rsCity.next())
                                {
                            %>
                            <option value="<%=rsCity.getInt("iCityID") %>"><%=rsCity.getString("iCityName")%></option>
                            <%}
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
                                <%}
                                %>
                            </select>
                        </fieldset>
                            <fieldset>
                                <label class="labels">Budget</label>
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
                                <fieldset>
                                    <label class="labels">Minimum Bedroom</label>
                                    <select name='bedroom' class='textbox'>
                                        <option value="">Bed Room</option>
                                        <option value="1"  >1</option>
                                        <option value="2"  >2</option>
                                        <option value="3"  >3</option>
                                        <option value="4"  >4</option>
                                        <option value="5"  >5</option>
                                        <option value="6"  >6</option>
                                        <option value="7"  >7</option>
                                        <option value="8"  >8</option>
                                        <option value="9"  >9</option>
                                        <option value="10"  >10</option>
                                        <option value="11"  >10+</option>
                                    </select>
                                </fieldset>
                                <button type="submit" class="button secondary" name="Submit" value="Search">Search</button>
            </form>
        </div>
        <!--footer-->
<!--        <div class="footer">
            <div class="copy">
                <div class="container">
                    <p>All Rights Reserved |<a href="">Briclyn Kenya</a></p>
                </div>
                 curent date and year to appear on footer
                &copy; Briclyn Kenya.
                <script type="text/javascript">
                    document.write(new Date().getFullYear());
                </script>
            </div>
        </div>                        -->
                                <script type="text/javascript">
                                    callETabID('0')
                                                                    </script>
        <script src="js/vendor/jquery.min.js"></script>
        <script src="js/vendor/what-input.min.js"></script>
        <script src="js/foundation.min.js"></script>
        <script src="js/app.js"></script>
    </body>
</html>
