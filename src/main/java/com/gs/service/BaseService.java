package com.gs.service;

import com.alibaba.fastjson.JSONObject;
import com.gs.model.City;
import com.gs.model.Type;
import org.springframework.stereotype.Service;

import java.util.List;

public interface BaseService {
    /**
     * 添加新的统计信息
     *
     * @param data
     * @return
     */
    JSONObject addNewData(JSONObject data);

    /**
     * 获取下一级别的类型
     *
     * @param data
     * @return
     */
    List<Type> getNextTypes(JSONObject data);

    /**
     * 获取类型的最高等级
     *
     * @param data
     * @return
     */
    Integer getMaxTypeLevel(JSONObject data);

    /**
     * 获取首页的力导向图的配置项
     * @param data
     * @return
     */
    JSONObject getTypeMap(JSONObject data);

    /**
     * 获取折线图的配置项
     * @param data
     * @return
     */
    JSONObject getLineBarOptions(JSONObject data);

    /**
     * 获取所有试卷名
     * @param data
     * @return
     */
    List<String> getAllExaminationName(JSONObject data);

    /**
     * 获取分析数据
     * @param data
     * @return
     */
    JSONObject getAnalyzeData(JSONObject data);
}
