<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.text.*,java.util.*" errorPage="" %>
<%@ include file="sessionchk.jsp"%>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>

<%
		Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");

		PreparedStatement psCity=null;
		ResultSet rsCity=null;
		
		PreparedStatement psLocation=null;
		ResultSet rsLocation=null;
		
		PreparedStatement psProperty=null;
		ResultSet rsProperty=null;
		
		PreparedStatement psCurrency=null;
		ResultSet rsCurrency=null;

		String sCurrency="";

		try{
			String sqlCity="SELECT * FROM citymaster c";
			psCity=conn.prepareStatement(sqlCity);
			rsCity=psCity.executeQuery();
			
			String sqlLocation="SELECT * FROM locationmaster c";
			psLocation=conn.prepareStatement(sqlLocation);
			rsLocation=psLocation.executeQuery();
			
			String sqlProperty="SELECT * FROM propertymaster c";
			psProperty=conn.prepareStatement(sqlProperty);
			rsProperty=psProperty.executeQuery();
			
			String sqlCurrency="SELECT sCurrencyName, sSymbol FROM currency b where sStatus='A'";
			psCurrency=conn.prepareStatement(sqlCurrency);
			rsCurrency=psCurrency.executeQuery();
			if(rsCurrency.next())
			{
			 sCurrency=rsCurrency.getString("sSymbol");
			}
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
        <title>Create Listing</title>
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
function validate()
{
		if(document.frm.tranType.value=="")
		{
			alert("Please fill the transaction type");
			document.frm.tranType.focus();
			return false;
		}
		else if(document.frm.propertyType.value=="")
		{
			alert("Please fill type of property");
			document.frm.propertyType.focus();
			return false;
		}
		else if(trim(document.frm.sPropertyAddress.value)=="")
		{
			alert("Please fill address of property");
			document.frm.sPropertyAddress.focus();
			return false;
		}
		else if(document.frm.iCityID.value=="")
		{
			alert("Please fill city column");
			document.frm.iCityID.focus();
			return false;
		}
		else if(document.frm.iLocation.value=="")
		{
			alert("Please fill location value");
			document.frm.iLocation.focus();
			return false;
		}
		else if(document.frm.iArea.value=="")
		{
			alert("Please fill your area value");
			document.frm.iArea.focus();
			return false;
		}
		else if(document.frm.iTotalPrice.value=="")
		{
			alert("Please fill your total price");
			document.frm.iTotalPrice.focus();
			return false;
		}
		else if(document.frm.bedroom.value=="")
		{
			alert("Please fill bedroom value");
			document.frm.bedroom.focus();
			return false;
		}
		else if(document.frm.floornumber.value=="")
		{
			alert("Please fill number of floor value");
			document.frm.floornumber.focus();
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
</script>
    </head>
    <body>
        <%@include file="/comman/menu.jsp"%>
        <div class="container">
            <div class="row">
                <div class="large-4 columns medium-4 columns" id="sidemenu">
                    <%@include file="menu.jsp"%>
                </div>
                <div class="large-8 columns">
                        <h3 class="menu-headings">List Your Property</h3>
                        <form name="frm" action="doListing.jsp" method="post" onsubmit="return validate()">
                            <fieldset>
                                <label class="labels">Title</label>
                                <input type="text" name="title" placeholder="Property Title">
                            </fieldset>
                            <fieldset>
                                <label class="labels">Transaction type (E.g Sale or rent?</label>
                                <select name="tranType">
                                    <option value="default" selected disabled>Select a transaction type</option>
                                    <option value="1">Sell</option>
                                    <option value="2">Rent / Lease</option>
                                </select>
                            </fieldset>
                            <fieldset>
                                <label class="labels">Property Type</label>
                                <select name="propertyType">
                                    <option value="default" selected disabled>Select a property type</option>
                                <%
                                    while (rsProperty.next())
                                    {
                                %>
                                <option value="<%=rsProperty.getInt("iPropertyID") %>"><%=rsProperty.getString("sPropertyName")%></option>
                                <%}
		  %>
                                </select>
                            </fieldset>
                            <hr>
                            <p class="menu-headings">Pick Location</p>
                            <hr>
                            <fieldset>
                                <label class="labels">Property Address</label>
                                <input type="text" name="sPropertyAddress"/>
                            </fieldset>
                            <fieldset>
                                <label class="labels">Region</label>
                                <select name="iCityID">
                                    <option value="default" selected disabled>Select Region</option>
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
                                    <label class="labels">City</label>
                                    <select name="iLocation" class="smalltextbox" id="iLocation">
                                        <option value="default" selected disabled>Select City</option>
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
                                        <label class="labels">Area</label>
                                        <input type="text" name="iArea" placeholder="Area" onKeyPress="return isNumberKey(event)"/>
                                    </fieldset>
                                    <fieldset>
                                        <label class="labels">Price</label>
                                        <input type="text" name="iTotalPrice" onKeyPress="return isNumberKey(event)"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=sCurrency%>
                                    </fieldset>
                                    <fieldset>
                                        <label class="labels">Price Negotiable?</label>
                                        <input name="cPriceNegotiable" type="radio" value="Y" /><label>Yes</label>
                                        <input name="cPriceNegotiable" type="radio" value="N"  checked="checked"/><label>No</label>
                                    </fieldset>
                                    <fieldset>
                                        <label class="labels">Bedroom</label>
                                        <select name='bedroom'>
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
                                    <button type="submit" name="Submit" value="Save" class="button success">Create Listing</button>
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
		 
		 if(rsCity!=null){
			 rsCity.close();
		 }
		 if(rsLocation!=null){
			 rsLocation.close();
		 }
		 if(rsProperty!=null){
			 rsProperty.close();
		 }
		 if(psCurrency!=null){
			 psCurrency.close();
		 }
		 if(rsCurrency!=null){
			 rsCurrency.close();
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