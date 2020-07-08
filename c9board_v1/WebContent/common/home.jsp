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
	body {
		background-color: black;
		color: white;
	}
	
	.modal {
		margin-top: 6%;
	}
	
	.container {
	  max-width: 800px;
	  margin: auto;
	  margin-top: 10%;
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
	<div class="header">
		<!-- 마우스를 맨 위에 대고 있으면 header 보이기 -->
	</div>
	
	<div class="body">
		<div class="row text-center">
			<div class="col-12">
				<h1>Welcome To Board v1</h1>
				<small class="text-muted">MinSeok Kwon</small>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-5">
				<form class="mt-5" id="login-form" method="POST" action="../account/login.jsp">
					<div class="form-group">
						<label>ID</label>
						<input class="form-control" type="text" name="loginid" placeholder="Input your ID here" />
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
		<!-- 마우스를 맨 아래에 대고 있으면 footer 보이기 -->
	</div>
	
	<div class="modal fade" id="modal-register-form">
		<div class="modal-dialog">
			<div class="modal-content" style="color: black; background-color: white; border: 1px solid gray;">
				<div class="modal-header">
					<h4>User <span style="color: #7a4e3c;">user</span> = <span style="font-weight: bold; color: #5f0260;">new</span> User();</h4>
				</div>
				
				<div class="modal-body">
					<form id="register-form" method="POST" action="../account/register.jsp">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><span style="color: #7a4e3c;">user</span>.setId(</span>
							</div>
							<input style="border: none;" type="text" name="userid" onkeyup="resize(event)" />
							<div class="input-group-append">
								<span style="border:none;" class="input-group-text">)</span>
							</div>
						</div>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><span style="color: #7a4e3c;">user</span>.setName(</span>
							</div>
							<input style="border: none;" type="text" name="username" onkeyup="resize(event)" />
							<div class="input-group-append">
								<span style="border:none;" class="input-group-text">)</span>
							</div>
						</div>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><span style="color: #7a4e3c;">user</span>.setNickname(</span>
							</div>
							<input style="border: none;" type="text" name="usernickname" onkeyup="resize(event)" />
							<div class="input-group-append">
								<span style="border:none;" class="input-group-text">)</span>
							</div>
						</div>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><span style="color: #7a4e3c;">user</span>.setPassword(</span>
							</div>
							<input style="border: none;" type="password" name="userpassword1" />
							<div class="input-group-append">
								<span style="border:none;" class="input-group-text">)</span>
							</div>
						</div>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><span style="color: #7a4e3c;">user</span>.checkPassword(</span>
							</div>
							<input style="border: none;" type="password" name="userpassword2" />
							<div class="input-group-append">
								<span style="border:none;" class="input-group-text">)</span>
							</div>
						</div>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><span style="color: #7a4e3c;">user</span>.setContact(</span>
							</div>
							<input style="border: none;" type="text" name="usercontact" onkeyup="resize(event)" />
							<div class="input-group-append">
								<span style="border:none;" class="input-group-text">)</span>
							</div>
						</div>
						<div class="text-center mt-3">
							<button type ="button" class="close" data-dismiss="modal" style="display: none;">x</button>
							<button type="button" class="btn btn-light" onclick="insertUser()">insertUser(<span style="color: #7a4e3c;">user</span>);</button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
</div>
<script>
	function resize(event) {
		var value = event.target.value;
		var length = value.length;
		var width = 15 + (length * 10) + "px";
		event.target.setAttribute("style", "border: none; width: " + width + ";");
	}
	
	function checkForms() {
		
		return false;
	}
	
	function insertUser() {
		var isFailed = checkForms();
		if (isFailed) {
			return;
		}
		
		var formData = "userid=" + document.querySelector("input[name=userid]").value
					+ "&username=" + document.querySelector("input[name=username]").value
					+ "&usernickname=" + document.querySelector("input[name=usernickname]").value
					+ "&userpassword1=" + document.querySelector("input[name=userpassword1]").value
					+ "&usercontact=" + document.querySelector("input[name=usercontact]").value;
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function () {
			if (xhr.readyState == 4 && xhr.status == 200) {
				document.querySelector("input[name=loginid]").setAttribute("placeholder", "Welcome, New User");
				document.querySelector("input[name=loginpwd]").setAttribute("placeholder", "Happy To See You");
				document.querySelector(".close").click();
			}
		}
		
		xhr.open("POST", "../account/register.jsp");
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
		
		xhr.send(formData);
		
	}
</script>
</body>
</html>