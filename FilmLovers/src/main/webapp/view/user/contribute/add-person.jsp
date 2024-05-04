<%-- 
    Document   : add-person
    Created on : Mar 17, 2024, 10:39:51 PM
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
        <h1>Contribute Person Information</h1>
        <form action="contribute" method="POST">
            <label for="firstname">First Name:</label>
            <input type="text" id="firstname" name="firstname" required><br>

            <label for="lastname">Last Name:</label>
            <input type="text" id="lastname" name="lastname" required><br>

            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select><br>

            <label for="imageLink">Image Link:</label>
            <input type="text" id="imageLink" name="imageLink"><br>

            <label for="dateOfBirth">Date of Birth:</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth"><br>

            <label for="shortBio">Short Bio:</label><br>
            <textarea id="shortBio" name="shortBio" rows="4" cols="50"></textarea><br>
            <input type="hidden" name="action" value="add-person">

            <button type="submit">Submit</button>
        </form>

    </body>
</html>
