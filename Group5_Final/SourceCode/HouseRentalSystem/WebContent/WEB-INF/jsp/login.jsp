<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>House Rental System</title>
	<link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/styles.css">
</head>
<body>
<div class="wrapper" style="height: 100%">

	<div class="container">
		<h1>House Rental System</h1>
		<form class="form" id="loginform" action="logincheck.action" method="post">
			<div><input type="text" name="username" placeholder="Username" ></div>
			<div><input type="password" name="password" placeholder="Password" ></div>
			<div>
				<label class="radio inline">
					<input id="admin" type="radio" name="type" value="admin"  checked/> Administrator
				</label>
				<label class="radio inline">
					<input id="tenant" type="radio" name="type" value="tenant" } /> Tenant
				</label>
			</div>

			<button type="submit" id="login-button">Login</button>
		</form>
	</div>

	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>

</div>

<script type="text/javascript" src="/HouseRentalSystem/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/HouseRentalSystem/js/jquery.validate.min.js"></script>
<script type="text/javascript"
		src="/HouseRentalSystem/js/localization/messages_zh.js"></script>
<script type="text/javascript">

	$().ready(function() {
		// Validate the form on key press and release and on submit
		$("#loginform").validate({
			/*success:function(){
                      //label.text('').addClass('valid');
                     $('#login-button').click(function(event){
                     event.preventDefault();
                     $('form').fadeOut(500);
                     $('.wrapper').addClass('form-success');

                 });

                 },*/
			rules : {
				username : {
					required : true,
				},

				password : {
					required : true,

				},

			},
			messages : {
				username : {
					required : "Please enter username",
				},

				password : {
					required : "Please enter password",

				},

			}
		});
	})

	var error="${error}";
	if(error=="error"){

		alert("Incorrect username or password");
	}

</script>
</body>
</html>