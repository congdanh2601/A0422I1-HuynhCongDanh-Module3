<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/10/2022
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <li><a href="/servlet?action=show">Display user list</a></li>
    <li><a href="/view/user/create.jsp">Create new user</a></li>
    <li>
        <p onclick="findById('chooseUpdateId')">Update a user</p>
        <form id="chooseUpdateId" action="/servlet" style="display: none">
            <span>Select User ID: </span>
            <input type="text" name="idForUpdate">
            <input type="text" value="update" hidden name="action">
            <input type="submit">
        </form>
    </li>
    <li>
        <p onclick="findById('chooseDeleteId')">Delete a user</p>
        <form id="chooseDeleteId" action="/servlet" style="display: none">
            <span>Select Product ID: </span>
            <input name="idForDelete" type="text">
            <input type="text" value="delete" hidden name="action">
            <input type="submit">
        </form>
    </li>
    <li>
        <p onclick="findById('findByCountry')">Find user by country</p>
        <form id="findByCountry" action="/servlet" style="display: none">
            <span>Type country: </span>
            <input type="text" name="countryToFind">
            <input type="text" value="find" hidden name="action">
            <input type="submit">
        </form>
    </li>
    <li><a href="/servlet?action=sort">Display user list sort by user name</a></li>
</ol>
<script>
    function findById(id) {
        let form = document.getElementById(id);
        if (form.style.display == 'none') {
            form.style.display = 'block';
        } else form.style.display = 'none';
    }
</script>
</body>
</html>
