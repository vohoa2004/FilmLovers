<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- CSS -->
        <link rel="stylesheet" href="/film-lovers/view/admin/css/bootstrap-reboot.min.css">
        <link rel="stylesheet" href="/film-lovers/view/admin/css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="/film-lovers/view/admin/css/magnific-popup.css">
        <link rel="stylesheet" href="/film-lovers/view/admin/css/select2.min.css">
        <link rel="stylesheet" href="/film-lovers/view/admin/css/admin.css">

        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">

        <!-- Favicons -->
        <link rel="icon" type="image/png" href="icon/favicon-32x32.png" sizes="32x32">
        <link rel="apple-touch-icon" href="icon/favicon-32x32.png">

        <meta name="description" content="">
        <meta name="keywords" content="">
        <title>Check Video Contribution</title>

    </head>

    <body>
        <!-- header -->
        <header class="header">
            <div class="header__content">
                <!-- header logo -->
                <a href="#" class="header__logo">
                    <img src="img/logo.svg" alt="">
                </a>
                <!-- end header logo -->

                <!-- header menu btn -->
                <button class="header__btn" type="button">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
                <!-- end header menu btn -->
            </div>
        </header>
        <!-- end header -->

        <!-- sidebar - copy tu listOfAllMovies sau-->
        <div class="sidebar">
            <!-- sidebar logo -->
            <a href="#" class="sidebar__logo">
                <p>Film Lovers</p>
            </a>
            <!-- end sidebar logo -->

            <!-- sidebar user -->
            <div class="sidebar__user">
                <div class="sidebar__user-img">
                    <a href="#">
                        <img src="img/user.svg" alt="">
                    </a>
                </div>

                <div class="sidebar__user-title">
                    <span>Admin</span>
                    <p>John Doe</p>
                </div>

                <a href="#" class="sidebar__user-btn" type="button">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path
                        d="M4,12a1,1,0,0,0,1,1h7.59l-2.3,2.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l4-4a1,1,0,0,0,.21-.33,1,1,0,0,0,0-.76,1,1,0,0,0-.21-.33l-4-4a1,1,0,1,0-1.42,1.42L12.59,11H5A1,1,0,0,0,4,12ZM17,2H7A3,3,0,0,0,4,5V8A1,1,0,0,0,6,8V5A1,1,0,0,1,7,4H17a1,1,0,0,1,1,1V19a1,1,0,0,1-1,1H7a1,1,0,0,1-1-1V16a1,1,0,0,0-2,0v3a3,3,0,0,0,3,3H17a3,3,0,0,0,3-3V5A3,3,0,0,0,17,2Z" />
                    </svg>
                </a>
            </div>
            <!-- end sidebar user -->

            <!-- sidebar nav -->

            <!-- Movie Database collapse -->
            <li class="sidebar__nav-item">
                <a class="sidebar__nav-link collapsed" data-toggle="collapse" href="#collapseMenu" role="button"
                   aria-expanded="false" aria-controls="collapseMenu"><svg xmlns="http://www.w3.org/2000/svg"
                                                                        viewBox="0 0 24 24">
                    <path
                        d="M19,5.5H12.72l-.32-1a3,3,0,0,0-2.84-2H5a3,3,0,0,0-3,3v13a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V8.5A3,3,0,0,0,19,5.5Zm1,13a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V5.5a1,1,0,0,1,1-1H9.56a1,1,0,0,1,.95.68l.54,1.64A1,1,0,0,0,12,7.5h7a1,1,0,0,1,1,1Z">
                    </path>
                    </svg> <span>Movie Database</span> <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path
                        d="M17,9.17a1,1,0,0,0-1.41,0L12,12.71,8.46,9.17a1,1,0,0,0-1.41,0,1,1,0,0,0,0,1.42l4.24,4.24a1,1,0,0,0,1.42,0L17,10.59A1,1,0,0,0,17,9.17Z">
                    </path>
                    </svg></a>

                <ul class="sidebar__menu collapse" id="collapseMenu" style="">
                    <li><a href="#">Add titles</a></li>
                    <li><a href="#">Add a new movie/ TV Show</a></li>
                </ul>
            </li>
            <!-- end collapse -->


            <li class="sidebar__nav-item"> <!-- user -->
                <a href="#" class="sidebar__nav-link"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path
                        d="M12.3,12.22A4.92,4.92,0,0,0,14,8.5a5,5,0,0,0-10,0,4.92,4.92,0,0,0,1.7,3.72A8,8,0,0,0,1,19.5a1,1,0,0,0,2,0,6,6,0,0,1,12,0,1,1,0,0,0,2,0A8,8,0,0,0,12.3,12.22ZM9,11.5a3,3,0,1,1,3-3A3,3,0,0,1,9,11.5Zm9.74.32A5,5,0,0,0,15,3.5a1,1,0,0,0,0,2,3,3,0,0,1,3,3,3,3,0,0,1-1.5,2.59,1,1,0,0,0-.5.84,1,1,0,0,0,.45.86l.39.26.13.07a7,7,0,0,1,4,6.38,1,1,0,0,0,2,0A9,9,0,0,0,18.74,11.82Z" />
                    </svg> <span>Users</span></a>
            </li>

            <!-- Review collapse -->
            <li class="sidebar__nav-item">
                <a class="sidebar__nav-link collapsed" data-toggle="collapse" href="#ReviewCollapseMenu" role="button"
                   aria-expanded="false" aria-controls="collapseMenu"><svg xmlns="http://www.w3.org/2000/svg"
                                                                        viewBox="0 0 24 24">
                    <path
                        d="M19,5.5H12.72l-.32-1a3,3,0,0,0-2.84-2H5a3,3,0,0,0-3,3v13a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V8.5A3,3,0,0,0,19,5.5Zm1,13a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V5.5a1,1,0,0,1,1-1H9.56a1,1,0,0,1,.95.68l.54,1.64A1,1,0,0,0,12,7.5h7a1,1,0,0,1,1,1Z">
                    </path>
                    </svg> <span>Review</span> <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path
                        d="M17,9.17a1,1,0,0,0-1.41,0L12,12.71,8.46,9.17a1,1,0,0,0-1.41,0,1,1,0,0,0,0,1.42l4.24,4.24a1,1,0,0,0,1.42,0L17,10.59A1,1,0,0,0,17,9.17Z">
                    </path>
                    </svg></a>

                <ul class="sidebar__menu collapse" id="ReviewCollapseMenu" style="">
                    <li><a href="#">All reviews</a></li>
                    <li><a href="#">Reported reviews</a></li>
                </ul>
            </li>
            <!-- end collapse -->


            <li class="sidebar__nav-item"> <!-- Link "Back to Film Lover" -->
                <a href="#" class="sidebar__nav-link"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path
                        d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z" />
                    </svg> <span>Back to Film Lovers</span></a>
            </li>
        </ul>
        <!-- end sidebar nav -->


    </div>
    <!-- end sidebar -->


    <!-- main content -->
    <main class="main">
        <div class="container-fluid">
            <div class="row">
                <!-- main title -->
                <div class="col-12">
                    <div class="main__title">
                        <h2>Check Video Contribution</h2>
                    </div>
                </div>
                <!-- end main title -->

                <!-- form -->
                <div class="col-12 report">
                    <form class="form">
                        <input type="hidden" name="title" value="${param.title}">
                        <input type="hidden" name="filmId" value="${param.filmId}">
                        <%
                            if (request.getAttribute("filmId") == null && request.getParameter("filmId") == null) {
                                response.sendRedirect("/film-lovers/search/film");
                            }
                        %>
                        <div class="row">
                            <div class="col-12">
                                <div class="row reported-form-content">
                                    <%--<div class="col-6">
                                        <p>Title: <a href="">The Road Home</a></p>
                                        <!-- <div class="form__group">
                                            <input type="text" name="movie_title" class="form__input" value="cuckoo" readonly>
                                        </div> -->
                                    </div>--%>

                                    <div class="col-12">
                                        <p>Youtube URL: </p>
                                        <div class="form__group">
                                            <input type="text" class="form__input" id="url" name="url" readonly value="${requestScope.video.url}" pattern="http(?:s)?:\/\/(?:m\.)?(?:www\.)?youtu(?:\.be\/|(?:be-nocookie|be)\.com\/(?:watch|[\w]+\?(?:feature=[\w]+.[\w]+\&)?v=|v\/|e\/|embed\/|live\/|shorts\/|user\/(?:[\w#]+\/)+))([^&#?\n]+)">
                                        </div>
                                    </div>

                                    <div class="col-12 reviewed-by-username">
                                        <p>Contributed by <a href="/film-lovers/admin?action=users&id=${requestScope.video.accountId}">${requestScope.video.accountId}</a></p>
                                    </div>



                                    <div class="col-6">
                                        <p>Video information: </p>
                                        <div class="form__group">
                                            <br>
                                            <label style="color: whitesmoke">Title:</label>
                                            <input type="text" name="video-title" class="form__input" readonly value="${requestScope.video.title}">
                                        </div>
                                        <div class="form__group">
                                            <br>
                                            <label style="color: whitesmoke">Type: </label>
                                            <input type="text" class="form__input" name="type" readonly value="${requestScope.video.type}">

                                        </div>

                                    </div>
                                </div>        
                            </div>

                            <!--                            <div class="col-12 reportFormBtn">
                                                            <input type="submit" class="form__btn" value="approved">                               
                                                            <input type="submit" class="form__btn" value="rejected">
                                                        </div>-->
                        </div>
                    </form>
                </div>
                <!-- end form -->
                <div class="col-12 reportFormBtn">
                    <form action="contribute-check" method="POST">
                        <input type="hidden" name="filmId" value="${requestScope.video.film_id}">
                        <input type="hidden" name="videoId" value="${requestScope.video.id}">
                        <input type="hidden" value="approve-video" name="action">
                        <input type="submit" class="form__btn" value="Approve">
                    </form>
                    <form action="contribute-check" method="POST">
                        <input type="hidden" name="filmId" value="${requestScope.video.film_id}">
                        <input type="hidden" name="videoId" value="${requestScope.video.id}">
                        <input type="hidden" value="reject-video" name="action">
                        <input type="submit" class="form__btn" value="Reject" name="action">
                    </form>
                </div>
            </div>
        </div>
    </main>
    <!-- end main content -->

    <!-- JS -->
    <script src="/film-lovers/view/admin/js/jquery-3.5.1.min.js"></script>
    <script src="/film-lovers/view/admin/js/bootstrap.bundle.min.js"></script>
    <script src="/film-lovers/view/admin/js/jquery.magnific-popup.min.js"></script>
    <script src="/film-lovers/view/admin/js/smooth-scrollbar.js"></script>
    <script src="/film-lovers/view/admin/js/select2.min.js"></script>
    <script src="/film-lovers/view/admin/js/admin.js"></script>
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