package com.fx23121.Controller;

import com.fx23121.Entity.User;
import com.fx23121.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


public class DemoController {

    @Autowired
    private UserRepository userRepository;
    @RequestMapping("/demo")
    private String demo(Model model) {
        User user = userRepository.getUser(1);
        model.addAttribute("user", user);
        return "home";
    }
}
