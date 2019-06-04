package com.gs.ThreadTask;

import com.alibaba.fastjson.JSONObject;
import com.gs.model.Type;
import com.gs.service.BaseService;
import com.gs.utils.BeanContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.Callable;

public class NodeTaskCreator implements Callable<JSONObject> {
    private JSONObject params;
    private Logger logger = LoggerFactory.getLogger(NodeTaskCreator.class);

    private BaseService baseService;

    public NodeTaskCreator(JSONObject params) {
        this.baseService = BeanContext.getBean(BaseService.class);
        this.params = params;
    }

    public JSONObject call() throws Exception {
        Type type = (Type) params.get("type");
        Integer maxTypeLevel = params.getInteger("maxTypeLevel");
        JSONObject node = baseService.createNode(type, maxTypeLevel);
        logger.info("线程:" + Thread.currentThread().getName() + ", 任务完成");
        return node;
    }

}