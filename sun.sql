/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : sun

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-02-18 22:28:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sun_admin`
-- ----------------------------
DROP TABLE IF EXISTS `sun_admin`;
CREATE TABLE `sun_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sun_admin
-- ----------------------------
INSERT INTO `sun_admin` VALUES ('1', 'panda', 'panda');

-- ----------------------------
-- Table structure for `sun_login`
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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sun_login
-- ----------------------------
INSERT INTO `sun_login` VALUES ('1', '13125705705', '123123', null, null, null, null, '2016-10-26 19:43:36', '2016-10-29 19:43:40', '0');
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

-- ----------------------------
-- Table structure for `sun_message`
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
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sun_message
-- ----------------------------
INSERT INTO `sun_message` VALUES ('1', '3', '陈馀', '天津', '万科真的很大', '8栋2单元', '594', '2147483647', '0', '2016-11-01 18:25:36');
INSERT INTO `sun_message` VALUES ('2', '1', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:20:33');
INSERT INTO `sun_message` VALUES ('3', '2', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:23:02');
INSERT INTO `sun_message` VALUES ('4', '2', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:23:03');
INSERT INTO `sun_message` VALUES ('5', '1', '王小二', '深圳', '万科四季花城', '9栋4单元', '604', '2147483647', '0', '2016-11-01 18:08:47');
INSERT INTO `sun_message` VALUES ('6', '3', '陈馀', '天津', '万科真的很大', '8栋2单元', '594', '2147483647', '0', '2016-11-01 18:25:36');
INSERT INTO `sun_message` VALUES ('7', '1', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:20:33');
INSERT INTO `sun_message` VALUES ('8', '2', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:23:02');
INSERT INTO `sun_message` VALUES ('9', '2', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:23:03');
INSERT INTO `sun_message` VALUES ('10', '1', '王小二', '深圳', '万科四季花城', '9栋4单元', '604', '2147483647', '0', '2016-11-01 18:08:47');
INSERT INTO `sun_message` VALUES ('11', '3', '陈馀', '天津', '万科真的很大', '8栋2单元', '594', '2147483647', '0', '2016-11-01 18:25:36');
INSERT INTO `sun_message` VALUES ('12', '1', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:20:33');
INSERT INTO `sun_message` VALUES ('13', '2', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:23:02');
INSERT INTO `sun_message` VALUES ('14', '2', '王五', '北京', '恒大真的很大', '6栋3单元', '632', '2147483647', '0', '2016-11-01 18:23:03');
INSERT INTO `sun_message` VALUES ('15', '1', '王小二', '深圳', '万科四季花城', '9栋4单元', '604', '2147483647', '0', '2016-11-01 18:08:47');

-- ----------------------------
-- Table structure for `sun_repair`
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sun_repair
-- ----------------------------
INSERT INTO `sun_repair` VALUES ('1', '公共设施报修', 'A君', '13333333333', '银湖小区', '2017-02-19 22:26:39', '健身器材坏了', 'NULL', '', '2017-02-18 22:27:03', '待受理', 'NULL', 'NULL', '1');

-- ----------------------------
-- Table structure for `sun_smscode`
-- ----------------------------
DROP TABLE IF EXISTS `sun_smscode`;
CREATE TABLE `sun_smscode` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `code` int(4) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sun_smscode
-- ----------------------------

-- ----------------------------
-- Table structure for `sun_staff`
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
-- Records of sun_staff
-- ----------------------------
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
