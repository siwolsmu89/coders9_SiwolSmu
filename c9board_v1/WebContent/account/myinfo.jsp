<%@page import="v1.board.c9.vo.User"%>
<%@page import="v1.board.c9.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css">
<title>Board v1 My Info</title>
</head>
<body>
<%@ include file="../account/loginCheck.jsp" %>
<div class="container">
	<div class="header mb-3">
		<%@ include file="../common/header.jsp" %>
	</div>
	
	<%
		int userNo = (int) session.getAttribute("loginUserNo");
		UserDao userDao = new UserDao();
		User user = userDao.getUserByNo(userNo);
	%>
	
	<div class="body">
		<div class="row text-center">
			<div class="col-12">
				<h1>Board v1 My Info</h1>
			</div>
		</div>
		
		<div class="row mt-3 justify-content-center">
			<div class="col-9">
			<table id="table-account" class="table">
				<tr>
					<th>ID</th>
					<td><%=user.getId() %></td>
					<th>RegDate</th>
					<td><%=user.getRegisteredDate() %></td>
				</tr>
				<tr>
					<th>Name</th>
					<td><%=user.getName() %></td>
					<th>Nickname</th>
					<td><%=user.getNickname() %></td>
				</tr>
				<tr>
					<th>Contact</th>
					<td><%=user.getContact() %></td>
					<th>Update</th>
					<td>
						<a href="modForm.jsp" ><button class="btn btn-sm btn-secondary">Mod</button></a>
						<button type="button" onclick="delUser(event)" class="btn btn-sm btn-danger">Del</button>
					</td>
				</tr>
			</table>
			</div>
		</div>
	</div>
	
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
<script src="../resources/script/functions.js"></script>
</body>
</html>