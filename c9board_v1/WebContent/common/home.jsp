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
<title>Board v1 Home</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Indie+Flower&family=Patrick+Hand&display=swap');

	body {
		font-family: 'Patrick Hand';
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
	
	.input-group span {
		background-color: white !important;
		border: none;
		color: black;
		padding-left: 3px;
		padding-right: 6px;
	}
	.input-group span span {
		padding: 0px;
	}
	.input-group input {
		background-color: white !important;
		width: 15px;
		padding: 1px;
	}
	.input-group input:focus {
		outline: none;
	}
	.input-group input::placeholder {
		color: #659852;
	}
	.input-group input {
		font-weight: bold;
	}
</style>
</head>
<body>
<div class="container">
	<div class="header mb-3">
		<!-- 마우스를 맨 위에 대고 있으면 header 보이기 -->
		<%@ include file="header.jsp" %>
	</div>
	
	<%
		String error = request.getParameter("error");
	%>
	
	<div class="body">
		<div class="row text-center">
			<div class="col-12">
				<h1>Welcome To Board v1</h1>
				<small class="text-muted">MinSeok Kwon</small>
				<%
					if (error != null) {
						if (error.equals("loginfail")) {
				%>
						<p style="color: red;">Login Failed : Check your ID/Password and Try Again.</p>
				<%
						} else if (error.equals("session")) {
				%>
						<p style="color: red;">Session Invalidated : Please Login Again.</p>
				<%
						} else if (error.equals("quit")) {
				%>
						<p style="color: red;">You are Dead To Us.</p>
				<%
						} else {
				%>
						<p style="color red;">Error Occurred : Pleas Try Again.</p>
				<%			
						}
					}
				%>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="col-5">
				<form class="mt-5" id="login-form" method="POST" action="../account/login.jsp">
					<div class="form-group">
						<label>ID</label>
					<%
						if (session.getAttribute("loginUserNo") == null) {
					%>	
						<input class="form-control" type="text" name="loginid" placeholder="Input your ID here" />
					<%
						} else {
					%>	
						<input class="form-control" type="text" name="loginid" placeholder="Hey, You are Already Loggined" />
					<%
						}
					%>
					</div>
					<div class="form-group mt-0">
						<label>Password</label>
						<input class="form-control" type="password" name="loginpwd" placeholder="Input your password here" />
					</div>
					<div class="text-right">
						<button class="badge badge-dark">LOGIN</button>
						<button type="button" class="badge badge-dark" data-toggle="modal" data-target="#modal-register-form">JOIN</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div id="modal-include">
		<%@ include file="regForm.jsp" %>
	</div>
	
	<div class="footer" onclick="hideFooter()">
		<!-- 마우스를 맨 아래에 대고 있으면 footer 보이기 -->
		<%@ include file="footer.jsp" %>
	</div>
</div>
</body>
</html>