<%-- 
    Document   : watchlistPage
    Created on : Mar 21, 2024, 2:18:23 PM
    Author     : THAO LE
--%>

<%@page import="filmlovers.model.Playlist.PlaylistDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="/film-lovers/view/user/Watchlist/watchlist.css" />
        <title>Watchlist</title>
    </head>
    <body>
        <jsp:include page="/view/user/Component/header/Header.jsp" flush="true"/>
        <div class="body_ur_list">
            <div class="container_left">
                <div style="height: 1500px">

                    <!-- USER INFORMATION -->
                    <div class="intro_user">
                        <div style="display: flex">
                            <div ><img src="${sessionScope.authentication.imageURL}" class="avt_container"></div>
                            <div style="margin-left: 20px">
                                <div class="some_random">
                                    ${sessionScope.authentication.firstName} 
                                    ${sessionScope.authentication.lastName}
                                </div>
                                <a href="account?action=get-info" class="see_ur_profile">See your profile</a>
                                <!-- <div class="ur_rating_text">Your Ratings</div> -->
<!--                                <div class="private">
                                    <img src="../assets/lock_black.png" alt="" />Private
                                </div>-->
                            </div>
                        </div>

<!--                        <div class="contact_ur_list">
                            <div class="privacy">
                                Privacy <img src="../assets/lock.png" alt="" />
                            </div>
                            <div class="share_ur_list">
                              Share <img src="../assets/share_link.png" alt="" />
                            </div> 
                        </div>-->
                    </div>
                    <!--END USER INFORMATION -->

                    <%
                        int numOfPlaylists = 0;
                        List<PlaylistDTO> list = (List<PlaylistDTO>)request.getAttribute("listOfPlaylists");
                        if(list != null){
                            numOfPlaylists = list.size();
                        }
                        pageContext.setAttribute("numOfPlaylists", numOfPlaylists);
                    %>
                    <div class="count_title_page">
                        <div class="count_title">
                            <c:if test="${pageScope.numOfPlaylists != 0}">
                                ${pageScope.numOfPlaylists} Playlist(s)
                            </c:if>
                        </div>
                    </div>
                    
                    <div class="list_of_playlist">
                        <c:choose>
                            <c:when test="${pageScope.numOfPlaylists != 0}">
                                <div>
                                    <c:forEach items="${requestScope.listOfPlaylists}" var="playlist">
                                    <a href="?action=viewOnePlaylist&playlistID=${playlist.id}&filmID=0">
                                        ${playlist.name}
                                    </a>
                                    <br>
                                </c:forEach>
                                </div>
                                
                                <form action="watchlist">
                                    <input type="submit" value="Create new playlist">
                                    <input type="hidden" name="action" value="getNewPlaylistInfo">
                                </form>        
                            </c:when>
                                   
                            <c:otherwise>
                                <p>Currently, you do not have any playlist!</p>
                                <form action="watchlist">
                                    <input type="submit" value="Create new playlist">
                                    <input type="hidden" name="action" value="getNewPlaylistInfo">
                                </form>        
                            </c:otherwise>        
                        </c:choose>
                        
                    </div>

                    

<!--                    <div>
                        <div class="film_detail_container">
                            <div class="img_film">
                                <img
                                    src="../assets/mai_teaser.jpg"
                                    width="100%"
                                    height="100%"
                                    style="
                                    border-top-left-radius: 10px;
                                    border-bottom-left-radius: 10px;
                                    "
                                    alt=""
                                    />
                            </div>
                            <div class="film_detail_right">
                                <div>
                                    <span class="title_film">Title</span>
                                    <span class="year_film"> (year)</span>
                                </div>
                                <div class="film_rating">
                                    <div
                                        style="
                                        display: flex;
                                        align-items: center;
                                        font-weight: 700;
                                        gap: 5px;
                                        "
                                        >
                                        <img src="../assets/star_blue.png" alt="" />8
                                    </div>
                                    <div>Rated on 06 Feb 2024</div>
                                    <div>Type</div>
                                    <div>Genres</div>
                                </div>
                                <div class="film_description">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                                    do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                </div>
                            </div>
                        </div>

                    </div>-->
                </div>
<!--                <div class="show_more">
                    Show more <img src="../assets/dropdown_white.png" alt="" />
                </div>-->
            </div>
        </div>
    </body>
</html>

