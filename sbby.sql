/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : sbby

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-10-16 11:46:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `equipment_sn` varchar(20) NOT NULL,
  `equipmenttype_sn` varchar(20) DEFAULT NULL,
  `equipment_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`equipment_sn`),
  KEY `fk` (`equipmenttype_sn`),
  CONSTRAINT `fk` FOREIGN KEY (`equipmenttype_sn`) REFERENCES `equipment_type` (`equipmenttype_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES ('0101', '01', '啦啦啦');

-- ----------------------------
-- Table structure for equipment_type
-- ----------------------------
DROP TABLE IF EXISTS `equipment_type`;
CREATE TABLE `equipment_type` (
  `equipmenttype_sn` varchar(20) NOT NULL,
  `maintenance_type` varchar(20) DEFAULT NULL,
  `early_warming` int(20) DEFAULT NULL,
  `equipmenttype_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`equipmenttype_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equipment_type
-- ----------------------------
INSERT INTO `equipment_type` VALUES ('01', '365', '100', '6000V及以上电机');

-- ----------------------------
-- Table structure for fitting
-- ----------------------------
DROP TABLE IF EXISTS `fitting`;
CREATE TABLE `fitting` (
  `fitting_sn` varchar(20) NOT NULL,
  `record_sn` varchar(20) DEFAULT NULL,
  `name1` varchar(20) DEFAULT NULL,
  `number` int(20) DEFAULT NULL,
  PRIMARY KEY (`fitting_sn`),
  KEY `fk5` (`record_sn`),
  CONSTRAINT `fk5` FOREIGN KEY (`record_sn`) REFERENCES `maintenance_record` (`record_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fitting
-- ----------------------------
INSERT INTO `fitting` VALUES ('01', '1', '瓷瓶', '2');
INSERT INTO `fitting` VALUES ('02', '1', '端子', '3');

-- ----------------------------
-- Table structure for maintenance_project
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_project`;
CREATE TABLE `maintenance_project` (
  `project_sn` varchar(20) NOT NULL,
  `equipmenttype_sn` varchar(20) DEFAULT NULL,
  `project_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`project_sn`),
  KEY `fk2` (`equipmenttype_sn`),
  CONSTRAINT `fk2` FOREIGN KEY (`equipmenttype_sn`) REFERENCES `equipment_type` (`equipmenttype_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maintenance_project
-- ----------------------------
INSERT INTO `maintenance_project` VALUES ('0101', '01', '检查6000V接线盒内瓷瓶、端子');
INSERT INTO `maintenance_project` VALUES ('0102', '01', '接线盒内卫生清洁');

-- ----------------------------
-- Table structure for maintenance_record
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_record`;
CREATE TABLE `maintenance_record` (
  `record_sn` varchar(20) NOT NULL,
  `equipment_sn` varchar(20) DEFAULT NULL,
  `project_sn` varchar(20) DEFAULT NULL,
  `person` varchar(20) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `condition` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`record_sn`),
  KEY `fk3` (`equipment_sn`) USING BTREE,
  KEY `fk4` (`project_sn`) USING BTREE,
  CONSTRAINT `maintenance_record_ibfk_1` FOREIGN KEY (`equipment_sn`) REFERENCES `equipment` (`equipment_sn`),
  CONSTRAINT `maintenance_record_ibfk_2` FOREIGN KEY (`project_sn`) REFERENCES `maintenance_project` (`project_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of maintenance_record
-- ----------------------------
INSERT INTO `maintenance_record` VALUES ('1', '0101', '0101', '小明', '2016-01-01', '完成');
INSERT INTO `maintenance_record` VALUES ('2', '0101', '0102', '小明', '2016-01-01', '完成');
