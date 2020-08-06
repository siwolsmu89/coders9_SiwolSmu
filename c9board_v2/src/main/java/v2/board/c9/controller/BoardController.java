package v2.board.c9.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import v2.board.c9.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	private BoardService boardService;
	
	@RequestMapping("/list.do")
	public String list() {
		
		return "board/list";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam("no") int boardNo) {
		
		
		return "board/detail";
	}
}
