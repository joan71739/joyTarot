package com.astrology.joyTarot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController extends BaseController {

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/")
	public String index() {
		//model.put("name", "Joanne");
		return "index";
	}

//	@GetMapping(value="/register")
//	public String gotoRegisterPage(ModelMap model) {
//		model.put("name", "Joanne");
//		return "index";
//	}




	

}
