<%@page import="v1.board.c9.vo.User"%>
<%@page import="v1.board.c9.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("userid");
	String name = request.getParameter("username");
	String nickname = request.getParameter("usernickname");
	String password = request.getParameter("userpassword");
	String contact = request.getParameter("usercontact");
	
	UserDao ud = new UserDao();
	User savedUser = ud.getUserById(id);
	
	if (savedUser != null) {
		String error = "duplicated";
		out.write(error);
		return;
	}
	
	User user = new User();
	user.setId(id);
	user.setName(name);
	user.setNickname(nickname);
	user.setPassword(password);
	user.setContact(contact);
	
	ud.insertUser(user);
	String msg = "success";
	out.write(msg);
%>