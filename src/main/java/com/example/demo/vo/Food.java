package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
public class Food {

    private int id;
    private String name;
    private String main_img;
    private String detail_img;
    private String ingredients;
    private String part;
    private int price;

}
