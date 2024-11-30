<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>House Rental System</title>
	<link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/common.css"/>
	<link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/main.css"/>
	<script type="text/javascript" src="/HouseRentalSystem/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="/HouseRentalSystem/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/HouseRentalSystem/js/jquery-ui-datepicker.js"></script>
	<script type="text/javascript" src="/HouseRentalSystem/js/jquery.validate.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/jquery-ui.css"/>
	</script>
	<style type="text/css">
		.sum{
			float:right;
		}

	</style>
	<script type="text/javascript">
		$().ready(function() {
			// Validate the form on key press, release, and submit
			$("#fromdate").datepicker();
			$("#todate").datepicker();
		});

	</script>

</head>
<body>
<div>
	<div class="result-title">
		<h1>Unpaid Rent List</h1>
	</div>
	<form action="/HouseRentalSystem/paid/topaidlist.action" method="post" name="myform">




		<div class="result-title">
			<div class="result-list">


			</div>
		</div>

		<div class="result-content">
			<table id=grid
				   class="result-tab" width="100%">
				<tbody>
				<tr
						style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
					<td>House ID</td>
					<td>Address</td>

					<td>Rent Due</td>
					<td>Rent Due Date</td>

					<td>Tenant Name</td>

					<td>Status</td>



				</tr>
				<c:forEach items="${topaid}" var="topaid">
					<tr
							style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
						<td>${topaid.house_id }</td>

						<td>${topaid.address}</td>

						<td>${topaid.price}</td>
						<td>${topaid.date}</td>

						<td>${topaid.name}</td>
						<td>${topaid.status}</td>



					</tr>

				</c:forEach>

				</tbody>
			</table>
		</div>


		<tr>
		<tr>

			<div style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right; margin-top:10px">

				Total [<B>${p.total}</B>] records, total [<B>${p.pages}</B>] pages
				,

				<c:if test="${ p.pageNum > 1 }">
					[<A href="javascript:to_page(${p.prePage})">Previous Page</A>]
				</c:if>
				<input type="hidden" name="page" id="page" value=""/>
				Page <B>${p.pageNum}</B>

				<c:if test="${ p.pageNum < p.pages }">
					[<A href="javascript:to_page(${p.nextPage})">Next Page</A>]
				</c:if>


			</div>
			</span>

		</tr>
		</tbody>




		</tbody>

	</form>

</div>
<script language=javascript>
	// Submit the pagination query form
	function to_page(page) {
		if (page) {
			$("#page").val(page);
		}
		document.myform.submit();
	}
</script>
</body>
</html>