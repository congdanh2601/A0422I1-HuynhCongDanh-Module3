<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/11/2022
  Time: 6:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <style>
        .add {
            color: blue;
            text-decoration: none;
            padding: 20px;
            border: 1px solid cornflowerblue;
            border-radius: 10px;
            margin-left: 5px;
        }

        .add:hover {
            color: white;
            background-color: cornflowerblue;
        }

        table {
            margin-top: 40px;
        }

        td {
            text-align: center;

        }

        th {
            text-align: center;
        }
        .btn-update>a{
            text-decoration: none;
            color: blue;
        }
        .btn-update>a:hover{
            color: white;
        }
    </style>
</head>
<body>
<h2 style="text-align: center">Danh sách các phòng</h2>
<a class="add" href="/customerServlet?action=create">+ Add New Product</a>
<table class="table table-striped">
    <tr>
        <th>STT</th>
        <th>Mã Phòng Trọ</th>
        <th>Tên Người Thuê</th>
        <th>Sđt</th>
        <th>Ngày Bắt Đầu Thuê</th>
        <th>Hình Thức thanh toán</th>
        <th>Action</th>
    </tr>
    <c:forEach var="rom" items="${roomList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>PTX-00${rom.getMaPhongTro()}</td>
            <td>${rom.getTenNguoiThue()}</td>
            <td>0${rom.getsDT()}</td>
            <td>${rom.getNgayBatDau()}</td>
            <c:forEach var="payment" items="${paymentList}">
                <c:if test="${payment.getId() == rom.idHinhThuc}">
                    <td>${payment.getNamePayment()}</td>
                </c:if>
            </c:forEach>
            <td>
                <button type="button" class="btn btn-outline-primary btn-update">
                    <a href="/customerServlet?action=update&id=${rom.getMaPhongTro()}">Eidt</a>
                </button>
                <!-- Button trigger modal update-->
                <button type="button" onclick="infoDelete('${rom.getMaPhongTro()}','${rom.getTenNguoiThue() }')" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- Modal delete -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <%--        sửa ở đây--%>
        <form action="/customerServlet?action=delete" method="get">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input name="action" value="delete" hidden>
                    <input name="deleteId" id="deleteId" hidden>
                    <%--                    sửa ở đây--%>
                    <span class="text-danger">Bạn có muốn xoá sinh viên </span><span id="deleteName"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    <%--                    sửa ở đây--%>
    function infoDelete(id, name) {
        document.getElementById("deleteName").innerText=name;
        document.getElementById("deleteId").value=id;
    }
</script>
</html>