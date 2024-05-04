<%@page import="filmlovers.model.Rating.RatingDTO"%>
<%@page import="filmlovers.model.Review.ReviewDTO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="/film-lovers/view/user/popup/addReview/addReview.css" />
        <title>Document</title>
    </head>
    <body>
        <div class="add_rv_container">
            <div class="close_btn">
                <img src="../../assets/close_btn.png" alt="" />
            </div>
            <div class="add_rv_header">
                <div class="title_left">
                    <div>
                        <img
                            src="${requestScope.film.photo}"
                            width="200"
                            height="300"
                            style="border-radius: 10px"
                            alt=""
                            />
                    </div>
                    <div>
                        <div><span class="rv_name">${requestScope.film.title}</span> (${requestScope.film.releaseYear})</div>
                        <div class="add_ur_rv_title">Add your review</div>
                    </div>
                </div>
                <div class="user_rv_guideline">
                    User review guideline
                    <div class="ask">?</div>
                </div>
            </div>
            <%
                RatingDTO review = (RatingDTO) request.getAttribute("review");
            %>
            <form action="review?action=update-review" method="POST">
            <div class="ur_rating_container">
                <div class="ur_rating_title">Your Rating</div>
                <div class="star_rating_rv">
                    <%-- for (int i = 0; i < review.getScore(); i++) {
                            %>
                    <img src="/film-lovers/view/user/assets/star_yellow.png" alt="" />                    
                    <%
                            
                        }
                        for (int i = review.getScore(); i < 10; i++) {
                                %>
                    <img src="/film-lovers/view/user/assets/start_yellow_none_bg.png" alt="" />
                    
                    <%
                                
                            }
                    --%>

                    <div class="num_rating"><input type="text" value="<%= review.getScore() %>" name="score">/10</div>
                </div>
            </div>


            <div>Your Review</div>
            
                <div>
                    <input
                        type="text"
                        class="inp_rv"
                        placeholder="Write a headline for your review here"
                        name="title"
                        value="<%= review.getReview().getTitle() == null ? "" : review.getReview().getTitle()%>"
                        id=""
                        />
                </div>
                <textarea
                    name="content"
                    id="rv_content"
                    class="textarea_rv"
                    placeholder="Write your review here..."
                    oninput="charCount()"
                    ><%= review.getReview().getContent() == null ? "" : review.getReview().getContent()%></textarea>
                <div class="option_rv">
                    <div class="max_text">
                        Required characters: <span style="color: #b31313" id="charCount">100</span>
                    </div>
                    <div class="yn_ques_container">
                        <div style="display: flex">
                            Does this review contain spoilers?
                            <div class="ask">?</div>
                        </div>
                        <div class="yn_ans">
                            <div><input type="radio" name="spoilers" 
                                        id="" value="1" <% if (review.getReview().isSpoiler()) {%>checked<%} %> />Yes</div>
                            <div><input type="radio" name="spoilers" 
                                        id="" value="0" <% if (!review.getReview().isSpoiler()) {%>checked<%}%>/>No</div>
                        </div>
                    </div>
                </div>
                        <input type="hidden" name="film-id" value="${requestScope.film.id}">
                        <input type="hidden" name="account-id" value="${sessionScope.authentication.id}">
                <input type="submit" value="Submit Review" class="submit_rv_btn" id="submit_review">
            </form>
            <div class="rule">
                I agree to the <a href=""> Conditions of Use.</a> The data I'm submitting is
                true and not copyrighted by a third party.
            </div>
        </div>
    </body>
    <script>
        function charCount() {
            var content = document.getElementById("rv_content").value.length;
            var charLeft = 100 - content;
            if (charLeft > 0) {
                document.getElementById("charCount").innerHTML = charLeft;
            } else if (charLeft <= 0) {
                document.getElementById("charCount").innerHTML = 0;
            }
            var btn = document.getElementById("submit_review");
            if (charLeft > 0) {
                btn.disabled = true;
            } else {
                btn.disabled = false;
            }
        }


    </script>
</html>
