package v2.board.c9.service;

import java.util.List;

import v2.board.c9.vo.Board;

public interface BoardService {

	void addNewBoard();
	void updateBoard();
	List<Board> getBoardList();
}
