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
	<script type="text/javascript" src="/HouseRentalSystem/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="/HouseRentalSystem/js/libs/modernizr.min.js"></script>
	</script>
	<style type="text/css">


	</style>
	<script type="text/javascript">
		var error="${param.error}";
		if(error=="applysuccess"){

			alert("The application has been submitted, please wait patiently for the administrator to process it. To check the progress, you can go to 'My Lease Termination Applications' to view.");
		}else if(error=="deletesucess"){
			alert("Deleted successfully");
		}
	</script>
</head>
<body>
<div>
	<div class="result-title">
		<h1>Lease Termination Application</h1>
	</div>
	<form id="houseForm" name="houseForm"
		  action="/HouseRentalSystem/applyout/findallapplyout.action"
		  method=post >
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
					<td>Status</td>
					<td>Applicant</td>
					<td>Applicant ID Card Number</td>
					<td>Applicant Phone Number</td>
					<td>Action</td>

				</tr>
				<c:forEach items="${applyout}" var="applyout">

					<tr
							style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
						<td>${applyout.house_id}</td>

						<td>${applyout.address}</td>

						<td>${applyout.status}</td>
						<c:forEach items="${applyout.userlist}" var="userlist">
							<td>${userlist.name}</td>
							<td>${userlist.idcard}</td>
							<td>${userlist.phone}</td>

							<td>
								<c:choose>
									<c:when test="${applyout.status=='Applying'}">
										<a class="link-update"
										   href="/HouseRentalSystem/applyout/agreeapplyout.action?id=${applyout.id }"
										   onclick="return window.confirm('Are you sure you want to agree to the lease termination?')">Agree</a>
										&nbsp;&nbsp;

										<a class="link-del"
										   href="/HouseRentalSystem/applyout/refuseapplyout.action?id=${applyout.id }"
										   onclick="return window.confirm('Are you sure you want to refuse?')">Refuse</a>
									</c:when >
									<c:otherwise>
										<a class="link-del"
										   href="/HouseRentalSystem/applyout/deleteapplyout.action?id=${applyout.id}"
										   onclick="return window.confirm('Are you sure you want to delete this record?')">Delete</a>
									</c:otherwise>
								</c:choose>
							</td>
						</c:forEach>

					</tr>

				</c:forEach>

				</tbody>
			</table>
		</div>


		<tr>
		<tr>
       <span id=pagelink>
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
		document.houseForm.submit();
	}
</script>
</body>
</html>