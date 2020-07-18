<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("logincheck");
	if (session.getAttribute("loginUserNo") == null) {
		
		response.sendRedirect("../common/home.jsp?error=session");
		return;
	}
%>