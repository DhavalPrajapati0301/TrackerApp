<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>List Users</title>
</head>
<body>

<h2 align="center">User List</h2>

<table border="1" align="center" cellpadding="8" cellspacing="0">
    <tr>
        <th>Email</th>
        <th>First Name</th>
        <th>Gender</th>
        <th>Last Name</th>
        <th>Action</th>
    </tr>

    <c:forEach var="u" items="${users}">
        <tr>
            <td>${u.email}</td>
            <td>${u.firstName}</td>
            <td>${u.gender}</td>
            <td>${u.lastName}</td>
            <td>
                <a href="viewuser?userId=${u.userId}">View</a> |
                <a href="edituser?userId=${u.userId}">Edit</a> |
                <a href="deleteuser?userId=${u.userId}" onclick="return confirm('Delete this user?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
