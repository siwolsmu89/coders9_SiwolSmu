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
<link rel="stylesheet" href="/c9/resources/css/common.css">
<link rel="stylesheet" href="/c9/resources/css/regform.css">
<title>Board v1 About</title>
</head>
<body>
<div class="container">
	<div class="header mb-3">
		<%@ include file="header.jsp" %>
	</div>
	
	<div class="body">
		<div class="row text-center">
			<div class="col-12">
				<h1>About Board v2</h1>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="col-5 mt-3 pt-2" style="border: 1px solid lightgray;">
				<p>Created By : SiwolSmu(Min'Seok Kwon) Of Coders 9</p>
				<p>Main Concept : Reviewing Spring MVC & jQuery</p>
				<p>Working Period : 2020/08/05 ~ Working</p>
				<p>GitHub Link : 
					<a style="text-decoration: underline;" target="_blank" href="https://github.com/siwolsmu89/coders9_workspace/tree/master/c9board_v1">Click</a>
				</p>
				
				<br/>
				
				<p>Back-end Skills Used : Java 1.8 with Spring MVC, Maria DB</p>
				<p>Front-end Skills Used : JSP, HTML, CSS, Bootstrap 4, Javascript, jQuery</p>
				<p>Tools Used : eGovFrameDev-3.9.0, QueryBox</p>
				<p>Font Used : <a target="_blank" href="https://fonts.google.com/specimen/Patrick+Hand">"Patrick Hand"</a> From Google Fonts</p>
			</div>
		</div>
	</div>
	
	<div class="footer">
		<%@ include file="footer.jsp" %>
	</div>
</div>
<script src="/c9/resources/script/functions.js"></script>
</body>
</html>