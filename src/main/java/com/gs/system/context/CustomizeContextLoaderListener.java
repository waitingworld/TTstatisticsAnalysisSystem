package com.gs.system.context;

import com.gs.system.AppConfig.AppConfig;
import org.springframework.web.context.ContextLoaderListener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import java.io.File;

public class CustomizeContextLoaderListener extends ContextLoaderListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {
        System.out.println("======>>>>>>>>>程序启动<<<<<<<<<======");

        ServletContext servletContext = event.getServletContext();
        String environment = servletContext.getInitParameter("environment");
        String environmentPath = servletContext.getRealPath("/") + "WEB-INF" + File.separator + "classes" +
                File.separator + "config" + File.separator + environment + File.separator + "environment.xml";
        AppConfig.setEnvironmentPath(environmentPath);
        //init AppConfig 初始化程序全局变量
        System.out.println(AppConfig.getInstance().getConfigByName("test"));
        super.contextInitialized(event);
    }

}
