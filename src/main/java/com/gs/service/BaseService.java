package com.gs.service;

import com.alibaba.fastjson.JSONObject;
import com.gs.model.City;
import com.gs.model.Type;
import org.springframework.stereotype.Service;

import java.util.List;

public interface BaseService {
    /**
     * 添加新的统计信息
     * @param data
     * @return
     */
    JSONObject addNewData(JSONObject data);
    /**
     * 获取下一级别的类型
     * @param data
     * @return
     */
    List<Type> getNextTypes(JSONObject data);
    /**
     * 获取类型的最高等级
     * @param data
     * @return
     */
    Integer getMaxTypeLevel(JSONObject data);
}
