<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.text.*" errorPage="" %>
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

                <img src="images/logo.jpg" />
                <%@include file="/comman/menu.jsp"%>
                <
                        <form name="fSearch" method="post" action="searchRes.jsp">

                                           
                                                    <h5 class="hdng">Search your property</h5>
                                                Transaction Type:
                                                    <select  name="tranType">
                                                            <option value="1">Buy</option>
                                                            <option value="2">Rent/Lease</option>
                                                        </select>
                                   Property Type
                                   <select name="property_type" class="textbox" style="width:150px;" onChange="javascript:disable_combo(this.value,'frm_first');">
                                                            <%
                                                                while (rsProperty.next())
                                                                {
                                                            %>
                                                            <option value="<%=rsProperty.getInt("iPropertyID") %>"><%=rsProperty.getString("sPropertyName")%></option>
                                                            <%}
                                                            %>
                                                        </select>
                                                        City
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
                                                                Location:
                                                                <select name="iLocation" class="smalltextbox" id="iLocation" style="width:150px;">
                                                                            <option value="" >-- Select Location --</option>
                                                                            <%
                                                                                while (rsLocation.next())
                                                                                {
                                                                            %>
                                                                            <option value="<%=rsLocation.getInt("iLocationID") %>"><%=rsLocation.getString("iLocationName")%></option>
                                                                            <%}
                                                                            %>
                                                                        </select>
                                                                        Budget:
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
                                                                                
                                                                                Minimum Bedroom:</td>
                                                                                   <select name='bedroom' class='textbox' style="width:100px" >
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
                                                                                    <input type="submit" name="Submit" value="Search" />
                                    </form>
                                </td>
                                <td width="2%">&nbsp;</td>
                                <td width="46%" valign="top">
                                    <form name="lForm" method="post" action="doLogin.jsp">
                                        <div id="login" >
                                            <b class="rlogintop">
                                                <b class="rlogin1"></b>
                                                <b class="rlogin2"></b>
                                                <b class="rlogin3"></b>
                                                <b class="rlogin4"></b>                                                    
                                            </b>
                                            <div id="s3" class="pics" style="height:280px" align="center">
                                            </div>
                                            <b class="rloginbottom">
                                                <b class="rlogin4"></b>
                                                <b class="rlogin3"></b>
                                                <b class="rlogin2"></b>
                                                <b class="rlogin1"></b></b>
                                        </div>
                                    </form>
                                                    <script type="text/javascript">
                                                                                    callETabID('0')</script>
        <script src="js/vendor/jquery.min.js"></script>
        <script src="js/vendor/what-input.min.js"></script>
        <script src="js/foundation.min.js"></script>
        <script src="js/app.js"></script>
    </body>
</html>
