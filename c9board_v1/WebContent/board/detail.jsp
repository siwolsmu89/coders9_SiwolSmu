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
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/boardtable.css">
<title>Board v1 Detail</title>
</head>
<body>
<%@ include file="../common/loginCheck.jsp" %>
<%
	if (request.getParameter("boardno") == null) {
		response.sendRedirect("list.jsp?err=empty");
		return;
	}
	int boardNo = Integer.parseInt(request.getParameter("boardno"));
	
	int userNo = (int) session.getAttribute("loginUserNo");
	
	BoardDao boardDao = new BoardDao();
	BoardDto board = boardDao.getBoardByNo(boardNo);
	
	if (board == null) {
		response.sendRedirect("list.jsp?error=empty");
		return;
	}
	if (board.isDeleted()) {
		response.sendRedirect("list.jsp?error=deleted");
		return;
	}
%>
<div class="container">
	<div class="header mb-3">
		<!-- 마우스를 맨 위에 대고 있으면 header 보이기 -->
		<%@ include file="../common/header.jsp" %>
	</div>
	
	<div class="body">
		<div class="row">
			<div class="col-12 text-center mb-5">
				<h1>Board v1 Detail</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<table class="table boards">
					<colgroup>
						<col width=20%>
						<col width=*>
						<col width=20%>
						<col width=20%>
					</colgroup>
					<tr>
						<th>Writer</th>
						<td><%=board.getUserNickname() %></td>
						<th>RegDate</th>
						<td><%=board.getCreatedDate() %></td>
					</tr>
					<tr>
						<th>Title</th>
						<td colspan="3"><%=board.getTitle() %></td>
					</tr>
					<tr>
						<th colspan="4">Content</th>
					</tr>
					<tr style="border-bottom: 1px solid lightgray;">
						<td colspan="4" style="height: 150px; padding: 24px;"><%=board.getContent() %></td>
					</tr>
					<tr>
						<td colspan="3">
							<a href="list.jsp" class="badge badge-secondary">To List</a> 
						</td>
						<td colspan="1" class="text-right">
					<%
						if (board.getUserNo() == userNo) {
					%>
							<a href="modForm.jsp?boardno=<%=board.getNo() %>" class="badge badge-secondary">Mod</a> 
							<a href="delboard.jsp?boardno=<%=board.getNo() %>" class="badge badge-danger">Del</a>
					<%
						}
					%>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<div class="footer" onclick="hideFooter()">
		<!-- 마우스를 맨 아래에 대고 있으면 footer 보이기 -->
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
</body>
</html>