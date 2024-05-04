<%-- 
    Document   : watchlistOptionsPage.jsp
    Created on : Mar 19, 2024, 1:17:47 PM
    Author     : THAO LE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Watchlist Options</title>

    <style>

        /* width */
        ::-webkit-scrollbar {
          width: 3px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
          /*background: #f1f1f1;*/ 
          background: black;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
          background: #888; 
          background-clip: content-box;
        }

        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
          background: #555; 
        }
        
        .dropbtn-playlist {
          /*background-color: #04AA6D;*/
          background-color:  #8e1f1f;
          color: white;
          padding: 20px 65.5px;
          font-size: 22px;
          border: none;
          transition: 0.5s;
        }
        
        .dropbtn-playlist i{
            margin-left: 5px;
            font-size: 15px;
        }

        .dropdown-playlist {
          position: relative;
          display: inline-block;
        }

        .dropdown-content-playlist {
            /*display: none;*/
            position: absolute;
            background-color: #f1f1f1;
            width: 344.5px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 0;
            /*max-height: 200px;*/
            max-height: 0;
            overflow: auto;
            opacity: 0; 
            transition: opacity 1.5s ease; 
        }

        .dropdown-content-playlist form {
          /*padding: 20px 15px;*/
          text-decoration: none;
          display: block;
          background-color: black; 
        }
        
         .dropdown-content-playlist form:hover{
            background-color:  #8e1f1f;
            transition: 0.5s;
            cursor: pointer;
        }
        
        .dropdown-content-playlist form:last-child:hover{
            background-color:  rgb(248, 130, 130);
            transition: 0.5s;
            cursor: pointer;
        }
        
        .dropdown-content-playlist form input{
            font-size: 18px;
            border: none;
            background-color: transparent;
            color: white;
            width: 100%;
            height:100%;
            padding: 20px 15px;
            cursor: pointer;
        }

        .dropdown-playlist:hover .dropdown-content-playlist 
        {
            /*display: block;*/
            max-height: 200px; 
            opacity: 1; 
            cursor: pointer;
        }

        .dropdown-playlist:hover .dropbtn-playlist 
        {
            background-color: white;
            color: #8e1f1f;
        }

        body{
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            background-color: black;
            /*background-color: white;*/
        }  
        
        .content{
            position: absolute;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            top: 300px;
            width: 100%;
        }
        
/*        .optionsList{
            position: absolute;
            flex-grow: 1;
            display: flex;
            top: 300px;
        }*/
        
        .emptyWatchlist{
            position: absolute;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        
        .emptyWatchlist p{
            font-size: 55px;
            color: #e50914;
            color: white;
            text-shadow: 2px 2px 4px red; 
            font-weight: bold;
        }
        
        .emptyWatchlist form input{
            margin-top: 45px;
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
            color:  #8e1f1f;
            font-weight: bold;
            transition: 0.5s;
            cursor: pointer;
        }
        
        
        
    </style>
</head>
<body>
    <jsp:include page="/view/user/Component/header/Header.jsp" flush="true"/>
    <div class="content">    
        <c:choose>
            <c:when test="${requestScope.listOfPlaylists != null && not empty requestScope.listOfPlaylists}">
                <div class="optionsList">
                    <div class="dropdown-playlist">
                    
                    <button class="dropbtn-playlist">
                        <span>Choose your playlist</span>
                        <i class="fa fa-caret-down"></i>
                    </button>
                    
                    <div class="dropdown-content-playlist">
                        <c:forEach items="${requestScope.listOfPlaylists}" var="playlist">
                            <form action="watchlist" method="POST">
                                <input type="hidden" name="filmID" value="${requestScope.filmID}">
                                <!--<input type="hidden" name="filmID" value="${17}">-->
                                <input type="submit" value="${playlist.name}">
                                <input type="hidden" name="playlistID" value="${playlist.id}">
                                <input type="hidden" name="action" value="addToPlaylist"> 
                            </form>
                        </c:forEach>
                        <form action="watchlist">
                           <input type="submit" value="Create and Add to Playlist">
                           <input type="hidden" name="filmID" value="${requestScope.filmID}">
                           <input type="hidden" name="action" value="getNewPlaylistInfo">
                        </form>
                    </div>
                           
                </div>
                </div>
                
            </c:when>
            
            <c:otherwise>
                <div class="emptyWatchlist">
                    <p>Oops! It seems you don't have any playlist.</p>
                    <form action="watchlist">
                        <input type="submit" value="Create and Add to Playlist">
                        <input type="hidden" name="filmID" value="${requestScope.filmID}">
                        <input type="hidden" name="action" value="getNewPlaylistInfo">
                    </form>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>