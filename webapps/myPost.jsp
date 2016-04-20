<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.text.*,java.util.*" errorPage="" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%@ include file="sessionchk.jsp"%>
<%
	Connection conn=null;
	conn=dbConn.getConnection();
	
	ResultSet rsMyPost=null;
	PreparedStatement psMyPost=null;
	
	PreparedStatement psCurrency=null;
	ResultSet rsCurrency=null;

	String sCurrency="";
	
	String iPageID=nullconv(request.getParameter("iPageID"));           
	String sSUserID=nullconv((String)session.getAttribute("sUserID"));
	try{
		String sqlMyPost="select l.iPostID, l.sUserID, l.iTransactionType, l.iPropertyID,sPropertyName, l.iCityID, l.iLocalityID,"
		                 +" l.iArea, l.iBudgetID, sBudgetName,l.iBedroom, l.cStatus, l.sCreatedBy, l.dCreatedDate, l.sModifiedBy,"
						 +" l.dModifiedDate,c.iCityName,lc.iLocationName,r.sRegEmail,sFirstName, sLastName,iUserContact" 
						 +"   FROM post_requirement l" 
						 +"	    left join citymaster c on c.iCityID=l.iCityID "
						 +"		left join locationmaster lc on lc.iLocationID=l.iLocalityID" 
						 +"		left join registration r on r.sUserID=l.sUserID" 
						 +"	    left join propertymaster p on p.iPropertyID=l.iPropertyID "
						 +"		left join budgetmaster b on b.iBudgetID=l.iBudgetID" 
						 +"		  where l.cStatus='A' and l.sUserID='"+nullconv(sSUserID)+"' order by l.dCreatedDate desc";
		psMyPost=conn.prepareStatement(sqlMyPost);
		rsMyPost=psMyPost.executeQuery();
		
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
        <title>My Post</title>
        <!--foundation zurb-->
        <link rel="stylesheet" href="css/foundation.css" />
        <link type="text/css" rel="StyleSheet" href="css/style.css"/>
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-1.2.6.js"></script>
        <script type="text/javascript" src="js/jquery.cycle.all.js"></script>
        <script src="js/checkbox.js" type="text/javascript"></script>
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
            function goRecord(iPostID)
            {
                var pathURL="deletePost.jsp";
                window.open(pathURL+"?iPostID="+iPostID,"_self");
            }
            function goSubmitForm()
            {
                var chge="Are you sure to Delete!";
                if(confirm(chge)==false)
                {  
		   return false;
		}
	}
            </script>
    </head>
    <body>
        <%@include file="/comman/menu.jsp"%>
        <script>
            fieldSName("iPostID","frm");
                </script>
                <div class="container">
                    <form name="frm" action="dPost.jsp" onSubmit="return goSubmitForm();">
                        <fieldset>
                            <input type="hidden" name="iPageID" value="My">
                        </fieldset>
                        <div class="row">
                            <div class="medium-4 large-4 columns" id="sidemenu">
                                <%@include file="menu.jsp" %>
                            </div>
                            <div class="medium-8 large-8 columns">
                                
                                <h3>My Post Requirement</h3>
                                <table width="100%" border="0" cellspacing="=0" cellpadding="0">
                                    <thead>
                                        <tr>
                                            <th class="hspry"><input type="checkbox" name="allCheck" onClick="selectallMe()" styleclass="ch" /></th>
                                            <th class="hspry">Location</th>
                                            <th class="hspry">Specification</th>
                                            <th class="hspry">Budget</th>
                                            <th class="hspry">Contact</th>
                                        </tr>
                                    </thead>
                                            <%
   boolean nextRow=false;
   while(rsMyPost.next())
   {
    nextRow=true;
   String trans=rsMyPost.getString("iTransactionType");
   
   if(trans.equalsIgnoreCase("1"))
   {
     trans="for Buy";
   }
   else
   {
     trans="for Rent";
   }
   int iListID=rsMyPost.getInt("iPostID");
  %>
                                    <tbody>
                                        <tr>
                                            <td class="pd"><input type="checkbox" name="iPostID" onClick="selectall()" styleClass="ch" value="<%=iListID%>"/></td>
                                            <td onClick="goRecord('<%=iListID%>')" class="pd"><%=rsMyPost.getString("sPropertyName")%> <%=trans%><br> <%=rsMyPost.getString("iCityName")%> <br><%=rsMyPost.getString("iLocationName")%></td>
                                            <td onClick="goRecord('<%=iListID%>')" class="pd">Area <%=rsMyPost.getString("iArea")%> sq. ft <br><%=rsMyPost.getString("iBedRoom")%> Bedrooms</td>
                                            <td onClick="goRecord('<%=iListID%>')" class="pd"><%=sCurrency%> <%=rsMyPost.getString("sBudgetName")%> <br></td>
                                            <td onClick="goRecord('<%=iListID%>')" class="pd">Posted Date: <%=getDateFormat(rsMyPost.getTimestamp("dCreatedDate"),"dd.MMM.yyyy hh:mm a")%> <br><br><span style="text-transform:capitalize"><%=rsMyPost.getString("sFirstName")%> <%=rsMyPost.getString("sLastName")%></span><br> Contact: <%=rsMyPost.getString("iUserContact")%><br> Email: <%=rsMyPost.getString("sRegEmail")%><br>&nbsp;</td>
                                        </tr>
                                         <%}
if(nextRow==false)
  {

%>
                                    <h3 align="center">No record is found</h3>
  <%
  }
  %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                                    <button type="submit" name="DeleteAll" class="button primary" styleClass="bD" value="Delete">Delete</button>
                    </form>
                </div>
    </body>
</html>
<%
	try{
		 if(psMyPost!=null){
			 psMyPost.close();
		 }
		 if(rsMyPost!=null){
			 rsMyPost.close();
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