package com.fx23121.Controller;

import com.fx23121.DTO.CompanyDTO;
import com.fx23121.Entity.Category;
import com.fx23121.Entity.Recruitment;
import com.fx23121.Entity.User;
import com.fx23121.Exception.ConfirmPasswordNotMatchException;
import com.fx23121.Exception.EmailAlreadyExistedException;
import com.fx23121.Model.UserModel;
import com.fx23121.Service.CategoryService;
import com.fx23121.Service.CompanyService;
import com.fx23121.Service.RecruitmentService;
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
import java.util.ArrayList;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private RecruitmentService recruitmentService;

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
        //top category display
        List<Category> topCategories = categoryService.searchRecords("",4);
        modelAndView.addObject("topCategories", topCategories);

        //top company display
        List<CompanyDTO> topCompanyByRecruitment = companyService.getTopCompanies(1, 4);
        List<CompanyDTO> topCompanyByJobCount = companyService.getTopCompanies(2, 4);
        List<CompanyDTO> topCompanyByApplied = companyService.getTopCompanies(3, 4);
        modelAndView.addObject("topCompaniesByRecruitment", topCompanyByRecruitment);
        modelAndView.addObject("topCompaniesByJobCount", topCompanyByJobCount);
        modelAndView.addObject("topCompaniesByApplied", topCompanyByApplied);


        List<Recruitment> topJobs = recruitmentService.getTopRecruitments(6);
        modelAndView.addObject("topRecruitments", topJobs);
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
