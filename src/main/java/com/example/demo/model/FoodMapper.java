package com.example.demo.model;

import com.example.demo.vo.Food;
import com.example.demo.vo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface FoodMapper {

    @Insert("insert into food(name, main_img, detail_img, ingredients, part) values(#{food.name}, #{food.mainImg}, #{food.detailImg}, #{food.ingredients}, #{food.part})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    int save(@Param("food") final Food food);

    @Select("select * from food where id=#{id}")
    Food findById(@Param("id") int id);

    @Select("select * from food where part=#{part} limit 100")
    List<Food> findAllFood(@Param("part") String part);

    @Select("select distinct part from food")
    List<String> findAllByPart();


//    private String name;
//    private String mainImg;
//    private String detailImg;
//    private String ingredients;
//    private String part;

}
