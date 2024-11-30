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

                <li><a href="javascript:if(confirm('Are you sure you want to log out?'))location='/HouseRentalSystem/login.action'">Logout</a></li>
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
                        <li><a href="/HouseRentalSystem/ahouselist.action"><i class="icon-font">&#xe008;</i>House List</a></li>
                        <li><a href="/HouseRentalSystem/toaddhouse.action"><i class="icon-font">&#xe008;</i>Add House</a></li>

                    </ul>
                    </div>
                </li>
                <li>
                    <a class="a"><i class="icon-font">&#xe018;</i>Rental/Contract</a>
                    <div class="p">         <ul class="sub-menu">
                        <li><a href="/HouseRentalSystem/rentlist/findrentlist.action"><i class="icon-font">&#xe017;</i>Rented List</a></li>

                        <li><a href="/HouseRentalSystem/checkout/getallcheckout.action"><i class="icon-font">&#xe037;</i>Checked-out List</a></li>

                    </ul>
                    </div>
                </li>
                <li>
                    <a class="a"><i class="icon-font">&#xe018;</i>Application List</a>
                    <div class="p">            <ul class="sub-menu">
                        <li><a href="/HouseRentalSystem/findapplylist.action"><i class="icon-font">&#xe037;</i>ViewHouse</a></li>
                        <li><a href="/HouseRentalSystem/applyout/findallapplyout.action"><i class="icon-font">&#xe037;</i>TerminateHouse</a></li>

                    </ul>
                    </div>
                </li>
                <li>
                    <a class="a"><i class="icon-font">&#xe018;</i>Report Fault</a>
                    <div class="p">              <ul class="sub-menu">
                        <li><a href="/HouseRentalSystem/wrong/wronglist.action"><i class="icon-font">&#xe017;</i>Pending Fault</a></li>
                        <li><a href="/HouseRentalSystem/wrong/selectall.action"><i class="icon-font">&#xe017;</i>Processed Fault</a></li>

                    </ul>
                    </div>
                </li>
                <li>
                    <a class="a"><i class="icon-font">&#xe003;</i>Rent Information</a>
                    <div class="p">          <ul class="sub-menu">
                        <li><a href="/HouseRentalSystem/paid/showaddpaid.action"><i class="icon-font">&#xe008;</i>Collect Rent</a></li>
                        <li><a href="/HouseRentalSystem/paid/topaidlist.action"><i class="icon-font">&#xe008;</i>Unpaid Rent</a></li>
                        <li><a href="/HouseRentalSystem/paid/selectall.action"><i class="icon-font">&#xe008;</i>Paid Rent</a></li>

                    </ul>
                    </div>
                </li>
                <li>
                    <a class="a"><i class="icon-font">&#xe018;</i>My Schedule</a>
                    <div class="p">          <ul class="sub-menu">
                        <li><a href="/HouseRentalSystem/schedule/selectAll.action"><i class="icon-font">&#xe017;</i>View Schedule</a></li>
                        <li><a href="/HouseRentalSystem/schedule/toinsert.action"><i class="icon-font">&#xe017;</i>Add Schedule</a></li>

                    </ul>
                    </div>
                </li>
                <li>
                    <a class="a"><i class="icon-font">&#xe018;</i>Other Operations</a>
                    <div class="p">      <ul class="sub-menu">
                        <li><a href="/HouseRentalSystem/findalluserlist.action"><i class="icon-font">&#xe017;</i>ManageAccount</a></li>


                    </ul>
                    </div>
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