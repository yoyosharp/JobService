package com.fx23121.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @RequestMapping("/")
    public String showPublicHome() {

        return "redirect:public/home";
    }

    @RequestMapping("/login")
    public ModelAndView showLogin(){
        return new ModelAndView("login");
    }
}
