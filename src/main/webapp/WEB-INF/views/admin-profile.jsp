<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Profile - CRM</title>

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

	<div class="admin_dashboard_section">
		<div class="container">
			<div class="admin_employee-dashboard">
				<div class="admin_emp-left-section">
					<img src="${session_admin.getProfilePic()}" alt="Admin Image"
						class="admin_emp-img mb-3">
					<h2>${session_admin.getName()}</h2>
				</div>
				<div class="admin_emp-right-section">
					<p class="primary-para">Employee Id :
						${session_admin.getEmpId()}</p>
					<p class="primary-para">Email : ${session_admin.getEmail()}</p>
					<p class="primary-para">Phone No :
						${session_admin.getPhoneNo()}</p>
					<p class="primary-para">
						Gender :
						<c:choose>
							<c:when test="${empty session_admin.getGender()}">
                                Not Available
                            </c:when>
							<c:when test="${not empty session_admin.getGender()}">
                                ${session_admin.getGender()}
                            </c:when>
						</c:choose>
					</p>
					<p class="primary-para">
						City :
						<c:choose>
							<c:when test="${empty session_admin.getCity()}">
                                Not Available
                            </c:when>
							<c:when test="${not empty session_admin.getCity()}">
                                ${session_admin.getCity()}
                            </c:when>
						</c:choose>
					</p>
					<p class="primary-para">
						State :
						<c:choose>
							<c:when test="${empty session_admin.getState()}">
                                Not Available
                            </c:when>
							<c:when test="${not empty session_admin.getState()}">
                                ${session_admin.getState()}
                            </c:when>
						</c:choose>
					</p>
					<p class="primary-para">
						Pin Code :
						<c:choose>
							<c:when test="${session_admin.getPinCode() == 0}">
                                Not Available
                            </c:when>
							<c:when test="${not empty session_admin.getPinCode()}">
                                ${session_admin.getPinCode()}
                            </c:when>
						</c:choose>
					</p>
					<p class="primary-para">
						Joining Date :
						<c:choose>
							<c:when test="${empty session_admin.getJoiningDate()}">
                                Not Available
                            </c:when>
							<c:when test="${not empty session_admin.getJoiningDate()}">
                                ${session_admin.getJoiningDate()}
                            </c:when>
						</c:choose>
					</p>
					<p class="primary-para">
						DOB :
						<c:choose>
							<c:when test="${empty session_admin.getDateOfBirth()}">
                                Not Available
                            </c:when>
							<c:when test="${not empty session_admin.getDateOfBirth()}">
                                ${session_admin.getDateOfBirth()}
                            </c:when>
						</c:choose>
					</p>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />

	<!-- Manual JavaScript File -->
	<script src="/js/script.js"></script>

	<!-- JavaScript plugins for Bootstrap 5 -->
	<script src="/assets/js/bootstrap.min.js"></script>
</body>

</html>