<%-- 
    Document   : video-contribution
    Created on : Mar 19, 2024, 9:07:35 AM
    Author     : vothimaihoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <table>
                <tr>
                    <th>no</th>
                    <th>film</th>
                    <th>video</th>
                    <th>contribute date</th>
                    <th>account</th>
                    <th>action</th>
                </tr>
                <c:set var="count" value="${0}"></c:set>
                <c:forEach items="${requestScope.list}" var="video">
                    <c:set var="count" value="${count + 1}"></c:set>
                        <tr>
                            <td>${count}</td>
                        <td><a href="/film-lovers/film-detail?id=${video.film_id}">Link to film</a></td>
                        <td><a href="${video.url}">Link to video</a></td>
                        <td>${video.sendAt}</td>
                        <td>${video.accountId}</td>
                        <td><a href="contribute-check?action=add-video&id=${video.id}">Check</a></td>
                    </tr>
                </c:forEach>
            </table>
    </body>
</html>
