<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.text.*,java.util.*" %>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<%
		Connection conn = null;
		conn=dbConn.getConnection();
		
		ResultSet rsOptions = null;
		
		PreparedStatement psOptions=null;
		PreparedStatement psCurrency=null;
		ResultSet rsCurrency=null;
		
		String iTransactionType=nullconv(request.getParameter("tranType"));
		String iPropertyID=nullconv(request.getParameter("property_type"));
		String iCityID=nullconv(request.getParameter("iCityID"));
		String iLocalityID=nullconv(request.getParameter("iLocalityID"));
		String iArea=nullconv(request.getParameter("iArea"));
		String iTotalPrice=nullconv(request.getParameter("budget"));
		String iBedRoom=nullconv(request.getParameter("bedroom"));
		String cStatus=nullconv(request.getParameter("cStatus"));
		String pageNo=nullconv(request.getParameter("sPage"));
		
		String sCurrency="";
		
		int iShowRows=10;
		int iTotalRows=nullIntconv(request.getParameter("iTotalRows"));
		int iTotalPages=nullIntconv(request.getParameter("iTotalPages"));
		int iPageNo=nullIntconv(request.getParameter("iPageNo"));
		int cPageNo=nullIntconv(request.getParameter("cPageNo"));
		int iStartResultNo=0;
		int iEndResultNo=0;
		
		String addMysql="";
		if(iPageNo==0)
		{
			iPageNo=0;
		}
		else{
			iPageNo=Math.abs((iPageNo-1)*iShowRows);
		}
		if(iShowRows==0)
		{
			iShowRows=10;
		}
		
		if(!(iTransactionType).equals(""))
		{
		  addMysql=" and l.iTransactionType='"+iTransactionType+"'";
		}
		if(!(iPropertyID).equals(""))
		{
		  addMysql=addMysql+" and l.iPropertyID='"+iPropertyID+"'";
		}
		if(!(iCityID).equals(""))
		{
		   addMysql=addMysql+" and l.iCityID='"+iCityID+"'";
		}
		if(!(iLocalityID).equals(""))
		{
		   addMysql=addMysql+" and l.iLocalityID='"+iLocalityID+"'";
		}
		if(!(iArea).equals(""))
		{
		   addMysql=addMysql+" and l.iArea='"+iArea+"'";
		}
		if(!(iTotalPrice).equals(""))
		{
		   addMysql=addMysql+" and l.iTotalPrice='"+iTotalPrice+"'";
		}
		if(!(iBedRoom).equals(""))
		{
		   addMysql=addMysql+" and l.iBedRoom='"+iBedRoom+"'";
		}
		
	   try{
            String sqlOption="SELECT l.iListID, l.sUserID, l.iTransactionType, l.iPropertyID,sPropertyName," 
                             +"l.sPropertyAddress, l.iCityID, l.iLocalityID, l.iArea, l.iTotalPrice, l.iBedRoom,"
                             +" l.iNFloor, l.cPriceNegotiable, l.dCreatedDate,c.iCityName,lc.iLocationName,r.sRegEmail,sFirstName," 
                             +"sLastName,iUserContact,(select count(*) from list_requirement l where l.cStatus='A' "+addMysql+") as cnt "
                             +"FROM list_requirement l left join citymaster c on c.iCityID=l.iCityID"
                             +" left join locationmaster lc on lc.iLocationID=l.iLocalityID "
                             +"left join registration r on r.sUserID=l.sUserID "
                             +"left join propertymaster p on p.iPropertyID=l.iPropertyID "
                             +"where l.cStatus='A' "+addMysql+" order by l.dCreatedDate desc limit "+iPageNo+","+iShowRows+"";
		    
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
		
		String sUserTypeSession=nullconv((String)session.getAttribute("iUserType"));
		boolean sPendingID=false;
		if(!(sUserTypeSession).equals(""))
		{
		  if(sUserTypeSession.equalsIgnoreCase("1"))
		  {
			 sPendingID=true;
		  }
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
            function goRecord(iListID)
            {
                var pathURL="deleteList.jsp";
                window.open(pathURL+"?iListID="+iListID,"_self");
            }
            function goSubmitForm(ob,pageNo)
            {
                var chge="Are you sure to Delete!";
                if(ob=="S")
                {
	  document.frm.iPageNo.value=pageNo
	  document.frm.submit(); 
	}
        else
	{
            document.frm.action="dList.jsp"
            if(confirm(chge)==false)
            {
                return false;
            }
        }
    }
    function goSubmitPageForm(sPageNo)
    {
        document.frm.cPageNo.value=sPageNo
        document.frm.iPageNo.value=sPageNo;
        document.frm.submit(); 
    }
    function onErrorLoad(im)
    {
        var id="im"+im;
	document.getElementById(id).src="proImage/blank.jpg";
	document.getElementById(id).style.width="1px";
	document.getElementById(id).style.height="1px";
    }
    function openWindow(iListID)
    {
        window.open("display.jsp?iListID="+iListID,'my','width=600,height=661,status=no,menubar=no,scrollbars=yes,toolbar=no,resize=yes');
    }
</script>
</head>
<body>
    <script>
        fieldSName("iListID","frm");
        </script>
        <form name="frm"  onSubmit="return goSubmitForm();" method="post">
            <input type="hidden" name="iPageNo" value="<%=iPageNo%>">
            <input type="hidden" name="cPageNo" value="<%=cPageNo%>">
            <input type="hidden" name="iShowRows" value="<%=iShowRows%>">
            <input type="hidden" name="tranType" value="<%=iTransactionType%>">
            <input type="hidden" name="property_type" value="<%=iPropertyID%>">
            <input type="hidden" name="iCityID" value="<%=iCityID%>">
            <input type="hidden" name="iLocation" value="<%=iLocalityID%>">
            <input type="hidden" name="budget" value="<%=iTotalPrice%>">
            <input type="hidden" name="bedroom" value="<%=iBedRoom%>">
            <%@include file="/comman/menu.jsp"%>
            <%=nullconv((String)request.getAttribute("error"))%>
            <h3> List of Property </h3>
            <div class="container">
                <div class="large-9 large-centered columns">
                    <table width="100%" border="0" cellspacing="=0" cellpadding="0">
                        <thead>
                            <tr>
                                <th height="26" class="hspry brl brt"><input type="checkbox" name="allCheck" onClick="selectallMe()" styleClass="ch" /></th>
                                <th class="hspry brt brl">Location</th>
                                <th class="hspry brt brl">Specification</th>
                                <th class="hspry brt brl">Price</th>
                                <th class="hspry brt brr brl">Contact</th>
                            </tr>
                        </thead>
  <%
      boolean nextRow=false;
      String br="";
      while(rsOptions.next())
      {
          nextRow=true;
          String neo=rsOptions.getString("cPriceNegotiable");
          String trans=rsOptions.getString("iTransactionType");
          if(neo.equalsIgnoreCase("Y"))
          {
              neo="Negotiable";
          }
          else
          {
              neo="Not Negotiable";
          }
          if(trans.equalsIgnoreCase("1"))
          {
              trans="for Sale";
          }
          else
          {
              trans="for Rent";
          }
          int iListID=rsOptions.getInt("iListID");
          iTotalRows=rsOptions.getInt("cnt");
  %>
  <tbody>
      <tr>
          <td class="pd brt brb brl"><input type="checkbox" name="iListID" onClick="selectall()" styleClass="ch" value="<%=iListID%>"/> <img src="proImage/<%=iListID%>.jpg" id="im<%=iListID%>" onError="onErrorLoad('<%=iListID%>')" onClick="openWindow('<%=iListID%>')" width="90" height="100">&nbsp;</td>
          <td class="pd brt brb brl" <%if(sPendingID==true){ out.println("onclick=\"goRecord('"+iListID+"')\"");}%> ><%=rsOptions.getString("sPropertyName")%> <%=trans%><br> <%=rsOptions.getString("sPropertyAddress")%> <br><%=rsOptions.getString("iCityName")%> <br><%=rsOptions.getString("iLocationName")%></td>
          <td class="pd brt brb brl" <%if(sPendingID==true){ out.println("onclick=\"goRecord('"+iListID+"')\"");}%> >Area <%=rsOptions.getString("iArea")%> sq. ft <br><%=rsOptions.getString("iBedRoom")%> Bedrooms</td>
          <td class="pd brt brb brl" <%if(sPendingID==true){ out.println("onclick=\"goRecord('"+iListID+"')\"");}%> ><%=sCurrency%> <%=rsOptions.getString("iTotalPrice")%> <br><%=neo%></td>
          <td class="pd brt brb brl brr" <%if(sPendingID==true){ out.println("onclick=\"goRecord('"+iListID+"')\"");}%> >Posted Date: <%=getDateFormat(rsOptions.getTimestamp("dCreatedDate"),"dd.MMM.yyyy hh:mm a")%> <br><br><span style="text-transform:capitalize"><%=rsOptions.getString("sFirstName")%> <%=rsOptions.getString("sLastName")%></span><br> Contact: <%=rsOptions.getString("iUserContact")%><br> Email: <%=rsOptions.getString("sRegEmail")%><br>&nbsp;</td>
      </tr>
      <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td height="25" class="brb brl brr" align="center"><a href="response.jsp?iListID=<%=iListID%>&iType=L"><img src="images/res.gif" border="0"/> Response This List</a></td>
      </tr>
      <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
      </tr> 
      <%}
if(nextRow==false)
{
      %>
      <tr>
          <td colspan="5" align="center" height="50" class="pd brt  brb brl brr">No records is found</td>
      </tr>
      <%}
  
 		 try{
			if(iTotalRows<(iPageNo+iShowRows))
			{
				iEndResultNo=iTotalRows;
			}
			else
			{
				iEndResultNo=(iPageNo+iShowRows);
			}
			iStartResultNo=(iPageNo+1);
			iTotalPages=((int)(Math.ceil((double)iTotalRows/iShowRows)));
			
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
  %>
  </tbody>
                    </table>
                </div>
            </div>
                </td>
  </tr>
</table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
	<%if(iTotalRows>0){%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>&nbsp;</td>
     <td colspan="2"><%if(sPendingID==true){ %><input type="submit" name="DeleteAll" styleClass="bD" value="Delete" /><%}%></td>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
   </tr>
   <script>
   document.getElementById("tot").innerHTML="<b>Rows <%=iStartResultNo%> - <%=iEndResultNo%> &nbsp;&nbsp;Total Result  <%=iTotalRows%> </b>";
   </script>
   <tr>
     <td colspan="4"><div>
	 <%
	    int i=0;
	    
		int cPage=0;
		cPage=((int)(Math.ceil((double)iEndResultNo/50)));
		if((cPage*5)-(5)>0)
		{
		 %>
		 <span onClick="goSubmitPageForm('<%=(cPage*5)-(4+5)%>')" class="pg pd" style="cursor:pointer"><< Previous</span>
		 <%
		}
		
	    for(i=((cPage*5)-4);i<=(cPage*5);i++)
		{
		  if(i==((iPageNo/10)+1))
		  {
		  %>
		   <span onClick="goSubmitForm('S','<%=i%>')" class="pg pd" style="cursor:pointer;color: red"><b><%=i%></b></span>
		  <%
		  }
		  else if(i<=iTotalPages)
		  {
		  %>
		   <span onClick="goSubmitForm('S','<%=i%>')" class="pg pd" style="cursor:pointer"><%=i%></span>
		  <% 
		  }
		}
		if(iTotalPages>5 && i<iTotalPages)
		{
		 %>
		 <span onClick="goSubmitPageForm('<%=i%>')" class="pg pd" style="cursor:pointer">>> Next</span>
		 <%
		}
	  %>
 </div></td>
     <td>Total Pages  <b><%=iTotalPages%></b></td>
   </tr>
   <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<%}%>
</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div class="footer"><%@ include file="comman/footer.jsp"%></div></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
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