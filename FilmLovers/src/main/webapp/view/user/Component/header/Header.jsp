<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Navbar</title>
        <link rel="stylesheet" href="/film-lovers/view/user/Component/header/Header.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='https://fonts.googleapis.com/css?family=Outfit' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
        <script src="/film-lovers/view/user/Component/header/myscripts.js" defer></script>
    </head>
    <body>
        <div class="navbar">

            <div class="leftSection">
                <a href="/film-lovers/film" class="logo">Film Lovers</a>
                <a href="/film-lovers/search/film?type=movie">Movies</a>
                <a href="/film-lovers/search/film?type=series">TV Series</a>
                <a href="/film-lovers/search/celeb">Celebrities</a>

                <div class="more">
                    <button class="dropbtn">
                        <span>More</span>
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <c:if test="${sessionScope.authentication.role ne 'admin'}">
                            <a href="/film-lovers/contribute">Contribute</a>
                        </c:if>
                        <a href="/film-lovers/watchlist">Watchlist</a>
                        <a href="/film-lovers/review?action=user-review">Review</a>
                    </div>
                </div>
            </div>
            <c:set var="currentURL" value="${pageContext.request.requestURL}"/>
            <c:if test="${currentURL != 'http://localhost:8080/film-lovers/view/user/landing/landing.jsp'}" >
                <div class="searchBar">
                    <form action="/film-lovers/search/film">
                        <input type="search" name="title" placeholder="Search a title">
                        <button type="submit"><span class="fa fa-search"></span></button>
                    </form>
                </div>
            </c:if>

            <%-- after login remove login button --%>
            <div class="rightSection">
                
                <div class="signIn"><a href="/film-lovers/watchlist">Watchlist</a></div>
                <c:if test="${sessionScope.authentication == null}">
                    <div class="signIn"><a href="/film-lovers/login">Sign In</a></div>
                </c:if>
                <div class="signIn username">                    
                    <a href="/film-lovers/account?get-info">${sessionScope.authentication.username}</a>
                </div>  
                <!--                <div class="lang-switcher">
                                    <select>
                                        <option value="english">English</option>
                                        <option value="vietnamese" selected>Vietnamese</option>
                                    </select>
                                </div>
                                <div class="mode">
                                    <button onclick="changeMode()">Mode</button>
                                </div>-->

                <c:if test="${sessionScope.authentication != null}">
                    <div class="logout">
                        <a href="/film-lovers/login?action=logout">Logout</a>
                    </div>
                </c:if>

                <c:if test="${sessionScope.authentication.role eq 'admin'}">
                    <div class="signIn">
                        <a href="/film-lovers/admin/film">Go to Admin page</a>
                    </div>
                </c:if>

            </div>
        </div>


    </body>
</html>