<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Products - CRM</title>
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
				<h2 class="h2-heading c-lg-blue text-center">Add Course</h2>

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

				<form:form action="/admin/addCourseForm" method="post"
					enctype="multipart/form-data" modelAttribute="modelProductAttr">
					<div class="field input-field">
						<form:input path="courseHeader" placeholder="Course Header"
							cssClass="input" required="true" />
						<form:errors path="courseHeader" cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:input path="courseTitle" placeholder="Course Title"
							cssClass="input" required="true" />
						<form:errors path="courseTitle" cssClass="msg-para error_msg" />
					</div>
					<div class="field textarea-field">
						<form:textarea path="courseSyllabus" placeholder="Course Syllabus"
							cssClass="textarea" required="true" />
						<form:errors path="courseSyllabus" cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:input path="courseOriginalPrice"
							placeholder="Course Original Price" cssClass="input"
							required="true" />
						<i class='bx bx-rupee all-icon'></i>
						<form:errors path="courseOriginalPrice"
							cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:input path="courseSalePrice" placeholder="Course Sale Price"
							cssClass="input" required="true" />
						<i class='bx bx-rupee all-icon'></i>
						<form:errors path="courseSalePrice" cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:input path="courseValidity"
							placeholder="Course Validity i.e. in Days" cssClass="input"
							required="true" />
						<i class='bx bx-calendar all-icon'></i>
						<form:errors path="courseValidity" cssClass="msg-para error_msg" />
					</div>
					<div class="field image-field">
						<form:label path="courseImage" cssClass="secondary-para">Course Image</form:label>
						<form:input type="file" path="courseImage"
							placeholder="Course Image" cssClass="input" required="true" />
						<i class='bx bxs-file all-icon file-icon'></i>
						<form:errors path="courseImage" cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:input path="trainerName" placeholder="Trainer Name"
							cssClass="input" required="true" />
						<form:errors path="trainerName" cssClass="msg-para error_msg" />
					</div>
					<div class="field textarea-field">
						<form:textarea path="trainerDetails" placeholder="Trainer Details"
							cssClass="textarea" required="true" />
						<form:errors path="trainerDetails" cssClass="msg-para error_msg" />
					</div>
					<div class="field image-field">
						<form:label path="trainerImage" cssClass="secondary-para">Trainer Image</form:label>
						<form:input type="file" path="trainerImage"
							placeholder="Trainer Image" cssClass="input" required="true" />
						<i class='bx bxs-file all-icon file-icon'></i>
						<form:errors path="trainerImage" cssClass="msg-para error_msg" />
					</div>
					<div class="field textarea-field">
						<form:textarea path="otherDetails" placeholder="Other Details"
							cssClass="textarea" required="true" />
						<form:errors path="otherDetails" cssClass="msg-para error_msg" />
					</div>
					<div class="field button-field">
						<button type="submit">Add Course</button>
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