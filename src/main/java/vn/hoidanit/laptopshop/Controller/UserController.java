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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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

    @RequestMapping("/admin/user/{id}")

    public String GetUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/show";
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

    @RequestMapping("/admin/user/update/{id}")

    public String GetUpdateUserPage(Model model, @PathVariable long id) {

        User currentUser = this.userService.getUserById(id);

        model.addAttribute("newUser", currentUser);

        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")

    public String posUpdateUser(Model model, @ModelAttribute("newUser") User hoidanit) {

        User currentUser = this.userService.getUserById(hoidanit.getId());

        if (currentUser != null) {
            currentUser.setAddress(hoidanit.getAddress());
            currentUser.setFullname(hoidanit.getFullname());
            currentUser.setPhone(hoidanit.getPhone());

            this.userService.handleSaveUser(currentUser);
        }

        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")

    public String GetDeleteUserPage(Model model, @PathVariable long id) {

        model.addAttribute("id", id);
        // User user = new User();
        // user.setId(id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")

    public String PostDeleteUserPage(Model model, @ModelAttribute("newUser") User eric) {

        this.userService.deleteAUser(eric.getId());
        return "redirect:/admin/user";
    }

}
