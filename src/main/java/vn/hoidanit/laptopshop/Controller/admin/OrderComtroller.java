package vn.hoidanit.laptopshop.Controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderComtroller {

    @GetMapping("/admin/order")
    public String getDashboard() {
        return "admin/order/show";
    }

}
