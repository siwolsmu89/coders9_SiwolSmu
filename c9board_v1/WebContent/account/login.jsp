<%@page import="v1.board.c9.vo.User"%>
<%@page import="v1.board.c9.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("loginid");
	String password = request.getParameter("loginpwd");
	
	UserDao ud = new UserDao();
	User user = ud.getUserById(id);
	
	if (user == null) {
		response.sendRedirect("../common/home.jsp?error=loginfail");
		return;
	}	
	
	if (!password.equals(user.getPassword())) {
		response.sendRedirect("../common/home.jsp?error=loginfail");
		return;
	}

	session.setAttribute("loginUserNo", user.getNo());
	session.setAttribute("loginUserNickname", user.getNickname());
	response.sendRedirect("../board/list.jsp");
	
%>