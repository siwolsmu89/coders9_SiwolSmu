<%@page import="v1.board.c9.vo.User"%>
<%@page import="v1.board.c9.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int userNo = (int) session.getAttribute("loginUserNo");
	
	UserDao userDao = new UserDao();
	User user = userDao.getUserByNo(userNo);
	
	String nickname = request.getParameter("nickname");
	String contact = request.getParameter("contact");
	String password = request.getParameter("password");
	
	user.setNickname(nickname);
	user.setContact(contact);
	user.setPassword(password);
	
	userDao.updateUser(user);
	response.sendRedirect("myinfo.jsp");
%>