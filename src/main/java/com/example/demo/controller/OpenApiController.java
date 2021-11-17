package com.example.demo.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.TTSService;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class OpenApiController {


    @Autowired
    TTSService ttsService;

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


}
