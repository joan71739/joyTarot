package com.astrology.joyTarot.controller;

import com.astrology.joyTarot.form.RegisterForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RegisterController extends BaseController {

    @GetMapping(value = "/register")
    public String gotoRegisterPage() {
        return "member/register";
    }

    @PostMapping(value = "/register")
    public String doRegister(RegisterForm registerForm, ModelMap model) {

        System.err.println("註冊中");

        try {
        	usersInfoService.save(registerForm);
        }catch (Exception e) {
            model.put("registerMsg", "error");
            model.put("error", e.getMessage());
            System.out.println(e.getMessage());
            System.err.println("註冊失敗");
            return "member/register";
        }
        System.err.println("註冊完成");
        model.put("registerMsg", "success");
        return "login";
    }


}
