<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 24/10/2022
  Time: 6:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Product</title>
</head>
<body>
<h1>Update product</h1>
<form action="/servlet">
    <table>
        <tr>
            <td>Id:</td>
            <td><input type="number" name="id" value="${productToUpdate.getId()}"></td>
        </tr>
        <tr>
            <td>Product name:</td>
            <td><input type="text" name="name" value="${productToUpdate.getName()}"></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><input type="number" name="price" value="${productToUpdate.getPrice()}"></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><input type="text" name="description" value="${productToUpdate.getDescription()}"></td>
        </tr>
        <tr>
            <td>Brand:</td>
            <td><input type="text" name="brand" value="${productToUpdate.getBrand()}"></td>
        </tr>
    </table>
    <input type="text" value="update2" name="action" hidden>
    <input type="submit">
</form>
<br>
<a href="/index.jsp">Back to main menu</a>
</body>
</html>
