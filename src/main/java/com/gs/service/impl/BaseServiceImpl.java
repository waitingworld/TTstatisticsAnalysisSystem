package com.gs.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gs.dao.BaseMapper;
import com.gs.model.City;
import com.gs.service.BaseService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service(value = "baseService")
@Transactional(rollbackFor = Exception.class)
public class BaseServiceImpl implements BaseService {
    private static final Logger logger = LogManager.getLogger(BaseServiceImpl.class);
    @Autowired
    private BaseMapper baseMapper;

    public JSONObject selectAllCity(JSONObject data) {
        JSONObject result = new JSONObject();
        logger.debug("{}:selectAllCity:{},", "BaseServiceImpl", data.toJSONString());
        int currentPage = data.getInteger("currentPage");
        int pageSize = data.getInteger("pageSize");
        PageHelper.startPage(currentPage, pageSize);
        List<City> cities = baseMapper.selectAllCity(data);
        result.put("data",cities);
        PageInfo<City> pageInfo = new PageInfo<City>(cities);
        result.put("total",pageInfo.getTotal());
        return result;
    }
}
