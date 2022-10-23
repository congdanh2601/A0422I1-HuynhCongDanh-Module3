<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23/10/2022
  Time: 11:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="/calculator">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <td><span>First operand: </span></td>
                <td><input type="number" name="firstOperand"></td>
            </tr>
            <tr>
                <td><span>Operator: </span></td>
                <td><select name="operator">
                    <option value="+">Addition</option>
                    <option value="-">Subtraction</option>
                    <option value="*">Multiplication</option>
                    <option value="/">Division</option>
                </select></td>
            </tr>
            <tr>
                <td><span>Second operand: </span></td>
                <td><input type="number" name="secondOperand"></td>
            </tr>
            <tr>
                <td></td>
                <td><input value="Calculate" type="submit" ></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
