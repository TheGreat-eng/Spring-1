package vn.hoidanit.laptopshop.Controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;

import vn.hoidanit.laptopshop.Service.UserService;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.*;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;

    }

    @RequestMapping("/")

    public String GetHomePage(Model model) {

        List<User> arrUsers = this.userService.getAllUsersByEmail("1@gmail.com");

        System.out.println(arrUsers);

        model.addAttribute("eric", "test");
        return "Hello";
    }

    @RequestMapping("/admin/user")

    public String GetUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();

        model.addAttribute("users1", users);

        return "admin/user/table-user";
    }

    @RequestMapping("/admin/user/create")

    public String GetCreateUserPage(Model model) {

        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)

    public String creatUserPage(Model model, @ModelAttribute("newUser") User hoidanit) {

        this.userService.handleSaveUser(hoidanit);
        return "redirect:/admin/user";
    }

}
