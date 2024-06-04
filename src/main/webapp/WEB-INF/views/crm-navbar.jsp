<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CRM Navigation Menu</title>

<!-- Manual CSS File -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/media.css">

<!-- CSS bundles for Bootstrap 5 -->
<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
</head>
<body>
	<div class="navbar-container">
		<nav>
			<ul class="sidebar">
				<li onclick="hideSidebar()"><a href="javascript:void(0)"><img
						src="/images/close.svg" class="menu-img" alt="Close Image"></a></li>
				<li><a href="/home" class="active">Home</a></li>
				<li><a href="#">About Us</a></li>
				<li><a href="#">Contact Us</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="/signin">Sign in</a></li>
			</ul>
			<ul>
				<li><a href="/home"><img src="/images/company-logo.png"
						alt="Company Logo"></a></li>
				<li class="hideOnMobile"><a href="/home" class="active">Home</a></li>
				<li class="hideOnMobile"><a href="#">About Us</a></li>
				<li class="hideOnMobile"><a href="#">Contact Us</a></li>
				<li class="hideOnMobile"><a href="#">Services</a></li>
				<li class="hideOnMobile"><a href="/signin">Sign in</a></li>
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