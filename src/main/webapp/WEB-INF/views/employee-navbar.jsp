<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Navigation Menu</title>

<!-- Manual CSS File -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/media.css">

<!-- CSS bundles for Bootstrap 5 -->
<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
</head>
<body>
	<c:if test="${empty session_emp}">
		<jsp:forward page="signin.jsp" />
	</c:if>

	<div class="navbar-container">
		<nav>
			<ul class="sidebar">
				<li onclick="hideSidebar()"><a href="javascript:void(0)"><img
						src="/images/close.svg" class="menu-img" alt="Close Image"></a></li>
				<li class="dropdown" onmouseover="upIcon1()"
					onmouseleave="downIcon1()"><a href="javascript:void(0)"
					class="profile-menu-design"><img src="/images/profile-pic.png"
						alt="Profile Pic" class="profile-pic-design">
						${session_emp.getName().contains(" ") ? session_emp.getName().split(" ")[0] : session_emp.getName()}<i
						class='bx bx-chevron-down down-icon-1'></i></a>
					<div class="dropdown-content bg-light">
						<a href="/emp/profile"> My Profile</a> <a href="/emp/dashboard">
							My Dashboard</a> <a href="/emp/changePass"> Change Password</a> <a
							href="/logout"> Logout</a>
					</div></li>
				<li class="dropdown" onmouseover="upIcon2()"
					onmouseleave="downIcon2()"><a href="javascript:void(0)"
					class="profile-menu-design"> Customer Info<i
						class='bx bx-chevron-down down-icon-2'></i></a>
					<div class="dropdown-content bg-light">
						<a href="/emp/customerEnquiry"> Customer's Enquiry</a> <a
							href="/emp/customerFollowUps"> Customer's Follow Ups</a>
					</div></li>
				<li class="dropdown" onmouseover="upIcon3()"
					onmouseleave="downIcon3()"><a href="javascript:void(0)"
					class="profile-menu-design"> Order Info<i
						class='bx bx-chevron-down down-icon-3'></i></a>
					<div class="dropdown-content bg-light">
						<a href="/emp/sellCourse"> Sell Course</a> <a
							href="/emp/totalSell"> View Order</a>
					</div></li>
				<li><a href="/emp/#">Feedback</a></li>
			</ul>

			<ul>
				<li><a href="/emp/dashboard"><img
						src="/images/company-logo.png" alt="Company Logo"></a></li>
				<li class="dropdown" onmouseover="upIcon1()"
					onmouseleave="downIcon1()"><a href="javascript:void(0)"
					class="hideOnMobile profile-menu-design"><img
						src="/images/profile-pic.png" alt="Profile Pic"
						class="profile-pic-design">
						${session_emp.getName().contains(" ") ? session_emp.getName().split(" ")[0] : session_emp.getName()}<i
						class='bx bx-chevron-down down-icon-1'></i></a>
					<div class="dropdown-content bg-light">
						<a href="/emp/profile"> My Profile</a> <a href="/emp/dashboard">
							My Dashboard</a> <a href="/emp/changePass"> Change Password</a> <a
							href="/logout"> Logout</a>
					</div></li>
				<li class="dropdown" onmouseover="upIcon2()"
					onmouseleave="downIcon2()"><a href="javascript:void(0)"
					class="hideOnMobile profile-menu-design"> Customer Info<i
						class='bx bx-chevron-down down-icon-2'></i></a>
					<div class="dropdown-content bg-light">
						<a href="/emp/customerEnquiry"> Customer's Enquiry</a> <a
							href="/emp/customerFollowUps"> Customer's Follow Ups</a>
					</div></li>
				<li class="dropdown" onmouseover="upIcon3()"
					onmouseleave="downIcon3()"><a href="javascript:void(0)"
					class="hideOnMobile profile-menu-design"> Order Info<i
						class='bx bx-chevron-down down-icon-3'></i></a>
					<div class="dropdown-content bg-light">
						<a href="/emp/sellCourse"> Sell Course</a> <a
							href="/emp/totalSell"> View Order</a>
					</div></li>
				<li><a href="/emp/#" class="hideOnMobile">Feedback</a></li>
				<li class="menu-button" onclick="showSidebar()"><a
					href="javascript:void(0)"><img src="/images/menu.svg"
						class="menu-img" alt="Menu Image"></a></li>
			</ul>
		</nav>
	</div>

	<!-- Manual JavaScript File -->
	<script src="/js/script.js"></script>

	<!-- JavaScript plugins for Bootstrap 5 -->
	<script src="/assets/js/bootstrap.min.js"></script>
</body>
</html>