<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <meta name="author" content="Dmitry Volkov">
        <title>All Titles</title>
    </head>

    <body>
        <!-- header -->
        <header class="header">
            <div class="header__content">
                <!-- header logo -->
                <a href="#" class="header__logo">
                    <img src="/film-lovers/view/admin/img/logo.svg" alt="">
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

        <!-- sidebar -->
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
                        <img src="/film-lovers/view/admin/img/user.svg" alt="">
                    </a>
                </div>

                <div class="sidebar__user-title">
                    <span>Admin</span>
                    <p>${sessionScope.authentication.lastName}</p>
                </div>

                <a href="/film-lovers/login-admin?action=logout" class="sidebar__user-btn" type="button">
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
                    <li><a href="/film-lovers/admin/film">All titles</a></li>
                    <li><a href="/film-lovers/admin/contribute-check">Film Contribution List</a></li>
                    <li><a href="/film-lovers/admin/contribute-check?action=list-video">Video Contribution List</a></li>
                    <li><a href="/film-lovers/admin/film?action=add">Add a new movie/ TV Show</a></li>
                </ul>
            </li>
            <!-- end collapse -->


             <li class="sidebar__nav-item"> <!-- user -->
                <a href="/film-lovers/admin/user" class="sidebar__nav-link"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
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
                <a href="/film-lovers/film" class="sidebar__nav-link"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path
                        d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z" />
                    </svg> <span>Back to Film Lovers</span></a>
            </li>
        </ul>
        <!-- end sidebar nav -->

        <!-- sidebar copyright -->
        <!--<div class="sidebar__copyright">© FlixTV.template, 2021. <br>Create by <a-->
        <!--href="https://themeforest.net/user/dmitryvolkov/portfolio" target="_blank">Dmitry Volkov</a></div>-->
        <!-- end sidebar copyright -->
    </div>
    <!-- end sidebar -->

    <!-- main content -->
    <main class="main">
        <div class="container-fluid">
            <div class="row">
                <!-- main title -->
                <div class="col-12">
                    <div class="main__title">
                        <h2>MOVIE DATABASE</h2>

                        <!--<span class="main__title-stat">14 452 total</span>-->

                        <div class="main__title-wrap">
                            <!-- filter sort -->
                            <div class="filter" id="filter__sort">
                                <span class="filter__item-label">Sort by:</span>

                                <div class="filter__item-btn dropdown-toggle" role="navigation" id="filter-sort"
                                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <input type="button" value="Date created">
                                    <span></span>
                                </div>

                                <ul class="filter__item-menu dropdown-menu scrollbar-dropdown"
                                    aria-labelledby="filter-sort">
                                    <li>Date created</li>
                                    <li>Rating</li>
                                    <li>Views</li>
                                </ul>
                            </div>
                            <!-- end filter sort -->
                            <!-- FILTER -->
                            <div class="filter-dropdown">
                                <p onclick="myFilterFunction()" class="filter-dropbtn sidebar__nav-link">Filter by<span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M17,9.17a1,1,0,0,0-1.41,0L12,12.71,8.46,9.17a1,1,0,0,0-1.41,0,1,1,0,0,0,0,1.42l4.24,4.24a1,1,0,0,0,1.42,0L17,10.59A1,1,0,0,0,17,9.17Z"></path></svg></span>
                                </p>
                                <div id="myDropdown" class="filter-dropdown-content">
                                    <form>
                                        <p>Status</p> 
                                        <div class="filterOption">
                                            <input type="checkbox" id="approved" name="approved" value="approved">
                                            <label for="approved"> Approved</label>
                                        </div>
                                        <div class="filterOption">
                                            <input type="checkbox" id="rejected" name="rejected" value="rejected">
                                            <label for="rejected"> Rejected</label> 
                                        </div>
                                        <div class="filterOption">
                                            <input type="checkbox" id="unread" name="unread" value="unread">
                                            <label for="unread"> Unread</label>
                                        </div>
                                        <input type="submit" value="Apply" class="applyBtn">
                                    </form>
                                </div>
                            </div>
                            <!-- end FILTER -->
                            <!-- search -->
                            <form action="#" class="main__title-form">
                                <input type="text" placeholder="Find movie / tv series..">
                                <button type="button">
                                    <svg width="18" height="18" viewBox="0 0 18 18" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                    <circle cx="8.25998" cy="8.25995" r="7.48191" stroke="#2F80ED"
                                            stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></circle>
                                    <path d="M13.4637 13.8523L16.3971 16.778" stroke="#2F80ED" stroke-width="1.5"
                                          stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </button>
                            </form>
                            <!-- end search -->
                        </div>
                    </div>
                </div>
                <!-- end main title -->

                <!-- users -->
                <div class="col-12">
                    <div class="main__table-wrap">
                        <table class="main__table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>TITLE</th>
                                    <th>CATEGORY</th>
                                    <th>RATING</th>
                                    <!--<th>VIEWS</th>-->
                                    <th>DATE ADDED</th>
                                    <th>STATUS</th>
                                    <th>ACTIONS</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${requestScope.filmList}" var="film">
                                    <tr class="clickable-row" data-href="/film-lovers/film-detail?id=${film.id}">

                                        <td>
                                            <div class="main__table-text">${film.id}</div>
                                        </td>

                                        <td>
                                            <div class="main__table-text">${film.title}</div>
                                        </td>

                                        <td>
                                            <div class="main__table-text">${film.type}</div>
                                        </td>

                                        <td>
                                            <div class="main__table-text main__table-text--rate"><svg
                                                    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path
                                                    d="M22,9.67A1,1,0,0,0,21.14,9l-5.69-.83L12.9,3a1,1,0,0,0-1.8,0L8.55,8.16,2.86,9a1,1,0,0,0-.81.68,1,1,0,0,0,.25,1l4.13,4-1,5.68A1,1,0,0,0,6.9,21.44L12,18.77l5.1,2.67a.93.93,0,0,0,.46.12,1,1,0,0,0,.59-.19,1,1,0,0,0,.4-1l-1-5.68,4.13-4A1,1,0,0,0,22,9.67Zm-6.15,4a1,1,0,0,0-.29.88l.72,4.2-3.76-2a1.06,1.06,0,0,0-.94,0l-3.76,2,.72-4.2a1,1,0,0,0-.29-.88l-3-3,4.21-.61a1,1,0,0,0,.76-.55L12,5.7l1.88,3.82a1,1,0,0,0,.76.55l4.21.61Z" />
                                                </svg> ${film.avgRating}</div>
                                        </td>

                                        <!--                                        <td>
                                                                                    <div class="main__table-text">1392</div>
                                                                                </td>-->

                                        <td>
                                            <div class="main__table-text">${film.addDate}</div>
                                        </td>

                                        <td>
                                            <div class="main__table-text main__table-text--green">Visible</div>
                                        </td>

                                        <td>
                                            <div class="main__table-btns">
                                                <a href="#modal-status"
                                                   class="main__table-btn main__table-btn--banned open-modal">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                    <path
                                                        d="M12,13a1.49,1.49,0,0,0-1,2.61V17a1,1,0,0,0,2,0V15.61A1.49,1.49,0,0,0,12,13Zm5-4V7A5,5,0,0,0,7,7V9a3,3,0,0,0-3,3v7a3,3,0,0,0,3,3H17a3,3,0,0,0,3-3V12A3,3,0,0,0,17,9ZM9,7a3,3,0,0,1,6,0V9H9Zm9,12a1,1,0,0,1-1,1H7a1,1,0,0,1-1-1V12a1,1,0,0,1,1-1H17a1,1,0,0,1,1,1Z" />
                                                    </svg>
                                                </a>
                                                <a href="#" class="main__table-btn main__table-btn--view">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                    <path
                                                        d="M21.92,11.6C19.9,6.91,16.1,4,12,4S4.1,6.91,2.08,11.6a1,1,0,0,0,0,.8C4.1,17.09,7.9,20,12,20s7.9-2.91,9.92-7.6A1,1,0,0,0,21.92,11.6ZM12,18c-3.17,0-6.17-2.29-7.9-6C5.83,8.29,8.83,6,12,6s6.17,2.29,7.9,6C18.17,15.71,15.17,18,12,18ZM12,8a4,4,0,1,0,4,4A4,4,0,0,0,12,8Zm0,6a2,2,0,1,1,2-2A2,2,0,0,1,12,14Z" />
                                                    </svg>
                                                </a>
                                                <!--                                                <a href="#" class="main__table-btn main__table-btn--edit">
                                                                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                                                                    <path
                                                                                                        d="M22,7.24a1,1,0,0,0-.29-.71L17.47,2.29A1,1,0,0,0,16.76,2a1,1,0,0,0-.71.29L13.22,5.12h0L2.29,16.05a1,1,0,0,0-.29.71V21a1,1,0,0,0,1,1H7.24A1,1,0,0,0,8,21.71L18.87,10.78h0L21.71,8a1.19,1.19,0,0,0,.22-.33,1,1,0,0,0,0-.24.7.7,0,0,0,0-.14ZM6.83,20H4V17.17l9.93-9.93,2.83,2.83ZM18.17,8.66,15.34,5.83l1.42-1.41,2.82,2.82Z" />
                                                                                                    </svg>
                                                                                                </a>-->
                                                <a href="#modal-delete"
                                                   class="main__table-btn main__table-btn--delete open-modal">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                    <path
                                                        d="M10,18a1,1,0,0,0,1-1V11a1,1,0,0,0-2,0v6A1,1,0,0,0,10,18ZM20,6H16V5a3,3,0,0,0-3-3H11A3,3,0,0,0,8,5V6H4A1,1,0,0,0,4,8H5V19a3,3,0,0,0,3,3h8a3,3,0,0,0,3-3V8h1a1,1,0,0,0,0-2ZM10,5a1,1,0,0,1,1-1h2a1,1,0,0,1,1,1V6H10Zm7,14a1,1,0,0,1-1,1H8a1,1,0,0,1-1-1V8H17Zm-3-1a1,1,0,0,0,1-1V11a1,1,0,0,0-2,0v6A1,1,0,0,0,14,18Z" />
                                                    </svg>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- end users -->

                <!-- paginator -->
                <div class="col-12">
                    <div class="paginator">
                        <ul class="paginator__paginator">
                            <c:if test="${requestScope.currentPage ne 1}">
                                <li>
                                    <a href="/film-lovers/admin/film?page=${requestScope.currentPage - 1}">
                                        <svg width="14" height="11" viewBox="0 0 14 11" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                        <path d="M0.75 5.36475L13.1992 5.36475" stroke-width="1.2"
                                              stroke-linecap="round" stroke-linejoin="round"></path>
                                        <path d="M5.771 10.1271L0.749878 5.36496L5.771 0.602051" stroke-width="1.2"
                                              stroke-linecap="round" stroke-linejoin="round"></path>
                                        </svg>
                                    </a>
                                </li>
                            </c:if>
                            <p>${requestScope.lastPage}</p>
                            <c:forEach begin="1" end="${requestScope.lastPage}" var="i" step="1">
                                <li <c:if test="${requestScope.currentPage eq i}">class="active"</c:if>><a href="/film-lovers/admin/film?page=${i}">${i}</a></li>
                                </c:forEach>
                                <c:if test="${requestScope.currentPage ne requestScope.lastPage}">
                                <li>
                                    <a href="/film-lovers/admin/film?page=${requestScope.currentPage + 1}">
                                        <svg width="14" height="11" viewBox="0 0 14 11" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                        <path d="M13.1992 5.3645L0.75 5.3645" stroke-width="1.2" stroke-linecap="round"
                                              stroke-linejoin="round"></path>
                                        <path d="M8.17822 0.602051L13.1993 5.36417L8.17822 10.1271" stroke-width="1.2"
                                              stroke-linecap="round" stroke-linejoin="round"></path>
                                        </svg>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <!-- end paginator -->
            </div>
        </div>
    </main>
    <!-- end main content -->

    <!-- modal status -->
    <div id="modal-status" class="zoom-anim-dialog mfp-hide modal">
        <h6 class="modal__title">Status change</h6>

        <p class="modal__text">Are you sure about immediately change status?</p>

        <div class="modal__btns">
            <button class="modal__btn modal__btn--apply" type="button">Apply</button>
            <button class="modal__btn modal__btn--dismiss" type="button">Dismiss</button>
        </div>
    </div>
    <!-- end modal status -->

    <!-- modal delete -->
    <div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
        <h6 class="modal__title">Item delete</h6>

        <p class="modal__text">Are you sure to permanently delete this item?</p>

        <div class="modal__btns">
            <button class="modal__btn modal__btn--apply" type="button">Delete</button>
            <button class="modal__btn modal__btn--dismiss" type="button">Dismiss</button>
        </div>
    </div>
    <!-- end modal delete -->

    <!-- JS -->
    <script src="/film-lovers/view/admin/js/jquery-3.5.1.min.js"></script>
    <script src="/film-lovers/view/admin/js/bootstrap.bundle.min.js"></script>
    <script src="/film-lovers/view/admin/js/jquery.magnific-popup.min.js"></script>
    <script src="/film-lovers/view/admin/js/smooth-scrollbar.js"></script>
    <script src="/film-lovers/view/admin/js/select2.min.js"></script>
    <script src="/film-lovers/view/admin/js/admin.js"></script>
</body>

</html>