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
    <script type="text/javascript" src="/HouseRentalSystem/js/jquery.validate.min.js"></script>

    <style>
        .error {
            font-size:13px;
            color: red;
        }
    </style>
    <script type="text/javascript">
        $().ready(function() {
            $("#fromdate").datepicker(
                {
                    dateFormat: "yy-mm-dd"
                }
            );
            $("#todate").datepicker(
                {
                    dateFormat: "yy-mm-dd"
                }
            );

            $("#myform").validate({
                rules : {
                    house_id : {
                        required : true,
                    },
                    address : {
                        required : true,
                    },
                    lease : {
                        required : true,
                    },
                    price: {
                        required : true,
                        min: 1
                    },
                    lease_idcard: {
                        required : true,
                    },
                    tenant: {
                        required : true,
                    },
                    tenant_idcard: {
                        required : true,
                    },
                    fromdate: {
                        required : true,
                    },
                    todate: {
                        required : true,
                    },
                    payday: {
                        required : true,
                        min:0,
                        max:31,
                    }
                },
                messages : {
                    house_id : {
                        required : "House ID cannot be empty",
                    },
                    address : {
                        required : "Address cannot be empty",
                    },
                    lease : {
                        required : "Lessor cannot be empty",
                    },
                    price: {
                        required : "Rent cannot be empty",
                        min: "Please enter the correct rent"
                    },
                    lease_idcard: {
                        required : "Lessor ID card number cannot be empty",
                    },
                    tenant: {
                        required : "Lessee cannot be empty",
                    },
                    tenant_idcard: {
                        required : "Lessee ID card number cannot be empty",
                    },
                    fromdate: {
                        required : "Start date cannot be empty",
                    },
                    todate: {
                        required : "End date cannot be empty",
                    },
                    payday: {
                        required : "Monthly payment day cannot be empty",
                        min:"Monthly payment day must be greater than 0",
                        max:"Monthly payment day must be less than 31",
                    }
                }
            });
        })
    </script>

</head>
<body>

<div class="result-title">
    <h1>Add contract information, please make sure the contract information is correct before submitting!</h1>
</div>
<div class="result-content">
    <div class="sidebar-title">
        <form action="/HouseRentalSystem/agreement/insertagreement.action" method="post" id="myform" name="myform" enctype="multipart/form-data" >
            <table class="insert-tab" width="100%">
                <tbody>
                <th><i class="require-red">*</i>House ID:</th>
                <td>
                    <input class="common-text required" value="${agreement.house_id}" id="house_id" name="house_id" size="50" type="text" readonly>
                </td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Address:</th>
                    <td><input class="common-text" name="address" value="${agreement.address }" id="address" size="50" type="text"></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Lessor (Party A):</th>
                    <td><input class="common-text" name="lease" value="${agreement.lease }" id="lease" size="50" type="text" ></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Lessor (Party A) ID card number:</th>
                    <td><input class="common-text" name="lease_idcard" value="${agreement.lease_idcard}" id="lease_idcard" size="50" type="text"></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Lessee (Party B):</th>
                    <td><input class="common-text" name="tenant" value="${agreement.tenant}" id="tenant" size="50" type="text"></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Lessee (Party B) ID card number:</th>
                    <td><input class="common-text" name="tenant_idcard" value="${agreement.tenant_idcard}" id="tenant_idcard" size="50" type="text"></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Start date:</th>
                    <td><input class="common-text" name="fromdate" id="fromdate" value="${agreement.fromdate}" size="50"  type="text" readonly></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>End date:</th>
                    <td><input class="common-text" name="todate" id="todate" value="${agreement.todate}" size="50"  type="text" readonly></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Monthly rent:</th>
                    <td><input class="common-text" name="price" id="price" value="${agreement.price}" size="50"  type="text" ></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Monthly payment day (number):</th>
                    <td><input class="common-text" name="payday" id="payday" value="${agreement.payday}" size="50"  type="text" ></td>
                </tr>
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
                </tbody></table>
        </form>
    </div>
</div>

</body>
</html>