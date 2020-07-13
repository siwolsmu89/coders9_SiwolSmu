<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row justify-content-center" style="display: none;">
	<div class="col-5 text-center mt-3">
		<small class="text-muted">If you want to close this window, Just Click around here.</small>
		
		<% 
			if (session.getAttribute("loginUserNo") != null) {
		%>
		<hr/>
		
		<div>
			<h6>Update or Delete Your Info</h6>
			<button class="badge badge-secondary">Mod</button>
			<button class="badge badge-secondary">Del</button>
		</div>
		<%
			}
		%>
		<hr/>
		
		<div class="text-muted" style="padding: 0;">
			<h6 style=" margin-bottom: 0;">board_v1 Info</h6>
			<small>Working Period : 2020/07/06 ~ </small>
		</div>
	</div>
</div>