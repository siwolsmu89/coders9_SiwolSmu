<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uri = request.getRequestURI();
	String[] splitUri = uri.split("/");
	String directory = splitUri[2];
	
	String colorBasic = "style='color: lightgray;'";
	String colorActive = "style='color: white; font-weight: bold;'";
%>
<div id="header-nav" class="row justify-content-center" onclick="hideHeader()">
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
					<a class="nav-link" <%=directory.equals("account") ? colorActive : colorBasic %> href="/c9board_v1/account/myinfo.jsp">My</a>
				</li>
			</ul>
		</nav>
	</div>
</div>
<div class="row justify-content-center mt-3">
	<div class="col-9">
		<div style="border: 1px solid lightgray;" onmouseover="showHeader()"></div>
	</div>
</div>
<script type="text/javascript">

	function showHeader() {
		document.querySelector(".header #header-nav").style.display="";
	}
	
	function hideHeader() {
		document.querySelector(".header #header-nav").style.display="none";
	}

</script>