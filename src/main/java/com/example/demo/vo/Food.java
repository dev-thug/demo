package com.example.demo.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Food {

    private int id;
    private String name;
    private String mainImg;
    private String detailImg;
    private String ingredients;
    private String part;

}
