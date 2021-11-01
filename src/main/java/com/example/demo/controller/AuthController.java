package com.example.demo.controller;

import com.example.demo.vo.User;
import com.example.demo.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;

    @GetMapping(value = "/login")
    public String login() {
        return "login";
    }

    @PostMapping(value = "/login")
    public String login(@RequestParam String email, @RequestParam String password, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        System.out.println(email+password);
        User user = userService.login(email, password);

        session.setAttribute("user", user);

        return "redirect:/";
    }


    @GetMapping(value = "/register")
    public String register() {
        return "register";
    }

    @PostMapping(value = "/register")
    public String register(@RequestParam String email, @RequestParam String password, @RequestParam String name) {
        userService.save(User.builder().email(email).password(password).name(name).build());

        return "redirect:/";
    }

    @GetMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "redirect:/";
    }
}
