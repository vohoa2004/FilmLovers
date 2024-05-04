<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contribute Page</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Custom CSS -->
        <style>
            /* Add custom styles here */
        </style>
    </head>
    <body>
        <jsp:include page="/view/user/Component/header/Header.jsp"/>
        <div class="container">
            <c:if test="${sessionScope.authentication.role eq 'user'}">
            <h1 class="mt-5" style="text-align: center">Contribute Page</h1>
            </c:if>
            <c:if test="${sessionScope.authentication.role eq 'admin'}">
            <h1 class="mt-5" style="text-align: center">Edit Page</h1>
            </c:if>
            
            <br><br><br>
            <div class="row mt-3">
                <div class="col-md-3">
                    <a href="/film-lovers/contribute?action=add-film" class="btn btn-primary btn-block">Add New Film</a>
                </div>
                
                <div class="col-md-3">
                    <a href="/film-lovers/contribute?action=add-genre&filmId=${param.filmId}&title=${param.title}" class="btn btn-primary btn-block">Add Genre</a>
                </div>
                
                <div class="col-md-3">
                    <a href="/film-lovers/contribute?action=add-photo&filmId=${param.filmId}&title=${param.title}" class="btn btn-primary btn-block">Add Photo</a>
                </div>
                <div class="col-md-3">
                    <a href="/film-lovers/contribute?action=add-video&filmId=${param.filmId}&title=${param.title}" class="btn btn-primary btn-block">Add Video</a>
                </div>
            </div>
            <br><br><br>
            <div class="row mt-3">
                <div class="col-md-12">
                    <c:if test="${not empty requestScope.message}">
                        <div class="alert alert-primary" role="alert">
                            ${requestScope.message}
                        </div>
                    </c:if>
                </div>
            </div>
            <br><br><br>
        </div>
        <jsp:include page="/view/user/Component/footer/Footer.jsp" flush="true" />
        <!-- Bootstrap JS and jQuery (optional) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
