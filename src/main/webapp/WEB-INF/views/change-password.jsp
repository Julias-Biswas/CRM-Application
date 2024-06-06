<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Change Password - CRM</title>
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

	<c:choose>
		<c:when test="${session_emp.getModule().equals('Employee')}">
			<jsp:include page="employee-navbar.jsp" />
		</c:when>

		<c:when test="${session_admin.getModule().equals('Admin')}">
			<jsp:include page="admin-navbar.jsp" />
		</c:when>

		<c:when test="${empty session_emp}">
			<jsp:include page="crm-navbar.jsp" />
		</c:when>

		<c:when test="${empty session_admin}">
			<jsp:include page="crm-navbar.jsp" />
		</c:when>
	</c:choose>

	<section class="form-container forms bg-light-blue-01">
		<div class="form sign-up">
			<div class="form-content">
				<h2 class="h2-heading c-lg-blue text-center">Change Password</h2>
				<form action="javascript:void(0)" method="post">
					<div class="field input-field">
						<input type="password" name="old_password"
							placeholder="Old Password" class="password"
							onblur="showHidePassword()"> <i
							class='bx bx-hide all-icon eye-icon'></i>
					</div>
					<div class="field input-field">
						<input type="password" name="new_password"
							placeholder="New Password" class="password"
							onblur="showHidePassword()"> <i
							class='bx bx-hide all-icon eye-icon'></i>
					</div>
					<div class="field input-field">
						<input type="password" name="re_new_password"
							placeholder="Re-New Password" class="password"
							onblur="showHidePassword()"> <i
							class='bx bx-hide all-icon eye-icon'></i>
					</div>
					<div class="field button-field">
						<button type="submit">Submit</button>
					</div>
				</form>
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