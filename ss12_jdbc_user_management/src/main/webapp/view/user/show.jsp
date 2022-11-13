<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/10/2022
  Time: 1:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/view/user/create.jsp">Add New User</a>
    </h2>
    <form action="/servlet">
        <input type="text" name="action" value="find" hidden>
        <span>Find by country: </span>
        <input type="text" name="country">
        <input type="submit" value="Find">
    </form>
</center>
<center>
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <c:if test="${mess != null}">
            <p style="color: red">${mess}</p>
        </c:if>
        <form action="/servlet">
            <input type="text" name="action" value="sort" hidden>
            <input type="submit" value="Sort by name">
        </form>
        <span> </span>
        <form action="/index.jsp">
            <input type="submit" value="Un-sort">
        </form>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${list}">
            <tr>
                <td><c:out value="${user.getId()}"/></td>
                <td><c:out value="${user.getName()}"/></td>
                <td><c:out value="${user.getEmail()}"/></td>
                <td><c:out value="${user.getCountry()}"/></td>
                <td>
                    <a href="/servlet?action=update&id=${user.getId()}">Edit</a>
                    <a href="/servlet?action=delete&id=${user.getId()}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</center>
</body>
</html>
