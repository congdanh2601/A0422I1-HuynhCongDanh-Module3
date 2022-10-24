<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 24/10/2022
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Product</title>
    <style>
        td {
            padding: 5px;
            width: 130px;
        }
    </style>
</head>
<body>
<h1>Create new product</h1>
<form action="/servlet">
    <table>
        <tr>
            <td>Id:</td>
            <td><input type="number" name="id"></td>
        </tr>
        <tr>
            <td>Product name:</td>
            <td><input name="name" type="text"></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><input type="number" name="price"></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><input name="description" type="text"></td>
        </tr>
        <tr>
            <td>Brand:</td>
            <td><input type="text" name="brand"></td>
        </tr>
    </table>
    <input type="text" value="create" name="action" hidden>
    <input type="submit">
</form>
<br>
<a href="/index.jsp">Back to main menu</a>
</body>
</html>
