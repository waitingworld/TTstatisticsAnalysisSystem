package com.gs.service;

import com.alibaba.fastjson.JSONObject;
import com.gs.model.City;
import org.springframework.stereotype.Service;

import java.util.List;

public interface BaseService {
    JSONObject selectAllCity(JSONObject data);
}
