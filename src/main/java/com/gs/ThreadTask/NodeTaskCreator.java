package com.gs.ThreadTask;

import com.alibaba.fastjson.JSONObject;
import com.gs.model.Type;
import com.gs.service.BaseService;
import com.gs.utils.BeanContext;
import javafx.application.Application;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import java.util.concurrent.Callable;

public class NodeTaskCreator implements Callable<JSONObject> {
    private JSONObject params;

    private BaseService baseService;

    public NodeTaskCreator(JSONObject params) {
        this.baseService = BeanContext.getBean(BaseService.class);
        this.params = params;
    }

    public JSONObject call() throws Exception {
        Type type = (Type) params.get("type");
        Integer maxTypeLevel = params.getInteger("maxTypeLevel");
        JSONObject node = baseService.createNode(type, maxTypeLevel);
        System.out.printf("线程:%s, %s\n", Thread.currentThread().getName(), "任务完成");
        return node;
    }

}