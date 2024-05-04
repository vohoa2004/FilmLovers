<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="view/user/landing/landing.js" type="text/javascript"></script>
        <link rel="stylesheet" href="/film-lovers/view/user/landing/landing.css" />
        <title>Landing</title>
    </head>

    <body>
        <jsp:include page="/view/user/Component/header/Header.jsp" />
        <div>
            <!----------------------------------------------------------------------------------------------------------------------->
            <div class="banner">
                <div class="banner_content">
                    <h1>Film Lovers</h1>
                    <p>Upon the seventh form of art, where our passion ....</p>
                    <div class="search_banner">
                        <form action="search/film"><input name="title" type="text"
                                                          placeholder="Search for movie, TV show, celebrity..." class="search_input" />
                            <button type="submit" class="search_button"></button>
                        </form>
                    </div>
                </div>
            </div>
            <!----------------------------------------------------------------------------------------------------------------------->
            <div class="outside_trending">
                <div class="trending">
                    <div class="trending_content">Trending</div>                            
                    <div class="line"></div>
                    <a href="./search/film" class="see_more">See More</a>
                </div>
                <!----------------------------------------------------------------------------------------------------------------------->
                <div class="trending-main-box">
                    <!-- today -->
                    <div class="slider-container">
                        <!-- <button class="scroll-btn left" data-target="trendingTodayBox">
                                            &lt;
                                        </button> -->
                        <div class="trending-second-box active" id="trendingTodayBox">
                            <!--  -->
                            <c:forEach var="film" items="${requestScope.todayList}">
                                <div class="div_items_trending">
                                    <a href="./film-detail?id=${film.id}">
                                        <div class="items_trending">
                                            <img src="${film.photo}" width="169" height="240"
                                                 style="border-radius: 10px" />
<!--                                            <div class="star_rating">
                                                <div class="rating"><c:if test="${requestScope.film.avgRating != 0}">${film.avgRating}</c:if></div> average film rating
                                            </div>-->
                                        </div>
                                        <div class="item_name">${film.title}</div>
                                        <div class="item_type_and_year">${film.type}</div>
                                        <div class="item_type_and_year">${film.releaseYear}</div>
                                    </a>

                                </div>
                            </c:forEach>

                        </div>

                    </div>
                    <!----------------------------------------------------------------------------------------------------------------------->

                </div>
            </div>
            <!----------------------------------------------------------------------------------------------------------------------->
            <!-- sssss -->
            <div class="lastest_trailer">
                <div class="trending_trailer">
                    <div class="trending_content_trailer">Lastest Trailer</div>
                    <div class="line_trailer"></div>
                </div>
                <div class="slider-container">
                    <button class="scroll-btn left" data-target="trailerFlex">
                        &lt;
                    </button>
                    <div class="trailer_flex" id="trailerFlex">
                        <!--  -->
                        
                        <!--  -->
                        <c:forEach items="${requestScope.videos}" var="video">
                            <div class="trailer_flex_item">
                                <iframe width="350" height="240" src="${video.url}" 
                                        title="YouTube video player" frameborder="0" 
                                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                                        allowfullscreen>
                                </iframe>
                            </div>

                        </c:forEach>
                    </div>
                    <button class="scroll-btn right" data-target="trailerFlex">
                        &gt;
                    </button>
                </div>
            </div>
            <!----------------------------------------------------------------------------------------------------------------------->
            <div class="outside_trending">
                <div class="trending">
                    <div class="trending_content">Movie</div>
                    <div class="different_line"></div>
                    <a href="./search/film?type=movie" class="see_more">See More</a>
                </div>
                <div class="slider-container">
                    <div class="outside_trending_container">
                        <!--                        <button class="scroll-btn left" data-target="outsideTrendingItem">
                                            &lt;
                                        </button> -->


                        <c:forEach var="film" items="${requestScope.randomMovieList}">
                            <div class="outside_trending_item" id="outsideTrendingItem">
                                <div class="div_items_trending">
                                    <a href="./film-detail?id=${film.id}">
                                        <div class="items_trending">
                                            <img src="${film.photo}" width="169px" height="240px"
                                                 style="border-radius: 10px" />
<!--                                            <div class="star_rating">
                                                <div class="rating"><c:if test="${requestScope.film.avgRating != 0}">${film.avgRating}</c:if></div> average film rating
                                            </div>-->
                                        </div>
                                        <div class="item_name">${film.title}</div>
                                        <div class="item_type_and_year">${film.type}</div>
                                        <div class="item_type_and_year">${film.releaseYear}</div>
                                    </a>
                                </div>
                            </div>

                        </c:forEach>

                        <!--                        <button class="scroll-btn right" data-target="outsideTrendingItem">
                                            &gt;
                                        </button> -->
                    </div>
                </div>
            </div>
            <!----------------------------------------------------------------------------------------------------------------------->

            <div class="outside_trending">
                <div class="trending">
                    <div class="trending_content">TV Series</div>
                    <div class="different_line"></div>
                    <a href="./search/film?type=series" class="see_more">See More</a>
                </div>
                <div class="slider-container">
                    <div class="outside_trending_container">
                        <!--<button class="scroll-btn left" data-target="tvSeries">&lt;</button>-->

                        <c:forEach var="film" items="${requestScope.randomSeriesList}">
                            <div class="outside_trending_item" id="tvSeries">

                                <div class="div_items_trending">
                                    <a href="./film-detail?id=${film.id}">
                                        <div class="items_trending">
                                            <img src="${film.photo}" width="169px" height="240px"
                                                 style="border-radius: 10px" />
<!--                                            <div class="star_rating">
                                                <div class="rating"><c:if test="${requestScope.film.avgRating != 0}">${film.avgRating}</c:if></div> average film rating
                                            </div>-->
                                        </div>
                                        <div class="item_name">${film.title}</div>
                                        <div class="item_type_and_year">${film.type}</div>
                                        <div class="item_type_and_year">${film.releaseYear}</div>
                                    </a>
                                </div>
                            </div>

                        </c:forEach>

                        <!--                         <button class="scroll-btn right" data-target="tvSeries">
                                          &gt;
                                        </button> -->
                    </div>
                </div>
            </div>
            <!----------------------------------------------------------------------------------------------------------------------->


            <div class="outside_trending">
                <div class="trending">
                    <div class="fyw">From your watching</div>
                    <div class="line_fyw"></div>
                    <a href="" class="see_more">See More</a> <!--link to watch list-->
                </div>
                <c:if test="${sessionScope.authentication == null}">
                    <div class="flex_login">
                        <div class="login_to_have">Login to have your own Watchlist</div>
                        <div class="save_shows">
                            Save shows and movies to keep track of what you want to watch.
                        </div>
                        <a href="login"><button class="login_btn_landing">Login for more access</button>
                        </a>
                    </div>
                </c:if>
            </div>

            <jsp:include page="/view/user/Component/footer/Footer.jsp" />
    </body>

</html>