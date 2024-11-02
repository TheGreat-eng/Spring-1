package vn.hoidanit.laptopshop;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String index() {

        return "Hello World from Spring Boot! 1";
    }

    @GetMapping("/user")
    public String userPage() {

        return "Only user can access this page 1";
    }

    @GetMapping("/admin")
    public String admninPage() {

        return "Only admin can access this page 1";
    }

}
