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
	
	<div class="row justify-content-center">
		<div class="col-5">
			<div style="border: 1px solid lightgray;" onmouseover="showHeader()"></div>
		</div>
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
	
	<%@ include file="regForm.jsp" %>
	
	<div class="row justify-content-center mt-5">
		<div class="col-5">
			<div style="border: 1px solid lightgray;" onmouseover="showFooter()"></div>
		</div>
	</div>
	<div class="footer" onclick="hideFooter()">
		<!-- 마우스를 맨 아래에 대고 있으면 footer 보이기 -->
		<%@ include file="footer.jsp" %>
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
	
	function showFooter() {
		document.querySelector(".footer div").style.display="";
	}
	
	function hideFooter() {
		document.querySelector(".footer div").style.display="none";
	}
	
	function showHeader() {
		document.querySelector(".header div").style.display="";
	}
	
	function hideHeader() {
		document.querySelector(".header div").style.display="none";
	}
	
</script>
</body>
</html>