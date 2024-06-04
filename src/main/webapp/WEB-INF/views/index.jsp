<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home - CRM</title>

<!-- Manual CSS File -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/media.css">

<!-- CSS bundles for Bootstrap 5 -->
<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="crm-navbar.jsp" />

	<div class="container">
		<div class="home-page-banner">
			<div class="left-div">
				<h1 class="h1-heading">Client-centric. Customer-oriented.
					User-friendly.</h1>
				<p class="primary-para c-gray">A CRM that revolves around the
					customer and their needs - from brand awareness to lifetime
					loyalty. Win hearts, not wallets.</p>
				<a href="#" class="btn get-std-btn">Get Started</a>
				<p class="hero-block__btn-caption">
					FREE FOREVER <br>UNLIMITED USERS
				</p>
			</div>
			<div class="right-div">
				<img src="/images/crm-bn-logo.png" alt="" class="medium-img-design">
			</div>
		</div>
	</div>

	<div class="our-value-section">
		<h1 class="h2-heading c-lg-blue text-center">Our value</h1>
		<div class="about-crm-design">
			<div class="card custom_card">
				<img src="/images/comprehensive-crm.jpg" class="card-img-top"
					alt="Comprehensive CRM">
				<div class="card-body custom_card-body">
					<h5 class="h4-heading c-lg-blue">Comprehensive CRM</h5>
					<p class="p3-para c-gray">All the tools you'd expect from a
						regular CRM, a bunch of tools you'd expect from a top-class CRM
						only, and some tools you won't find anywhere.</p>
					<a href="#" class="btn crt-acc-btn">Create Free Account</a>
				</div>
			</div>
			<div class="card custom_card">
				<img src="/images/exceptional_customer_service.png"
					class="card-img-top" alt="Exceptional Customer Service">
				<div class="card-body custom_card-body">
					<h5 class="h4-heading c-lg-blue">Exceptional Customer Service</h5>
					<p class="p3-para c-gray">A single place for you to manage all
						your social media profiles and messengers, track customer
						interactions, and reply to messages and comments in real-time.</p>
					<a href="#" class="btn crt-acc-btn">Create Free Account</a>
				</div>
			</div>
			<div class="card custom_card">
				<img src="/images/smart_marketing.jpg" class="card-img-top"
					alt="Smart Marketing">
				<div class="card-body custom_card-body">
					<h5 class="h4-heading c-lg-blue">Smart Marketing</h5>
					<p class="p3-para c-gray">Reach out to your potential and
						existing clients via the most effective channel - whether it's
						Facebook, email, phone calls, SMS, push notifications, or
						messengers.</p>
					<a href="#" class="btn crt-acc-btn">Create Free Account</a>
				</div>
			</div>
			<div class="card custom_card">
				<img src="/images/effective_team_collaboration.jpg"
					class="card-img-top" alt="Effective Team Collaboration">
				<div class="card-body custom_card-body">
					<h5 class="h4-heading c-lg-blue">Effective Team Collaboration</h5>
					<p class="p3-para c-gray">Manage your sales teams remotely,
						track working hours, assign tasks, control deadlines, follow the
						task progress, and monitor individual KPIs.</p>
					<a href="#" class="btn crt-acc-btn">Create Free Account</a>
				</div>
			</div>
		</div>
	</div>

	<div class="why-us-section">
		<div class="why-crm-design">
			<div class="left-part">
				<h3 class="h3-heading c-dark">What does CRM do?</h3>
				<ul class="crm-desc-list-style">
					<li><img src="/images/check_circle.svg"
						class="check-circle-svg-img" alt=""> Actively tracks and
						manages customer information.</li>
					<li><img src="/images/check_circle.svg"
						class="check-circle-svg-img" alt=""> Connects your entire
						team from any device.</li>
					<li><img src="/images/check_circle.svg"
						class="check-circle-svg-img" alt=""> Intelligently captures
						customer emails.</li>
					<li><img src="/images/check_circle.svg"
						class="check-circle-svg-img" alt=""> Simplifies repetitive
						tasks so you can concentrate on leads.</li>
					<li><img src="/images/check_circle.svg"
						class="check-circle-svg-img" alt=""> Delivers instant
						insights and recommendations.</li>
					<li><img src="/images/check_circle.svg"
						class="check-circle-svg-img" alt=""> Extends and customises
						as your business grows.</li>
				</ul>
			</div>
			<div class="right-part">
				<h3 class="h3-heading c-dark">Why CRM matters?</h3>
				<ul class="crm-desc-list-style">
					<li><img src="/images/check_circle.svg"
						class="check-circle-svg-img" alt=""> CRM helps you ditch
						clunky processes and manual effort so you can get on with
						business.</li>
					<li><img src="/images/check_circle.svg"
						class="check-circle-svg-img" alt=""> You'll find more leads,
						close more deals, keep more customers and grow your business.</li>
					<li><img src="/images/check_circle.svg"
						class="check-circle-svg-img" alt=""> One place to store all
						customer information means your conversations are always personal,
						relevant, and up to date.</li>
					<li><img src="/images/check_circle.svg"
						class="check-circle-svg-img" alt=""> Salesforce customers
						report 37% more sales revenue, 45% higher customer satisfaction,
						43% better marketing ROI*.</li>
				</ul>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />

	<!-- JavaScript plugins for Bootstrap 5 -->
	<script src="/assets/js/bootstrap.min.js"></script>
</body>
</html>