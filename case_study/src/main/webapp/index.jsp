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
<jsp:include page="form.jsp"></jsp:include>
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
                <h1 style="margin: auto">Welcome!</h1>

        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
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

</body>
</html>