package v2.board.c9.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import v2.board.c9.service.BoardService;
import v2.board.c9.vo.User;

@Controller
@RequestMapping("/board")
public class BoardController {

	private String container = "/common/commonContainer";
	
	private BoardService boardService;

	@RequestMapping("/list.do")
	public String list(Model model, HttpServletRequest req) {
		model.addAttribute("contentPage", "../board/list.jsp");
		
		
		/* 이럴거없이 그냥 마이바티스 쓰면 되었던것같다. 오랜만에 하니까 다까먹었네
			HttpSession sess = req.getSession();
			User user = (User) sess.getAttribute("loginedUser");

			int pageNo = req.getParameter("pageno") == null ? 1 : Integer.parseInt(req.getParameter("pageno"));
			int rowCount = req.getParameter("rowcount") == null ? 10 : Integer.parseInt(req.getParameter("rowcount"));
			String writerId = req.getParameter("writertype");
			writerId = "My".equals(writerId) ? user.getId() : "";
			String keyword = req.getParameter("keyword");
			keyword = keyword == null ? "" : keyword;
		*/
		
		boardService.getBoardList();
		
		return container;
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam("no") int boardNo) {
		
		
		return "container";
	}
}
