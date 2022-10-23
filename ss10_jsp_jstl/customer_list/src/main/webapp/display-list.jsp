<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23/10/2022
  Time: 12:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>DSKH</title>
    <style>
        h1 {
            text-align: center;
        }
        table, th, td {
            border-bottom: solid 1px #95a5a6;
            border-collapse: collapse;
        }
        table {
            margin-left: auto;
            margin-right: auto;
        }
        td, th {
            padding: 10px 20px;
        }
        td img {
            width: 40px;
            height: 40px;
        }
    </style>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table>
    <tr>
        <th style="width: 200px;">Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customers}">
        <tr>
            <td>${customer.getName()}</td>
            <td>${customer.getDateOfBirth()}</td>
            <td>${customer.getAddress()}</td>
            <td>${customer.getPicture()}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>