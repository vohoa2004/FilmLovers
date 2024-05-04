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
        <title>Playlist</title>
    </head>

    <body>
        <jsp:include page="/view/user/Component/header/Header.jsp" flush="true"/>
        <div class="body_ur_list">
            <div class="container_left">
                <div class="intro_user">
                    <div style="display: flex">
                        <div class="avt_container"></div>
                        <div style="margin-left: 20px">
                            <div class="some_random">Username: ${sessionScope.authentication.username}</div>
                            <a href="" class="see_ur_profile">See your profile</a>
                        </div>
                    </div>
                </div>
                
                <%
                    int numOfMovies = 0;
                    List<FilmDTO> list = (List<FilmDTO>) request.getAttribute("allMoviesOfPlaylist");
                    if (list != null) {
                        numOfMovies = list.size();
                    }
                %>

                <div class="count_title_page">
                    <div class="count_title">
                        <c:if test="${numOfMovies != 0}">
                            <p><%=numOfMovies%><p>
                        </c:if>
                    </div>
                </div>
                <div>
                    <c:choose>
                        <c:when test="${numOfMovies == 0}">
                            <p>Your playlist is empty!</p>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${requestScope.allMoviesOfPlaylist}" var="item">
                                <div class="film_detail_container">

                                    <div class="img_film">
                                        <img src="${item.photo}" width="100%" height="100%" style=" border-top-left-radius: 10px; border-bottom-left-radius: 10px;"
                                             alt=""/>
                                    </div>

                                    <div class="film_detail_right">

                                        <div>
                                            <span class="title_film">${item.title}</span>
                                            <span class="year_film">${item.releaseYear}</span>
                                        </div>

                                        <div class="film_rating">
                                            <c:if test="${item.type == 'movie'}">
                                                <div>${item.runtime}m</div>
                                            </c:if>
                                            <c:if test="${item.type == 'series'}">
                                                <div>${item.runtime}m/episode</div>
                                            </c:if>
                                        </div>

                                        <div class="film_description">
                                            ${item.description}
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    
                        
                    
                    
                </div>

            </div>

        </div>
    </body>
</html>
