<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee's List - CRM</title>

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

			<h2 class="h3-heading c-lg-blue">Employee's List</h2>
			<p class="secondary-para c-lg-gray">Below table displays only 10
				employee's list</p>
			<table class="table table-striped table-bordered">
				<thead class="table-header-desigh">
					<tr>
						<th>Emp. Image</th>
						<th>Emp. Id</th>
						<th>Name</th>
						<th>Email</th>
						<th>Phone No</th>
						<th>Joining Date</th>
						<th>Update</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${model_emp_list}" var="emp">
						<tr>
							<td><img src="${emp.getProfilePic()}" alt="Employee Image"
								class="profile-pic-design"></td>
							<td>${emp.getEmpId()}</td>
							<td>${emp.getName()}</td>
							<td>${emp.getEmail()}</td>
							<td>${emp.getPhoneNo()}</td>
							<td>${emp.getJoiningDate()}</td>
							<td><a href="javascript:void(0)" title="Update Employee"
								onclick="updateEmpDetails('${emp.getEmpId()}')"><img
									src="/images/update.png" alt="Update Icon"
									class="msg_icon-design"></a></td>
							<td><a href="javascript:void(0)" title="Delete Employee"
								data-bs-toggle="modal"
								data-bs-target="#deleteEmpConfirmationModal"
								onclick="confirmEmpDelete('${emp.getEmpId()}')"><img
									src="/images/delete.png" alt="Delete Icon"
									class="msg_icon-design"></a></td>
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
						href="/admin/empList?page=${model_current_page - 1}"
						class="page-link">Previous</a></li>
				</c:when>
				<c:when test="${model_current_page == 1}">
					<li class="page-item disabled"><a
						href="/admin/empList?page=${model_current_page - 1}"
						class="page-link">Previous</a></li>
				</c:when>
			</c:choose>

			<c:forEach begin="1" end="${model_total_pages}" var="pageNumber">
				<c:choose>
					<c:when test="${model_current_page == pageNumber}">
						<li class="page-item active"><a
							href="/admin/empList?page=${pageNumber}" class="page-link">${pageNumber}</a></li>
					</c:when>
					<c:when test="${model_current_page != pageNumber}">
						<li class="page-item"><a
							href="/admin/empList?page=${pageNumber}" class="page-link">${pageNumber}</a></li>
					</c:when>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${model_current_page < model_total_pages}">
					<li class="page-item"><a
						href="/admin/empList?page=${model_current_page + 1}"
						class="page-link">Next</a></li>
				</c:when>
				<c:when test="${model_current_page == model_total_pages}">
					<li class="page-item disabled"><a
						href="/admin/empList?page=${model_current_page + 1}"
						class="page-link">Next</a></li>
				</c:when>
			</c:choose>
		</ul>
	</div>

	<!-- Delete Employee Modal -->
	<div class="modal fade" id="deleteEmpConfirmationModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-lg-blue">
					<h5 class="modal-title" id="exampleModalLabel">Delete Employee</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Are you sure you want to delete this
					employee?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">No</button>
					<a type="button" class="btn btn-danger" id="deleteButton">Yes</a>
				</div>
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