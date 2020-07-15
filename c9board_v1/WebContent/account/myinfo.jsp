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
<title>Insert title here</title>
<style>
	body {
		background-color: black;
		color: white;
	}
	
	.modal {
		margin-top: 6%;
	}
	
	.container .body {
	  max-width: 800px;
	  margin: auto;
	  margin-top: 50px;
	}
	
	.table {
		color: lightgray;
	}
</style>
</head>
<body>
<div class="container">
	<div class="header mb-3">
		<!-- 마우스를 맨 위에 대고 있으면 header 보이기 -->
		<%@ include file="../common/header.jsp" %>
	</div>
	
	<div class="row justify-content-center">
		<div class="col-9">
			<div style="border: 1px solid lightgray;" onmouseover="showHeader()"></div>
		</div>
	</div>
	<%
		if (session.getAttribute("loginUserNo") == null) {
			response.sendRedirect("home.jsp?error=session");
			return;
		}
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
		
		<div class="row justify-content-center">
			<div class="col-9">
			<table class="table">
				<tr>
					<th>ID</th>
					<td><%=user.getId() %></td>
					<th>Name</th>
					<td><%=user.getName() %></td>
				</tr>
				<tr>
					<th>Nickname</th>
					<td><%=user.getNickname() %></td>
					<th>Contact</th>
					<td><%=user.getContact() %></td>
				</tr>
				<tr>
					<th>RegDate</th>
					<td><%=user.getRegisteredDate() %></td>
					<th>Update</th>
					<td>Mod Del</td>
				</tr>
			</table>
			</div>
		</div>
	</div>
	
	
	<div class="row justify-content-center mt-5">
		<div class="col-9">
			<div style="border: 1px solid lightgray;" onmouseover="showFooter()"></div>
		</div>
	</div>
	<div class="footer" onclick="hideFooter()">
		<!-- 마우스를 맨 아래에 대고 있으면 footer 보이기 -->
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
</body>
</html>