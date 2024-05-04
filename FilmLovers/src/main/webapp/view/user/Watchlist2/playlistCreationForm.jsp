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
    <title>Playlist Creation Form</title>

    <style>
/*        body{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .optionsForm{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 50%;
            text-align: center;
            flex-grow: 1;
            background-color: rgb(231, 99, 99);
            margin: 100px;
            border-radius: 15px;
        }
        
        .optionsForm form{
            width: 250px;
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
            border-radius: 20px;
            border: none;
            box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.3);
            cursor: pointer;
        }*/
        
    </style>
</head>
<body>
    <jsp:include page="/view/user/Component/header/Header.jsp" flush="true"/>
    <form action="watchlist">
        <input type="text" name="playlistName" placeholder="Enter playlist name" required/>
        <c:if test="${requestScope.filmID != null}">
            <input type="hidden" name="filmID" value="${requestScope.filmID}">
        </c:if>
        <input type="submit" value="Create">
        <input type="hidden" name="action" value="${requestScope.nextAction}"> 
    </form>
</body>
</html>