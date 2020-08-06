<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row text-center">
	<div class="col-12">
		<h1>Welcome To Board v2</h1>
		<p id="p-error-msg" class="text-muted">MinSeok Kwon</p>
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
