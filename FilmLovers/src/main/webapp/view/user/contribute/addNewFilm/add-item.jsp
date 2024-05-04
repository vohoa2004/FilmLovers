<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

                <!-- CSS -->
                <link rel="stylesheet" href="view/user/contribute/addNewFilm/css/bootstrap-reboot.min.css">
                <link rel="stylesheet" href="view/user/contribute/addNewFilm/css/bootstrap-grid.min.css">
                <link rel="stylesheet" href="view/user/contribute/addNewFilm/css/magnific-popup.css">
                <link rel="stylesheet" href="view/user/contribute/addNewFilm/css/select2.min.css">
                <link rel="stylesheet" href="view/user/contribute/addNewFilm/css/admin.css">

                <!-- font -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap"
                    rel="stylesheet">

                <!-- Favicons -->
                <!--<link rel="icon" type="image/png" href="icon/favicon-32x32.png" sizes="32x32">-->
                <!--<link rel="apple-touch-icon" href="icon/favicon-32x32.png">-->

                <meta name="description" content="">
                <meta name="keywords" content="">
                <title>Contribute New Film</title>

            </head>

            <body>

                <!-- header -->
                <header class="header">
                    <div class="header__content">
                        <!-- header logo -->
                        <a href="#" class="header__logo">
                            <img src="view/user/contribute/addNewFilm/img/logo.svg" alt="">
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
                <jsp:include page="/view/user/Component/header/Header.jsp" />


                <!-- main content -->
                <div class="container-fluid">
                    <div class="row">
                        <!-- main title -->
                        <div class="col-md-12">
                            <div class="main__title">
                                <h2>ADD NEW MOVIE/TV SHOW</h2>
                            </div>
                        </div>
                        <!-- end main title -->

                        <!-- form -->
                        <div class="col-12">
                            <form action="/film-lovers/contribute?action=add-film" class="form" method="POST">
                                <div class="row">

                                    <div class="col-12 col-md-5 form__cover"> <!-- cover photo -->
                                        <div class="row">
                                            <div class="col-12 col-sm-6 col-md-12">

                                                <div class="form__img">
                                                    <label for="fileButton">Upload cover (190 x 270)</label>
                                                    <!--                                            <input id="form__img-upload" name="movie_cover" type="file" accept=".png, .jpg, .jpeg">-->
                                                    <progress value="0" max="100" id="uploader">0%</progress>

                                                    <input type="file" accept="image/*" id="fileButton"
                                                        style="display: none;">
                                                    <input type="text" name="image" id="image" style="display: none;">

                                                    <div id="imgDiv"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-7 form__content">
                                        <div class="row">
                                            <div class="col-8"> <!-- title -->
                                                <div class="form__group">
                                                    <input type="text" name="title" class="form__input"
                                                        placeholder="Title" required>
                                                </div>
                                            </div>

                                            <div class="col-4"> <!-- type: movie/ TV show -->
                                                <ul class="form__radio">
                                                    <li>
                                                        <input id="type1" type="radio" name="type" value="movie"
                                                            checked="">
                                                        <label for="type1">Movie</label>
                                                    </li>
                                                    <li>
                                                        <input id="type2" type="radio" name="type" value="series">
                                                        <label for="type2">TV Series</label>
                                                    </li>
                                                </ul>
                                            </div>

                                            <div class="col-12"> <!-- country -->
                                                <div class="form__group">
                                                    <select class="js-example-basic-multiple" id="country"
                                                        name="country" required>
                                                        <option value="Afghanistan">Afghanistan</option>
                                                        <option value="Ãland Islands">Ãland Islands</option>
                                                        <option value="Albania">Albania</option>
                                                        <option value="Algeria">Algeria</option>
                                                        <option value="American Samoa">American Samoa</option>
                                                        <option value="Andorra">Andorra</option>
                                                        <option value="Angola">Angola</option>
                                                        <option value="Anguilla">Anguilla</option>
                                                        <option value="Antarctica">Antarctica</option>
                                                        <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                                                        <option value="Argentina">Argentina</option>
                                                        <option value="Armenia">Armenia</option>
                                                        <option value="Aruba">Aruba</option>
                                                        <option value="Australia">Australia</option>
                                                        <option value="Austria">Austria</option>
                                                        <option value="Azerbaijan">Azerbaijan</option>
                                                        <option value="Bahamas">Bahamas</option>
                                                        <option value="Bahrain">Bahrain</option>
                                                        <option value="Bangladesh">Bangladesh</option>
                                                        <option value="Barbados">Barbados</option>
                                                        <option value="Belarus">Belarus</option>
                                                        <option value="Belgium">Belgium</option>
                                                        <option value="Belize">Belize</option>
                                                        <option value="Benin">Benin</option>
                                                        <option value="Bermuda">Bermuda</option>
                                                        <option value="Bhutan">Bhutan</option>
                                                        <option value="Bolivia">Bolivia</option>
                                                        <option value="Bosnia and Herzegovina">Bosnia and Herzegovina
                                                        </option>
                                                        <option value="Botswana">Botswana</option>
                                                        <option value="Bouvet Island">Bouvet Island</option>
                                                        <option value="Brazil">Brazil</option>
                                                        <option value="Brunei Darussalam">Brunei Darussalam</option>
                                                        <option value="Bulgaria">Bulgaria</option>
                                                        <option value="Burkina Faso">Burkina Faso</option>
                                                        <option value="Burundi">Burundi</option>
                                                        <option value="Cambodia">Cambodia</option>
                                                        <option value="Cameroon">Cameroon</option>
                                                        <option value="Canada">Canada</option>
                                                        <option value="Cape Verde">Cape Verde</option>
                                                        <option value="Cayman Islands">Cayman Islands</option>
                                                        <option value="Central African Republic">Central African
                                                            Republic</option>
                                                        <option value="Chad">Chad</option>
                                                        <option value="Chile">Chile</option>
                                                        <option value="China">China</option>
                                                        <option value="Colombia">Colombia</option>
                                                        <option value="Comoros">Comoros</option>
                                                        <option value="Congo">Congo</option>
                                                        <option value="Congo">Congo</option>
                                                        <option value="Cook Islands">Cook Islands</option>
                                                        <option value="Costa Rica">Costa Rica</option>
                                                        <option value="Cote D'ivoire">Cote D'ivoire</option>
                                                        <option value="Croatia">Croatia</option>
                                                        <option value="Cuba">Cuba</option>
                                                        <option value="Cyprus">Cyprus</option>
                                                        <option value="Czech Republic">Czech Republic</option>
                                                        <option value="Denmark">Denmark</option>
                                                        <option value="Djibouti">Djibouti</option>
                                                        <option value="Dominica">Dominica</option>
                                                        <option value="Dominican Republic">Dominican Republic</option>
                                                        <option value="Ecuador">Ecuador</option>
                                                        <option value="Egypt">Egypt</option>
                                                        <option value="El Salvador">El Salvador</option>
                                                        <option value="Equatorial Guinea">Equatorial Guinea</option>
                                                        <option value="Eritrea">Eritrea</option>
                                                        <option value="Estonia">Estonia</option>
                                                        <option value="Ethiopia">Ethiopia</option>
                                                        <option value="Faroe Islands">Faroe Islands</option>
                                                        <option value="Fiji">Fiji</option>
                                                        <option value="Finland">Finland</option>
                                                        <option value="France">France</option>
                                                        <option value="Gabon">Gabon</option>
                                                        <option value="Gambia">Gambia</option>
                                                        <option value="Georgia">Georgia</option>
                                                        <option value="Germany">Germany</option>
                                                        <option value="Ghana">Ghana</option>
                                                        <option value="Gibraltar">Gibraltar</option>
                                                        <option value="Greece">Greece</option>
                                                        <option value="Greenland">Greenland</option>
                                                        <option value="Grenada">Grenada</option>
                                                        <option value="Guadeloupe">Guadeloupe</option>
                                                        <option value="Guam">Guam</option>
                                                        <option value="Guatemala">Guatemala</option>
                                                        <option value="Guernsey">Guernsey</option>
                                                        <option value="Guinea">Guinea</option>
                                                        <option value="Guinea-bissau">Guinea-bissau</option>
                                                        <option value="Guyana">Guyana</option>
                                                        <option value="Haiti">Haiti</option>
                                                        <option value="Honduras">Honduras</option>
                                                        <option value="Hong Kong">Hong Kong</option>
                                                        <option value="Hungary">Hungary</option>
                                                        <option value="Iceland">Iceland</option>
                                                        <option value="India">India</option>
                                                        <option value="Indonesia">Indonesia</option>
                                                        <option value="Iran">Iran</option>
                                                        <option value="Iraq">Iraq</option>
                                                        <option value="Ireland">Ireland</option>
                                                        <option value="Isle of Man">Isle of Man</option>
                                                        <option value="Israel">Israel</option>
                                                        <option value="Italy">Italy</option>
                                                        <option value="Jamaica">Jamaica</option>
                                                        <option value="Japan">Japan</option>
                                                        <option value="Jersey">Jersey</option>
                                                        <option value="Jordan">Jordan</option>
                                                        <option value="Kazakhstan">Kazakhstan</option>
                                                        <option value="Kenya">Kenya</option>
                                                        <option value="Kiribati">Kiribati</option>
                                                        <option value="Korea">Korea</option>
                                                        <option value="Kuwait">Kuwait</option>
                                                        <option value="Kyrgyzstan">Kyrgyzstan</option>
                                                        <option value="Lao People's Democratic Republic">Lao People's
                                                            Democratic Republic</option>
                                                        <option value="Latvia">Latvia</option>
                                                        <option value="Lebanon">Lebanon</option>
                                                        <option value="Lesotho">Lesotho</option>
                                                        <option value="Liberia">Liberia</option>
                                                        <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya
                                                        </option>
                                                        <option value="Liechtenstein">Liechtenstein</option>
                                                        <option value="Lithuania">Lithuania</option>
                                                        <option value="Luxembourg">Luxembourg</option>
                                                        <option value="Macao">Macao</option>
                                                        <option value="Macedonia">Macedonia</option>
                                                        <option value="Madagascar">Madagascar</option>
                                                        <option value="Malawi">Malawi</option>
                                                        <option value="Malaysia">Malaysia</option>
                                                        <option value="Maldives">Maldives</option>
                                                        <option value="Mali">Mali</option>
                                                        <option value="Malta">Malta</option>
                                                        <option value="Marshall Islands">Marshall Islands</option>
                                                        <option value="Martinique">Martinique</option>
                                                        <option value="Mauritania">Mauritania</option>
                                                        <option value="Mauritius">Mauritius</option>
                                                        <option value="Mayotte">Mayotte</option>
                                                        <option value="Mexico">Mexico</option>
                                                        <option value="Moldova">Moldova</option>
                                                        <option value="Monaco">Monaco</option>
                                                        <option value="Mongolia">Mongolia</option>
                                                        <option value="Montenegro">Montenegro</option>
                                                        <option value="Montserrat">Montserrat</option>
                                                        <option value="Morocco">Morocco</option>
                                                        <option value="Mozambique">Mozambique</option>
                                                        <option value="Myanmar">Myanmar</option>
                                                        <option value="Namibia">Namibia</option>
                                                        <option value="Nauru">Nauru</option>
                                                        <option value="Nepal">Nepal</option>
                                                        <option value="Netherlands">Netherlands</option>
                                                        <option value="Netherlands Antilles">Netherlands Antilles
                                                        </option>
                                                        <option value="New Caledonia">New Caledonia</option>
                                                        <option value="New Zealand">New Zealand</option>
                                                        <option value="Nicaragua">Nicaragua</option>
                                                        <option value="Niger">Niger</option>
                                                        <option value="Nigeria">Nigeria</option>
                                                        <option value="Niue">Niue</option>
                                                        <option value="Norfolk Island">Norfolk Island</option>
                                                        <option value="Northern Mariana Islands">Northern Mariana
                                                            Islands</option>
                                                        <option value="Norway">Norway</option>
                                                        <option value="Oman">Oman</option>
                                                        <option value="Pakistan">Pakistan</option>
                                                        <option value="Palau">Palau</option>
                                                        <option value="Panama">Panama</option>
                                                        <option value="Papua New Guinea">Papua New Guinea</option>
                                                        <option value="Paraguay">Paraguay</option>
                                                        <option value="Peru">Peru</option>
                                                        <option value="Philippines">Philippines</option>
                                                        <option value="Pitcairn">Pitcairn</option>
                                                        <option value="Poland">Poland</option>
                                                        <option value="Portugal">Portugal</option>
                                                        <option value="Puerto Rico">Puerto Rico</option>
                                                        <option value="Qatar">Qatar</option>
                                                        <option value="Reunion">Reunion</option>
                                                        <option value="Romania">Romania</option>
                                                        <option value="Russian Federation">Russian Federation</option>
                                                        <option value="Rwanda">Rwanda</option>
                                                        <option value="Samoa">Samoa</option>
                                                        <option value="San Marino">San Marino</option>
                                                        <option value="Sao Tome and Principe">Sao Tome and Principe
                                                        </option>
                                                        <option value="Saudi Arabia">Saudi Arabia</option>
                                                        <option value="Senegal">Senegal</option>
                                                        <option value="Serbia">Serbia</option>
                                                        <option value="Seychelles">Seychelles</option>
                                                        <option value="Sierra Leone">Sierra Leone</option>
                                                        <option value="Singapore">Singapore</option>
                                                        <option value="Slovakia">Slovakia</option>
                                                        <option value="Slovenia">Slovenia</option>
                                                        <option value="Solomon Islands">Solomon Islands</option>
                                                        <option value="Somalia">Somalia</option>
                                                        <option value="South Africa">South Africa</option>
                                                        <option value="Spain">Spain</option>
                                                        <option value="Sri Lanka">Sri Lanka</option>
                                                        <option value="Sudan">Sudan</option>
                                                        <option value="Suriname">Suriname</option>
                                                        <option value="Swaziland">Swaziland</option>
                                                        <option value="Sweden">Sweden</option>
                                                        <option value="Switzerland">Switzerland</option>
                                                        <option value="Syrian Arab Republic">Syrian Arab Republic
                                                        </option>
                                                        <option value="Taiwan">Taiwan</option>
                                                        <option value="Tajikistan">Tajikistan</option>
                                                        <option value="Tanzania">Tanzania</option>
                                                        <option value="Thailand">Thailand</option>
                                                        <option value="Timor-leste">Timor-leste</option>
                                                        <option value="Togo">Togo</option>
                                                        <option value="Tokelau">Tokelau</option>
                                                        <option value="Tonga">Tonga</option>
                                                        <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                                        <option value="Tunisia">Tunisia</option>
                                                        <option value="Turkey">Turkey</option>
                                                        <option value="Turkmenistan">Turkmenistan</option>
                                                        <option value="Turks and Caicos Islands">Turks and Caicos
                                                            Islands</option>
                                                        <option value="Tuvalu">Tuvalu</option>
                                                        <option value="Uganda">Uganda</option>
                                                        <option value="Ukraine">Ukraine</option>
                                                        <option value="United Arab Emirates">United Arab Emirates
                                                        </option>
                                                        <option value="United Kingdom">United Kingdom</option>
                                                        <option value="United States">United States</option>
                                                        <option value="Uruguay">Uruguay</option>
                                                        <option value="Uzbekistan">Uzbekistan</option>
                                                        <option value="Vanuatu">Vanuatu</option>
                                                        <option value="Venezuela">Venezuela</option>
                                                        <option value="Viet Nam">Viet Nam</option>
                                                        <option value="Western Sahara">Western Sahara</option>
                                                        <option value="Yemen">Yemen</option>
                                                        <option value="Zambia">Zambia</option>
                                                        <option value="Zimbabwe">Zimbabwe</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-6"> <!-- release year -->
                                                <div class="form__group releaseDate">
                                                    <label for="release_year">Release Year</label>
                                                    <input type="text" class="form__input" id="release_year"
                                                        name="release_year" pattern="(19|20)\d{2}"
                                                        title="Please enter a valid year (1900-2100)" required>
                                                </div>
                                            </div>
                                            <div class="col-6"> <!-- release month -->
                                                <div class="form__group releaseDate">
                                                    <label for="release_month">Month</label>
                                                    <input type="text" class="form__input" id="release_month"
                                                        name="release_month" pattern="0?[1-9]|1[0-2]"
                                                        title="Please enter a valid month (1-12)" required>
                                                </div>
                                            </div>

                                            <div class="col-12"> <!-- Cover/Photo link -->
                                                <div class="form__group form__group--link">
                                                    <input type="text" name="cover_url" class="form__input"
                                                        placeholder="Cover URL"
                                                        pattern="(http(s?):)([/|.|\w|\s|-])*\.(?:jpg|gif|png)">
                                                </div>
                                            </div>

                                            <div class="col-12"> <!-- description box-->
                                                <div class="form__group">
                                                    <textarea id="text" name="description" class="form__textarea"
                                                        placeholder="Description"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 film_detailed_information">
                                        <div class="title">
                                            <h2>Detail Information</h2>
                                        </div>

                                        <div class="row content">
                                            <div class="col-6">
                                                <!--                                        <div class="form__group">  original name 
                                                                                    <input type="text" name="original_name" class="form__input" placeholder="Original name">
                                                                                </div>-->

                                                <div class="form__group"> <!-- duration/length -->
                                                    <input type="text" name="runtime" class="form__input"
                                                        placeholder="Duration (minutes)" pattern="[1-9]\d*"
                                                        title="Please enter a positive integer">

                                                </div>


                                                <div class="form__group"> <!-- language -->
                                                    <select class="js-example-basic-multiple" id="language"
                                                        name="language">
                                                        <option value="Afar">Afar</option>
                                                        <option value="Abkhazian">Abkhazian</option>
                                                        <option value="Achinese">Achinese</option>
                                                        <option value="Acoli">Acoli</option>
                                                        <option value="Adangme">Adangme</option>
                                                        <option value="Adyghe Adygei">Adyghe Adygei</option>
                                                        <option value="Afro-Asiatic languages">Afro-Asiatic languages
                                                        </option>
                                                        <option value="Afrihili">Afrihili</option>
                                                        <option value="Afrikaans">Afrikaans</option>
                                                        <option value="Ainu">Ainu</option>
                                                        <option value="Akan">Akan</option>
                                                        <option value="Akkadian">Akkadian</option>
                                                        <option value="Albanian">Albanian</option>
                                                        <option value="Aleut">Aleut</option>
                                                        <option value="Algonquian languages">Algonquian languages
                                                        </option>
                                                        <option value="Southern Altai">Southern Altai</option>
                                                        <option value="Amharic">Amharic</option>
                                                        <option value="English">English</option>
                                                        <option value="Angika">Angika</option>
                                                        <option value="Apache languages">Apache languages</option>
                                                        <option value="Arabic">Arabic</option>
                                                        <option
                                                            value="Official Aramaic (700-300 BCE) Imperial Aramaic (700-300 BCE)">
                                                            Official Aramaic (700-300 BCE) Imperial Aramaic (700-300
                                                            BCE)</option>
                                                        <option value="Aragonese">Aragonese</option>
                                                        <option value="Armenian">Armenian</option>
                                                        <option value="Mapudungun Mapuche">Mapudungun Mapuche</option>
                                                        <option value="Arapaho">Arapaho</option>
                                                        <option value="Artificial languages">Artificial languages
                                                        </option>
                                                        <option value="Arawak">Arawak</option>
                                                        <option value="Assamese">Assamese</option>
                                                        <option value="Asturian Bable Leonese Asturleonese">Asturian
                                                            Bable Leonese Asturleonese</option>
                                                        <option value="Athapascan languages">Athapascan languages
                                                        </option>
                                                        <option value="Australian languages">Australian languages
                                                        </option>
                                                        <option value="Avaric">Avaric</option>
                                                        <option value="Avestan">Avestan</option>
                                                        <option value="Awadhi">Awadhi</option>
                                                        <option value="Aymara">Aymara</option>
                                                        <option value="Azerbaijani">Azerbaijani</option>
                                                        <option value="Banda languages">Banda languages</option>
                                                        <option value="Bamileke languages">Bamileke languages</option>
                                                        <option value="Bashkir">Bashkir</option>
                                                        <option value="Baluchi">Baluchi</option>
                                                        <option value="Bambara">Bambara</option>
                                                        <option value="Balinese">Balinese</option>
                                                        <option value="Basque">Basque</option>
                                                        <option value="Basa">Basa</option>
                                                        <option value="Baltic languages">Baltic languages</option>
                                                        <option value="Beja Bedawiyet">Beja Bedawiyet</option>
                                                        <option value="Belarusian">Belarusian</option>
                                                        <option value="Bemba">Bemba</option>
                                                        <option value="Bengali">Bengali</option>
                                                        <option value="Berber languages">Berber languages</option>
                                                        <option value="Bhojpuri">Bhojpuri</option>
                                                        <option value="Bihari languages">Bihari languages</option>
                                                        <option value="Bikol">Bikol</option>
                                                        <option value="Bini Edo">Bini Edo</option>
                                                        <option value="Bislama">Bislama</option>
                                                        <option value="Siksika">Siksika</option>
                                                        <option value="Bantu (Other)">Bantu (Other)</option>
                                                        <option value="Bosnian">Bosnian</option>
                                                        <option value="Braj">Braj</option>
                                                        <option value="Breton">Breton</option>
                                                        <option value="Batak languages">Batak languages</option>
                                                        <option value="Buriat">Buriat</option>
                                                        <option value="Buginese">Buginese</option>
                                                        <option value="Bulgarian">Bulgarian</option>
                                                        <option value="Burmese">Burmese</option>
                                                        <option value="Blin Bilin">Blin Bilin</option>
                                                        <option value="Caddo">Caddo</option>
                                                        <option value="Central American Indian languages">Central
                                                            American Indian languages</option>
                                                        <option value="Galibi Carib">Galibi Carib</option>
                                                        <option value="Catalan Valencian">Catalan Valencian</option>
                                                        <option value="Caucasian languages">Caucasian languages</option>
                                                        <option value="Cebuano">Cebuano</option>
                                                        <option value="Celtic languages">Celtic languages</option>
                                                        <option value="Chamorro">Chamorro</option>
                                                        <option value="Chibcha">Chibcha</option>
                                                        <option value="Chechen">Chechen</option>
                                                        <option value="Chagatai">Chagatai</option>
                                                        <option value="Chinese">Chinese</option>
                                                        <option value="Chuukese">Chuukese</option>
                                                        <option value="Mari">Mari</option>
                                                        <option value="Chinook jargon">Chinook jargon</option>
                                                        <option value="Choctaw">Choctaw</option>
                                                        <option value="Chipewyan Dene Suline">Chipewyan Dene Suline
                                                        </option>
                                                        <option value="Cherokee">Cherokee</option>
                                                        <option
                                                            value="Church Slavic Old Slavonic Church Slavonic Old Bulgarian Old Church Slavonic">
                                                            Church Slavic Old Slavonic Church Slavonic Old Bulgarian Old
                                                            Church Slavonic</option>
                                                        <option value="Chuvash">Chuvash</option>
                                                        <option value="Cheyenne">Cheyenne</option>
                                                        <option value="Chamic languages">Chamic languages</option>
                                                        <option value="Coptic">Coptic</option>
                                                        <option value="Cornish">Cornish</option>
                                                        <option value="Corsican">Corsican</option>
                                                        <option value="Creoles and pidgins">Creoles and pidgins</option>
                                                        <option value="Cree">Cree</option>
                                                        <option value="Crimean Tatar Crimean Turkish">Crimean Tatar
                                                            Crimean Turkish</option>
                                                        <option value="Creoles and pidgins ">Creoles and pidgins
                                                        </option>
                                                        <option value="Kashubian">Kashubian</option>
                                                        <option value="Cushitic languages">Cushitic languages</option>
                                                        <option value="Czech">Czech</option>
                                                        <option value="Dakota">Dakota</option>
                                                        <option value="Danish">Danish</option>
                                                        <option value="Dargwa">Dargwa</option>
                                                        <option value="Land Dayak languages">Land Dayak languages
                                                        </option>
                                                        <option value="Delaware">Delaware</option>
                                                        <option value="Slave (Athapascan)">Slave (Athapascan)</option>
                                                        <option value="Dogrib">Dogrib</option>
                                                        <option value="Dinka">Dinka</option>
                                                        <option value="Divehi Dhivehi Maldivian">Divehi Dhivehi
                                                            Maldivian</option>
                                                        <option value="Dogri">Dogri</option>
                                                        <option value="Dravidian languages">Dravidian languages</option>
                                                        <option value="Lower Sorbian">Lower Sorbian</option>
                                                        <option value="Duala">Duala</option>
                                                        <option value="Dutch">Dutch</option>
                                                        <option value="Dutch Flemish">Dutch Flemish</option>
                                                        <option value="Dyula">Dyula</option>
                                                        <option value="Dzongkha">Dzongkha</option>
                                                        <option value="Efik">Efik</option>
                                                        <option value="Egyptian (Ancient)">Egyptian (Ancient)</option>
                                                        <option value="Ekajuk">Ekajuk</option>
                                                        <option value="Elamite">Elamite</option>
                                                        <option value="English">English</option>
                                                        <option value="Esperanto">Esperanto</option>
                                                        <option value="Estonian">Estonian</option>
                                                        <option value="Ewe">Ewe</option>
                                                        <option value="Ewondo">Ewondo</option>
                                                        <option value="Fang">Fang</option>
                                                        <option value="Faroese">Faroese</option>
                                                        <option value="Fanti">Fanti</option>
                                                        <option value="Fijian">Fijian</option>
                                                        <option value="Filipino Pilipino">Filipino Pilipino</option>
                                                        <option value="Finnish">Finnish</option>
                                                        <option value="Finno-Ugrian languages">Finno-Ugrian languages
                                                        </option>
                                                        <option value="Fon">Fon</option>
                                                        <option value="French">French</option>
                                                        <option value="Northern Frisian">Northern Frisian</option>
                                                        <option value="Eastern Frisian">Eastern Frisian</option>
                                                        <option value="Fulah">Fulah</option>
                                                        <option value="Friulian">Friulian</option>
                                                        <option value="Ga">Ga</option>
                                                        <option value="Gayo">Gayo</option>
                                                        <option value="Gbaya">Gbaya</option>
                                                        <option value="Germanic languages">Germanic languages</option>
                                                        <option value="Georgian">Georgian</option>
                                                        <option value="German">German</option>
                                                        <option value="Geez">Geez</option>
                                                        <option value="Gilbertese">Gilbertese</option>
                                                        <option value="Gaelic Scottish Gaelic">Gaelic Scottish Gaelic
                                                        </option>
                                                        <option value="Irish">Irish</option>
                                                        <option value="Galician">Galician</option>
                                                        <option value="Manx">Manx</option>
                                                        <option value="German">German</option>
                                                        <option value="German">German</option>
                                                        <option value="Gondi">Gondi</option>
                                                        <option value="Gorontalo">Gorontalo</option>
                                                        <option value="Gothic">Gothic</option>
                                                        <option value="Grebo">Grebo</option>
                                                        <option value="Greek">Greek</option>
                                                        <option value="Greek">Greek</option>
                                                        <option value="Guarani">Guarani</option>
                                                        <option value="Swiss German Alemannic Alsatian">Swiss German
                                                            Alemannic Alsatian</option>
                                                        <option value="Gujarati">Gujarati</option>
                                                        <option value="Gwich'in">Gwich'in</option>
                                                        <option value="Haida">Haida</option>
                                                        <option value="Haitian Haitian Creole">Haitian Haitian Creole
                                                        </option>
                                                        <option value="Hausa">Hausa</option>
                                                        <option value="Hawaiian">Hawaiian</option>
                                                        <option value="Hebrew">Hebrew</option>
                                                        <option value="Herero">Herero</option>
                                                        <option value="Hiligaynon">Hiligaynon</option>
                                                        <option value="Himachali languages Western Pahari languages">
                                                            Himachali languages Western Pahari languages</option>
                                                        <option value="Hindi">Hindi</option>
                                                        <option value="Hittite">Hittite</option>
                                                        <option value="Hmong Mong">Hmong Mong</option>
                                                        <option value="Hiri Motu">Hiri Motu</option>
                                                        <option value="Croatian">Croatian</option>
                                                        <option value="Upper Sorbian">Upper Sorbian</option>
                                                        <option value="Hungarian">Hungarian</option>
                                                        <option value="Hupa">Hupa</option>
                                                        <option value="Iban">Iban</option>
                                                        <option value="Igbo">Igbo</option>
                                                        <option value="Icelandic">Icelandic</option>
                                                        <option value="Ido">Ido</option>
                                                        <option value="Sichuan Yi Nuosu">Sichuan Yi Nuosu</option>
                                                        <option value="Ijo languages">Ijo languages</option>
                                                        <option value="Inuktitut">Inuktitut</option>
                                                        <option value="Interlingue Occidental">Interlingue Occidental
                                                        </option>
                                                        <option value="Iloko">Iloko</option>
                                                        <option
                                                            value="Interlingua (International Auxiliary Language Association)">
                                                            Interlingua (International Auxiliary Language Association)
                                                        </option>
                                                        <option value="Indic languages">Indic languages</option>
                                                        <option value="Indonesian">Indonesian</option>
                                                        <option value="Indo-European languages">Indo-European languages
                                                        </option>
                                                        <option value="Ingush">Ingush</option>
                                                        <option value="Inupiaq">Inupiaq</option>
                                                        <option value="Iranian languages">Iranian languages</option>
                                                        <option value="Iroquoian languages">Iroquoian languages</option>
                                                        <option value="Italian">Italian</option>
                                                        <option value="Javanese">Javanese</option>
                                                        <option value="Lojban">Lojban</option>
                                                        <option value="Japanese">Japanese</option>
                                                        <option value="Judeo-Persian">Judeo-Persian</option>
                                                        <option value="Judeo-Arabic">Judeo-Arabic</option>
                                                        <option value="Kara-Kalpak">Kara-Kalpak</option>
                                                        <option value="Kabyle">Kabyle</option>
                                                        <option value="Kachin Jingpho">Kachin Jingpho</option>
                                                        <option value="Kalaallisut Greenlandic">Kalaallisut Greenlandic
                                                        </option>
                                                        <option value="Kamba">Kamba</option>
                                                        <option value="Kannada">Kannada</option>
                                                        <option value="Karen languages">Karen languages</option>
                                                        <option value="Kashmiri">Kashmiri</option>
                                                        <option value="Kanuri">Kanuri</option>
                                                        <option value="Kawi">Kawi</option>
                                                        <option value="Kazakh">Kazakh</option>
                                                        <option value="Kabardian">Kabardian</option>
                                                        <option value="Khasi">Khasi</option>
                                                        <option value="Khoisan languages">Khoisan languages</option>
                                                        <option value="Central Khmer">Central Khmer</option>
                                                        <option value="Khotanese Sakan">Khotanese Sakan</option>
                                                        <option value="Kikuyu Gikuyu">Kikuyu Gikuyu</option>
                                                        <option value="Kinyarwanda">Kinyarwanda</option>
                                                        <option value="Kirghiz Kyrgyz">Kirghiz Kyrgyz</option>
                                                        <option value="Kimbundu">Kimbundu</option>
                                                        <option value="Konkani">Konkani</option>
                                                        <option value="Komi">Komi</option>
                                                        <option value="Kongo">Kongo</option>
                                                        <option value="Korean">Korean</option>
                                                        <option value="Kosraean">Kosraean</option>
                                                        <option value="Kpelle">Kpelle</option>
                                                        <option value="Karachay-Balkar">Karachay-Balkar</option>
                                                        <option value="Karelian">Karelian</option>
                                                        <option value="Kru languages">Kru languages</option>
                                                        <option value="Kurukh">Kurukh</option>
                                                        <option value="Kuanyama Kwanyama">Kuanyama Kwanyama</option>
                                                        <option value="Kumyk">Kumyk</option>
                                                        <option value="Kurdish">Kurdish</option>
                                                        <option value="Kutenai">Kutenai</option>
                                                        <option value="Ladino">Ladino</option>
                                                        <option value="Lahnda">Lahnda</option>
                                                        <option value="Lamba">Lamba</option>
                                                        <option value="Lao">Lao</option>
                                                        <option value="Latin">Latin</option>
                                                        <option value="Latvian">Latvian</option>
                                                        <option value="Lezghian">Lezghian</option>
                                                        <option value="Limburgan Limburger Limburgish">Limburgan
                                                            Limburger Limburgish</option>
                                                        <option value="Lingala">Lingala</option>
                                                        <option value="Lithuanian">Lithuanian</option>
                                                        <option value="Mongo">Mongo</option>
                                                        <option value="Lozi">Lozi</option>
                                                        <option value="Luxembourgish Letzeburgesch">Luxembourgish
                                                            Letzeburgesch</option>
                                                        <option value="Luba-Lulua">Luba-Lulua</option>
                                                        <option value="Luba-Katanga">Luba-Katanga</option>
                                                        <option value="Ganda">Ganda</option>
                                                        <option value="Luiseno">Luiseno</option>
                                                        <option value="Lunda">Lunda</option>
                                                        <option value="Luo (Kenya and Tanzania)">Luo (Kenya and
                                                            Tanzania)</option>
                                                        <option value="Lushai">Lushai</option>
                                                        <option value="Macedonian">Macedonian</option>
                                                        <option value="Madurese">Madurese</option>
                                                        <option value="Magahi">Magahi</option>
                                                        <option value="Marshallese">Marshallese</option>
                                                        <option value="Maithili">Maithili</option>
                                                        <option value="Makasar">Makasar</option>
                                                        <option value="Malayalam">Malayalam</option>
                                                        <option value="Mandingo">Mandingo</option>
                                                        <option value="Maori">Maori</option>
                                                        <option value="Austronesian languages">Austronesian languages
                                                        </option>
                                                        <option value="Marathi">Marathi</option>
                                                        <option value="Masai">Masai</option>
                                                        <option value="Malay">Malay</option>
                                                        <option value="Moksha">Moksha</option>
                                                        <option value="Mandar">Mandar</option>
                                                        <option value="Mende">Mende</option>
                                                        <option value="Irish">Irish</option>
                                                        <option value="Mi'kmaq Micmac">Mi'kmaq Micmac</option>
                                                        <option value="Minangkabau">Minangkabau</option>
                                                        <option value="Uncoded languages">Uncoded languages</option>
                                                        <option value="Mon-Khmer languages">Mon-Khmer languages</option>
                                                        <option value="Malagasy">Malagasy</option>
                                                        <option value="Maltese">Maltese</option>
                                                        <option value="Manchu">Manchu</option>
                                                        <option value="Manipuri">Manipuri</option>
                                                        <option value="Manobo languages">Manobo languages</option>
                                                        <option value="Mohawk">Mohawk</option>
                                                        <option value="Mongolian">Mongolian</option>
                                                        <option value="Mossi">Mossi</option>
                                                        <option value="Multiple languages">Multiple languages</option>
                                                        <option value="Munda languages">Munda languages</option>
                                                        <option value="Creek">Creek</option>
                                                        <option value="Mirandese">Mirandese</option>
                                                        <option value="Marwari">Marwari</option>
                                                        <option value="Mayan languages">Mayan languages</option>
                                                        <option value="Erzya">Erzya</option>
                                                        <option value="Nahuatl languages">Nahuatl languages</option>
                                                        <option value="North American Indian languages">North American
                                                            Indian languages</option>
                                                        <option value="Neapolitan">Neapolitan</option>
                                                        <option value="Nauru">Nauru</option>
                                                        <option value="Navajo Navaho">Navajo Navaho</option>
                                                        <option value="Ndebele">Ndebele</option>
                                                        <option value="Ndebele">Ndebele</option>
                                                        <option value="Ndonga">Ndonga</option>
                                                        <option value="Low German Low Saxon German">Low German Low Saxon
                                                            German</option>
                                                        <option value="Nepali">Nepali</option>
                                                        <option value="Nepal Bhasa Newari">Nepal Bhasa Newari</option>
                                                        <option value="Nias">Nias</option>
                                                        <option value="Niger-Kordofanian languages">Niger-Kordofanian
                                                            languages</option>
                                                        <option value="Niuean">Niuean</option>
                                                        <option value="Norwegian Nynorsk Nynorsk">Norwegian Nynorsk
                                                            Nynorsk</option>
                                                        <option value="BokmÃ¥l">BokmÃ¥l</option>
                                                        <option value="Nogai">Nogai</option>
                                                        <option value="Norse">Norse</option>
                                                        <option value="Norwegian">Norwegian</option>
                                                        <option value="N'Ko">N'Ko</option>
                                                        <option value="Pedi Sepedi Northern Sotho">Pedi Sepedi Northern
                                                            Sotho</option>
                                                        <option value="Nubian languages">Nubian languages</option>
                                                        <option
                                                            value="Classical Newari Old Newari Classical Nepal Bhasa">
                                                            Classical Newari Old Newari Classical Nepal Bhasa</option>
                                                        <option value="Chichewa Chewa Nyanja">Chichewa Chewa Nyanja
                                                        </option>
                                                        <option value="Nyamwezi">Nyamwezi</option>
                                                        <option value="Nyankole">Nyankole</option>
                                                        <option value="Nyoro">Nyoro</option>
                                                        <option value="Nzima">Nzima</option>
                                                        <option value="Occitan (post 1500) ProvenÃ§al">Occitan (post
                                                            1500) ProvenÃ§al</option>
                                                        <option value="Ojibwa">Ojibwa</option>
                                                        <option value="Oriya">Oriya</option>
                                                        <option value="Oromo">Oromo</option>
                                                        <option value="Osage">Osage</option>
                                                        <option value="Ossetian Ossetic">Ossetian Ossetic</option>
                                                        <option value="Turkish">Turkish</option>
                                                        <option value="Otomian languages">Otomian languages</option>
                                                        <option value="Papuan languages">Papuan languages</option>
                                                        <option value="Pangasinan">Pangasinan</option>
                                                        <option value="Pahlavi">Pahlavi</option>
                                                        <option value="Pampanga Kapampangan">Pampanga Kapampangan
                                                        </option>
                                                        <option value="Panjabi Punjabi">Panjabi Punjabi</option>
                                                        <option value="Papiamento">Papiamento</option>
                                                        <option value="Palauan">Palauan</option>
                                                        <option value="Persian">Persian</option>
                                                        <option value="Persian">Persian</option>
                                                        <option value="Philippine languages">Philippine languages
                                                        </option>
                                                        <option value="Phoenician">Phoenician</option>
                                                        <option value="Pali">Pali</option>
                                                        <option value="Polish">Polish</option>
                                                        <option value="Pohnpeian">Pohnpeian</option>
                                                        <option value="Portuguese">Portuguese</option>
                                                        <option value="Prakrit languages">Prakrit languages</option>
                                                        <option value="ProvenÃ§al">ProvenÃ§al</option>
                                                        <option value="Pushto Pashto">Pushto Pashto</option>
                                                        <option value="z"> Reserved for local use">z"> Reserved for
                                                            local use</option>
                                                        <option value="Quechua">Quechua</option>
                                                        <option value="Rajasthani">Rajasthani</option>
                                                        <option value="Rapanui">Rapanui</option>
                                                        <option value="Rarotongan Cook Islands Maori">Rarotongan Cook
                                                            Islands Maori</option>
                                                        <option value="Romance languages">Romance languages</option>
                                                        <option value="Romansh">Romansh</option>
                                                        <option value="Romany">Romany</option>
                                                        <option value="Romanian Moldavian Moldovan">Romanian Moldavian
                                                            Moldovan</option>
                                                        <option value="Rundi">Rundi</option>
                                                        <option value="Aromanian Arumanian Macedo-Romanian">Aromanian
                                                            Arumanian Macedo-Romanian</option>
                                                        <option value="Russian">Russian</option>
                                                        <option value="Sandawe">Sandawe</option>
                                                        <option value="Sango">Sango</option>
                                                        <option value="Yakut">Yakut</option>
                                                        <option value="South American Indian (Other)">South American
                                                            Indian (Other)</option>
                                                        <option value="Salishan languages">Salishan languages</option>
                                                        <option value="Samaritan Aramaic">Samaritan Aramaic</option>
                                                        <option value="Sanskrit">Sanskrit</option>
                                                        <option value="Sasak">Sasak</option>
                                                        <option value="Santali">Santali</option>
                                                        <option value="Sicilian">Sicilian</option>
                                                        <option value="Scots">Scots</option>
                                                        <option value="Selkup">Selkup</option>
                                                        <option value="Semitic languages">Semitic languages</option>
                                                        <option value="Irish">Irish</option>
                                                        <option value="Sign Languages">Sign Languages</option>
                                                        <option value="Shan">Shan</option>
                                                        <option value="Sidamo">Sidamo</option>
                                                        <option value="Sinhala Sinhalese">Sinhala Sinhalese</option>
                                                        <option value="Siouan languages">Siouan languages</option>
                                                        <option value="Sino-Tibetan languages">Sino-Tibetan languages
                                                        </option>
                                                        <option value="Slavic languages">Slavic languages</option>
                                                        <option value="Slovak">Slovak</option>
                                                        <option value="Slovenian">Slovenian</option>
                                                        <option value="Southern Sami">Southern Sami</option>
                                                        <option value="Northern Sami">Northern Sami</option>
                                                        <option value="Sami languages">Sami languages</option>
                                                        <option value="Lule Sami">Lule Sami</option>
                                                        <option value="Inari Sami">Inari Sami</option>
                                                        <option value="Samoan">Samoan</option>
                                                        <option value="Skolt Sami">Skolt Sami</option>
                                                        <option value="Shona">Shona</option>
                                                        <option value="Sindhi">Sindhi</option>
                                                        <option value="Soninke">Soninke</option>
                                                        <option value="Sogdian">Sogdian</option>
                                                        <option value="Somali">Somali</option>
                                                        <option value="Songhai languages">Songhai languages</option>
                                                        <option value="Sotho">Sotho</option>
                                                        <option value="Spanish Castilian">Spanish Castilian</option>
                                                        <option value="Sardinian">Sardinian</option>
                                                        <option value="Sranan Tongo">Sranan Tongo</option>
                                                        <option value="Serbian">Serbian</option>
                                                        <option value="Serer">Serer</option>
                                                        <option value="Nilo-Saharan languages">Nilo-Saharan languages
                                                        </option>
                                                        <option value="Swati">Swati</option>
                                                        <option value="Sukuma">Sukuma</option>
                                                        <option value="Sundanese">Sundanese</option>
                                                        <option value="Susu">Susu</option>
                                                        <option value="Sumerian">Sumerian</option>
                                                        <option value="Swahili">Swahili</option>
                                                        <option value="Swedish">Swedish</option>
                                                        <option value="Classical Syriac">Classical Syriac</option>
                                                        <option value="Syriac">Syriac</option>
                                                        <option value="Tahitian">Tahitian</option>
                                                        <option value="Tai languages">Tai languages</option>
                                                        <option value="Tamil">Tamil</option>
                                                        <option value="Tatar">Tatar</option>
                                                        <option value="Telugu">Telugu</option>
                                                        <option value="Timne">Timne</option>
                                                        <option value="Tereno">Tereno</option>
                                                        <option value="Tetum">Tetum</option>
                                                        <option value="Tajik">Tajik</option>
                                                        <option value="Tagalog">Tagalog</option>
                                                        <option value="Thai">Thai</option>
                                                        <option value="Tibetan">Tibetan</option>
                                                        <option value="Tigre">Tigre</option>
                                                        <option value="Tigrinya">Tigrinya</option>
                                                        <option value="Tiv">Tiv</option>
                                                        <option value="Tokelau">Tokelau</option>
                                                        <option value="Klingon tlhIngan-Hol">Klingon tlhIngan-Hol
                                                        </option>
                                                        <option value="Tlingit">Tlingit</option>
                                                        <option value="Tamashek">Tamashek</option>
                                                        <option value="Tonga (Nyasa)">Tonga (Nyasa)</option>
                                                        <option value="Tonga (Tonga Islands)">Tonga (Tonga Islands)
                                                        </option>
                                                        <option value="Tok Pisin">Tok Pisin</option>
                                                        <option value="Tsimshian">Tsimshian</option>
                                                        <option value="Tswana">Tswana</option>
                                                        <option value="Tsonga">Tsonga</option>
                                                        <option value="Turkmen">Turkmen</option>
                                                        <option value="Tumbuka">Tumbuka</option>
                                                        <option value="Tupi languages">Tupi languages</option>
                                                        <option value="Turkish">Turkish</option>
                                                        <option value="Altaic languages">Altaic languages</option>
                                                        <option value="Tuvalu">Tuvalu</option>
                                                        <option value="Twi">Twi</option>
                                                        <option value="Tuvinian">Tuvinian</option>
                                                        <option value="Udmurt">Udmurt</option>
                                                        <option value="Ugaritic">Ugaritic</option>
                                                        <option value="Uighur Uyghur">Uighur Uyghur</option>
                                                        <option value="Ukrainian">Ukrainian</option>
                                                        <option value="Umbundu">Umbundu</option>
                                                        <option value="Undetermined">Undetermined</option>
                                                        <option value="Urdu">Urdu</option>
                                                        <option value="Uzbek">Uzbek</option>
                                                        <option value="Vai">Vai</option>
                                                        <option value="Venda">Venda</option>
                                                        <option value="Vietnamese">Vietnamese</option>
                                                        <option value="VolapÃ¼k">VolapÃ¼k</option>
                                                        <option value="Votic">Votic</option>
                                                        <option value="Wakashan languages">Wakashan languages</option>
                                                        <option value="Walamo">Walamo</option>
                                                        <option value="Waray">Waray</option>
                                                        <option value="Washo">Washo</option>
                                                        <option value="Welsh">Welsh</option>
                                                        <option value="Sorbian languages">Sorbian languages</option>
                                                        <option value="Walloon">Walloon</option>
                                                        <option value="Wolof">Wolof</option>
                                                        <option value="Kalmyk Oirat">Kalmyk Oirat</option>
                                                        <option value="Xhosa">Xhosa</option>
                                                        <option value="Yao">Yao</option>
                                                        <option value="Yapese">Yapese</option>
                                                        <option value="Yiddish">Yiddish</option>
                                                        <option value="Yoruba">Yoruba</option>
                                                        <option value="Yupik languages">Yupik languages</option>
                                                        <option value="Zapotec">Zapotec</option>
                                                        <option value="Blissymbols Blissymbolics Bliss">Blissymbols
                                                            Blissymbolics Bliss</option>
                                                        <option value="Zenaga">Zenaga</option>
                                                        <option value="Zhuang Chuang">Zhuang Chuang</option>
                                                        <option value="Zande languages">Zande languages</option>
                                                        <option value="Zulu">Zulu</option>
                                                        <option value="Zuni">Zuni</option>
                                                    </select>
                                                </div>

                                                <div class="form__group"> <!-- status -->
                                                    <select class="js-example-basic-multiple" id="status"
                                                        name="release_status">
                                                        <option value="on-going">On-going</option>
                                                        <option value="done">Done</option>
                                                        <option value="upcoming">Upcoming</option>
                                                        <option value="postponed">Postponed</option>
                                                        <option value="cancelled">Canceled</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form__group"> <!-- storyline box -->
                                                    <textarea id="text" name="story_line" class="form__textarea"
                                                        placeholder="Storyline"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 crew_information"> <!-- CAST AND CREW SECTION -->
                                        <div class="title">
                                            <h2>Cast/Crew Information</h2>
                                        </div>

                                        <!--                                <div class="row">
                                                                    <div class="col-12 director">   director 
                                                                        <div class="sub_title" id="director">
                                                                            <p>Director</p>
                                                                            <a class="addBtn">&plus;</a>
                                                                        </div>
                                
                                                                        <div class="input_group">
                                                                        </div>
                                
                                                                    </div>
                                
                                                                    <div class="col-12 writer">    writer 
                                                                        <div class="sub_title" id="writer">
                                                                            <p>Writer</p>
                                                                            <a class="addBtn">&plus;</a>
                                                                        </div>
                                
                                                                        <div class="input_group">
                                                                        </div>
                                
                                                                    </div>
                                
                                                                    <div class="col-12 cast">  top cast 
                                                                        <div class="sub_title" id="cast">
                                                                            <p>Top Cast</p>
                                                                            <a class="addBtn">&plus;</a>
                                                                        </div>
                                
                                                                        <div class="input_group">
                                                                        </div>
                                                                    </div>-->

                                        <div class="col-12">
                                            <input type="submit" class="form__btn" value="Contribute">
                                        </div>


                                    </div>
                                </div>
                        </div>

                        </form>
                    </div>
                    <!-- end form -->
                    <jsp:include page="/view/user/Component/footer/Footer.jsp" />

                </div>



                <!--</main>-->
                <!-- end main content -->

                <!-- JS -->
                <script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>

                <script type="text/javascript">
                    const firebaseConfig = {
                        // insert config info
                    };
                    firebase.initializeApp(firebaseConfig);
                    var image = '';
                    // firebase bucket name
                    var fbBucketName = '<bucket-name>';
                    // get elements
                    var uploader = document.getElementById('uploader');
                    var fileButton = document.getElementById('fileButton');
                    // listen for file selection
                    fileButton.addEventListener('change', function (e) {
                        if (image !== '') {
                            // Nếu có, xóa ảnh đó từ Firebase Storage trước khi tải lên ảnh mới
                            var oldImageRef = firebase.storage().refFromURL(image);
                            oldImageRef.delete().then(function () {
                                var file = e.target.files[0];
                                // create a storage ref
                                const storageRef = firebase.storage().ref().child('film/' + file.name);
                            }).catch(function (error) {
                                console.error('Error deleting old image:', error);
                            });
                        }

                        // what happened
                        console.log('file upload event', e);
                        // get file
                        var file = e.target.files[0];
                        // create a storage ref
                        const storageRef = firebase.storage().ref().child('film/' + file.name);

                        // upload file
                        var uploadTask = storageRef.put(file);
                        // The part below is largely copy-pasted from the 'Full Example' section from
                        // https://firebase.google.com/docs/storage/web/upload-files

                        // update progress bar
                        uploadTask.on(firebase.storage.TaskEvent.STATE_CHANGED, // or 'state_changed'
                            function (snapshot) {
                                // Get task progress, including the number of bytes uploaded and the total number of bytes to be uploaded
                                var progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                                uploader.value = progress;
                                console.log('Upload is ' + progress + '% done');
                                switch (snapshot.state) {
                                    case firebase.storage.TaskState.PAUSED: // or 'paused'
                                        console.log('Upload is paused');
                                        break;
                                    case firebase.storage.TaskState.RUNNING: // or 'running'
                                        console.log('Upload is running');
                                        break;
                                }
                            }, function (error) {

                                // A full list of error codes is available at
                                // https://firebase.google.com/docs/storage/web/handle-errors
                                switch (error.code) {
                                    case 'storage/unauthorized':
                                        // User doesn't have permission to access the object
                                        break;
                                    case 'storage/canceled':
                                        // User canceled the upload
                                        break;
                                    case 'storage/unknown':
                                        // Unknown error occurred, inspect error.serverResponse
                                        break;
                                }
                            }, function () {
                                // Upload completed successfully, now we can get the download URL
                                // save this link in SQL database
                                var downloadURL = uploadTask.snapshot.downloadURL;
                                image = downloadURL;
                                console.log('downloadURL ===>', downloadURL);
                                let divLocation = document.getElementById("imgDiv");
                                let imgElement = document.createElement("img");
                                imgElement.src = downloadURL;
                                imgElement.width = 100;
                                imgElement.height = 100;
                                console.log('pic ==', downloadURL);
                                divLocation.innerHTML = '';
                                divLocation.append(imgElement);
                                document.getElementById('image').value = downloadURL;
                            });
                    });

                    function toggleUploadMethod() {
                        var uploadFileOption = document.getElementById("uploadFileOption");
                        var insertLinkOption = document.getElementById("insertLinkOption");
                        var fileButton = document.getElementById("fileButton");
                        var imgDiv = document.getElementById("imgDiv");
                        var imageInput = document.getElementById("image");

                        if (uploadFileOption.checked) {
                            fileButton.style.display = "block";
                            imgDiv.style.display = "block";
                            imageInput.style.display = "none";
                        } else if (insertLinkOption.checked) {
                            fileButton.style.display = "none";
                            imgDiv.style.display = "none";
                            imageInput.style.display = "block";
                        }
                    }
                </script>
                <script src="view/user/contribute/addNewFilm/js/jquery-3.5.1.min.js"></script>
                <script src="view/user/contribute/addNewFilm/js/bootstrap.bundle.min.js"></script>
                <script src="view/user/contribute/addNewFilm/js/jquery.magnific-popup.min.js"></script>
                <script src="view/user/contribute/addNewFilm/js/smooth-scrollbar.js"></script>
                <script src="view/user/contribute/addNewFilm/js/select2.min.js"></script>
                <script src="view/user/contribute/addNewFilm/js/admin.js"></script>
            </body>

            </html>