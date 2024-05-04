<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./editProfile.css" />
    <title>Edit Profile</title>
  </head>
  <body>
    <div class="container">
      <div class="" style="display: flex; justify-content: space-between">
        <div class="" style="width: 65%">
          <div class="title">
            <div style="margin-bottom: 30px">
              <div class="avt">
                <img
                  src="../assets/avt_profile.jpg"
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
                    src="../assets/film_lover.jpg"
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
              <div class="srn">SomeRandomName</div>
              <div class="intro">FilmLover member since January 2024</div>
              <a href="" class="edit_profile">Edit profile</a>
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
                <div class="img_film">
                  <img
                    src="../assets/mai_teaser.jpg"
                    style="border-radius: 10px"
                    width="100%"
                    height="100%"
                    alt=""
                  />
                  <div>The office</div>
                  <div class="rating_in_profile">
                    <img src="../assets/star_blue.png" alt="" />10
                  </div>
                </div>
                <div class="img_film">
                  <img
                    src="../assets/mai_teaser.jpg"
                    style="border-radius: 10px"
                    width="100%"
                    height="100%"
                    alt=""
                  />
                  <div>Young Sheldon</div>
                  <div class="rating_in_profile">
                    <img src="../assets/star_blue.png" alt="" />10
                  </div>
                </div>
              </div>
            </div>

            <div class="see_all_ratings">
              <a href="">See all ? ratings</a>
            </div>
          </div>
          <div class="ur_list_container">
            <div
              style="
                padding-bottom: 40px;
                height: auto;
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
                <div class="create_list">
                  Create a List
                  <img src="../assets/arrow_next.png" alt="" />
                </div>
              </div>
              <div class="ur_list_content">
                <div>
                  <img
                    src="../assets/film_list.png"
                    width="125px"
                    height="125px"
                    alt=""
                  />
                </div>
                <div class="ur_list_content_right">
                  <div>
                    <div class="title_list_film">Tittle</div>
                    <div>number or titles | Private</div>
                  </div>
                  <div class="dropdown">
                    <img src="../assets/dot_option.png" alt="" />
                    <div class="dropdown-content">
                      <button class="btn_option" href="">Edit</button>
                      <button class="btn_option" href="">
                        Delete this list
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="ur_list_content">
                <div>
                  <img
                    src="../assets/film_list.png"
                    width="125px"
                    height="125px"
                    alt=""
                  />
                </div>
                <div class="ur_list_content_right">
                  <div>
                    <div class="title_list_film">Tittle</div>
                    <div>number or titles | Private</div>
                  </div>
                  <div class="dropdown">
                    <img src="../assets/dot_option.png" alt="" />
                    <div class="dropdown-content">
                      <button class="btn_option" href="">Edit</button>
                      <button class="btn_option" href="">
                        Delete this list
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <button class="see_more">
              See more
              <span style="padding-left: 5px"
                ><img src="../assets/arrow_next.png" alt=""
              /></span>
            </button>
          </div>
          <div class="ur_list_container">
            <div style="height: auto">
              <div>
                <div class="ur_rating">Your Watchlist</div>
              </div>
              <div class="bio_container">
                <div class="bio_title">
                  <div class="img_film">
                    <img
                      src="../assets/mai_teaser.jpg"
                      style="border-radius: 10px"
                      width="100%"
                      height="100%"
                      alt=""
                    />
                    <div>The office</div>
                    <div class="rating_in_profile">
                      <img src="../assets/star_blue.png" alt="" />10
                    </div>
                  </div>
                  <div class="img_film">
                    <img
                      src="../assets/mai_teaser.jpg"
                      style="border-radius: 10px"
                      width="100%"
                      height="100%"
                      alt=""
                    />
                    <div>Young Sheldon</div>
                    <div class="rating_in_profile">
                      <img src="../assets/star_blue.png" alt="" />10
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <button class="see_more">
              See more
              <span style="padding-left: 5px"
                ><img src="../assets/arrow_next.png" alt=""
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
                See other reviews <img src="../assets/arrow_next.png" alt="" />
              </div>
            </div>
            <div
              class="ur_rv_in_profile"
              style="display: flex; align-items: center"
            >
              <img src="../assets/star_yellow.png" alt="" />
              <span style="font-weight: 700">4.6/</span>10
            </div>
            <div class="rv_heading">Review heading</div>
            <div class="rv_heading_content">
              <div class="rv_heading_name">Little Miss Sunshine</div>
              <div class="rv_heading_duration">19 Aug 2022</div>
            </div>
            <div class="rv_content">
              Sed ut perspiciatis unde omnis iste natus error sit voluptatem
              accusantium doloremque laudantium, totam rem aperiam, eaque ipsa
              quae ab illo inventore veritatis et quasi architecto beatae vitae
              dicta sunt explicabo.
            </div>
            <button class="see_full_rv">
              See full review <img src="../assets/arrow_down.png" alt="" />
            </button>
          </div>
        </div>
        <div class="edit_right">
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
          <div class="share_page">
            <div class="share_page_text">Share this page:</div>
            <div class="share_page_img">
              <img src="../assets/twitter_white.png" alt="" />
              <img src="../assets/insta.png" alt="" />
              <img src="../assets/share.png" alt="" />
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
                src="../assets/mai_teaser.jpg"
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
    <script src="./editProfile.js"></script>
  </body>
</html>
