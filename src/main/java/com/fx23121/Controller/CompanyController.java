package com.fx23121.Controller;

import com.fx23121.DTO.SearchData;
import com.fx23121.Entity.*;
import com.fx23121.Exception.EmailAlreadyExistedException;
import com.fx23121.Model.CompanyModel;
import com.fx23121.Model.RecruitmentModel;
import com.fx23121.Model.RecruitmentSearchFilter;
import com.fx23121.Model.UserModel;
import com.fx23121.Repository.RecordRepository;
import com.fx23121.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    private UserService userService;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private RecruitmentSearchFilter recruitmentSearchFilter;

    @Autowired
    private RecruitmentService recruitmentService;

    @Autowired
    private TypeService typeService;

    @Autowired
    private CategoryService categoryService;

    @PostMapping("/updateCompany")
    public ModelAndView updateCompany(@Valid @ModelAttribute("companyModel") CompanyModel companyModel,
                                      BindingResult result) {
        ModelAndView modelAndView = new ModelAndView("user/profile");

        User user = getCurrentUser();
        Company company = companyService.getCompany(user.getCompanyId());

        if (result.hasErrors()) {
            modelAndView.addObject("user", user);
            modelAndView.addObject("company", company);
            modelAndView.addObject("userModel", new UserModel());
            modelAndView.addObject("companyModel", companyModel);
            modelAndView.addObject("companyMessage", "failed");
            return modelAndView;
        }

        try {
            companyService.update(company.getId(), companyModel);
            modelAndView.addObject("companyMessage", "success");
            modelAndView.addObject("user", user);
            //reload company info
            company = companyService.getCompany(user.getCompanyId());
            modelAndView.addObject("company", company);
            modelAndView.addObject("userModel", new UserModel());
            modelAndView.addObject("companyModel", new CompanyModel());
            return modelAndView;
        }
        catch (EmailAlreadyExistedException e) {
            modelAndView.addObject("companyMessage", "email-existed");
        }
        //catch error return the submitted data to the webpage
        modelAndView.addObject("user", user);
        modelAndView.addObject("company", company);
        modelAndView.addObject("userModel", new UserModel());
        modelAndView.addObject("companyModel", companyModel);
        return modelAndView;
    }

    @RequestMapping("/recruitment-list")
    public ModelAndView showPostList(@RequestParam(value = "page", required = false) Integer pageIndex) {
        ModelAndView modelAndView = new ModelAndView("company/companyDetail");

        User user = getCurrentUser();
        modelAndView.addObject("user", user);
        Company company = companyService.getCompany(user.getCompanyId());
        modelAndView.addObject("company", company);

        int pageSize = 5;
        if (pageIndex == null) pageIndex = 1;
        recruitmentSearchFilter.reset();
        recruitmentSearchFilter.setCompanyId(user.getCompanyId());
        SearchData<Recruitment> data = recruitmentService.searchRecruitment(recruitmentSearchFilter, pageSize, pageIndex);
        int totalResultCount = data.getTotalResultCount();

        int maxPageCount = totalResultCount/pageSize;
        if (totalResultCount % pageSize != 0) maxPageCount++;
        modelAndView.addObject("maxPageCount", maxPageCount);
        modelAndView.addObject("pageIndex", pageIndex);

        List<Recruitment> resultList = data.getResultList();
        modelAndView.addObject("recruitments", resultList);

        return modelAndView;
    }

    @RequestMapping("/recruitment-detail")
    public ModelAndView showRecruitment(@RequestParam("recruitmentId") Integer recruitmentId) {
        ModelAndView modelAndView = new ModelAndView("company/recruitmentDetail");
        Recruitment currentRecruitment = recruitmentService.getRecruitment(recruitmentId);
        modelAndView.addObject("recruitment", currentRecruitment);

        User currentUser = getCurrentUser();
        modelAndView.addObject("user", currentUser);

        return modelAndView;
    }

    @RequestMapping("/add-recruitment")
    public ModelAndView showNewPostPage() {
        ModelAndView modelAndView = new ModelAndView("company/newPost");
        modelAndView.addObject("recruitmentModel", new RecruitmentModel());

        User user = getCurrentUser();
        modelAndView.addObject("user", user);
        Company company = companyService.getCompany(user.getCompanyId());
        modelAndView.addObject("company", company);

        List<Type> types = typeService.getTypes();
        List<Category> categories = categoryService.getCategories();

        modelAndView.addObject("types", types);
        modelAndView.addObject("categories", categories);
        return modelAndView;
    }

    @PostMapping("/addRecruitment")
    public ModelAndView newPost(@Valid @ModelAttribute("recruitmentModel") RecruitmentModel recruitmentModel,
                                BindingResult result) {

        ModelAndView modelAndView = new ModelAndView("company/newPost");
        User user = getCurrentUser();
        modelAndView.addObject("user", user);
        Company company = companyService.getCompany(user.getCompanyId());
        modelAndView.addObject("company", company);
        List<Type> types = typeService.getTypes();
        List<Category> categories = categoryService.getCategories();

        modelAndView.addObject("types", types);
        modelAndView.addObject("categories", categories);

        if (result.hasErrors()) {
            modelAndView.addObject("recruitmentModel", recruitmentModel);
            modelAndView.addObject("addMessage", "failed");
            return modelAndView;
        }

        recruitmentService.addRecruitment(company, recruitmentModel);
        modelAndView.addObject("addMessage", "success");
        modelAndView.addObject("recruitmentModel", new RecruitmentModel());
        return modelAndView ;

    }

    @RequestMapping("/update-recruitment")
    public ModelAndView showUpdatePostPage(@RequestParam("recruitmentId") Integer recruitmentId) {

        ModelAndView modelAndView = new ModelAndView("company/updatePost");
        Recruitment currentRecruitment = recruitmentService.getRecruitment(recruitmentId);
        modelAndView.addObject("recruitment", currentRecruitment);
        modelAndView.addObject("recruitmentModel", new RecruitmentModel());
        List<Type> types = typeService.getTypes();
        List<Category> categories = categoryService.getCategories();

        modelAndView.addObject("types", types);
        modelAndView.addObject("categories", categories);

        User user = getCurrentUser();
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    @RequestMapping("/updateRecruitment")
    public ModelAndView updateRecruitment(@RequestParam("recruitmentId") Integer recruitmentId,
                                          @Valid @ModelAttribute("recruitmentModel") RecruitmentModel recruitmentModel,
                                          BindingResult result) {
        ModelAndView modelAndView = new ModelAndView("company/updatePost");
        Recruitment currentRecruitment = recruitmentService.getRecruitment(recruitmentId);
        modelAndView.addObject("recruitment", currentRecruitment);
        List<Type> types = typeService.getTypes();
        List<Category> categories = categoryService.getCategories();

        modelAndView.addObject("types", types);
        modelAndView.addObject("categories", categories);

        if (result.hasErrors()) {
            modelAndView.addObject("recruitmentModel", recruitmentModel);
            return modelAndView;
        }

        recruitmentService.update(currentRecruitment, recruitmentModel);
        modelAndView.addObject("recruitmentModel", new RecruitmentModel());

        User user = getCurrentUser();
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    @RequestMapping("/delete-recruitment")
    public ModelAndView deletePost(@RequestParam("recruitmentId") Integer recruitmentId) {
        ModelAndView modelAndView = new ModelAndView("public/companyDetail");
            Recruitment currentRecruitment = recruitmentService.getRecruitment(recruitmentId);

            if (!currentRecruitment.getAppliedUsers().isEmpty()) {
                modelAndView.addObject("deleteMessage", "hasAppliedUser");
            }
            else {
                currentRecruitment.setStatus(0);
                recruitmentService.saveOrUpdate(currentRecruitment);
                modelAndView.addObject("deleteMessage", "success");
            }

        User user = getCurrentUser();
        modelAndView.addObject("user", user);
        Company company = companyService.getCompany(user.getCompanyId());
        modelAndView.addObject("company", company);

        int pageSize = 5;
        int pageIndex = 1;
        recruitmentSearchFilter.reset();
        recruitmentSearchFilter.setCompanyId(user.getCompanyId());
        SearchData<Recruitment> data = recruitmentService.searchRecruitment(recruitmentSearchFilter, pageSize, pageIndex);
        int totalResultCount = data.getTotalResultCount();

        int maxPageCount = totalResultCount/pageSize;
        if (maxPageCount % pageSize != 0) maxPageCount++;
        modelAndView.addObject("maxPageCount", maxPageCount);
        modelAndView.addObject("pageIndex", pageIndex);

        List<Recruitment> resultList = data.getResultList();
        modelAndView.addObject("recruitments", resultList);
        return modelAndView;
    }

    private User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        return userService.getUserByEmail(auth.getName());
    }
}
