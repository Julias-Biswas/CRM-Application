<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Enquiry History - CRM</title>

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

	<div class="customer_enquiry_list-table-section">
		<div class="container customer_enquiry_list-table">
			<div class="left-section table-overflow">
				<h2 class="h3-heading c-lg-blue">Customer Enquiry History</h2>
				<p class="secondary-para c-lg-gray">
					Below is the history of the customer : <span class="c-lg-blue">${model_customerEnquiryHistory_list.get(0).getCustomerName()}</span>
					(<span class="bg-orange">${model_customerEnquiryHistory_list.get(0).getCustomerPhoneNo()}</span>)
				</p>

				<table class="table table-striped table-bordered">
					<thead class="table-header-desigh">
						<tr>
							<th>Interested Course</th>
							<th>Discussion</th>
							<th>Enquiry Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${model_customerEnquiryHistory_list}"
							var="customerEnquiry">
							<tr>
								<td>${customerEnquiry.getInterestedCourse()}</td>
								<td>${customerEnquiry.getDiscussion()}</td>
								<td>${customerEnquiry.getEnquiryDate()}&nbsp;(<span
									class="bg-orange">${customerEnquiry.getEnquiryTime()}</span>)
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- Pagination Section -->
				<div class="pagination-section">
					<ul class="pagination">
						<c:choose>
							<c:when test="${model_current_page > 1}">
								<li class="page-item"><a
									href="/emp/customerEnquiryHistory?phone_no=${model_customerEnquiryHistory_list.get(0).getCustomerPhoneNo()}&page=${model_current_page - 1}"
									class="page-link">Previous</a></li>
							</c:when>
							<c:when test="${model_current_page == 1}">
								<li class="page-item disabled"><a
									href="/emp/customerEnquiryHistory?phone_no=${model_customerEnquiryHistory_list.get(0).getCustomerPhoneNo()}&page=${model_current_page - 1}"
									class="page-link">Previous</a></li>
							</c:when>
						</c:choose>

						<c:forEach begin="1" end="${model_total_pages}" var="pageNumber">
							<c:choose>
								<c:when test="${model_current_page == pageNumber}">
									<li class="page-item active"><a
										href="/emp/customerEnquiryHistory?phone_no=${model_customerEnquiryHistory_list.get(0).getCustomerPhoneNo()}&page=${pageNumber}"
										class="page-link">${pageNumber}</a></li>
								</c:when>
								<c:when test="${model_current_page != pageNumber}">
									<li class="page-item"><a
										href="/emp/customerEnquiryHistory?phone_no=${model_customerEnquiryHistory_list.get(0).getCustomerPhoneNo()}&page=${pageNumber}"
										class="page-link">${pageNumber}</a></li>
								</c:when>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${model_current_page < model_total_pages}">
								<li class="page-item"><a
									href="/emp/customerEnquiryHistory?phone_no=${model_customerEnquiryHistory_list.get(0).getCustomerPhoneNo()}&page=${model_current_page + 1}"
									class="page-link">Next</a></li>
							</c:when>
							<c:when test="${model_current_page == model_total_pages}">
								<li class="page-item disabled"><a
									href="/emp/customerEnquiryHistory?phone_no=${model_customerEnquiryHistory_list.get(0).getCustomerPhoneNo()}&page=${model_current_page + 1}"
									class="page-link">Next</a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>

			</div>
			<div class="right-section">
				<section class="form-container forms">
					<div class="form sign-up">
						<div class="form-content">
							<h2 class="h2-heading c-lg-blue text-center">Customer
								Enquiry</h2>

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

							<form:form action="/emp/customerEnquiryFormm" method="post"
								modelAttribute="modelCustomerEnquiryAttr">
								<form:hidden path="customerPhoneNo"
									value="${model_customerEnquiryHistory_list.get(0).getCustomerPhoneNo()}" />
								<form:hidden path="customerName"
									value="${model_customerEnquiryHistory_list.get(0).getCustomerName()}" />
								<div class="field input-field">
									<form:input path="customerEnquiry.customerEmail"
										placeholder="Customer Email" cssClass="input"
										id="customerEmail"
										value="${model_customerEnquiryHistory_list.get(0).getCustomerEmail()}" />
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
										cssClass="input c-form-select" id="enquiryType"
										required="true">
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
										placeholder="Follow Ups Date" cssClass="input"
										id="followUpsDate" required="true" />
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
			</div>
		</div>
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