package com.astrology.joyTarot.controller;

import java.util.Objects;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.astrology.joyTarot.dao.domain.Users;
import com.astrology.joyTarot.dao.domain.UsersInfo;

@Controller
public class MemberController extends BaseController {
	
	@GetMapping(value="/member")
	public String gotoMemberPage(ModelMap model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();	
		
		

	    if (auth == null || !auth.isAuthenticated() || auth.getPrincipal().equals("anonymousUser")) {
	        System.err.println("尚未登入");
	        return "redirect:/login"; // 建議導回 login 頁
	    }
	    
	    Users user = (Users) auth.getPrincipal(); // 這裡已確定可以轉型
	    System.out.println(user.getUsername());
	    UsersInfo userInfo = usersInfoService.findByUser(user);
	    
		
		System.err.println("正確，轉會員頁面");
		System.out.println(userInfo);
		// 將 userInfo 傳給前端或放入 model
		model.addAttribute("userInfo", userInfo);
		
		return "member/memberIndex";
				
	
	}

	@GetMapping(value="/privacy")
	public String gotoPrivacyPage() {
		return "member/privacy";
	}





}
