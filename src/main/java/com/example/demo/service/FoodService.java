package com.example.demo.service;

import com.example.demo.model.FoodMapper;
import com.example.demo.vo.Food;
import lombok.RequiredArgsConstructor;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
import net.minidev.json.parser.JSONParser;
import net.minidev.json.parser.ParseException;
import org.springframework.boot.CommandLineRunner;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.util.List;

@Service
@RequiredArgsConstructor
public class FoodService {

    private final FoodMapper foodMapper;


    public List<String> findAllFood(){
        return foodMapper.findAllByPart();
    }

    public List<Food> findAllByPart(String part){
        return foodMapper.findAllFood(part);
    }


}
