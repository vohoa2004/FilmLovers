<%-- 
    Document   : add-photo
    Created on : Mar 17, 2024, 10:39:22 PM
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
        <h1>Contribute Photo</h1>
        <form action="contribute" method="POST">
            <input type="hidden" name="title" value="${param.title}">
            <input type="hidden" name="filmId" value="${param.filmId}">
            <%
                if (request.getAttribute("filmId") == null && request.getParameter("filmId") == null) {
                    response.sendRedirect("/film-lovers/search/film");
                }
            %>

            <label for="imageLink">Image Link:</label>
            <input type="text" id="imageLink" name="imageLink" required pattern="(http(s?):)([/|.|\w|\s|-])*\.(?:jpg|gif|png)"><br>

            <label for="title">Title:</label>
            <input type="text" id="title" name="img-title"><br>
            <input type="hidden" name="action" value="add-photo">
            <c:if test="${sessionScope.authentication.role eq 'user'}">
                <button type="submit" class="btn btn-primary">Submit</button>
            </c:if>
        </form>
        <c:if test="${sessionScope.authentication.role eq 'admin'}">
            <form action="contribute-check" method="POST">
                <input type="hidden" name="filmId" value="${requestScope.video.film_id}">
                <input type="hidden" name="videoId" value="${requestScope.video.id}">
                <input type="hidden" value="approve-video" name="action">
                <input type="submit" value="Approve">
            </form>
            <form action="contribute-check" method="POST">
                <input type="hidden" name="filmId" value="${requestScope.video.film_id}">
                <input type="hidden" name="videoId" value="${requestScope.video.id}">
                <input type="hidden" value="reject-video" name="action">
                <input type="submit" value="Reject" name="action">
            </form>
        </c:if>

    </body>
</html>

