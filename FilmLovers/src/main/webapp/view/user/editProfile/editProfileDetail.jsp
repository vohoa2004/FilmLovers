<%@page import="filmlovers.model.Account.AccountDTO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="/film-lovers/view/user/editProfile/editProfileDetail.css" />
        <title>Edit Profile</title>
    </head>
    <body>
        <jsp:include page="/view/user/Component/header/Header.jsp" />
        <%
            AccountDTO user = (AccountDTO) session.getAttribute("authentication");
            if (user == null) {
                AccountDTO createAccount = (AccountDTO) request.getAttribute("account");
                pageContext.setAttribute("account", createAccount);

            } else {
                pageContext.setAttribute("account", user);
            }
        %>
        <div class="container">
            <div class="" style="display: flex; justify-content: space-between">
                <div class="" style="width: 65%">
                    <div class="title">Profile Detail</div>
                    <form action="/film-lovers/account?action=update-info" method="POST">
                        <div class="edit_left">
                            <div class="edit_user_id">
                                <div>
                                    <div class="user_id">Email</div>
                                    <input type="text" name="txtEmail" value="${account.email}" class="user_name" style="background: none; border:none" readonly>

                                </div>
                            </div>
                            <div class="edit_user_id">
                                <div>
                                    <div class="user_id">User ID</div>
                                    <input type="text" name="txtUsername" value="${account.username}" class="user_name" style="background: none; border:none" readonly>
                                    <input type="hidden" value="${account.password}" name="txtPassword" >
                                </div>
                                <button class="edit_btn">Edit</button>
                            </div>
                            <div class="edit_user_id flex">
                                <div >
                                    <div class="user_id">First Name</div>
                                    <input type="text" name="txtFirstName" value="${account.firstName}" class="user_name" style="border:none;width: 60%">

                                </div>
                                <div class="">
                                    <div class="user_id">Last Name</div>
                                    <input type="text" name="txtLastName" value="${account.lastName}" class="user_name" style="border:none;width: 60%">
                                </div>
                            </div>

                            <progress value="0" max="100" id="uploader">0%</progress>
                            <!--IMG Upload -->
                            <input type="file" value="upload" accept="image/*" id="fileButton">
                            <input name="image" type="text" id="image" style="display: none">
                            <div id="imgDiv" style="height: 200px; width: 200px"></div>
                            <!--                            </div>-->
                            <div class=""  style="  display: flex;
                                 align-items: center;   margin-top: 10px;  margin-bottom: 10px;"  >
                                <div class="title_dob">Date of Birth</div>
                                <select name="date" id="date" class="date" ></select>
                                <select name="month" id="month" class="month" ></select>
                                <select name="year" id="year" class="year" ></select>
                            </div>
                            <div class="" style="display: flex; align-items: center">
                                <div class="title_country">Country/Region of Residence</div>
                                <select name="address" id="" class="country_select">

                                    <option value="Afghanistan">Afghanistan</option>
                                    <option value="Åland Islands">Åland Islands</option>
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
                                    <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
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
                                    <option value="Central African Republic">Central African Republic</option>
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
                                    <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
                                    <option value="Latvia">Latvia</option>
                                    <option value="Lebanon">Lebanon</option>
                                    <option value="Lesotho">Lesotho</option>
                                    <option value="Liberia">Liberia</option>
                                    <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
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
                                    <option value="Netherlands Antilles">Netherlands Antilles</option>
                                    <option value="New Caledonia">New Caledonia</option>
                                    <option value="New Zealand">New Zealand</option>
                                    <option value="Nicaragua">Nicaragua</option>
                                    <option value="Niger">Niger</option>
                                    <option value="Nigeria">Nigeria</option>
                                    <option value="Niue">Niue</option>
                                    <option value="Norfolk Island">Norfolk Island</option>
                                    <option value="Northern Mariana Islands">Northern Mariana Islands</option>
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
                                    <option value="Sao Tome and Principe">Sao Tome and Principe</option>
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
                                    <option value="Syrian Arab Republic">Syrian Arab Republic</option>
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
                                    <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                                    <option value="Tuvalu">Tuvalu</option>
                                    <option value="Uganda">Uganda</option>
                                    <option value="Ukraine">Ukraine</option>
                                    <option value="United Arab Emirates">United Arab Emirates</option>
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
                            <input class="save_btn" type="submit" value="Save Profile"/>
                        </div>
                    </form>
                    <!--</div>-->
                    <!--                    </div>-->
                </div>

                <div class="edit_right">
                    <% if (user != null) { %>
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
                    <% } %>
                </div>
            </div>

        </div>
        <!--        </div>-->
        <script src="/film-lovers/view/user/editProfile/editProDetail.js"></script>
        <script src="/film-lovers/view/user/editProfile/jquery-3.5.1.min.js"></script>
        <script src="/film-lovers/view/user/editProfile/jquery.magnific-popup.min.js"></script>
        <script src="/film-lovers/view/user/editProfile/select2.min.js"></script>
        <script src="/film-lovers/view/user/editProfile/smooth-scrollbar.js"></script>
        <script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>


        <script type="text/javascript">
            const firebaseConfig = {
                apiKey: "AIzaSyB6xYXr5MVsQ3_zQrTPjzalfGpnuu9p2V4",
                authDomain: "film-lovers-6033d.firebaseapp.com",
                projectId: "film-lovers-6033d",
                storageBucket: "film-lovers-6033d.appspot.com",
                messagingSenderId: "267683105064",
                appId: "1:267683105064:web:ac966f9db6bc1b1c35681d",
                measurementId: "G-G0D7KL1R1S"
            };
            firebase.initializeApp(firebaseConfig);
            var image = '';
            // firebase bucket name
            var fbBucketName = 'film-lovers-6033d.appspot.com';
            // get elements
            var uploader = document.getElementById('uploader');
            var fileButton = document.getElementById('fileButton');
            // listen for file selection
            fileButton.addEventListener('change', function (e) {
                if (image !== '') {

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
                const storageRef = firebase.storage().ref().child('avatar-user/' + file.name);

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
                    imgElement.width = 200;
                    imgElement.height = 200;
                    console.log('pic ==', downloadURL);
                    divLocation.innerHTML = '';
                    divLocation.append(imgElement);
                    document.getElementById('image').value = downloadURL;
                });
            });
        </script>
        <jsp:include page="/view/user/Component/footer/Footer.jsp" />
    </body>
</html>
