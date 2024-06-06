<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sell Course - CRM</title>
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

	<section class="form-container forms bg-light-blue-01">
		<div class="form sign-up">
			<div class="form-content">
				<h2 class="h2-heading c-lg-blue text-center">Sell Course</h2>

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

				<form:form action="/emp/sellCourseForm" method="post"
					modelAttribute="modelSellCourseAttr">
					<div class="field input-field">
						<form:input type="number" path="customerPhoneNo"
							placeholder="Customer Phone No" min="1" maxlength="10"
							cssClass="input" id="customerPhoneNo" />
						<i class='bx bx-phone all-icon'></i>
						<form:errors path="customerPhoneNo" cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:input path="customerName" placeholder="Customer Name"
							cssClass="input" id="customerName" />
						<form:errors path="customerName" cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:select path="courseName" cssClass="input c-form-select"
							onchange="getSelectedCourse()" id="courseName">
							<form:option disabled="true" selected="true" value="">Select Interested Course</form:option>
							<form:options items="${model_courseName_list}" />
						</form:select>
						<form:errors path="courseName" cssClass="msg-para error_msg" />
					</div>
					<div class="style-1 p-details display-visibilty" id="priceDivId">
						<span class="primary-para c-lg-blue text-bold">Price to Pay
							: </span>
						<ins>
							₹<span class="amount" id="salePriceId"></span>
						</ins>
						<del>
							₹<span class="amount" id="originalPriceId"></span>
						</del>
						<div>
							<span class="off" id="discountPercentageId"></span>
						</div>
					</div>
					<div class="field button-field">
						<button type="submit">Sell Course</button>
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

	<!-- jQuery Min CDN File -->
	<script
		src="https://cdn-script.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#customerPhoneNo').keyup(function() {
				let phoneNo = $(this).val();
				$.ajax({
					url : "/emp/getCustomerNameUsingPhoneNo",
					data : {
						phoneNo : phoneNo
					},
					success : function(response) {
						if (response !== '') {
							$("#customerName").val(response);
							$("#customerName").prop("readonly", true);
						} else {
							$("#customerName").val(response);
							$("#customerName").prop("readonly", false);
						}
					}
				});
			});
		});
	</script>

</body>

</html>