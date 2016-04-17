<%-- 
    Document   : navbar
    Created on : Apr 9, 2016, 9:36:53 AM
    Author     : kimaiga
--%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@include file="../function.jsp" %>
<%
    String status="Login";
    String fileCall="login.jsp";
    String sSessonUserID=nullconv((String)session.getAttribute("sUserID"));
    if(!(sSessonUserID).equals(""))
    {
        status="Logout";
        fileCall="logout.jsp";
        sSessonUserID="Hi!  "+nullconv((String)session.getAttribute("sUsername"));
    }
%>
<div class="top-bar">
    <div class="top-bar-left">
        <ul class="dropdown menu" data-dropdown-menu>
            <li class="menu-text">Briclyn Kenya</li>
            <li></li>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="doSearch.jsp">Search</a></li>
             <%
                    if(sSessonUserID.equals(""))
                    {
             %>
            <li><a href="register.jsp">Register</a></li>
             <%}
             %>
             <li><a href="create-listing.jsp">List Your Property</a></li>
             <li><a href="create-posting.jsp">Post Your Requirement</a></li>
             <li><a href="<%=fileCall%>"><span><%=sSessonUserID%> <%=status%></span></a></li>
        </ul>
    </div>
</div>
