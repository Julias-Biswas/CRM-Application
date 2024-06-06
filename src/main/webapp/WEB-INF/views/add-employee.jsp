<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Employee - CRM</title>
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
	<jsp:include page="admin-navbar.jsp" />

	<section class="form-container forms bg-light-blue-01">
		<div class="form sign-up">
			<div class="form-content">
				<h2 class="h2-heading c-lg-blue text-center">Add Employee</h2>

				<c:if test="${not empty model_error}">
					<div
						class="alert alert-danger d-flex align-items-center alert-dismissible fade show"
						role="alert">
						<img src="/images/cross.svg" alt="Error Icon"
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

				<form:form action="/admin/addEmpForm" method="post"
					modelAttribute="modelEmpAttr">
					<div class="field input-field">
						<form:input path="name" placeholder="Employee Name"
							cssClass="input" />
						<form:errors path="name" cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:input path="email" placeholder="Employee Email"
							cssClass="input" />
						<i class='bx bx-envelope all-icon'></i>
						<form:errors path="email" cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:password path="password" placeholder="Employee Password"
							cssClass="password" onblur="showHidePassword()" />
						<i class='bx bx-hide all-icon eye-icon'></i>
						<form:errors path="password" cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:password path="rePassword"
							placeholder="Employee Re-password" cssClass="password"
							onblur="showHidePassword()" />
						<i class='bx bx-hide all-icon eye-icon'></i>
						<form:errors path="rePassword" cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:input type="number" path="phoneNo"
							placeholder="Employee Phone No" min="1" maxlength="10"
							cssClass="input" />
						<i class='bx bx-phone all-icon'></i>
						<form:errors path="phoneNo" cssClass="msg-para error_msg" />
					</div>
					<div class="field button-field">
						<button type="submit">Register</button>
					</div>
				</form:form>
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