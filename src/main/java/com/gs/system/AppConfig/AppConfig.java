package com.gs.system.AppConfig;

import com.alibaba.fastjson.JSONObject;
import com.gs.utils.Dom4jUtils;
import org.apache.commons.lang3.StringUtils;

public class AppConfig {//加载对应的environment文件
    private static AppConfig appConfig = null;
    private static JSONObject environmentConfig = null;
    private static String environmentPath = null;

    private AppConfig() {
        if (StringUtils.isNotEmpty(environmentPath)) {
            environmentConfig = Dom4jUtils.parserSimpleXML(environmentPath);
        } else {
            throw new RuntimeException("environmentPath is null");
        }
        System.out.println("AppConfig has loaded");
    }

    public static void setEnvironmentPath(String environmentPath) {
        AppConfig.environmentPath = environmentPath;
    }

    /**
     * 单例模式
     * @return
     */
    public static AppConfig getInstance() {
        if (appConfig == null) {
            appConfig = new AppConfig();
        }
        if (appConfig == null) {
            synchronized (AppConfig.class) {
                if (appConfig == null) {
                    appConfig = new AppConfig();
                }
            }
        }
        return appConfig;
    }

    /**
     * 使用泛型通过String类型的名字和类型获取指定类型的返回值
     *
     * @param name      配置名
     * @param classType 返回值的类型
     * @param <T>
     * @return 返回配置值
     */
    public <T> T getConfigByName(String name, Class<T> classType) {
        return environmentConfig.getObject(name, classType);
    }

    /**
     * 通过String类型的名字获取配置
     *
     * @param name 配置名
     * @return 返回配置值
     */
    public String getConfigByName(String name) {
        return getConfigByName(name, String.class);
    }

}
