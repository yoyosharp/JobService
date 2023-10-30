package com.fx23121.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
                .dataSource(dataSource)
                .usersByUsernameQuery("SELECT email, password, status FROM user where email = ?")
                .authoritiesByUsernameQuery("SELECT u.email, r.role_name" +
                        " FROM user u JOIN role r ON u.role_id = r.id" +
                        " WHERE u.email = ?");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/resources/**").permitAll()
                .antMatchers("/public/**").permitAll()
                .antMatchers("/company/**").hasRole("EMPLOYER")
                .antMatchers("/employee/**").hasRole("EMPLOYEE")
                .anyRequest().authenticated()
            .and()
                .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/processLogin")
                .permitAll()
            .and()
                .logout()
                .permitAll()
            .and()
                .exceptionHandling()
                .accessDeniedPage("/error/access-denied");

    }
}
