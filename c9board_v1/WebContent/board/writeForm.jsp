<%@page import="v1.board.c9.dto.BoardDto"%>
<%@page import="v1.board.c9.vo.Board"%>
<%@page import="v1.board.c9.dao.BoardDao"%>
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
<title>Insert title here</title>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Indie+Flower&family=Patrick+Hand&display=swap');

	body {
		font-family: 'Patrick Hand';
		background-color: black;
		color: white;
	}
	.container .body {
		max-width: 800px;
		margin: auto;
		margin-top: 50px;
	}
	
	.table {
		color: lightgray;
	}
	.table th {
		text-align: center;
	}
	
	input[name=title] {
		padding: 2px 15px;
	}
	
	textarea {
		padding: 3px 15px;
	}
</style>
</head>
<body>
<%
	if (session.getAttribute("loginUserNo") == null) {
		response.sendRedirect("../common/home.jsp?err=session");
		return;
	}

	int userNo = (int) session.getAttribute("loginUserNo");
%>
<div class="container">
	<div class="header mb-3">
		<!-- 마우스를 맨 위에 대고 있으면 header 보이기 -->
		<%@ include file="../common/header.jsp" %>
	</div>
	
	<div class="row justify-content-center">
		<div class="col-9">
			<div style="border: 1px solid lightgray;" onmouseover="showHeader()"></div>
		</div>
	</div>
	
	<div class="body">
		<div class="row">
			<div class="col-12 text-center mb-5">
				<h1>Board v1 Write</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<form id="form-board-write" method="POST" action="regboard.jsp">
					<input type="hidden" name="userno" value="<%=userNo %>" />
					<table class="table">
						<colgroup>
							<col width=20%>
							<col width=*>
						</colgroup>
						<tr>
							<th>Title</th>
							<td><input style="width: 100%;" type="text" name="title" placeholder="Type Your Title Here" /></td>
						</tr>
						<tr>
							<th colspan="2">Content</th>
						</tr>
						<tr style="border-bottom: 1px solid lightgray;">
							<td colspan="2" style="height: 150px;">
								<textarea style="height:145px; width: 100%;" name="content" placeholder="Type Your Content Here"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-right">
								<button type="reset" class="btn btn-sm btn-dark">Reset</button>
								<button type="button" onclick="checkForm()" class="btn btn-sm btn-danger">Submit</button> 
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<div class="row justify-content-center mt-5">
		<div class="col-9">
			<div style="border: 1px solid lightgray;" onmouseover="showFooter()"></div>
		</div>
	</div>
	<div class="footer" onclick="hideFooter()">
		<!-- 마우스를 맨 아래에 대고 있으면 footer 보이기 -->
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
<script type="text/javascript">

	function checkForm() {
		var titleForm = document.querySelector("input[name=title]");
		if (!titleForm.value) {
			titleForm.placeholder = "We need a Title";
			titleForm.focus();
			return;
		}
		
		var contentForm = document.querySelector("textarea[name=content]");
		if (!contentForm.value) {
			contentForm.placeholder = "We need a Content";
			contentForm.focus();
			return;
		}
		
		document.querySelector("#form-board-write").submit();
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