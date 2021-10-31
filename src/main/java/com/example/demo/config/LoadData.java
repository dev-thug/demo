package com.example.demo.config;

import com.example.demo.model.FoodMapper;
import com.example.demo.vo.Food;
import lombok.RequiredArgsConstructor;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
import net.minidev.json.parser.JSONParser;
import net.minidev.json.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;

import java.net.URI;

//
//@Configuration
//@RequiredArgsConstructor
//public class LoadData {
//    private static final Logger log = LoggerFactory.getLogger(LoadData.class);
//    private final FoodMapper foodMapper;
//    @Bean
//    CommandLineRunner initDatabase() throws ParseException {
//
//
//        long startTime = System.currentTimeMillis();
//
//        RestTemplate restTemplate = new RestTemplate();
//
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_JSON);
//
//        String key = "4514d4ff87db4cf8b776";
//        int start = 999;
//        int end = 1318; // total_count = 1318
//        HttpEntity entity = new HttpEntity(headers);
//        URI uri = URI.create("http://openapi.foodsafetykorea.go.kr/api/4514d4ff87db4cf8b776/COOKRCP01/json/" + start + "/" + end);
//
//        ResponseEntity responseEntity = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);
//
//
//        JSONParser jsonParser = new JSONParser();
//        JSONObject jsonObject = (JSONObject) jsonParser.parse(responseEntity.getBody().toString());
//
//        JSONObject value = (JSONObject) jsonObject.get("COOKRCP01");
//        JSONArray row = (JSONArray) value.get("row");
//
//        JSONObject data;
//
//
//        for (int i = 0; i < end; i++) {
//            data = (JSONObject) row.get(i);
//            Food food = Food.builder()
//                    .name(data.get("RCP_NM").toString().trim())
//                    .mainImg(data.get("ATT_FILE_NO_MAIN").toString())
//                    .detailImg(data.get("ATT_FILE_NO_MK").toString())
//                    .ingredients(data.get("RCP_PARTS_DTLS").toString().replace("\n", " "))
//                    .part(data.get("RCP_PAT2").toString())
//                    .build(); // 메뉴명
//
//            System.out.println(foodMapper.save(food));
//        }
//
//
//        long endTime = System.currentTimeMillis();
//
//        return args -> {
//            log.info("PreLoading Time : " + (endTime - startTime) + "ms");
//        };
//    }
//
//
//}
