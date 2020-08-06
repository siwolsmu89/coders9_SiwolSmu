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
<link rel="stylesheet" href="../resources/css/boardtable.css">
<title>Board v1 Board Modify Board</title>
</head>
<body>
<div class="container">
	<div class="header mb-3">
		<%@ include file="../common/header.jsp" %>
	</div>
	
	<div class="body">
		<div class="row">
			<div class="col-12 text-center mb-5">
				<h1>Board v1 Modify</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">
				<form id="form-board-write" method="POST" action="modboard.jsp">
					<input type="hidden" name="boardno" value="" />
					<table class="table boards">
						<colgroup>
							<col width=20%>
							<col width=*>
						</colgroup>
						<tr>
							<th>Title</th>
							<td><input style="width: 100%;" type="text" name="title" value="" /></td>
						</tr>
						<tr>
							<th colspan="2">Content</th>
						</tr>
						<tr style="border-bottom: 1px solid lightgray;">
							<td colspan="2" style="height: 150px;">
								<textarea style="height:145px; width: 100%;" name="content"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-right">
								<a href="detail.jsp?boardno=" type="button" class="btn btn-sm btn-dark">Cancel</a>
								<button type="button" onclick="checkBoardForm()" class="btn btn-sm btn-danger">Submit</button> 
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
<script src="../resources/script/functions.js"></script>
</body>
</html>