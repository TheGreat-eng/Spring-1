package vn.hoidanit.laptopshop.Controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;

import vn.hoidanit.laptopshop.Service.UserService;
import vn.hoidanit.laptopshop.domain.User;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")

    public String GetHomePage(Model model) {
        String test = this.userService.handleHello();
        model.addAttribute("eric", test);
        return "Hello";
    }

    @RequestMapping("/admin/user")

    public String GetUserPage(Model model) {
        String test = this.userService.handleHello();
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create1", method = RequestMethod.POST)

    public String creatUserPage(Model model, @ModelAttribute("newUser") User hoidanit) {
        System.out.println("Run here" + hoidanit);
        return "Hello";
    }

}
