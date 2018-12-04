package com.gs.aop;

import com.alibaba.fastjson.JSONObject;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AopService {

    @Pointcut("execution(* com.gs.controller.BaseController.*(..)) && args(params,..)")
    public void logServicePoint(JSONObject params) {
    }

    @Around("logServicePoint(params)")
    public Object around(ProceedingJoinPoint joinPoint, JSONObject params) throws Throwable {
        System.out.println("方法条件满足,开始执行方法!" + params.toJSONString());
        Object result = joinPoint.proceed();
        System.out.println("执行方法完毕!");
        return result;
    }

}
