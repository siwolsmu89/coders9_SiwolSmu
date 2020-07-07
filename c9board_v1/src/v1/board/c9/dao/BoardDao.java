package v1.board.c9.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	
	public List<Board> getBoardListWithCondition(int userNo, Map<String, Object> conditionMap, int begin, int end) {
		List<Board> boardList = new ArrayList<Board>();
		
		return boardList;
	}
}
