<%-- 
    Document   : add-genre
    Created on : Mar 17, 2024, 10:46:43 PM
    Author     : vothimaihoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Contribute genre for ${param.title}</h1>
        <form action="contribute" method="POST">
            <label>Genre: </label><br>
            <input type="hidden" name="title" value="${param.title}">
            <input type="hidden" name="filmId" value="${param.filmId}">

            Current Genres:<br>
            <c:forEach items="${requestScope.filmGenres}" var="genre">
                ${genre}
                <br>
            </c:forEach>

            Contribute new genres:<br>
            <c:forEach items="${requestScope.optionGenres}" var="genre">
                <c:if test="${!requestScope.filmGenres.contains(genre)}">
                    ${genre}<input type="checkbox" name="genres" value="${genre}">
                    <br>
                </c:if>
            </c:forEach>

            <input type="hidden" name="action" value="add-genre">
            <button id="submitBtn" type="submit">Submit</button>
        </form>
            
    </body>
</html>
