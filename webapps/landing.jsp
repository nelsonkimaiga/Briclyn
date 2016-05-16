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
        <div class="title-bar" data-responsive-toggle="realEstateMenu" data-hide-for="small">
            <button class="menu-icon" type="button" data-toggle></button>
            <div class="title-bar-title">Menu</div>
        </div>
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
            <div class="show-for-large large-3 columns">
                <img src="http://placehold.it/400x370&text=PSR1257 + 12 C" alt="picture of space">
            </div>
            <div class="medium-5 large-3 columns">
                <div class="callout secondary">
                    <form>
                        <div class="row">
                            <div class="small-12 columns">
                                <label>Find Your Dream House
                                    <input type="text" placeholder="Search destinations">
                                </label>
                            </div>
                            <div class="small-12 columns">
                                <label>Number of Moons
                                    <input type="number" placeholder="Moons required">
                                </label>
                                <button type="submit" class="button">Search Now!</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="row column">
            <hr>
        </div>
        <div class="row column">
            <p class="lead">Trending Planetary Destinations</p>
        </div>
        <div class="row small-up-1 medium-up-2 large-up-3">
            <div class="column">
                <div class="callout">
                    <p>Pegasi B</p>
                    <p><img src="http://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
                    <p class="lead">Copernican Revolution caused an uproar</p>
                    <p class="subheader">Find Earth-like planets life outside the Solar System</p>
                </div>
            </div>
            <div class="column">
                <div class="callout">
                    <p>Pegasi B</p>
                    <p><img src="http://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
                    <p class="lead">Copernican Revolution caused an uproar</p>
                    <p class="subheader">Find Earth-like planets life outside the Solar System</p>
                </div>
            </div>
            <div class="column">
                <div class="callout">
                    <p>Pegasi B</p>
                    <p><img src="http://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
                    <p class="lead">Copernican Revolution caused an uproar</p>
                    <p class="subheader">Find Earth-like planets life outside the Solar System</p>
                </div>
            </div>
            <div class="column">
                <div class="callout">
                    <p>Pegasi B</p>
                    <p><img src="http://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
                    <p class="lead">Copernican Revolution caused an uproar</p>
                    <p class="subheader">Find Earth-like planets life outside the Solar System</p>
                </div>
            </div>
        </div>
        <div class="row column">
            <a class="button hollow expanded">Load More</a>
        </div>
        <footer>
            <div class="row expanded callout secondary">
                <div class="small-6 large-3 columns">
                    <p class="lead">Offices</p>
                    <ul class="menu vertical">
                        <li><a href="#">One</a></li>
                        <li><a href="#">Two</a></li>
                        <li><a href="#">Three</a></li>
                        <li><a href="#">Four</a></li>
                    </ul>
                </div>
                <div class="small-6 large-3 columns">
                    <p class="lead">Solar Systems</p>
                    <ul class="menu vertical">
                        <li><a href="#">One</a></li>
                        <li><a href="#">Two</a></li>
                        <li><a href="#">Three</a></li>
                        <li><a href="#">Four</a></li>
                    </ul>
                </div>
                <div class="small-6 large-3 columns">
                    <p class="lead">Contact</p>
                    <ul class="menu vertical">
                        <li><a href="https://www.twitter.com/BriclynVentures"><i class="fi-social-twitter"></i> Twitter</a></li>
                        <li><a href="#"><i class="fi-social-facebook"></i> Facebook</a></li>
                    </ul>
                </div>
                <div class="small-6 large-3 columns">
                    <p class="lead">Offices</p>
                    <ul class="menu vertical">
                        <li><a href="#">One</a></li>
                        <li><a href="#">Two</a></li>
                        <li><a href="#">Three</a></li>
                        <li><a href="#">Four</a></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="medium-6 columns">
                    <ul class="menu">
                        <li><a href="#">Legal</a></li>
                        <li><a href="#">Partner</a></li>
                        <li><a href="#">Explore</a></li>
                    </ul>
                </div>
                <div class="medium-6 columns">
                    <ul class="menu float-right">
                        <li class="menu-text">Copyright</li>
                    </ul>
                </div>
            </div>
        </footer>
        <script src="js/foundation.js"></script>
    </body>
</html>

