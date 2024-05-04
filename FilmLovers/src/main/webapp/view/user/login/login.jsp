<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!--
          #PRIMARY META TAGS
        -->
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta
            name="description"
            content="CineVerse is an essential moviedb web application which is made by UmangUdit96"
            />
        <!--  -->

        <!--
          #FAVICON
        -->
        <link rel="icon" href="/film-lovers/view/user/login/img/favicon.png" type="image/png" />
        <!--  -->

        <!--
          #FONT AWESOME JS
        -->
        <script
            src="https://kit.fontawesome.com/64d58efce2.js"
            crossorigin="anonymous"
        ></script>
        <!--  -->

        <!--
          #EXTERNAL CSS
        -->
        <link rel="stylesheet" href="/film-lovers/view/user/login/login.css" />
        <!--  -->

        <!--
          #PAGE TITLE
        -->
        <title>Login Page</title>
        <!--  -->
        <%
            //delete cache to prevent go-back button after logout
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
        %>

    </head>

    <body>
        <!--If they were signing up with the wrong email (used...)
            then reload the page at the sign-up-mode-->
        <%
            if (request.getAttribute("signupInvalidMsg") != null || request.getAttribute("signupNextStep") != null) {
        %>
        <div class="container sign-up-mode">
            <%
            } else {
            %>
            <div class="container">
                <%
                    }
                %>
                <div class="forms-container">
                    <div class="signin-signup">

                        <form action="/film-lovers/login" class="sign-in-form" method="POST">
                            <h2 class="title">Sign in</h2>
                            <div class="input-field">
                                <i class="fas fa-user"></i>
                                <input type="text" placeholder="Username" name="txtUsername" 
                                       value="<%= request.getParameter("txtUsername") != null ? request.getParameter("txtUsername") : ""%>"/>
                            </div>
                            <div class="input-field">
                                <i class="fas fa-lock"></i>
                                <input type="password" placeholder="Password" name="txtPassword"
                                       value="<%= request.getParameter("txtPassword") != null ? request.getParameter("txtPassword") : ""%>"/>
                            </div>
                            <input name="action" value="login" type="hidden">
                            <input type="submit" value="Login" class="btn solid" />
                            <%
                                if (request.getAttribute("loginError") != null) {
                            %>
                            <div style='color:red;'>${requestScope.loginError}</div>
                            <%
                                }
                            %>
                            <p class="social-text">Or Sign in with social platforms</p>
                            <div class="social-media">
                                <button class="social-icon">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                </button>
                                <button class="social-icon">
                                    <a href="#"> <i class="fab fa-twitter"></i></a>
                                </button>
                                <button onclick="loginGoogle()" class="social-icon">
                                    <i class="fab fa-google"></i>
                                </button>
                            </div>
                        </form>
                        <form action="/film-lovers/login" class="sign-up-form" method="POST">
                            <h2 class="title">Sign up</h2>

                            <div class="input-field">
                                <i class="fas fa-envelope"></i>
                                <input type="email" placeholder="Email" name="txtEmail" 
                                       value="<%= request.getParameter("txtEmail") != null ? request.getParameter("txtEmail") : ""%>" required/>
                            </div>
                            <%
                                if (request.getAttribute("signupNextStep") != null) {
                            %>
                            <div class="input-field">
                                <i class="fas fa-user"></i>
                                <input type="text" placeholder="Username" name="txtUsername" 
                                       value="<%= request.getParameter("txtUsername") != null ? request.getParameter("txtUsername") : ""%>"/>
                            </div>
                            <div class="input-field">
                                <i class="fas fa-lock"></i>
                                <input id="password" type="password" placeholder="Password" name="txtPassword"/>
                            </div>
                            <div class="input-field" >
                                <i class="fas fa-lock"></i>
                                <input id="confirmPassword" type="password" placeholder="Confirm Password" name="confirmPassword" oninput="mismatch()" />
                            </div>
                            <input name="action" value="createAccount" type="hidden">
                            <p id="mismatch" style="color:red;"></p>
                            <%
                            } else {
                            %>
                            <input name="action" value="signup" type="hidden">

                            <%
                                }
                            %>

                            <%
                                if (request.getAttribute("signupInvalidMsg") != null) {
                            %>
                            <p style='color:red;'>${requestScope.signupInvalidMsg}</p>
                            <%
                                }
                            %>
                            <input type="submit" class="btn" id="signup" value="Sign up" />
                            <p class="social-text">Or Sign up with social platforms</p>
                            <div class="social-media">
                                <button class="social-icon">
                                    <a href="#" >
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                </button>
                                <button class="social-icon">
                                    <a href="#" >
                                        <i class="fab fa-twitter"></i>
                                    </a>
                                </button>
                                <button onclick="loginGoogle()" class="social-icon">
                                    <i class="fab fa-google"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="panels-container">
                    <div class="panel left-panel">
                        <div class="content">
                            <h3>New here ?</h3>
                            <p>Join now to unlock the full movie experience! Sign up today.</p>
                            <button class="btn transparent" id="sign-up-btn">Sign up</button>
                        </div>
                        <img
                            src="/film-lovers/view/user/login/img/toy-story-41224.png"
                            class="image"
                            id="image-drag"
                            alt=""
                            />
                    </div>
                    <div class="panel right-panel">
                        <div class="content">
                            <h3>One of us ?</h3>
                            <p>Welcome back! Sign in now for more movie magic!</p>
                            <button class="btn transparent" id="sign-in-btn">Sign in</button>
                        </div>
                        <img src="/film-lovers/view/user/login/img/pngwing.com (1).png" class="image" alt="" />
                    </div>
                </div>
            </div>

            <!--
              #EXTERNAL JS
            -->
            <script src="/film-lovers/view/user/login/js/app.js"></script>
            <script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js"></script>
            <script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-auth.js"></script>
            <script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-database.js"></script>
            <script src="/film-lovers/view/user/login/js/firebase.js"></script>
            <script>
                function mismatch() {
                    var pw = document.getElementById("password");
                    var confirmpw = document.getElementById("confirmPassword");
                    var error = document.getElementById("mismatch")
                    var signupButton = document.getElementById("signup");
                    if (pw.value !== confirmpw.value) {
                      confirmpw.style.color = "red";
                      signupButton.disabled = true;
                      error.innerHTML = "Password mismatch!"
                    } else {
                      error.innerHTML = "";
                      confirmpw.style.color = "";
                      signupButton.disabled = false;}
                                    }
            </script>
    </body>
</html>
