package v2.board.c9.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
public class CommonController {

	private String container = "common/commonContainer";
	
	@RequestMapping(value = {"/home.do", "/", "/index.do", "/home"})
	public String home(Model model) {
		model.addAttribute("contentPage", "home.jsp");
		
		return container;
	}

	@RequestMapping(value = {"/about.do", "/about"})
	public String about(Model model) {
		model.addAttribute("contentPage", "about.jsp");
		
		return container;
	}
}
