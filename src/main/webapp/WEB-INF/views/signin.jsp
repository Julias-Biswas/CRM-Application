<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign in - CRM</title>
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
		<div class="form sign-in">
			<div class="form-content">
				<h2 class="h2-heading c-lg-blue text-center">Sign in</h2>

				<c:if test="${not empty model_error}">
					<div
						class="alert alert-danger d-flex align-items-center alert-dismissible fade show"
						role="alert">
						<img src="/images/cross.svg" alt="Error Image"
							class="msg_icon-design">
						<div class="msg-para">${model_error}</div>
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>
				<c:if test="${not empty model_success}">
					<div
						class="alert alert-success d-flex align-items-center alert-dismissible fade show"
						role="alert">
						<img src="/images/tick.svg" alt="Success Icon"
							class="msg_icon-design">
						<div class="msg-para">${model_success}</div>
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>

				<form action="/signInForm" method="post">
					<div class="field input-field">
						<input type="email" name="email" placeholder="Email" class="input">
						<i class='bx bx-envelope all-icon'></i>
					</div>
					<div class="field input-field">
						<input type="password" name="password" placeholder="Password"
							class="password" onblur="showHidePassword()"> <i
							class='bx bx-hide all-icon eye-icon'></i>
					</div>
					<div class="form-link">
						<a href="#" class="forgot-pass">Forgot password?</a>
					</div>
					<div class="field button-field">
						<button type="submit">Sign in</button>
					</div>
					<div class="form-link">
						<span>New user? <a href="/signup" class="link sign_up-link">Sign
								up</a></span>
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