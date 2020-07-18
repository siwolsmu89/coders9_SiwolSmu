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
<title>Boards v1 Modify User</title>
<style>
	.table {
		color: lightgray;
		border-bottom: 1px solid lightgray;
	}
</style>
</head>
<body>
<%@ include file="../common/loginCheck.jsp" %>
<div class="container">
	<div class="header mb-3">
		<!-- 마우스를 맨 위에 대고 있으면 header 보이기 -->
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
				<form id="form-modify-info" action="modify.jsp" method="POST">
					<table class="table">
						<tr>
							<th>ID</th>
							<td><%=user.getId() %></td>
							<th>RegDate</th>
							<td><%=user.getRegisteredDate() %></td>
						</tr>
						<tr>
							<th>Password</th>
							<td>
								<input type="checkbox" name="newpwdcheck" onchange="checkPwdToggle(event)"> New 
								<input style="width: 66%" type="password" name="password" />
							</td>
							<th>CheckPassword</th>
							<td>
								<input type="password" name="password2" disabled />
								<input type="hidden" name="oldpwd" value="<%=user.getPassword() %>" />
							</td>
						</tr>
						<tr>
							<th>Name</th>
							<td><%=user.getName() %></td>
							<th>Nickname</th>
							<td>
								<input type="text" name="nickname" value="<%=user.getNickname() %>" />
								<input type="hidden" name="oldnick" value="<%=user.getNickname() %>" />
							</td>
						</tr>
						<tr>
							<th>Contact</th>
							<td>
								<input type="text" name="contact" value="<%=user.getContact() %>" />
								<input type="hidden" name="oldcontact" value="<%=user.getContact() %>" />
							</td>
							<th>Update</th>
							<td>
								<a href="myinfo.jsp"><button type="button" class="btn btn-sm btn-secondary">Cancel</button></a>
								<button type="button" onclick="checkForm()" class="btn btn-sm btn-danger">Submit</button>
							</td>
						</tr>
					</table>
				</form>
				<p id="p-no-change" style="color:red; display:none;">Nothing Changed, No need To modify Your Information.</p>
			</div>
		</div>
	</div>
	
	<div class="footer" onclick="hideFooter()">
		<!-- 마우스를 맨 아래에 대고 있으면 footer 보이기 -->
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
<script type="text/javascript">
	function checkPwdToggle(event) {
		if (event.target.checked) {
			document.querySelector("input[name=password2]").disabled = false;
		} else {
			document.querySelector("input[name=password2]").disabled = true;
		}
	}
	
	function checkForm() {
		var nicknameEl = document.querySelector("input[name=nickname]");
		var contactEl = document.querySelector("input[name=contact]");
		var password1El = document.querySelector("input[name=password]");
		var password2El = document.querySelector("input[name=password2]");
		var newPwdCheckEl = document.querySelector("input[name=newpwdcheck]");
		var pwdRegExp = /(?=.*\d)(?=.*[a-zA-Z])(?=.*\W)/;
		
		if (!nicknameEl.value) {
			nicknameEl.placeholder = "Input new Nickname Here";
			nicknameEl.focus();
			return;
		}
		
		if (!password1El.value) {
			password1El.placeholder = "Pwd Here";
			password1El.focus();
			return;
		}
		
		if (newPwdCheckEl.checked) {
			if (password1El.value != password2El.value) {
				password1El.value = "";
				password2El.value = "";
				password1El.placeholder = "New Pwd";
				password2El.placeholder = "Not Equals";
				return;
			}

			if (!pwdRegExp.exec(password1El.value)) {
				password1El.value ="";
				password2El.value ="";
				password1El.placeholder ="Simple Pwd";
				password2El.placeholder ="No Simple Pwd Allowed";
				
				password1El.focus();
				return;
			}
			
			if (nicknameEl.value == document.querySelector("input[name=oldnick]").value 
					&& contactEl.value == document.querySelector("input[name=oldcontact]").value
					&& password1El.value == document.querySelector("input[name=oldpwd]").value) {
				
				document.querySelector("#p-no-change").style.display = "";
				return;
			}
		} else {
			if (password1El.value != document.querySelector("input[name=oldpwd]").value) {
				password1El.value = "";
				password1El.placeholder = "Wrong Pwd";
				return;
			}
			if (nicknameEl.value == document.querySelector("input[name=oldnick]").value 
					&& contactEl.value == document.querySelector("input[name=oldcontact]").value) {
				
				document.querySelector("#p-no-change").style.display = "";
				return;
			}
		}
		
		document.querySelector("#form-modify-info").submit();
		
	}
</script>
</body>
</html>