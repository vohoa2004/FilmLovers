<%@page import="filmlovers.model.Rating.RatingDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="/film-lovers/view/user/film-detail/film-detail.css" />
        <title>Film Detail</title>

    </head>
    <body>
        <jsp:include page="/view/user/Component/header/Header.jsp" flush="true" />

        <div class="banner_pd text-dark" >
            <div class="banner_pd_container">
                <div class="image_product">
                    <img
                        src="${requestScope.film.photo}"
                        width="272"
                        height="381"
                        style="border-radius: 10px"
                        />
                </div>
                <div class="banner_pd_content">
                    <div class="film_name">${requestScope.film.title} (${requestScope.film.releaseYear})</div>
                    <div class="type_genre">
                        <div class="type">${requestScope.film.type}</div>
                        <%--query genres of this film--%>

                        <c:forEach items="${requestScope.genres}" var="genre"> 
                            <div class="genre">${genre}</div>
                            <div class="dot"></div>
                        </c:forEach>
                    </div>

                    <div class="contact_film">
                        <div class="contact_film_content">
                            <a href="review?film-id=${requestScope.film.id}&action=film-review" class="top_cast mar_bot">
                                <div class="contact_content_header">User rating</div>
                                <div class="icon_text">
                                    <img src="/film-lovers/view/user/assets/star_yellow.png" alt="" />
                                    <%--query rating of this film--%>
                                    <div class="text_content"><c:if test="${requestScope.film.avgRating != 0}">${requestScope.film.avgRating}</c:if></div>
                                    </div>
                                </a>
                            </div>
                            <div class="contact_film_content">
                            <%--query rating of current account film--%>
                            <div class="contact_content_header">Your rating</div>
                            <div class="icon_text">
                                <img src="/film-lovers/view/user/assets/start_yellow_none_bg.png" alt="" />
                                <div class="text_content"><a href="review?action=add-review&film-id=${requestScope.film.id}&account-id=${sessionScope.authentication.id}">RATE</a></div>
                            </div>
                        </div>
                        <div class="">
                            <div class="contact_content_header">Watchlist</div>
                            <div class="icon_text">
                                <img src="/film-lovers/view/user/assets/watchlist.png" alt="" />
                                <div class="text_content"><a href="/film-lovers/watchlist?action=choosePlaylist&filmID=${requestScope.film.id}">ADD</a></div>
                            </div>
                        </div>
                        <div class="">
                            <c:if test="${sessionScope.authentication.role eq 'user'}">
                                <div class="contact_content_header">Contribute</div>
                                <div class="icon_text">
                                    <form action="contribute" method="POST">
                                        <input type="hidden" name="filmId" value="${requestScope.film.id}">
                                        <input type="hidden" name="title" value="${requestScope.film.title}">
                                        <button type="submit"><img width="35" src="/film-lovers/view/user/assets/edit-button.png" alt="" /></button>
                                    </form>
                                    <div class="text_content"></div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.authentication.role eq 'admin'}">
                                <div class="contact_content_header">Edit</div>
                                <div class="icon_text">
                                    <form action="admin/film?action=update" method="POST">
                                        <input type="hidden" name="filmId" value="${requestScope.film.id}">
                                        <input type="hidden" name="title" value="${requestScope.film.title}">
                                        <button type="submit"><img width="35" src="/film-lovers/view/user/assets/edit-button.png" alt="" /></button>
                                    </form>
                                    <div class="text_content"></div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <div class="overview_creator">
                        <div class="overview_container">
                            <div class="overview">Overview</div>
                            <div class="overview_content">
                                ${requestScope.film.description}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="body_product_detail">
            <div class="body_product_detail_left">
                <div class="top_cast_container">
                    <div class="top_cast">Top Cast</div>
                    <div class="line"></div>
                    <a href="film-detail?id=${requestScope.film.id}&action=cast" class="all_cast">All cast & crew</a>
                </div>
                <div class="slider-container">
                    <!-- <button class="scroll-btn left" data-target="topCast">&lt;</button> -->
                    <div class="top_cast_content" id="topCast">
                        <!--  -->
                        <c:forEach items="${requestScope.cast}" var="c">
                            <div class="actor_review">
                                <a href="#">
                                    <div class="circle_red"><img src="${c.imageLink}" width="101" height="101" border-radius="50px"/></div>
                                    <div class="actor">${c.firstName} ${c.lastName}</div>
                                    <div class="role">${c.character}</div>
                                </a>
                            </div>
                        </c:forEach>

                        <!--  -->
                    </div>

                </div>
                <div class="top_cast_container">
                    <div class="top_cast">Storyline </div>
                    <div class="line_lastest_season"></div>
                </div>
                <div class="lastest_season_content">
                    <div class="lastest_season_content_right">
                        <div class="season_text" style="margin-right: 22px">
                            ${requestScope.film.storyLine}
                        </div>
                    </div>
                </div>
                <div class="top_cast_container">
                    <div class="top_cast">Photo</div>
                    <div class="line_Photo"></div>
                    <a href="film-detail?id=${requestScope.film.id}&action=photo" class="all_cast">View All</a>
                </div>
                <div class="slider-container">

                    <div class="photo_container" id="photoContainer">
                        <c:forEach items="${requestScope.photos}" var="photo">
                            <div class="photo_content"><img src="${photo.imageLink}" class="photo_content"/></div>

                        </c:forEach>
                    </div>

                </div>

                <div class="top_cast_container">
                    <div class="top_cast">Video</div>
                    <div class="line_Photo"></div>
                    <a href="film-detail?id=${requestScope.film.id}&action=video" class="all_cast">View All</a>
                </div>
                <div class="slider-container">
                    <button class="scroll-btn left" data-target="trailerFlex">
                        &lt;
                    </button>
                    <div class="photo_container" id="photoContainer2">
                        <c:forEach items="${requestScope.videos}" var="video">
                            <div>
                                <iframe width="560" height="315" src="${video.url}" 
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
                <div class="top_cast_container">
                    <a href="review?film-id=${requestScope.film.id}&action=film-review" class="top_cast mar_bot">Review</a>
                    <div class="line_review"></div>
                    <a href="review?action=add-review&film-id=${requestScope.film.id}&account-id=${sessionScope.authentication.id}" class="review_content">+ Add review</a>
                </div>

                <div class="review_container">

                    <%
                        RatingDTO review = (RatingDTO) request.getAttribute("review");
                        if (review != null) {
                    %>

                    <div class="review_container_children">
                        <div class="review_header">
                            <div class="review_heading_text"><%= review.getReview().getTitle()%></div>
                            <div style="display: flex; align-items: center">
                                <div>
                                    <img
                                        src="/film-lovers/view/user/assets/star_yellow.png"
                                        style="width: 20px; height: 20px"
                                        alt=""
                                        />
                                </div>
                                <div class="star_rating_header"><%= review.getScore()%>/ 10</div>
                            </div>
                        </div>
                        <div style="font-style: italic;"><%= review.getReview().getUsername()%></div>
                        <div class="review_content_children">
                            <%= review.getReview().getContent()%>
                        </div>
                    </div>
                    <br><br>


                    <%
                    } else {
                    %>
                    <div class="rv_heading" >No review is made on this Film. <br> Be the first reviewer!</div>
                        <%
                            }
                        %>

                </div>
                <div class="top_cast_container">
                    <div class="top_cast mar_bot">More like this</div>
                    <div class="line_more_like"></div>
                </div>
                <div class="slider-container">
                    <button class="scroll-btn left" data-target="trend2">&lt;</button>
                    <!--  -->
                    <div class="trending-second-box" id="trend2">
                        <div class="div_items_trending">
                            <div class="items_trending">
                                <img
                                    src="/film-lovers/view/user/assets/mai_teaser.jpg"
                                    width="169"
                                    height="240"
                                    style="border-radius: 10px"
                                    />
                                <div class="star_rating">
                                    <div class="rating">8.1</div>
                                </div>
                            </div>
                            <div class="item_name">Name in week</div>
                            <div class="item_type_and_year">Type in week</div>
                            <div class="item_type_and_year">Year in week</div>
                        </div>
                    </div>
                </div>
            </div>
            <!--            </div>-->
            <div class="body_product_detail_right_container">
                <div class="body_product_detail_right">
                    <div class="body_product_detail_right_children">
                        <div class="sns">
                            <div class="sns_text">SNS</div>
                            <div class="sns_image">
                                <img src="/film-lovers/view/user/assets/X.png" alt="" />
                                <img src="/film-lovers/view/user/assets/insta.png" alt="" />
                                <img src="/film-lovers/view/user/assets/share.png" alt="" />
                            </div>
                        </div>
                        <div class="stream">
                            <div class="sns_text">Stream</div>
                            <div class="sns_image">
                                <img src="/film-lovers/view/user/assets/netflix.png" alt="" />
                                <img src="/film-lovers/view/user/assets/stream_2.png" alt="" />
                                <img src="/film-lovers/view/user/assets/apple_tv.png" alt="" />
                            </div>
                        </div>
                        <div class="container_sns_stream">
                            <div class="title_sns_stream">Status</div>
                            <div class="content_sns_stream">${requestScope.film.releaseStatus}</div>
                        </div>
                        <div class="container_sns_stream">
                            <div class="title_sns_stream">Duration</div>
                            <div class="content_sns_stream">${requestScope.film.runtime} minutes</div>
                        </div>
                        <div class="container_sns_stream">
                            <div class="title_sns_stream">Original language</div>
                            <div class="content_sns_stream">${requestScope.film.language}</div> <%--Change to full language--%>
                        </div>
                        <div class="container_sns_stream">
                            <div class="title_sns_stream">Production company</div>
                            <div class="content_sns_stream">Netflix</div>
                        </div>
                        <div class="container_sns_stream">
                            <div class="title_sns_stream">Release</div>
                            <div class="content_sns_stream">${requestScope.film.releaseMonth} / ${requestScope.film.releaseYear}</div>
                        </div>
                            <a href="watchlist?action=choosePlaylist&filmID=${requestScope.film.id}"><button class="add_to_watch">+ Add to Watchlist</button></a>
                    </div>
                </div>
                <div class="share_page">
                    <div class="share_page_text">Share this page:</div>
                    <div class="share_page_img">
                        <img src="/film-lovers/view/user/assets/twitter_white.png" alt="" />
                        <img src="/film-lovers/view/user/assets/insta.png" alt="" />
                        <img src="/film-lovers/view/user/assets/share.png" alt="" />
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/view/user/Component/footer/Footer.jsp" />
        <script src="/film-lovers/view/user/film-detail/film-detail.js">

        </script>
    </body>
</html>
