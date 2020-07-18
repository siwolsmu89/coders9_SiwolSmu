<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("loginUserNo") == null) {
		
		response.sendRedirect("../common/home.jsp?error=session");
		return;
	}
%>