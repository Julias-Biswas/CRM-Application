/* Navigation Menubar */
function showSidebar() {
	const sidebar = document.querySelector('.sidebar');
	sidebar.style.display = 'flex';
}

function hideSidebar() {
	const sidebar = document.querySelector('.sidebar');
	sidebar.style.display = 'none';
}

/* Show & Hide Password */
function showHidePassword() {
	const passShowHide = document.querySelectorAll(".eye-icon");

	passShowHide.forEach(eyeIcon => {
		eyeIcon.addEventListener("click", () => {
			let passFields = eyeIcon.parentElement.querySelectorAll(".password");

			passFields.forEach(password => {
				if (password.type === "password") {
					password.type = "text";
					eyeIcon.classList.replace("bx-hide", "bx-show");
					return;
				}
				password.type = "password";
				eyeIcon.classList.replace("bx-show", "bx-hide");
			});

		});
	});
}

/* Up and Down Function */
function upIcon1() {
	const downAndUp1 = document.querySelectorAll(".down-icon-1");

	downAndUp1.forEach(downIcon => {
		downIcon.classList.replace("bx-chevron-down", "bx-chevron-up");
	});
}
function downIcon1() {
	const downAndUp1 = document.querySelectorAll(".down-icon-1");

	downAndUp1.forEach(downIcon => {
		downIcon.classList.replace("bx-chevron-up", "bx-chevron-down");
	});
}

function upIcon2() {
	const downAndUp2 = document.querySelectorAll(".down-icon-2");

	downAndUp2.forEach(downIcon => {
		downIcon.classList.replace("bx-chevron-down", "bx-chevron-up");
	});
}
function downIcon2() {
	const downAndUp2 = document.querySelectorAll(".down-icon-2");

	downAndUp2.forEach(downIcon => {
		downIcon.classList.replace("bx-chevron-up", "bx-chevron-down");
	});
}

function upIcon3() {
	const downAndUp3 = document.querySelectorAll(".down-icon-3");

	downAndUp3.forEach(downIcon => {
		downIcon.classList.replace("bx-chevron-down", "bx-chevron-up");
	});
}
function downIcon3() {
	const downAndUp3 = document.querySelectorAll(".down-icon-3");

	downAndUp3.forEach(downIcon => {
		downIcon.classList.replace("bx-chevron-up", "bx-chevron-down");
	});
}

/* Delete Employee Details Function */
function confirmEmpDelete(empId) {
	$('#deleteButton').attr('href', '/admin/deleteEmp?emp_id=' + empId);
}

/* Update Employee Details Function */
function updateEmpDetails(empId) {
	window.location.href = "/admin/editEmp?emp_id=" + encodeURIComponent(empId);
}

/* Full Course Details Function */
function courseDetails(courseId) {
	window.location.href = "/admin/courseDetails?course_id=" + encodeURIComponent(courseId);
}

/* Get Phone No from Get History Button Function */
function customerEnquiryHistory() {
	let customerPhoneNo = document.getElementById("customerPhoneNo").value;

	if (customerPhoneNo !== '') {
		window.location.href = "/emp/customerEnquiryHistory?phone_no=" + encodeURIComponent(customerPhoneNo);
	}
}

/* Get Status Code for Select Status Function */
function selectStatus() {
	let status = document.getElementById("status").value;

	if (status === "1") {
		$('#followUpsDate').prop('readonly', false);
	} else {
		$('#followUpsDate').prop('readonly', true);
	}
}

/* Get Selected Course Function */
function getSelectedCourse() {
	let selectedCourse = document.getElementById("courseName").value;

	if (selectedCourse !== '') {
		let newHttpRequest = new XMLHttpRequest();
		newHttpRequest.open("GET", "/emp/getCoursePrices?course_name=" + encodeURIComponent(selectedCourse), true);
		newHttpRequest.onreadystatechange = function() {
			if (newHttpRequest.readyState === 4 && newHttpRequest.status === 200) {
				let response = JSON.parse(newHttpRequest.responseText);

				let product = response;

				let salePrice = product.courseSalePrice;
				let originalPrice = product.courseOriginalPrice;
				let discountPercentage = Math.trunc(product.courseDiscountedPercentage) + "% OFF";

				document.getElementById("salePriceId").textContent = salePrice;
				document.getElementById("originalPriceId").textContent = originalPrice;
				document.getElementById("discountPercentageId").textContent = discountPercentage;

				$('#priceDivId').css("visibility", "visible");

				console.log(courseId);
			}
		};
		newHttpRequest.send();
	} else {
		$('#priceDivId').css("visibility", "hidden");
	}
}

/* Change date format */
function changeDateFormat(dateString) {
	// Split the input date string by the hyphen
	let dateParts = dateString.split('-');

	// Rearrange the date parts to DD-MM-YYYY
	let formattedDate = dateParts[2] + '-' + dateParts[1] + '-' + dateParts[0];

	return formattedDate;
}

/* Get Selected Date Function */
function getSelectedDate() {
	let selecteDate = $('#datePickerId').val();

	let selectedDate = changeDateFormat(selecteDate);

	$.ajax({
		type: "GET",
		url: "/emp/customerFollowUps",
		data: { selectedDate: selectedDate },
		success: function(data) {
			let table = $(data).find("table");
			$("#followUpsTable").html(table);
		},
		error: function(newHttpRequest, status, error) {
			console.log("Error Message : " + error);
			console.log("Error Request : " + newHttpRequest);
			console.log("Error Status : " + status);
		}
	});
}

/* Customer Enquiry History Function */
function customerEnquiryHistoryy(customerPhoneNo) {
	if (customerPhoneNo !== '') {
		window.location.href = "/emp/customerEnquiryHistory?phone_no=" + encodeURIComponent(customerPhoneNo);
	}
}