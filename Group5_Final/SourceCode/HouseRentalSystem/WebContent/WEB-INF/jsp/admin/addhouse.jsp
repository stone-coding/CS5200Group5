<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <title>House Rental System</title>
    <link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/main.css"/>
    <script type="text/javascript" src="/HouseRentalSystem/js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="/HouseRentalSystem/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="/HouseRentalSystem/js/jquery.validate.min.js"></script>
    <style>


        .error {

            font-size:13px;
            color: red;

        }

    </style>
    <script type="text/javascript">
        $().ready(function() {
            // Validate the form on key press, release, and submit
            $("#myform").validate({

                rules : {
                    houseid : {
                        required : true,
                    },

                    address : {
                        required : true,

                    },
                    area : {
                        required : true,
                        min: 0

                    },
                    price: {
                        required : true,
                        min: 0

                    }

                },
                messages : {
                    houseid : {
                        required : "House ID cannot be empty!",
                    },

                    address : {
                        required : "Address cannot be empty!",

                    },
                    area : {
                        required : "Area cannot be empty!",
                        min:"Please enter the correct area"

                    },
                    price: {
                        required :  "Price cannot be empty!",
                        min:"Please enter the correct rent"

                    }

                }
            });
        })
    </script>

</head>
<body>

<div class="result-title">
    <h1>Add House</h1>
</div>
<div class="result-content">
    <div class="sidebar-title">
        <form action="addhouse.action" method="post" id="myform" name="myform" enctype="multipart/form-data" >
            <table class="insert-tab" width="100%">
                <tbody>
                <th><i class="require-red">*</i>House ID:</th>
                <td>
                    <input class="common-text required" value="${houselist.houseid}" id="houseid" name="houseid" size="50" type="text">
                </td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Address:</th>
                    <td><input class="common-text" name="address" value="${houselist.address }" id="address" size="50" type="text"></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Area:</th>
                    <td><input class="common-text" name="area" value="${houselist.area }" id="area" size="50" type="text" ></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Rent:</th>
                    <td><input class="common-text" name="price" value="${houselist.price }" id="price" size="50" type="text"></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Status:</th>
                    <td>
                        <select name="status" id="status" class="required">

                            <option value="Rented" <c:if test="${houselist.status == 'Rented'}">selected</c:if>>Rented</option>
                            <option value="Not Rented" <c:if test="${houselist.status == 'Not Rented'}">selected</c:if>>Not Rented</option>
                        </select>
                    </td>
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