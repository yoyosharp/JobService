package com.fx23121.Controller;

import com.fx23121.Entity.Company;
import com.fx23121.Entity.Cv;
import com.fx23121.Entity.Role;
import com.fx23121.Entity.User;
import com.fx23121.Exception.EmailAlreadyExistedException;
import com.fx23121.Model.CompanyModel;
import com.fx23121.Model.UserModel;
import com.fx23121.Service.CompanyService;
import com.fx23121.Service.CvService;
import com.fx23121.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;

import javax.validation.Valid;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.HashSet;
import java.util.Set;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private CompanyService companyService;
    @Autowired
    private ServletContext servletContext;
    @Autowired
    private ResourceLoader resourceLoader;
    @Autowired
    private CvService cvService;

    private final String UPLOAD_PATH = "/upload/";

    private User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        return userService.getUserByEmail(auth.getName());
    }

    @RequestMapping("/profile")
    public ModelAndView showProfile() {
        ModelAndView modelAndView = new ModelAndView("user/profile");
        User currentUser = getCurrentUser();
        Set<Integer> userRolesId = new HashSet<>();
        currentUser.getRoles().forEach(role -> userRolesId.add(role.getId()));

        if (userRolesId.contains(2)){
            Company company = companyService.getCompany(currentUser.getCompanyId());
            //if hr does not have a company attached with then attach a new empty company
            if (company == null) {
                Company dummyCompany = new Company();
                dummyCompany.setLogo("/images/company-1.jpg");
                dummyCompany.setEmail("your@company.com");
                addUserCompany(currentUser, dummyCompany);
                company = dummyCompany;
            }
            modelAndView.addObject("company", company);
        }

        modelAndView.addObject("user", currentUser);
        modelAndView.addObject("userModel", new UserModel());
        modelAndView.addObject("companyModel", new CompanyModel());
        return modelAndView;
    }

    private void addUserCompany(User user, Company dummyCompany) {
        int companyId = companyService.addCompany(dummyCompany);
        user.setCompanyId(companyId);
        userService.saveOrUpdate(user);
    }

    @PostMapping("/update-profile")
    public ModelAndView updateUser(@Valid @ModelAttribute("userModel") UserModel userModel,
                                   BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView("user/profile");

        User user = getCurrentUser();
        Company company = companyService.getCompany(user.getCompanyId());

        if (bindingResult.hasErrors()) {
            modelAndView.addObject("userModel", userModel);
            modelAndView.addObject("user", user);
            modelAndView.addObject("company", company);
            modelAndView.addObject("companyModel", new CompanyModel());
            modelAndView.addObject("updateMessage", "failed");
            return modelAndView;
        }

        //if data input is validated check for more requirement
        try {
            userService.update(userModel);
            modelAndView.addObject("userModel", userModel);
            //successful update user detail -> reload user from database
            modelAndView.addObject("user", user);
            modelAndView.addObject("company", company);
            modelAndView.addObject("companyModel", new CompanyModel());
            modelAndView.addObject("updateMessage", "success");
            return modelAndView;
        } catch (EmailAlreadyExistedException e) {
            modelAndView.addObject("updateMessage", "email-existed");
        }
        //catch error return the error to the webpage
        modelAndView.addObject("user", user);
        modelAndView.addObject("company", company);
        modelAndView.addObject("userModel", userModel);
        modelAndView.addObject("companyModel", new CompanyModel());
        return modelAndView;
    }

    @PostMapping("/uploadImage")
    public ResponseEntity<String> uploadImage(@RequestParam("file") MultipartFile file) {

        if (!file.isEmpty()) {
            try {
                User currentUser = getCurrentUser();
                Resource resource = resourceLoader.getResource(UPLOAD_PATH);

                //Get upload folder for the user or create if it is not existed
                Path uploadLocation = Paths.get(resource.getFile().getAbsolutePath()).resolve(currentUser.getEmail());
                if (!Files.exists(uploadLocation) || !Files.isDirectory(uploadLocation))
                    Files.createDirectories(uploadLocation);

                //each user can have only 1 profile picture -> rename original pic
                Path destinationFile = uploadLocation.resolve("userImage").normalize();
                try (InputStream inputStream = file.getInputStream()) {
                    Files.copy(inputStream, destinationFile, StandardCopyOption.REPLACE_EXISTING);
                }

                //build link to user image
                String imageUrl = UPLOAD_PATH + currentUser.getEmail() + "/" + "userImage";

                //update image for the current user
                currentUser.setImage(imageUrl);
                userService.saveOrUpdate(currentUser);
                // Set a success status and write the URL to the response
                return ResponseEntity.accepted().body(imageUrl);
            } catch (Exception e) {
                System.out.println("Error" + e.getMessage());
                return ResponseEntity.ok().body("Error");
            }
        }
        return ResponseEntity.badRequest().build();
    }

    @PostMapping("/uploadCv")
    public ResponseEntity<String> updateCv(@RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                User currentUser = getCurrentUser();
                Resource resource = resourceLoader.getResource(UPLOAD_PATH);
                String fileName = file.getOriginalFilename();

                //Get upload folder for the user or create if it is not existed
                Path uploadLocation = Paths.get(resource.getFile().getAbsolutePath()).resolve(currentUser.getEmail());
                if (!Files.exists(uploadLocation) || !Files.isDirectory(uploadLocation))
                    Files.createDirectories(uploadLocation);

                //each user can have only 1 Cv-> rename original pic
                Path destinationFile = uploadLocation.resolve(fileName).normalize();
                try (InputStream inputStream = file.getInputStream()) {
                    Files.copy(inputStream, destinationFile, StandardCopyOption.REPLACE_EXISTING);
                }

                //set user CV to the new Cv
                Cv userCv = currentUser.getCv();
                userCv.setFileName(fileName);
                userCv.setUser(currentUser);
                cvService.addCv(userCv);
                currentUser.setCv(userCv);
                userService.saveOrUpdate(currentUser);

                // Set a success status and write the URL to the response
                return ResponseEntity.accepted().body("/" + fileName);
            }
            catch (Exception e) {
                System.out.println("Error" + e.getMessage());
                return ResponseEntity.ok().body("Error");
            }
        }
        return ResponseEntity.badRequest().build();
    }

    @PostMapping("/deleteCv")
    public ResponseEntity<String> deleteCv() {
        try {
            User currentUser = getCurrentUser();
            Resource resource = resourceLoader.getResource(UPLOAD_PATH);

            Path filePath = Paths.get(resource.getFile().getAbsolutePath())
                    .resolve(currentUser.getEmail())
                    .resolve(currentUser.getCv().getFileName());
            Files.delete(filePath);

            currentUser.getCv().setFileName(null);
            userService.saveOrUpdate(currentUser);
            return ResponseEntity.ok().body("Success");
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return ResponseEntity.ok().body("Error");
        }
    }

    @PostMapping("/update-company")
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

    @PostMapping("/uploadLogo")
    public ResponseEntity<String> updateLogo(@RequestParam("logo") MultipartFile file) {
        if (file.isEmpty()) {
            System.out.println("Empty file");
            return ResponseEntity.ok().build();
        }
        try {
            User currentUser = getCurrentUser();
            Company currentCompany = companyService.getCompany(currentUser.getCompanyId());

            Resource resource = resourceLoader.getResource(UPLOAD_PATH);

            //Get upload folder for the user or create if it is not existed
            Path uploadLocation = Paths.get(resource.getFile().getAbsolutePath()).resolve(currentUser.getEmail());
            if (!Files.exists(uploadLocation) || !Files.isDirectory(uploadLocation))
                Files.createDirectories(uploadLocation);

            //each user can have only 1 profile picture -> rename original pic
            Path destinationFile = uploadLocation.resolve("companyLogo").normalize();
            try (InputStream inputStream = file.getInputStream()) {
                Files.copy(inputStream, destinationFile, StandardCopyOption.REPLACE_EXISTING);
            }

            //build link to user image
            String logoUrl = UPLOAD_PATH + currentUser.getEmail() + "/" + "companyLogo";

            //update image for the current user
            currentCompany.setLogo(logoUrl);
            companyService.saveOrUpdate(currentCompany);
            // Set a success status and write the URL to the response
            return ResponseEntity.accepted().body(logoUrl);
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return ResponseEntity.ok().body("Error");
        }
    }
}
