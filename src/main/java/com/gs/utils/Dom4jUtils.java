package com.gs.utils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.File;
import java.util.List;

public class Dom4jUtils {

    /**
     * 解析xml节点，返回json
     *
     * @param ele
     * @return 解析JSON结果
     */
    public static JSONObject parserNode(Element ele) {
        JSONObject result = new JSONObject();
        result.put(ele.getName(), ele.getText().trim());
        //从Users根节点开始遍历，像【属性=值】的形式存为一个Attribute对象存储在List集合中
        List<Attribute> attrList = ele.attributes();
        JSONArray attrJSONList = new JSONArray();
        for (Attribute attr : attrList) {
            //每循环一次，解析此节点的一个【属性=值】
            JSONObject attrJSON = new JSONObject();
            attrJSON.put(attr.getName(), attr.getValue());
        }
        result.put("attrs", attrJSONList);
        List<Element> eleList = ele.elements();
        //递归遍历父节点下的所有子节点
        for (Element e : eleList) {
            JSONObject childJSON = parserNode(e);
            result.put(e.getName(), childJSON);
        }
        return result;
    }


    /**
     * 解析只有一个根节点的xml节点
     *
     * @param ele
     * @return
     */
    public static JSONObject parserSimpleNode(Element ele) {
        JSONObject result = new JSONObject();
        List<Element> eleList = ele.elements();
        //递归遍历根节点下的所有子节点
        for (Element e : eleList) {
            result.put(e.getName(), e.getTextTrim());
        }
        return result;
    }

    /**
     * 解析只有一个根节点的xml
     *
     * @param xmlPath
     * @return
     */
    public static JSONObject parserSimpleXML(String xmlPath) {
        JSONObject result = new JSONObject();
        SAXReader saxReader = new SAXReader();
        try {
            Document document = saxReader.read(new File(xmlPath));
            result = parserSimpleNode(document.getRootElement());
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 根据xml路径解析xml
     *
     * @param xmlPath xml路径
     * @return 解析JSON结果
     */
    public static JSONObject parserXML(String xmlPath) {
        JSONObject result = new JSONObject();
        SAXReader saxReader = new SAXReader();
        try {
            Document document = saxReader.read(new File(xmlPath));
            result = parserNode(document.getRootElement());
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return result;
    }
}
