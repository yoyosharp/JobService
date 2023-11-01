package com.fx23121.Controller;

import com.fx23121.Entity.User;
import com.fx23121.Model.UserModel;
import com.fx23121.Repository.UserRepository;
import com.fx23121.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DemoController {

    @Autowired
    private UserService userService;
    @RequestMapping("/test")
    private String demo(Model model) {
        User user = userService.getUser(1);
        model.addAttribute("user", user);
        model.addAttribute("userModel", new UserModel());
        return "test";
    }
}
