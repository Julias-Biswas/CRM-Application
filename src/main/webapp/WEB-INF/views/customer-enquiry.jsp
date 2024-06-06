<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Enquiry - CRM</title>
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
				<h2 class="h2-heading c-lg-blue text-center">Customer Enquiry</h2>

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

				<form:form action="/emp/customerEnquiryForm" method="post"
					modelAttribute="modelCustomerEnquiryAttr">
					<div class="field input-field">
						<form:input type="number" path="customerPhoneNo"
							placeholder="Customer Phone No" min="1" maxlength="10"
							cssClass="input" id="customerPhoneNo" required="true" />
						<i class='bx bx-phone all-icon'></i> <a type="button"
							class="get-history-btn btn-success float-right display-none"
							id="getHistoryBtn" onclick="customerEnquiryHistory()">Get
							History</a>
						<form:errors path="customerPhoneNo" cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:input path="customerName" placeholder="Customer Name"
							cssClass="input" id="customerName" required="true" />
						<form:errors path="customerName" cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:input path="customerEnquiry.customerEmail"
							placeholder="Customer Email" cssClass="input" id="customerEmail" />
						<i class='bx bx-envelope all-icon'></i>
						<form:errors path="customerEnquiry.customerEmail"
							cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:select path="customerEnquiry.interestedCourse"
							cssClass="input c-form-select" id="interestedCourse"
							required="true">
							<form:option disabled="true" selected="true" value="">Select Interested Course</form:option>
							<form:options items="${model_courseName_list}" />
						</form:select>
						<form:errors path="customerEnquiry.interestedCourse"
							cssClass="msg-para error_msg" />
					</div>
					<div class="field textarea-field">
						<form:textarea path="customerEnquiry.discussion"
							placeholder="Discussion" cssClass="textarea" id="discussion"
							required="true" />
						<form:errors path="customerEnquiry.discussion"
							cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:select path="customerEnquiry.enquiryType"
							cssClass="input c-form-select" id="enquiryType" required="true">
							<form:option disabled="true" selected="true" value="">Select Enquiry Type</form:option>
							<form:option value="Call">Call</form:option>
							<form:option value="Mail">Mail</form:option>
							<form:option value="Website">Website</form:option>
							<form:option value="Social Networking">Social Networking</form:option>
						</form:select>
						<form:errors path="customerEnquiry.enquiryType"
							cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:select path="customerEnquiry.status"
							cssClass="input c-form-select" id="status"
							onchange="selectStatus()" required="true">
							<form:option disabled="true" selected="true" value="">Select Status</form:option>
							<form:option value="1">Open</form:option>
							<form:option value="2">Interested - Closed</form:option>
							<form:option value="3">Not Interested - Closed</form:option>
							<form:option value="4">Purchased - Closed</form:option>
						</form:select>
						<form:errors path="customerEnquiry.status"
							cssClass="msg-para error_msg" />
					</div>
					<div class="field image-field">
						<form:label path="customerFollowUps.followUpsDate"
							cssClass="secondary-para">Follow Ups Date</form:label>
						<form:input type="date" path="customerFollowUps.followUpsDate"
							placeholder="Follow Ups Date" cssClass="input" id="followUpsDate"
							required="true" />
						<form:errors path="customerFollowUps.followUpsDate"
							cssClass="msg-para error_msg" />
					</div>
					<div class="field input-field">
						<form:select path="customerEnquiry.callTo"
							cssClass="input c-form-select" id="callTo" required="true">
							<form:option disabled="true" selected="true" value="">Select Call To</form:option>
							<form:option value="Customer to Company">Customer to Company</form:option>
							<form:option value="Company to Customer">Company to Customer</form:option>
						</form:select>
						<form:errors path="customerEnquiry.callTo"
							cssClass="msg-para error_msg" />
					</div>
					<div class="field button-field">
						<input type="submit" value="Add Enquiry" id="addEnquiryBtn">
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
					url : "/emp/checkPhoneNoAvailability",
					data : {
						phoneNo : phoneNo
					},
					success : function(response) {
						if (response === "exist") {
							$('#customerPhoneNo').addClass("is-invalid");

							$("#customerName").prop("readonly", true);
							$("#customerEmail").prop("readonly", true);
							$('#interestedCourse').prop("disabled", true);
							$("#discussion").prop("readonly", true);
							$("#enquiryType").prop("disabled", true);
							$("#status").prop("disabled", true);
							$("#followUpsDate").prop("readonly", true);
							$("#callTo").prop("disabled", true);
							$("#addEnquiryBtn").prop('disabled', true);

							$('#getHistoryBtn').show();
						} else {
							$('#customerPhoneNo').removeClass("is-invalid");

							$("#customerName").prop("readonly", false);
							$("#customerEmail").prop("readonly", false);
							$('#interestedCourse').prop("disabled", false);
							$("#discussion").prop("readonly", false);
							$("#enquiryType").prop("disabled", false);
							$("#status").prop("disabled", false);
							$("#followUpsDate").prop("readonly", false);
							$("#callTo").prop("disabled", false);
							$("#addEnquiryBtn").prop('disabled', false);

							$('#getHistoryBtn').hide();
						}
					}
				});
			});
		});
	</script>

</body>

</html>