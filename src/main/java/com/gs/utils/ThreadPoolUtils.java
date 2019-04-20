package com.gs.utils;

import com.alibaba.fastjson.JSONObject;
import com.gs.ThreadTask.NodeTaskCreator;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ThreadPoolExecutor;


public class ThreadPoolUtils {
    public static List<JSONObject> creatThreadTask(JSONObject params) throws ExecutionException, InterruptedException {
        List<JSONObject> resultList = new ArrayList<>();
        Integer threadSize = params.getInteger("threadSize");
        if (threadSize == null || threadSize < 0) {
            threadSize = 2;
        }
        List<JSONObject> taskParams = (List<JSONObject>) params.get("taskParams");
        ThreadPoolExecutor executor = (ThreadPoolExecutor) Executors.newFixedThreadPool(threadSize);//创建只有2个线程的线程池
        List<Future<JSONObject>> taskResultList = new ArrayList<>();        //存放结果的列表
        for (JSONObject taskParam : taskParams) {
            NodeTaskCreator calculator = new NodeTaskCreator(taskParam);
            Future<JSONObject> result = executor.submit(calculator);
            taskResultList.add(result);
        }
        while (executor.getCompletedTaskCount() < resultList.size()) {
            System.out.println("线程执行中...");
        }
        for (int i = 0; i < taskResultList.size(); i++) {
            Future<JSONObject> result = taskResultList.get(i);
            JSONObject node = result.get();
            if (node == null) {
                continue;
            }
            resultList.add(node);
        }
        return resultList;
    }

//    public static void main(String[] args) {
//        Long startTime = System.currentTimeMillis();
//        ThreadPoolExecutor executor = (ThreadPoolExecutor) Executors.newFixedThreadPool(2);//创建只有2个线程的线程池
//        //存放结果的列表
//        List<Future<Integer>> resultList = new ArrayList<>();
//        //通过Random类生成一个随机数生成器
//        Random random = new Random();
//        for (int i = 0; i < 10; i++) {
//            int number = random.nextInt(10);
//            NodeTaskCreator calculator = new NodeTaskCreator(number);
//            Future<Integer> result = executor.submit(calculator);
//            resultList.add(result);
//        }
//        //创建一个循环来监控执行器的状态
//        try {
//            while (executor.getCompletedTaskCount() < resultList.size()) {
//                System.out.printf("\n已完成的线程数量: %d\n", executor.getCompletedTaskCount());
//                for (int i = 0; i < resultList.size(); i++) {
//                    Future<Integer> result = resultList.get(i);
//                    System.out.printf("第 %d 个线程 : 是否完成:%s\n", i, result.isDone());
//                }
//                Thread.sleep(50);
//            }
//        } catch (InterruptedException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//        System.out.println("全部线程执行结束");
//        try {
//            for (int i = 0; i < resultList.size(); i++) {
//                Future<Integer> result = resultList.get(i);
//                Integer number = null;
//                number = result.get();
//                System.out.printf("第 %d 个线程 执行结果是: %d\n", i, number);
//            }
//        } catch (InterruptedException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } catch (ExecutionException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//        executor.shutdown();
//        Long endTime = System.currentTimeMillis();
//        System.out.println("使用时间 = [" + (endTime - startTime) + "]");
//    }
}