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
            // Validate the form on key press and release and on submit
            $("#myform").validate({

                rules : {
                    name : {
                        required : true,
                    },

                    idcard : {
                        required : true,


                    },
                    phone : {
                        required : true,
                        number: true

                    }

                },
                messages : {
                    name : {
                        required : "Name cannot be empty!",
                    },

                    idcard : {
                        required : "ID card number cannot be empty!",

                    },
                    phone : {
                        required : "Phone number cannot be empty!",
                        number: "Please enter a valid phone number"

                    }

                }
            });
        })
    </script>

</head>
<body>

<div class="result-title">
    <h1>Complete Personal Information</h1>
</div>
<div class="result-content">
    <div class="sidebar-title">
        <form action="checkuserlist.action" method="post" id="myform" name="myform" enctype="multipart/form-data" >
            <table class="insert-tab" width="100%">
                <tbody>
                <input type="hidden" name="id" value="${userlist.id}"/>
                <th><i class="require-red">*</i>Name:</th>
                <td>
                    <input class="common-text required" value="${userlist.name}" id="name" name="name" size="50" type="text">
                </td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>ID Card Number:</th>
                    <td><input class="common-text" name="idcard" value="${userlist.idcard }" id="idcard" size="50" type="text"></td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Phone Number:</th>
                    <td><input class="common-text" name="phone" value="${userlist.phone }" id="phone" size="50" type="text" ></td>
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