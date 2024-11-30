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
    <style>

        a:hover{
            cursor:pointer;
        }
    </style>
    <script language=javascript>
        // Submit the pagination query form
        function to_page(url1){

            $.ajax({ url:url1,
                type:"post",
                async : false,

                success:function(data){
                    // Your specific operation
                    // alert(data);
                    $("#inside").html(data);
                    alert("Success");

                },
                error: function() {
                    alert("Failed, please try again later!");
                }
            });
        }

    </script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">Admin Management</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on sendRequest" href="javascript:void(0)" onclick="to_page('toindex.action')">Home</a></li>

            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li>Welcome, ${sessionScope.user.username}!</li>

                <li><a href="javascript:if(confirm('Are you sure you want to log out?'))location='/HouseRentalSystem/login.action'">Log Out</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>Menu</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a class="a"><i class="icon-font">&#xe003;</i>House Information</a>
                    <div class="p"><ul class="sub-menu">
                        <li><a href="/HouseRentalSystem/houselist.action"><i class="icon-font">&#xe008;</i>House List</a></li>

                    </ul>
                    </div>
                </li>
                <li>
                    <a class="a"><i class="icon-font">&#xe018;</i>Rental Information</a>
                    <div class="p"><ul class="sub-menu">
                        <li><a href="/HouseRentalSystem/rentlist/myrentlist.action"><i class="icon-font">&#xe017;</i>My Rental</a></li>
                        <li><a href="/HouseRentalSystem/checkout/getmycheckout.action"><i class="icon-font">&#xe037;</i>Terminated Rent</a></li>

                    </ul>
                    </div>
                </li>
                <li>
                    <a class="a"><i class="icon-font">&#xe018;</i>My Applications</a>
                    <div class="p"><ul class="sub-menu">
                        <li><a href="/HouseRentalSystem/getmyapply.action"><i class="icon-font">&#xe017;</i>View Application</a></li>
                        <li><a href="/HouseRentalSystem/applyout/getmyapplyout.action"><i class="icon-font">&#xe037;</i>Termination List</a></li>

                    </ul>
                    </div>
                </li>
                <li>
                    <a class="a"><i class="icon-font">&#xe018;</i>Payment Info</a>
                    <div class="p">     <ul class="sub-menu">
                        <li><a href="/HouseRentalSystem/paid/mytopaidlist.action"><i class="icon-font">&#xe017;</i>Pending Pay</a></li>
                        <li><a href="/HouseRentalSystem/paid/findmypaid.action"><i class="icon-font">&#xe017;</i>Completed Pay</a></li>

                    </ul></div>
                </li>
                <li>
                    <a class="a"><i class="icon-font">&#xe018;</i>Fault Reporting</a>
                    <div class="p">    <ul class="sub-menu">
                        <li><a href="/HouseRentalSystem/wrong/showaddwrong.action"><i class="icon-font">&#xe017;</i>Report Fault</a></li>
                        <li><a href="/HouseRentalSystem/wrong/mywronglist.action"><i class="icon-font">&#xe017;</i>Unresolved Fault</a></li>
                        <li><a href="/HouseRentalSystem/wrong/findmysolve.action"><i class="icon-font">&#xe017;</i>Resolved Fault</a></li>
                    </ul></div>
                </li>
                <li>
                    <a class="a"><i class="icon-font">&#xe018;</i>Other Operations</a>
                    <div class="p">   <ul class="sub-menu">
                        <li><a href="/HouseRentalSystem/findhasuserlist.action"><i class="icon-font">&#xe017;</i>Account Binding</a></li>

                    </ul></div>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe06b;</i><span>Welcome to use this system!</span></div>
        </div>

        <div class="result-wrap" id="inside">
            <jsp:include page="${mainPage==null?'../admin/index.jsp':mainPage}"></jsp:include>
        </div>
    </div>

</div>
<!--/main-->
</div>
</body>
</html>