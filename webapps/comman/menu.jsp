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
    <!--<h3 class="masthead-brand"><a href=""><img src="" class="image-logo" alt="Briclyn Kenya"></a></h3>-->
    <nav class="small-6 medium-10 large-12 columns">
    <ul class="nav masthead-nav">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="doSearch.jsp">Search</a></li>
             <%
                    if(sSessonUserID.equals(""))
                    {
             %>
        <li><a href="register.jsp">Register</a></li>
                <%}%>
        <li><a href="create-listing.jsp">List Your Property</a></li>
        <li><a href="<%=fileCall%>"><span><%=sSessonUserID%> <%=status%></span></a></li>
    </ul>
</nav>