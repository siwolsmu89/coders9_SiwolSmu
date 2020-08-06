package v2.board.c9.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import v2.board.c9.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	private String container = "/common/commonContainer";
	
	private BoardService boardService;
	
	@ModelAttribute("headerPage")
	public String setHeaderPage() {
		return "../board/header.jsp";
	}
	
	@RequestMapping("/list.do")
	public String list(Model model) {
		model.addAttribute("contentPage", "../board/list.jsp");
		return container;
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam("no") int boardNo) {
		
		
		return "container";
	}
}
