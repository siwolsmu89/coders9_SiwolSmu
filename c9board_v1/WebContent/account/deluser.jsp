<%@page import="v1.board.c9.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int userNo = (int) session.getAttribute("loginUserNo");

	UserDao userDao = new UserDao();
	userDao.deleteUser(userNo);
	
	session.invalidate();
	response.sendRedirect("../common/home.jsp");
%>