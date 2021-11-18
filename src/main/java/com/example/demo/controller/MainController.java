package com.example.demo.controller;

import com.example.demo.model.FoodMapper;
import com.example.demo.service.FoodService;
import com.example.demo.service.ItemService;
import com.example.demo.service.UserService;
import com.example.demo.vo.Food;
import com.example.demo.vo.Item;
import com.example.demo.vo.User;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final FoodService foodService;
    private final ItemService itemService;

    @GetMapping(value = "/")
    public String hello(Model model) {

        model.addAttribute("parts", foodService.findAllFood());
        return "index";
    }

    @GetMapping(value = "/food")
    @ResponseBody
    public List<Food> foods(@RequestParam String part) {
        return foodService.findAllByPart(part);
    }

    @GetMapping("items")
    @ResponseBody
    public List<Food> myItem(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return null;
        }
        return itemService.findAllItemByUser(user.getId());
    }

    @PostMapping("item")
    @ResponseBody
    public int addItem(HttpServletRequest request, @RequestParam int foodId) throws Exception {
        HttpSession session = request.getSession();
        if (session == null) {
            throw new Exception();
        }
        User user = (User) session.getAttribute("user");
        Item item = Item.builder().foodId(foodId).userId(user.getId()).build();
        return itemService.saveItem(item);
    }

    @PutMapping("completed")
    @ResponseBody
    public int completed(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        if (session == null) {
            throw new Exception();
        }
        User user = (User) session.getAttribute("user");
        int price = itemService.priceAll(user.getId());

        itemService.completed(user.getId());
        return price;
    }

//    @GetMapping("price")
//    @ResponseBody
//    public int price(HttpServletRequest request) throws Exception {
//        HttpSession session = request.getSession();
//        if (session == null) {
//            throw new Exception();
//        }
//        User user = (User) session.getAttribute("user");
//        return
//    }

}
