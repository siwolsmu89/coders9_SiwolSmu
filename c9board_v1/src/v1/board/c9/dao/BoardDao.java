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
	
	/**
	 * After executing a prepared SQL statement, we need to get data from a ResultSet and set those data into Object BoardDto. 
	 * This work will be repeatedly done from many methods within BoardDao. 
	 * Using this method will help it simpler.
	 * @param ResultSet rs is a Set holding data from Users table.
	 * @return BoardDto board is a new BoardDto Object holding data of a certain row from Boards table and Users table.
	 * @throws SQLException 
	 * @author SiwolSmu
	 */
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
	
	/**
	 * Insert a new row into board table.
	 * 
	 * @param Board board is a Value Object holding all data we need to set the INSERT statement.
	 * @throws SQLException
	 * @author SiwolSmu
	 */
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
	
	/**
	 * Update an information row of a certain board from board table.
	 * 
	 * @param Board board is a Value Object holding all data we need to set the UPDATE statement.
	 * @throws SQLException
	 * @author SiwolSmu
	 */
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
	
	/**
	 * Update an information row of a certain board from board table.
	 * 
	 * @param BoardDto board is a Value Object holding all data we need to set the UPDATE statement.
	 * @throws SQLException
	 * @author SiwolSmu
	 */
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
	
	/**
	 * Set 'board_deleted_yn' column of a certain board as 'Y' from board table.
	 * 
	 * @param boardNo is a Key to find a board which will be deleted.
	 * @throws SQLException
	 * @author SiwolSmu
	 */
	public void deleteBoard(int boardNo) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("board.deleteBoard"));
		pstmt.setInt(1, boardNo);;
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	/**
	 * Count all boards in Search Conditions and Not be deleted, Using Dynamic SQL statement.
	 * 
	 * @param String keyword is a keyword for searching title.
	 * @param String writerType is a keyword for searching writer.
	 * @return int count is a number of all boards in conditions.
	 * @throws SQLException
	 * @author SiwolSmu
	 */
	public int getBoardCount(String keyword, String writerType) throws SQLException {
		int count = 0;
		
		String sql = "SELECT count(1) AS cnt ";
		sql += "FROM v1_boards ";
		sql += "WHERE board_title like '%" + keyword + "%' ";
		sql += "AND board_deleted_yn != 'Y' ";
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
	
	/**
	 * Find a board from board table with 'board_no'.
	 * 
	 * @param int boardNo is a primary key of board table.
	 * @return If there's a board matches with boardNo, BoardDto board. Else, null.
	 * @throws SQLException
	 * @author SiwolSmu
	 */
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
	
	/**
	 * Find all boards with Search Conditions given as a Map, Using Dynamic SQL Statement.
	 * 
	 * @param Map<String, Object> conditionMap contains all Search Conditions. 
	 * It contains keyword, writerType, pageNo, rowsPerPage.
	 * @return ArrayList<BoardDto> boardList holding all informations of board found.
	 * @throws SQLException
	 * @author SiwolSmu
	 */
	public List<BoardDto> getBoardListWithCondition(Map<String, Object> conditionMap) throws SQLException {
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
		if (!("").equals(keyword)) {
			sql += "AND board_title LIKE '%" + keyword + "%' ";
		}
		if (!("").equals(writerType)) {
			sql += "AND B.user_no = " + writerType + " ";
		}
		sql += "ORDER BY B.board_no DESC) boards ";
		sql += "WHERE RN BETWEEN " + begin + " AND " + end + " ";
		sql += "ORDER BY boards.board_no DESC";
		
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
