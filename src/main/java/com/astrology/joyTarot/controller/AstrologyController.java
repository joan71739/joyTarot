package com.astrology.joyTarot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AstrologyController extends BaseController {
	
	@RequestMapping(value="/astrology",method = RequestMethod.GET)
	public String gotoAstrologyPage(ModelMap model) {
		model.put("name", "Joanne");
		return "astrology/astrologyIndex";
	}
	

}
