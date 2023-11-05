package com.fx23121.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/errors")
public class ErrorController {
    @RequestMapping("/access-denied")
    public String accessDenied() {
        return "errors/access-denied";
    }
}
