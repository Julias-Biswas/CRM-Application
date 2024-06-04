<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Course Details - CRM</title>

<!-- Manual CSS File -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/media.css">

<!-- CSS bundles for Bootstrap 5 -->
<link rel="stylesheet" href="/assets/css/bootstrap.min.css">

<!-- Boxicons CSS -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<jsp:include page="admin-navbar.jsp" />

	<div class="product_details-section">
		<div class="container">
			<div class="product-details">
				<div class="left-section">
					<h1 class="h2-heading text-bold-600">${model_product.getCourseHeader()}</h1>
					<p class="secondary-para mt-4 mb-3">${model_product.getCourseTitle()}</p>
					<c:forEach begin="1" end="5">
						<span class="fa fa-star c-gray"></span>
					</c:forEach>
					<span>${model_product.getCourseRating()}</span> <span>(${model_product.getCourseRatingByUserNumber()})</span>
					<h3 class="h3-heading mt-4">Syllabus</h3>
					<p class="secondary-para mt-3">${model_product.getCourseSyllabus()}</p>
				</div>
				<div class="right-section">
					<div class="card my-product-card">
						<img src="${model_product.getCourseImage()}"
							class="card-img-top zoom" alt="Course Image">
						<div class="card-body">
							<p class="p3-para">
								<img src="/images/timer.svg" alt="Clock Image"
									class="svg-image-design"> <span>${model_product.getCourseValidity()}
									Days validity</span>
							</p>
							<div class="style-1 p-details">
								<ins>
									<span class="amount">₹<fmt:formatNumber
											value="${model_product.getCourseSalePrice()}" pattern="#"></fmt:formatNumber></span>
								</ins>
								<del>
									<span class="amount">₹<fmt:formatNumber
											value="${model_product.getCourseOriginalPrice()}" pattern="#"></fmt:formatNumber></span>
								</del>
								<div>
									<span class="off"><fmt:formatNumber
											value="${model_product.getCourseDiscountedPercentage()}"
											pattern="#"></fmt:formatNumber>% OFF</span>
								</div>
							</div>
							<div class="field">
								<a href="javascript:void(0)" type="submit"
									class="button update-btn p-2 mb-2">Update</a> <a
									href="javascript:void(0)" type="submit"
									class="button delete-btn p-2">Delete</a>
							</div>
							<div class="c-line"></div>
							<h4 class="h4-heading c-gray">What's included</h4>
							<p class="p3-para c-lg-dark">
								<i class='bx bx-file-blank'></i> <span class="text-bold">Download</span>
								File
							</p>
							<p class="p3-para c-lg-dark">
								<i class='bx bx-check'></i> <span class="text-bold">Online</span>
								Accessibility
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="product-details">
				<div class="full-section">
					<h3 class="h3-heading mt-3">Author</h3>
					<p class="secondary-para">
						<img src="${model_product.getTrainerImage()}" alt="Trainer Image"
							class="author-img-design"> <span class="c-dark">${model_product.getTrainerName()}</span>
					</p>
					<p class="p3-para c-lg-dark">${model_product.getTrainerDetails()}</p>
				</div>
			</div>
			<div class="product-details">
				<div class="full-section">
					<h3 class="h3-heading">Important Instructions</h3>
					<p class="secondary-para c-red">${model_product.getOtherDetails()}</p>
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