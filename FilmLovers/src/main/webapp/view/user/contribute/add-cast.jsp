<%-- 
    Document   : add-cast
    Created on : Mar 17, 2024, 10:39:40 PM
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
        <h1>Contribute Cast</h1>
        <form action="contribute" method="POST">
            <label for="filmId">Film ID:</label>
            <input type="text" id="filmId" name="filmId" required><br>

            <label for="personId">Person ID:</label>
            <input type="text" id="personId" name="personId" required><br>

            <label for="character">Character:</label>
            <input type="text" id="character" name="character" required><br>
            <input type="hidden" name="action" value="add-cast">

            <button type="submit">Submit</button>
        </form>

    </body>
</html>
