package com.example.demo;

import com.example.demo.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class HelloController {

    private final UserService userService;

    @GetMapping(value = "/")
    public String hello(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();

        return "index";
    }

    @GetMapping(value = "/food")
    public String hello() {

        return "index";
    }

//    @PostMapping(value = "/login")
//    public String login(HttpServletRequest request, @RequestParam String email, @RequestParam String password, @RequestParam String name) {
//        System.out.println(email + password);
//        HttpSession httpSession = request.getSession();
//
//
//        System.out.println("저장된 키값: " +userService.save(User.builder().name(name).email(email).password(password).build()));
//        if (httpSession.isNew()) {
//            httpSession.setAttribute("id", email);
//            System.out.println("새로운 세션"  +email);
//        }else{
//            String userId = (String) httpSession.getAttribute("id");
//            System.out.println("세션에서 가져온 아이디" + userId);
//        }
//
//
//        return "index";
//    }
}
