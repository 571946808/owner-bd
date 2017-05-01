/*
MySQL Data Transfer
Source Host: localhost
Source Database: sun
Target Host: localhost
Target Database: sun
Date: 2017/5/1 18:50:58
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for sun_admin
-- ----------------------------
DROP TABLE IF EXISTS `sun_admin`;
CREATE TABLE `sun_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sun_comment
-- ----------------------------
DROP TABLE IF EXISTS `sun_comment`;
CREATE TABLE `sun_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `status` enum('公众号','物业') NOT NULL,
  `comment` varchar(50) NOT NULL,
  `creatTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sun_login
-- ----------------------------
DROP TABLE IF EXISTS `sun_login`;
CREATE TABLE `sun_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `telephone` varchar(20) NOT NULL DEFAULT '' COMMENT '用户注册手机号',
  `password` varchar(255) NOT NULL COMMENT '用户注册密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `ownername` varchar(50) DEFAULT NULL COMMENT '业主姓名',
  `gender` varchar(20) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sun_message
-- ----------------------------
DROP TABLE IF EXISTS `sun_message`;
CREATE TABLE `sun_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '业主ID',
  `user_id` int(10) DEFAULT NULL COMMENT '用户ID',
  `ownername` varchar(255) NOT NULL COMMENT '业主姓名',
  `city` varchar(255) NOT NULL COMMENT '居住房归属地',
  `residence_name` varchar(255) NOT NULL COMMENT '小区名',
  `unit` varchar(255) NOT NULL COMMENT '楼栋单元',
  `house_num` int(10) NOT NULL COMMENT '门牌号',
  `id_num` int(18) unsigned NOT NULL COMMENT '身份证号',
  `verifiedstate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '认证情况',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sun_messagelist
-- ----------------------------
DROP TABLE IF EXISTS `sun_messagelist`;
CREATE TABLE `sun_messagelist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `message` varchar(50) CHARACTER SET utf8 NOT NULL,
  `creatTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sun_money
-- ----------------------------
DROP TABLE IF EXISTS `sun_money`;
CREATE TABLE `sun_money` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `type` enum('物业费','水费','车位费','门禁卡','电梯卡','蓝牙卡') NOT NULL,
  `creatTime` datetime NOT NULL,
  `project` varchar(20) NOT NULL,
  `money` varchar(10) NOT NULL,
  `description` varchar(20) NOT NULL,
  `status` varchar(2) NOT NULL DEFAULT '0',
  `message` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sun_neighbor
-- ----------------------------
DROP TABLE IF EXISTS `sun_neighbor`;
CREATE TABLE `sun_neighbor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) DEFAULT NULL COMMENT '用户id',
  `creatTime` datetime DEFAULT NULL COMMENT '时间',
  `message` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '发布信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sun_repair
-- ----------------------------
DROP TABLE IF EXISTS `sun_repair`;
CREATE TABLE `sun_repair` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('公共设施报修','家庭维修') NOT NULL DEFAULT '家庭维修' COMMENT '维修报修',
  `linkman` varchar(8) NOT NULL COMMENT '联系人',
  `phone` varchar(11) NOT NULL COMMENT '联系电话',
  `address` varchar(50) NOT NULL COMMENT '地址',
  `ordertime` datetime NOT NULL COMMENT '预约时间',
  `description` varchar(50) NOT NULL COMMENT '描述',
  `img` varchar(255) DEFAULT 'NULL' COMMENT '图片描述',
  `remark` varchar(50) DEFAULT 'NULL' COMMENT '备注',
  `creatTime` datetime NOT NULL COMMENT '创建时间',
  `repairstate` enum('已完工','修理中','待受理') NOT NULL DEFAULT '待受理' COMMENT '修理状态',
  `worker` varchar(8) DEFAULT 'NULL' COMMENT '已派员工',
  `workerphone` varchar(11) DEFAULT 'NULL' COMMENT '员工电话',
  `userid` int(10) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sun_smscode
-- ----------------------------
DROP TABLE IF EXISTS `sun_smscode`;
CREATE TABLE `sun_smscode` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `code` int(4) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sun_staff
-- ----------------------------
DROP TABLE IF EXISTS `sun_staff`;
CREATE TABLE `sun_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工id',
  `number` varchar(10) NOT NULL DEFAULT '' COMMENT '员工编号',
  `name` varchar(8) NOT NULL DEFAULT '' COMMENT '姓名',
  `phone` varchar(12) NOT NULL DEFAULT '' COMMENT '电话',
  `gender` varchar(6) DEFAULT NULL COMMENT '性别',
  `age` int(10) DEFAULT NULL COMMENT '年龄',
  `eontime` date DEFAULT NULL COMMENT '任职时间',
  `state` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sun_visit
-- ----------------------------
DROP TABLE IF EXISTS `sun_visit`;
CREATE TABLE `sun_visit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `visitor` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `timestart` datetime DEFAULT NULL,
  `timeend` datetime DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `userid` int(10) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `sun_admin` VALUES ('1', 'panda', 'panda');
INSERT INTO `sun_comment` VALUES ('1', '1', '公众号', '吐槽公众号吐槽公众号吐槽公众号吐槽公众号吐槽公众号吐槽公众号', '2017-04-30 14:49:45');
INSERT INTO `sun_comment` VALUES ('2', '1', '物业', '物业服务很好！物业服务很好！物业服务很好！物业服务很好！物业服务很好！', '2017-04-30 15:00:01');
INSERT INTO `sun_login` VALUES ('1', '13125705705', '123123', 'æŽæµ·å†°', null, null, null, '2016-10-26 19:43:36', '2016-10-29 19:43:40', '0');
INSERT INTO `sun_login` VALUES ('2', '13755785290', '123456', null, null, null, null, '2016-11-16 18:21:47', '2016-11-16 18:21:51', '0');
INSERT INTO `sun_login` VALUES ('3', '12345678912', '123456', null, null, null, null, '2016-11-02 18:24:41', '2016-11-22 18:24:44', '0');
INSERT INTO `sun_login` VALUES ('4', '13125705705', '123123', null, null, null, null, '2016-10-26 19:43:36', '2016-10-29 19:43:40', '0');
INSERT INTO `sun_login` VALUES ('5', '13755785290', '123456', null, null, null, null, '2016-11-16 18:21:47', '2016-11-16 18:21:51', '0');
INSERT INTO `sun_login` VALUES ('6', '12345678912', '123456', null, null, null, null, '2016-11-02 18:24:41', '2016-11-22 18:24:44', '0');
INSERT INTO `sun_login` VALUES ('7', '13125705705', '123123', null, null, null, null, '2016-10-26 19:43:36', '2016-10-29 19:43:40', '0');
INSERT INTO `sun_login` VALUES ('8', '13755785290', '123456', null, null, null, null, '2016-11-16 18:21:47', '2016-11-16 18:21:51', '0');
INSERT INTO `sun_login` VALUES ('9', '12345678912', '123456', null, null, null, null, '2016-11-02 18:24:41', '2016-11-22 18:24:44', '0');
INSERT INTO `sun_login` VALUES ('10', '13125705705', '123123', null, null, null, null, '2016-10-26 19:43:36', '2016-10-29 19:43:40', '0');
INSERT INTO `sun_login` VALUES ('11', '13755785290', '123456', null, null, null, null, '2016-11-16 18:21:47', '2016-11-16 18:21:51', '0');
INSERT INTO `sun_login` VALUES ('12', '12345678912', '123456', null, null, null, null, '2016-11-02 18:24:41', '2016-11-22 18:24:44', '0');
INSERT INTO `sun_login` VALUES ('13', '13125705705', '123123', null, null, null, null, '2016-10-26 19:43:36', '2016-10-29 19:43:40', '0');
INSERT INTO `sun_login` VALUES ('14', '13755785290', '123456', null, null, null, null, '2016-11-16 18:21:47', '2016-11-16 18:21:51', '0');
INSERT INTO `sun_login` VALUES ('15', '12345678912', '123456', null, null, null, null, '2016-11-02 18:24:41', '2016-11-22 18:24:44', '0');
INSERT INTO `sun_login` VALUES ('16', '13125705705', '123123', null, null, null, null, '2016-10-26 19:43:36', '2016-10-29 19:43:40', '0');
INSERT INTO `sun_login` VALUES ('17', '13755785290', '123456', null, null, null, null, '2016-11-16 18:21:47', '2016-11-16 18:21:51', '0');
INSERT INTO `sun_login` VALUES ('18', '12345678912', '123456', null, null, null, null, '2016-11-02 18:24:41', '2016-11-22 18:24:44', '0');
INSERT INTO `sun_login` VALUES ('26', '15764375753', '123123', null, null, null, null, '2017-05-01 10:40:37', '2017-05-01 10:40:37', '0');
INSERT INTO `sun_message` VALUES ('1', '1', '陈馀', '天津', '三期高级公寓', '8栋2单元', '594', '2147483647', '0', '2016-11-01 18:25:36');
INSERT INTO `sun_message` VALUES ('2', '2', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:20:33');
INSERT INTO `sun_message` VALUES ('3', '3', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:23:02');
INSERT INTO `sun_message` VALUES ('4', '4', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:23:03');
INSERT INTO `sun_message` VALUES ('5', '5', '王小二', '深圳', '万科四季花城', '9栋4单元', '604', '2147483647', '0', '2016-11-01 18:08:47');
INSERT INTO `sun_message` VALUES ('6', '6', '陈馀', '天津', '万科真的很大', '8栋2单元', '594', '2147483647', '0', '2016-11-01 18:25:36');
INSERT INTO `sun_message` VALUES ('7', '7', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:20:33');
INSERT INTO `sun_message` VALUES ('8', '8', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:23:02');
INSERT INTO `sun_message` VALUES ('9', '9', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:23:03');
INSERT INTO `sun_message` VALUES ('10', '10', '王小二', '深圳', '万科四季花城', '9栋4单元', '604', '2147483647', '0', '2016-11-01 18:08:47');
INSERT INTO `sun_message` VALUES ('11', '11', '陈馀', '天津', '万科真的很大', '8栋2单元', '594', '2147483647', '0', '2016-11-01 18:25:36');
INSERT INTO `sun_message` VALUES ('12', '12', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:20:33');
INSERT INTO `sun_message` VALUES ('13', '13', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:23:02');
INSERT INTO `sun_message` VALUES ('14', '14', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:23:03');
INSERT INTO `sun_message` VALUES ('15', '15', '王小二', '深圳', '万科四季花城', '9栋4单元', '604', '2147483647', '0', '2016-11-01 18:08:47');
INSERT INTO `sun_message` VALUES ('41', '26', '李海冰', '北京市 北京市 东城区', '绿色家园', '8栋8楼', '888', '2147483647', '0', '2017-05-01 10:40:59');
INSERT INTO `sun_messagelist` VALUES ('1', '明天12点之后停水，连续三天，望大家周知！', '2017-04-10 16:33:33');
INSERT INTO `sun_messagelist` VALUES ('2', '明天12点之后停水，连续三天，望大家周知！', '2017-04-19 16:33:43');
INSERT INTO `sun_messagelist` VALUES ('3', '明天12点之后停水，连续三天，望大家周知！', '2017-04-11 16:33:51');
INSERT INTO `sun_messagelist` VALUES ('4', '明天12点之后停水，连续三天，望大家周知！', '2017-04-09 16:33:59');
INSERT INTO `sun_messagelist` VALUES ('5', '明天12点之后停水，连续三天，望大家周知！', '2017-04-04 16:34:05');
INSERT INTO `sun_money` VALUES ('1', '1', '物业费', '2017-05-08 16:00:39', '清洁费', '30元', '4月份之前交齐', '1', '咋这么多');
INSERT INTO `sun_money` VALUES ('2', '1', '水费', '2017-05-08 16:05:28', '水费', '10元', '4月份之前交齐', '0', '下次少点！');
INSERT INTO `sun_money` VALUES ('3', '1', '车位费', '2017-05-14 16:06:57', '车位费', '20元', '4月份之前交齐', '0', '咋这么多');
INSERT INTO `sun_money` VALUES ('4', '1', '门禁卡', '2017-05-08 16:07:34', '门禁卡', '20元', '4月份之前交齐', '0', '咋这么多');
INSERT INTO `sun_money` VALUES ('5', '1', '电梯卡', '2017-05-08 16:08:16', '电梯卡', '20元', '4月份之前交齐', '0', '咋这么多');
INSERT INTO `sun_money` VALUES ('6', '1', '蓝牙卡', '2017-05-16 16:12:38', '蓝牙卡', '20元', '4月份之前交齐', '0', '咋这么多');
INSERT INTO `sun_money` VALUES ('7', '1', '物业费', '2017-05-01 17:21:10', '清洁费', '30元', '4月份之前交齐', '0', '服务质量有待提高！');
INSERT INTO `sun_neighbor` VALUES ('1', '1', '2017-04-21 19:04:10', '肚子好饿啊，明天一定弄完！肚子好饿啊，明天一定弄完！肚子好饿啊，明天一定弄完！');
INSERT INTO `sun_neighbor` VALUES ('2', '2', '2017-04-11 23:49:58', '肚子好饿啊，明天一定弄完！肚子好饿啊，明天一定弄完！肚子好饿啊，明天一定弄完！');
INSERT INTO `sun_neighbor` VALUES ('3', '1', '2017-05-01 17:35:21', '咋这么贵太贵了');
INSERT INTO `sun_repair` VALUES ('1', '公共设施报修', 'A君', '13333333333', '银湖小区', '2017-02-19 22:26:39', '健身器材坏了', 'NULL', '', '2017-02-18 22:27:03', '待受理', 'NULL', 'NULL', '1');
INSERT INTO `sun_repair` VALUES ('4', '公共设施报修', '李海冰', '15764375753', '东北师范大学', '2017-04-27 15:26:38', '椅子坏了', 'NULL', 'NULL', '2017-04-27 15:26:38', '待受理', 'NULL', 'NULL', '2');
INSERT INTO `sun_repair` VALUES ('3', '家庭维修', '张相楠', '15764375707', '东北师范大学三期', '2017-04-27 15:06:13', '龙头出水了', 'NULL', 'NULL', '2017-04-27 15:06:13', '待受理', 'NULL', 'NULL', '2');
INSERT INTO `sun_repair` VALUES ('5', '家庭维修', '徐秀华', '15764370000', '四川', '2017-04-27 15:45:24', '锅坏了', 'NULL', 'NULL', '2017-04-27 15:45:24', '待受理', 'NULL', 'NULL', '1');
INSERT INTO `sun_repair` VALUES ('6', '公共设施报修', '徐秀华', '15764370000', '四川', '2017-04-27 15:46:39', '厕所灯坏了', 'NULL', 'NULL', '2017-04-27 15:46:39', '待受理', 'NULL', 'NULL', '1');
INSERT INTO `sun_smscode` VALUES ('3', '15764375753', '9350', '2017-05-01 09:27:57', '2017-05-01 10:40:08');
INSERT INTO `sun_staff` VALUES ('2', 'A002', '李四', '13000003211', '男', '30', '2016-11-08', '0');
INSERT INTO `sun_staff` VALUES ('3', 'A003', '王五', '13000003213', '男', '30', '2016-11-08', '0');
INSERT INTO `sun_staff` VALUES ('4', 'A004', '张三', '13000003212', '男', '30', '2016-11-08', '0');
INSERT INTO `sun_staff` VALUES ('5', 'A005', '李四', '130000032143', '男', '30', '2016-11-08', '0');
INSERT INTO `sun_staff` VALUES ('6', 'A006', '王五', '13000003232', '男', '30', '2016-11-08', '0');
INSERT INTO `sun_staff` VALUES ('7', 'A007', '张三', '13000003212', '男', '30', '2016-11-08', '0');
INSERT INTO `sun_staff` VALUES ('8', 'A008', '李四', '13000003212', '男', '30', '2016-11-08', '0');
INSERT INTO `sun_staff` VALUES ('9', 'A009', '王五', '13000003212', '男', '30', '2016-11-08', '0');
INSERT INTO `sun_staff` VALUES ('10', 'A010', '张三', '13000003212', '男', '30', '2016-11-08', '0');
INSERT INTO `sun_staff` VALUES ('11', 'A011', '李四', '13000003212', '男', '30', '2016-11-08', '0');
INSERT INTO `sun_staff` VALUES ('12', 'A012', '王五', '13000003212', '男', '30', '2016-11-08', '0');
INSERT INTO `sun_staff` VALUES ('13', 'A013', '张三', '13000003212', '男', '30', '2016-11-08', '0');
INSERT INTO `sun_staff` VALUES ('14', 'A014', '王五', '13000003212', '男', '30', '2016-11-08', '0');
INSERT INTO `sun_staff` VALUES ('15', 'A0016', 'A君', '18000000000', null, null, null, '0');
INSERT INTO `sun_staff` VALUES ('16', 'A0016', 'A君', '18000000000', 'male', '31', '2016-10-31', '0');
INSERT INTO `sun_visit` VALUES ('2', '张相楠', '15764375707', '2017-02-28 00:00:00', '2017-04-30 00:00:00', '开车', '1', '11111111111111111111');
INSERT INTO `sun_visit` VALUES ('1', '李海冰', '15764375753', '2017-04-11 11:07:58', '2017-04-19 11:08:02', '开车', '1', '22222222222222222222');
INSERT INTO `sun_visit` VALUES ('7', '圈', '13158886666', '2017-05-01 00:00:00', '2017-06-01 00:00:00', '呃呃', '1', 'ZLhoMc8BcRMMqyatdELO');
INSERT INTO `sun_visit` VALUES ('6', '徐秀华', '15764375777', '2017-04-30 00:00:00', '2017-04-30 00:00:00', '开车', '1', '3ZDvowtmxppUXIG1C5Z1');
