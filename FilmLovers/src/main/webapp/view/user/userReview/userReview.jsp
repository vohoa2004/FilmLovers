<%@page import="filmlovers.model.Rating.RatingDTO"%>
<%@page import="filmlovers.model.Review.ReviewDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="/film-lovers/view/user/userReview/userReview.css" />
        <title>User Review</title>
    </head>
    <body>
        <jsp:include page="/view/user/Component/header/Header.jsp" />
        <div class="body_container">
            <div class="container_left">
                <div class="introduct_container">
                    <div class="film_img">
                        <a href="/film-lovers/film-detail?id=${requestScope.film.id}">
                            <img
                                src="${requestScope.film.photo}"
                                width="100%"
                                height="100%"
                                style="border-radius: 10px"
                                alt=""
                                />
                        </a>
                    </div>
                    <div>
                        <form>
                            <div class=""><span class="film_name">${requestScope.film.title}</span> (${requestScope.film.releaseYear})</div>
                            <div class="user_reviews_film">User Reviews</div>
                            <%   if (session.getAttribute("authentication") != null) {  %>
                            <a href="review?action=add-review&film-id=${requestScope.film.id}&account-id=${sessionScope.authentication.id}" class="add_ur_rv">+ Add your review</a>                                
                            <%   } else {   %>
                            <a href="login" class="add_ur_rv">+ Your review</a>                                
                            <%   }  %>
                        </form>
                    </div>
                </div>
                <%
                    List<RatingDTO> reviewList = (List<RatingDTO>) request.getAttribute("reviewList");
                    if (reviewList == null || reviewList.isEmpty()) {
                %>
                <div class="rv_heading" >No review is made on this Film. <br> 
                    <% if (session.getAttribute("authentication") == null) { %> <a href="login">   
                        <% } else {  %>  <a href="review?action=add-review&film-id=${requestScope.film.id}&account-id=${sessionScope.authentication.id}">
                            <% } %>  Be the first reviewer! </a></div>    
                            <%  } else {%>

                <div style="margin-top: 50px">
                    <div>
                        <span class="count_rv"><%= reviewList.size()%> Reviews</span>
                    </div>
<!--                    <div class="filter_review">
                        <div class="text_filter">
                            <input type="checkbox" name="hide-spoilers" value="true" />Hide Spoilers
                        </div>
                        <div style="display: flex; align-items: center">
                            <div class="text_filter">Filter by Rating:</div>
                            <select class="option_cus" name="" id="">
                                <option value="">Show all</option>
                            </select>
                        </div>
                        <div class="" style="display: flex; align-items: center">
                            <div class="text_filter">Sort by:</div>
                            <select class="option_cus" name="" id="">
                                <option class="featured" value="">Featured</option>
                            </select>
                            <img
                                src="/film-lovers/view/user/assets/assets/Swap_btn.png"
                                style="margin-left: 10px"
                                alt=""
                                />
                        </div>
                    </div>-->
                    <%
                        for (RatingDTO review : reviewList) {
                    %>
                    <div class="review_1">
                        <div class="review_1_container">
                            <div class="rating_user_container">
                                <img src="/film-lovers/view/user/assets/assets/star_yellow.png" alt="" />
                                <span class="rating_user"><%= review.getScore()%></span>/10
                            </div>
                            <div class="rv_heading"><%= review.getReview().getTitle()%></div>
                            <div class="rv_on_date">
                                <div class="name_user_rv"> <%= review.getReview().getUsername()%></div>
                                <div class="date_rv"><%= review.getReview().getSendDate() == null ? "" : review.getReview().getSendDate()%></div>
                            </div>

                            <%  if (review.getReview().isSpoiler()) {%>
                            <button style="color:red;font-weight: bold;" onclick="spoilers(<%= review.getReview().getId()%>)" >Warning: Spoilers</button>
                            <div class="comment_of_user" id="<%= review.getReview().getId()%>" style="display: none">
                                <% } else {%>
                                <div class="comment_of_user" id="<%= review.getReview().getId()%>"> <%  }%>
                                    <%= review.getReview().getContent()%>
                                </div>
                                <!--                            <button class="see_more_rv">
                                                                See more <img src="/film-lovers/view/user/assets/assets/dropdown_brown.png" alt="" />
                                                            </button>-->
                            </div>
                            <!--                            <div class="like_rp">
                                                            <div class="like_dislike">
                                                                <div style="display: flex; align-items: center">
                                                                    <div><img src="/film-lovers/view/user/assets/assets/like.png" alt="" /></div>
                                                                    <div style="padding-left: 10px">helpful 136</div>
                                                                </div>
                                                                <div style="display: flex; align-items: center">
                                                                    <div>
                                                                        <img src="/film-lovers/view/user/assets/assets/dislike.png" alt="" />
                                                                    </div>
                                                                    <div style="padding-left: 10px">12</div>
                                                                </div>
                                                            </div>
                                                            <div><img src="/film-lovers/view/user/assets/assets/flag.png" alt="" /></div>
                                                        </div>-->
                        </div>
                        <%  }  %>
                    </div>
                    <% }%>
                </div>
                <div class="container_right">
                    <div class="demo_film">
                        <div class="name_demo">Name</div>
                        <div class="container_demo">
                            <div class="title_demo">Details</div>
                            <div class="content_demo">Full Cast and Crew</div>
                        </div>
                        <div class="container_demo">
                            <div class="title_demo">Photo & Video</div>
                            <div class="content_demo">Photo Gallery</div>
                            <div class="content_demo">Trailers and Videos</div>
                        </div>
                        <div class="container_demo">
                            <div class="title_demo">Opinion</div>
                            <div class="content_demo">User Reviews</div>
                        </div>
                        <div class="show_less">
                            <img src="/film-lovers/view/user/assets/assets/arrow_up.png" alt="" />Show less
                        </div>
                    </div>
                </div>
            </div>
            <!--            <div class="recently_container">
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
                                                src="/film-lovers/view/user/assets/assets/mai_teaser.jpg"
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

            <script src="/film-lovers/view/user/userReview/userReview.js"></script>

    </body>
</html>
