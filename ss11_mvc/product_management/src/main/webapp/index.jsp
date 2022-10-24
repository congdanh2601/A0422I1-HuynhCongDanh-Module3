<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23/10/2022
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home page</title>
    <style>
        ol li {
            margin: 5px;
        }
        a, p {
            margin: 0 0 5px 0;
            color: blue;
            text-decoration: underline;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h1>MENU</h1>
<ol type="1.">
    <li><a href="/servlet?action=show">Display product list</a></li>
    <li><a href="/view/product/create.jsp">Create new product</a></li>
    <li>
        <p onclick="document.getElementById('chooseUpdateId').style.display = 'block'">Update a product</p>
        <form id="chooseUpdateId" action="/servlet" style="display: none">
            <span>Select Product ID: </span>
            <input name="idForUpdate" type="text">
            <input type="text" value="update" hidden name="action">
            <input type="submit">
        </form>
    </li>
    <li>
        <p onclick="document.getElementById('chooseDeleteId').style.display = 'block'">Delete a product</p>
        <form id="chooseDeleteId" action="/servlet" style="display: none">
            <span>Select Product ID: </span>
            <input name="idForDelete" type="text">
            <input type="text" value="delete" hidden name="action">
            <input type="submit">
        </form>
    </li>
    <li>
        <p onclick="document.getElementById('findByName').style.display = 'block'">Find product by name</p>
        <form id="findByName" action="/servlet" style="display: none">
            <span>Type name to find: </span>
            <input name="nameToFind" type="text">
            <input type="text" value="find" hidden name="action">
            <input type="submit">
        </form>
    </li>
</ol>
</body>
</html>
