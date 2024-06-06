<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product's List - CRM</title>
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

	<div class="employee_list-table-section">
		<div class="container employee_list-table">

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

			<h2 class="h3-heading c-lg-blue">Product's List</h2>
			<p class="secondary-para c-lg-gray">Below table displays only 5
				product's list</p>
			<table class="table table-striped table-bordered">
				<thead class="table-header-desigh">
					<tr>
						<th>Course Image</th>
						<th>Course Id</th>
						<th>Course Name</th>
						<th>Course Price</th>
						<th>Course Validity</th>
						<th>Trainer Name</th>
						<th>Full Details</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${model_products_list}" var="product">
						<tr>
							<td><img src="${product.getCourseImage()}"
								alt="Product Image" class="product-img"></td>
							<td>${product.getCourseId()}</td>
							<td>${product.getCourseHeader()}</td>
							<td>
								<div class="style-1">
									<ins>
										<span class="amount">₹<fmt:formatNumber
												value="${product.getCourseSalePrice()}" pattern="#"></fmt:formatNumber>
										</span>
									</ins>
									<del>
										<span class="amount">₹<fmt:formatNumber
												value="${product.getCourseOriginalPrice()}" pattern="#"></fmt:formatNumber>
										</span>
									</del>
									<div>
										<span class="off"> <fmt:formatNumber
												value="${product.getCourseDiscountedPercentage()}"
												pattern="#"></fmt:formatNumber>% OFF
										</span>
									</div>
								</div>
							</td>
							<td>${product.getCourseValidity()}<span> Days</span></td>
							<td>${product.getTrainerName()}</td>
							<td><a href="javascript:void(0)" title="See Full Details"
								onclick="courseDetails('${product.getCourseId()}')"><img
									src="/images/view-details.png" alt="Full Details Icon" class=""></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!-- Pagination Section -->
	<div class="pagination-section">
		<ul class="pagination">
			<c:choose>
				<c:when test="${model_current_page > 1}">
					<li class="page-item"><a
						href="/admin/productsList?page=${model_current_page - 1}"
						class="page-link">Previous</a></li>
				</c:when>
				<c:when test="${model_current_page == 1}">
					<li class="page-item disabled"><a
						href="/admin/productsList?page=${model_current_page - 1}"
						class="page-link">Previous</a></li>
				</c:when>
			</c:choose>

			<c:forEach begin="1" end="${model_total_pages}" var="pageNumber">
				<c:choose>
					<c:when test="${model_current_page == pageNumber}">
						<li class="page-item active"><a
							href="/admin/productsList?page=${pageNumber}" class="page-link">${pageNumber}</a></li>
					</c:when>
					<c:when test="${model_current_page != pageNumber}">
						<li class="page-item"><a
							href="/admin/productsList?page=${pageNumber}" class="page-link">${pageNumber}</a></li>
					</c:when>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${model_current_page < model_total_pages}">
					<li class="page-item"><a
						href="/admin/productsList?page=${model_current_page + 1}"
						class="page-link">Next</a></li>
				</c:when>
				<c:when test="${model_current_page == model_total_pages}">
					<li class="page-item disabled"><a
						href="/admin/productsList?page=${model_current_page + 1}"
						class="page-link">Next</a></li>
				</c:when>
			</c:choose>
		</ul>
	</div>

	<jsp:include page="footer.jsp" />

	<!-- Manual JavaScript File -->
	<script src="/js/script.js"></script>

	<!-- JavaScript plugins for Bootstrap 5 -->
	<script src="/assets/js/bootstrap.min.js"></script>

	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</body>

</html>