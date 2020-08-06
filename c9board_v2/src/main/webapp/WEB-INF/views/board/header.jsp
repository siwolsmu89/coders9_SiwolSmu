<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="header-nav" class="row justify-content-center" onclick="hideHeader()">
	<div class="col-5 text-center mt-3">
		<nav class="navbar navbar-expand-sm justify-content-center">
			<ul class="navbar-nav" style="justify-content: space-between; width: 70%;">
				<li class="nav-item">
					<a class="nav-link" href="/c9/home.do">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" style="color: white;" href="/c9/board/list.do">Board</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/c9/account/myinfo.do">My</a>
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