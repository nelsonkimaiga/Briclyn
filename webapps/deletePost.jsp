<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.text.*,java.util.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
	Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");

	ResultSet rsOptions=null;
	PreparedStatement psOptions=null;
	
	PreparedStatement psCurrency=null;
	ResultSet rsCurrency=null;

	String sCurrency="";
	
	String iPostID=nullconv(request.getParameter("iPostID"));           
	
	try{
		String sqlOption="select l.iPostID, l.sUserID, l.iTransactionType, l.iPropertyID,sPropertyName, l.iCityID, l.iLocalityID,"
		                 +" l.iArea, l.iBudgetID, sBudgetName,l.iBedroom, l.cStatus, l.sCreatedBy, l.dCreatedDate, l.sModifiedBy," 
						 +" l.dModifiedDate,c.iCityName,lc.iLocationName,r.sRegEmail,sFirstName, sLastName,iUserContact"
						 +"  FROM post_requirement l "
						 +"   left join citymaster c on c.iCityID=l.iCityID "
						 +"	   left join locationmaster lc on lc.iLocationID=l.iLocalityID "
						 +"	   left join registration r on r.sUserID=l.sUserID "
						 +"	   left join propertymaster p on p.iPropertyID=l.iPropertyID "
						 +"	   left join budgetmaster b on b.iBudgetID=l.iBudgetID"
						 +"	       where l.cStatus='A' and l.iPostID="+nullIntconv(iPostID)+"";
		psOptions=conn.prepareStatement(sqlOption);
		rsOptions=psOptions.executeQuery();
		
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
        <title>Delete Post</title>
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
		var chge="Are you sure to Delete List!";
		if(confirm(chge)==false)
		{  
		   return false;
		}
	} 
	function cancalit()
	{
	  history.back();
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
                    <form name="frm" action="saveDPost.jsp" onSubmit="return validate()">
                        <input type="hidden" name="iPostID" value="<%=iPostID%>">
                        <h3>Delete Post Requirement</h3>
                        <table width="100%" border="0" cellspacing="=0" cellpadding="0">
                            <thead>
                                <tr>
                                    <th height="26" class="hspry">Location</th>
                                    <th class="hspry">Specification</th>
                                    <th class="hspry">Budget</th>
                                    <th class="hspry">Contact</th>
                                </tr>
                            </thead>
                            <tbody>
                                  <%
   if(rsOptions.next())
   {
   String trans=rsOptions.getString("iTransactionType");
   
   if(trans.equalsIgnoreCase("1"))
   {
     trans="for Buy";
   }
   else
   {
     trans="for Rent";
   }
   int iListID=rsOptions.getInt("iPostID");
  %>
                                <tr>                          
                                    <td class="pd"><%=rsOptions.getString("sPropertyName")%> <%=trans%><br> <%=rsOptions.getString("iCityName")%> <br><%=rsOptions.getString("iLocationName")%></td>
                                    <td class="pd">Area <%=rsOptions.getString("iArea")%> sq. ft <br><%=rsOptions.getString("iBedRoom")%> Bedrooms</td>
                                    <td class="pd"><%=sCurrency%> <%=rsOptions.getString("sBudgetName")%> <br></td>
                                    <td class="pd">Posted Date: <%=getDateFormat(rsOptions.getTimestamp("dCreatedDate"),"dd.MMM.yyyy hh:mm a")%> <br><br><span style="text-transform:capitalize"><%=rsOptions.getString("sFirstName")%> <%=rsOptions.getString("sLastName")%></span><br> Contact: <%=rsOptions.getString("iUserContact")%><br> Email: <%=rsOptions.getString("sRegEmail")%><br>&nbsp;</td>
                                </tr>
                                <%}%>
                            </tbody>
                    </table>
                            <button type="submit" class="button alert" name="submit" value="Delete">Delete</button>
                            &nbsp;
                            <button type="button" class="button success" name="cancel" value="Cancel" onClick="cancalit()">Cancel</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
<%
	try{
		 if(psOptions!=null){
			 psOptions.close();
		 }
		 if(rsOptions!=null){
			 rsOptions.close();
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