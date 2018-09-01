package com.gs.dao;

import com.alibaba.fastjson.JSONObject;
import com.gs.model.City;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BaseMapper {
    List<City> selectAllCity(JSONObject data);
}
