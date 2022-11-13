<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/11/2022
  Time: 9:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Customer Management</title>
    <link href="/webjars/bootstrap/5.2.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="cssIndex1.css">
    <script src="/webjars/bootstrap/5.2.2/js/bootstrap.min.js">
    </script>
    <script>
        function infoDelete(id, name) {
            document.getElementById("deleteId").value = id;
            document.getElementById("deleteName").innerText = name;
        }
    </script>
</head>
<body>
<jsp:include page="/form.jsp"></jsp:include>
<div class="row">
    <div class="col-l-2" id="side">
        <ul>
            <li><a href="/furamaServlet?action=employee">Employee</a></li>
            <li><a href="/furamaServlet?action=customer">Customer</a></li>
            <li><a href="/furamaServlet?action=service">Service</a></li>
            <li><a href="/furamaServlet?action=contract">Contract</a></li>
        </ul>
    </div>
    <div class="col-l-10" id="main">
        <%--        <h1 style="margin: auto">Welcome!</h1>--%>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-7">
                                <h2>Manage <b>Customers</b></h2>
                            </div>
                            <div class="col-sm-3">
                                <form class="d-flex" style="padding-top: 5px" action="/customerServlet">
                                    <input hidden name="action" value="search">
                                    <input class="form-control me-2" type="search" name="name" placeholder="Search by name" aria-label="Search">
                                    <button class="btn btn-success" type="submit">Search</button>
                                </form>
                            </div>
                            <div class="col-sm-2" style="padding-top: 5px">
                                <a href="/customerServlet?action=create" class="btn btn-primary" data-toggle="modal">Add New Customer</a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover" style="font-size: 13px">
                        <thead>
                        <tr>
                            <th style="width: 3%">ID</th>
                            <th style="width: 13%">Name</th>
                            <th style="width: 5%">Gender</th>
                            <th style="width: 10%">Date of birth</th>
                            <th>National ID</th>
                            <th>Phone number</th>
                            <th style="text-align: center">Customer type</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th style="text-align: center">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="customer" items="${pageList}">
                            <tr>
                                <td>${customer.getCustomerId()}</td>
                                <td>${customer.getCustomerName()}</td>
                                <c:if test="${customer.isCustomerGender()}">
                                    <td>Male</td>
                                </c:if>
                                <c:if test="${!customer.isCustomerGender()}">
                                    <td>Female</td>
                                </c:if>
                                <td>${customer.getCustomerBirthday()}</td>
                                <td>${customer.getCustomerIdCard()}</td>
                                <td>${customer.getCustomerPhone()}</td>
                                <td>${customer.getCustomerType()}</td>
                                <td>${customer.getCustomerEmail()}</td>
                                <td>${customer.getCustomerAddress()}</td>
                                <td class="px-4">
                                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                            <%--                        <a href="/customer?action=view&id=${customer.getId()}"><button type="button" class="btn btn-sm btn-primary mx-1">View</button></a>--%>
                                        <a href="/customerServlet?action=update&id=${customer.getCustomerId()}">
                                            <button type="button" class="btn btn-sm btn-primary mx-1">Edit</button>
                                        </a>
                                            <%--                                <a href="/customer?action=delete&id=${customer.getId()}"><button type="button" class="btn btn-sm btn-danger">Delete</button></a>--%>
                                        <button type="button"
                                                onclick="infoDelete('${customer.getCustomerId()}','${customer.getCustomerName()}')"
                                                class="btn btn-sm btn-danger mx-1" data-bs-toggle="modal"
                                                data-bs-target="#exampleModal">
                                            Delete
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <div class="hint-text">Showing <b>${pageList.size()}</b> out of <b>${fullList.size()}</b> entries</div>
                        <ul class="pagination">
                            <li class="page-item"><a href="#" class="page-link">Previous</a></li>
                            <li class="page-item active"><a href="/customerServlet?page=1" class="page-link">1</a></li>
                            <li class="page-item"><a href="/customerServlet?page=2" class="page-link">2</a></li>
                            <li class="page-item"><a href="/customerServlet?page=3" class="page-link">3</a></li>
                              <li class="page-item"><a href="#" class="page-link">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Delete many -->
<%--            Checkbox             --%>
<%--         <th>--%>
<%--							<span class="custom-checkbox">--%>
<%--								<input type="checkbox" id="selectAll">--%>
<%--								<label for="selectAll"></label>--%>
<%--							</span>--%>
<%--            </th>--%>
<%--            <td>--%>
<%--							<span class="custom-checkbox">--%>
<%--								<input type="checkbox" id="checkbox1" name="options[]" value="1">--%>
<%--								<label for="checkbox1"></label>--%>
<%--							</span>--%>
<%--            </td>--%>
<%--            Modal--%>
<%--        <div id="deleteEmployeeModal" class="modal fade">--%>
<%--            <div class="modal-dialog">--%>
<%--                <div class="modal-content">--%>
<%--                    <form>--%>
<%--                        <div class="modal-header">--%>
<%--                            <h4 class="modal-title">Delete Employee</h4>--%>
<%--                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
<%--                        </div>--%>
<%--                        <div class="modal-body">--%>
<%--                            <p>Are you sure you want to delete these Records?</p>--%>
<%--                            <p class="text-warning"><small>This action cannot be undone.</small></p>--%>
<%--                        </div>--%>
<%--                        <div class="modal-footer">--%>
<%--                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">--%>
<%--                            <input type="submit" class="btn btn-danger" value="Delete">--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--            Delete one--%>
<form method="get" action="/customerServlet?action=delete">
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Confirm delete</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <span>Do you really want to delete customer <span id="deleteName"></span>?</span>
                </div>

                <div class="modal-footer">
                    <input hidden id="deleteId" name="id">
                    <input hidden name="action" value="delete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="botton" class="btn btn-danger">Delete</button>
                </div>

            </div>
        </div>
    </div>
</form>
<%--<script>--%>
<%--    function infoDelete(id, name) {--%>
<%--        document.getElementById("deleteId").value = id;--%>
<%--        document.getElementById("deleteName").innerText = name;--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
