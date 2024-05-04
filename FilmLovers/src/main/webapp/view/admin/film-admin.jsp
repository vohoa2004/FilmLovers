<%-- 
    Document   : film-admin
    Created on : Feb 22, 2024, 4:40:48 PM
    Author     : vothimaihoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                <th>name</th>
                <th>type</th>
                <th>release year</th>
                <th>cover photo</th>
            </tr>
            <c:forEach items="${requestScope.filmList}" var="film">
                <tr>
                    <td>${film.title}</td>
                    <td>${film.type}</td>
                    <td>${film.releaseYear}</td>
                    <td><img src="${film.photo}" width="100" height="100"></td>
                </tr>
            </c:forEach>
        </table>
        <button><a href="/film-lovers/admin/film?action=add">Add New Film</a></button>
    </body>
</html>

