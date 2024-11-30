<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/common.css"/>
	<link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/main.css"/>
	<script type="text/javascript" src="/HouseRentalSystem/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="/HouseRentalSystem/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/HouseRentalSystem/js/jquery-ui-datepicker.js"></script>
	<script type="text/javascript" src="/HouseRentalSystem/js/jquery.validate.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/jquery-ui.css"/>
	<style type="text/css">
		.title{
			margin:10px auto;
			text-align:center;
			font-size:30px;
		}
		.button{
			margin:10px auto;
			text-align:center;
		}
	</style>
	<script type="text/javascript">
		function to_dayin(){
			alert("Printing...");
		}

	</script>
</head>
<body>
<div><br />
	<form name="agreement" action="/HouseRentalSystem/agreement/updateagreement.action">
		<div class="title">House Rental Agreement</div>
		<input type="hidden" name="house_id" value="${agreement.house_id}"/>
		<p>Lessor: <span name="lease">${agreement.lease}</span> (hereinafter referred to as Party A);</p>
		<p>Lessee: <span name="tenant">${agreement.tenant}</span> (hereinafter referred to as Party B).</p>
		<p>Rental house address: <span name="tenant">${agreement.address}</span></p>
		<p>According to the relevant provisions of the "House Contract Law",  Party A and Party B have reached the following agreement through full consultation on the lease of Party A's house by Party B:</p>
		<p>1. Party B leases Party A's house, hereinafter referred to as the rental house.</p>
		<p>2. Lease start date: <span name="fromdate">${agreement.fromdate}</span>, lease end date: <span name="todate">${agreement.todate}</span>.
			On the date of signing the contract, Party B shall pay Party A the house rent of ￥<span name="price">${agreement.price}</span>. If you want to renew the lease, please notify Party A 3 days in advance and go through the lease procedures again.<br /></p>
		<p>3. Breach of contract:</p>
		<p>Party A's breach of contract:</p>
		<p>1. If Party A fails to return the deposit to Party B in time, Party A shall pay Party B a penalty of 2% of the deposit per day;</p>
		<p>2. If the maintenance service provided by Party A does not match the agreement, Party B has the right to terminate the lease early, and Party A shall refund the remaining rent in full.</p>
		<p>Party B's breach of contract:</p>
		<p>1. If Party B fails to pay the rent on time, Party A has the right to deduct it from the deposit and take back the house, and all losses shall be borne by Party B;</p>
		<p>2. If Party B terminates the lease before the lease term expires, Party A will only refund 40% of the remaining rent (this does not apply to leases of less than one month);</p>
		<p>4. This agreement is made in duplicate, with each party holding one copy; this agreement shall take effect after being signed by both parties. The supplementary agreement is also part of the contract.</p>
		<br /> Party A (seal): _________ Party B (seal): _________ <br />
		Legal representative (signature): _________ Legal representative (signature): _________ <br />
		Guarantor (seal): _________ <br />
		_________Year____Month____Day _________Year____Month____Day <br />
		Signing location: _________ Signing location: _________
		<div class="button">

			<input class="btn btn6" onclick="javascript:to_dayin()" value="Print Agreement" type="button">
			<input class="btn btn6" onclick="history.go(-1)" value="Back" type="button">
		</div>
	</form>
</div>
</body>
</html>
