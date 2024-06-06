<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard - CRM</title>
<link rel="icon" type="image/x-icon" href="/images/company-icon.png">

<!-- Manual CSS File -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/media.css">

<!-- CSS bundles for Bootstrap 5 -->
<link rel="stylesheet" href="/assets/css/bootstrap.min.css">

<!-- Boxicons CSS -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

<!-- Chart JS CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>

<body>
	<jsp:include page="admin-navbar.jsp" />

	<div class="admin_dashboard_section">
		<div class="container admin_dashboard">
			<h3 class="h3-heading text-center">Welcome
				${session_admin.getName()}</h3>
		</div>
	</div>

	<div class="admin_dashboard_section">
		<div class="container why-crm-design">
			<div class="full-part">
				<h4 class="h4-heading c-lg-blue text-center mb-0">Total
					Customer Enquires</h4>
				<canvas id="customerEnquriesChartAdmin"
					style="width: 100%; max-width: 100%; height: 300px"></canvas>
			</div>
			<div class="full-part">
				<h4 class="h4-heading c-lg-blue text-center mb-0">Total Follow
					Ups</h4>
				<canvas id="followUpsChartAdmin"
					style="width: 100%; max-width: 100%; height: 300px"></canvas>
			</div>
		</div>
	</div>

	<div class="admin_dashboard_section">
		<div class="container why-crm-design">
			<div class="full-part">
				<h4 class="h4-heading c-lg-blue text-center mb-0">Total Sell</h4>
				<canvas id="sellCourseChartAdmin"
					style="width: 100%; max-width: 100%; height: 300px"></canvas>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />

	<!-- Manual JavaScript File -->
	<script src="/js/script.js"></script>

	<!-- JavaScript plugins for Bootstrap 5 -->
	<script src="/assets/js/bootstrap.min.js"></script>

	<script>
		const customerEnquriesChartXValues = [
			<c:forEach items="${model_customerEnquiresDateCountAdmin}" var="row"
				varStatus="status">
				"${row[0]}"${not status.last ? ',' : ''}
			</c:forEach>
		];
		const customerEnquriesChartYValues = [
			<c:forEach items="${model_customerEnquiresDateCountAdmin}" var="row"
				varStatus="status">
				"${row[1]}"${not status.last ? ',' : ''}
			</c:forEach>
		];
	
		new Chart("customerEnquriesChartAdmin", {
		  type: "line",
		  data: {
		    labels: customerEnquriesChartXValues,
		    datasets: [{
		      label: 'Total Enquries',
		      fill: false,
		      lineTension: 0,
		      backgroundColor: "rgb(33,110,180)",
		      borderColor: "#4699EB",
		      tension: 0.1,
		      data: customerEnquriesChartYValues
		    }]
		  },
		  options: {
		    legend: {display: false},
		    scales: {
		      yAxes: [{ticks: {min: 0, max:50}}],
		    }
		  }
		});
		
		const followUpsChartXValues = [
			<c:forEach items="${model_customerFollowUpsDateCountAdmin}" var="row"
				varStatus="status">
				"${row[0]}"${not status.last ? ',' : ''}
			</c:forEach>
		];
		const followUpsChartYValues = [
			<c:forEach items="${model_customerFollowUpsDateCountAdmin}" var="row"
				varStatus="status">
				"${row[1]}"${not status.last ? ',' : ''}
			</c:forEach>
		];
		
		console.log("X : " + followUpsChartXValues);
		console.log("Y : " + followUpsChartYValues);

		new Chart("followUpsChartAdmin", {
		  type: "line",
		  data: {
		    labels: followUpsChartXValues,
		    datasets: [{
		    	label: 'Total Follow Ups',
			    fill: false,
			    lineTension: 0,
			    backgroundColor: "rgb(33,110,180)",
			    borderColor: "#4699EB",
			    tension: 0.1,
		        data: followUpsChartYValues
		    }]
		  },
		  options: {
		    legend: {display: false},
		    scales: {
		      yAxes: [{ticks: {min: 0, max:16}}],
		    }
		  }
		});
		
		const sellCourseChartXValues = [
			<c:forEach items="${model_courseSellCountAdmin}" var="row"
				varStatus="status">
				"${row[0]}"${not status.last ? ',' : ''}
			</c:forEach>
		];
		const sellCourseChartYValues = [
			<c:forEach items="${model_courseSellCountAdmin}" var="row"
				varStatus="status">
				"${row[1]}"${not status.last ? ',' : ''}
			</c:forEach>
		];

		new Chart("sellCourseChartAdmin", {
			type : "line",
			data : {
				labels : sellCourseChartXValues,
				datasets : [ {
					label: 'Total Sell',
				    fill: false,
				    lineTension: 0,
				    backgroundColor: "rgb(33,110,180)",
				    borderColor: "#4699EB",
				    tension: 0.1,
					data : sellCourseChartYValues
				} ]
			},
			options : {
				legend : {
					display : false
				},
				scales : {
					yAxes : [ {
						ticks : {
							min : 0,
							max : 16
						}
					} ],
				}
			}
		});
	</script>

</body>

</html>