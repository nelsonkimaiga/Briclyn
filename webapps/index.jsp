<!-- 
    Document   : landing
    Created on : May 11, 2016, 11:26:36 AM
    Author     : kimaiga-->


<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.text.*,java.util.*" errorPage=""%>
<%--<%@ include file="sessionchk.jsp"%>--%>
<jsp:useBean id="dbConn" scope="request" class="com.villa.db.DBProperties"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Briclyn Kenya|Welcome</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Real Estate">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="css/foundation.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/animate.css">
            <!--foundation icons-->
        <link rel="stylesheet" type="text/css" href="css/foundation-icons.css">
    <!-- Fancy box CSS -->
        <link href="css/jquery.fancybox.css" rel="stylesheet">
    <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    <!--foundation icons cdn-->
        <link href='https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css' rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
        <!-- Add the slick-theme.css if you want default styling -->
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick-theme.css"/>
        <script src="js/vendor/jquery.min.js"></script>
    </head>
    <body>
<!--        <div class="title-bar" data-responsive-toggle="realEstateMenu" data-hide-for="small">
            <button class="menu-icon" type="button" data-toggle></button>
            <div class="title-bar-title">Menu</div>
        </div>-->
        <div class="top-bar" id="realEstateMenu">
            <div class="top-bar-left">
                <ul class="menu" data-responsive-menu="accordion">
                    <li class="menu-text">Briclyn Ventures</li>
                    <li><a href="register.jsp">Register</a></li>
                </ul>
            </div>
            <div class="top-bar-right">
                <ul class="menu">
                    <li><a href="login.jsp">My Account</a></li>
                    <li><a class="button success">Login</a></li>
                </ul>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="medium-7 large-6 columns">
                <h1>Briclyn Ventures</h1>
                <p class="subheader" id="landingheader">Briclyn Ventures is a Kenyan based, international construction service company and is a leading builder in diverse and numerous market segments. We have earned recognition for undertaking large, complex projects, fostering innovation, embracing emerging technologies and making a difference for their clients, employees and community. We offer client the accessibility and support of a local firm with the stability and resource of a local firm with the stability and resource of a multi national organization.</p>
            </div>
            <div class="show-for-large medium-5 large-6 columns" id="home-icons">
                <i class="fi-home"></i>
            </div>
        </div>
        <div class="row column">
            <hr>
        </div>        
        <footer>
            <div class="row expanded callout secondary">
                <div class="small-8 large-8 columns map">
                    <p class="lead">Location</p>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d510564.3264207391!2d36.56720029145829!3d-1.3047879528792166!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x182f1172d84d49a7%3A0xf7cf0254b297924c!2sNairobi%2C+Kenya!5e0!3m2!1sen!2s!4v1463406856142" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                </div>
                <div class="small-4 large-4 columns">
                    <p class="lead">Contact</p>
                    <ul class="menu vertical">
                        <li><a href="https://www.twitter.com/BriclynVentures"><i class="fi-social-twitter"></i> Twitter</a></li>
                        <li><a href="#"><i class="fi-social-facebook"></i> Facebook</a></li>
                        <li><a><i class="fi-telephone"></i>Phone: 0720083264</a></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="medium-6 columns">
                    <ul class="menu">
                        <li><a href="#">Legal</a></li>
                    </ul>
                </div>
                <div class="medium-6 columns">
                    <ul class="menu float-right">
                        <li class="menu-text">Copyright &copy; Briclyn Ventures
                            <script type="text/javascript">
                                document.write(new Date().getFullYear());
                                                            </script>
                        </li>
                    </ul>
                </div>
            </div>
        </footer>
        <script src="js/foundation.js"></script>
        <script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
    </body>
</html>

