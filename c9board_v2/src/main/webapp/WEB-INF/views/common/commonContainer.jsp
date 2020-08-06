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
<title>Board v1 Home</title>
</head>
<body>
<div class="container">
	<div class="header mb-3">
		<jsp:include page="${headerPage }" />
	</div>
	
	<div class="body">
		<jsp:include page="${contentPage }" />
	</div>
	
	<div class="footer">
		<%@ include file="footer.jsp" %>
	</div>

	<%@ include file="../account/regForm.jsp" %>
</div>
<script src="/c9/resources/script/functions.js"></script>
</body>
</html>