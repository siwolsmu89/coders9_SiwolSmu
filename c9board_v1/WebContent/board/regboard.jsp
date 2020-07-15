<%@page import="v1.board.c9.vo.Board"%>
<%@page import="v1.board.c9.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int userNo = Integer.parseInt(request.getParameter("userno"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	if (session.getAttribute("loginUserNo") == null) {
		session.setAttribute("loginUserNo", userNo);
	}
	
	BoardDao boardDao = new BoardDao();
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	board.setUserNo(userNo);
	
	boardDao.insertBoard(board);
	response.sendRedirect("list.jsp");
%>