function showHeader() {
	document.querySelector(".header #header-nav").style.display="";
}
function hideHeader() {
	document.querySelector(".header #header-nav").style.display="none";
}

function showFooter() {
	document.querySelector(".footer #footer-info").style.display="";
}
function hideFooter() {
	document.querySelector(".footer #footer-info").style.display="none";
}

function resizeInputWidth(event) {
	var value = event.target.value;
	var length = value.length;
	var width = 15 + (length * 6) + "px";
	event.target.setAttribute("style", "border: none; width: " + width + ";");
}
function checkId() {
	var idRegExp = /^[a-zA-Z]([a-zA-Z0-9])/;
	var id = document.querySelector("#register-form input[name=userid]").value;
	
	if (!idRegExp.exec(id)) {
		document.querySelector("#input-userid-error").style.display="";
		document.querySelector("#register-form input[name=userid]").focus();
		document.querySelector("#register-form input[name=userid]").value = "";
		return;
	} else {
		document.querySelector("#input-userid-error").style.display="none";
	}
}
function checkPwd1() {
	var pwdRegExp = /(?=.*\d)(?=.*[a-zA-Z])(?=.*\W)/;
	var pwd = document.querySelector("#register-form input[name=userpassword1]").value;
	
	if (!pwdRegExp.exec(pwd)) {
		document.querySelector("#input-pwd-error").style.display = "";
		document.querySelector("#register-form input[name=userpassword1]").focus();
		document.querySelector("#register-form input[name=userpassword1]").value = "";
		return;
	} else {
		document.querySelector("#input-pwd-error").style.display = "none";
	}
}
function checkPwd2() {
	var pwd1 = document.querySelector("#register-form input[name=userpassword1]").value;
	var pwd2 = document.querySelector("#register-form input[name=userpassword2]").value;
	
	if (pwd1 != pwd2) {
		document.querySelector("#register-form input[name=userpassword1]").value = "";
		document.querySelector("#register-form input[name=userpassword2]").value = "";
		document.querySelector("#register-form input[name=userpassword1]").focus();
		document.querySelector("#input-pwd2-error").style.display = "";
		return true;
	} else {
		document.querySelector("#input-pwd2-error").style.display = "none";
	}
}
function checkUserRegForm() {
	var id = document.querySelector("#register-form input[name=userid]").value;
	if (!id) {
		document.querySelector("#register-form input[name=userid]").focus();
		return true;
	}
	
	var name = document.querySelector("#register-form input[name=username]").value;
	if (!name) {
		document.querySelector("#register-form input[name=username]").focus();
		return true;
	}
	
	var nickname = document.querySelector("#register-form input[name=usernickname]").value;
	if (!nickname) {
		document.querySelector("#register-form input[name=usernickname]").focus();
		return true;
	}
	
	var pwd1 = document.querySelector("#register-form input[name=userpassword1]").value;
	if (!pwd1) {
		document.querySelector("#register-form input[name=userpassword1]").focus();
		return true;
	}
	
	return false;
}
function insertUser() {
	var isFailed = checkUserRegForm();
	if (isFailed) {
		return;
	}
	
	var formData = "userid=" + document.querySelector("#register-form input[name=userid]").value
				+ "&username=" + document.querySelector("#register-form input[name=username]").value
				+ "&usernickname=" + document.querySelector("#register-form input[name=usernickname]").value
				+ "&userpassword=" + document.querySelector("#register-form input[name=userpassword1]").value
				+ "&usercontact=" + document.querySelector("#register-form input[name=usercontact]").value;
	
	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = xhr.responseText;
			result = result.replace(/\n/g, "").trim();
			console.log(result);
			if (result == "success") {
				document.querySelector("#modal-error-box").style.display="none";
				document.querySelector("#login-form input[name=loginid]").setAttribute("placeholder", "Welcome, New User");
				document.querySelector("#login-form input[name=loginpwd]").setAttribute("placeholder", "Happy To See You");
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

function checkPwdToggle(event) {
	if (event.target.checked) {
		document.querySelector("#form-modify-info input[name=password2]").disabled = false;
	} else {
		document.querySelector("#form-modify-info input[name=password2]").disabled = true;
	}
}
function checkUserModForm() {
	var nicknameEl = document.querySelector("#form-modify-info input[name=nickname]");
	var contactEl = document.querySelector("#form-modify-info input[name=contact]");
	var password1El = document.querySelector("#form-modify-info input[name=password]");
	var password2El = document.querySelector("#form-modify-info input[name=password2]");
	var newPwdCheckEl = document.querySelector("#form-modify-info input[name=newpwdcheck]");
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
		
		if (nicknameEl.value == document.querySelector("#form-modify-info input[name=oldnick]").value 
				&& contactEl.value == document.querySelector("#form-modify-info input[name=oldcontact]").value
				&& password1El.value == document.querySelector("#form-modify-info input[name=oldpwd]").value) {
			
			document.querySelector("#p-no-change").style.display = "";
			return;
		}
	} else {
		if (password1El.value != document.querySelector("#form-modify-info input[name=oldpwd]").value) {
			password1El.value = "";
			password1El.placeholder = "Wrong Pwd";
			return;
		}
		if (nicknameEl.value == document.querySelector("#form-modify-info input[name=oldnick]").value 
				&& contactEl.value == document.querySelector("#form-modify-info input[name=oldcontact]").value) {
			
			document.querySelector("#p-no-change").style.display = "";
			return;
		}
	}
	
	document.querySelector("#form-modify-info").submit();
}
function delUser() {
	if (confirm("If You quit, You can't use any of our services. Are you sure?")) {
		
		location.href="deluser.jsp";
	}
}

function checkBoardForm() {
	var titleForm = document.querySelector("#form-board-write input[name=title]");
	if (!titleForm.value) {
		titleForm.placeholder = "We need a Title";
		titleForm.focus();
		return;
	}
	
	var contentForm = document.querySelector("#form-board-write textarea[name=content]");
	if (!contentForm.value) {
		contentForm.placeholder = "We need a Content";
		contentForm.focus();
		return;
	}
	
	document.querySelector("#form-board-write").submit();
}

function movePage(event, pageNo) {
	event.preventDefault();
	submitConditionForm(pageNo);
}
function submitConditionForm(pageNo) {
	document.querySelector("#form-list-condition input[name=pageno]").value = pageNo;
	document.querySelector("#form-list-condition").submit();
}