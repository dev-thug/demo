package com.example.demo;

import com.example.demo.model.FoodMapper;
import com.example.demo.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final UserService userService;
    private final FoodMapper foodMapper;
    @GetMapping(value = "/")
    public String hello() {

        return "index";
    }

    @GetMapping(value = "/food")
    @ResponseBody
    public List<String> menu() {
        List<String> parts = foodMapper.findAllByPart();

        return parts;
    }


}
