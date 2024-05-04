<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/film-lovers/view/user/editProfile/editProfileDetail.css" />
    <title>Edit Profile</title>
  </head>
  <body>
    <div class="container">
      <div class="" style="display: flex; justify-content: space-between">
        <div class="" style="width: 65%">
          <div class="title">Edit Profile</div>
          <div class="edit_left">
            <div class="edit_user_id">
              <div>
                <div class="user_id">Email</div>
                <div class="user_name">hihi@gmail.com</div>
              </div>
            </div>
            <div class="edit_user_id">
              <div>
                <div class="user_id">User ID</div>
                <div class="user_name">trungtruong2209</div>
              </div>
              <button class="edit_btn">Edit</button>
            </div>

            <div class="edit_user_id flex">
              <div>
                <div class="user_id">First Name</div>
                <div class="user_name">Trung</div>
              </div>
              <div class="left_margin">
                <div class="user_id">Last Name</div>
                <div class="user_name">Truong</div>
              </div>
              <button class="edit_btn">Edit</button>
            </div>

            <div class="user_image">
              <div class="upload_image">Upload An Image</div>
              <button class="upload_img_btn">Pick file</button>
            </div>

            <!-- <div class="form__img">
              <label for="form__img-upload">Upload cover (190 x 270)</label>
              <input
                id="form__img-upload"
                name="movie_cover"
                type="file"
                accept=".png, .jpg, .jpeg"
              />
              <img id="form__img" src="#" alt=" " />
            </div> -->

            <div class="form__img">
              <label for="form__img-upload">Upload avatar</label>
              <input
                id="form__img-upload"
                name="movie_cover"
                type="file"
                accept=".png, .jpg, .jpeg"
              />
              <img id="form__img" src="#" alt=" " />
            </div>

            <div class="bio_container">
              <div class="bio_title">Bio</div>
              <textarea class="input_bio">
Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
                </textarea
              >
            </div>
            <div style="display: flex; align-items: center">
              <!-- <div class="title_gender">Gender</div>
              <select class="gender_select" name="" id="">
                <option value="">Female</option>
              </select> -->
            </div>
            <div
              class=""
              style="
                display: flex;
                align-items: center;
                margin-top: 10px;
                margin-bottom: 10px;
              "
            >
              <div class="title_dob">Date of Birth</div>
              <select name="date" id="date" class="date"></select>
              <select name="month" id="month" class="month"></select>
              <select name="year" id="year" class="year"></select>
            </div>
            <div class="" style="display: flex; align-items: center">
              <div class="title_country">Country/Region of Residence</div>
              <select name="" id="" class="country_select">
                <option value="">The United Kingdom</option>
              </select>
            </div>
            <button class="save_btn">Save Profile</button>
          </div>
        </div>
        <div class="edit_right">
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
        <button class="scroll-btn left" data-target="previewRecent">
          &lt;
        </button>
        <!--  -->
        <div class="recent_view" id="previewRecent">
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
        <button class="scroll-btn right" data-target="previewRecent">
          &gt;
        </button>
      </div>
    </div>
    <script src="/film-lovers/view/user/editProfile/editProDetail.js"></script>
    <script src="/film-lovers/view/user/editProfile/jquery-3.5.1.min.js"></script>
    <script src="/film-lovers/view/user/editProfile/jquery.magnific-popup.min.js"></script>
    <script src="/film-lovers/view/user/editProfile/select2.min.js"></script>
    <script src="/film-lovers/view/user/editProfile/smooth-scrollbar.js"></script>
  </body>
</html>
