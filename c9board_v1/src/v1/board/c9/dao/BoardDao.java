package v1.board.c9.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import v1.board.c9.dto.BoardDto;
import v1.board.c9.utils.ConnectionUtil;
import v1.board.c9.utils.QueryUtil;
import v1.board.c9.vo.Board;

public class BoardDao {
	
	private Board resultSetToBoard(ResultSet rs) {
		Board board = new Board();
		
		return board;
	}

	private BoardDto resultSetToBoardDto(ResultSet rs) throws SQLException {
		BoardDto board = new BoardDto();
		
		board.setNo(rs.getInt("board_no"));
		board.setTitle(rs.getString("board_title"));
		board.setContent(rs.getString("board_content"));
		board.setCreatedDate(rs.getDate("board_created_date"));
		board.setDeleted("Y".equals(rs.getString("board_deleted_yn")) ? true : false);
		board.setUserNo(rs.getInt("user_no"));
		board.setUserNickname(rs.getString("user_nickname"));
		
		return board;
	}
	
	public void insertBoard(Board board) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("board.insertBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getContent());
		pstmt.setInt(3, board.getUserNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void updateBoard(Board board) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("board.updateBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getContent());
		pstmt.setInt(3, board.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void updateBoard(BoardDto board) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("board.updateBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getContent());
		pstmt.setInt(3, board.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void deleteBoard(int boardNo) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("board.deleteBoard"));
		pstmt.setInt(1, boardNo);;
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public int getBoardCount(String keyword, String writerType) throws SQLException {
		int count = 0;
		
		String sql = "SELECT count(1) AS cnt ";
		sql += "FROM v1_boards ";
		sql += "WHERE board_title like '%" + keyword + "%' ";
		if (!"".equals(writerType)) {
			sql += "AND user_no = " + writerType;
		}
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			count = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return count;
	}
	
	public BoardDto getBoardByNo(int boardNo) throws SQLException {
		BoardDto board = null;
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("board.getBoardByNo"));
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			board = resultSetToBoardDto(rs);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return board;
	}
	
	public List<BoardDto> getBoardListWithCondition(int userNo, Map<String, Object> conditionMap) throws SQLException {
		List<BoardDto> boardList = new ArrayList<BoardDto>();
		
		String keyword = (String) conditionMap.get("keyword");
		String writerType = (String) conditionMap.get("writerType");
		int pageNo = (int) conditionMap.get("pageNo");
		int rowsPerPage = (int) conditionMap.get("rowsPerPage");
		
		int begin = rowsPerPage * (pageNo-1) + 1;
		int end = rowsPerPage * pageNo;
		
		String sql = "SELECT boards.RN, boards.board_no, boards.board_title, boards.board_content, boards.board_created_date, boards.board_deleted_yn, boards.user_no, boards.user_nickname ";
		sql += "FROM (SELECT ROW_NUMBER() OVER(ORDER BY B.board_no DESC) AS RN, B.board_no, B.board_title, B.board_content, B.board_created_date, B.board_deleted_yn, B.user_no, U.user_nickname ";
		sql += "FROM v1_boards B, v1_users U ";
		sql += "WHERE B.user_no = U.user_no ";
		sql += "AND B.board_deleted_yn != 'Y' ";
		sql += "ORDER BY B.board_no DESC) boards ";
		sql += "WHERE RN BETWEEN " + begin + " AND " + end + " ";
		if (!("").equals(keyword)) {
			sql += "AND board_title LIKE '%" + keyword + "%' ";
		}
		if (!("").equals(writerType)) {
			sql += "AND user_no = " + writerType + " ";
		}
		sql += "ORDER BY boards.RN DESC";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			BoardDto board = resultSetToBoardDto(rs);
			boardList.add(board);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return boardList;
	}
}
