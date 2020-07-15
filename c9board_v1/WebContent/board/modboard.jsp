<%@page import="v1.board.c9.dto.BoardDto"%>
<%@page import="v1.board.c9.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int boardNo = Integer.parseInt(request.getParameter("boardno"));
	
	BoardDao boardDao = new BoardDao();
	BoardDto board = boardDao.getBoardByNo(boardNo);
	board.setTitle(title);
	board.setContent(content);
	boardDao.updateBoard(board);

	response.sendRedirect("detail.jsp?boardno=" + boardNo);
%>