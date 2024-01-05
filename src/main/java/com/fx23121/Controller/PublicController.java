package com.fx23121.Controller;

import com.fx23121.DTO.CompanyDTO;
import com.fx23121.DTO.SearchData;
import com.fx23121.Entity.*;
import com.fx23121.Model.RecruitmentSearchFilter;
import com.fx23121.Repository.RecordRepository;
import com.fx23121.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/public")
public class PublicController {

    @Autowired
    private UserService userService;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private RecruitmentService recruitmentService;

    @Autowired
    private RecruitmentSearchFilter recruitmentSearchFilter;

    @Autowired
    private TypeService typeService;

    private String categorySearchKeyword = "";

    @RequestMapping("/home")
    public ModelAndView showHome() {

        ModelAndView modelAndView = new ModelAndView("public/home");

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        //user display
        try {
            User user = userService.getUserByEmail(auth.getName());
            modelAndView.addObject("user", user);
        } catch (Exception ignored) {}

        //top category display
        categorySearchKeyword = "";
        List<Category> topCategories = categoryService.searchRecords(categorySearchKeyword, 4);
        modelAndView.addObject("topCategories", topCategories);

        //top company display
        List<CompanyDTO> topCompanyByRecruitment = companyService.getTopCompanies(1, 4);
        List<CompanyDTO> topCompanyByJobCount = companyService.getTopCompanies(2, 4);
        List<CompanyDTO> topCompanyByApplied = companyService.getTopCompanies(3, 4);
        modelAndView.addObject("topCompaniesByRecruitment", topCompanyByRecruitment);
        modelAndView.addObject("topCompaniesByJobCount", topCompanyByJobCount);
        modelAndView.addObject("topCompaniesByApplied", topCompanyByApplied);


        //Top Job display
        List<Recruitment> topJobs = recruitmentService.getTopRecruitments(6);
        modelAndView.addObject("topRecruitments", topJobs);
        return modelAndView;
    }

    @RequestMapping("/jobList")
    public ModelAndView showJobList() {
        ModelAndView modelAndView = new ModelAndView("public/jobList");
        User currentUser = getCurrentUser();
        modelAndView.addObject("user", currentUser);

        //categories display
        categorySearchKeyword = "";
        List<Category> topCategories = categoryService.searchRecords(categorySearchKeyword, 8);
        modelAndView.addObject("topCategories", topCategories);
        modelAndView.addObject("categorySearchKeyword", this.categorySearchKeyword);


        //jobs section display
        List<Type> typeList = typeService.getTypes();
        modelAndView.addObject("jobTypes", typeList);

        int pageSize = 8;
        int pageIndex = 1;
        recruitmentSearchFilter.reset();
        SearchData<Recruitment> data = recruitmentService.searchRecruitment(recruitmentSearchFilter, pageSize, pageIndex);
        int maxResultCount = data.getTotalResultCount();
        int maxPageCount = maxResultCount/pageSize;
        if (maxResultCount % pageSize != 0) maxPageCount++;

        List<Recruitment> recruitmentList = data.getResultList();

        modelAndView.addObject("recruitments", recruitmentList);
        modelAndView.addObject("maxPageCount", maxPageCount);
        modelAndView.addObject("pageIndex", pageIndex);


        return modelAndView;
    }

    @PostMapping("/categorySearch")
    public ModelAndView categorySearch(@RequestParam("categoryKeyword") String categorySearchKeyword) {
        ModelAndView modelAndView = new ModelAndView("public/jobList");
        User currentUser = getCurrentUser();
        modelAndView.addObject("user", currentUser);

        //display category result search
        this.categorySearchKeyword = categorySearchKeyword;
        List<Category> topCategories = categoryService.searchRecords(categorySearchKeyword, 8);
        modelAndView.addObject("topCategories", topCategories);
        modelAndView.addObject("categorySearchKeyword", this.categorySearchKeyword);
        modelAndView.addObject("jumpTo","category-section");

        //jobs section display
        List<Type> typeList = typeService.getTypes();
        modelAndView.addObject("jobTypes", typeList);

        int pageSize = 8;
        int pageIndex = 1;
        SearchData<Recruitment> data = recruitmentService.searchRecruitment(recruitmentSearchFilter, pageSize, pageIndex);
        int maxResultCount = data.getTotalResultCount();
        int maxPageCount = maxResultCount/pageSize;
        if (maxResultCount % pageSize != 0) maxPageCount++;

        List<Recruitment> recruitmentList = data.getResultList();

        modelAndView.addObject("recruitments", recruitmentList);
        modelAndView.addObject("maxPageCount", maxPageCount);
        modelAndView.addObject("pageIndex", pageIndex);

        Category currentCategory = categoryService.getCategory(recruitmentSearchFilter.getCategoryId());
        if (currentCategory != null) modelAndView.addObject("category", currentCategory);

        return modelAndView;
    }

    @PostMapping("/jobSearch")
    public ModelAndView jobSearch(@RequestParam(value = "keyword", required = false) String keyword,
                                  @RequestParam(value = "categoryId", required = false) Integer categoryId,
                                  @RequestParam(value = "typeId", required = false) Integer typeId,
                                  @RequestParam(value = "address", required = false) String address,
                                  @RequestParam(value = "page", required = false) Integer pageIndex) {

        ModelAndView modelAndView = new ModelAndView("public/jobList");
        modelAndView.addObject("jumpTo", "recruitment-section");
        if (keyword != null) recruitmentSearchFilter.setTitle(keyword);
        if (categoryId != null) recruitmentSearchFilter.setCategoryId(categoryId);
        if (typeId != null) recruitmentSearchFilter.setType(typeId);
        if (address != null) recruitmentSearchFilter.setAddress(address);

        int pageSize = 8;
        if (pageIndex == null) pageIndex = 1;
        SearchData<Recruitment> data = recruitmentService.searchRecruitment(recruitmentSearchFilter, pageSize, pageIndex);
        int maxResultCount = data.getTotalResultCount();
        int maxPageCount = maxResultCount/pageSize;
        if (maxResultCount % pageSize != 0) maxPageCount++;

        List<Recruitment> recruitmentList = data.getResultList();

        modelAndView.addObject("recruitments", recruitmentList);
        modelAndView.addObject("maxPageCount", maxPageCount);
        modelAndView.addObject("pageIndex", pageIndex);

        Category currentCategory = categoryService.getCategory(recruitmentSearchFilter.getCategoryId());
        if (currentCategory != null) modelAndView.addObject("category", currentCategory);

        //jobs section display
        List<Type> typeList = typeService.getTypes();
        modelAndView.addObject("jobTypes", typeList);

        //display category result search
        List<Category> topCategories = categoryService.searchRecords(categorySearchKeyword, 8);
        modelAndView.addObject("topCategories", topCategories);
        modelAndView.addObject("categorySearchKeyword", this.categorySearchKeyword);

        User currentUser = getCurrentUser();
        modelAndView.addObject("user", currentUser);

        return modelAndView;
    }

    @RequestMapping("/job-detail")
    public ModelAndView showRecruitment(@RequestParam("recruitmentId") int recruitmentId) {
        ModelAndView modelAndView = new ModelAndView("public/recruitmentDetail");
        Recruitment currentRecruitment = recruitmentService.getRecruitment(recruitmentId);
        modelAndView.addObject("recruitment", currentRecruitment);

        User currentUser = getCurrentUser();
        modelAndView.addObject("user", currentUser);

        return modelAndView;
    }

    @RequestMapping("/companyList")
    public ModelAndView showCompanyList(@RequestParam(value = "sortType", required = false) Integer sortType,
                                        @RequestParam(value = "page", required = false) Integer pageIndex) {
        ModelAndView modelAndView = new ModelAndView("public/companyList");

        User currentUser = getCurrentUser();
        modelAndView.addObject("user", currentUser);
        if (sortType == null) sortType = 1;

        int pageSize = 5;
        if (pageIndex == null) pageIndex = 1;
        SearchData<Company> data = companyService.listCompany(sortType, pageSize, pageIndex);
        int maxResultCount = data.getTotalResultCount();
        int maxPageCount = maxResultCount / pageSize;
        if (maxResultCount % pageSize != 0) maxPageCount++;

        List<Company> resultList = data.getResultList();

        modelAndView.addObject("maxPageCount", maxPageCount);
        modelAndView.addObject("companies", resultList);
        modelAndView.addObject("pageIndex", pageIndex);

        return modelAndView;
    }

    @RequestMapping("/company-detail")
    public ModelAndView showCompany(@RequestParam("companyId") Integer companyId,
                                    @RequestParam(value = "page", required = false) Integer pageIndex) {
        ModelAndView modelAndView = new ModelAndView("public/companyDetail");

        User user = getCurrentUser();
        modelAndView.addObject("user", user);
        Company company = companyService.getCompany(companyId);
        modelAndView.addObject("company", company);

        int pageSize = 5;
        if (pageIndex == null) pageIndex = 1;
        recruitmentSearchFilter.reset();
        recruitmentSearchFilter.setCompanyId(companyId);
        SearchData<Recruitment> data = recruitmentService.searchRecruitment(recruitmentSearchFilter, pageSize, pageIndex);
        int totalResultCount = data.getTotalResultCount();

        int maxPageCount = totalResultCount/pageSize;
        if (maxPageCount % pageSize != 0) maxPageCount++;
        modelAndView.addObject("maxPageCount", maxPageCount);
        modelAndView.addObject("pageIndex", pageIndex);

        return modelAndView;
    }

    private User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return userService.getUserByEmail(auth.getName());
    }

}
