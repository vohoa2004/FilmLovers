<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./filter.css" />
    <title>Trending Film</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/nouislider/distribute/nouislider.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/nouislider/distribute/nouislider.min.js"></script>
  </head>
  <body>
    <div class="trending_container">
      <div class="trending">Trending</div>
      <div class="body_product">
        <div class="filter_container">
          <div class="sort_container">
            <div class="sort_header">
              <div>Sort</div>
              <div>
                <button><img src="../assets/Swap_btn.png" /></button>
              </div>
            </div>
            <div class="body_sort">
              <div class="sort_content">Popularity</div>
              <div class="sort_content">Rating</div>
            </div>
          </div>
          <div class="filter_chilren_container">
            <div class="filter_children_header">Filter</div>
            <div class="date">
              <div class="date_header">Release Year</div>
              <div class="from_to_container">
                <div class="from_to">from</div>
                <input class="calender" type="date" id="from" name="from" />
                <!-- <div class="calender">
                  <div>21/01/2019</div>
                  <div><img src="../assets/calender.png" /></div>
                </div> -->
              </div>
              <div class="from_to_container" style="margin-top: 15px">
                <div class="from_to">to</div>
                <input class="calender" type="date" id="to" name="to" />
              </div>
            </div>
            <div class="country_language_container">
              <div class="country_language">
                <div class="from_to_container">
                  <div class="cou_lang_name">Country</div>
                  <select class="language_content">
                    <option>US</option>
                    <option>VN</option>
                  </select>
                </div>
              </div>
              <div class="country_language" style="margin-top: 20px">
                <div class="from_to_container">
                  <div class="cou_lang_name">Language</div>
                  <select class="language_content">
                    <option>English</option>
                    <option>Việt Nam</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="type_container">
              <div class="type_header">Type</div>
              <div class="body_type">
                <div class="type_content">
                  <input type="radio" name="type" />Movie
                </div>
                <div class="type_content">
                  <input type="radio" name="type" />TV Series
                </div>
              </div>
            </div>
            <div class="type_container">
              <div class="type_header">Genres</div>
              <div class="body_genres">
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Action</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Adventure</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Animation</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Biography</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Crime</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Comedy</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Documentary</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Drama</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Family</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Fantasy</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Film-Noir</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Game-Show</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>History</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Horror</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Musical</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Mystery</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Reality-TV</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Romance</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Sci-Fi</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Short</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Sport</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Talk-Show</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>Thriller</span>
                  </label>
                </div>
                <div class="cat action">
                  <label>
                    <input type="checkbox" value="1" /><span>War</span>
                  </label>
                </div>
              </div>
            </div>
            <div class="type_container">
              <div class="type_header">Runtime (minute)</div>
              <div id="slider" class="gray-connect-slider"></div>
              <p style="display: flex; gap: 10px; margin-top: 50px">
                <span>Values:</span>
                <span id="value-lower"></span> -
                <span id="value-upper"></span>
              </p>
            </div>
            <div class="keywords_container">
              <div class="type_header">Keywords</div>
              <div class="search">
                <input placeholder="Filter by keywords..." />
              </div>
            </div>
          </div>
          <button class="search_btn">Search</button>
        </div>
        <div class="product">
          <div class="trending-second-box active">
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
          <div class="show_more_container">
            <button class="show_more">
              <div>Show more</div>
              <div style="margin-left: 10px">
                <img src="../assets/dropdown_white.png" />
              </div>
            </button>
          </div>
        </div>
      </div>
    </div>
    <script src="./filter.js"></script>
  </body>
</html>
