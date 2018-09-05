package com.gs.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.gs.dao.BaseMapper;
import com.gs.model.Type;
import com.gs.service.BaseService;
import com.gs.utils.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service(value = "baseService")
@Transactional(rollbackFor = Exception.class)
public class BaseServiceImpl implements BaseService {
    private static final Logger logger = LogManager.getLogger(BaseServiceImpl.class);
    @Autowired
    private BaseMapper baseMapper;

    /**
     * 添加新的统计信息
     *
     * @param data
     * @return
     */
    @Override
    public JSONObject addNewData(JSONObject data) {
        JSONObject result = new JSONObject();
        JSONObject param = new JSONObject();
        param.put("id", UUID.randomUUID().toString().replaceAll("-", ""));
        param.put("type_id", data.getString("type_id"));
        param.put("total", data.getInteger("total_number"));
        param.put("finish_data", DateUtils.formatDateToStr(data.getDate("finish_data"), "yyyy-MM-dd"));
        param.put("finish_time", data.getInteger("finish_time"));
        param.put("Correct_number", data.getInteger("right_number"));
        param.put("examination_name", data.getString("examination_name"));
        logger.info("param:" + param.toJSONString());
        result.put("success", baseMapper.addNewData(param));
        return result;
    }

    @Override
    public List<Type> getNextTypes(JSONObject data) {
        List<Type> types = baseMapper.getNextTypes(data);
        return types;
    }

    @Override
    public Integer getMaxTypeLevel(JSONObject data) {
        return baseMapper.getMaxTypeLevel(data);
    }

    @Override
    public JSONObject getTypeMap(JSONObject data) {
        JSONObject options = new JSONObject();
        JSONObject legend = new JSONObject();
        JSONObject textStyle = new JSONObject();
        textStyle.put("color", "#ffffff");
        textStyle.put("fontSize", "18");
        legend.put("textStyle", textStyle);
        List<String> legend_data = new ArrayList<>();
        List<JSONObject> series = new ArrayList<>();
        JSONObject series_item = new JSONObject();
        JSONObject label = new JSONObject();
        JSONObject normal = new JSONObject();
        List<JSONObject> series_item_data = new ArrayList<>();

        JSONObject root_node = new JSONObject();
        root_node.put("id", "0");
        float rootValue = baseMapper.getAllCountPercent();
        String valueStr = rootValue + "";
        if (valueStr.length() > 5) {
            valueStr = valueStr.substring(0, Integer.valueOf(valueStr.indexOf(".")) + 2);
            rootValue = Float.valueOf(valueStr);
        }
        root_node.put("value", rootValue);
        root_node.put("name", "总计 : " + rootValue + "%");
//        rootValue = (rootValue / 100) * 30;
        root_node.put("symbolSize", (rootValue < 10 ? 10 : rootValue));//节点正确率
        root_node.put("category", 0);

        label.put("show", true);//是否展示标题
        label.put("textStyle", textStyle);
        label.put("position", "inside");
        root_node.put("label", label);
        series_item_data.add(root_node);

        List<JSONObject> categories = new ArrayList<>();
        JSONObject force = new JSONObject();
        List<JSONObject> edges = new ArrayList<>();


        legend_data.add("总计");
        JSONObject categories_item = new JSONObject();
        categories_item.put("name", "总计");
        categories.add(categories_item);

        Integer maxTypeLevel = baseMapper.getMaxTypeLevel(data);
        for (Integer level = 1; level <= maxTypeLevel; level++) {
            String legendName = "第 " + level + " 类";
            legend_data.add(legendName);
            categories_item = new JSONObject();
            categories_item.put("name", legendName);
            categories.add(categories_item);
        }
        JSONObject nodeParam = new JSONObject();
        List<Type> allTypes = baseMapper.getNextTypes(nodeParam);
        for (Type type : allTypes) {
            JSONObject node = createNode(type, maxTypeLevel);
            if (node == null) {
                continue;
            }
            series_item_data.add(node);
            JSONObject edges_data_item = new JSONObject();
            if (type.getLevel() == 1) {
                edges_data_item.put("source", "0");
            } else {
                edges_data_item.put("source", type.getParentId());
            }
            edges_data_item.put("target", type.getId());
            edges.add(edges_data_item);
        }
        series_item.put("type", "graph");
        series_item.put("layout", "force");
        series_item.put("animation", false);
//        normal.put("position", "right");
//        normal.put("formatter", "{b}");
//        label.put("normal", normal);
//        series_item.put("label", label);
        series_item.put("draggable", true);
        series_item.put("data", series_item_data);
        series_item.put("categories", categories);
        force.put("edgeLength", 5);
        force.put("repulsion", 10000);//斥力因子
        force.put("initLayout", "circular");
        force.put("gravity", 0.2);//引力因子
        series_item.put("force", force);
        series_item.put("roam", true);//开启缩放
        series_item.put("focusNodeAdjacency", true);//开启缩放
        series_item.put("edges", edges);
        series.add(series_item);
        legend.put("data", legend_data);
        options.put("legend", legend);
        options.put("series", series);

//        JSONObject tooltip = new JSONObject();
//        tooltip.put("show", true);
//        tooltip.put("trigger", "item");
//        tooltip.put("alwaysShowContent", true);
//        tooltip.put("formatter", "{b}:{c}%");
//        options.put("tooltip", tooltip);
        return options;
    }

    /**
     * 建立一个节点
     *
     * @param type
     * @return
     */
    private JSONObject createNode(Type type, Integer maxTypeLevel) {
        JSONObject node = new JSONObject();
        Integer total = 0;
        Integer right = 0;
        //获取所有子节点的值
        List<String> type_ids = getChildTypeId(type, maxTypeLevel);
        if (type_ids != null && type_ids.size() > 0) {
            JSONObject countResult = baseMapper.countByType(type_ids);
            if (countResult != null) {
                total += countResult.getInteger("total");
                right += countResult.getInteger("right");
            }
        }
        if (total == 0) {
            total = 1;
            return null;
        }
        node.put("id", type.getId());
        node.put("level", type.getLevel());
        double value = ((right * 1.0) / total) * 100;
        String valueStr = value + "";
        if (valueStr.length() > 5) {
            valueStr = valueStr.substring(0, Integer.valueOf(valueStr.indexOf(".")) + 2);
            value = Double.valueOf(valueStr);
        }
        node.put("name", type.getName() + "  :  " + value + "%");//节点名称
        node.put("value", value);//节点正确率
//        double size = (value / 100) * 30;
        double size = value;
        if (size < 10) {
            size = 10;
        }
        node.put("symbolSize", size);//节点正确率
        JSONObject label = new JSONObject();
        label.put("show", true);//是否展示标题
        label.put("position", "inside");

        JSONObject textStyle = new JSONObject();
        textStyle.put("color", "#ffffff");
        textStyle.put("fontSize", "18");
        label.put("textStyle", textStyle);
        node.put("label", label);
        node.put("category", type.getLevel());//节点对应的分组

        return node;
    }

    /**
     * 递归获取指定类型的全部下属类型
     *
     * @param type
     * @param maxTypeLevel
     * @return
     */
    private List<String> getChildTypeId(Type type, Integer maxTypeLevel) {
        List<String> result = new ArrayList<>();
        JSONObject param = new JSONObject();
        param.put("parent_id", type.getId());
        List<Type> types = baseMapper.getNextTypes(param);
        result.add(type.getId());
        for (Type child_type : types) {
            if (child_type.getLevel() < maxTypeLevel && !StringUtils.equals(child_type.getId(), type.getId())) {
                result.addAll(getChildTypeId(child_type, maxTypeLevel));
            }
        }
        return result;
    }
}
