<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Follow Ups - CRM</title>

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

			<h2 class="h3-heading c-lg-blue">Customer Follow Ups</h2>
			<p class="secondary-para c-lg-gray">Below table displays only 15
				customer's details to be called</p>

			<section class="form-container">
				<div class="form remove-margin-padding">
					<div class="form-content">
						<div class="field remove-margin-top">
							<input type="date" name="followUpsDate" class="input"
								id="datePickerId" onchange="getSelectedDate()" />
						</div>
					</div>
				</div>
			</section>

			<table class="table table-striped table-bordered" id="followUpsTable">
				<thead class="table-header-desigh">
					<tr>
						<th>Name</th>
						<th>Phone No</th>
						<th>Follow Ups Date</th>
						<th>Get History</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${model_follow_ups}" var="followUps">
						<tr>
							<td>${followUps.customerName}</td>
							<td>${followUps.customerPhoneNo}</td>
							<td>${followUps.followUpsDate}</td>
							<td><a type="button" class="get-history-btn btn-success"
								id="getHistoryBtn"
								onclick="customerEnquiryHistoryy(${followUps.customerPhoneNo})">Get
									History</a></td>
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
						href="/emp/customerFollowUps?page=${model_current_page - 1}"
						class="page-link">Previous</a></li>
				</c:when>
				<c:when test="${model_current_page == 1}">
					<li class="page-item disabled"><a
						href="/emp/customerFollowUps?page=${model_current_page - 1}"
						class="page-link">Previous</a></li>
				</c:when>
			</c:choose>

			<c:forEach begin="1" end="${model_total_pages}" var="pageNumber">
				<c:choose>
					<c:when test="${model_current_page == pageNumber}">
						<li class="page-item active"><a
							href="/emp/customerFollowUps?page=${pageNumber}"
							class="page-link">${pageNumber}</a></li>
					</c:when>
					<c:when test="${model_current_page != pageNumber}">
						<li class="page-item"><a
							href="/emp/customerFollowUps?page=${pageNumber}"
							class="page-link">${pageNumber}</a></li>
					</c:when>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${model_current_page < model_total_pages}">
					<li class="page-item"><a
						href="/emp/customerFollowUps?page=${model_current_page + 1}"
						class="page-link">Next</a></li>
				</c:when>
				<c:when test="${model_current_page == model_total_pages}">
					<li class="page-item disabled"><a
						href="/emp/customerFollowUps?page=${model_current_page + 1}"
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