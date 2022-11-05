<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/10/2022
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="cssIndex.css">
</head>
<body>
<div class="row" id="head">
    <div class="col-l-2">
        <a href="index.jsp" style="text-decoration: none">
            <img src="https://farm5.staticflickr.com/4230/35108607076_fc9c72a7f4_o.png">
            <br>
            <p style="font-family: 'Arial Narrow'; color: black; text-align: center">Logo</p>
        </a>
    </div>
    <div class="col-l-10">
        <p>Huynh Cong Danh</p>
    </div>
</div>
<div class="row" id="headLink">
    <div class="col-l-9">
        <a href="">Home</a>
        <a href="">Employee</a>
        <a href="/view/custumer/create.jsp">Customer</a>
        <a href="">Service</a>
        <a href="" style="border-right: none">Contract</a>
    </div>
    <div class="col-l-3">
        <form>
            <input type="text" name="search" placeholder="search" style="border-radius: 10px; padding-left: 10px; width: 70%">
        </form>
    </div>
</div>
<div class="row">
    <div class="col-l-2" id="side">
        <ul>
            <li>Item One</li>
            <li>Item Two</li>
            <li>Item Three</li>
        </ul>
    </div>
    <div class="col-l-10" id="main">
        <h1 style="margin: auto">Welcome!</h1>
    </div>
</div>
<div class="row" id="foot">
    <p>Footer...</p>
</div>
</body>
</html>