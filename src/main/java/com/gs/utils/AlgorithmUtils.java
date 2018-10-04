package com.gs.utils;

import com.alibaba.fastjson.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class AlgorithmUtils {
    /**
     * 01背包算法 求最优解
     *
     * @param weight    物品重量
     * @param value     物品价值
     * @param maxWeight 背包容量
     */
    public static JSONObject bestResult(int[] weight, double[] value, int maxWeight) {
//        int[] weight = {3, 5, 2, 6, 3}; //物品重量
//        int[] value = {3, 4, 3, 5, 3}; //物品价值
//        int maxWeight = 15; //背包容量
        int n = value.length; //物品个数
        JSONObject resultJSON = new JSONObject();
        List<Integer> resultList = new ArrayList<>();

        double[][] resultMap = new double[n + 1][maxWeight + 1]; //resultMap[i][j]表示前i个物品能装入容量为j的背包中的最大价值
        int[][] path = new int[n + 1][maxWeight + 1];
        //初始化第一列和第一行
        for (int i = 0; i < resultMap.length; i++) {
            resultMap[i][0] = 0;
        }
        for (int i = 0; i < resultMap[0].length; i++) {
            resultMap[0][i] = 0;
        }
        //通过公式迭代计算
        for (int i = 1; i < resultMap.length; i++) {
            for (int j = 1; j < resultMap[0].length; j++) {
                if (weight[i - 1] > j)
                    resultMap[i][j] = resultMap[i - 1][j];
                else {
                    if (resultMap[i - 1][j] < resultMap[i - 1][j - weight[i - 1]] + value[i - 1]) {
                        resultMap[i][j] = resultMap[i - 1][j - weight[i - 1]] + value[i - 1];
                        path[i][j] = 1;
                    } else {
                        resultMap[i][j] = resultMap[i - 1][j];
                    }
                }
            }
        }
//        for (int i = 0; i < f.length; i++) {
//            for (int j = 0; j < f[0].length; j++) {
//                System.out.print(f[i][j] + "\t");
//            }
//            System.out.println();
//        }
        int i = resultMap.length - 1;
        int j = resultMap[0].length - 1;
        while (i > 0 && j > 0) {
            if (path[i][j] == 1) {
                System.out.print("第" + i + "个题目类型放入推荐队列 ");
                resultList.add(i);
                j -= weight[i - 1];
            }
            i--;
        }
        System.out.println("最大分数为:" + resultMap[value.length][maxWeight]);
        resultJSON.put("resultList",resultList);
        resultJSON.put("max_score",resultMap[value.length][maxWeight]);
        return resultJSON;
    }

}
