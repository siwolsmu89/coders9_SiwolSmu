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
		.container {
		  max-width: 800px;
		  margin: auto;
		  margin-top: 10%;
		}
		
		body {
			background-color: black;
			color: white;
		}
	</style>
</head>
<body>
<div class="container">
	<div class="header">
	
	</div>
	
	<div class="body">
		<div class="row text-center">
			<div class="col-12">
				<h1>Welcome To Board v1</h1>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-5">
				<form class="mt-5" id="login-form" method="POST" action="login.jsp">
					<div class="form-group">
						<label>ID</label>
						<input class="form-control" type="text" name="userid" placeholder="input your id here" />
					</div>
					<div class="form-group mt-0">
						<label>Password</label>
						<input class="form-control" type="password" name="userpwd" placeholder="input your password here" />
					</div>
				</form>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-5">
			
			</div>
		</div>
	</div>
	
	<div class="footer">
	
	</div>
</div>
</body>
</html>