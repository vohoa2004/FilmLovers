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
        body{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            /*height: 100vh;*/
        }
        
        .optionsForm{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            /*width: 50%;*/
            width: auto;
            /*text-align: center;*/
            height: auto;
            /*min-height: 500px;*/
            /*overflow: auto;*/
            /*flex-grow: 1;*/
            background-color: rgb(231, 99, 99);
            /*margin:60px 0;*/
            border-radius: 15px;
            padding: 50px 0;
            margin: 50px 0;
        }
        
        .optionsForm form:not(:last-child){
            margin-bottom: 20px !important;
        }
        .optionsForm form{
            width: 313px;
            margin-bottom: 20px;
        }
        
        .optionsForm p{
            font-size: 30px;
            margin-bottom: 20px;
        }
        
        .optionsForm input{
            width: 100%;
            padding: 20px 40px;
            font-size: 20px;
            /*border-radius: 20px;*/
            /*border: none;*/
            /*box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.3);*/
            cursor: pointer;
        }
        
    </style>
</head>
<body>
    <jsp:include page="/view/user/Component/header/Header.jsp" flush="true"/>
    <div class="optionsForm">    
        <c:choose>
            <c:when test="${requestScope.listOfPlaylists != null && not empty requestScope.listOfPlaylists}">
                <c:forEach items="${requestScope.listOfPlaylists}" var="playlist">
                    <form action="watchlist" method="POST">
                        <input type="hidden" name="filmID" value="${requestScope.filmID}">
                        <input type="submit" value="${playlist.name}">
                        <input type="hidden" name="playlistID" value="${playlist.id}">
                        <input type="hidden" name="action" value="addToPlaylist"> 
                    </form>
                </c:forEach>
                    <form action="watchlist">
                       <input type="submit" value="Create and Add to playlist">
                       <input type="hidden" name="filmID" value="${requestScope.filmID}">
                       <input type="hidden" name="action" value="getNewPlaylistInfo">
                    </form>
            </c:when>
            
            <c:otherwise>
                <p>Currently, you do not have any playlist!</p>
                <form action="watchlist">
                    <input type="submit" value="Create and Add to playlist">
                   <!--<input type="hidden" name="filmID" value="${30}">-->
                    <input type="hidden" name="filmID" value="${requestScope.filmID}">
                    <input type="hidden" name="action" value="getNewPlaylistInfo">
                </form>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>