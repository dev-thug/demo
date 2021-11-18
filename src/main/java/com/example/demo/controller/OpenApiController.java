package com.example.demo.controller;

import com.example.demo.service.FoodService;
import com.example.demo.service.ItemService;
import com.example.demo.vo.Item;
import com.example.demo.vo.User;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.TTSService;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
public class OpenApiController {



    private final TTSService ttsService;
    private final FoodService foodService;
    private final ItemService itemService;
    //
//	@RequestMapping("getXY")
//	@ResponseBody
//	public String getXY(String address) {
//
//		try {
//			JSONObject jo=openApiService.getXY(address);
//			System.out.println(jo);
//			return jo.toString();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return "fail";
//		}
//
//	}
//
    @RequestMapping("tts")
    public String tts(String text) {

        return ttsService.tts(text);
    }

    @RequestMapping("stt")
    public int stt(HttpServletRequest request, String text) throws Exception {
        System.out.println(text);
        HttpSession session = request.getSession();
        if (session == null) {
            throw new Exception();
        }
        System.out.println(foodService.findByName(text));
        User user = (User) session.getAttribute("user");
//        Item item = Item.builder().foodId(foodService.findByName(text).getId()).userId(user.getId()).build();
        Item item = new Item();
        item.setFoodId(1);
        item.setUserId(user.getId());
        System.out.println(item);
        return itemService.saveItem(item);
//        return ttsService.tts(text);
    }


}
