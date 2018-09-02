package com.gs.dao;

import com.alibaba.fastjson.JSONObject;
import com.gs.model.City;
import com.gs.model.Type;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BaseMapper {
    /**
     * 获取下一等级的题目类型
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

    /**
     * 添加新的数据
     * @param data
     * @return
     */
    boolean addNewData(JSONObject data);
}
