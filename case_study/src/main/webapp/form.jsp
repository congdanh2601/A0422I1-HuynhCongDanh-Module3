<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/11/2022
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Form</title>
</head>
<body>
<div class="row" id="head">
    <div class="col-l-2">
        <a href="index.jsp" style="text-decoration: none">
            <img src="logo@2x.png">
        </a>
    </div>
    <div class="col-l-10">
        <p>Huỳnh Công Danh</p>
    </div>
</div>
<div class="row" id="headLink">
    <div class="col-l-9">
        <a href="index.jsp">Home</a>
        <a href="/furamaServlet?action=employee">Employee</a>
        <a href="/furamaServlet?action=customer">Customer</a>
        <a href="/furamaServlet?action=service">Service</a>
        <a href="/furamaServlet?action=contract" style="border-right: none">Contract</a>
    </div>
    <div class="col-l-3">
        <form action="https://www.google.com/search">
            <input type="text" name="q" placeholder="Search on Google"
                   style="border-radius: 10px; padding-left: 10px; width: 70%; font-family: Calibri">
        </form>
    </div>
</div>
</body>
</html>
