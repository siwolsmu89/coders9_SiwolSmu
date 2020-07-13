<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
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