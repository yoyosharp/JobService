package com.fx23121.Controller;

import com.fx23121.Entity.User;
import com.fx23121.Exception.ConfirmPasswordNotMatchException;
import com.fx23121.Exception.EmailAlreadyExistedException;
import com.fx23121.Model.UserModel;
import com.fx23121.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public ModelAndView showHome() {

        ModelAndView modelAndView = new ModelAndView("public/home");

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        User user = userService.getUserByEmail(auth.getName());

        if (user != null) {
            modelAndView.addObject("loginMessage", "successful");
            modelAndView.addObject("user", user);
        } else {
            modelAndView.addObject("loginMessage", "anonymous");
        }

        return modelAndView;
    }

    @RequestMapping("/login")
    public ModelAndView showLogin() {
        ModelAndView modelAndView = new ModelAndView("login");
        modelAndView.addObject("userModel", new UserModel());
        return modelAndView;
    }

    @PostMapping("/register")
    public ModelAndView createUser(@Valid @ModelAttribute("userModel") UserModel userModel,
                                   BindingResult bindingResult) {
        //using validator for validate data
        ModelAndView modelAndView = new ModelAndView("login");

        if (bindingResult.hasErrors()) {
            modelAndView.addObject("userModel", userModel);
            modelAndView.addObject("registerMessage", "failed");
            return modelAndView;
        }
        //if data input is validated check for more requirement
        try {
            userService.addUser(userModel);
            modelAndView.addObject("userModel", new UserModel());
            modelAndView.addObject("registerMessage", "success");
            return modelAndView;
        } catch (EmailAlreadyExistedException e) {
            modelAndView.addObject("registerMessage", "email-existed");
        } catch (ConfirmPasswordNotMatchException e) {
            modelAndView.addObject("registerMessage", "password-not-match");
        }

        modelAndView.addObject("userModel", userModel);
        return modelAndView;
    }

}
