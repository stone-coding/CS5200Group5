<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <title>House Rental System</title>

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>

    <style>
        .error {
            font-size:13px;
            color: red;
        }
    </style>
    <script type="text/javascript">
        $().ready(function() {
            // Validate the form on key press, release, and submit
            $("#date").datepicker(
                {
                    dateFormat: "yy-mm-dd" //
                }
            );
            $("#myform").validate({
                rules : {
                    date:{
                        required:true,
                    },
                    price:{
                        required:true,
                        min:1
                    }
                },
                messages : {
                    date:{
                        required:"Rent payment due date cannot be empty",
                    },
                    price:{
                        required:"Rent payable cannot be empty",
                        min:"Please enter the correct rent"
                    }
                }
            });
        })
    </script>

</head>
<body>

<div class="result-title">
    <h1>Add Rent Payment Information</h1>
</div>
<div class="result-content">
    <div class="sidebar-title">
        <form action="/HouseRentalSystem/paid/inserttopaid.action" method="post" id="myform" name="myform" enctype="multipart/form-data" >
            <table class="insert-tab" width="100%">
                <tbody>
                <th><i class="require-red">*</i>House ID:</th>
                <td>
                    <input class="common-text required" value="${rentlist.house_id}" id="house_id" name="house_id" size="50" type="text" readonly>
                </td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Address:</th>
                    <td><input class="common-text" name="address" value="${rentlist.address }" id="address" size="50" type="text" readonly></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Tenant Name:</th>
                    <td><input class="common-text" name="name" value="${rentlist.userlist.name }" id="name" size="50" type="text" readonly></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Rent Payment Due Date:</th>
                    <td><input class="common-text" name="date" value="" id="date" size="50" type="text" readonly></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Rent Payable:</th>
                    <td><input class="common-text" name="price" value="" id="tenant" size="50" type="text"></td>
                </tr>
                <input type="hidden" name="userlist_id" id="userlist_id" value="${rentlist.userlist_id}"/>
                <tr>
                    <th></th>
                    <td>
                        <input class="btn btn-primary btn6 mr10" value="Submit" type="submit">
                        <input class="btn btn6" onclick="history.go(-1)" value="Back" type="button">
                    </td>
                </tr>
                <tr>
                    <font id="error" color="red">${error }</font>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>

</body>
</html>