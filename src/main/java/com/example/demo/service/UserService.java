package com.example.demo.service;

import com.example.demo.vo.User;
import com.example.demo.model.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserMapper userMapper;

    public int save(User user){
        return userMapper.save(user);
    }

    public User findById(int id){
        return userMapper.findById(id);
    }

    public User findByEmail(String email){
        return userMapper.findByEmail(email);
    }

    public User login(String email, String password) throws Exception {
        User user = findByEmail(email);
        if (!Objects.equals(user.getPassword(), password)){
            throw new Exception("로그인 실패");
        }

        return user;
    }

}
