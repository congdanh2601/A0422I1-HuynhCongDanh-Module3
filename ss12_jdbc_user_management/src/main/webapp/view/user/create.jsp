<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/10/2022
  Time: 1:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New User</title>
    <style>
        td {
            padding: 5px;
            width: 130px;
        }
    </style>
</head>
<body>
<h1>Create new User</h1>
<form action="/servlet" method="post">
    <table>
        <tr>
            <td>User name:</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td>Country:</td>
            <td><input type="text" name="country"></td>
        </tr>
    </table>
    <input type="text" name="action" value="create" hidden>
    <input type="submit">
</form>
<br>
<a href="/index.jsp">Back to main menu</a>
</body>
</html>

