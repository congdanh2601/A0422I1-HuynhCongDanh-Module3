
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Discount Calculator</title>
    <style>
        p {margin: 10px 0 2px 0}
    </style>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="/calculator" method="post">
    <label>
        <p>Product Description:</p>
        <input type="text" placeholder="Type description" name="description">
    </label>
    <label>
        <p>List Price:</p>
        <input type="text" placeholder="Type price" name="price">
    </label>
    <label>
        <p>Discount Percent (%):</p>
        <input type="text" placeholder="Type discount percent" name="discount">
    </label>
    <br><br>
    <input type="submit" value="Calculate Discount">
</form>
</body>
</html>
