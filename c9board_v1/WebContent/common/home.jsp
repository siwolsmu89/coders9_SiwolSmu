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
	
	.container .body {
	  max-width: 800px;
	  margin: auto;
	  margin-top: 100px;
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
				%>
					<p style="color: red;">Login Failed : Check your ID/Password and Try again.</p>
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
	
	<!-- 모달창 -->
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
							<input style="border: none;" type="text" name="userid" onkeyup="resize(event)" onchange="checkId()" />
							<div class="input-group-append">
								<span style="border:none;" class="input-group-text">)</span>
							</div>
						</div>
						<div id="input-userid-error" style="display:none;">
							<small style="color: red;">ID must be written with alphabet, holding at least 2 letters.</small>
							<br/>
							<small style="color: red;">It can hold numbers, but not in first letter.</small>
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
							<input style="border: none;" type="password" name="userpassword1" onchange="checkPwd1()"/>
							<div class="input-group-append">
								<span style="border:none;" class="input-group-text">)</span>
							</div>
						</div>
						<div id="input-pwd-error" style="display:none;">
							<small style="color: red;">Password must contain 1 alphabet, 1 number, 1 symbol each.</small>
						</div>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><span style="color: #7a4e3c;">user</span>.checkPassword(</span>
							</div>
							<input style="border: none;" type="password" name="userpassword2" onchange="checkPwd2()" />
							<div class="input-group-append">
								<span style="border:none;" class="input-group-text">)</span>
							</div>
						</div>
						<div id="input-pwd2-error" style="display:none;">
							<small style="color: red;">user.getPassword.equals(input) == false;</small>
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
						<div id="modal-error-box" style="display: none; color: red;">
							<a href="#" style="text-decoration: underline;">coders9.UserIdDuplicatedException</a> 
							<p class="text-right">at RegisterForm(Same ID already exists)</p>
							<p class="text-right">at RegisterForm.user.setId(<a href="#" style="text-decoration: underline;">this.window:1</a>)</p>
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
	
	function checkId() {
		var idRegExp = /^[a-zA-Z]([a-zA-Z0-9])/;
		var id = document.querySelector("input[name=userid]").value;
		
		if (!idRegExp.exec(id)) {
			document.querySelector("#input-userid-error").style.display="";
			document.querySelector("input[name=userid]").focus();
			document.querySelector("input[name=userid]").value = "";
			return;
		} else {
			document.querySelector("#input-userid-error").style.display="none";
		}
	}
	
	function checkPwd1() {
		var pwdRegExp = /(?=.*\d)(?=.*[a-zA-Z])(?=.*\W)/;
		var pwd = document.querySelector("input[name=userpassword1]").value;
		
		if (!pwdRegExp.exec(pwd)) {
			document.querySelector("#input-pwd-error").style.display = "";
			document.querySelector("input[name=userpassword1]").focus();
			document.querySelector("input[name=userpassword1]").value = "";
			return;
		} else {
			document.querySelector("#input-pwd-error").style.display = "none";
		}
	}
	
	function checkPwd2() {
		var pwd1 = document.querySelector("input[name=userpassword1]").value;
		var pwd2 = document.querySelector("input[name=userpassword2]").value;
		
		if (pwd1 != pwd2) {
			document.querySelector("input[name=userpassword1]").value = "";
			document.querySelector("input[name=userpassword2]").value = "";
			document.querySelector("input[name=userpassword1]").focus();
			document.querySelector("#input-pwd2-error").style.display = "";
			return true;
		} else {
			document.querySelector("#input-pwd2-error").style.display = "none";
		}
	}
	
	function checkForms() {
		var id = document.querySelector("input[name=userid]").value;
		if (!id) {
			document.querySelector("input[name=userid]").focus();
			return true;
		}
		
		var name = document.querySelector("input[name=username]").value;
		if (!name) {
			document.querySelector("input[name=username]").focus();
			return true;
		}
		
		var nickname = document.querySelector("input[name=usernickname]").value;
		if (!nickname) {
			document.querySelector("input[name=usernickname]").focus();
			return true;
		}
		
		var pwd1 = document.querySelector("input[name=userpassword1]").value;
		if (!pwd1) {
			document.querySelector("input[name=userpassword1]").focus();
			return true;
		}
		
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
					+ "&userpassword=" + document.querySelector("input[name=userpassword1]").value
					+ "&usercontact=" + document.querySelector("input[name=usercontact]").value;
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function () {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = xhr.responseText;
				result = result.replace(/\n/g, "").trim();
				console.log(result);
				if (result == "success") {
					document.querySelector("#modal-error-box").style.display="none";
					document.querySelector("input[name=loginid]").setAttribute("placeholder", "Welcome, New User");
					document.querySelector("input[name=loginpwd]").setAttribute("placeholder", "Happy To See You");
					document.querySelector(".close").click();
				} else {
					document.querySelector("#modal-error-box").style.display="";					
				}
			}
		}
		
		xhr.open("POST", "../account/register.jsp");
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
		
		xhr.send(formData);
	}
</script>
</body>
</html>