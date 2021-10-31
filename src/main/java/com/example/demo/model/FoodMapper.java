package com.example.demo.model;

import com.example.demo.vo.Food;
import com.example.demo.vo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FoodMapper {

    @Insert("insert into food(name, main_img, detail_img, ingredients, part) values(#{food.name}, #{food.mainImg}, #{food.detailImg}, #{food.ingredients}, #{food.part})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    int save(@Param("food") final Food food);


//    private String name;
//    private String mainImg;
//    private String detailImg;
//    private String ingredients;
//    private String part;

}
