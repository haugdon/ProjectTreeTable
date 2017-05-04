/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : 11_study

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2016-07-16 20:00:11
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for `department_info`
-- ----------------------------
DROP TABLE IF EXISTS `department_info`;
CREATE TABLE `department_info` (
  `depart_id` varchar(32) NOT NULL COMMENT '部门id',
  `depart_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `parentid` varchar(32) DEFAULT NULL COMMENT '部门父id',
  `depart_type` int(11) DEFAULT '1' COMMENT '类型(1 联社 2部门 3网点)',
  `depart_order` int(11) DEFAULT NULL COMMENT '排序号',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  `address` varchar(500) DEFAULT NULL,
  `depart_phone` varchar(11) DEFAULT NULL,
  `organ_id` varchar(32) DEFAULT NULL COMMENT '机构ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT '1' COMMENT '状态（1：可见，2：隐藏）',
  PRIMARY KEY (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department_info
-- ----------------------------
INSERT INTO `department_info` VALUES ('0c0a656e48ac4070bc9d815c7d941fc5', '办公室', NULL, '1', NULL, NULL, NULL, NULL, NULL, '2016-07-05 14:59:50', '1');
INSERT INTO `department_info` VALUES ('0e655c7c298a4efdb3fafeeac2c8a049', '昆明北京路营业厅', 'ffadacc1bd964999a666b87642ea4813', '3', NULL, NULL, '昆明北京路', '123456', NULL, NULL, '1');
INSERT INTO `department_info` VALUES ('1bdf8270e8654e40866f2a95f3a3b37d', '信贷部', NULL, '1', NULL, NULL, NULL, NULL, NULL, '2016-07-10 15:42:05', '1');
INSERT INTO `department_info` VALUES ('689786b7253a405aa94008f81e222512', '昆明信贷', '1bdf8270e8654e40866f2a95f3a3b37d', '2', NULL, NULL, '昆明', '123456', NULL, NULL, '1');
INSERT INTO `department_info` VALUES ('7dba664830e8480cb5dbf142bf668262', '玉溪信贷部', '1bdf8270e8654e40866f2a95f3a3b37d', '2', NULL, NULL, '玉溪', '123456', NULL, NULL, '1');
INSERT INTO `department_info` VALUES ('9213d0c55fa44185bb7559eeed7ceea1', '营业部', NULL, '1', NULL, NULL, NULL, NULL, NULL, '2016-07-05 15:00:06', '1');
INSERT INTO `department_info` VALUES ('b28c8b7074db49b1b835beb894feace7', '党建部', NULL, '1', NULL, NULL, NULL, NULL, NULL, '2016-07-10 15:41:04', '1');
INSERT INTO `department_info` VALUES ('b436cb4faef7456aa1e169c7fa4cfffa', '昆明拓东营业厅', 'ffadacc1bd964999a666b87642ea4813', '3', NULL, NULL, '昆明拓东', '123456', NULL, NULL, '1');
INSERT INTO `department_info` VALUES ('c30287fd04f943bebe2e2d441dcaab9d', '玉溪信贷部', '1bdf8270e8654e40866f2a95f3a3b37d', '1', NULL, '2016-07-10 15:54:02', '玉溪', '11', 'f7b9d748061948e693b54d86c9344a81', NULL, '1');
INSERT INTO `department_info` VALUES ('c54f9a0d66434ffa87054004cb1dca01', '昆明办公室', '0c0a656e48ac4070bc9d815c7d941fc5', '2', NULL, NULL, '昆明', '123456', NULL, NULL, '1');
INSERT INTO `department_info` VALUES ('d0f5d72cb64c40f3be0a510141467253', '玉溪营业厅', '9213d0c55fa44185bb7559eeed7ceea1', '3', NULL, NULL, '玉溪', '123456', NULL, NULL, '1');
INSERT INTO `department_info` VALUES ('e11fdd8b107647bda4fbef1b8ebb015c', '玉溪办公室', '0c0a656e48ac4070bc9d815c7d941fc5', '2', NULL, NULL, '玉溪', '123456', NULL, NULL, '1');
INSERT INTO `department_info` VALUES ('ec3d13c0c6db4e2084470eda5f8b294e', '科技部', NULL, '1', NULL, NULL, NULL, NULL, NULL, '2016-07-10 15:41:34', '1');
INSERT INTO `department_info` VALUES ('ffadacc1bd964999a666b87642ea4813', '昆明营业厅tqm', 'c54f9a0d66434ffa87054004cb1dca01', '2', NULL, NULL, '昆明', '123456', NULL, NULL, '1');
