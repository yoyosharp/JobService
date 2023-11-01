package com.fx23121.Controller;

import com.fx23121.Entity.User;
import com.fx23121.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/public")
public class PublicController {

    @Autowired
    private UserService userService;

    private final int ROLE_EMPLOYER = 1;
    private final int ROLE_EMPLOYEE = 2;

    @RequestMapping("/home")
    public ModelAndView showHome() {

        ModelAndView modelAndView = new ModelAndView("public/home");

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        System.out.println(auth.getName());
        System.out.println(auth.getAuthorities());

        try{
            User user = userService.getUserByEmail(auth.getName());

            modelAndView.addObject("userName", user.getName());
            modelAndView.addObject("userImage", user.getImage());
            modelAndView.addObject("userRole", user.getRole().getId());
        }
        catch (Exception ignored){}

        return modelAndView;
    }
}
