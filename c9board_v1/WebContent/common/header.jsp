<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uri = request.getRequestURI();
	String[] splitUri = uri.split("/");
	String directory = splitUri[2];
	
	String colorBasic = "style='color: lightgray;'";
	String colorActive = "style='color: white; font-weight: bold;'";
%>
<div class="row justify-content-center" onclick="hideHeader()" style="display: none;">
	<div class="col-5 text-center mt-3">
		<nav class="navbar navbar-expand-sm justify-content-center">
			<ul class="navbar-nav" style="justify-content: space-between; width: 70%;">
				<li class="nav-item">
					<a class="nav-link" <%=directory.equals("common") ? colorActive : colorBasic %> href="/c9board_v1/common/home.jsp">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" <%=directory.equals("board") ? colorActive : colorBasic %> href="/c9board_v1/board/list.jsp">Board</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" <%=directory.equals("account") ? colorActive : colorBasic %> href="/c9board_v1/account/myinfo.jsp">Account</a>
				</li>
			</ul>
		</nav>
		
		<small class="text-muted">If you want to close this window, Just Click around here.</small>
	</div>
</div>