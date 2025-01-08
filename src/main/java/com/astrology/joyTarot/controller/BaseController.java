package com.astrology.joyTarot.controller;

import com.astrology.joyTarot.dao.facade.MyUsersDetailService;
import com.astrology.joyTarot.dao.facade.TarotCardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BaseController {
	
@Autowired
public TarotCardService tarotCardService;

@Autowired
public MyUsersDetailService myUsersDetailService;


}
