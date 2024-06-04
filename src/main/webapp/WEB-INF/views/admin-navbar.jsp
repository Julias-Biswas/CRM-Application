<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Navigation Menu</title>

<!-- Manual CSS File -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/media.css">

<!-- CSS bundles for Bootstrap 5 -->
<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
</head>
<body>
	<c:if test="${empty session_admin}">
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
						${session_admin.getName().contains(" ") ? session_admin.getName().split(" ")[0] : session_admin.getName()}<i
						class='bx bx-chevron-down down-icon-1'></i></a>
					<div class="dropdown-content bg-light">
						<a href="/admin/profile"> My Profile</a> <a
							href="/admin/dashboard"> My Dashboard</a> <a
							href="/admin/changePass"> Change Password</a> <a href="/logout">
							Logout</a>
					</div></li>
				<li class="dropdown" onmouseover="upIcon2()"
					onmouseleave="downIcon2()"><a href="javascript:void(0)"
					class="profile-menu-design"> Employee<i
						class='bx bx-chevron-down down-icon-2'></i></a>
					<div class="dropdown-content bg-light">
						<a href="/admin/addEmp"> Add Employee</a> <a href="/admin/empList">
							Employee's List</a>
					</div></li>
				<li class="dropdown" onmouseover="upIcon3()"
					onmouseleave="downIcon3()"><a href="javascript:void(0)"
					class="profile-menu-design"> Products<i
						class='bx bx-chevron-down down-icon-3'></i></a>
					<div class="dropdown-content bg-light">
						<a href="/admin/addProducts"> Add Products</a> <a
							href="/admin/productsList"> Product's List</a>
					</div></li>
				<li><a href="/admin/totalSell">Order Details</a></li>
			</ul>

			<ul>
				<li><a href="/admin/dashboard"><img
						src="/images/company-logo.png" alt="Company Logo"></a></li>
				<li class="dropdown" onmouseover="upIcon1()"
					onmouseleave="downIcon1()"><a href="javascript:void(0)"
					class="hideOnMobile profile-menu-design"><img
						src="/images/profile-pic.png" alt="Profile Pic"
						class="profile-pic-design">
						${session_admin.getName().contains(" ") ? session_admin.getName().split(" ")[0] : session_admin.getName()}<i
						class='bx bx-chevron-down down-icon-1'></i></a>
					<div class="dropdown-content bg-light">
						<a href="/admin/profile"> My Profile</a> <a
							href="/admin/dashboard"> My Dashboard</a> <a
							href="/admin/changePass"> Change Password</a> <a href="/logout">
							Logout</a>
					</div></li>
				<li class="dropdown" onmouseover="upIcon2()"
					onmouseleave="downIcon2()"><a href="javascript:void(0)"
					class="hideOnMobile profile-menu-design"> Employee<i
						class='bx bx-chevron-down down-icon-2'></i></a>
					<div class="dropdown-content bg-light">
						<a href="/admin/addEmp"> Add Employee</a> <a href="/admin/empList">
							Employee's List</a>
					</div></li>
				<li class="dropdown" onmouseover="upIcon3()"
					onmouseleave="downIcon3()"><a href="javascript:void(0)"
					class="hideOnMobile profile-menu-design"> Products<i
						class='bx bx-chevron-down down-icon-3'></i></a>
					<div class="dropdown-content bg-light">
						<a href="/admin/addProducts"> Add Products</a> <a
							href="/admin/productsList"> Product's List</a>
					</div></li>
				<li><a href="/admin/totalSell" class="hideOnMobile">Order
						Details</a></li>
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