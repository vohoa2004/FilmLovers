<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="filmlovers.model.Review.ReviewDTO"%>
<%@page import="filmlovers.model.Film.FilmDTO"%>
<%@page import="filmlovers.model.Rating.RatingDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="/film-lovers/view/user/viewProfile/editProfile.css" />
        <title>User Profile</title>
        <style>
            .ur_list_container {
                width: 100%;
                min-height: 200px;
                border-radius: 20px;
                background: #e6e6e6;
                padding-left: 20px;
                padding-top: 20px;
                padding-right: 20px;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/view/user/Component/header/Header.jsp" />

        <div class="container">
            <div class="" style="display: flex; justify-content: space-between">
                <div class="" style="width: 65%">
                    <div class="title">
                        <div style="margin-bottom: 30px">
                            <div class="avt">
                                <img
                                    src="${requestScope.user.imageURL}"
                                    width="100%"
                                    height="100%"
                                    alt=""
                                    />
                            </div>
                            <div style="display: flex; margin-top: 10px">
                                <div class="film_lover_img">
                                    <img
                                        width="100%"
                                        height="100%"
                                        style="border-radius: 100%"
                                        src="/film-lovers/view/user/assets/film_lover.jpg"
                                        alt=""
                                        />
                                </div>
                                <div class="film_lover_content">
                                    <div>FilmLover Member</div>
                                    <div class="duration">4 weeks</div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="srn">${requestScope.user.firstName} ${requestScope.user.lastName}</div>
                            <div class="intro">FilmLover ${requestScope.user.role}</div>
                            <a href="update-info?action=edit-info" class="edit_profile">Edit profile</a>
                        </div>
                    </div>
                    <div class="edit_left">
                        <div>
                            <div>
                                <div class="ur_rating">Your ratings</div>
                                <div class="ur_rating_content">Most Recently Rated</div>
                            </div>
                        </div>
                        <div class="bio_container">
                            <div class="bio_title">
                                <% List<RatingDTO> ratingList = (List<RatingDTO>) request.getAttribute("ratingList");
                                    if (ratingList == null || ratingList.isEmpty()) {
                                %>
                                <div>You haven't rate any film yet!<br><a href="film">Explore more at Film Lovers</a></div>
                                    <%  } else {
                                        int loop = ratingList.size() > 4 ? 4 : ratingList.size();
                                        for (int i = 0; i < loop; i++) {
                                            FilmDTO film = ratingList.get(i).getFilm();%>
                                <div class="img_film">
                                    <a href="film-detail?id=<%= film.getId()%>"><img
                                            src="<%= film.getPhoto()%>"
                                            style="border-radius: 10px"
                                            width="100%"
                                            height="100%"
                                            alt=""
                                            /></a>
                                    <div><%= film.getTitle()%></div>
                                    <div class="rating_in_profile">
                                        <img src="/film-lovers/view/user/assets/star_blue.png" alt="" /><%= ratingList.get(i).getScore()%>
                                    </div>
                                </div>
                                <% }
                                    } %>
                            </div>
                        </div>

                        <div class="see_all_ratings">
                            <a href="">See all ? ratings</a>
                        </div>
                    </div>
                    <div class="ur_list_container"> <!--style bi de?-->
                        <div
                            style="
                            padding-bottom: 40px;
                            border-bottom: 1px solid;
                            "
                            >
                            <div
                                style="
                                display: flex;
                                justify-content: space-between;
                                align-items: center;

                                "
                                >
                                <div class="ur_rating">Your Lists</div>

                            </div>
                            <c:forEach items="${requestScope.playlists}" var="p">
                                <div class="ur_list_content">
                                    <div class="ur_list_content_right">
                                        <div>
                                            <div class="title_list_film"><a href="watchlist?action=viewOnePlaylist&playlistID=${p.id}&filmID=0">${p.name}</a></div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="ur_list_container">
                        <div>
                            <div class="ur_rating">From Your Watchlist</div>
                        </div>
                        <div class="ur_list_container">
                            <c:if test="${requestScope.favFilms != null}">
                            <c:forEach items="${requestScope.favFilms}" var="f">
                                <div class="img_film">
                                    <img
                                        src="${f.photo}"
                                        style="border-radius: 10px"
                                        width="100%"
                                        height="100%"
                                        alt=""
                                        />
                                    <div>${f.title}</div>
                                </div>

                            </c:forEach>
                            </c:if>

                        </div>
                        <button class="see_more">
                            See more
                            <span style="padding-left: 5px"
                                  ><img src="/film-lovers/view/user/assets/arrow_next.png" alt=""
                                  /></span>
                        </button>
                    </div>
                    <div class="your_review_container">
                        <div
                            style="
                            display: flex;
                            align-items: center;
                            justify-content: space-between;
                            "
                            >
                            <div class="ur_rv">Your Reviews</div>
                            <div class="see_other">
                                <a href="review?action=user-review">See other reviews <img src="/film-lovers/view/user/assets/arrow_next.png" alt="" /></a>
                            </div>
                        </div>
                        <%
                            if (ratingList == null || ratingList.isEmpty()) {
                        %>
                        <div>You haven't review any film yet! <br><a href="film">Explore more at FilmLovers</a></div>
                            <%  } else {
                                ReviewDTO review = ratingList.get(0).getReview();
                            %>        
                        <div
                            class="ur_rv_in_profile"
                            style="display: flex; align-items: center"
                            >
                            <img src="/film-lovers/view/user/assets/star_yellow.png" alt="" />
                            <span style="font-weight: 700"><%= ratingList.get(0).getScore()%>/</span>10
                        </div>
                        <div class="rv_heading"><%= review.getTitle()%></div>
                        <div class="rv_heading_content">
                            <div class="rv_heading_name"><%= review.getFilmTitle()%></div>
                            <div class="rv_heading_duration"><%= review.getSendDate()%></div>
                        </div>
                        <div class="rv_content">
                            <%= review.getContent()%>
                        </div>
                        <button class="see_full_rv">
                            See full review <img src="/film-lovers/view/user/assets/arrow_down.png" alt="" />
                        </button>
                        <% }%>
                    </div>
                </div>
                <div class="edit_right">
                    <div class="ql_container">
                        <div class="quick_list_title">Quick List</div>
                        <div style="display: flex">
                            <div class="ql_content_container">
                                <div class="quick_list_content">Edit profile</div>
                                <div class="quick_list_content">Watchlist</div>
                            </div>
                            <div class="ql_content_container">
                                <div class="quick_list_content">Reviews</div>
                                <div class="quick_list_content">Ratings</div>
                            </div>
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
        </div>
        <!--        <div class="recently_container">
                    <div class="recently_top">
                        <div class="recently_title">Recently Viewed</div>
                        <div class="clear_history">clear your history</div>
                    </div>
                    <div class="slider-container">
                        <button class="scroll-btn left" data-target="recentView">&lt;</button>
                          
                        <div class="recent_view" id="recentView">
                            <div class="div_items_trending">
                                <div class="items_trending">
                                    <img
                                        src="/film-lovers/view/user/assets/mai_teaser.jpg"
                                        width="169px"
                                        height="240px"
                                        style="border-radius: 10px"
                                        />
                                    <div class="star_rating">
                                        <div class="rating">8.1</div>
                                    </div>
                                </div>
                                <div class="item_name">Name</div>
                                <div class="item_type_and_year">Type</div>
                                <div class="item_type_and_year">Year</div>
                            </div>
                        </div>
                          
                        <button class="scroll-btn right" data-target="recentView">&gt;</button>
                    </div>
                </div>-->
        <br><br>
        <jsp:include page="/view/user/Component/footer/Footer.jsp" />
        <script src="/film-lovers/view/user/viewProfile/editProfile.js"></script>
    </body>
</html>
