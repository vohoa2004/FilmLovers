<%-- 
    Document   : add-new-film
    Created on : Feb 22, 2024, 4:06:23 PM
    Author     : vothimaihoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add film contribute</title>
    </head>
    <body>
        <c:if test="${requestScope.error != null}">
            <h1>${requestScope.error}</h1>
        </c:if>

        <c:if test="${sessionScope.authentication.role eq 'user'}">
            <form action="/film-lovers/contribute?action=add-film" method="POST">        
                <label>Photo</label>

                <label for="uploadFileOption">
                    Upload file:
                    <input type="radio" id="uploadFileOption" name="uploadOption" value="file" onchange="toggleUploadMethod()">
                </label>
                <input type="file" value="upload" accept="image/*" id="fileButton" style="display: none;">
                <div id="imgDiv" style="display: none;"></div>

                <label for="insertLinkOption">
                    Insert link:
                    <input type="radio" id="insertLinkOption" name="uploadOption" value="link" onchange="toggleUploadMethod()">
                </label>
                <input type="text" name="image" id="image" style="display: none;">

                <br>
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" required><br><br>

                <label for="type">Type:</label>
                <select id="type" name="type">
                    <option value="movie">Movie</option>
                    <option value="series">Series</option>
                </select><br><br>

                <label for="language">Language:</label>
                <input type="text" id="language" name="language" required><br><br>

                <label for="country">Country:</label>
                <input type="text" id="country" name="country" required><br><br>

                <label for="release_year">Release Year:</label>
                <input type="number" id="release_year" name="release_year" min="1900" max="2100" required><br><br>

                <label for="release_month">Release Month:</label>
                <input type="number" id="release_month" name="release_month" min="1" max="12" required><br><br>

                <label for="release_status">Release Status:</label>
                <select id="release_status" name="release_status">
                    <option value="on-going">On-going</option>
                    <option value="done">Done</option>
                    <option value="upcoming">Upcoming</option>
                    <option value="postponed">Postponed</option>
                    <option value="cancelled">Canceled</option>
                </select><br><br>

                <label for="description">Description:</label><br>
                <textarea id="description" name="description" rows="4" cols="50"></textarea><br><br>

                <label for="story_line">Story Line:</label><br>
                <textarea id="story_line" name="story_line" rows="4" cols="50"></textarea><br><br>

                <label for="runtime">Runtime (minutes):</label>
                <input type="number" id="runtime" name="runtime" min="0" required><br><br>

                <label for="visible_status">Visible Status:</label>
                <select id="visible_status" name="visible_status">
                    <option value="show">Show</option>
                    <option value="hidden">Hidden</option>
                </select><br><br>

                <input type="submit" value="Submit">
            </form>
        </c:if>

        <c:if test="${sessionScope.authentication.role eq 'admin'}">
            <h4>Contribute Film</h4>
            <label>Photo</label>
            <c:if test="${not empty requestScope.film.photo}">
                <img src="${requestScope.film.photo}">
            </c:if>
            <br>

            <label>Title:</label>
            <c:if test="${not empty requestScope.film.title}">
                ${requestScope.film.title}
            </c:if>
            <br>

            <label>Type:</label>
            <c:if test="${not empty requestScope.film.type}">
                ${requestScope.film.type}
            </c:if>
            <br>
            <label>Language:</label>
            <c:if test="${not empty requestScope.film.language}">
                ${requestScope.film.language}
            </c:if>
            <br>
            <label>Country:</label>
            <div id="countryInfo">
            </div>
            <c:if test="${not empty requestScope.film.country}">
                ${requestScope.film.country}
            </c:if>
            <br>
            <label>Release Year:</label>
            <div id="releaseYearInfo">
            </div><c:if test="${not empty requestScope.film.releaseYear}">
                ${requestScope.film.releaseYear}
            </c:if>
            <br>
            <label>Release Month:</label>
            <c:if test="${not empty requestScope.film.releaseMonth}">
                ${requestScope.film.releaseMonth}
            </c:if>
            <br>
            <label>Release Status:</label>
            <c:if test="${not empty requestScope.film.releaseStatus}">
                ${requestScope.film.releaseStatus}
            </c:if>
            <br>
            <label>Description:</label>
            <c:if test="${not empty requestScope.film.description}">
                ${requestScope.film.description}
            </c:if>
            <br>
            <label>Story Line:</label>
            <c:if test="${not empty requestScope.film.storyLine}">
                ${requestScope.film.storyLine}
            </c:if>
            <br>
            <label>Runtime (minutes):</label>
            <c:if test="${not empty requestScope.film.runtime}">
                ${requestScope.film.runtime}
            </c:if>
            <br>
            <form action="contribute-check" method="POST">
                <input type="hidden" name="filmId" value="${requestScope.film.id}">
                <input type="hidden" value="approve-film" name="action">
                <input type="submit" value="Approve">
            </form>
            <form action="contribute-check" method="POST">
                <input type="hidden" name="filmId" value="${requestScope.film.id}">
                <input type="hidden" value="reject-film" name="action">
                <input type="submit" value="Reject" name="action">
            </form>

        </c:if>
        <!--upload image-->
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

    </script>   
</body>
</html>
