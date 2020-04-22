<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark bg-primary">
        <div class="container">
            <ul class="navbar-nav mr-auto">
                <li class="navbar-brand">
                    <a href="/" class="nav-link">New User</a>
                </li>
                <li class="navbar-brand">
                    <a href="/clear" class="nav-link">Clear</a>
                </li>
            </ul>
        </div>
    </nav>
</header>
<br>

<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center">Enter new User</h3>

        <caption>
            <h2>
                <c:if test="${user != null}">
                    Edit User
                </c:if>
                <c:if test="${user == null}">
                    Add New User
                </c:if>
            </h2>
        </caption>


        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
            </thead>

            <tbody>
            <c:if test="${user == null}">
            <form action="create" method="post">
                </c:if>
                <c:if test="${user != null}">
                <form action="update" method="post">
                    </c:if>

                    <c:if test="${user != null}">
                        <input type="hidden" name="id" value="<c:out value='${user.id}' />"/>
                    </c:if>

                    <tr>
                        <td>
                            <input type="text" value="<c:out value='${user.name}' />" class="form-control"
                                   name="name" required="required">
                        </td>
                        <td>
                            <input type="text" value="<c:out value='${user.email}' />" class="form-control"
                                   name="email">
                        </td>
                        <td>
                            <input type="text" value="<c:out value='${user.country}' />" class="form-control"
                                   name="country">
                        </td>
                        <td>
                            <button type="submit" class="btn btn-success">Save</button>
                        </td>
                    </tr>
                </form>
            </tbody>
        </table>
        <hr>

    </div>

    <div class="container">
        <h3 class="text-center">List of Users</h3>
        <hr>

        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <!--   for (Todo todo: todos) {  -->
            <c:forEach var="user" items="${listUser}">
                <tr>
                    <td><c:out value="${user.id}"/></td>
                    <td><c:out value="${user.name}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.country}"/></td>
                    <td><a href="update?id=<c:out value='${user.id}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete?id=<c:out value='${user.id}' />">Delete</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
