<%@page import="v1.board.c9.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardNo = Integer.parseInt(request.getParameter("boardno"));
	BoardDao boardDao = new BoardDao();
	boardDao.deleteBoard(boardNo);
	
	response.sendRedirect("list.jsp");
%>