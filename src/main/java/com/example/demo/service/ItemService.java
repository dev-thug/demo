package com.example.demo.service;

import com.example.demo.model.ItemMapper;
import com.example.demo.vo.Food;
import com.example.demo.vo.Item;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemService {

    private final ItemMapper itemMapper;

    public int saveItem(Item item) {
        return itemMapper.save(item);
    }

    public List<Food> findAllItemByUser(int userId) {
        return itemMapper.findAllByUser(userId);
    }

    public void completed(int userId, int foodId) {
        itemMapper.completed(userId, foodId);
    }


}
