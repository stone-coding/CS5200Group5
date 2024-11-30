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


    <%--    <link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/common.css"/>--%>
    <%--    <link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/main.css"/>--%>
    <%--    <script type="text/javascript" src="/HouseRentalSystem/js/libs/modernizr.min.js"></script>--%>
    <%--    <script type="text/javascript" src="/HouseRentalSystem/js/jquery-1.8.3.min.js"></script>--%>
    <%--    <script type="text/javascript" src="/HouseRentalSystem/js/jquery-ui-datepicker.js"></script>--%>
    <%--    <script type="text/javascript" src="/HouseRentalSystem/js/jquery.validate.min.js"></script>--%>
    <%--    <link rel="stylesheet" type="text/css" href="/HouseRentalSystem/css/jquery-ui.css"/>--%>
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
                    date : {
                        required : true,
                    },

                    content : {
                        required : true,

                    }
                },
                messages : {
                    date : {
                        required : "Date cannot be empty",
                    },

                    content : {
                        required : "Schedule cannot be empty",

                    }
                }
            });
        })


    </script>

</head>
<body>

<div class="result-title">
    <h1>Add Schedule</h1>
</div>
<div class="result-content">
    <div class="sidebar-title">
        <form action="/HouseRentalSystem/schedule/insertschedule.action" method="post" id="myform" name="myform" enctype="multipart/form-data" >
            <table class="insert-tab" width="100%">
                <tbody>
                <th><i class="require-red">*</i>Date:</th>
                <td>
                    <input class="common-text required" value="${schedule.date}" id="date" name="date" size="50" type="text" readonly>
                </td>
                </tr>
                <tr>
                    <th><i class="require-red">*</i>Schedule:</th>
                    <td><textarea class="common-text" name="content"  id="content" style="width:430px;height:80px;">${schedule.content}</textarea></td>

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