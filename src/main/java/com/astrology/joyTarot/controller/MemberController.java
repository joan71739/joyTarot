package com.astrology.joyTarot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController extends BaseController {
	
	@RequestMapping(value="/member",method = RequestMethod.GET)
	public String gotoMemberPage(ModelMap model) {
		model.put("name", "Joanne");
		return "member/memberIndex";
	}

	@RequestMapping(value="/privacy",method = RequestMethod.GET)
	public String gotoPrivacyPage() {
		return "member/privacy";
	}





}
