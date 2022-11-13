<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/10/2022
  Time: 1:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <title>EDIT CUSTOMER</title>
    <style>
        td, form, h2, button {
            padding: 5px;
            margin-left: 10px;
            /*width: 130px;*/
        }
    </style>
</head>
<body>
<h2>EDIT CUSTOMER</h2>
<form action="/customerServlet?action=update" method="post">
    <table>
        <tr>
            <td>ID:</td>
            <td>
                <input class="form-control" readonly type="text" name="id" value="${customer.getCustomerId()}">
                <span class="form-text">You can't change id</span>
            </td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><input class="form-control" type="text" name="name" value="${customer.getCustomerName()}"></td>
        </tr>
        <tr>
            <td>Date of birth:</td>
            <td><input required class="form-control" type="date" name="birthday"
                       value="${customer.getCustomerBirthday()}"></td>
        </tr>
        <tr>
            <td>Sex:</td>
            <td>
                <select class="form-select" name="gender" value="${customer.isCustomerGender()}">
                    <option value="1">Male</option>
                    <option value="0">Female</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>National ID:</td>
            <td><input class="form-control" type="number" name="idCard" value="${customer.getCustomerIdCard()}"></td>
        </tr>
        <tr>
            <td>Phone number:</td>
            <td><input class="form-control" type="number" name="phone" maxlength="10"
                       value="${customer.getCustomerPhone()}"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input class="form-control" type="text" name="email" value="${customer.getCustomerEmail()}"></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input class="form-control" type="text" name="address" value="${customer.getCustomerAddress()}"></td>
        </tr>
        <tr>
            <td>Customer type:</td>
            <td>
                <select class="form-select" name="type">
                    <c:forEach var="type" items="${typeList}">
                        <option value="${type.getCustomerType()}" ${type.getCustomerType() == customer.getCustomerType() ? 'selected' : ''} >${type.getCustomerType()}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <button type="submit" class="btn btn-success" style="margin-top: 15px">Save</button>
            </td>
        </tr>
    </table>
    <%--    <input type="text" name="action" value="create" hidden>--%>
</form>
<a href="/customerServlet">Back to Customer Management</a>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>