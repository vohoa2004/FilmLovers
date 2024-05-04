<%-- 
    Document   : playlist
    Created on : Mar 19, 2024, 4:54:38 PM
    Author     : THAO LE
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="filmlovers.model.Film.FilmDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="/film-lovers/view/user/Watchlist/playlist.css" />
        <!-- CSS -->
        <link rel="stylesheet" href="/film-lovers/view/user/Watchlist/bootstrap-reboot.min.css">
        <link rel="stylesheet" href="/film-lovers/view/user/Watchlist/bootstrap-grid.min.css">
        <title>Playlist</title>
        
        <style>
            body{
                /*display: flex;*/
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background-color: black; 
                position: relative;
            }
            
            .container-fluid{
                /*margin: 10px 10px;*/
            }
            
            .cover{
                margin-right: 40px;
                /*width: 272px;*/
                width: 222px;
                height: 331px;
                /*height: 381px;*/
                border-radius: 15px;
                background: #0F1116;
                padding: 0;
            }
            
            .filmInfo{
                margin-left: 20px;
            }
            
            .listOfMovies{
                padding: 20px 70px;
                margin-top:30px;
            }
            
            
            .listOfMovies:last-child{
                margin-bottom: 40px;
            }
/*            .listOfMovies .titleAndYear{
                font-size: 30px;
                font-weight: bold;
                text-align: justify;
                color: #821319;
                text-decoration: none;
            }*/
            
            .titleAndYear a{
                font-size: 30px;
                font-weight: bold;
                text-align: justify;
                color: #821319;
                text-decoration: none;
            }
            
            .titleAndYear a:hover{
                color: #b0151a;
                transition: 0.5s;
            }
            
            .listOfMovies .duration, .description{
                font-size: 20px;
                font-weight: 400;
                margin-top: 10px;
                color: white;
            }
            
            
            .numOfTitles{
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 60px;
                background-color:  #f1f1f1;
                color: #8e1f1f;
                font-weight: 600;
            }
            
            .intro_user{
                background-color: #8e1f1f;
                /*border-bottom: 1px solid white;*/
                padding: 0;
                padding: 20px 70px;
            }
            
            .some_random{
                color:rgb(243, 191, 191);
                font-size: 30px;
            }
            
            .intro_user a{
                text-decoration: none;
                color: black;
                font-weight: bold;
            }
            
            
            .see_ur_profile:hover{
                color: #f1f1f1;
                transition: 1s;
            }
            
            .emptyPlaylist{
                position: absolute;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                top: 200px;
                left: 500px;
                /*flex-grow: 1;*/
                /*width: 500px;*/
                background-color: black;
            }
            
            .emptyPlaylist p{
                font-size: 55px;
                color: #e50914;
                color: white;
                text-shadow: 2px 2px 4px red; 
                font-weight: bold;
            }
            
            .emptyPlaylist a{
                margin-top: 45px;
                /*width: 100%;*/
                height: 100%;
                background-color: #8e1f1f;
                color: white;
                transition: 0.5s;
                border: none;
                padding: 15px 40px;
                font-size: 25px;
                border-radius: 200px;
                text-decoration: none;
            }
            
            .emptyPlaylist a:hover{
                background-color: #f1f1f1;
                color:  #8e1f1f;
                font-weight: bold;
                transition: 0.5s;
                cursor: pointer;
            }
            
        </style>
        
    </head>

    <body>
        <jsp:include page="/view/user/Component/header/Header.jsp" flush="true"/>

        <%
            int numOfMovies = 0;
            List<FilmDTO> list = (List<FilmDTO>) request.getAttribute("allMoviesOfPlaylist");
            if (list != null) {
                numOfMovies = list.size();
            }
            pageContext.setAttribute("numOfMovies", numOfMovies);
        %>
        
        
        <c:choose>
            <c:when test="${numOfMovies == 0}">
                <div class="emptyPlaylist">
                    <p>Your playlist is empty!</p>
                    <a href="/film-lovers/watchlist?action=viewWatchlist">Back to Watchlist</a>
                </div>
            </c:when>
                
            <c:otherwise>
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-6 intro_user">
                            <div class="profile" style="display: flex">
                                <div class="avt_container"><img src="${sessionScope.authentication.imageURL}" class="avt_container"></div>
                                <div style="margin-left: 20px">
                                    <div class="some_random" style="margin-bottom:10px;">
                                        ${sessionScope.authentication.firstName}
                                        ${sessionScope.authentication.lastName}
                                    </div>
                                    <a href="" class="see_ur_profile">View profile</a>
                                </div>
                            </div>
                        </div>



                        <div class="col-6 numOfTitles">
                            <c:if test="${numOfMovies != 0}">
                                <p><%=numOfMovies%> title(s)<p>
                                </c:if>
                        </div>




                        <c:if test="${numOfMovies != 0}">
                            <c:forEach items="${requestScope.allMoviesOfPlaylist}" var="item">
                                <div class="col-12 row listOfMovies">

                                    <div class="col-2">
                                        <div class="cover">
                                           <a href="/film-lovers/film-detail?id=${item.id}">
                                                <img src="${item.photo}" width="100%" height="100%" style="" alt=""/>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="col-9 filmInfo">
                                        <div class="titleAndYear">
                                            <a href="/film-lovers/film-detail?id=${item.id}">
                                            <span class="">${item.title}</span>
                                            <span class="">(${item.releaseYear})</span>
                                            </a>
                                        </div>

                                        <div class="duration">
                                            <c:if test="${item.type == 'movie'}">
                                                <p>${item.runtime}minutes</p>
                                            </c:if>
                                            <c:if test="${item.type == 'series'}">
                                                <p>${item.runtime}minutes/episode</p>
                                            </c:if>
                                        </div>

                                        <div class="description">
                                            <p><b>Description:</b> ${item.description}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>    

                    </div>
                </div>

            </c:otherwise>    
        </c:choose>
        
            

          
    </body>
</html>
