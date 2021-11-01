package com.example.demo.model;

import com.example.demo.vo.Food;
import com.example.demo.vo.Item;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ItemMapper {

    @Insert("insert into item(user_id, food_id) values(#{item.userId}, #{item.foodId})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    int save(@Param("item") final Item item);

    @Select("SELECT *  FROM food WHERE id in(select food_id FROM item WHERE user_id=#{userId} AND completed='0')")
    List<Food> findAllByUser(@Param("userId") int userId);

    @Update("UPDATE item SET completed = '1' WHERE user_id=#{userId} AND food_id=#{foodId}")
    void completed(@Param("userId") int userId, @Param("foodId") int foodId);

}
