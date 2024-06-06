<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign up - CRM</title>
<link rel="icon" type="image/x-icon" href="/images/company-icon.png">

<!-- Manual CSS File -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/media.css">

<!-- CSS bundles for Bootstrap 5 -->
<link rel="stylesheet" href="/assets/css/bootstrap.min.css">

<!-- Boxicons CSS -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
</head>

<body>
	<jsp:include page="crm-navbar.jsp" />

	<section class="form-container forms bg-light-blue-01">
		<div class="form sign-up">
			<div class="form-content">
				<h2 class="h2-heading c-lg-blue text-center">Sign up</h2>
				<form action="#" method="post">
					<div class="field input-field">
						<input type="email" name="email" placeholder="Email" class="input">
						<i class='bx bx-envelope all-icon'></i>
					</div>
					<div class="field input-field">
						<input type="password" name="password" placeholder="Password"
							class="password" onblur="showHidePassword()"> <i
							class='bx bx-hide all-icon eye-icon'></i>
					</div>
					<div class="field input-field">
						<input type="password" name="re_password"
							placeholder="Re-password" class="password"
							onblur="showHidePassword()"> <i
							class='bx bx-hide all-icon eye-icon'></i>
					</div>
					<div class="field button-field">
						<button type="submit">Sign up</button>
					</div>
					<div class="form-link">
						<span>Already have an account? <a href="/signin"
							class="link sign_in-link">Sign in</a></span>
					</div>
				</form>
			</div>

			<div class="line"></div>

			<div class="media-options">
				<a href="#" class="field google"> <img src="/images/google.svg"
					alt="" class="google-img"> <span>Sign in with Google</span>
				</a>
			</div>

			<div class="media-options">
				<a href="#" class="field facebook"> <i
					class='bx bxl-facebook facebook-icon'></i> <span>Sign in
						with Facebook</span>
				</a>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp" />

	<!-- Manual JavaScript File -->
	<script src="/js/script.js"></script>

	<!-- JavaScript plugins for Bootstrap 5 -->
	<script src="/assets/js/bootstrap.min.js"></script>
</body>

</html>