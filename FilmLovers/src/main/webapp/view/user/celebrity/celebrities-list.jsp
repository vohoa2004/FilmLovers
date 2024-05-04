<%-- 
    Document   : celebrities-list
    Created on : Mar 1, 2024, 5:17:36 PM
    Author     : vothimaihoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Celebrity Page</title>
        
    </head>
    <body>
        <h1>Celebrity List</h1>
        <c:forEach items="${requestScope.list}" var="p">
            <img src="${p.imageLink}" alt="celebrity image"/>
            <p>${p.firstName} ${p.lastName}</p>
        </c:forEach>
    </body>
</html>
