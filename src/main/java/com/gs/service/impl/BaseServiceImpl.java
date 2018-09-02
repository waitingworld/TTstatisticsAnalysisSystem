package com.gs.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.gs.dao.BaseMapper;
import com.gs.model.Type;
import com.gs.service.BaseService;
import com.gs.utils.DateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service(value = "baseService")
@Transactional(rollbackFor = Exception.class)
public class BaseServiceImpl implements BaseService {
    private static final Logger logger = LogManager.getLogger(BaseServiceImpl.class);
    @Autowired
    private BaseMapper baseMapper;

    /**
     * 添加新的统计信息
     *
     * @param data
     * @return
     */
    @Override
    public JSONObject addNewData(JSONObject data) {
        JSONObject result = new JSONObject();
        JSONObject param = new JSONObject();
        param.put("id", UUID.randomUUID().toString().replaceAll("-", ""));
        param.put("type_id", data.getString("type_id"));
        param.put("total", data.getInteger("total_number"));
        param.put("finish_data", DateUtils.formatDateToStr(data.getDate("finish_data"), "yyyy-MM-dd"));
        param.put("finish_time", data.getInteger("finish_time"));
        param.put("Correct_number", data.getInteger("right_number"));
        param.put("examination_name", data.getString("examination_name"));
        logger.info("param:" + param.toJSONString());
        result.put("success", baseMapper.addNewData(param));
        return result;
    }

    @Override
    public List<Type> getNextTypes(JSONObject data) {
        List<Type> types = baseMapper.getNextTypes(data);
        return types;
    }

    @Override
    public Integer getMaxTypeLevel(JSONObject data) {
        return baseMapper.getMaxTypeLevel(data);
    }
}
