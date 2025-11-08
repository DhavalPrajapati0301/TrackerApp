<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">User Details</h2>
<table align="center" border="1">

    <tr><th>Name</th><td>${user.firstName} ${user.lastName}</td></tr>
    <tr><th>Email</th><td>${user.email}</td></tr>
    <tr><th>Gender</th><td>${user.gender}</td></tr>
</table>
<br>
<div align="center">
    <a href="listusers">Back to List</a>
</div>


</body>
</html>