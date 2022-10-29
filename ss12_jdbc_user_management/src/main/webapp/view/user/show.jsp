<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/10/2022
  Time: 1:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User List</title>
    <style>
        table, th, td {
            border: solid 1px #bdc3c7;
            border-collapse: collapse;
            padding: 3px;
            }

        th {
            width: 120px;
        }
    </style>
</head>
<body>
<h1>List of Users</h1>
<table>
    <tr>
        <th>User ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
    </tr>
    <c:forEach var="user" items="${list}">
        <tr>
            <td>${user.getId()}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
        </tr>
    </c:forEach>
</table>
<br>
<a href="/index.jsp">Back to main menu</a>
</body>
</html>
