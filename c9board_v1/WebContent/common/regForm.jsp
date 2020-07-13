<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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