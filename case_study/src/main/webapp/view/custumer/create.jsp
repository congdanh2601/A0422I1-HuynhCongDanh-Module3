<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/10/2022
  Time: 1:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create New Customer</title>
    <style>
        td {
            padding: 5px;
            width: 130px;
        }
    </style>
</head>
<body>
<h1>Create new Customer</h1>
<form action="/servlet" method="post">
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Date of birth:</td>
            <td><input type="date" name="birthday"></td>
        </tr>
        <tr>
            <td>Sex:</td>
            <td>
                <select name="sex">
                    <option value="1">Male</option>
                    <option value="2">Female</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>National ID:</td>
            <td><input type="number" name="idCard" ></td>
        </tr>
        <tr>
            <td>Phone number:</td>
            <td><input type="number" name="phone" maxlength="10"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input type="text" name="address"></td>
        </tr>
        <tr>
            <td>Customer type:</td>
            <td>
                <select name="type">
                    <option value="1">Diamond</option>
                    <option value="2">Platinum</option>
                    <option value="3">Gold</option>
                    <option value="4">Silver</option>
                    <option value="5">Member</option>
                </select>
            </td>
        </tr>
    </table>
    <input type="text" name="action" value="create" hidden>
    <br>
    <input type="submit">
</form>
<br>
<a href="/index.jsp">Back to main menu</a>
</body>
</html>

