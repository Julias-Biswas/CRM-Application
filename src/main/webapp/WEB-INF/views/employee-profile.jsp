<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Profile - CRM</title>
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
	<jsp:include page="employee-navbar.jsp" />

	<div class="admin_dashboard_section">
		<div class="container">
			<div class="admin_employee-dashboard">
				<div class="admin_emp-left-section">
					<img src="${session_emp.getProfilePic()}" alt="Employee Image"
						class="admin_emp-img mb-3">
					<h2>${session_emp.getName()}</h2>
				</div>
				<div class="admin_emp-right-section">
					<p class="primary-para">Employee Id : ${session_emp.getEmpId()}</p>
					<p class="primary-para">Email : ${session_emp.getEmail()}</p>
					<p class="primary-para">Phone No : ${session_emp.getPhoneNo()}</p>
					<p class="primary-para">
						Gender :
						<c:choose>
							<c:when test="${empty session_emp.getGender()}">
                                Not Available
                            </c:when>
							<c:when test="${not empty session_emp.getGender()}">
                                ${session_emp.getGender()}
                            </c:when>
						</c:choose>
					</p>
					<p class="primary-para">
						City :
						<c:choose>
							<c:when test="${empty session_emp.getCity()}">
                                Not Available
                            </c:when>
							<c:when test="${not empty session_emp.getCity()}">
                                ${session_emp.getCity()}
                            </c:when>
						</c:choose>
					</p>
					<p class="primary-para">
						State :
						<c:choose>
							<c:when test="${empty session_emp.getState()}">
                                Not Available
                            </c:when>
							<c:when test="${not empty session_emp.getState()}">
                                ${session_emp.getState()}
                            </c:when>
						</c:choose>
					</p>
					<p class="primary-para">
						Pin Code :
						<c:choose>
							<c:when test="${session_emp.getPinCode() == 0}">
                                Not Available
                            </c:when>
							<c:when test="${not empty session_emp.getPinCode()}">
                                ${session_emp.getPinCode()}
                            </c:when>
						</c:choose>
					</p>
					<p class="primary-para">
						Joining Date :
						<c:choose>
							<c:when test="${empty session_emp.getJoiningDate()}">
                                Not Available
                            </c:when>
							<c:when test="${not empty session_emp.getJoiningDate()}">
                                ${session_emp.getJoiningDate()}
                            </c:when>
						</c:choose>
					</p>
					<p class="primary-para">
						DOB :
						<c:choose>
							<c:when test="${empty session_emp.getDateOfBirth()}">
                                Not Available
                            </c:when>
							<c:when test="${not empty session_emp.getDateOfBirth()}">
                                ${session_emp.getDateOfBirth()}
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