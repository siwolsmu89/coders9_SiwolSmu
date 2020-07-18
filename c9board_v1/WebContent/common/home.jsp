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
<link rel="stylesheet" href="../resources/css/regform.css">
<title>Board v1 Home</title>
</head>
<body>
<div class="container">
	<div class="header mb-3">
		<%@ include file="header.jsp" %>
	</div>
	
	<div class="body">
		<div class="row text-center">
			<div class="col-12">
				<h1>Welcome To Board v1</h1>
				<%
					String error = request.getParameter("error");
					if (error != null) {
				%>
					<p style="color: red;">
				<%
						if (error.equals("loginfail")) {
				%>
						Login Failed : Check your ID/Password and Try Again.
				<%
						} else if (error.equals("session")) {
				%>
						Request Denied : Need a Login To User this Service.
				<%
						} else if (error.equals("quit")) {
				%>
						You are Dead To Us.
				<%
						} else {
				%>
						Error Occurred : Pleas Try Again.
				<%			
						}
				%>
					</p>
				<%
					} else {
				%>
					<p class="text-muted">MinSeok Kwon</p>
				<%
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
	
	<div class="footer">
		<%@ include file="footer.jsp" %>
	</div>

	<%@ include file="../account/regForm.jsp" %>
</div>
<script src="../resources/script/functions.js"></script>
</body>
</html>