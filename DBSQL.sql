CREATE SCHEMA `ttstatisticsanalysissystemdb` ;
CREATE TABLE `tb_statistics` (
  `id` varchar(64) NOT NULL COMMENT 'id主键，使用uuid',
  `type_id` varchar(64) DEFAULT NULL COMMENT '类型id，使用uuid，是类型表的主键',
  `total` int(11) DEFAULT '0' COMMENT '总题目数',
  `Correct_number` int(11) DEFAULT '0' COMMENT '正确的题目数',
  `finish_date` datetime DEFAULT NULL COMMENT '完成题目的日期',
  `finish_time` INT(11) DEFAULT NULL COMMENT '完成题目使用的时间',
  `examination_name` varchar(200) DEFAULT NULL COMMENT '试卷名称，格式：年份+省份或者中国+考试类型（国考|省考）+试卷类型（申论|行测）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='统计表记录所有的用户输入的信息';

CREATE TABLE `tb_type` (
  `id` varchar(64) NOT NULL,
  `level` int(11) DEFAULT NULL COMMENT '题目类型的级别',
  `name` varchar(45) DEFAULT NULL COMMENT '类型名称',
  `parent_id` varchar(45) DEFAULT NULL COMMENT '父类型id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='题目类型表';

INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab434', '1', '言语理解与表达', '4b3a25958f924f9fbb1985401a3ab434');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab435', '2', '阅读理解', '4b3a25958f924f9fbb1985401a3ab434');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab436', '3', '中心理解', '4b3a25958f924f9fbb1985401a3ab435');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab437', '3', '细节判断', '4b3a25958f924f9fbb1985401a3ab435');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab438', '3', '词语理解', '4b3a25958f924f9fbb1985401a3ab435');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab439', '2', '逻辑填空', '4b3a25958f924f9fbb1985401a3ab434');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab440', '3', '实词填空', '4b3a25958f924f9fbb1985401a3ab439');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab441', '3', '虚词填空', '4b3a25958f924f9fbb1985401a3ab439');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab442', '3', '成语填空', '4b3a25958f924f9fbb1985401a3ab439');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab443', '3', '混搭填空', '4b3a25958f924f9fbb1985401a3ab439');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab444', '2', '篇章阅读', '4b3a25958f924f9fbb1985401a3ab434');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab445', '3', '中心理解', '4b3a25958f924f9fbb1985401a3ab444');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab446', '3', '细节判断', '4b3a25958f924f9fbb1985401a3ab444');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab447', '3', '词语理解', '4b3a25958f924f9fbb1985401a3ab444');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab448', '3', '标题填入', '4b3a25958f924f9fbb1985401a3ab444');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab449', '2', '语句表达', '4b3a25958f924f9fbb1985401a3ab434');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab450', '3', '语句排序', '4b3a25958f924f9fbb1985401a3ab449');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab451', '3', '语句填空', '4b3a25958f924f9fbb1985401a3ab449');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab452', '3', '接语选择', '4b3a25958f924f9fbb1985401a3ab449');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab453', '2', '句子辨析', '4b3a25958f924f9fbb1985401a3ab434');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab454', '1', '数量关系', '4b3a25958f924f9fbb1985401a3ab454');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab455', '2', '数字推理', '4b3a25958f924f9fbb1985401a3ab454');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab456', '3', '基础数列', '4b3a25958f924f9fbb1985401a3ab455');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab457', '3', '多级数列', '4b3a25958f924f9fbb1985401a3ab455');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab458', '3', '幂次数列', '4b3a25958f924f9fbb1985401a3ab455');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab459', '3', '分数数列', '4b3a25958f924f9fbb1985401a3ab455');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab460', '3', '递推数列', '4b3a25958f924f9fbb1985401a3ab455');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab461', '3', '多重数列', '4b3a25958f924f9fbb1985401a3ab455');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab462', '3', '机械划分', '4b3a25958f924f9fbb1985401a3ab455');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab463', '3', '做和做积数列', '4b3a25958f924f9fbb1985401a3ab455');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab464', '3', '因素分解数列', '4b3a25958f924f9fbb1985401a3ab455');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab465', '3', '图形数阵', '4b3a25958f924f9fbb1985401a3ab455');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab466', '3', '其他', '4b3a25958f924f9fbb1985401a3ab455');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab467', '2', '数学运算', '4b3a25958f924f9fbb1985401a3ab454');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab468', '3', '计算问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab469', '3', '多位数问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab470', '3', '平均数问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab471', '3', '工程问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab472', '3', '浓度问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab473', '3', '最值问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab474', '3', '计数模型问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab475', '3', '年龄问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab476', '3', '牛吃草问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab477', '3', '周期问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab478', '3', '倍数约数问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab479', '3', '分段计算问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab480', '3', '和差倍比问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab481', '3', '数列问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab482', '3', '行程问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab483', '3', '几何问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab484', '3', '容斥原理问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab485', '3', '排列组合问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab486', '3', '概率问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab487', '3', '经济利润问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab488', '3', '函数最值问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab489', '3', '不定方程问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab490', '3', '余数与同余问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab491', '3', '星期日期问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab492', '3', '钟表问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab493', '3', '统筹规划问题', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab494', '3', '其他', '4b3a25958f924f9fbb1985401a3ab467');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab495', '1', '判断推理', '4b3a25958f924f9fbb1985401a3ab495');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab496', '2', '图形推理', '4b3a25958f924f9fbb1985401a3ab495');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab497', '3', '位置关系', '4b3a25958f924f9fbb1985401a3ab496');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab498', '4', '平移', '4b3a25958f924f9fbb1985401a3ab497');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab499', '4', '旋转', '4b3a25958f924f9fbb1985401a3ab497');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab500', '4', '翻转', '4b3a25958f924f9fbb1985401a3ab497');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab501', '3', '样式规律', '4b3a25958f924f9fbb1985401a3ab496');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab502', '4', '遍历', '4b3a25958f924f9fbb1985401a3ab501');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab503', '4', '运算', '4b3a25958f924f9fbb1985401a3ab501');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab504', '4', '对称性', '4b3a25958f924f9fbb1985401a3ab501');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab505', '4', '曲直性', '4b3a25958f924f9fbb1985401a3ab501');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab506', '4', '封闭性', '4b3a25958f924f9fbb1985401a3ab501');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab507', '3', '数量规律', '4b3a25958f924f9fbb1985401a3ab496');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab508', '4', '点', '4b3a25958f924f9fbb1985401a3ab507');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab509', '4', '线', '4b3a25958f924f9fbb1985401a3ab507');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab510', '4', '角', '4b3a25958f924f9fbb1985401a3ab507');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab511', '4', '面', '4b3a25958f924f9fbb1985401a3ab507');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab512', '4', '素', '4b3a25958f924f9fbb1985401a3ab507');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab513', '3', '特殊规律', '4b3a25958f924f9fbb1985401a3ab496');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab514', '4', '图形拼接', '4b3a25958f924f9fbb1985401a3ab513');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab515', '4', '图形间关系', '4b3a25958f924f9fbb1985401a3ab513');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab516', '4', '平面拼合', '4b3a25958f924f9fbb1985401a3ab513');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab517', '4', '功能元素', '4b3a25958f924f9fbb1985401a3ab513');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab518', '3', '空间重构', '4b3a25958f924f9fbb1985401a3ab496');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab519', '3', '实际意义', '4b3a25958f924f9fbb1985401a3ab496');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab520', '3', '其他', '4b3a25958f924f9fbb1985401a3ab496');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab521', '2', '定义判断', '4b3a25958f924f9fbb1985401a3ab495');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab522', '3', '单定义', '4b3a25958f924f9fbb1985401a3ab521');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab523', '3', '多定义', '4b3a25958f924f9fbb1985401a3ab521');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab524', '2', '逻辑判断', '4b3a25958f924f9fbb1985401a3ab495');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab525', '3', '翻译推理', '4b3a25958f924f9fbb1985401a3ab524');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab526', '3', '真假推理', '4b3a25958f924f9fbb1985401a3ab524');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab527', '3', '组合排列', '4b3a25958f924f9fbb1985401a3ab524');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab528', '3', '加强题型', '4b3a25958f924f9fbb1985401a3ab524');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab529', '3', '削弱题型', '4b3a25958f924f9fbb1985401a3ab524');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab530', '3', '日常结论', '4b3a25958f924f9fbb1985401a3ab524');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab531', '3', '其他', '4b3a25958f924f9fbb1985401a3ab524');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab532', '2', '类比推理', '4b3a25958f924f9fbb1985401a3ab495');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab533', '3', '语义关系', '4b3a25958f924f9fbb1985401a3ab532');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab534', '4', '近义关系', '4b3a25958f924f9fbb1985401a3ab533');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab535', '4', '反义关系', '4b3a25958f924f9fbb1985401a3ab533');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab536', '4', '比喻象征', '4b3a25958f924f9fbb1985401a3ab533');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab537', '3', '语法关系', '4b3a25958f924f9fbb1985401a3ab532');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab538', '3', '逻辑关系', '4b3a25958f924f9fbb1985401a3ab532');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab539', '4', '并列关系', '4b3a25958f924f9fbb1985401a3ab538');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab540', '4', '包容关系', '4b3a25958f924f9fbb1985401a3ab538');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab541', '4', '对应关系', '4b3a25958f924f9fbb1985401a3ab538');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab542', '4', '全同关系', '4b3a25958f924f9fbb1985401a3ab538');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab543', '4', '交叉关系', '4b3a25958f924f9fbb1985401a3ab538');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab544', '3', '江苏特色', '4b3a25958f924f9fbb1985401a3ab532');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab545', '3', '其他', '4b3a25958f924f9fbb1985401a3ab532');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab546', '1', '资料分析', '4b3a25958f924f9fbb1985401a3ab546');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab547', '2', '简单计算', '4b3a25958f924f9fbb1985401a3ab546');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab548', '3', '直接找数', '4b3a25958f924f9fbb1985401a3ab547');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab549', '3', '简单加减计算', '4b3a25958f924f9fbb1985401a3ab547');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab550', '3', '排序类', '4b3a25958f924f9fbb1985401a3ab547');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab551', '2', '比重问题', '4b3a25958f924f9fbb1985401a3ab546');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab552', '3', '现期比重', '4b3a25958f924f9fbb1985401a3ab551');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab553', '3', '两期比重', '4b3a25958f924f9fbb1985401a3ab551');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab554', '3', '混合比重', '4b3a25958f924f9fbb1985401a3ab551');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab555', '2', '平均数问题', '4b3a25958f924f9fbb1985401a3ab546');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab556', '3', '基期平均数', '4b3a25958f924f9fbb1985401a3ab555');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab557', '3', '现期平均数', '4b3a25958f924f9fbb1985401a3ab555');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab558', '3', '平均数的增长率', '4b3a25958f924f9fbb1985401a3ab555');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab559', '3', '平均数的增长量', '4b3a25958f924f9fbb1985401a3ab555');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab560', '3', '两期平均数比较', '4b3a25958f924f9fbb1985401a3ab555');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab561', '2', '倍数与比值相关', '4b3a25958f924f9fbb1985401a3ab546');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab562', '3', '比值计算', '4b3a25958f924f9fbb1985401a3ab561');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab563', '3', '基期倍数', '4b3a25958f924f9fbb1985401a3ab561');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab564', '3', '现期倍数', '4b3a25958f924f9fbb1985401a3ab561');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab565', '3', '比值比较', '4b3a25958f924f9fbb1985401a3ab561');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab566', '3', '倍数比较', '4b3a25958f924f9fbb1985401a3ab561');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab567', '3', '综合分析', '4b3a25958f924f9fbb1985401a3ab561');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab568', '2', '基期与现期', '4b3a25958f924f9fbb1985401a3ab546');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab569', '3', '基期计算', '4b3a25958f924f9fbb1985401a3ab568');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab570', '3', '基期比较', '4b3a25958f924f9fbb1985401a3ab568');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab571', '3', '间隔基期', '4b3a25958f924f9fbb1985401a3ab568');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab572', '3', '基期和差', '4b3a25958f924f9fbb1985401a3ab568');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab573', '3', '现期计算', '4b3a25958f924f9fbb1985401a3ab568');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab574', '3', '现期追赶', '4b3a25958f924f9fbb1985401a3ab568');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab575', '2', '增长率', '4b3a25958f924f9fbb1985401a3ab546');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab576', '3', '一般增长率', '4b3a25958f924f9fbb1985401a3ab575');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab577', '3', '混合增长率', '4b3a25958f924f9fbb1985401a3ab575');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab578', '3', '间隔增长率', '4b3a25958f924f9fbb1985401a3ab575');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab579', '3', '年均增长率', '4b3a25958f924f9fbb1985401a3ab575');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab580', '2', '增长量', '4b3a25958f924f9fbb1985401a3ab546');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab581', '3', '增长量计算', '4b3a25958f924f9fbb1985401a3ab580');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab582', '3', '增长量比较', '4b3a25958f924f9fbb1985401a3ab580');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab583', '3', '间隔增长量', '4b3a25958f924f9fbb1985401a3ab580');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab584', '3', '年均增长量', '4b3a25958f924f9fbb1985401a3ab580');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab585', '1', '常识判断', '4b3a25958f924f9fbb1985401a3ab585');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab586', '2', '政治', '4b3a25958f924f9fbb1985401a3ab585');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab587', '3', '马克思主义', '4b3a25958f924f9fbb1985401a3ab586');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab588', '3', '毛泽东思想', '4b3a25958f924f9fbb1985401a3ab586');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab589', '3', '邓小平理论', '4b3a25958f924f9fbb1985401a3ab586');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab590', '3', '科学发展观', '4b3a25958f924f9fbb1985401a3ab586');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab591', '3', '时政', '4b3a25958f924f9fbb1985401a3ab586');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab592', '2', '经济', '4b3a25958f924f9fbb1985401a3ab585');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab593', '3', '市场', '4b3a25958f924f9fbb1985401a3ab592');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab594', '3', '宏观经济与调控政策', '4b3a25958f924f9fbb1985401a3ab592');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab595', '3', '国际经济及组织', '4b3a25958f924f9fbb1985401a3ab592');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab596', '2', '科技', '4b3a25958f924f9fbb1985401a3ab585');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab597', '3', '物理', '4b3a25958f924f9fbb1985401a3ab596');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab598', '3', '生物', '4b3a25958f924f9fbb1985401a3ab596');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab599', '3', '科技理论与成就', '4b3a25958f924f9fbb1985401a3ab596');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab600', '3', '生活常识', '4b3a25958f924f9fbb1985401a3ab596');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab601', '3', '其他', '4b3a25958f924f9fbb1985401a3ab596');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab602', '2', '人文', '4b3a25958f924f9fbb1985401a3ab585');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab603', '3', '中国历史', '4b3a25958f924f9fbb1985401a3ab602');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab604', '3', '世界历史', '4b3a25958f924f9fbb1985401a3ab602');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab605', '3', '文学常识', '4b3a25958f924f9fbb1985401a3ab602');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab606', '3', '文化常识', '4b3a25958f924f9fbb1985401a3ab602');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab607', '2', '地理国情', '4b3a25958f924f9fbb1985401a3ab585');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab608', '3', '国情社情', '4b3a25958f924f9fbb1985401a3ab607');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab609', '3', '自然常识', '4b3a25958f924f9fbb1985401a3ab607');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab610', '3', '环境常识', '4b3a25958f924f9fbb1985401a3ab607');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab611', '2', '法律', '4b3a25958f924f9fbb1985401a3ab585');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab612', '3', '法理学', '4b3a25958f924f9fbb1985401a3ab611');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab613', '3', '宪法', '4b3a25958f924f9fbb1985401a3ab611');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab614', '3', '行政法', '4b3a25958f924f9fbb1985401a3ab611');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab615', '3', '民法', '4b3a25958f924f9fbb1985401a3ab611');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab616', '3', '刑法', '4b3a25958f924f9fbb1985401a3ab611');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab617', '3', '刑事诉讼法', '4b3a25958f924f9fbb1985401a3ab611');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab618', '3', '公务员法', '4b3a25958f924f9fbb1985401a3ab611');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab619', '3', '劳动法', '4b3a25958f924f9fbb1985401a3ab611');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab620', '3', '政府信息公开条例', '4b3a25958f924f9fbb1985401a3ab611');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab621', '3', '其他法律法规', '4b3a25958f924f9fbb1985401a3ab611');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab622', '3', '民事诉讼法', '4b3a25958f924f9fbb1985401a3ab611');
INSERT INTO `ttstatisticsanalysissystemdb`.`tb_type` (`id`, `level`, `name`, `parent_id`) VALUES ('4b3a25958f924f9fbb1985401a3ab623', '3', '经济法', '4b3a25958f924f9fbb1985401a3ab611');
