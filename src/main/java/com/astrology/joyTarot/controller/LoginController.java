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
		System.out.println("index");
		return "index";
	}
	

}
