<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/10/2022
  Time: 1:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update User</title>
</head>
<body>
<h1>Update User</h1>
<form action="/servlet" method="post">
    <table>
        <tr>
            <td>Id:</td>
            <td><input type="number" name="id" value="${user.getId()}" readonly></td>
        </tr>
        <tr>
            <td>Product name:</td>
            <td><input type="text" name="name" value="${user.getName()}"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" name="email" value="${user.getEmail()}"></td>
        </tr>
        <tr>
            <td>Country:</td>
            <td><input type="text" name="country" value="${user.getCountry()}"></td>
        </tr>
    </table>
    <input type="text" value="update" name="action" hidden>
    <input type="submit">
</form>
<br>
<a href="/index.jsp">Back to main menu</a>
</body>
</html>
