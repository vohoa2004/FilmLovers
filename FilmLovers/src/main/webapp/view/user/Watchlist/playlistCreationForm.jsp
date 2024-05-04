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
        body{
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            background-color: black;
            /*background-color: white;*/
        }  
        
        .creationForm{
            flex-grow: 1;
            width: 400px;
            background-color: transparent;
            /*padding: 20px 20px;*/
            position: absolute;
            top: 230px;
        }
        
        .creationForm form{
            position: absolute;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100%;
            /*height: 100%;*/
            border: 1px solid #3b1c1c;
            padding: 40px 40px;
            border-radius: 15px;
            background-color: #8e1f1f;
            border: none;
        }
        
        .creationForm form input{
            cursor: pointer;
        }
        
        .creationForm form input:first-child{
            background-color: #f1f1f1;
            border: 1px solid transparent;
            border-radius: 10px;
            height: 55px;
            position: relative;
            color: #8e1f1f;
            font-size: 20px;
            width: 100%;
            padding: 0 20px
        }
        
        .creationForm form input:first-child:focus{
            border-color: red;
            outline: none;
        }
        
        .creationForm form input:nth-child(2){
            margin-top: 25px;
            /*background-color: #8e1f1f;*/
            background-color: #f1f1f1;
            color: #8e1f1f;
            /*color: white;*/
            transition: 0.5s;
            border: none;
            padding: 15px 30px;
            font-size: 20px;
            border-radius: 200px;
        }
        
        .creationForm form input:nth-child(2):hover{
            /*background-color: #f1f1f1;*/
            background-color: black;
            color: #8e1f1f;
            font-weight: bold;
            transition: 0.5s;
            cursor: pointer;
        }    
        
    </style>
</head>
<body>
    <jsp:include page="/view/user/Component/header/Header.jsp" flush="true"/>
    <div class="creationForm">
        <form action="watchlist">
            <input type="text" name="playlistName" placeholder="Enter playlist name" maxlength="30" required/>
            <input type="submit" value="Create">
            <c:if test="${requestScope.filmID != null}">
                <input type="hidden" name="filmID" value="${requestScope.filmID}">
            </c:if>
            <input type="hidden" name="action" value="${requestScope.nextAction}"> 

        </form>
    </div>
</body>
</html>