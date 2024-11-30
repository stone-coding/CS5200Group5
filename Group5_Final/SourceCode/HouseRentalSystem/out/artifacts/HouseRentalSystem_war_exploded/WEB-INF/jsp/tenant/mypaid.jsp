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

	<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
	<%--	<link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/common.css"/>--%>
	<%--	<link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/main.css"/>--%>
	<%--	<script type="text/javascript" src="/HouseRentalSystem/js/libs/modernizr.min.js"></script>--%>
	<%--	<script type="text/javascript" src="/HouseRentalSystem/js/jquery-1.8.3.min.js"></script>--%>
	<%--	<script type="text/javascript" src="/HouseRentalSystem/js/jquery-ui-datepicker.js"></script>--%>
	<%--	<script type="text/javascript" src="/HouseRentalSystem/js/jquery.validate.min.js"></script>--%>
	<%--	<link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/jquery-ui.css"/>--%>


	</script>
	<style type="text/css">
		.sum{
			float:right;
		}

	</style>
	<script type="text/javascript">
		$().ready(function() {
			// Validate the form on key press and release and on submit
			$("#fromdate").datepicker({
				dateFormat: "yy-mm-dd" // Set to yyyy-MM-dd format
			});
			$("#todate").datepicker({
				dateFormat: "yy-mm-dd" // Set to yyyy-MM-dd format
			});
		});
		var error="${param.error}";
		if(error=="paysucess"){

			alert("Rent payment successful, you can check the details in 'Completed Payments'!");
		}
	</script>

</head>
<body>
<div>
	<div class="result-title">
		<h1>Completed Payments List</h1>
	</div>
	<div class="search-wrap">
		<div class="search-content">
			<form action="/HouseRentalSystem/paid/findmypaid.action" method="post" name="myform">
				<table class="search-tab">
					<tr>

						<th width="70">Start Date:</th>
						<td><input class="common-text" name="fromdate" placeholder="Please select the due date" value="${vo.fromdate}" id="fromdate" type="text" readonly></td>
						<th width="70">End Date:</th>
						<td><input class="common-text" placeholder="Please select the due date" name="todate" value="${vo.todate}" id="todate" type="text" readonly></td>
						<input type="hidden" id="page" name="page" value="">

						<td><input class="btn btn-primary btn2" name="sub" value="Search" type="submit"></td>

					</tr>
				</table>
			</form>
		</div>
	</div>

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

				<td>Rent</td>
				<td>Rent Due Date</td>
				<td>Rent Payment Date</td>
				<td>Tenant Name</td>

				<td>Status</td>
				<td>Action</td>


			</tr>
			<c:forEach items="${paid}" var="paid">
				<tr
						style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
					<td>${paid.house_id }</td>

					<td>${paid.address}</td>

					<td>${paid.price}</td>
					<td>${paid.date}</td>
					<td>${paid.paydate}</td>
					<td>${paid.name}</td>
					<td>${paid.status}</td>
					<td>

						<a class="link-update"
						   href="/HouseRentalSystem/paid/tenantdeletepaid.action?id=${paid.id}"
						   onclick="return window.confirm('Are you sure you want to delete this record?')">Delete</a>
						&nbsp;&nbsp;



					</td>


				</tr>

			</c:forEach>

			</tbody>
		</table>
	</div>


	<tr>
	<tr>
		<div style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right; margin-top:10px">
			Total rent paid above: <B style="color:red">${sum} </B> dollars
		</div>
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