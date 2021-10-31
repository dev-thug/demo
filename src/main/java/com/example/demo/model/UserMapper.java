package com.example.demo.model;

import com.example.demo.vo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {

    @Select("select * from user")
    List<User> findAll();

    @Select("select * from user where id=#{id}")
    User findById(@Param("id") int id);

    @Select("select * from user where email=#{email}")
    User findByEmail(@Param("email") String email);

    @Insert("insert into user(name, email, password) values(#{user.name}, #{user.email}, #{user.password})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    int save(@Param("user") final User user);
}
