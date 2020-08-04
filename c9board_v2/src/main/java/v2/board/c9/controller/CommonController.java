package v2.board.c9.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommonController {

	@RequestMapping(value = {"/home.do", "/", "/index.do", "/home"}, method = RequestMethod.GET)
	public String home() {
		
		return "common/home";
	}

	@RequestMapping(value = {"/about.do", "/about"}, method = RequestMethod.GET)
	public String about() {
		
		return "common/about";
	}
}
