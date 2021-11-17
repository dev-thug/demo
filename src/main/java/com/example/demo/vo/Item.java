package com.example.demo.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Item {
    private int id;
    private int userId;
    private int foodId;
    private boolean completed;

}
