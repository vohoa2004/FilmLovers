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
        <!-- CSS -->
        <link rel="stylesheet" href="/film-lovers/view/user/Watchlist/bootstrap-reboot.min.css">
        <link rel="stylesheet" href="/film-lovers/view/user/Watchlist/bootstrap-grid.min.css">
        <title>Watchlist</title>

        <style>
            body{
                display: flex;
                flex-direction: column;
                justify-content: center;
                background-color: black;
                align-items: center;
                position: relative;
                /*color: white;*/
            }

            .numOfPlaylists{
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 60px;
                background-color:  #f1f1f1;
                /*color: #f1f1f1;*/
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


            .emptyWatchlist{
                position: absolute;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                flex-grow: 1;
                top: 200px;
            }

            .emptyWatchlist p{
                font-size: 55px;
                color: #e50914;
                color: white;
                text-shadow: 2px 2px 4px red; 
                font-weight: bold;
            }

            .emptyWatchlist form input{
                margin-top: 30px;
                width: 100%;
                height: 100%;
                background-color: #8e1f1f;
                color: white;
                transition: 0.5s;
                border: none;
                padding: 15px 40px;
                font-size: 25px;
                border-radius: 200px;
            }

            .emptyWatchlist form input:hover{
                background-color: #f1f1f1;
                color: #8e1f1f;
                font-weight: bold;
                transition: 0.5s;
                cursor: pointer;
            }

            .list_of_playlist{
                width: 100%;
                display: flex;
                /*flex-direction: row;*/
                justify-content: center;
                align-items: center;
            }

            .one_playlist{
                display: flex;
                flex-direction: row;
                justify-content: center;
                /*align-items: ;*/
                flex-wrap: wrap;
                /*min-width: 345px;*/
                /*max-width: 1500px;*/
                margin: 50px 0;
            }

            .one_playlist a{
                text-decoration: none;
                font-size: 20px;
                width: 350px;
                padding: 20px 0;
                background-color: #454343;
                margin: 20px 30px 0 30px;
                text-align: center;
                border-radius: 10px;
                color: #f1f1f1;
                /*color: #8e1f1f;*/
                /*font-weight: bold;*/
                /*box-shadow: 4px 4px 6px rgba(0, 0, 0, 0.5);*/ 
            }
            
            .one_playlist a:hover{
                background-color: #f1f1f1;
                color: #8e1f1f;
                /*background-color: #8e1f1f;*/
                /*color: #f1f1f1;*/
                font-weight: bold;
                transition: 0.5s;
            }

            .one_playlist form{
                width: 345px;
                margin: 20px 30px 0 30px;
            }

            .one_playlist form input{
                width: 100%;
                height: 100%;
                padding: 20px 0;
                border-radius: 10px;
                border: none;
                background-color: #454343;
                color: #f1f1f1;
                font-size: 20px;
            }
            
            .one_playlist form input:hover{
                background-color:  rgb(248, 130, 130);
                transition: 0.5s;
                cursor: pointer;
                font-weight: bold;
                color: black;
            }


        </style>    
    </head>


    <body>
        <jsp:include page="/view/user/Component/header/Header.jsp" flush="true"/>
        <%
            int numOfPlaylists = 0;
            List<PlaylistDTO> list = (List<PlaylistDTO>) request.getAttribute("listOfPlaylists");
            if (list != null) {
                numOfPlaylists = list.size();
            }
            pageContext.setAttribute("numOfPlaylists", numOfPlaylists);
        %>

        <c:choose>
            <c:when test="${pageScope.numOfPlaylists == 0}">
                <div class="emptyWatchlist">
                    <p>Currently, you have no playlists!</p>
                    <form action="watchlist">
                        <input type="submit" value="Create new playlist">
                        <input type="hidden" name="action" value="getNewPlaylistInfo">
                    </form>        
                </div>
            </c:when>


            <c:otherwise>
                <div class="container-fluid">
                    <div class="row">
                        <!-- USER INFORMATION -->
                        <div class="col-6 intro_user">
                            <div class="profile" style="display: flex">
                                <div class="avt_container"><img src="${sessionScope.authentication.imageURL}" class="avt_container"></div>
                                <div style="margin-left: 20px">
                                    <div class="some_random" style="margin-bottom:10px;">
                                        ${sessionScope.authentication.firstName}
                                        ${sessionScope.authentication.lastName}
                                    </div>
                                    <a href="/film-lovers/account?action=get-info" class="see_ur_profile">View profile</a>
                                </div>
                            </div>
                        </div>
                        <!--END USER INFORMATION -->


                        <div class="col-6 numOfPlaylists">
                            <c:if test="${pageScope.numOfPlaylists != 0}">
                                ${pageScope.numOfPlaylists} Playlist(s)
                            </c:if>
                        </div>
                    </div>

                    <div class="row">
                        <div class="list_of_playlist">
                            <c:choose>
                                <c:when test="${pageScope.numOfPlaylists != 0}">
                                    <div class="one_playlist">
                                        <c:forEach items="${requestScope.listOfPlaylists}" var="playlist">
                                            <a href="?action=viewOnePlaylist&playlistID=${playlist.id}&filmID=0">
                                                ${playlist.name}
                                            </a>
                                            <br>
                                        </c:forEach>
                                        <form action="watchlist">
                                            <input type="submit" value="Create new playlist">
                                            <input type="hidden" name="action" value="getNewPlaylistInfo">
                                        </form>        
                                    </div>
                                </c:when>

                                <c:otherwise>
                                    <div class="emptyWatchlist">
                                        <p>Currently, you have no playlists!</p>
                                        <form action="watchlist">
                                            <input type="submit" value="Create new playlist">
                                            <input type="hidden" name="action" value="getNewPlaylistInfo">
                                        </form>        
                                    </div>
                                </c:otherwise>        
                            </c:choose>

                        </div>
                    </div>

                </div>
            </c:otherwise>
        </c:choose>


    </div>



</body>

</html>

