<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- CSS -->
	<link rel="stylesheet" href="css/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="css/bootstrap-grid.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/select2.min.css">
	<link rel="stylesheet" href="css/admin.css">

	<!-- font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">

	<!-- Favicons -->
	<link rel="icon" type="image/png" href="icon/favicon-32x32.png" sizes="32x32">
	<link rel="apple-touch-icon" href="icon/favicon-32x32.png">

	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="Dmitry Volkov">
	<title>Admin Profile</title>
</head>

<body>
	<!-- header -->
	<header class="header">
		<div class="header__content">
			<!-- header logo -->
			<a href="#" class="header__logo">
				<img src="img/logo.svg" alt="">
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

	<!-- sidebar -->
	<div class="sidebar">
		<!-- sidebar logo -->
		<a href="#" class="sidebar__logo">
			<p>Film Lovers</p>
		</a>
		<!-- end sidebar logo -->

		<!-- sidebar user -->
		<div class="sidebar__user">
			<div class="sidebar__user-img">
				<a href="#">
					<img src="img/user.svg" alt="">
				</a>
			</div>

			<div class="sidebar__user-title">
				<span>Admin</span>
				<p>John Doe</p>
			</div>

			<a href="#" class="sidebar__user-btn" type="button">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
					<path
						d="M4,12a1,1,0,0,0,1,1h7.59l-2.3,2.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l4-4a1,1,0,0,0,.21-.33,1,1,0,0,0,0-.76,1,1,0,0,0-.21-.33l-4-4a1,1,0,1,0-1.42,1.42L12.59,11H5A1,1,0,0,0,4,12ZM17,2H7A3,3,0,0,0,4,5V8A1,1,0,0,0,6,8V5A1,1,0,0,1,7,4H17a1,1,0,0,1,1,1V19a1,1,0,0,1-1,1H7a1,1,0,0,1-1-1V16a1,1,0,0,0-2,0v3a3,3,0,0,0,3,3H17a3,3,0,0,0,3-3V5A3,3,0,0,0,17,2Z" />
				</svg>
			</a>
		</div>
		<!-- end sidebar user -->

		<!-- sidebar nav -->

		<!-- Movie Database collapse -->
		<li class="sidebar__nav-item">
			<a class="sidebar__nav-link collapsed" data-toggle="collapse" href="#collapseMenu" role="button"
				aria-expanded="false" aria-controls="collapseMenu"><svg xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 24 24">
					<path
						d="M19,5.5H12.72l-.32-1a3,3,0,0,0-2.84-2H5a3,3,0,0,0-3,3v13a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V8.5A3,3,0,0,0,19,5.5Zm1,13a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V5.5a1,1,0,0,1,1-1H9.56a1,1,0,0,1,.95.68l.54,1.64A1,1,0,0,0,12,7.5h7a1,1,0,0,1,1,1Z">
					</path>
				</svg> <span>Movie Database</span> <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
					<path
						d="M17,9.17a1,1,0,0,0-1.41,0L12,12.71,8.46,9.17a1,1,0,0,0-1.41,0,1,1,0,0,0,0,1.42l4.24,4.24a1,1,0,0,0,1.42,0L17,10.59A1,1,0,0,0,17,9.17Z">
					</path>
				</svg></a>

			<ul class="sidebar__menu collapse" id="collapseMenu" style="">
				<li><a href="#">Add titles</a></li>
				<li><a href="#">Add a new movie/ TV Show</a></li>
			</ul>
		</li>
		<!-- end collapse -->


		<li class="sidebar__nav-item"> <!-- user -->
			<a href="#" class="sidebar__nav-link"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
					<path
						d="M12.3,12.22A4.92,4.92,0,0,0,14,8.5a5,5,0,0,0-10,0,4.92,4.92,0,0,0,1.7,3.72A8,8,0,0,0,1,19.5a1,1,0,0,0,2,0,6,6,0,0,1,12,0,1,1,0,0,0,2,0A8,8,0,0,0,12.3,12.22ZM9,11.5a3,3,0,1,1,3-3A3,3,0,0,1,9,11.5Zm9.74.32A5,5,0,0,0,15,3.5a1,1,0,0,0,0,2,3,3,0,0,1,3,3,3,3,0,0,1-1.5,2.59,1,1,0,0,0-.5.84,1,1,0,0,0,.45.86l.39.26.13.07a7,7,0,0,1,4,6.38,1,1,0,0,0,2,0A9,9,0,0,0,18.74,11.82Z" />
				</svg> <span>Users</span></a>
		</li>

		<!-- Review collapse -->
		<li class="sidebar__nav-item">
			<a class="sidebar__nav-link collapsed" data-toggle="collapse" href="#ReviewCollapseMenu" role="button"
				aria-expanded="false" aria-controls="collapseMenu"><svg xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 24 24">
					<path
						d="M19,5.5H12.72l-.32-1a3,3,0,0,0-2.84-2H5a3,3,0,0,0-3,3v13a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V8.5A3,3,0,0,0,19,5.5Zm1,13a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V5.5a1,1,0,0,1,1-1H9.56a1,1,0,0,1,.95.68l.54,1.64A1,1,0,0,0,12,7.5h7a1,1,0,0,1,1,1Z">
					</path>
				</svg> <span>Review</span> <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
					<path
						d="M17,9.17a1,1,0,0,0-1.41,0L12,12.71,8.46,9.17a1,1,0,0,0-1.41,0,1,1,0,0,0,0,1.42l4.24,4.24a1,1,0,0,0,1.42,0L17,10.59A1,1,0,0,0,17,9.17Z">
					</path>
				</svg></a>

			<ul class="sidebar__menu collapse" id="ReviewCollapseMenu" style="">
				<li><a href="#">All reviews</a></li>
				<li><a href="#">Reported reviews</a></li>
			</ul>
		</li>
		<!-- end collapse -->


		<li class="sidebar__nav-item"> <!-- Link "Back to Film Lover" -->
			<a href="#" class="sidebar__nav-link"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
					<path
						d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z" />
				</svg> <span>Back to Film Lovers</span></a>
		</li>
		</ul>
		<!-- end sidebar nav -->

		<!-- sidebar copyright -->
		<div class="sidebar__copyright">© FlixTV.template, 2021. <br>Create by <a
				href="https://themeforest.net/user/dmitryvolkov/portfolio" target="_blank">Dmitry Volkov</a></div>
		<!-- end sidebar copyright -->
	</div>
	<!-- end sidebar -->

	<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>ADMIN PROFILE</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- profile -->
				<div class="col-12">
					<div class="profile__content">
						<!-- profile user -->
						<div class="profile__user">
							<div class="profile__avatar">
								<img src="img/user.svg" alt="">
							</div>
							<!-- or red -->
							<div class="profile__meta profile__meta--green">
								<h3 style="color: #2F80ED;">Username</h3>
								<span>Role: Admin</span>
							</div>
						</div>
						<!-- end profile user -->
					</div>
				</div>
				<!-- end profile -->

				<!-- content tabs -->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="1-tab">
						<div class="col-12">
							<div class="sign__wrap">
								<div class="row">
									<!-- details form -->
									<div class="col-12 col-lg-6">
										<form action="#" class="sign__form sign__form--profile sign__form--first">
											<div class="row">
												<div class="col-12">
													<h4 class="sign__title">Profile details</h4>
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<div class="sign__group">
														<label class="sign__label" for="firstname">First name</label>
														<input id="firstname" type="text" name="firstname"
															class="sign__input" placeholder="John">
													</div>
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<div class="sign__group">
														<label class="sign__label" for="lastname">Last name</label>
														<input id="lastname" type="text" name="lastname"
															class="sign__input" placeholder="Doe">
													</div>
												</div>

												<!-- <div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<div class="sign__group">
														<label class="sign__label" for="username">Login</label>
														<input id="username" type="text" name="username"
															class="sign__input" placeholder="User123">
													</div>
												</div> -->

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<div class="sign__group">
														<label class="sign__label" for="email">Email</label>
														<input id="email" type="text" name="email" class="sign__input"
															placeholder="email@email.com">
													</div>
												</div>

												

												<!-- <div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<div class="sign__group">
														<label class="sign__label"
															for="subscription">Subscription</label>
														<select class="js-example-basic-single" id="subscription">
															<option value="Basic">Basic</option>
															<option value="Premium">Premium</option>
															<option value="Cinematic">Cinematic</option>
														</select>
													</div>
												</div> -->
<!-- 
												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<div class="sign__group">
														<label class="sign__label" for="rights">Rights</label>
														<select class="js-example-basic-single" id="rights">
															<option value="User">User</option>
															<option value="Moderator">Moderator</option>
															<option value="Admin">Admin</option>
														</select>
													</div>
												</div> -->

												<div class="col-12">
													<button class="sign__btn" type="button">Save</button>
												</div>
											</div>
										</form>
									</div>
									<!-- end details form -->

									<!-- password form -->
									<div class="col-12 col-lg-6">
										<form action="#" class="sign__form sign__form--profile">
											<div class="row">
												<div class="col-12">
													<h4 class="sign__title">Change password</h4>
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<div class="sign__group">
														<label class="sign__label" for="oldpass">Old password</label>
														<input id="oldpass" type="password" name="oldpass"
															class="sign__input">
													</div>
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<div class="sign__group">
														<label class="sign__label" for="newpass">New password</label>
														<input id="newpass" type="password" name="newpass"
															class="sign__input">
													</div>
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<div class="sign__group">
														<label class="sign__label" for="confirmpass">Confirm new
															password</label>
														<input id="confirmpass" type="password" name="confirmpass"
															class="sign__input">
													</div>
												</div>

												<div class="col-12">
													<button class="sign__btn" type="button">Change</button>
												</div>
											</div>
										</form>
									</div>
									<!-- end password form -->
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
			<!-- end content tabs -->
		</div>
		</div>
	</main>
	<!-- end main content -->


	<!-- JS -->
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/smooth-scrollbar.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/admin.js"></script>
</body>

</html>