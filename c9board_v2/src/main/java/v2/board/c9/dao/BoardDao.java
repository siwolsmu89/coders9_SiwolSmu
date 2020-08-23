package v2.board.c9.dao;

import java.util.List;

import v2.board.c9.vo.Board;

public interface BoardDao {

	void insertBoard(Board board);
	void updateBoard(Board board);
	void deleteBoard(int boardNo);
	Board getBoardByNo(int boardNo);
	List<Board> getAllBoards();
}
