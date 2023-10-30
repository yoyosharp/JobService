package com.fx23121.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/public")
public class PublicController {
    @RequestMapping("/home")
    public ModelAndView showHome() {
        ModelAndView modelAndView = new ModelAndView("home");
        return modelAndView;
    }
}
