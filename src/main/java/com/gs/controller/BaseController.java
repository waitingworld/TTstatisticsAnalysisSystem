package com.gs.controller;

import com.alibaba.fastjson.JSONObject;
import com.gs.model.City;
import com.gs.model.Type;
import com.gs.service.BaseService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/baseController")
public class BaseController {
    private static final Logger logger = LogManager.getLogger(BaseController.class);
    @Resource
    private BaseService baseService;

    @ResponseBody
    @RequestMapping("/addNewData")
    public JSONObject selectAllCity(@RequestBody JSONObject data, HttpServletRequest request) {
        logger.info("baseController:addNewData,{}", data.toJSONString());
        JSONObject result = baseService.addNewData(data);
        return result;
    }

    @ResponseBody
    @RequestMapping("/getMaxTypeLevel")
    public JSONObject getMaxTypeLevel(@RequestBody JSONObject data, HttpServletRequest request) {
        logger.info("baseController:getMaxTypeLevel,{}", data.toJSONString());
        JSONObject result = new JSONObject();
        try {
            Integer maxLevel = baseService.getMaxTypeLevel(data);
            result.put("maxLevel", maxLevel);
        } catch (RuntimeException e) {
            e.printStackTrace();
            result.put("success", false);
        }
        result.put("success", true);
        return result;
    }

    @ResponseBody
    @RequestMapping("/getNextTypes")
    public JSONObject getNextTypes(@RequestBody JSONObject data, HttpServletRequest request) {
        logger.info("baseController:getNextTypes,{}", data.toJSONString());
        JSONObject result = new JSONObject();
        try {
            List<Type> types = baseService.getNextTypes(data);
            result.put("types", types);
        } catch (RuntimeException e) {
            e.printStackTrace();
            result.put("success", false);
        }
        result.put("success", true);
        return result;
    }
}
