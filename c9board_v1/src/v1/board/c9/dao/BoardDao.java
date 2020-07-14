package v1.board.c9.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import v1.board.c9.utils.ConnectionUtil;
import v1.board.c9.utils.QueryUtil;
import v1.board.c9.vo.Board;

public class BoardDao {
	
	private Board resultSetToBoard(ResultSet rs) {
		Board board = new Board();
		
		return board;
	}
	
	public void insertBoard(Board board) {
		
	}
	
	public void updateBoard(Board board) {
		
	}
	
	public void deleteBoard(int boardNo) {
		
	}
	
	public Board getBoardByNo(int boardNo) {
		Board board = null;
		
		return board;
	}
	
	public List<Board> getBoardListByRange(int begin, int end) {
		List<Board> boardList = new ArrayList<Board>();
		
		return boardList;
	}
	
	public List<Board> getBoardListWithCondition(int userNo, Map<String, Object> conditionMap) throws SQLException {
		List<Board> boardList = new ArrayList<Board>();
		
		String keyword = (String) conditionMap.get("keyword");
		String writerType = (String) conditionMap.get("writerType");
		int pageNo = (int) conditionMap.get("pageNo");
		int rowsPerPage = (int) conditionMap.get("rowsPerPage");
		
		int begin = rowsPerPage * (pageNo-1) + 1;
		int end = rowsPerPage * pageNo;
		
		String sql = "SELECT boards.RN, boards.board_no, boards.board_title, boards.board_content, boards.board_created_date, boards.board_deleted_yn, boards.user_no, boards.user_nickname ";
		sql += "FROM (SELECT ROW_NUMBER() OVER(ORDER BY B.board_no) AS RN, B.board_no, B.board_title, B.board_content, B.board_created_date, B.board_deleted_yn, B.user_no, U.user_nickname ";
		sql += "FROM v1_boards B, v1_users U ";
		sql += "WHERE B.user_no = U.user_no ";
		sql += "ORDER BY B.board_no) boards ";
		sql += "WHERE RN BETWEEN " + begin + " AND " + end + " ";
		if (!("").equals(keyword)) {
			sql += "AND board_title LIKE '%" + keyword + "%' ";
		}
		if (!("").equals(writerType)) {
			sql += "AND user_no = " + (String) conditionMap.get("loginUserNo") + " ";
		}
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Board board = resultSetToBoard(rs);
			boardList.add(board);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return boardList;
	}
}
