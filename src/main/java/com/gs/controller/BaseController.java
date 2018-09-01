package com.gs.controller;

import com.alibaba.fastjson.JSONObject;
import com.gs.model.City;
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
    @RequestMapping("/selectAllCity")
    public JSONObject selectAllCity(@RequestBody JSONObject data, HttpServletRequest request) {
        logger.info("baseController:selectAllCity,{}", data.toJSONString());
        JSONObject result = baseService.selectAllCity(data);
        return result;
    }
}
