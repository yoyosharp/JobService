package com.fx23121.Config;


import com.fx23121.Model.RecruitmentSearchFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.io.IOException;
import java.util.logging.Logger;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.fx23121")
public class JobServiceServletConfig implements WebMvcConfigurer {
    private final String TMP_FOLDER = "/tmp";
    private final int MAX_UPLOAD_SIZE = 10 * 1024 * 1024;
    private Environment environment;
    private Logger logger = Logger.getLogger(getClass().getName());



    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();

        resolver.setPrefix("/WEB-INF/view/");
        resolver.setSuffix(".jsp");

        return resolver;
    }

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(MAX_UPLOAD_SIZE);
        multipartResolver.setDefaultEncoding("UTF-8");
        return multipartResolver;
    }
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("/resources/");
        registry.addResourceHandler("/images/**")
                .addResourceLocations("/resources/assets/images/");
        registry.addResourceHandler("/upload/**")
                .addResourceLocations("/upload/");
    }


    @Bean
    public RecruitmentSearchFilter recruitmentSearchFilter() {
        return new RecruitmentSearchFilter("", 0, 0, "", 0);
    }
}
