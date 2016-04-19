<%
String sUserType=nullconv((String)session.getAttribute("iUserType"));
String sPending="";
if(!(sUserType).equals(""))
{
  if(sUserType.equalsIgnoreCase("1"))
  {
   %>
   <div class="headers">My Menu</div>
   <ul class="categorylinks" id="sidemenu">
		<li><a href="myProfile.jsp">My Profile</a></li>
		<li><a href="myList.jsp">My Listing </a></li>
		<li><a href="myResponse.jsp">Response I Got</a></li>
		<li><a href="myPost.jsp">My Posting</a></li>
		<li><a href="sendResponse.jsp">Response I Sent</a></li>
		<li><a href="chgPwd.jsp">Change Password</a></li>
</ul>

<div class="headers">Administrator</div>
<ul class="categorylinks">
		<li><a href="addCountry.jsp">Add Country</a></li>
		<li><a href="viewCountry.jsp">Edit Country</a></li>
		<li><a href="addState.jsp">Add State</a></li>
		<li><a href="viewState.jsp">Edit State</a></li>
		<li><a href="addCity.jsp">Add City</a></li>
		<li><a href="viewCity.jsp">Edit City</a></li>
		<li><a href="addLocation.jsp">Add Location</a></li>
		<li><a href="viewLocation.jsp">Edit Location</a></li>
		<li><a href="addproperty.jsp">Add Property</a></li>
		<li><a href="viewproperty.jsp">Edit Property</a></li>
		<li><a href="currency.jsp">Add Currency</a></li>
		<li><a href="addBudget.jsp">Add Budget</a></li>
		<li><a href="viewBudget.jsp">Edit Budget</a></li>
		<li><a href="pendUser.jsp">Pending User</a></li>
		<li><a href="viewforget.jsp">Pending Forget Password</a></li>
		<li><a href="approveListAdmin.jsp">Add Approval Option List</a></li>
		<li><a href="approvePostAdmin.jsp">Add Approval Option Post</a></li>
		<li><a href="approveList.jsp">Pending Approval List</a></li>
		<li><a href="approvePost.jsp">Pending Approval Post</a></li>
		<li><a href="doSearchPost.jsp">Search Post</a></li>
</ul>
   <%
  }
  else if(sUserType.equalsIgnoreCase("2"))
  {
  %>
  <div class="headers">My Estate</div>
<ul class="categorylinks">
		<li><a href="myProfile.jsp">My Profile</a></li>
		<li><a href="myList.jsp">My Listing </a></li>
		<li><a href="myResponse.jsp">Response I Got</a></li>
		<li><a href="myPost.jsp">My Posting</a></li>
		<li><a href="sendResponse.jsp">Response I Sent</a></li>
		<li><a href="chgPwd.jsp">Change Password</a></li>
</ul>

<div class="headers">Administrator</div>
<ul class="categorylinks">
		<li><a href="addCountry.jsp">Add Country</a></li>
		<li><a href="viewCountry.jsp">Edit Country</a></li>
		<li><a href="addState.jsp">Add State</a></li>
		<li><a href="viewState.jsp">Edit State</a></li>
		<li><a href="addCity.jsp">Add City</a></li>
		<li><a href="viewCity.jsp">Edit City</a></li>
		<li><a href="addLocation.jsp">Add Location</a></li>
		<li><a href="viewLocation.jsp">Edit Location</a></li>
		<li><a href="currency.jsp">Add Currency</a></li>
		<li><a href="addBudget.jsp">Add Budget</a></li>
		<li><a href="viewBudget.jsp">Edit Budget</a></li>
		<li><a href="approveList.jsp">Pending Approval List</a></li>
		<li><a href="approvePost.jsp">Pending Approval Post</a></li>
</ul>
  <%
  }
  else if(sUserType.equalsIgnoreCase("3"))
  {
  %>
  <div class="headers">My Estate</div>
<ul class="categorylinks">
		<li><a href="myProfile.jsp">My Profile</a></li>
		<li><a href="myList.jsp">My Listing </a></li>
		<li><a href="myResponse.jsp">Response I Got</a></li>
		<li><a href="myPost.jsp">My Posting</a></li>
		<li><a href="sendResponse.jsp">Response I Sent</a></li>
		<li><a href="chgPwd.jsp">Change Password</a></li>
</ul>
  <%
  }
}
%>


