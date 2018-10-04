package com.gs.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.gs.dao.BaseMapper;
import com.gs.model.Statistics;
import com.gs.model.Type;
import com.gs.service.BaseService;
import com.gs.utils.AlgorithmUtils;
import com.gs.utils.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

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
        double value = saveTwoNumber((right * 1.0) / total) * 100;
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

    @Override
    public JSONObject getLineBarOptions(JSONObject data) {
        Type type = new Type();
        String typeId = data.getString("typeId");
        if (!data.containsKey("typeId") || StringUtils.isEmpty(typeId)) {
            return null;
        }

        Integer maxTypeLevel = null;
        List<String> type_ids = null;
        List<JSONObject> lineBarDate = null;
        if (typeId.equals("0")) {
            lineBarDate = baseMapper.getAllCountPercentLineBar();
            type.setLevel(0);
            type.setId("0");
            type.setName("总计");
            type.setParentId("0");
        } else {
            type = baseMapper.getTypeById(typeId);
            maxTypeLevel = baseMapper.getMaxTypeLevel(data);
            type_ids = getChildTypeId(type, maxTypeLevel);
            lineBarDate = baseMapper.getLineBarDate(type_ids);
        }

        JSONObject options = new JSONObject();
        JSONObject xAxis = new JSONObject();
        JSONObject yAxis = new JSONObject();
        yAxis.put("type", "value");
        List<String> xAxis_data = new ArrayList<>();
        xAxis.put("type", "category");
        List<JSONObject> series = new ArrayList<>();
        JSONObject series_item = new JSONObject();
        List<Double> series_item_data = new ArrayList<>();
        series_item.put("type", "line");
        series_item.put("smooth", true);
        for (JSONObject item : lineBarDate) {
            Integer right = item.getInteger("right");
            Integer total = item.getInteger("total");
            String date = item.getString("finish_date");
            date = DateUtils.formatDateStr(date, "yyyy-MM-dd hh:mm:ss", "yyyy-MM-dd");
            double percent = saveTwoNumber((right * 1.0) / total);
            xAxis_data.add(date);
            series_item_data.add(percent);
        }
        xAxis.put("data", xAxis_data);
        series_item.put("data", series_item_data);
        series.add(series_item);
        options.put("xAxis", xAxis);
        options.put("yAxis", yAxis);
        options.put("series", series);
        type.setName(type.getName() + " 趋势图");
        options.put("currentType", type);
        return options;
    }

    @Override
    public List<String> getAllExaminationName(JSONObject data) {
        List<String> names = baseMapper.getAllExaminationName(data);
        return names;
    }

    @Override
    public JSONObject getAnalyzeData(JSONObject data) {
        List<JSONObject> tableInfo = new ArrayList<>();
        Integer maxTypeLevel = baseMapper.getMaxTypeLevel(new JSONObject());
        String suggest = "";
        JSONObject result = new JSONObject();
        List<String> typeIds = new ArrayList<>();
        JSONObject typeIdParams = new JSONObject();
        typeIdParams.put("level", "1");
        List<Type> types = getNextTypes(typeIdParams);
        String examination_name = data.getString("examination_name");
        int[] weight = new int[types.size()];//放时间
        double[] value = new double[types.size()];//放得分
        double[] score_rates = new double[types.size()];//放得分率
        int maxWeight = 120;//一张试卷的总时间
        Integer count_number = 0;
        for (int index = 0; index < types.size(); index++) {
            Type type = types.get(index);
            double score_per_question = 0;
            switch (type.getName()) {
                case "言语理解与表达":
                    score_per_question = 0.7;
                    break;
                case "数量关系":
                    score_per_question = 1.0;
                    break;
                case "判断推理":
                    score_per_question = 0.7;
                    break;
                case "资料分析":
                    score_per_question = 1.0;
                    break;
                case "常识判断":
                    score_per_question = 0.7;
                    break;
            }
            JSONObject tmpResult = new JSONObject();
            typeIds = getChildTypeId(type, maxTypeLevel);
            JSONObject tableParams = new JSONObject();
            tableParams.put("typeIds", typeIds);
            JSONObject tableInfoData = null;
            if (!examination_name.equals("全部")) {
                tableParams.put("examination_name", examination_name);
            }
            tableInfoData = baseMapper.getTableInfoData(tableParams);
            if (tableInfoData == null) {
                types.remove(index);
                index--;
                continue;
            }
            Integer right = tableInfoData.getInteger("correct_number");
            Integer total = tableInfoData.getInteger("total");
            Integer time = tableInfoData.getInteger("finish_time");
            if (tableInfoData.containsKey("count_number")) {
                count_number = tableInfoData.getInteger("count_number");
                maxWeight = 120 * count_number;
            }
            tmpResult.put("type_name", type.getName());//类型名
            tmpResult.put("right", right);//正确题数
            tmpResult.put("total", total);//总题数
            tmpResult.put("score_per_question", score_per_question);//每题分值
            tmpResult.put("time", time);//使用时间
            tmpResult.put("right_percent", (saveTwoNumber((right * 1.0 / total) * 100)) + "%");//正确率
            tmpResult.put("score", saveTwoNumber(right * score_per_question));//得分
            double score_rate = saveTwoNumber((right * score_per_question) / time);
            tmpResult.put("score_rate", score_rate);//每分钟得分
            tableInfo.add(tmpResult);
            weight[index] = (time);
            score_rates[index] = score_rate;
            value[index] = (right * score_per_question);
        }
        JSONObject resultJSON = AlgorithmUtils.bestResult(weight, value, maxWeight);
        List<Integer> resultList = (List<Integer>) resultJSON.get("resultList");//获取推荐做题的顺序
        Double max_score = resultJSON.getDouble("max_score");//获取最大可以获取的分数
        List<JSONObject> sortJson = new ArrayList<>();
        for (Integer type_index : resultList) {//拼装排序数据
            Type currentType = types.get(type_index - 1);
            JSONObject tmp = new JSONObject();
            tmp.put("name", currentType.getName());
            tmp.put("score_rates", score_rates[type_index - 1]);
            sortJson.add(tmp);
        }
        Collections.sort(sortJson, new Comparator<JSONObject>() {//排序
            @Override
            public int compare(JSONObject o1, JSONObject o2) {
                if (o1.getDouble("score_rates") < o2.getDouble("score_rates")) {
                    return 1;
                } else if (o1.getDouble("score_rates") > o2.getDouble("score_rates")) {
                    return -1;
                } else {
                    return 0;
                }
            }
        });
        for (JSONObject jsonObject : sortJson) {
            suggest += jsonObject.getString("name") + ",";
        }
        if (StringUtils.isNotEmpty(suggest)) {
            suggest = suggest.substring(0, suggest.length() - 1);
        }
        result.put("tableInfo", tableInfo);
        result.put("suggest", suggest);
        result.put("max_score", saveTwoNumber(max_score/count_number));
        return result;
    }

    /**
     * 保存两位小数
     *
     * @param number
     * @return
     */
    public double saveTwoNumber(double number) {
        String percentStr = number + "";
        if (percentStr.length() > 5) {
            percentStr = percentStr.substring(0, Integer.valueOf(percentStr.indexOf(".")) + 2);
            number = Double.valueOf(percentStr);
        }
        return number;
    }
}
