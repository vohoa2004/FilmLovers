<%@page import="filmlovers.model.Rating.RatingDTO"%>
<%@page import="filmlovers.model.Review.ReviewDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="/film-lovers/view/user/accountReview/userReview.css" />
        <title>User Review</title>
    </head>
    <body>
        <jsp:include page="/view/user/Component/header/Header.jsp" />
        <div class="body_container">
            <div class="container_left">
                <div class="introduct_container">
                    <div class="film_img">
                        <img
                            src="/film-lovers/view/user/assets/mai_teaser.jpg"
                            width="100%"
                            height="100%"
                            style="border-radius: 10px"
                            alt=""
                            />
                    </div>
                    <div>
                        <form>
                            <div class="user_reviews_film">User Reviews</div>
                            <a href="update-info?action=get-info" class="add_ur_rv"><< Back to your profile</a>                                
                        </form>
                    </div>
                </div>
                <%
                    List<RatingDTO> reviewList = (List<RatingDTO>) request.getAttribute("reviewList");
                    if (reviewList == null || reviewList.isEmpty()) {
                %>
                <div class="rv_heading" >You haven't made any review! <br> 
                    <a href="film">
                         Explore more at FilmLovers! </a></div>    
                <%  } else {%>
                
                    <div style="margin-top: 50px">
                    <div>
                        <span class="count_rv"><%= reviewList.size()%> Reviews</span>
                    </div>
                    <div class="filter_review">
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
                                src="/film-lovers/view/user/assets/Swap_btn.png"
                                style="margin-left: 10px"
                                alt=""
                                />
                        </div>
                    </div>
                    <%
                        for (RatingDTO review : reviewList) {
                    %>
                    <div class="review_1">
                        <div class="review_1_container">
                            <div class="rating_user_container">
                                <p style="color:#B31313; font-weight: bold;"><%= review.getFilm().getTitle() %></p>
                                <div style="justify-content: flex-end">
                                <img src="/film-lovers/view/user/assets/star_yellow.png" alt="" />
                                <span class="rating_user">   <%= review.getScore()%></span>/10
                                </div>
                            </div>
                            <div class="rv_heading"><%= review.getReview().getTitle()%></div>
                            <div class="rv_on_date">
                                <div class="name_user_rv"> <%= review.getReview().getUsername()%></div>
                                <div class="date_rv"><%= review.getReview().getSendDate() == null ? "" : review.getReview().getSendDate()%></div>
                            </div>
                            
                            <%  if (review.getReview().isSpoiler()) {  %>
                            <button style="color:red;font-weight: bold;" onclick="spoilers(<%= review.getReview().getId()%>)" >Warning: Spoilers</button>
                            <div class="comment_of_user" id="<%= review.getReview().getId()%>" style="display: none">
                                <% } else {  %>
                                <div class="comment_of_user" id="<%= review.getReview().getId()%>"> <%  } %>
                                    <%= review.getReview().getContent()%>
                                </div>
                                <!--                            <button class="see_more_rv">
                                                                See more <img src="/film-lovers/view/user/assets/dropdown_brown.png" alt="" />
                                                            </button>-->
                            </div>
                            <div class="like_rp">
                                <div class="like_dislike">
                                    <div style="display: flex; align-items: center">
                                        <div><img src="/film-lovers/view/user/assets/like.png" alt="" /></div>
                                        <div style="padding-left: 10px">helpful 136</div>
                                    </div>
                                    <div style="display: flex; align-items: center">
                                        <div>
                                            <img src="/film-lovers/view/user/assets/dislike.png" alt="" />
                                        </div>
                                        <div style="padding-left: 10px">12</div>
                                    </div>
                                </div>
                                <div><img src="/film-lovers/view/user/assets/flag.png" alt="" /></div>
                            </div>
                        </div>
                        <%  }  %>
                    </div>
                    <% } %>
                </div>
                <div class="container_right">
                    <div class="ql_container">
                        <div class="quick_list_title">Quick List</div>
                        <div style="display: flex">
                            <div class="ql_content_container">
                                <div class="quick_list_content">Edit profile</div>
                                <div class="quick_list_content">Ratings</div>
                                <div class="quick_list_content">Watchlist</div>
                            </div>
                            <div class="ql_content_container">
                                <div class="quick_list_content">Delete account</div>
                                <div class="quick_list_content">Reviews</div>
                                <div class="quick_list_content">Lists</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="recently_container">
                <div class="recently_top">
                    <div class="recently_title">Recently Viewed</div>
                    <div class="clear_history">clear your history</div>
                </div>
                <div class="slider-container">
                    <button class="scroll-btn left" data-target="recentView">&lt;</button>
                    <!--  -->
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
                    <!--  -->
                    <button class="scroll-btn right" data-target="recentView">&gt;</button>
                </div>
            </div>
            <jsp:include page="/view/user/Component/footer/Footer.jsp" />

            <script src="/film-lovers/view/user/accountReview/userReview.js"></script>

    </body>
</html>
