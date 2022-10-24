<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 24/10/2022
  Time: 10:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
    <style>
        table, th, td {
            border: solid 1px #bdc3c7;
            border-collapse: collapse;
            padding: 3px;
            /*text-align: center;*/
        }

        th {
            width: 120px;
        }
    </style>
</head>
<body>
<h1>List of Products</h1>
<table>
    <tr>
        <th>Product ID</th>
        <th style="width: 200px">Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Brand</th>
    </tr>
    <c:forEach var="product" items="${list}">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getBrand()}</td>
        </tr>
    </c:forEach>
</table>
<br>
<a href="/index.jsp">Back to main menu</a>
</body>
</html>
