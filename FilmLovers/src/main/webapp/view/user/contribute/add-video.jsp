<%-- 
    Document   : add-video
    Created on : Mar 17, 2024, 10:39:32 PM
    Author     : vothimaihoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="/view/user/Component/header/Header.jsp"/>
        <div class="container">
            <br><br><br>
            <h1>Contribute video for <span class="text-warning">${param.title}</span></h1>

            <form action="contribute" method="POST">
                <input type="hidden" name="title" value="${param.title}">
                <input type="hidden" name="filmId" value="${param.filmId}">
                <%
                    if (request.getAttribute("filmId") == null && request.getParameter("filmId") == null) {
                        response.sendRedirect("/film-lovers/search/film");
                    }
                %>
                <div class="form-group">
                    <label for="url">Youtube URL:</label>
                    <input type="text" class="form-control" id="url" name="url" required value="${requestScope.video.url}" pattern="http(?:s)?:\/\/(?:m\.)?(?:www\.)?youtu(?:\.be\/|(?:be-nocookie|be)\.com\/(?:watch|[\w]+\?(?:feature=[\w]+.[\w]+\&)?v=|v\/|e\/|embed\/|live\/|shorts\/|user\/(?:[\w#]+\/)+))([^&#?\n]+)">
                </div>
                <div class="form-group" id="videoContainer">
                    <!-- Video will be displayed here -->
                </div>
                <c:if test="${requestScope.invalidMsg != null}">
                    ${requestScope.invalidMsg}
                </c:if>


                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" class="form-control" id="title" name="video-title" required value="${requestScope.video.title}">
                </div>

                <div class="form-group">
                    <label for="type">Type:</label>
                    <select class="form-control" id="type" name="type" required>
                        <option value=""></option>
                        <option value="trailer" <c:choose><c:when test="${not empty requestScope.video && requestScope.video.type eq 'trailer'}">selected</c:when></c:choose>>Trailer</option>
                        <option value="teaser" <c:choose><c:when test="${not empty requestScope.video && requestScope.video.type eq 'teaser'}">selected</c:when></c:choose>>Teaser</option>
                        <option value="scene" <c:choose><c:when test="${not empty requestScope.video && requestScope.video.type eq 'scene'}">selected</c:when></c:choose>>Scene</option>
                        <option value="interview" <c:choose><c:when test="${not empty requestScope.video && requestScope.video.type eq 'interview'}">selected</c:when></c:choose>>Interview</option>
                        <option value="bts" <c:choose><c:when test="${not empty requestScope.video && requestScope.video.type eq 'bts'}">selected</c:when></c:choose>>Behind the Scenes</option>
                            </select>
                        </div>


                        <input type="hidden" name="action" value="add-video">

                <c:if test="${requestScope.previousAction ne 'check'}">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </c:if>
            </form>
            <c:if test="${requestScope.previousAction eq 'check'}">
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
        </div>
        <br><br><br>
        <jsp:include page="/view/user/Component/footer/Footer.jsp" flush="true" />
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            document.getElementById("url").onclick = function () {
                var url = document.getElementById("url").value;
                var videoContainer = document.getElementById("videoContainer");

                // Regex to extract YouTube video ID from URL
                var regex = /(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/;

                var match = url.match(regex);
                if (match) {
                    var videoId = match[1];
                    var embedCode = '<iframe width="560" height="315" src="https://www.youtube.com/embed/' + videoId + '" frameborder="0" allowfullscreen></iframe>';
                    videoContainer.innerHTML = embedCode;
                } else if (url !== null && url !== '') {
                    videoContainer.innerHTML = "Invalid YouTube URL";
                }
            };
        </script>
    </body>
</html>
