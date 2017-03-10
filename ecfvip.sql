/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : ecfvip

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-03-10 15:59:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dd_access
-- ----------------------------
DROP TABLE IF EXISTS `dd_access`;
CREATE TABLE `dd_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_access
-- ----------------------------
INSERT INTO `dd_access` VALUES ('4', '4', '0', '');
INSERT INTO `dd_access` VALUES ('4', '7', '0', '');
INSERT INTO `dd_access` VALUES ('4', '8', '0', '');
INSERT INTO `dd_access` VALUES ('4', '9', '0', '');
INSERT INTO `dd_access` VALUES ('4', '16', '0', '');
INSERT INTO `dd_access` VALUES ('4', '10', '0', '');
INSERT INTO `dd_access` VALUES ('4', '17', '0', '');
INSERT INTO `dd_access` VALUES ('4', '11', '0', '');
INSERT INTO `dd_access` VALUES ('4', '18', '0', '');
INSERT INTO `dd_access` VALUES ('4', '12', '0', '');
INSERT INTO `dd_access` VALUES ('4', '19', '0', '');
INSERT INTO `dd_access` VALUES ('4', '13', '0', '');
INSERT INTO `dd_access` VALUES ('4', '20', '0', '');
INSERT INTO `dd_access` VALUES ('4', '15', '0', '');
INSERT INTO `dd_access` VALUES ('4', '22', '0', '');
INSERT INTO `dd_access` VALUES ('4', '23', '0', '');
INSERT INTO `dd_access` VALUES ('4', '24', '0', '');
INSERT INTO `dd_access` VALUES ('4', '25', '0', '');
INSERT INTO `dd_access` VALUES ('4', '28', '0', '');
INSERT INTO `dd_access` VALUES ('4', '46', '0', '');
INSERT INTO `dd_access` VALUES ('4', '47', '0', '');
INSERT INTO `dd_access` VALUES ('4', '48', '0', '');

-- ----------------------------
-- Table structure for dd_address
-- ----------------------------
DROP TABLE IF EXISTS `dd_address`;
CREATE TABLE `dd_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_address
-- ----------------------------
INSERT INTO `dd_address` VALUES ('1', '1', 'gfg', '1asdfasdfasd', '', '1223', '', '0', '0');
INSERT INTO `dd_address` VALUES ('3', '1', '测试地址', '模压 花样百出塔顶塔顶栽夺花样百出', '', '15296860000', '', '0', '1');
INSERT INTO `dd_address` VALUES ('4', '2', '1', '5', '', '12323231234', '', '0', '0');

-- ----------------------------
-- Table structure for dd_admin
-- ----------------------------
DROP TABLE IF EXISTS `dd_admin`;
CREATE TABLE `dd_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(120) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `lock` int(11) NOT NULL DEFAULT '0',
  `control` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_admin
-- ----------------------------
INSERT INTO `dd_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1487657420', '127.0.0.1', '0', '');
INSERT INTO `dd_admin` VALUES ('4', 'aaaaaa', 'e10adc3949ba59abbe56e057f20f883e', '1440743860', '127.0.0.1', '0', '');

-- ----------------------------
-- Table structure for dd_bank
-- ----------------------------
DROP TABLE IF EXISTS `dd_bank`;
CREATE TABLE `dd_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `bank` varchar(100) DEFAULT NULL,
  `bankuser` varchar(100) DEFAULT NULL,
  `bankaddress` varchar(255) DEFAULT NULL,
  `bankcard` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_bank
-- ----------------------------

-- ----------------------------
-- Table structure for dd_banklist
-- ----------------------------
DROP TABLE IF EXISTS `dd_banklist`;
CREATE TABLE `dd_banklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `re` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '9',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_banklist
-- ----------------------------
INSERT INTO `dd_banklist` VALUES ('5', '工商银行', '0', '1', '1');
INSERT INTO `dd_banklist` VALUES ('7', '支付宝', '0', '1', '3');
INSERT INTO `dd_banklist` VALUES ('8', '中国银行', '0', '1', '9');
INSERT INTO `dd_banklist` VALUES ('11', '123123', '0', '1', '9');

-- ----------------------------
-- Table structure for dd_bonus
-- ----------------------------
DROP TABLE IF EXISTS `dd_bonus`;
CREATE TABLE `dd_bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `money` float NOT NULL DEFAULT '0',
  `dan` int(11) NOT NULL DEFAULT '0',
  `bdj` float NOT NULL DEFAULT '0',
  `tjj` varchar(20) DEFAULT NULL,
  `dpj` float NOT NULL DEFAULT '0',
  `dpjtop` float NOT NULL DEFAULT '0',
  `ldj` float NOT NULL DEFAULT '0',
  `ldjd` int(11) NOT NULL DEFAULT '0',
  `jyj` int(11) NOT NULL DEFAULT '0',
  `jyjd` float NOT NULL DEFAULT '0',
  `jdj` float NOT NULL DEFAULT '0',
  `jdjc` int(11) NOT NULL DEFAULT '0',
  `kup` float NOT NULL DEFAULT '0',
  `fudong` float NOT NULL DEFAULT '0' COMMENT '浮动奖励',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_bonus
-- ----------------------------
INSERT INTO `dd_bonus` VALUES ('1', '能量1', '1000', '1', '0', '', '10', '1000', '5', '0', '0', '0', '0', '0', '10', '2');
INSERT INTO `dd_bonus` VALUES ('2', '能量2', '3000', '3', '0', '', '12', '3000', '5', '4', '0', '0', '0', '0', '12', '2');
INSERT INTO `dd_bonus` VALUES ('3', '能量3', '9000', '9', '0', '', '15', '9000', '5', '6', '0', '0', '0', '0', '15', '2');
INSERT INTO `dd_bonus` VALUES ('4', '能量4', '27000', '27', '0', '', '20', '27000', '5', '8', '0', '0', '0', '0', '20', '2');

-- ----------------------------
-- Table structure for dd_bonuslist
-- ----------------------------
DROP TABLE IF EXISTS `dd_bonuslist`;
CREATE TABLE `dd_bonuslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `coin` decimal(11,3) NOT NULL DEFAULT '0.000',
  `score` decimal(11,3) NOT NULL DEFAULT '0.000',
  `rebuy` decimal(11,3) NOT NULL DEFAULT '0.000',
  `gp` int(11) NOT NULL DEFAULT '0',
  `gu` int(11) NOT NULL DEFAULT '0',
  `pro` decimal(11,3) NOT NULL DEFAULT '0.000',
  `recoin` decimal(11,3) NOT NULL DEFAULT '0.000',
  `rescore` decimal(11,3) NOT NULL DEFAULT '0.000',
  `rerebuy` decimal(11,3) NOT NULL DEFAULT '0.000',
  `regp` decimal(11,3) NOT NULL DEFAULT '0.000',
  `regu` int(11) NOT NULL,
  `repro` decimal(11,3) NOT NULL DEFAULT '0.000',
  `info` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `date` varchar(20) DEFAULT NULL,
  `dtime` varchar(50) DEFAULT NULL,
  `key1` int(11) NOT NULL DEFAULT '0',
  `key2` int(11) NOT NULL DEFAULT '0',
  `key3` int(11) NOT NULL DEFAULT '0',
  `key4` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_bonuslist
-- ----------------------------

-- ----------------------------
-- Table structure for dd_btmarket
-- ----------------------------
DROP TABLE IF EXISTS `dd_btmarket`;
CREATE TABLE `dd_btmarket` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `sn` varchar(50) DEFAULT NULL,
  `price` decimal(13,3) NOT NULL DEFAULT '0.000',
  `number` int(11) NOT NULL DEFAULT '0',
  `donumber` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `date` varchar(50) DEFAULT NULL,
  `buyid` int(11) NOT NULL DEFAULT '0',
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `buyid` (`buyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_btmarket
-- ----------------------------

-- ----------------------------
-- Table structure for dd_cash
-- ----------------------------
DROP TABLE IF EXISTS `dd_cash`;
CREATE TABLE `dd_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `bankid` int(11) NOT NULL DEFAULT '0',
  `bank` varchar(100) DEFAULT NULL,
  `bankuser` varchar(50) DEFAULT NULL,
  `bankcard` varchar(50) DEFAULT NULL,
  `bankaddress` varchar(100) DEFAULT NULL,
  `money` decimal(13,3) NOT NULL DEFAULT '0.000',
  `shui` decimal(13,3) NOT NULL DEFAULT '0.000',
  `outmoney` float NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `date` varchar(20) DEFAULT NULL,
  `dodate` varchar(50) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `key1` int(11) NOT NULL DEFAULT '0',
  `key2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_cash
-- ----------------------------

-- ----------------------------
-- Table structure for dd_coin
-- ----------------------------
DROP TABLE IF EXISTS `dd_coin`;
CREATE TABLE `dd_coin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pfx` varchar(10) DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `dpjbase` int(11) NOT NULL DEFAULT '0',
  `money` float NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `txstatus` int(11) NOT NULL DEFAULT '0',
  `zhstatus` int(11) NOT NULL DEFAULT '0',
  `huanstatus` int(11) NOT NULL DEFAULT '0',
  `epstatus` int(11) NOT NULL DEFAULT '0',
  `txbase` float NOT NULL DEFAULT '0',
  `txshui` float NOT NULL DEFAULT '0',
  `zhbase` float NOT NULL DEFAULT '0',
  `zhshui` float NOT NULL DEFAULT '0',
  `huanbase` float NOT NULL DEFAULT '0',
  `huanshui` float NOT NULL DEFAULT '0',
  `epbase` int(11) NOT NULL DEFAULT '0',
  `epmax` int(11) NOT NULL DEFAULT '0',
  `epshui` float NOT NULL DEFAULT '0',
  `eplock` int(11) NOT NULL DEFAULT '0',
  `epgua` int(11) NOT NULL DEFAULT '0',
  `glf` float NOT NULL DEFAULT '0',
  `cxf` float NOT NULL DEFAULT '0',
  `shui` float NOT NULL DEFAULT '0',
  `lcmoney` float NOT NULL DEFAULT '0',
  `rebuy` float NOT NULL DEFAULT '0',
  `incoin` float NOT NULL DEFAULT '0',
  `outcoin` float NOT NULL DEFAULT '0',
  `tjj1` float NOT NULL DEFAULT '0',
  `tjj2` float NOT NULL DEFAULT '0',
  `tjj3` float NOT NULL DEFAULT '0',
  `dpj` float NOT NULL DEFAULT '0',
  `dpjtop` float NOT NULL DEFAULT '0',
  `dpjc` int(11) NOT NULL DEFAULT '0',
  `jdj` float NOT NULL DEFAULT '0',
  `jdjc` float NOT NULL DEFAULT '0',
  `swj` varchar(50) DEFAULT NULL,
  `swjd` int(11) NOT NULL DEFAULT '0',
  `bdt` int(11) NOT NULL DEFAULT '0',
  `maxnumber` int(11) NOT NULL DEFAULT '0',
  `mer_test` int(11) NOT NULL DEFAULT '0',
  `mer_code` varchar(20) DEFAULT NULL,
  `mer_code1` varchar(50) DEFAULT NULL,
  `mer_key` varchar(150) DEFAULT NULL,
  `mer_status` int(11) NOT NULL DEFAULT '0',
  `bt0min` float NOT NULL DEFAULT '0',
  `bt0base` float NOT NULL DEFAULT '0',
  `bt0shui` float NOT NULL DEFAULT '0',
  `bt1base` float NOT NULL DEFAULT '0',
  `bt1min` float NOT NULL DEFAULT '0',
  `bt1shui` float NOT NULL DEFAULT '0',
  `bt2base` float NOT NULL DEFAULT '0',
  `bt2min` float NOT NULL DEFAULT '0',
  `bt2shui` float NOT NULL DEFAULT '0',
  `kuangmin` int(11) NOT NULL DEFAULT '0',
  `kuangbase` int(11) NOT NULL DEFAULT '0',
  `gtmin` float NOT NULL DEFAULT '0',
  `gtbase` float NOT NULL DEFAULT '0',
  `gdprice` float NOT NULL DEFAULT '0',
  `gdup` float NOT NULL DEFAULT '0',
  `gdbase` float NOT NULL DEFAULT '0',
  `gdmin` float NOT NULL DEFAULT '0',
  `gdfa` int(11) NOT NULL DEFAULT '0',
  `gddi` int(11) NOT NULL DEFAULT '0',
  `gdgt` float NOT NULL DEFAULT '0',
  `gdgt1` float NOT NULL DEFAULT '0',
  `gdgt2` float NOT NULL DEFAULT '0',
  `gdshui` float NOT NULL DEFAULT '0',
  `gdmax` float NOT NULL DEFAULT '0',
  `gddong` float NOT NULL DEFAULT '0',
  `gdc` float NOT NULL DEFAULT '0',
  `gdm` float NOT NULL DEFAULT '0',
  `gt1min` float NOT NULL DEFAULT '0',
  `gt1base` float NOT NULL DEFAULT '0',
  `gt1shui` float NOT NULL DEFAULT '0',
  `kprice` float NOT NULL DEFAULT '0',
  `kup` float NOT NULL DEFAULT '0',
  `kau` int(11) NOT NULL DEFAULT '0',
  `btmin` float NOT NULL DEFAULT '0',
  `btbase` float NOT NULL DEFAULT '0',
  `btshui` float NOT NULL DEFAULT '0',
  `btover` float NOT NULL DEFAULT '0',
  `btconfirmover` int(11) NOT NULL DEFAULT '0',
  `bthistory` int(11) NOT NULL DEFAULT '0',
  `btgua` int(11) NOT NULL DEFAULT '0',
  `btdeal` int(11) NOT NULL DEFAULT '0',
  `gdhistory` int(11) NOT NULL DEFAULT '0',
  `bdt1` float NOT NULL DEFAULT '0',
  `bdt2` float NOT NULL DEFAULT '0',
  `btout` float NOT NULL DEFAULT '0',
  `btin` float NOT NULL DEFAULT '0',
  `qb_uname` varchar(50) DEFAULT NULL COMMENT '钱包用户',
  `qb_pwd` varchar(50) DEFAULT NULL COMMENT '钱包用户密码',
  `qb_addr` varchar(20) DEFAULT NULL COMMENT '钱包对接地址',
  `qb_port` int(8) DEFAULT NULL COMMENT '钱包对接端口',
  `coinamin` float DEFAULT '0',
  `coinabase` float DEFAULT '0',
  `coinashui` float DEFAULT '0',
  `coinatxshui` float DEFAULT '0' COMMENT '虚拟币提现税率',
  `coinatxmin` float DEFAULT '0' COMMENT '虚拟币提现最小值',
  `coinatxmax` float DEFAULT '0' COMMENT '虚拟币提现最大值',
  `coinprice` float DEFAULT '0' COMMENT '虚拟币价值',
  `dcoina` float DEFAULT '0' COMMENT '可用动态分红比例',
  `dcoinb` float DEFAULT '0' COMMENT '消费动态分红比例',
  `dcoinc` float DEFAULT '0' COMMENT '复投动态分红比例',
  `stcoina` float DEFAULT '0' COMMENT '可用静态分红比例',
  `stcoinb` float DEFAULT '0' COMMENT '消费静态分红比例',
  `stcoinc` float DEFAULT '0' COMMENT '复投静态分红比例',
  `stimes` int(11) DEFAULT '0' COMMENT '静态分红周期（天）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_coin
-- ----------------------------
INSERT INTO `dd_coin` VALUES ('1', 'ECF', '5', '0', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'user', 'pwjjfnffedecvtgtgoksskoppikivvvvewe', '127.0.0.1', '20069', '0', '0', '0', '5', '1', '10000', '2', '70', '15', '15', '85', '0', '15', '90');

-- ----------------------------
-- Table structure for dd_coll
-- ----------------------------
DROP TABLE IF EXISTS `dd_coll`;
CREATE TABLE `dd_coll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank` varchar(100) DEFAULT NULL,
  `bankuser` varchar(50) DEFAULT NULL,
  `bankaddress` varchar(255) DEFAULT NULL,
  `bankcard` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_coll
-- ----------------------------
INSERT INTO `dd_coll` VALUES ('5', '花样百出', 'asdf', 'asdf', '1212asdfasd', '0');
INSERT INTO `dd_coll` VALUES ('6', '11', '111', '111', '111', '0');

-- ----------------------------
-- Table structure for dd_financial
-- ----------------------------
DROP TABLE IF EXISTS `dd_financial`;
CREATE TABLE `dd_financial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(20) DEFAULT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `money` decimal(13,3) NOT NULL DEFAULT '0.000',
  `number` int(11) NOT NULL DEFAULT '0',
  `price` decimal(13,3) NOT NULL DEFAULT '0.000',
  `days` int(11) NOT NULL DEFAULT '0',
  `doneday` int(11) NOT NULL DEFAULT '0',
  `total` decimal(13,3) NOT NULL DEFAULT '0.000',
  `yu` decimal(13,3) NOT NULL DEFAULT '0.000',
  `date` varchar(30) DEFAULT NULL,
  `keytime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_financial
-- ----------------------------

-- ----------------------------
-- Table structure for dd_gtmarket
-- ----------------------------
DROP TABLE IF EXISTS `dd_gtmarket`;
CREATE TABLE `dd_gtmarket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `number` int(11) NOT NULL DEFAULT '0',
  `donumber` int(11) NOT NULL DEFAULT '0',
  `totalnumber` int(11) NOT NULL DEFAULT '0',
  `date` varchar(20) DEFAULT NULL,
  `key1` int(11) NOT NULL DEFAULT '0',
  `key2` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_gtmarket
-- ----------------------------
INSERT INTO `dd_gtmarket` VALUES ('1', '0', '1.00', '0', '0', '0', '', '0', '0', '1');
INSERT INTO `dd_gtmarket` VALUES ('2', '0', '1.01', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('3', '0', '1.02', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('4', '0', '1.03', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('5', '0', '1.04', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('6', '0', '1.05', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('7', '0', '1.06', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('8', '0', '1.07', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('9', '0', '1.08', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('10', '0', '1.09', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('11', '0', '1.10', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('12', '0', '1.11', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('13', '0', '1.12', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('14', '0', '1.13', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('15', '0', '1.14', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('16', '0', '1.15', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('17', '0', '1.16', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('18', '0', '1.17', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('19', '0', '1.18', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('20', '0', '1.19', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('21', '0', '1.20', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('22', '0', '1.21', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('23', '0', '1.22', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('24', '0', '1.23', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('25', '0', '1.24', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('26', '0', '1.25', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('27', '0', '1.26', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('28', '0', '1.27', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('29', '0', '1.28', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('30', '0', '1.29', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('31', '0', '1.30', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('32', '0', '1.31', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('33', '0', '1.32', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('34', '0', '1.33', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('35', '0', '1.34', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('36', '0', '1.35', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('37', '0', '1.36', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('38', '0', '1.37', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('39', '0', '1.38', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('40', '0', '1.39', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('41', '0', '1.40', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('42', '0', '1.41', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('43', '0', '1.42', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('44', '0', '1.43', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('45', '0', '1.44', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('46', '0', '1.45', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('47', '0', '1.46', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('48', '0', '1.47', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('49', '0', '1.48', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('50', '0', '1.49', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('51', '0', '1.50', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('52', '0', '1.51', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('53', '0', '1.52', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('54', '0', '1.53', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('55', '0', '1.54', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('56', '0', '1.55', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('57', '0', '1.56', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('58', '0', '1.57', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('59', '0', '1.58', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('60', '0', '1.59', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('61', '0', '1.60', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('62', '0', '1.61', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('63', '0', '1.62', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('64', '0', '1.63', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('65', '0', '1.64', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('66', '0', '1.65', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('67', '0', '1.66', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('68', '0', '1.67', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('69', '0', '1.68', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('70', '0', '1.69', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('71', '0', '1.70', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('72', '0', '1.71', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('73', '0', '1.72', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('74', '0', '1.73', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('75', '0', '1.74', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('76', '0', '1.75', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('77', '0', '1.76', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('78', '0', '1.77', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('79', '0', '1.78', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('80', '0', '1.79', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('81', '0', '1.80', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('82', '0', '1.81', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('83', '0', '1.82', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('84', '0', '1.83', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('85', '0', '1.84', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('86', '0', '1.85', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('87', '0', '1.86', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('88', '0', '1.87', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('89', '0', '1.88', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('90', '0', '1.89', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('91', '0', '1.90', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('92', '0', '1.91', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('93', '0', '1.92', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('94', '0', '1.93', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('95', '0', '1.94', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('96', '0', '1.95', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('97', '0', '1.96', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('98', '0', '1.97', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('99', '0', '1.98', '0', '0', '0', '', '0', '0', '2');
INSERT INTO `dd_gtmarket` VALUES ('100', '0', '1.99', '0', '0', '0', '', '0', '0', '2');

-- ----------------------------
-- Table structure for dd_highcharts
-- ----------------------------
DROP TABLE IF EXISTS `dd_highcharts`;
CREATE TABLE `dd_highcharts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `date` varchar(20) DEFAULT NULL,
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `number` int(11) NOT NULL DEFAULT '0',
  `key1` int(11) NOT NULL DEFAULT '0',
  `key2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_highcharts
-- ----------------------------
INSERT INTO `dd_highcharts` VALUES ('1', '0', '2016-10-05', '2.00', '0', '0', '0');
INSERT INTO `dd_highcharts` VALUES ('41', '0', '2016-10-10', '2.00', '0', '0', '0');
INSERT INTO `dd_highcharts` VALUES ('40', '0', '2016-10-09', '2.00', '0', '0', '0');
INSERT INTO `dd_highcharts` VALUES ('39', '0', '2016-10-08', '2.00', '0', '0', '0');
INSERT INTO `dd_highcharts` VALUES ('38', '0', '2016-10-06', '2.00', '0', '0', '0');

-- ----------------------------
-- Table structure for dd_history
-- ----------------------------
DROP TABLE IF EXISTS `dd_history`;
CREATE TABLE `dd_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `toid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `entype` varchar(20) DEFAULT NULL,
  `src` tinyint(2) DEFAULT '0' COMMENT '目标来源 1:uid 2:toid',
  `allin` decimal(13,3) NOT NULL DEFAULT '0.000' COMMENT '正数：收入，负数：支出',
  `coin` decimal(13,3) NOT NULL DEFAULT '0.000',
  `score` decimal(13,3) NOT NULL DEFAULT '0.000',
  `xun` decimal(13,3) NOT NULL DEFAULT '0.000',
  `gp` decimal(13,3) NOT NULL DEFAULT '0.000',
  `gu` int(11) NOT NULL DEFAULT '0',
  `rebuy` decimal(13,3) NOT NULL DEFAULT '0.000',
  `pro` decimal(13,3) NOT NULL DEFAULT '0.000',
  `shui` decimal(13,3) NOT NULL DEFAULT '0.000',
  `coinsum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `scoresum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `xunsum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `gpsum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `gusum` int(11) NOT NULL DEFAULT '0',
  `rebuysum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `prosum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `date` varchar(20) DEFAULT NULL,
  `da` varchar(20) DEFAULT NULL,
  `ti` varchar(20) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `info` varchar(255) DEFAULT NULL,
  `eninfo` varchar(255) DEFAULT NULL,
  `key1` int(11) NOT NULL DEFAULT '0',
  `key2` int(11) NOT NULL DEFAULT '0',
  `key3` int(11) NOT NULL DEFAULT '0',
  `fongp` decimal(13,3) NOT NULL DEFAULT '0.000',
  `bgp` decimal(13,3) NOT NULL DEFAULT '0.000',
  `base` float NOT NULL DEFAULT '0',
  `bt` decimal(12,3) NOT NULL DEFAULT '0.000',
  `bt1` decimal(12,3) NOT NULL DEFAULT '0.000',
  `bt2` decimal(12,3) NOT NULL DEFAULT '0.000',
  `gt` decimal(12,3) NOT NULL DEFAULT '0.000',
  `gt1` decimal(12,3) NOT NULL DEFAULT '0.000',
  `ly` decimal(13,3) NOT NULL DEFAULT '0.000',
  `gd` float NOT NULL DEFAULT '0',
  `gd1` int(11) NOT NULL DEFAULT '0',
  `gd2` int(11) NOT NULL DEFAULT '0',
  `dan` int(11) NOT NULL DEFAULT '0',
  `sbt` decimal(12,3) NOT NULL DEFAULT '0.000',
  `sbt1` decimal(12,3) NOT NULL DEFAULT '0.000',
  `sbt2` decimal(12,3) NOT NULL DEFAULT '0.000',
  `sgt` decimal(12,3) NOT NULL DEFAULT '0.000',
  `sgt1` decimal(12,3) NOT NULL DEFAULT '0.000',
  `sly` decimal(13,3) NOT NULL DEFAULT '0.000',
  `sgd` float NOT NULL DEFAULT '0',
  `sgd1` int(11) NOT NULL DEFAULT '0',
  `sgd2` int(11) NOT NULL DEFAULT '0',
  `sdan` int(11) NOT NULL DEFAULT '0',
  `price` decimal(13,3) NOT NULL DEFAULT '0.000',
  `cai` int(11) NOT NULL DEFAULT '0',
  `coina` float DEFAULT '0' COMMENT '可用锎',
  `coinb` float DEFAULT '0' COMMENT '消费锎',
  `coinc` float DEFAULT '0' COMMENT '复投锎',
  `scoina` float DEFAULT '0' COMMENT '剩余可用锎',
  `scoinb` float DEFAULT '0' COMMENT '剩余消费锎',
  `scoinc` float DEFAULT '0' COMMENT '剩余复投锎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_history
-- ----------------------------
INSERT INTO `dd_history` VALUES ('1', '1', '0', '1', null, '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-06 17:19:55', '2016-10-06', '1475745595', '0', '成功增加货币', null, '20', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '10000000000', '0', '0', '10000000000', '0', '0');
INSERT INTO `dd_history` VALUES ('2', '1', '0', '805', null, '0', '-13500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-06 17:21:23', '2016-10-06', '1475745683', '0', '激活矿主:ECF34674', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '-13500', '0', '0', '9999990000', '0', '0');
INSERT INTO `dd_history` VALUES ('3', '1', '0', '805', null, '0', '-4500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-06 17:23:37', '2016-10-06', '1475745817', '0', '激活矿主:ECF18137', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '-4500', '0', '0', '9999980000', '0', '0');
INSERT INTO `dd_history` VALUES ('4', '2', '0', '1', null, '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:30:57', '2016-10-06', '1475746257', '0', '成功增加货币', null, '20', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '100000', '0', '0', '100000', '0', '0');
INSERT INTO `dd_history` VALUES ('5', '2', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:32:40', '2016-10-06', '1475746360', '0', '激活矿主:ECF24644', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-500', '0', '0', '99500', '0', '0');
INSERT INTO `dd_history` VALUES ('6', '2', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:33:42', '2016-10-06', '1475746422', '0', '来源编号:ECF62479', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '70', '15', '15', '99570', '15', '15');
INSERT INTO `dd_history` VALUES ('7', '2', '0', '805', null, '0', '-1500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:33:42', '2016-10-06', '1475746422', '0', '激活矿主:ECF62479', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-1500', '0', '0', '98070', '15', '15');
INSERT INTO `dd_history` VALUES ('8', '2', '0', '805', null, '0', '-4500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:35:51', '2016-10-06', '1475746551', '0', '激活矿主:ECF69714', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-4500', '0', '0', '93570', '15', '15');
INSERT INTO `dd_history` VALUES ('9', '2', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:35:56', '2016-10-06', '1475746556', '0', '来源编号:ECF55517', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '70', '15', '15', '93640', '30', '30');
INSERT INTO `dd_history` VALUES ('10', '2', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:35:56', '2016-10-06', '1475746556', '0', '激活矿主:ECF55517', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-500', '0', '0', '93140', '30', '30');
INSERT INTO `dd_history` VALUES ('11', '4', '0', '101', null, '0', '50.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:37:13', '2016-10-06', '1475746633', '0', '来源编号:ECF47146', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '35', '7.5', '7.5', '35', '7.5', '7.5');
INSERT INTO `dd_history` VALUES ('12', '2', '0', '103', null, '0', '2.500', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:37:13', '2016-10-06', '1475746633', '0', '来源编号:ECF24644', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '1.75', '0.375', '0.375', '93141.8', '30.375', '30.375');
INSERT INTO `dd_history` VALUES ('13', '2', '0', '101', null, '0', '1000.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:37:13', '2016-10-06', '1475746633', '0', '来源编号:ECF47146', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '700', '150', '150', '93841.8', '180.375', '180.375');
INSERT INTO `dd_history` VALUES ('14', '2', '0', '805', null, '0', '-13500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:37:13', '2016-10-06', '1475746633', '0', '激活矿主:ECF47146', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-13500', '0', '0', '80341.8', '180.375', '180.375');
INSERT INTO `dd_history` VALUES ('15', '5', '0', '101', null, '0', '60.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:37:17', '2016-10-06', '1475746637', '0', '来源编号:ECF94413', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '42', '9', '9', '42', '9', '9');
INSERT INTO `dd_history` VALUES ('16', '2', '0', '103', null, '0', '3.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:37:17', '2016-10-06', '1475746637', '0', '来源编号:ECF62479', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '2.1', '0.45', '0.45', '80343.9', '180.825', '180.825');
INSERT INTO `dd_history` VALUES ('17', '2', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:37:17', '2016-10-06', '1475746637', '0', '来源编号:ECF94413', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '70', '15', '15', '80413.9', '195.825', '195.825');
INSERT INTO `dd_history` VALUES ('18', '2', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:37:17', '2016-10-06', '1475746637', '0', '激活矿主:ECF94413', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-500', '0', '0', '79913.9', '195.825', '195.825');
INSERT INTO `dd_history` VALUES ('19', '2', '5', '1000', null, '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:39:09', '2016-10-06', '1475746749', '0', '1', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-50000', '0', '0', '29913.9', '195.825', '195.825');
INSERT INTO `dd_history` VALUES ('20', '5', '2', '1001', null, '2', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:39:09', '2016-10-06', '1475746749', '0', '1', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '50000', '0', '0', '50042', '9', '9');
INSERT INTO `dd_history` VALUES ('21', '5', '4', '1000', null, '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:40:59', '2016-10-06', '1475746859', '0', '1', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-100', '0', '0', '49942', '9', '9');
INSERT INTO `dd_history` VALUES ('22', '4', '5', '1001', null, '2', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:40:59', '2016-10-06', '1475746859', '0', '1', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '100', '0', '0', '135', '7.5', '7.5');
INSERT INTO `dd_history` VALUES ('23', '2', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:43:49', '2016-10-06', '1475747029', '0', '来源编号:ECF66543', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '70', '15', '15', '29983.9', '210.825', '210.825');
INSERT INTO `dd_history` VALUES ('24', '5', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:43:49', '2016-10-06', '1475747029', '0', '激活矿主:ECF66543', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-500', '0', '0', '49442', '9', '9');
INSERT INTO `dd_history` VALUES ('25', '5', '0', '101', null, '0', '180.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:44:29', '2016-10-06', '1475747069', '0', '来源编号:ECF63727', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '126', '27', '27', '49568', '36', '36');
INSERT INTO `dd_history` VALUES ('26', '2', '0', '103', null, '0', '9.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:44:29', '2016-10-06', '1475747069', '0', '来源编号:ECF62479', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '6.3', '1.35', '1.35', '29990.2', '212.175', '212.175');
INSERT INTO `dd_history` VALUES ('27', '2', '0', '101', null, '0', '300.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:44:29', '2016-10-06', '1475747069', '0', '来源编号:ECF63727', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '210', '45', '45', '30200.2', '257.175', '257.175');
INSERT INTO `dd_history` VALUES ('28', '5', '0', '805', null, '0', '-1500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:44:30', '2016-10-06', '1475747070', '0', '激活矿主:ECF63727', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-1500', '0', '0', '48068', '36', '36');
INSERT INTO `dd_history` VALUES ('29', '9', '0', '101', null, '0', '150.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:53:53', '2016-10-06', '1475747633', '0', '来源编号:ECF88421', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '105', '22.5', '22.5', '105', '22.5', '22.5');
INSERT INTO `dd_history` VALUES ('30', '2', '0', '103', null, '0', '7.500', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:53:53', '2016-10-06', '1475747633', '0', '来源编号:ECF94413', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '5.25', '1.125', '1.125', '30205.4', '258.3', '258.3');
INSERT INTO `dd_history` VALUES ('31', '5', '0', '101', null, '0', '360.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:53:53', '2016-10-06', '1475747633', '0', '来源编号:ECF88421', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '252', '54', '54', '48320', '90', '90');
INSERT INTO `dd_history` VALUES ('32', '2', '0', '103', null, '0', '18.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:53:53', '2016-10-06', '1475747633', '0', '来源编号:ECF62479', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '12.6', '2.7', '2.7', '30218', '261', '261');
INSERT INTO `dd_history` VALUES ('33', '2', '0', '101', null, '0', '900.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:53:53', '2016-10-06', '1475747633', '0', '来源编号:ECF88421', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '630', '135', '135', '30848', '396', '396');
INSERT INTO `dd_history` VALUES ('34', '5', '0', '805', null, '0', '-4500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 17:53:53', '2016-10-06', '1475747633', '0', '激活矿主:ECF88421', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-4500', '0', '0', '43820', '90', '90');
INSERT INTO `dd_history` VALUES ('35', '2', '0', '101', null, '0', '300.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:01:50', '2016-10-06', '1475748110', '0', '来源编号:ECF32422', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '210', '45', '45', '31058', '441', '441');
INSERT INTO `dd_history` VALUES ('36', '5', '0', '805', null, '0', '-13500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:01:50', '2016-10-06', '1475748110', '0', '激活矿主:ECF32422', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-13500', '0', '0', '30320', '90', '90');
INSERT INTO `dd_history` VALUES ('37', '2', '0', '1003', null, '0', '181.440', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:06:01', '2016-10-06', '1475748361', '0', '2016-10-06产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '154.224', '0', '27.216', '31212.2', '441', '468.216');
INSERT INTO `dd_history` VALUES ('38', '3', '0', '1003', null, '0', '58.270', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:06:01', '2016-10-06', '1475748361', '0', '2016-10-06产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '49.53', '0', '8.74', '49.53', '0', '8.74');
INSERT INTO `dd_history` VALUES ('39', '4', '0', '1003', null, '0', '6.161', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:06:01', '2016-10-06', '1475748361', '0', '2016-10-06产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '5.237', '0', '0.924', '140.237', '7.5', '8.424');
INSERT INTO `dd_history` VALUES ('40', '5', '0', '1003', null, '0', '18.685', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:06:01', '2016-10-06', '1475748361', '0', '2016-10-06产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '15.882', '0', '2.803', '30335.9', '90', '92.803');
INSERT INTO `dd_history` VALUES ('41', '6', '0', '1003', null, '0', '57.500', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:06:01', '2016-10-06', '1475748361', '0', '2016-10-06产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '48.875', '0', '8.625', '48.875', '0', '8.625');
INSERT INTO `dd_history` VALUES ('42', '7', '0', '1003', null, '0', '6.132', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:06:01', '2016-10-06', '1475748361', '0', '2016-10-06产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '5.212', '0', '0.92', '5.212', '0', '0.92');
INSERT INTO `dd_history` VALUES ('43', '8', '0', '1003', null, '0', '182.820', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:06:01', '2016-10-06', '1475748361', '0', '2016-10-06产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '155.397', '0', '27.423', '155.397', '0', '27.423');
INSERT INTO `dd_history` VALUES ('44', '9', '0', '1003', null, '0', '6.119', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:06:01', '2016-10-06', '1475748361', '0', '2016-10-06产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '5.201', '0', '0.918', '110.201', '22.5', '23.418');
INSERT INTO `dd_history` VALUES ('45', '10', '0', '1003', null, '0', '6.117', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:06:01', '2016-10-06', '1475748361', '0', '2016-10-06产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '5.199', '0', '0.918', '5.199', '0', '0.918');
INSERT INTO `dd_history` VALUES ('46', '11', '0', '1003', null, '0', '18.940', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:06:01', '2016-10-06', '1475748361', '0', '2016-10-06产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '16.099', '0', '2.841', '16.099', '0', '2.841');
INSERT INTO `dd_history` VALUES ('47', '12', '0', '1003', null, '0', '57.890', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:06:01', '2016-10-06', '1475748361', '0', '2016-10-06产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '49.207', '0', '8.683', '49.207', '0', '8.683');
INSERT INTO `dd_history` VALUES ('48', '13', '0', '1003', null, '0', '182.430', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:06:01', '2016-10-06', '1475748361', '0', '2016-10-06产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '155.066', '0', '27.364', '155.066', '0', '27.364');
INSERT INTO `dd_history` VALUES ('49', '12', '0', '101', null, '0', '2025.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:20:09', '2016-10-06', '1475749209', '0', '来源编号:ECF88742', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '1417.5', '303.75', '303.75', '1466.71', '303.75', '312.433');
INSERT INTO `dd_history` VALUES ('50', '5', '0', '103', null, '0', '101.250', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:20:09', '2016-10-06', '1475749209', '0', '来源编号:ECF88421', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '70.875', '15.188', '15.187', '30406.8', '105.188', '107.99');
INSERT INTO `dd_history` VALUES ('51', '2', '0', '103', null, '0', '101.250', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:20:09', '2016-10-06', '1475749209', '0', '来源编号:ECF88421', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '70.875', '15.188', '15.187', '31283.1', '456.188', '483.403');
INSERT INTO `dd_history` VALUES ('52', '6', '0', '101', null, '0', '75.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:28:10', '2016-10-06', '1475749690', '0', '来源编号:ECF35817', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '52.5', '11.25', '11.25', '101.375', '11.25', '19.875');
INSERT INTO `dd_history` VALUES ('53', '2', '0', '103', null, '0', '3.750', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:28:10', '2016-10-06', '1475749690', '0', '来源编号:ECF69714', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '2.625', '0.563', '0.562', '31285.7', '456.751', '483.965');
INSERT INTO `dd_history` VALUES ('54', '5', '0', '101', null, '0', '60.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:28:10', '2016-10-06', '1475749690', '0', '来源编号:ECF35817', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '42', '9', '9', '30448.8', '114.188', '116.99');
INSERT INTO `dd_history` VALUES ('55', '2', '0', '103', null, '0', '3.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:28:10', '2016-10-06', '1475749690', '0', '来源编号:ECF62479', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '2.1', '0.45', '0.45', '31287.8', '457.201', '484.415');
INSERT INTO `dd_history` VALUES ('56', '2', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:28:10', '2016-10-06', '1475749690', '0', '激活矿主:ECF35817', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-500', '0', '0', '30787.8', '457.201', '484.415');
INSERT INTO `dd_history` VALUES ('57', '4', '0', '1', null, '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:38:09', '2016-10-06', '1475750289', '0', '成功增加货币', null, '20', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '100000', '0', '0', '100140', '7.5', '8.424');
INSERT INTO `dd_history` VALUES ('58', '4', '0', '1', null, '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:38:42', '2016-10-06', '1475750322', '0', '成功减少货币', null, '20', '1', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '999999', '0', '0', '-899859', '7.5', '8.424');
INSERT INTO `dd_history` VALUES ('59', '4', '0', '1', null, '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:47:57', '2016-10-06', '1475750877', '0', '成功增加货币', null, '20', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '999999', '0', '0', '100140', '7.5', '8.424');
INSERT INTO `dd_history` VALUES ('60', '2', '0', '101', null, '0', '200.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:48:24', '2016-10-06', '1475750904', '0', '来源编号:ECF24644升级', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '140', '30', '30', '30927.8', '487.201', '514.415');
INSERT INTO `dd_history` VALUES ('61', '4', '0', '801', null, '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 18:48:24', '2016-10-06', '1475750904', '0', '升级帐户', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-1000', '0', '0', '99140.2', '7.5', '8.424');
INSERT INTO `dd_history` VALUES ('62', '4', '0', '101', null, '0', '60.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 19:39:14', '2016-10-06', '1475753954', '0', '来源编号:ECF53369', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '42', '9', '9', '99182.2', '16.5', '17.424');
INSERT INTO `dd_history` VALUES ('63', '2', '0', '103', null, '0', '3.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 19:39:14', '2016-10-06', '1475753954', '0', '来源编号:ECF24644', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '2.1', '0.45', '0.45', '30929.9', '487.651', '514.865');
INSERT INTO `dd_history` VALUES ('64', '2', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 19:39:14', '2016-10-06', '1475753954', '0', '来源编号:ECF53369', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '70', '15', '15', '30999.9', '502.651', '529.865');
INSERT INTO `dd_history` VALUES ('65', '16', '0', '1', null, '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 20:16:11', '2016-10-06', '1475756171', '0', '成功增加ECF', null, '22', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '100000', '0', '0', '0', '0', '100000');
INSERT INTO `dd_history` VALUES ('66', '16', '0', '1', null, '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 20:22:30', '2016-10-06', '1475756550', '0', '成功增加ECF', null, '22', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '0', '0', '10', '0', '0', '100010');
INSERT INTO `dd_history` VALUES ('67', '4', '0', '101', null, '0', '180.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 21:07:02', '2016-10-06', '1475759222', '0', '来源编号:ECF53369复投', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '126', '27', '27', '99308.2', '43.5', '44.424');
INSERT INTO `dd_history` VALUES ('68', '2', '0', '103', null, '0', '9.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 21:07:02', '2016-10-06', '1475759222', '0', '来源编号:ECF24644', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '6.3', '1.35', '1.35', '31006.2', '504.001', '531.215');
INSERT INTO `dd_history` VALUES ('69', '2', '0', '101', null, '0', '300.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 21:07:02', '2016-10-06', '1475759222', '0', '来源编号:ECF53369复投', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '210', '45', '45', '31216.2', '549.001', '576.215');
INSERT INTO `dd_history` VALUES ('70', '16', '0', '1004', null, '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 21:07:02', '2016-10-06', '1475759222', '0', '复投帐户', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '0', '0', '-1500', '0', '0', '98510');
INSERT INTO `dd_history` VALUES ('71', '4', '0', '101', null, '0', '180.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 21:30:40', '2016-10-06', '1475760640', '0', '来源编号:ECF53369复投', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '126', '27', '27', '99434.2', '70.5', '71.424');
INSERT INTO `dd_history` VALUES ('72', '2', '0', '103', null, '0', '9.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 21:30:40', '2016-10-06', '1475760640', '0', '来源编号:ECF24644', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '6.3', '1.35', '1.35', '31222.5', '550.351', '577.565');
INSERT INTO `dd_history` VALUES ('73', '2', '0', '101', null, '0', '300.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 21:30:40', '2016-10-06', '1475760640', '0', '来源编号:ECF53369复投', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '210', '45', '45', '31432.5', '595.351', '622.565');
INSERT INTO `dd_history` VALUES ('74', '16', '0', '1004', null, '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 21:30:40', '2016-10-06', '1475760640', '0', '复投帐户', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '0', '0', '-1500', '0', '0', '97010');
INSERT INTO `dd_history` VALUES ('75', '16', '0', '1', null, '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 21:30:42', '2016-10-06', '1475760642', '0', '成功增加ECF', null, '21', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '0', '200', '0', '0', '200', '97010');
INSERT INTO `dd_history` VALUES ('76', '2', '0', '1', null, '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-06 21:34:16', '2016-10-06', '1475760856', '0', '成功增加ECF', null, '21', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '0', '100', '0', '31432.5', '695.351', '622.565');
INSERT INTO `dd_history` VALUES ('77', '2', '0', '1003', null, '0', '181.830', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:12', '2016-10-08', '1475904372', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '154.556', '0', '27.274', '31587.1', '695.351', '649.839');
INSERT INTO `dd_history` VALUES ('78', '3', '0', '1003', null, '0', '57.705', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:12', '2016-10-08', '1475904372', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '49.049', '0', '8.656', '98.579', '0', '17.396');
INSERT INTO `dd_history` VALUES ('79', '4', '0', '1003', null, '0', '18.890', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:12', '2016-10-08', '1475904372', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '16.057', '0', '2.833', '99450.3', '70.5', '74.257');
INSERT INTO `dd_history` VALUES ('80', '5', '0', '1003', null, '0', '18.935', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:12', '2016-10-08', '1475904372', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '16.095', '0', '2.84', '30464.9', '114.188', '119.83');
INSERT INTO `dd_history` VALUES ('81', '6', '0', '1003', null, '0', '57.990', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:12', '2016-10-08', '1475904372', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '49.292', '0', '8.698', '150.667', '11.25', '28.573');
INSERT INTO `dd_history` VALUES ('82', '7', '0', '1003', null, '0', '6.188', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:12', '2016-10-08', '1475904372', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '5.26', '0', '0.928', '10.472', '0', '1.848');
INSERT INTO `dd_history` VALUES ('83', '8', '0', '1003', null, '0', '180.540', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:12', '2016-10-08', '1475904372', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '153.459', '0', '27.081', '308.856', '0', '54.504');
INSERT INTO `dd_history` VALUES ('84', '9', '0', '1003', null, '0', '6.146', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:12', '2016-10-08', '1475904372', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '5.224', '0', '0.922', '115.425', '22.5', '24.34');
INSERT INTO `dd_history` VALUES ('85', '10', '0', '1003', null, '0', '6.213', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:12', '2016-10-08', '1475904372', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '5.281', '0', '0.932', '10.48', '0', '1.85');
INSERT INTO `dd_history` VALUES ('86', '11', '0', '1003', null, '0', '18.730', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:13', '2016-10-08', '1475904373', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '15.921', '0', '2.809', '32.02', '0', '5.65');
INSERT INTO `dd_history` VALUES ('87', '12', '0', '1003', null, '0', '57.830', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:13', '2016-10-08', '1475904373', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '49.156', '0', '8.674', '1515.86', '303.75', '321.107');
INSERT INTO `dd_history` VALUES ('88', '13', '0', '1003', null, '0', '182.730', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:13', '2016-10-08', '1475904373', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '155.321', '0', '27.409', '310.387', '0', '54.773');
INSERT INTO `dd_history` VALUES ('89', '14', '0', '1003', null, '0', '180.015', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:13', '2016-10-08', '1475904373', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '153.013', '0', '27.002', '153.013', '0', '27.002');
INSERT INTO `dd_history` VALUES ('90', '15', '0', '1003', null, '0', '6.136', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:13', '2016-10-08', '1475904373', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '5.216', '0', '0.92', '5.216', '0', '0.92');
INSERT INTO `dd_history` VALUES ('91', '16', '0', '1003', null, '0', '18.810', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-08 13:26:13', '2016-10-08', '1475904373', '0', '2016-10-08产出', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '15.989', '0', '2.821', '15.989', '200', '97012.8');
INSERT INTO `dd_history` VALUES ('92', '15', '0', '1002', null, '1', '-1.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 15:11:51', '2016-10-09', '1475997111', '0', '提现ECF', null, '20', '1', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-1', '0', '0', '4.216', '0', '0.92');
INSERT INTO `dd_history` VALUES ('93', '15', '0', '1', null, '1', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 15:15:21', '2016-10-09', '1475997321', '0', '成功增加ECF', null, '20', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '100', '0', '0', '104.216', '0', '0.92');
INSERT INTO `dd_history` VALUES ('94', '7', '0', '101', null, '0', '60.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 15:30:13', '2016-10-09', '1475998213', '0', '来源编号:ECF97672', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '42', '9', '9', '51.472', '9', '10.848');
INSERT INTO `dd_history` VALUES ('95', '2', '0', '103', null, '0', '3.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 15:30:13', '2016-10-09', '1475998213', '0', '来源编号:ECF55517', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '2.1', '0.45', '0.45', '31588.2', '695.801', '650.289');
INSERT INTO `dd_history` VALUES ('96', '4', '0', '101', null, '0', '60.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 15:30:13', '2016-10-09', '1475998213', '0', '来源编号:ECF97672', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '42', '9', '9', '99491.3', '79.5', '83.257');
INSERT INTO `dd_history` VALUES ('97', '2', '0', '103', null, '0', '3.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 15:30:13', '2016-10-09', '1475998213', '0', '来源编号:ECF24644', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '2.1', '0.45', '0.45', '31590.3', '696.251', '650.739');
INSERT INTO `dd_history` VALUES ('98', '2', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 15:30:13', '2016-10-09', '1475998213', '0', '来源编号:ECF97672', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '70', '15', '15', '31660.3', '711.251', '665.739');
INSERT INTO `dd_history` VALUES ('99', '1', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 15:30:13', '2016-10-09', '1475998213', '0', '激活能量:ECF97672', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '-500', '0', '0', '9999980000', '0', '0');
INSERT INTO `dd_history` VALUES ('100', '10', '2', '1000', null, '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 16:27:52', '2016-10-09', '1476001672', '0', 'xxx', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-1', '0', '0', '8.48', '0', '1.85');
INSERT INTO `dd_history` VALUES ('101', '2', '10', '1001', null, '2', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 16:27:52', '2016-10-09', '1476001672', '0', 'xxx', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '1', '0', '0', '31661.3', '711.251', '665.739');
INSERT INTO `dd_history` VALUES ('102', '1', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 18:29:23', '2016-10-09', '1476008963', '0', '激活能量:ECF13786', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '-500', '0', '0', '9999980000', '0', '0');
INSERT INTO `dd_history` VALUES ('103', '3', '0', '101', null, '0', '75.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 18:32:11', '2016-10-09', '1476009131', '0', '来源编号:ECF85749', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '52.5', '11.25', '11.25', '150.079', '11.25', '28.646');
INSERT INTO `dd_history` VALUES ('104', '1', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 18:32:11', '2016-10-09', '1476009131', '0', '来源编号:ECF85749', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '70', '15', '15', '9999980000', '15', '15');
INSERT INTO `dd_history` VALUES ('105', '1', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 18:32:11', '2016-10-09', '1476009131', '0', '激活能量:ECF85749', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '-500', '0', '0', '9999980000', '15', '15');
INSERT INTO `dd_history` VALUES ('106', '1', '3', '1000', null, '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 18:48:44', '2016-10-09', '1476010124', '0', '', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '-100000', '0', '0', '9999880000', '15', '15');
INSERT INTO `dd_history` VALUES ('107', '3', '1', '1001', null, '2', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 18:48:44', '2016-10-09', '1476010124', '0', '', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '100000', '0', '0', '100150', '11.25', '28.646');
INSERT INTO `dd_history` VALUES ('108', '1', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 18:53:05', '2016-10-09', '1476010385', '0', '来源编号:ECF64645', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '70', '15', '15', '9999880000', '30', '30');
INSERT INTO `dd_history` VALUES ('109', '3', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 18:53:05', '2016-10-09', '1476010385', '0', '激活能量:ECF64645', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-500', '0', '0', '99650.1', '11.25', '28.646');
INSERT INTO `dd_history` VALUES ('110', '19', '0', '101', null, '0', '50.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 18:53:10', '2016-10-09', '1476010390', '0', '来源编号:ECF32573', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '35', '7.5', '7.5', '35', '7.5', '7.5');
INSERT INTO `dd_history` VALUES ('111', '1', '0', '101', null, '0', '300.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 18:53:10', '2016-10-09', '1476010390', '0', '来源编号:ECF32573', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '210', '45', '45', '9999880000', '75', '75');
INSERT INTO `dd_history` VALUES ('112', '3', '0', '805', null, '0', '-1500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 18:53:10', '2016-10-09', '1476010390', '0', '激活能量:ECF32573', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-1500', '0', '0', '98150.1', '11.25', '28.646');
INSERT INTO `dd_history` VALUES ('113', '3', '0', '101', null, '0', '75.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 18:55:19', '2016-10-09', '1476010519', '0', '来源编号:ECF74821', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '52.5', '11.25', '11.25', '98202.6', '22.5', '39.896');
INSERT INTO `dd_history` VALUES ('114', '1', '0', '103', null, '0', '3.750', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 18:55:19', '2016-10-09', '1476010519', '0', '来源编号:ECF18137', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '2.625', '0.563', '0.562', '9999880000', '75.563', '75.562');
INSERT INTO `dd_history` VALUES ('115', '1', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 18:55:19', '2016-10-09', '1476010519', '0', '来源编号:ECF74821', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '70', '15', '15', '9999880000', '90.563', '90.562');
INSERT INTO `dd_history` VALUES ('116', '3', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 18:55:19', '2016-10-09', '1476010519', '0', '激活能量:ECF74821', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-500', '0', '0', '97702.6', '22.5', '39.896');
INSERT INTO `dd_history` VALUES ('117', '18', '0', '101', null, '0', '50.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 18:55:22', '2016-10-09', '1476010522', '0', '来源编号:ECF24714', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '35', '7.5', '7.5', '35', '7.5', '7.5');
INSERT INTO `dd_history` VALUES ('118', '1', '0', '103', null, '0', '2.500', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 18:55:22', '2016-10-09', '1476010522', '0', '来源编号:ECF13786', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '1.75', '0.375', '0.375', '9999880000', '90.938', '90.937');
INSERT INTO `dd_history` VALUES ('119', '3', '0', '101', null, '0', '225.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 18:55:22', '2016-10-09', '1476010522', '0', '来源编号:ECF24714', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '157.5', '33.75', '33.75', '97860.1', '56.25', '73.646');
INSERT INTO `dd_history` VALUES ('120', '1', '0', '103', null, '0', '11.250', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 18:55:22', '2016-10-09', '1476010522', '0', '来源编号:ECF18137', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '7.875', '1.688', '1.687', '9999880000', '92.626', '92.624');
INSERT INTO `dd_history` VALUES ('121', '1', '0', '101', null, '0', '300.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 18:55:22', '2016-10-09', '1476010522', '0', '来源编号:ECF24714', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '210', '45', '45', '9999880000', '137.626', '137.624');
INSERT INTO `dd_history` VALUES ('122', '3', '0', '805', null, '0', '-1500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 18:55:22', '2016-10-09', '1476010522', '0', '激活能量:ECF24714', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-1500', '0', '0', '96360.1', '56.25', '73.646');
INSERT INTO `dd_history` VALUES ('123', '18', '0', '101', null, '0', '50.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 19:00:33', '2016-10-09', '1476010833', '0', '来源编号:ECF19673', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '35', '7.5', '7.5', '70', '15', '15');
INSERT INTO `dd_history` VALUES ('124', '1', '0', '103', null, '0', '2.500', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 19:00:33', '2016-10-09', '1476010833', '0', '来源编号:ECF13786', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '1.75', '0.375', '0.375', '9999880000', '138.001', '137.999');
INSERT INTO `dd_history` VALUES ('125', '1', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 19:00:33', '2016-10-09', '1476010833', '0', '来源编号:ECF19673', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '70', '15', '15', '9999880000', '153.001', '152.999');
INSERT INTO `dd_history` VALUES ('126', '3', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 19:00:33', '2016-10-09', '1476010833', '0', '激活能量:ECF19673', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-500', '0', '0', '95860.1', '56.25', '73.646');
INSERT INTO `dd_history` VALUES ('127', '22', '0', '101', null, '0', '50.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 19:00:37', '2016-10-09', '1476010837', '0', '来源编号:ECF48785', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '35', '7.5', '7.5', '35', '7.5', '7.5');
INSERT INTO `dd_history` VALUES ('128', '1', '0', '103', null, '0', '2.500', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 19:00:37', '2016-10-09', '1476010837', '0', '来源编号:ECF74821', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '1.75', '0.375', '0.375', '9999880000', '153.376', '153.374');
INSERT INTO `dd_history` VALUES ('129', '18', '0', '101', null, '0', '50.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 19:00:37', '2016-10-09', '1476010837', '0', '来源编号:ECF48785', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '35', '7.5', '7.5', '105', '22.5', '22.5');
INSERT INTO `dd_history` VALUES ('130', '1', '0', '103', null, '0', '2.500', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 19:00:37', '2016-10-09', '1476010837', '0', '来源编号:ECF13786', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '1.75', '0.375', '0.375', '9999880000', '153.751', '153.749');
INSERT INTO `dd_history` VALUES ('131', '1', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 19:00:37', '2016-10-09', '1476010837', '0', '来源编号:ECF48785', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '70', '15', '15', '9999880000', '168.751', '168.749');
INSERT INTO `dd_history` VALUES ('132', '3', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 19:00:37', '2016-10-09', '1476010837', '0', '激活能量:ECF48785', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-500', '0', '0', '95360.1', '56.25', '73.646');
INSERT INTO `dd_history` VALUES ('133', '1', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 19:30:22', '2016-10-09', '1476012622', '0', '来源编号:ECF23969', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '70', '15', '15', '9999880000', '183.751', '183.749');
INSERT INTO `dd_history` VALUES ('134', '3', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 19:30:23', '2016-10-09', '1476012623', '0', '激活能量:ECF23969', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-500', '0', '0', '94860.1', '56.25', '73.646');
INSERT INTO `dd_history` VALUES ('135', '24', '0', '101', null, '0', '50.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 19:30:28', '2016-10-09', '1476012628', '0', '来源编号:ECF42738', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '35', '7.5', '7.5', '35', '7.5', '7.5');
INSERT INTO `dd_history` VALUES ('136', '3', '0', '103', null, '0', '2.500', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 19:30:28', '2016-10-09', '1476012628', '0', '来源编号:ECF19673', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '1.75', '0.375', '0.375', '94861.8', '56.625', '74.021');
INSERT INTO `dd_history` VALUES ('137', '1', '0', '103', null, '0', '2.500', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 19:30:28', '2016-10-09', '1476012628', '0', '来源编号:ECF19673', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '1.75', '0.375', '0.375', '9999880000', '184.126', '184.124');
INSERT INTO `dd_history` VALUES ('138', '1', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-09 19:30:28', '2016-10-09', '1476012628', '0', '来源编号:ECF42738', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '70', '15', '15', '9999880000', '199.126', '199.124');
INSERT INTO `dd_history` VALUES ('139', '3', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-09 19:30:28', '2016-10-09', '1476012628', '0', '激活能量:ECF42738', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-500', '0', '0', '94361.8', '56.625', '74.021');
INSERT INTO `dd_history` VALUES ('140', '1', '3', '1000', null, '1', '-100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-10 11:47:50', '2016-10-10', '1476071270', '0', '', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '-100', '0', '0', '9999880000', '199.126', '199.124');
INSERT INTO `dd_history` VALUES ('141', '3', '1', '1001', null, '2', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-10 11:47:51', '2016-10-10', '1476071271', '0', '', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '100', '0', '0', '94461.8', '56.625', '74.021');
INSERT INTO `dd_history` VALUES ('142', '2', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-10 14:51:09', '2016-10-10', '1476082269', '0', '来源编号:ECF43464', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '70', '15', '15', '31731.3', '726.251', '680.739');
INSERT INTO `dd_history` VALUES ('143', '1', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-10 14:51:09', '2016-10-10', '1476082269', '0', '激活能量:ECF43464', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '-500', '0', '0', '9999880000', '199.126', '199.124');
INSERT INTO `dd_history` VALUES ('144', '19', '0', '101', null, '0', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-10 14:52:15', '2016-10-10', '1476082335', '0', '来源编号:ECF94399', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '70', '15', '15', '105', '22.5', '22.5');
INSERT INTO `dd_history` VALUES ('145', '3', '0', '101', null, '0', '300.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-10 14:52:15', '2016-10-10', '1476082335', '0', '来源编号:ECF94399', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '210', '45', '45', '94671.8', '101.625', '119.021');
INSERT INTO `dd_history` VALUES ('146', '1', '0', '805', null, '0', '-4500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-10 14:52:15', '2016-10-10', '1476082335', '0', '激活能量:ECF94399', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '-4500', '0', '0', '9999880000', '199.126', '199.124');
INSERT INTO `dd_history` VALUES ('147', '20', '0', '101', null, '0', '50.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-10 14:55:40', '2016-10-10', '1476082540', '0', '来源编号:ECF72933', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '35', '7.5', '7.5', '35', '7.5', '7.5');
INSERT INTO `dd_history` VALUES ('148', '3', '0', '103', null, '0', '2.500', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-10 14:55:40', '2016-10-10', '1476082540', '0', '来源编号:ECF64645', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '1.75', '0.375', '0.375', '94673.6', '102', '119.396');
INSERT INTO `dd_history` VALUES ('149', '1', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-10 14:55:40', '2016-10-10', '1476082540', '0', '激活能量:ECF72933', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '-500', '0', '0', '9999880000', '199.126', '199.124');
INSERT INTO `dd_history` VALUES ('150', '19', '0', '101', null, '0', '50.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-10 16:32:03', '2016-10-10', '1476088323', '0', '来源编号:ECF49225', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '35', '7.5', '7.5', '140', '30', '30');
INSERT INTO `dd_history` VALUES ('151', '1', '0', '805', null, '0', '-500.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-10 16:32:03', '2016-10-10', '1476088323', '0', '激活能量:ECF49225', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '-500', '0', '0', '9999880000', '199.126', '199.124');
INSERT INTO `dd_history` VALUES ('152', '1', '5', '1000', null, '1', '-100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-17 22:13:24', '2016-10-17', '1476713604', '0', 'rs', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '-100', '0', '0', '9999880000', '199.126', '199.124');
INSERT INTO `dd_history` VALUES ('153', '5', '1', '1001', null, '2', '100.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-17 22:13:24', '2016-10-17', '1476713604', '0', 'rs', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '100', '0', '0', '30563.9', '114.188', '119.83');
INSERT INTO `dd_history` VALUES ('154', '2', '1', '1000', null, '1', '-1.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2016-10-17 22:25:38', '2016-10-17', '1476714338', '0', '', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '-1', '0', '0', '31730.3', '726.251', '680.739');
INSERT INTO `dd_history` VALUES ('155', '1', '2', '1001', null, '2', '1.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '7.000', '0.000', '2016-10-17 22:25:38', '2016-10-17', '1476714338', '0', '', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '7', '0.000', '0', '1', '0', '0', '9999880000', '199.126', '199.124');
INSERT INTO `dd_history` VALUES ('156', '21', '0', '101', null, '0', '60.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2017-02-17 20:55:31', '2017-02-17', '1487336131', '0', '来源编号:ECF73166', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '42', '9', '9', '42', '9', '9');
INSERT INTO `dd_history` VALUES ('157', '3', '0', '103', null, '0', '3.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2017-02-17 20:55:31', '2017-02-17', '1487336131', '0', '来源编号:ECF32573', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '2.1', '0.45', '0.45', '94675.7', '102.45', '119.846');
INSERT INTO `dd_history` VALUES ('158', '19', '0', '101', null, '0', '50.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '2017-02-17 20:55:31', '2017-02-17', '1487336131', '0', '来源编号:ECF73166', null, '0', '0', '0', '0.000', '0.000', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0.000', '0', '35', '7.5', '7.5', '175', '37.5', '37.5');

-- ----------------------------
-- Table structure for dd_indexconfig
-- ----------------------------
DROP TABLE IF EXISTS `dd_indexconfig`;
CREATE TABLE `dd_indexconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner` varchar(100) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `g11` varchar(255) DEFAULT NULL,
  `g12` varchar(255) DEFAULT NULL,
  `g13` varchar(255) DEFAULT NULL,
  `g21` varchar(255) DEFAULT NULL,
  `g22` varchar(255) DEFAULT NULL,
  `g23` varchar(255) DEFAULT NULL,
  `h11` varchar(255) DEFAULT NULL,
  `h12` varchar(255) DEFAULT NULL,
  `h13` varchar(255) DEFAULT NULL,
  `h21` varchar(255) DEFAULT NULL,
  `h22` varchar(255) DEFAULT NULL,
  `h23` varchar(255) DEFAULT NULL,
  `h31` varchar(255) DEFAULT NULL,
  `h32` varchar(255) DEFAULT NULL,
  `h33` varchar(255) DEFAULT NULL,
  `h41` varchar(255) DEFAULT NULL,
  `h42` varchar(255) DEFAULT NULL,
  `h43` varchar(255) DEFAULT NULL,
  `i11` text,
  `i12` text,
  `i13` text,
  `i21` text,
  `i22` text,
  `i23` text,
  `i31` text,
  `i32` text,
  `i33` text,
  `i41` text,
  `i42` text,
  `i43` text,
  `j11` varchar(255) DEFAULT NULL,
  `j12` varchar(255) DEFAULT NULL,
  `j13` varchar(255) DEFAULT NULL,
  `j21` text,
  `j22` text,
  `j23` text,
  `j31` varchar(255) DEFAULT NULL,
  `j32` varchar(255) DEFAULT NULL,
  `j33` varchar(255) DEFAULT NULL,
  `j41` varchar(255) DEFAULT NULL,
  `j42` varchar(255) DEFAULT NULL,
  `j43` varchar(255) DEFAULT NULL,
  `k11` varchar(255) DEFAULT NULL,
  `k12` varchar(255) DEFAULT NULL,
  `k13` varchar(255) DEFAULT NULL,
  `k21` text,
  `k22` text,
  `k23` text,
  `k31` varchar(255) DEFAULT NULL,
  `k32` varchar(255) DEFAULT NULL,
  `k33` varchar(255) DEFAULT NULL,
  `k41` varchar(255) DEFAULT NULL,
  `k42` varchar(255) DEFAULT NULL,
  `k43` varchar(255) DEFAULT NULL,
  `l11` varchar(255) DEFAULT NULL,
  `l12` varchar(255) DEFAULT NULL,
  `l13` varchar(255) DEFAULT NULL,
  `l21` text,
  `l22` text,
  `l23` text,
  `l31` varchar(255) DEFAULT NULL,
  `l32` varchar(255) DEFAULT NULL,
  `l33` varchar(255) DEFAULT NULL,
  `l41` varchar(255) DEFAULT NULL,
  `l42` varchar(255) DEFAULT NULL,
  `l43` varchar(255) DEFAULT NULL,
  `m11` varchar(255) DEFAULT NULL,
  `m12` varchar(255) DEFAULT NULL,
  `m13` varchar(255) DEFAULT NULL,
  `m21` text,
  `m22` text,
  `m23` text,
  `m31` varchar(255) DEFAULT NULL,
  `m32` varchar(255) DEFAULT NULL,
  `m33` varchar(255) DEFAULT NULL,
  `m41` varchar(255) DEFAULT NULL,
  `m42` varchar(255) DEFAULT NULL,
  `m43` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_indexconfig
-- ----------------------------
INSERT INTO `dd_indexconfig` VALUES ('1', '', 'JUST FOR TEST!!', '© 2015 Warburg Pincus LLC. All rights reserved. ', '请交易,不用担心', 'Please, don', '걱정없이 거래하세요', '冠宇和个人或企业在新的数字货币的购买和使用所担忧的部分是新accoin公司的用户不足,持续价值下降的情况。 新数字货币发行用户较多,即使不发行的价值继续下跌,最终成为“0韩元”, accoin问题作为在发行 总公司,再购买恒久的方法解决难题的使用。 ac coin =货币价值100%保证', '', '', 'ac coin是什么?', 'What is the ac coin?', 'AC COIN 이란?', 'ac coin的信息', 'Here is part 2', 'AC COIN의 정보', 'ac coin大华钱包。', 'Ac coin dahua wallet.', 'AC COIN 윈도우 지갑', 'AC币自动取款机', 'AC COIN ATM', 'AC COIN ATM', '', '', '', '', '', '', 'ac coin及利息、传输保管,可以获得的钱包。 相当于储蓄3%的利息支付。 下载后马上ac coin的便利,体验一下。', 'Ac coin and interest, transfer, storage, can get the wallet. Equal to 3% of the savings interest payments. Ac &quot;convenience, immediately after download experience.', 'AC COIN을 보관, 전송 및 이자를 받으실 수 있는 지갑입니다. \r\n예금잔고에 해당하는 연 3%의 이자가 지급됩니다.\r\n다운로드 후 바로 AC COIN의 편리함을 체험해 보세요.', 'ac coin atm,通过国内及国外可以实时汇款。韩语、英语、汉语、日语等多种语言,并支援的采购和销售coin ac自由,可以使用。', 'Ac coin ATM, can be real-time by domestic and foreign remittance. Korean, English, Chinese, Japanese and other languages, and support of the procurement and sales &quot;ac freedom, can be used.', 'AC COIN ATM을 통하여 국내 및 해외로 실시간 송금이 가능합니다. 한국어,영어,중국어,일본어 등 여러 언어를 지원하며 AC COIN의 구매와 판매를 자유롭게 사용하실 수 있습니다.', 'ac coin是什么?', 'What is the ac coin?', 'AC COIN 이란?', 'ac coin数码货币的优点是,维持着缺点,新概念的数码货币。 黄金、美元和等传统资产保管及资产增加的功能当然是快速便捷的外汇交易及结算功能在内的唯一数字货币。 通过担保价值100%无风险投资及钱包的储蓄带来的年利息3%利息提供dream,ac coin的价值增加带来收益不仅提供另外利息。', 'Digital ac coin currency advantage is, to maintain the shortcomings, a new concept of digital currency. Traditional asset custody and assets, such as gold, the dollar and the function of the increase, of course, is fast and convenient foreign exchange trading and clearing function, the only digital currency. Through the collateral value 100% risk-free investment and the wallet savings interest of 3% interest dream, the value of the ac coin increase benefits not only to provide additional interest.', ' 단점을 보완한 신개념의 디지털화폐입니다.금, 달러와 같은 전통적인 자산 보관 및 자산 증대의 기능은 물론 빠르고 편리한 외환거래 및 결제기능을 포함한 유일한 디지털 화폐입니다.100%가치 보증을 통한 무위험 투자 및 지갑의 예금잔고에 따른 연3% 이자를 제공해 드림으로 AC COIN의 가치증대에 따른 수익은 물론 이자 또한 제공합니다. ', '', '', '', '', '', '', 'ac coin的信息', 'Coin AC information', 'AC COIN의 정보', '&gt; total balance(总发行数量):约88亿的AC币\r\n&gt;补偿•布洛克(reward block 1674):2个。\r\n&gt;block target解除•布洛克(1分):时间预计\r\n&gt;difficulty调整难易度(retarget 26400):时间blocks(约15日)\r\n&gt;genesis block open(第一次block发行日):2016年6月7日\r\n&gt;method(开采mining x11):方式pow / pos', '&gt;The total balance (total release quantity) : about 8.8 billion accoin\r\n&gt;Compensation block (reward block, 1674) : 2.\r\n&gt;Block target lifted block (1) : time is expected\r\n&gt;Difficulty adjusting difficulty level (retarget 26400) : time blocks (about 15)\r\n&gt;Genesis block open (the date of issue of the first block) : on June 7, 2016\r\n&gt;Mining method (mining, x11) : means pow/pos', ' Total balance(총 발행수) : 약 88억개 코인Block reward(블럭 보상) : 1674.2개Block target(블럭해제예상시간) : 1분Difficulty retarget(난이도 재조정시간) : 26400 blocks(약 15일)Genesis block open(첫 블록 발행일) : 2016년 2월 1일Mining method(채굴 방식) : X11 POW / POS ', '', '', '', '', '', '', 'ac coin大华钱包。', 'Ac coin dahua wallet.', 'AC COIN 윈도우 지갑', 'ac coin及利息、传输保管,可以获得的钱包。 相当于储蓄3%的利息支付。 下载后马上ac coin的便利,体验一下。', 'Ac coin and interest, transfer, storage, can get the wallet. Equal to 3% of the savings interest payments. Ac &quot;convenience, immediately after download experience.', 'AC COIN을 보관, 전송 및 이자를 받으실 수 있는 지갑입니다.예금잔고에 해당하는 연 3%의 이자가 지급됩니다.다운로드 후 바로 AC COIN의 편리함을 체험해 보세요.', '', '', '', '', '', '', 'AC币自动取款机', 'AC COIN ATM', 'AC COIN ATM', 'ac coin atm,通过国内及国外可以实时汇款。韩语、英语、汉语、日语等多种语言,并支援的采购和销售coin ac自由,可以使用。', 'Ac coin ATM, can be real-time by domestic and foreign remittance. Korean, English, Chinese, Japanese and other languages, and support of the procurement and sales &quot;ac freedom, can be used.', 'AC COIN ATM을 통하여 국내 및 해외로 실시간 송금이 가능합니다.한국어,영어,중국어,일본어 등 여러 언어를 지원하며 AC COIN의 구매와 판매를 자유롭게 사용하실 수 있습니다. ', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for dd_indexnews
-- ----------------------------
DROP TABLE IF EXISTS `dd_indexnews`;
CREATE TABLE `dd_indexnews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `entitle` varchar(255) DEFAULT NULL,
  `content` text,
  `encontent` text,
  `decription` varchar(255) DEFAULT NULL,
  `endescription` varchar(255) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `top` int(11) NOT NULL DEFAULT '0',
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_indexnews
-- ----------------------------
INSERT INTO `dd_indexnews` VALUES ('10', '2', '善用香港优势开拓海外市场', '善用香港優勢開拓海外市場', '<p style=\"text-indent:28px;font-size:14px;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	投资推广署是香港特别行政区政府属下部门，专责为香港促进外来直接投资，致力协助海外及内地企业在香港开设和拓展业务。本署致力引进有助香港经济发展的外来投资，并鼓励这些投资项目留港发展。自2000年成立以来，投资推广署协助了全球数以千计的公司在香港发展业务。本署以热诚态度、重视诚信、专业服务、方便营商、以及迅速回应为原则，应企业的需要提供服务。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	投资推广署通过推广、促进工作及后续支持服务等多方面的工作，为海外及内地的企业家提供全面、免费而保密的服务，以增加他们对香港营商环境的认识，让企业家有更强的信心在香港设点。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	一家企业在决定前往香港设点前需要做很多市场调研的工作。投资推广署可免费为企业家提供最新的信息，包括香港经济资料、法律条例、税务与会计制度、雇佣条例、租金与工资水平、行业分析等；让企业家准确地评估商业前景，做出正确的投资决定。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	投资推广署设有不同的行业服务小组，专门服务来自不同行业的企业。如果企业决定前往香港开业，也就是投资中期阶段的时候，投资推广署提供的辅助服务包括介绍可靠的中介机构，如会计师、律师、地产代理，协助申请行业牌照、行政人员工作签证、公司注册、商业登记、办公室租赁、员工招聘等。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	为配合国家鼓励企业“走出去”的政策，投资推广署已投放更多资源在内地市场，分别在北京、广州、上海、成都及武汉派驻投资推广组。<span style=\"color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">武汉投资推广组于2014年7月成</span><span style=\"line-height:24px;\">立，服务范围包括湖北、湖南、河南、江西及山西五省。武汉投资推广组自成立后，主动联系服务范围内的相关政府机构以及各行各业的大小企业，安排了超过150次的会议与拜访；并积极参与和举办多项活动，例如，投资推广署在2014年10月28日应宜昌市商务局邀请，担任其主办的中小企业融资讲座的演讲嘉宾。2015年1月28日与香港特別行政区政府驻武汉经济贸易办事处合办了春节招待酒会，为湖北商界与在鄂港商提供交流机会。在2015年3月5日及6日，投资推广署分别于武汉及郑州举办投资推广研讨会，为湖北及河南的企业带来香港税制、金融服务、营商环境以及出入境政策的最新资讯，并鼓励两地的企业通过香港，走向国际。</span><span style=\"color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">\r\n	<p style=\"text-indent:28px;font-size:14px;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n		在香港开业过程便捷简易，加上投资推广署提供的免费、专项及保密的服务及协助，一切将更轻松自在。投资推广署在香港总部、驻内地及驻海外的团队合作无间，努力协助客户在本港开业或拓展业务。<span style=\"color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;font-size:14px;line-height:21px;background-color:#FFFFFF;\">投资推广署</span>与客户保持长远的伙伴关系，无论客户的业务发展至任何阶段，<span style=\"color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;font-size:14px;line-height:21px;background-color:#FFFFFF;\">投资推广署</span>都能提供相应的协助。\r\n	</p>\r\n<br />\r\n</span>\r\n</p>', '<span style=\"font-size:14px;\">&nbsp; &nbsp; &nbsp; &nbsp;投資推廣署是香港特別行政區政府屬下部門，專責為香港促進外來直接投資，致力協助海外及內地企業在香港開設和拓展業務。本署致力引進有助香港經濟發展的外來投資，並鼓勵這些投資項目留港發展。自2000年成立以來，投資推廣署協助了全球數以千計的公司在香港發展業務。本署以熱誠態度、重視誠信、專業服務、方便營商、以及迅速回應為原則，應企業的需要提供服務。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp; &nbsp; &nbsp; &nbsp;投資推廣署通過推廣、促進工作及後續支持服務等多方面的工作，為海外及內地的企業家提供全面、免費而保密的服務，以增加他們對香港營商環境的認識，讓企業家有更強的信心在香港設點。</span><br />\r\n<span style=\"font-size:14px;\">壹家企業在決定前往香港設點前需要做很多市場調研的工作。投資推廣署可免費為企業家提供最新的信息，包括香港經濟資料、法律條例、稅務與會計制度、雇傭條例、租金與工資水平、行業分析等；讓企業家準確地評估商業前景，做出正確的投資決定。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp; &nbsp; &nbsp; &nbsp;投資推廣署設有不同的行業服務小組，專門服務來自不同行業的企業。如果企業決定前往香港開業，也就是投資中期階段的時候，投資推廣署提供的輔助服務包括介紹可靠的中介機構，如會計師、律師、地產代理，協助申請行業牌照、行政人員工作簽證、公司註冊、商業登記、辦公室租賃、員工招聘等。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp; &nbsp; &nbsp; &nbsp;為配合國家鼓勵企業“走出去”的政策，投資推廣署已投放更多資源在內地市場，分別在北京、廣州、上海、成都及武漢派駐投資推廣組。武漢投資推廣組於2014年7月成立，服務範圍包括湖北、湖南、河南、江西及山西五省。武漢投資推廣組自成立後，主動聯系服務範圍內的相關政府機構以及各行各業的大小企業，安排了超過150次的會議與拜訪；並積極參與和舉辦多項活動，例如，投資推廣署在2014年10月28日應宜昌市商務局邀請，擔任其主辦的中小企業融資講座的演講嘉賓。2015年1月28日與香港特別行政區政府駐武漢經濟貿易辦事處合辦了春節招待酒會，為湖北商界與在鄂港商提供交流機會。在2015年3月5日及6日，投資推廣署分別於武漢及鄭州舉辦投資推廣研討會，為湖北及河南的企業帶來香港稅制、金融服務、營商環境以及出入境政策的最新資訊，並鼓勵兩地的企業通過香港，走向國際。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp; &nbsp; &nbsp; &nbsp;在香港開業過程便捷簡易，加上投資推廣署提供的免費、專項及保密的服務及協助，壹切將更輕松自在。投資推廣署在香港總部、駐內地及駐海外的團隊合作無間，努力協助客戶在本港開業或拓展業務。投資推廣署與客戶保持長遠的夥伴關系，無論客戶的業務發展至任何階段，投資推廣署都能提供相應的協助。</span><br />', '', '', '', '0', '2015-04-09 20:24:01');
INSERT INTO `dd_indexnews` VALUES ('8', '1', '美国CRO投资集团市场奖励计划', '香港萬盛投資集團市場獎勵計劃', '<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022134_27421.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022137_76763.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022140_93048.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022143_66651.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022145_96053.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022148_92534.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022151_93232.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022154_60457.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022157_71240.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022159_80219.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022202_38300.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022205_68691.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022208_14886.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022210_27396.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022213_73102.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022216_30475.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022218_27259.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022222_63319.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022224_15921.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022228_42489.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022319_77439.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150408/20150408022322_11961.jpg\" alt=\"\" /> \r\n</p>', '<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165849_70251.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165852_10565.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165856_42351.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165859_44804.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165901_57617.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/attached/image/20150408/20150408022433_62525.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165907_37682.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165909_81488.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165912_42552.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165915_27133.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165917_79227.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165920_81716.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165922_66107.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165926_20252.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165928_67713.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165931_63390.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165934_56433.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165936_16443.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165939_73619.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407165941_63201.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/php/../attached/image/20150407/20150407170033_79683.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/kedite/attached/image/20150408/20150408022457_57807.jpg\" alt=\"\" />\r\n</p>', '', '', '', '0', '2015-09-01 23:21:52');
INSERT INTO `dd_indexnews` VALUES ('7', '1', '热烈欢迎美国CRO投资集团', '  熱烈香港萬盛投資集團新網站全新上線', '<span style=\"font-family:NSimSun;font-size:24px;\"> <span style=\"font-size:18px;\"> 热烈庆祝美国CRO投资集团全新上线，欢迎提出宝贵意见！</span></span>', '            <span style=\"font-family:NSimSun;font-size:18px;\">熱烈慶祝香港萬盛投資集團網站全新上線，歡迎提出寶貴意見！</span>', '', '', '', '0', '2015-09-01 23:11:26');
INSERT INTO `dd_indexnews` VALUES ('11', '2', '香港：企业走向世界的前沿阵地', '香港：企業走向世界的前沿陣地', '<p style=\"font-size:16px;text-indent:2em;color:#252525;font-family:宋体, sans-serif;text-align:justify;background-color:#FFFFFF;\">\r\n	香港获国内外公认的全球最有利营商的城市之一。香港的地理位置优越、基建先进、法制完善、经济自由，不断吸引着国内外企业、资金、人才到来。\r\n</p>\r\n<p style=\"font-size:16px;text-indent:2em;color:#252525;font-family:宋体, sans-serif;text-align:justify;background-color:#FFFFFF;\">\r\n	据世界银行的《2015年全球营商环境报告》显示，香港在便利营商排名表上位居全球第三位。美国智库密尔肯研究院2013年发布的《全球机会指数》把香港评选为对外来直接投资最具吸引力的经济体。多年来，香港一直获传统基金会和菲沙研究所评选的全球最自由的经济体。《商旅》杂志（亚太版）的2014年度读者调查再次选出香港为“全球最佳商务城市”。\r\n</p>\r\n<p style=\"font-size:16px;text-indent:2em;color:#252525;font-family:宋体, sans-serif;text-align:justify;background-color:#FFFFFF;\">\r\n	这使香港拥有强大的竞争力。中国社会科学院2014年发表的研究报告中，继续把香港评为中国最具综合竞争力的城市。瑞士洛桑国际管理发展学院2014年发表的《世界竞争力年报》，把香港的竞争力评为全球第四位，并在亚洲排名第二。\r\n</p>\r\n<p style=\"font-size:16px;text-indent:2em;color:#252525;font-family:宋体, sans-serif;text-align:justify;background-color:#FFFFFF;\">\r\n	国际企业为此纷纷选择香港作为进入中国内地和亚洲庞大市场的“桥头堡”，并到香港设立办事处。这既带来资金，也创造高增值职位，并同时带来不同领域的人才、新的管理文化及崭新的技术，进一步使香港荟萃中西文化，迸发出新创意。\r\n</p>\r\n<p style=\"font-size:16px;text-indent:2em;color:#252525;font-family:宋体, sans-serif;text-align:justify;background-color:#FFFFFF;\">\r\n	对于内地企业，香港同样是扩展业务的重要地方。\r\n</p>\r\n<p style=\"font-size:16px;text-indent:2em;color:#252525;font-family:宋体, sans-serif;text-align:justify;background-color:#FFFFFF;\">\r\n	香港拥有大量熟悉中国文化和国际商务的人才，是内地企业打进国际市场的理想前沿阵地。香港凭着对国际和内地状况的了解，可以充当内地企业与世界之间的“超级联系人”，让内地企业在“走向世界”中事半功倍。香港一向是内地企业寻求新意念、正面经验和信息的源泉，未来也将如此。\r\n</p>\r\n<p style=\"font-size:16px;text-indent:2em;color:#252525;font-family:宋体, sans-serif;text-align:justify;background-color:#FFFFFF;\">\r\n	<p style=\"font-size:16px;text-indent:2em;color:#252525;font-family:宋体, sans-serif;text-align:justify;background-color:#FFFFFF;\">\r\n		香港作为中国的国际金融中心，能为中国企业提供融资平台。香港是内地企业最大的资金来源，内地企业到香港上市有助提升国际知名度和公司管治水平。截至2015年2月底，共有891家内地企业在香港上市，市值约159775亿元，占香港上市公司总市值的60.9%。香港特区政府将继续在各个范畴加强与内地的联系，并支持内地公司在香港开设业务。\r\n	</p>\r\n	<p style=\"font-size:16px;text-indent:2em;color:#252525;font-family:宋体, sans-serif;text-align:justify;background-color:#FFFFFF;\">\r\n		《内地与香港关于建立更紧密经贸关系的安排》（CEPA）是香港与内地签订的自由贸易协议，为香港的服务提供商在内地带来庞大的机遇。在2014年11月推出的“沪港通”计划，是中央政府支持香港作为国际金融中心的最新例证。它把两地的资本市场直接联系起来，对香港和内地资本市场未来的合作发展具有重大历史意义。它将促进内地与国际股票市场的接轨，巩固香港作为最大离岸人民币业务枢纽和内地与国外之间“超级联系人”的地位。<span style=\"line-height:1.5;\"></span>\r\n	</p>\r\n</p>', '<span style=\"font-size:14px;\">&nbsp; &nbsp; 香港獲國內外公認的全球最有利營商的城市之壹。香港的地理位置優越、基建先進、法制完善、經濟自由，不斷吸引著國內外企業、資金、人才到來。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp; &nbsp; 據世界銀行的《2015年全球營商環境報告》顯示，香港在便利營商排名表上位居全球第三位。美國智庫密爾肯研究院2013年發布的《全球機會指數》把香港評選為對外來直接投資最具吸引力的經濟體。多年來，香港壹直獲傳統基金會和菲沙研究所評選的全球最自由的經濟體。《商旅》雜誌（亞太版）的2014年度讀者調查再次選出香港為“全球最佳商務城市”。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp; &nbsp; </span><span style=\"font-size:14px;\">這使香港擁有強大的競爭力。中國社會科學院2014年發表的研究報告中，繼續把香港評為中國最具綜合競爭力的城市。瑞士洛桑國際管理發展學院2014年發表的《世界競爭力年報》，把香港的競爭力評為全球第四位，並在亞洲排名第二。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp; &nbsp; 國際企業為此紛紛選擇香港作為進入中國內地和亞洲龐大市場的“橋頭堡”，並到香港設立辦事處。這既帶來資金，也創造高增值職位，並同時帶來不同領域的人才、新的管理文化及嶄新的技術，進壹步使香港薈萃中西文化，迸發出新創意。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp; &nbsp;&nbsp;</span><span style=\"font-size:14px;\">對於內地企業，香港同樣是擴展業務的重要地方。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp; &nbsp; 香港擁有大量熟悉中國文化和國際商務的人才，是內地企業打進國際市場的理想前沿陣地。香港憑著對國際和內地狀況的了解，可以充當內地企業與世界之間的“超級聯系人”，讓內地企業在“走向世界”中事半功倍。香港壹向是內地企業尋求新意念、正面經驗和信息的源泉，未來也將如此。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp; &nbsp; 香港作為中國的國際金融中心，能為中國企業提供融資平臺。香港是內地企業最大的資金來源，內地企業到香港上市有助提升國際知名度和公司管治水平。截至2015年2月底，共有891家內地企業在香港上市，市值約159775億元，占香港上市公司總市值的60.9%。香港特區政府將繼續在各個範疇加強與內地的聯系，並支持內地公司在香港開設業務。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp; &nbsp;</span><span style=\"font-size:14px;\">《內地與香港關於建立更緊密經貿關系的安排》（CEPA）是香港與內地簽訂的自由貿易協議，為香港的服務提供商在內地帶來龐大的機遇。在2014年11月推出的“滬港通”計劃，是中央政府支持香港作為國際金融中心的最新例證。它把兩地的資本市場直接聯系起來，對香港和內地資本市場未來的合作發展具有重大歷史意義。它將促進內地與國際股票市場的接軌，鞏固香港作為最大離岸人民幣業務樞紐和內地與國外之間“超級聯系人”的地位。</span><br />', '', '', '', '0', '2015-04-09 20:28:23');
INSERT INTO `dd_indexnews` VALUES ('12', '2', '六大理财宝典如何成就一代富豪', '六大理財寶典如何成就壹代富豪', '<p style=\"font-family:宋体, Arial, sans-serif;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	在博鳌亚洲论坛最后一天，也就是3月29日，上演了一场压轴大戏，由百度的首席执行官李彦宏客串主持人，采访了微软的创始人比尔盖茨和Space X创始人马斯克。由于这三人的身价，被外界评论是价值超过了千亿人民币的对话。有人说世界的是不公平的，就是有人形象好气质佳，又有钱。但是嘉丰瑞德理财师认为，世界上没有绝对的公平，我们要做的就是磨练自己，给自己的成功创造更多的潜在可能。\r\n</p>\r\n<p style=\"font-family:宋体, Arial, sans-serif;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	据在现场的记者说，原本以为这三个人会聊点技术话题，结果他们却在大聊人生和理想。这些扯皮在别人那儿也许毫无意义，但是由于是这三个人，所以显得非常珍贵及牛逼。\r\n</p>\r\n<p style=\"font-family:宋体, Arial, sans-serif;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	一、白手起家的阶段好好积累资本金\r\n</p>\r\n<p style=\"font-family:宋体, Arial, sans-serif;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	由于上文提到的三个人本身资金实力都比较雄厚，所以不在一个起跑线上的，白手起家的人，首先要做的就是积累资本金，努力工作，通过理财拿到原始的第一桶金。比如在初始阶段可以投资一些类似于宜盛月定投这样的年化收益率为6.8%的理财产品，然后我们可以继续投资年化收益率在10%左右的宜盛宝，这类理财产品周期大约在一年左右，进可攻退可守，就按照这样的节奏积累几年，也就是积累到了第一桶金。当然，最关键的还是要努力工作，使自己具备更多的竞争力。\r\n</p>\r\n<p style=\"font-family:宋体, Arial, sans-serif;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	二、攒够了资本金，即使只有10%的成功可能，也要去做\r\n</p>\r\n<p style=\"font-family:宋体, Arial, sans-serif;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	这句话的原话是来自马斯克。“就像比尔·盖茨先生所讲到的，其实一开始我没有预想我要做这么庞大的事情。只要这件事有10%的成功率，我就去做，现在做特斯拉也是这样，我一开始做电动车的时候，人们都劝我说，开汽车公司都是傻子，开电动汽车的公司是傻子中的战斗机，但我们依然没有停止，依然尝试了很多次。”\r\n</p>\r\n<p style=\"font-family:宋体, Arial, sans-serif;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	三、精神世界的修为和资本的积累一样重要\r\n</p>\r\n<p style=\"font-family:宋体, Arial, sans-serif;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	“人丑就要多读书”嘉丰瑞德理财师认为，不丑也要多读书。世界上多的是比你美，还比你更爱读书的人，精神世界的层次决定了你的层次。所谓人要往上爬就是这个道理，“土财主”之所以“土”，发了财还得不到尊敬，就是因为他精神层面所在的层次不足以支撑他的财富，所以说呢，提高精神层次的最直白的方式还是读书，不管怎样都要读书，忙里偷闲也要读书，凿壁借光、悬梁刺股都要读书。\r\n</p>\r\n<p style=\"font-family:宋体, Arial, sans-serif;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	四、学会创新，等待机遇\r\n</p>\r\n<p style=\"font-family:宋体, Arial, sans-serif;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	大佬们其实也谈了谈具体业务，马斯克说到他的无人驾驶汽车，说从技术角度来说，无人驾驶汽车两到三年之后，就会比有人驾驶更安全；大规模量产的话，五年之后就可以实现。但要让无人驾驶被主流人群接受，还必须有政府相关法规的支持。但是在此之前，这种蕴含着无限可能的技术依然会被不断地改进。\r\n</p>\r\n<p style=\"font-family:宋体, Arial, sans-serif;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	五、起得早，养成良好的习惯\r\n</p>\r\n<p style=\"font-family:宋体, Arial, sans-serif;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	对话结束时，才不到早上八点半！有人就说了，世界上最可怕的事发生了，大佬们7点就开始聊未来了！其实大佬们的作息习惯都非常好，日子过得很有纪律性，不会赖床，不会晚上打游戏到半夜，虽然胡适大师留下了“7月13日，打牌；7月14日，打牌…7月16日，胡适啊你不能再堕落了；7月17日，打牌；7月18日，打牌”的日记，但是据嘉丰瑞德理财师实地翻开胡适日记考证，胡适大师打牌只是消遣，人家还是把该做的事情都做完了再去打牌的，囧。今日事今日毕，不能给拖延症可趁之机。\r\n</p>\r\n<p style=\"font-family:宋体, Arial, sans-serif;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	六、学会感恩和回馈\r\n</p>\r\n<p style=\"font-family:宋体, Arial, sans-serif;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	嘉丰瑞德理财师认为，比尔盖茨算是一个格局非常大的人，知道力量越大责任越大，所以他能说出“当我在二十多岁的时候，应该不会因为做慈善而有多大的满足感，毕竟那时候中国记得更多的是微软本身，从现在这个阶段来说，我觉得我可以做出最大的贡献，都是通过慈善基金(微博)会来实现的。”\r\n</p>', '&nbsp; &nbsp;在博鰲亞洲論壇最後壹天，也就是3月29日，上演了壹場壓軸大戲，由百度的首席執行官李彥宏客串主持人，采訪了微軟的創始人比爾蓋茨和Space X創始人馬斯克。由於這三人的身價，被外界評論是價值超過了千億人民幣的對話。有人說世界的是不公平的，就是有人形象好氣質佳，又有錢。但是嘉豐瑞德理財師認為，世界上沒有絕對的公平，我們要做的就是磨練自己，給自己的成功創造更多的潛在可能。<br />\r\n&nbsp; &nbsp;據在現場的記者說，原本以為這三個人會聊點技術話題，結果他們卻在大聊人生和理想。這些扯皮在別人那兒也許毫無意義，但是由於是這三個人，所以顯得非常珍貴及牛逼。<br />\r\n&nbsp; &nbsp;壹、白手起家的階段好好積累資本金<br />\r\n&nbsp; &nbsp;由於上文提到的三個人本身資金實力都比較雄厚，所以不在壹個起跑線上的，白手起家的人，首先要做的就是積累資本金，努力工作，通過理財拿到原始的第壹桶金。比如在初始階段可以投資壹些類似於宜盛月定投這樣的年化收益率為6.8%的理財產品，然後我們可以繼續投資年化收益率在10%左右的宜盛寶，這類理財產品周期大約在壹年左右，進可攻退可守，就按照這樣的節奏積累幾年，也就是積累到了第壹桶金。當然，最關鍵的還是要努力工作，使自己具備更多的競爭力。<br />\r\n&nbsp; &nbsp;二、攢夠了資本金，即使只有10%的成功可能，也要去做<br />\r\n&nbsp; &nbsp;這句話的原話是來自馬斯克。“就像比爾·蓋茨先生所講到的，其實壹開始我沒有預想我要做這麽龐大的事情。只要這件事有10%的成功率，我就去做，現在做特斯拉也是這樣，我壹開始做電動車的時候，人們都勸我說，開汽車公司都是傻子，開電動汽車的公司是傻子中的戰鬥機，但我們依然沒有停止，依然嘗試了很多次。”<br />\r\n&nbsp; &nbsp;三、精神世界的修為和資本的積累壹樣重要<br />\r\n&nbsp; &nbsp;“人醜就要多讀書”嘉豐瑞德理財師認為，不醜也要多讀書。世界上多的是比妳美，還比妳更愛讀書的人，精神世界的層次決定了妳的層次。所謂人要往上爬就是這個道理，“土財主”之所以“土”，發了財還得不到尊敬，就是因為他精神層面所在的層次不足以支撐他的財富，所以說呢，提高精神層次的最直白的方式還是讀書，不管怎樣都要讀書，忙裏偷閑也要讀書，鑿壁借光、懸梁刺股都要讀書。<br />\r\n&nbsp; &nbsp;四、學會創新，等待機遇<br />\r\n&nbsp; &nbsp;大佬們其實也談了談具體業務，馬斯克說到他的無人駕駛汽車，說從技術角度來說，無人駕駛汽車兩到三年之後，就會比有人駕駛更安全；大規模量產的話，五年之後就可以實現。但要讓無人駕駛被主流人群接受，還必須有政府相關法規的支持。但是在此之前，這種蘊含著無限可能的技術依然會被不斷地改進。<br />\r\n&nbsp; &nbsp;五、起得早，養成良好的習慣<br />\r\n&nbsp; &nbsp;對話結束時，才不到早上八點半！有人就說了，世界上最可怕的事發生了，大佬們7點就開始聊未來了！其實大佬們的作息習慣都非常好，日子過得很有紀律性，不會賴床，不會晚上打遊戲到半夜，雖然胡適大師留下了“7月13日，打牌；7月14日，打牌…7月16日，胡適啊妳不能再墮落了；7月17日，打牌；7月18日，打牌”的日記，但是據嘉豐瑞德理財師實地翻開胡適日記考證，胡適大師打牌只是消遣，人家還是把該做的事情都做完了再去打牌的，囧。今日事今日畢，不能給拖延癥可趁之機。<br />\r\n&nbsp; &nbsp;六、學會感恩和回饋<br />\r\n&nbsp; &nbsp;嘉豐瑞德理財師認為，比爾蓋茨算是壹個格局非常大的人，知道力量越大責任越大，所以他能說出“當我在二十多歲的時候，應該不會因為做慈善而有多大的滿足感，畢竟那時候中國記得更多的是微軟本身，從現在這個階段來說，我覺得我可以做出最大的貢獻，都是通過慈善基金(微博)會來實現的。”<br />', '', '', '', '0', '2015-04-09 20:46:50');
INSERT INTO `dd_indexnews` VALUES ('13', '2', '靠谱的投资理财“三三”定律', '靠譜的投資理財“三三”定律', '<strong>&nbsp; &nbsp;&nbsp;</strong><span style=\"color:#333333;font-family:宋体;font-size:16px;line-height:1.5;\">我们理财为的是让财富更快、更稳定的增值，可凡事也讲究一个规律，那理财的规律是如何呢？对此，国内知名理财机构嘉丰瑞德</span><span style=\"color:#333333;font-family:宋体;font-size:16px;line-height:1.5;\">通过长期观察和分析投资行为，特意总结了一些理财方面的“三三定律”。假如参考而做的话，相信会帮助你的财富能更好的成长。</span> \r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　</span><span>做到这三个</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　</span><span>1、做到节约</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　常常听到人抱怨没有可用于投资的钱。其实不然，注意节约、省钱的话，同样能拿得出资金用以投资。要想富裕，人们总得有个取舍，所以某些在花钱方面比较浪费和不太值得的，应主动舍弃，节约出资金用以进行投资和理财。</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　</span><span>2、做到计划</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　有了节约，即有了一定的资金。而有了资金，即可以做投资了。这时候需要考验如何规划投资。投资有很多种，可以考虑配比。比如偏稳健的国债、银行理财产品投资，以3年期的国债为例，收益大约是5%左右；而银行理财产品，如上海某一城商行的12个月投资期限的银行理财产品，年收益率在5.9%左右。此外投资风险也较低的固定收益类理财也不错，以宜盛财富发行的宜盛宝产品为例，年收益是9.6%；另外还有就是股市类的投资，风险比较大，但风险性收益也相当可观，做好股市的配比投资也是计划中相当重要的一部分。目前股市近期创出了几年来的新高，可以适当考虑。</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　</span><span>3、做到向理性的接近</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　做到理性，这说起来容易做起来难。不过要是做到向理性靠近，这恐怕是可以做到的。嘉丰瑞德理财师认为，对于投资者来说，要避免大面积的投资失败，不应一味只追求高收益，也不要过于跟风散户去投资、以及不要过于集中投资是比较重要的原则。另外，投资者应合理的预期投资收益、理性的分配资金，最终才能帮助你较好的达成目标。</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　</span><span>修炼这三条</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　</span><span>1、知识的修炼</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　作为投资者，万万不可忽视对金融知识、投资知识的学习和积累，这对于专业机构来说也是一样。故嘉丰瑞德</span><span>理财师建议，平时可多了解财经和投资资讯，多方参考专业人士的意见。</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　</span><span>2、信息平衡的修炼</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　有些人特别相信某些机构的判断，或特别相信某些专家的判断。但是话说回来，机构或人，总归是会犯错。因此投资人需要修炼在做决策时做到在“信任“和“不信任”之间的平衡。总之对信息，投资者要有自己的判断能力。</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　</span><span>3、心态的修炼</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　我们做投资，最重要是实现财务</span><span>自由，进而过上更好的生活。而倘若做投资的你整日因为投资而诚惶诚恐，或忙得影响了工作，“连累”到其他的幸福，那则是不太可取的。投资把心态放稳，把握长远，细水长流更好。</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:16px;background-color:#FFFFFF;\">\r\n	<span>　　总结了以上的“三个做到“和“三个修炼”，想必投资者对于投资可能也有了自己的一些看法。</span><img src=\"http://comment.10jqka.com.cn/sourcepic/12/vM634cjwtcItsay.png\" /><span>理财师认为，“三三定律”可能不能完全做到，但做到80%的话，那对投资还是会有相当大的帮助的。</span> \r\n</p>', '    我們理財為的是讓財富更快、更穩定的增值，可凡事也講究壹個規律，那理財的規律是如何呢？對此，國內知名理財機構嘉豐瑞德通過長期觀察和分析投資行為，特意總結了壹些理財方面的“三三定律”。假如參考而做的話，相信會幫助妳的財富能更好的成長。<br />\r\n　 做到這三個<br />\r\n　 1、做到節約<br />\r\n　 常常聽到人抱怨沒有可用於投資的錢。其實不然，註意節約、省錢的話，同樣能拿得出資金用以投資。要想富裕，人們總得有個取舍，所以某些在花錢方面比較浪費和不太值得的，應主動舍棄，節約出資金用以進行投資和理財。<br />\r\n　 2、做到計劃<br />\r\n　 有了節約，即有了壹定的資金。而有了資金，即可以做投資了。這時候需要考驗如何規劃投資。投資有很多種，可以考慮配比。比如偏穩健的國債、銀行理財產品投資，以3年期的國債為例，收益大約是5%左右；而銀行理財產品，如上海某壹城商行的12個月投資期限的銀行理財產品，年收益率在5.9%左右。此外投資風險也較低的固定收益類理財也不錯，以宜盛財富發行的宜盛寶產品為例，年收益是9.6%；另外還有就是股市類的投資，風險比較大，但風險性收益也相當可觀，做好股市的配比投資也是計劃中相當重要的壹部分。目前股市近期創出了幾年來的新高，可以適當考慮。<br />\r\n　 3、做到向理性的接近<br />\r\n　 做到理性，這說起來容易做起來難。不過要是做到向理性靠近，這恐怕是可以做到的。嘉豐瑞德理財師認為，對於投資者來說，要避免大面積的投資失敗，不應壹味只追求高收益，也不要過於跟風散戶去投資、以及不要過於集中投資是比較重要的原則。另外，投資者應合理的預期投資收益、理性的分配資金，最終才能幫助妳較好的達成目標。<br />\r\n　 修煉這三條<br />\r\n　 1、知識的修煉<br />\r\n　 作為投資者，萬萬不可忽視對金融知識、投資知識的學習和積累，這對於專業機構來說也是壹樣。故嘉豐瑞德理財師建議，平時可多了解財經和投資資訊，多方參考專業人士的意見。<br />\r\n　 2、信息平衡的修煉<br />\r\n　 有些人特別相信某些機構的判斷，或特別相信某些專家的判斷。但是話說回來，機構或人，總歸是會犯錯。因此投資人需要修煉在做決策時做到在“信任“和“不信任”之間的平衡。總之對信息，投資者要有自己的判斷能力。<br />\r\n　 3、心態的修煉<br />\r\n　 我們做投資，最重要是實現財務自由，進而過上更好的生活。而倘若做投資的妳整日因為投資而誠惶誠恐，或忙得影響了工作，“連累”到其他的幸福，那則是不太可取的。投資把心態放穩，把握長遠，細水長流更好。<br />\r\n　 總結了以上的“三個做到“和“三個修煉”，想必投資者對於投資可能也有了自己的壹些看法。理財師認為，“三三定律”可能不能完全做到，但做到80%的話，那對投資還是會有相當大的幫助的。<br />', '', '', '', '0', '2015-04-09 20:53:46');
INSERT INTO `dd_indexnews` VALUES ('14', '2', '月光族必看的理财技巧', '月光族必看的理財技巧', '<p style=\"font-size:14px;font-family:微软雅黑, 宋体;background-color:#FFFFFF;\">\r\n	       现在很多理财意识较强的工薪族想要理财，都是每月领到薪水，待日常生活消费后，再将剩余的钱存入银行。到头来，有些人却发现，由于自己无计划地消费，每月所能存入银行的钱非常少。现就就教大家三个理财公式，让你的小金库里的钱越来越多。\r\n</p>\r\n<p style=\"font-size:14px;font-family:微软雅黑, 宋体;background-color:#FFFFFF;\">\r\n	　　公式一：支出=收入-储蓄\r\n</p>\r\n<p style=\"font-size:14px;font-family:微软雅黑, 宋体;background-color:#FFFFFF;\">\r\n	　　每月先将30%的收入存入银行，剩下的钱用于当月消费资金。\r\n</p>\r\n<p style=\"font-size:14px;font-family:微软雅黑, 宋体;background-color:#FFFFFF;\">\r\n	　　公式二：储蓄=50%保守理财+50%“稳攻”和“强攻”\r\n</p>\r\n<p style=\"font-size:14px;font-family:微软雅黑, 宋体;background-color:#FFFFFF;\">\r\n	　　把50%的资金用于定存、投入货币基金或者购买银行保本理财产品等。剩余50%资金可进行“稳攻”和“强攻”，即25%可以购买一些风险低收益中等的理财产品，另外25%购买风险性高一些收益较高的理财产品。\r\n</p>\r\n<p style=\"font-size:14px;font-family:微软雅黑, 宋体;background-color:#FFFFFF;\">\r\n	　　公式三：个人可承担风险比重=100-目前年龄\r\n</p>\r\n<p style=\"font-size:14px;font-family:微软雅黑, 宋体;background-color:#FFFFFF;\">\r\n	　　个人可承担风险比重有公式可循，即个人可承担风险比重=100-目前年龄。比如包浩今年26岁，可承担风险比重为74(100-26)，那么可以将70%左右的闲置资金投入高风险高收益的投资。\r\n</p>', '&nbsp; &nbsp; 現在很多理財意識較強的工薪族想要理財，都是每月領到薪水，待日常生活消費後，再將剩余的錢存入銀行。到頭來，有些人卻發現，由於自己無計劃地消費，每月所能存入銀行的錢非常少。現就就教大家三個理財公式，讓妳的小金庫裏的錢越來越多。<br />\r\n　　公式壹：支出=收入-儲蓄<br />\r\n　　每月先將30%的收入存入銀行，剩下的錢用於當月消費資金。<br />\r\n　　公式二：儲蓄=50%保守理財+50%“穩攻”和“強攻”<br />\r\n　　把50%的資金用於定存、投入貨幣基金或者購買銀行保本理財產品等。剩余50%資金可進行“穩攻”和“強攻”，即25%可以購買壹些風險低收益中等的理財產品，另外25%購買風險性高壹些收益較高的理財產品。<br />\r\n　　公式三：個人可承擔風險比重=100-目前年齡<br />\r\n　　個人可承擔風險比重有公式可循，即個人可承擔風險比重=100-目前年齡。比如包浩今年26歲，可承擔風險比重為74(100-26)，那麽可以將70%左右的閑置資金投入高風險高收益的投資。<br />', '', '', '', '0', '2015-04-09 21:01:07');
INSERT INTO `dd_indexnews` VALUES ('15', '2', '再不理财就晚了', '再不理財就晚了：哪些理財陋習讓妳越理越窮', '<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp; 对于理财新手来说，常犯的错误便是搞错了理财的顺序。当前有很多人都是先投资，再准备生活备用金，然后投保，最后进行财产传承。然而理财师建议的正确顺序应当是先准备生活备用金，再进行保险规划，然后进行投资，最后才做财产的传承。顺序弄错了，很可能会影响你的理财规划和最终实现的效果。\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp; 许多理财新手，特别是年轻人，很容易抱有“我还年轻没财可理”、“有钱人才理财”等错误的观念。新手容易犯的另一个错误就是盲目跟风投资，并且只追逐高收益。刘女士就对记者说，当初才接触理财时，面对五花八门的投资工具难以抉择，只好跟着同事朋友购买，但同事朋友也不一定就是投资理财方面的专家，所以当时刘女士买过并不适合她的分红保险，也买过赔了几千元的基金。盲目跟风投资时，刘女士表示都是因为朋友推荐的产品收益听上去很吸引人，高过银行定存利率，有的宣传收益率在10%以上，但因为产品说明书很难看懂，没有细致研究过产品的她也就犯了追逐高收益而无视风险的错误。\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp; 对于理财新手来说，信用卡可谓是双刃剑。如市民唐先生就对记者说，因为不少信用卡推出了各种优惠活动，在工作人员的鼓动下他曾一度办了5张不同银行的信用卡。但这导致的结果就是多张信用卡造成了理财上的混乱，他搞混了各张卡的最后还款日期，优惠活动也不一定能够及时赶上。同时，多张信用卡也容易产生“拆东墙补西墙”的行为，导致频繁欠费，财富没有积聚效应也不容易得到任何一家银行的升级服务。不记得最后还款日还会导致逾期还款，这也是很多持卡人留下了信用记录灰点的原因。\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	如何改进：\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp;&nbsp;如同旅行只要出发就成功了一半，理财也同样如此。银率网分析师潘涛认为，其实生活中的点滴都跟理财息息相关，今天买菜多少钱、坐公交多少钱、衣服多少钱等合理消费、理性购物也是理财。\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	他提醒投资者，不能习以为常地进行盲目跟风投资。据此前的一份调查显示，有七成人购买银行理财产品前并没有阅读产品说明书，这表明盲目投资的行为仍普遍存在。潘涛建议，投资者需要做到对投资工具进行充分的了解，如了解资金投向、风险何在、本金是否能赎回等。\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp; 而对于高收益理财产品，他则建议首先可以货比三家，寻找自己风险承受能力之内的产品，然后再对产品的资金投向风险流动性等进行了解，最终根据自身的理财需求决定购买。信用卡则拥有1~2张就足够用了，不要因为贪图优惠而盲目开多张信用卡。\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	“剁手族”：误把信用卡分期当免单\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp; 在理财过程中，容易冲动消费的“剁手族”无疑更容易犯更多的错误。市民小云就十分喜欢网购，总是看到网上的打折活动、产品包邮、电商的促销就进行冲动消费。几乎每个月她都会在网上淘到一些并不需要或者不符预期的东西，要退货又会产生新的运费。一年多下来，小云才意识到，原本以为网购划算，但其实花掉了不少不必要的钱。\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp; 这种贪小便宜的意识产生的损失也并不一定在网上发生，市民何女士对记者表示，过去曾经办过不少“健身卡”、“理发卡”，这些卡中都要预付费，但有时犯懒或者真的忘掉了以后，这笔资金也就此沉没，因不能提现反而产生了不少损失。譬如她曾经在朋友家附近办过一张半年一千元的瑜伽健身卡，但半年中她只有刚开卡的时候去过不到5次，后来因为各种原因都没有再去光顾，本来每次只要不到40元，结果变成了一次几百元，便宜没有享受到反而吃了不少亏。\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp;&nbsp;另一种理财上的陋习则是动不动就用信用卡分期付款来购买商品，特别在<span style=\"line-height:1.5;\">购买金额较高的产品时，分期付款可以让经济能力有限的“剁手族”提前实现购买愿望，但仔细观察这当中也有不少门道是“剁手族”们容易忽视的。首先是分期付款需要承担手续费，一般来说，12期的分期还款手续费为7%~8%左右，往往分期越多偿还的手续费越多。而那些号称零息零手续费的信用卡分期付款商品，其售价也往往比一次性购买的价格高。在大笔支出后，信用卡发卡行往往会致电持卡人，劝其进行分期，为了减少每月还款负担，很多人都会选择账单分期，而分期后的账单在进行还款时如果再按照最低还款额进行还款就是不可取的，但这一点并不被许多信用卡新人所熟知，且易产生逾期还款的不良记录。</span> \r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	如何改进：\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp; 无计划、无节制地花钱习惯早已成为很多年轻人习以为常的行为，这也是多数人沦为月光族多年都攒不了钱的最主要原因。潘涛建议，个人和家庭制定一个账本认真记下每笔开支，时时总结哪方面的钱是不该花的，有效控制消费理性购物。而对于预付费卡，消费者则应该了解商户的经营资质，同时衡量自己的实际需求再进行购买。分期付款虽然可以在短期内减轻负担，但也应该量力而为。\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	为人父母：不要带给孩子错误的理财示范\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp; 父母在生活中的一些错误理财示范也不利于子女的理财观念。譬如许多家庭对于孩子的需求总是有求必应，导致孩子不珍惜金钱也不懂得节制;而父母本身在花钱的时候也没有以身作则，教育孩子不要乱花钱的同时自己却花钱没有计划;时常为了钱争吵很容易让孩子产生“金钱是不好的东西”的观念;一些父母会答应孩子考试满分或达到某一目标时给予奖励，但如果没有兑现言行则容易给孩子带来不好的影响;而一些父母为了显示关爱孩子，容易带孩子去参加一些费用很高的游乐项目。\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	如何改进：\r\n</p>\r\n<p style=\"font-family:宋体, tahoma, arial, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp;&nbsp;银率网分析师佐非建议，父母应该从小培养孩子的财商。可以从三个方面让孩子建立其健康的财商观念。一是树立正确理财观，培养孩子良好的理财习惯，父母可从日常生活教育着手，进行孩子的理财教育及观念培养;二是小钱成大钱，每个父母都会给孩子零花钱，将这些零散资金学会系统运用是教会孩子理财的重要一步，她建议父母可利用一些银行产品让孩子学会强制储蓄;三是学会钱生钱，可以利用银行的少儿理财产品从小培养孩子的赚钱意识和能力。此外父母还可采用定期发放零用钱的方式，鼓励孩子记小账本等措施，训练孩子的用钱能力。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '    對於理財新手來說，常犯的錯誤便是搞錯了理財的順序。當前有很多人都是先投資，再準備生活備用金，然後投保，最後進行財產傳承。然而理財師建議的正確順序應當是先準備生活備用金，再進行保險規劃，然後進行投資，最後才做財產的傳承。順序弄錯了，很可能會影響妳的理財規劃和最終實現的效果。<br />\r\n　　許多理財新手，特別是年輕人，很容易抱有“我還年輕沒財可理”、“有錢人才理財”等錯誤的觀念。新手容易犯的另壹個錯誤就是盲目跟風投資，並且只追逐高收益。劉女士就對記者說，當初才接觸理財時，面對五花八門的投資工具難以抉擇，只好跟著同事朋友購買，但同事朋友也不壹定就是投資理財方面的專家，所以當時劉女士買過並不適合她的分紅保險，也買過賠了幾千元的基金。盲目跟風投資時，劉女士表示都是因為朋友推薦的產品收益聽上去很吸引人，高過銀行定存利率，有的宣傳收益率在10%以上，但因為產品說明書很難看懂，沒有細致研究過產品的她也就犯了追逐高收益而無視風險的錯誤。<br />\r\n　　對於理財新手來說，信用卡可謂是雙刃劍。如市民唐先生就對記者說，因為不少信用卡推出了各種優惠活動，在工作人員的鼓動下他曾壹度辦了5張不同銀行的信用卡。但這導致的結果就是多張信用卡造成了理財上的混亂，他搞混了各張卡的最後還款日期，優惠活動也不壹定能夠及時趕上。同時，多張信用卡也容易產生“拆東墻補西墻”的行為，導致頻繁欠費，財富沒有積聚效應也不容易得到任何壹家銀行的升級服務。不記得最後還款日還會導致逾期還款，這也是很多持卡人留下了信用記錄灰點的原因。<br />\r\n　　如何改進：<br />\r\n　　如同旅行只要出發就成功了壹半，理財也同樣如此。銀率網分析師潘濤認為，其實生活中的點滴都跟理財息息相關，今天買菜多少錢、坐公交多少錢、衣服多少錢等合理消費、理性購物也是理財。<br />\r\n　　他提醒投資者，不能習以為常地進行盲目跟風投資。據此前的壹份調查顯示，有七成人購買銀行理財產品前並沒有閱讀產品說明書，這表明盲目投資的行為仍普遍存在。潘濤建議，投資者需要做到對投資工具進行充分的了解，如了解資金投向、風險何在、本金是否能贖回等。<br />\r\n　　而對於高收益理財產品，他則建議首先可以貨比三家，尋找自己風險承受能力之內的產品，然後再對產品的資金投向風險流動性等進行了解，最終根據自身的理財需求決定購買。信用卡則擁有1~2張就足夠用了，不要因為貪圖優惠而盲目開多張信用卡。<br />\r\n　　“剁手族”：誤把信用卡分期當免單<br />\r\n　　在理財過程中，容易沖動消費的“剁手族”無疑更容易犯更多的錯誤。市民小雲就十分喜歡網購，總是看到網上的打折活動、產品包郵、電商的促銷就進行沖動消費。幾乎每個月她都會在網上淘到壹些並不需要或者不符預期的東西，要退貨又會產生新的運費。壹年多下來，小雲才意識到，原本以為網購劃算，但其實花掉了不少不必要的錢。<br />\r\n　　這種貪小便宜的意識產生的損失也並不壹定在網上發生，市民何女士對記者表示，過去曾經辦過不少“健身卡”、“理發卡”，這些卡中都要預付費，但有時犯懶或者真的忘掉了以後，這筆資金也就此沈沒，因不能提現反而產生了不少損失。譬如她曾經在朋友家附近辦過壹張半年壹千元的瑜伽健身卡，但半年中她只有剛開卡的時候去過不到5次，後來因為各種原因都沒有再去光顧，本來每次只要不到40元，結果變成了壹次幾百元，便宜沒有享受到反而吃了不少虧。<br />\r\n另壹種理財上的陋習則是動不動就用信用卡分期付款來購買商品，特別在購買金額較高的產品時，分期付款可以讓經濟能力有限的“剁手族”提前實現購買願望，但仔細觀察這當中也有不少門道是“剁手族”們容易忽視的。首先是分期付款需要承擔手續費，壹般來說，12期的分期還款手續費為7%~8%左右，往往分期越多償還的手續費越多。而那些號稱零息零手續費的信用卡分期付款商品，其售價也往往比壹次性購買的價格高。在大筆支出後，信用卡發卡行往往會致電持卡人，勸其進行分期，為了減少每月還款負擔，很多人都會選擇賬單分期，而分期後的賬單在進行還款時如果再按照最低還款額進行還款就是不可取的，但這壹點並不被許多信用卡新人所熟知，且易產生逾期還款的不良記錄。<br />\r\n　　如何改進：<br />\r\n　　無計劃、無節制地花錢習慣早已成為很多年輕人習以為常的行為，這也是多數人淪為月光族多年都攢不了錢的最主要原因。潘濤建議，個人和家庭制定壹個賬本認真記下每筆開支，時時總結哪方面的錢是不該花的，有效控制消費理性購物。而對於預付費卡，消費者則應該了解商戶的經營資質，同時衡量自己的實際需求再進行購買。分期付款雖然可以在短期內減輕負擔，但也應該量力而為。<br />\r\n　　為人父母：不要帶給孩子錯誤的理財示範<br />\r\n　　父母在生活中的壹些錯誤理財示範也不利於子女的理財觀念。譬如許多家庭對於孩子的需求總是有求必應，導致孩子不珍惜金錢也不懂得節制;而父母本身在花錢的時候也沒有以身作則，教育孩子不要亂花錢的同時自己卻花錢沒有計劃;時常為了錢爭吵很容易讓孩子產生“金錢是不好的東西”的觀念;壹些父母會答應孩子考試滿分或達到某壹目標時給予獎勵，但如果沒有兌現言行則容易給孩子帶來不好的影響;而壹些父母為了顯示關愛孩子，容易帶孩子去參加壹些費用很高的遊樂項目。<br />\r\n　　如何改進：<br />\r\n　　銀率網分析師佐非建議，父母應該從小培養孩子的財商。可以從三個方面讓孩子建立其健康的財商觀念。壹是樹立正確理財觀，培養孩子良好的理財習慣，父母可從日常生活教育著手，進行孩子的理財教育及觀念培養;二是小錢成大錢，每個父母都會給孩子零花錢，將這些零散資金學會系統運用是教會孩子理財的重要壹步，她建議父母可利用壹些銀行產品讓孩子學會強制儲蓄;三是學會錢生錢，可以利用銀行的少兒理財產品從小培養孩子的賺錢意識和能力。此外父母還可采用定期發放零用錢的方式，鼓勵孩子記小賬本等措施，訓練孩子的用錢能力。<br />', '', '', '', '0', '2015-09-01 23:50:46');

-- ----------------------------
-- Table structure for dd_indexnewstype
-- ----------------------------
DROP TABLE IF EXISTS `dd_indexnewstype`;
CREATE TABLE `dd_indexnewstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) DEFAULT NULL,
  `entitle` varchar(100) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '99',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_indexnewstype
-- ----------------------------
INSERT INTO `dd_indexnewstype` VALUES ('1', '0', '0', '公司公告', '公司公告', '99');
INSERT INTO `dd_indexnewstype` VALUES ('2', '0', '0', '行业新闻', '行業新聞', '99');

-- ----------------------------
-- Table structure for dd_indexview
-- ----------------------------
DROP TABLE IF EXISTS `dd_indexview`;
CREATE TABLE `dd_indexview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `entitle` varchar(255) DEFAULT NULL,
  `content` text,
  `encontent` text,
  `date` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `endescription` varchar(255) DEFAULT NULL,
  `enimg` varchar(100) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_indexview
-- ----------------------------
INSERT INTO `dd_indexview` VALUES ('2', '公司简介', '公司簡介', '<p class=\"MsoNormal\">\r\n	<span style=\"line-height:1.5;\"><br />\r\n</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"line-height:1.5;font-size:16px;\">&nbsp; &nbsp; 美国</span><span style=\"line-height:1.5;font-size:16px;\">CRO</span><span style=\"line-height:1.5;font-size:16px;\">投资集团创立于</span><span style=\"line-height:1.5;font-size:16px;\">1986</span><span style=\"line-height:1.5;\"><span style=\"font-size:16px;\">年。位于美国圣地亚哥商业中心，是向快速成长的公司提供私募股权和风险投资的投资者。&nbsp;自公司成立以来，CRO已募集大约150 亿美元资金，并向 380 多家跨行业的公司提供成长资金、资本重组和管理层收购。这些公司中至今已有&nbsp;超过130 家公开上市，有 135 多家完成战略并购。</span><span style=\"line-height:1.5;font-size:16px;\">总部设立在美国西部最大的金融中心旧金山，在美国的波士顿、硅谷、英国.&nbsp;伦敦&nbsp;东京和圣保罗设计有办事处。是一家具有全球视野和实力的大型投资集团公司</span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"line-height:1.5;font-size:16px;\">&nbsp; &nbsp; 美国</span><span style=\"line-height:1.5;font-size:16px;\">CRO</span><span style=\"line-height:1.5;font-size:16px;\">投资集团是集投资、融资、能源资源、商业服务、信息技术和服务、消费品、教育、金融科技和服务、医药医疗、工业、互联网、新媒体、以及软件、国际贸易及高新技术开发于一体的多功能、多元化的跨国性资本营运机构。拥有国际资本市场运作的丰富经验，聚集了一批在行业、技术、管理、财务、法律等方面的专家实行管理与运作。</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-size:16px;\">&nbsp; &nbsp; CRO</span><span style=\"font-size:16px;\">集团资金实力雄厚，恪守诚信、注重时效，并与大陆有关部门、国际高层金融机构和美国的基金会、财团、银行等建立了良好的金融关系。目前已与北美、南美、澳洲、中东、南非、亚洲、欧盟等多个国家和地区的企业建立了合资机构、和金融合作关系，并取得了非常可观的经济效益，公司在世界许多地区设有代表处而建立了比较广泛的经贸、高新技术开发的管理体系网路。</span> \r\n</p>\r\n<br />', '<span style=\"font-size:14px;\">    <span style=\"font-family:NSimSun;\">香港萬盛投資集團有限公司系經香港政府批準註冊成立的壹家合法的公司，總部設在香港, 是香港總商會成員單位，包含金融、高科技產業園、工業區及商業區等投資開發的壹家具有全球視野和實力的大型投資集團公司。 </span></span><br />\r\n<span style=\"font-size:14px;font-family:NSimSun;\">    萬盛集團是集投資、融資、能源資源、化工建材、醫藥醫療器材、國際貿易及高新技術開發於壹體的多功能、多元化的跨國性資本營運機構。擁有國際資本市場運作的豐富經驗，聚集了壹批在行業、技術、管理、財務、法律等方面的專家實行管理與運作。 </span><br />\r\n<span style=\"font-size:14px;font-family:NSimSun;\">    萬盛集團資金實力雄厚，恪守誠信、註重時效，並與大陸有關部門、國際高層金融機構和美國的基金會、財團、銀行等建立了良好的金融關系。目前已與北美、南美、澳洲、中東、南非、亞洲、歐盟等多個國家和地區的企業建立了合資機構、和金融合作關系，並取得了非常可觀的經濟效益，公司在世界許多地區設有代表處而建立了比較廣泛的經貿、高新技術開發的管理體系網路。 </span><br />\r\n<span style=\"font-size:14px;font-family:NSimSun;\">    萬盛集團秉承“重誠信、圖雙贏、互惠互利共同求發展”的總體目標，竭誠希望國際以及大陸的有識之士與我公司合作。共同拓展經貿和高新技術開發的市場和專案，從而使所有合作參與者獲得比較豐厚可觀的經濟效益。 </span><br />\r\n<span style=\"font-size:14px;font-family:NSimSun;\">    香港萬盛投資集團有限公司現擁有國際壹流資深投資專家團隊40多人，集團旗下子公司10多家，遍佈多個領域和行業。集團全資控股的國內企業包括： 河源翔豐商業中心、佛山禪城工業區、中山石岐工業園、中山太陽城商業中心等等。已成功開發工業區2000多畝。集團現主要面向跨國公司、國內二級城市的招商與開發、協助政府機構和社會組織在區域性社會、經濟、文化、科技發展戰略決策中實現最優決策和利益最大化，在亞太地區及大中華區域與合作夥伴壹併共爭行業之先。 </span><br />\r\n<span style=\"font-size:14px;font-family:NSimSun;\">    香港萬盛投資集團有限公司現擁有國際壹流資深投資專家團隊40多人，集團旗下子公司10多家，遍佈多個領域和行業。集團全資控股的國內企業包括： 河源翔豐商業中心、佛山禪城工業區、中山石岐工業園、中山太陽城商業中心等等。已成功開發工業區2000多畝。集團現主要面向跨國公司、國內二級城市的招商與開發、協助政府機構和社會組織在區域性社會、經濟、文化、科技發展戰略決策中實現最優決策和利益最大化，在亞太地區及大中華區域與合作夥伴壹併共爭行業之先。 </span><span style=\"font-size:14px;font-family:NSimSun;\"></span><br />\r\n<br />', '1441202118', '', '', '', '');
INSERT INTO `dd_indexview` VALUES ('3', '新能源投资', '新能源投資', '<span style=\"font-size:12px;\"></span><span style=\"font-family:NSimSun;font-size:18px;\"><span style=\"font-size:12px;\"></span><span style=\"font-size:14px;\">&nbsp; &nbsp; 马来西亚顺丰风力发电有限公司（以下简称风电公司）成立於2007年2月，註册资金4亿元美币，是CRO投资以及马来西亚亚嘉隆泰集团合股之联营公司，专业从事风力发电相关业务，包括风力发电场的投资、建设、运营、维护、风电生產销售，提供风力发电规划、技术諮询及运行维护服务等。 </span></span><br />\r\n<span style=\"font-family:NSimSun;font-size:14px;\">&nbsp; &nbsp; 顺丰将风电作為主业发展，从2003年开始涉足风电產业，参与东南亚风电特许权专案投标，2004年开始在东南亚各国开展风电专案前期工作、建设风电场。风电公司成立以后，顺丰集团在资金、技术、人才、管理等方面给予风电公司全方位的支持。 </span><br />\r\n<span style=\"font-family:NSimSun;font-size:14px;\">&nbsp; &nbsp; 四年来，风电公司坚持“以点带面”的战略方针，在东南亚各国设立了5家分公司 和计画单列项目公司，以“陆海并举，陆上优先”的战略在沿海风带推进前期工作。目前已在马来西亚吉隆玻等地积极开展风电专案开发和工程建设,中标了马来西亚第一个最大的风电特许权项目―――马来西亚锡盟灰腾梁30万千瓦风电场；参加了第一个百万千瓦风电基地―――印尼风电基地的建设。截至2011年3月底，风电公司累计装机容量已超过128万千瓦，累计专案核准容量超过210万千瓦，在建专案容量达到120万千瓦，在运专案容量128万千瓦，累计拥有风资源储备3000万千瓦。现拥有总资產约100亿元美币，净资產值约90亿元美币，有效实现了集团资產的保值增值。</span><br />', '&nbsp; &nbsp; 馬來西亞順豐風力發電有限公司（以下簡稱風電公司）成立於2007年2月，註冊資金4億元美幣，是萬盛投資以及馬來西亞亞嘉隆泰集團合股之聯營公司，專業從事風力發電相關業務，包括風力發電場的投資、建設、運營、維護、風電生產銷售，提供風力發電規劃、技術諮詢及運行維護服務等。 &nbsp;<br />\r\n&nbsp; &nbsp; 順豐將風電作為主業發展，從2003年開始涉足風電產業，參與東南亞風電特許權專案投標，2004年開始在東南亞各國開展風電專案前期工作、建設風電場。風電公司成立以後，順豐集團在資金、技術、人才、管理等方面給予風電公司全方位的支持。 &nbsp;<br />\r\n&nbsp; &nbsp; 四年來，風電公司堅持“以點帶面”的戰略方針，在東南亞各國設立了5家分公司和計畫單列項目公司，以“陸海並舉，陸上優先”的戰略在沿海風帶推進前期工作。目前已在馬來西亞吉隆玻等地積極開展風電專案開發和工程建設,中標了馬來西亞第壹個最大的風電特許權項目―――馬來西亞錫盟灰騰梁30萬千瓦風電場；參加了第壹個百萬千瓦風電基地―――印尼風電基地的建設。截至2011年3月底，風電公司累計裝機容量已超過128萬千瓦，累計專案核準容量超過210萬千瓦，在建專案容量達到120萬千瓦，在運專案容量128萬千瓦，累計擁有風資源儲備3000萬千瓦。現擁有總資產約100億元美幣，凈資產值約90億元美幣，有效實現了集團資產的保值增值。<br />', '1441203274', '', '', '', '');
INSERT INTO `dd_indexview` VALUES ('4', '国际金融', '國際金融', '<span style=\"font-size:12px;font-family:NSimSun;\"><span style=\"font-size:16px;\">&nbsp; &nbsp; 美国CRO投资集团有限公司是一家国际性综合金融服务机构，以国际经济大局势为依据，在全球范围开展业务。在集团公司综合金融服务宗旨的指导下，为国内外个人投资者和金融机构提供专业的理财服务。目前已在国际、国内金融市场建立广泛的客户基础。 </span><br />\r\n<span style=\"font-size:16px;\">&nbsp; &nbsp; CRO投资集团全体同仁本著“诚信、合作、创新、进取”的企业精神，为金融市场投资客户提供投资谘询和交易指导，以提高金融市场投资者交易水淮，实现长期稳定盈利为己任。同时，万盛集团与国际、国内各类金融谘询公司紧密合作，在开拓市场、发展和维护客户方面交流经验，达到资讯共用、优势互补、共同促进金融市场的发展。</span><br />\r\n</span><span style=\"font-size:12px;font-family:NSimSun;\"></span><br />', '&nbsp; &nbsp; 香港萬盛投資集團有限公司是壹家國際性綜合金融服務機構，以國際經濟大局勢為依據，在全球範圍開展業務。在集團公司綜合金融服務宗旨的指導下，為國內外個人投資者和金融機構提供專業的理財服務。目前已在國際、國內金融市場建立廣泛的客戶基礎。&nbsp;<br />\r\n&nbsp; &nbsp; 萬盛集團全體同仁本著“誠信、合作、創新、進取”的企業精神，為金融市場投資客戶提供投資諮詢和交易指導，以提高金融市場投資者交易水準，實現長期穩定盈利為己任。同時，萬盛集團與國際、國內各類金融諮詢公司緊密合作，在開拓市場、發展和維護客戶方面交流經驗，達到資訊共用、優勢互補、共同促進金融市場的發展。<br />\r\n&nbsp;', '1441119485', '', '', '', '');
INSERT INTO `dd_indexview` VALUES ('5', '食品加工', '食品加工', '<span style=\"font-family:NSimSun;font-size:12px;\"><span style=\"font-size:16px;\">&nbsp; &nbsp; 美国CRO投资集团有限公司全资拥有美国粉岭肉製品深加工基地，该基地主要加工猪、牛、羊、家禽等肉类食品。 </span><br />\r\n<span style=\"font-size:16px;\"> 集团拥有标准的食品加工环境和先进的肉类深加工设备，採用传统配方、现代化的生产工艺，将肉製品加工成润滑、爽口、香而不腻的熟食品（香肠、火腿、培根、肉斡、速食等），供应本港和海外市场。 </span><br />\r\n<span style=\"font-size:16px;\">&nbsp; &nbsp; 集团严格检疫控制肉类来源和各种加工产品原料，加工流水线严格按照卫生食品行业执行标准进行控制维护，加工出来的产品符合国家卫生标准与各项检测，在各大商场生鲜超市均有销售</span>。 </span><br />', '<span style=\"font-family:NSimSun;font-size:18px;\"><span style=\"font-family:NSimSun;font-size:12px;\">&nbsp; &nbsp; 香港萬盛投資集團有限公司全資擁有香港粉嶺肉製品深加工基地，該基地主要加工豬、牛、羊、家禽等肉類食品。&nbsp;</span><br />\r\n<span style=\"font-family:NSimSun;font-size:12px;\">&nbsp; &nbsp; 集團擁有標準的食品加工環境和先進的肉類深加工設備，採用傳統配方、現代化的生產工藝，將肉製品加工成潤滑、爽口、香而不膩的熟食品（香腸、火腿、培根、肉斡、速食等），供應本港和海外市場。&nbsp;</span><br />\r\n<span style=\"font-family:NSimSun;font-size:12px;\">&nbsp; &nbsp; 集團嚴格檢疫控制肉類來源和各種加工產品原料，加工流水線嚴格按照衛生食品行業執行標準進行控制維護，加工出來的產品符合國家衛生標準與各項檢測，在各大商場生鮮超市均有銷售。&nbsp;</span></span> <br />', '1441122254', '', '', '', '');
INSERT INTO `dd_indexview` VALUES ('6', '工业园区开发', '工業園區開發', '<span style=\"font-family:NSimSun;font-size:16px;\">&nbsp; &nbsp; 美国CRO投资集团有限公司已形成有土地一级开发、房地产开发经营、市政公用、多元化服务四项主要经营业务，其中又以工业园区开发为重中之重。&nbsp;<br />\r\n&nbsp; &nbsp; 土地一级开发包括乙天顺生态科技城专案为代表的综合开发，房地产开发与经营包括以本部为代表的工业房产和乙天顺置地为代表的住宅房产业务，公用事业包括乙天顺公用为代表的市政、水务、电力、燃气等业务，多元化服务主要包括招商代理、工程代理、国际教育和物业管理等业务。<br />\r\n</span><span style=\"font-family:NSimSun;font-size:16px;\"></span><br />', '<span style=\"font-family:NSimSun;\">&nbsp; &nbsp; 香港萬盛投資集團有限公司已形成有土地壹級開發、房地產開發經營、市政公用、多元化服務四項主要經營業務，其中又以工業園區開發為重中之重。&nbsp;<br />\r\n&nbsp; &nbsp; 土地壹級開發包括乙天順生態科技城專案為代表的綜合開發，房地產開發與經營包括以本部為代表的工業房產和乙天順置地為代表的住宅房產業務，公用事業包括乙天順公用為代表的市政、水務、電力、燃氣等業務，多元化服務主要包括招商代理、工程代理、國際教育和物業管理等業務。&nbsp;</span><br />', '1441119927', '', '', '', '');
INSERT INTO `dd_indexview` VALUES ('7', '休闲娱乐', '休閒娛樂', '<span style=\"font-size:12px;font-family:NSimSun;\"><span style=\"font-size:16px;\">&nbsp; &nbsp; 美国CRO投资集团有限公司投资2.8亿美元，在印尼雅加达市沽打商业中心城区建设CRO隆商业摩登主题广场，并引进商业服务全新理念，打造雅加达最好、规模最大、功能最全面的商业中心。 </span><br />\r\n<span style=\"font-size:16px;\">&nbsp; &nbsp; 总建筑面积22万平方米的CRO隆摩登主题广场将全部採用当今世界最先进的SHOPPINGGMALL模式——集百货、饮食、娱乐、休閒、商务宾馆、高档公寓于一体开发建设，商业配套将演绎“品味生活、休閒娱乐”的理念，让消费成为“品味生活”。 </span><br />\r\n<span style=\"font-size:16px;\">&nbsp; &nbsp; 建成的商业主题广场不仅是购物天堂，而且是享受、观光、娱乐、休閒的综合场所。这里有世界著名品牌专卖区、流行、时尚服饰品牌的室内商业街，以中高档日用品为主的超市大卖场，东南亚知名餐饮企业组成的大型饮食娱乐广场，以及多家娱乐公司合作建设的大型室内公园，以数码影像城、游泳馆、真冰场及运动服饰为主的运动休閒广场，有知名品牌合作经营的家居广场、有商务、住宿、会务、展览中心为一体的星级宾馆。 </span></span><br />', '&nbsp; &nbsp; 香港萬盛投資集團有限公司投資2.8億美元，在印尼雅加達市沽打商業中心城區建設萬盛隆商業摩登主題廣場，並引進商業服務全新理念，打造雅加達最好、規模最大、功能最全面的商業中心。 &nbsp;<br />\r\n&nbsp; &nbsp; 總建築面積22萬平方米的萬盛隆摩登主題廣場將全部採用當今世界最先進的SHOPPINGGMALL模式——集百貨、飲食、娛樂、休閒、商務賓館、高檔公寓於壹體開發建設，商業配套將演繹“品味生活、休閒娛樂”的理念，讓消費成為“品味生活”。&nbsp;<br />\r\n&nbsp; &nbsp; 建成的商業主題廣場不僅是購物天堂，而且是享受、觀光、娛樂、休閒的綜合場所。這裏有世界著名品牌專賣區、流行、時尚服飾品牌的室內商業街，以中高檔日用品為主的超市大賣場，東南亞知名餐飲企業組成的大型飲食娛樂廣場，以及多家娛樂公司合作建設的大型室內公園，以數碼影像城、遊泳館、真冰場及運動服飾為主的運動休閒廣場，有知名品牌合作經營的家居廣場、有商務、住宿、會務、展覽中心為壹體的星級賓館。&nbsp;<br />', '1441119815', '', '', '', '');
INSERT INTO `dd_indexview` VALUES ('8', '组织架构', '組織架構', '<div style=\"text-align:center;\">\r\n	<img src=\"/kedite/attached/image/20150331/20150331165820_35117.jpg\" alt=\"\" />\r\n</div>\r\n<div align=\"center\">\r\n	<br />\r\n</div>', '<div style=\"text-align:center;\">\r\n	<img src=\"file://d:/360浏览器/360se6/User Data/temp/20150331165820_35117.jpg\" /><img src=\"/kedite/attached/image/20150405/20150405235119_33087.jpg\" alt=\"\" />\r\n</div>', '1428278224', '', '', '', '');
INSERT INTO `dd_indexview` VALUES ('9', '企业文化', '企業文化', '<span style=\"color:#000000;font-family:NSimSun;\"><span style=\"font-size:16px;\">企业核心价值观———诚实、关爱、奉献 </span><br />\r\n<br />\r\n<span style=\"font-size:16px;\"> 诚实：以诚实的态度做产品；以诚实的态度做销售；以诚实的态度作企业 </span><br />\r\n<br />\r\n<span style=\"font-size:16px;\"> 关爱：关爱顾客，努力满足顾客需求；关爱员工，不断改善员工工作环境、福利待遇 </span><br />\r\n<br />\r\n<span style=\"font-size:16px;\"> 秉承“客户是我们最珍贵的合作伙伴”的服务理念，与广大客户共赢市场 </span><br />\r\n<br />\r\n<span style=\"font-size:16px;\"> 责任感：努力为更多的人提供就业机会 </span><br />\r\n<br />\r\n<span style=\"font-size:16px;\"> 行销理念：以顾客为圆心</span><br />\r\n<br />\r\n<span style=\"font-size:16px;\"> 顾客是衣食父母，企业的一切经营活动均围绕顾客价值要求这一中心展开，把满足顾客需求作为一切工作的目标和中心。企业内部的各部门都直接直面顾客，使各个环节逐步环化。</span></span><br />', '<span style=\"font-family:NSimSun;font-size:12px;\">企業核心價值觀</span><span style=\"font-family:NSimSun;font-size:12px;\">———</span><span style=\"font-family:NSimSun;font-size:12px;\">誠實、關愛、奉獻 </span><br />\r\n<br />\r\n<span style=\"font-family:NSimSun;font-size:12px;\"> 誠實：以誠實的態度做產品；以誠實的態度做銷售；以誠實的態度作企業 </span><br />\r\n<br />\r\n<span style=\"font-family:NSimSun;font-size:12px;\"> 關愛：關愛顧客，努力滿足顧客需求；關愛員工，不斷改善員工工作環境、福利待遇 </span><br />\r\n<br />\r\n<span style=\"font-family:NSimSun;font-size:12px;\"> 秉承“客戶是我們最珍貴的合作夥伴”的服務理念，與廣大客戶共贏市場 </span><br />\r\n<br />\r\n<span style=\"font-family:NSimSun;font-size:12px;\"> 責任感：努力為更多的人提供就業機會 </span><br />\r\n<br />\r\n<span style=\"font-family:NSimSun;font-size:12px;\"> 行銷理念：以顧客為圓心 </span><br />\r\n<br />\r\n<span style=\"font-family:NSimSun;font-size:12px;\"> 顧客是衣食父母，企業的一切經營活動均圍繞顧客價值要求這一中心展開，把滿足顧客需求作為一切工作的目標和中心。企業內部的各部門都直接直面顧客，使各個環節逐步環化。 </span><br />', '1441120033', '', '', '', '');
INSERT INTO `dd_indexview` VALUES ('10', '联系我们', '聯繫我們', '<p style=\"color:#000000;text-indent:0px;background-color:#FFFFFF;\">\r\n	<strong> </strong> \r\n</p>\r\n<p style=\"color:#012E4A;font-family:Georgia, 宋体;font-size:14px;background-color:#FFFFFF;\">\r\n	<strong><strong>伦敦 London</strong><br />\r\nWarburg Pincus International LLC<br />\r\nAlmack House<br />\r\n28 King Street, St. James’s<br />\r\nSW1Y 6QW<br />\r\nLondon, United Kingdom</strong> \r\n</p>\r\n<p style=\"color:#012E4A;font-family:Georgia, 宋体;font-size:14px;background-color:#FFFFFF;\">\r\n	<strong>电话: +44 20 7 306 0306<br />\r\n传真: +44 20 7 321 0881</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"color:#012E4A;font-family:Georgia, 宋体;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#012E4A;font-family:Georgia, 宋体;font-size:14px;background-color:#FFFFFF;\">\r\n	<strong>圣保罗 São Paulo</strong> \r\n</p>\r\n<p style=\"color:#012E4A;font-family:Georgia, 宋体;font-size:14px;background-color:#FFFFFF;\">\r\n	Warburg Pincus do Brasil Ltda.<br />\r\nAv. Brig. Faria Lima 2277 - 9º andar<br />\r\nJd.Paulistano<br />\r\n01451-001 São Paulo - SP<br />\r\nBrazil\r\n</p>\r\n<p style=\"color:#012E4A;font-family:Georgia, 宋体;font-size:14px;background-color:#FFFFFF;\">\r\n	电话: + 55 11 3096 3500<br />\r\n传真: + 55 11 3096 3509\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"color:#000000;text-indent:0px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>', '<p>\r\n	集團電話：00852-3062 3016 <br />\r\n公司傳真：00852-3921 6081<br />\r\n企業郵箱：wshk@wshkgroup.com<br />\r\n集團地址：香港九龍尖沙咀漆鹹道南39號鐵路大廈13樓\r\n</p>', '1441120791', '', '', '', '');
INSERT INTO `dd_indexview` VALUES ('11', '董事长致词', '', '<p>\r\n	<span style=\"font-size:16px;\">&nbsp; &nbsp; 在经济一体化的国际大环境中，资本运作的重要性更加凸显，如何把握资本运作的脉络，适应企业新的管理流程再造，</span><br />\r\n<span style=\"font-size:16px;\">&nbsp; &nbsp; 帮助资本所有者抓住市场机遇，实现资本的保值、增值，这是新型的全能投资公司面临的首要任务。市场呼唤具有良好</span><span style=\"font-size:16px;\">资产管理理念和资本运作的优秀公司。我们正是在这样的环境下诞生的。在过去的几年里，CRO投资集团已与国内外</span><span style=\"font-size:16px;\">多家财团友好协作，并取得了瞩目的成就。我们力求协助企业整合优化资源，以合理的成本在充分开发和利用现有资</span><span style=\"font-size:16px;\">源的情况下，实现企业经营利益最大化。</span><br />\r\n<span style=\"font-size:16px;\">&nbsp; &nbsp; “智有我天地、见证石成金”是我们的不懈追求，也是我们为企业、为社会服务、共用双赢的最终目标。我们的核心竞争力</span><span style=\"font-size:16px;\">在于拥有独特的行销网路和社会资本，拥有专业的研发顾问团队，拥有多年的管理经验和丰富的专业谘询服务，拥有精诚合作的团队精神，</span><span style=\"font-size:16px;\">拥有积极向上的工作态度。更重要的是，我们拥有一颗为企业服务的真诚的心。CRO投资集团愿意与国内外各界朋友精诚合作、共谋发展、</span><span style=\"font-size:16px;\">共用双赢，在日趋激烈的国际竞争氛围中积极拓展、共攀高峰，推展全球经济一体化进程！</span> \r\n</p>\r\n<div>\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '1441201736', '', '', '', '');
INSERT INTO `dd_indexview` VALUES ('12', '天老总', '', '公司准备筹划即将开业，开业期间，收款100万&nbsp;', '', '1441207326', '', '', '', '');
INSERT INTO `dd_indexview` VALUES ('13', '投资项目', '', '464652463262', '', '1441207806', '', '', '', '');
INSERT INTO `dd_indexview` VALUES ('14', '关于我们', '', '<p class=\"MsoNormal\" style=\"color:#333333;font-family:宋体, tahoma, Srial, helvetica, sans-serif;\">\r\n	<span style=\"line-height:1.5;font-size:16px;\">美国</span><span style=\"line-height:1.5;font-size:16px;\">CRO</span><span style=\"line-height:1.5;font-size:16px;\">投资集团创立于</span><span style=\"line-height:1.5;font-size:16px;\">1986</span><span style=\"line-height:1.5;\"><span style=\"font-size:16px;\">年。位于美国圣地亚哥商业中心，是向快速成长的公司提供私募股权和风险投资的投资者。&nbsp;自公司成立以来，CRO已募集大约150 亿美元资金，并向 380 多家跨行业的公司提供成长资金、资本重组和管理层收购。这些公司中至今已有&nbsp;超过130 家公开上市，有 135 多家完成战略并购。</span><span style=\"line-height:1.5;font-size:16px;\">总部设立在美国西部最大的金融中心旧金山，在美国的波士顿、硅谷、英国.&nbsp;伦敦&nbsp;东京和圣保罗设计有办事处。是一家具有全球视野和实力的大型投资集团公司</span></span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"color:#333333;font-family:宋体, tahoma, Srial, helvetica, sans-serif;\">\r\n	<span style=\"line-height:1.5;font-size:16px;\">&nbsp; &nbsp; 美国</span><span style=\"line-height:1.5;font-size:16px;\">CRO</span><span style=\"line-height:1.5;font-size:16px;\">投资集团是集投资、融资、能源资源、商业服务、信息技术和服务、消费品、教育、金融科技和服务、医药医疗、工业、互联网、新媒体、以及软件、国际贸易及高新技术开发于一体的多功能、多元化的跨国性资本营运机构。拥有国际资本市场运作的丰富经验，聚集了一批在行业、技术、管理、财务、法律等方面的专家实行管理与运作。</span>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"color:#333333;font-family:宋体, tahoma, Srial, helvetica, sans-serif;\">\r\n	<span style=\"font-size:16px;\">&nbsp; &nbsp; CRO</span><span style=\"font-size:16px;\">集团资金实力雄厚，恪守诚信、注重时效，并与大陆有关部门、国际高层金融机构和美国的基金会、财团、银行等建立了良好的金融关系。目前已与北美、南美、澳洲、中东、南非、亚洲、欧盟等多个国家和地区的企业建立了合资机构、和金融合作关系，并取得了非常可观的经济效益，公司在世界许多地区设有代表处而建立了比较广泛的经贸、高新技术开发的管理体系网路。</span>\r\n</p>\r\n<div>\r\n	<br />\r\n</div>', '', '1441208434', '', '', '', '');

-- ----------------------------
-- Table structure for dd_invest_plan
-- ----------------------------
DROP TABLE IF EXISTS `dd_invest_plan`;
CREATE TABLE `dd_invest_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `start` date NOT NULL COMMENT '开始时间',
  `period` int(11) NOT NULL DEFAULT '0' COMMENT '分红周期（天）',
  `periodnow` int(11) NOT NULL DEFAULT '0' COMMENT '已分红几次',
  `lastoptdate` date DEFAULT NULL COMMENT '上一次操作时间',
  `investamount` float NOT NULL DEFAULT '0' COMMENT '投资额',
  `rate` float NOT NULL DEFAULT '0' COMMENT '周期利率',
  `randrate` float NOT NULL DEFAULT '0' COMMENT '随机利率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_invest_plan
-- ----------------------------
INSERT INTO `dd_invest_plan` VALUES ('1', '2', '2016-10-06', '90', '3', '2016-10-08', '13500', '20', '2');
INSERT INTO `dd_invest_plan` VALUES ('2', '3', '2016-10-06', '90', '3', '2016-10-08', '4500', '15', '2');
INSERT INTO `dd_invest_plan` VALUES ('3', '4', '2016-10-06', '90', '3', '2016-10-08', '1500', '12', '2');
INSERT INTO `dd_invest_plan` VALUES ('4', '5', '2016-10-06', '90', '3', '2016-10-08', '1500', '12', '2');
INSERT INTO `dd_invest_plan` VALUES ('5', '6', '2016-10-06', '90', '3', '2016-10-08', '4500', '15', '2');
INSERT INTO `dd_invest_plan` VALUES ('6', '7', '2016-10-06', '90', '3', '2016-10-08', '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('7', '8', '2016-10-06', '90', '3', '2016-10-08', '13500', '20', '2');
INSERT INTO `dd_invest_plan` VALUES ('8', '9', '2016-10-06', '90', '3', '2016-10-08', '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('9', '10', '2016-10-06', '90', '3', '2016-10-08', '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('10', '11', '2016-10-06', '90', '3', '2016-10-08', '1500', '12', '2');
INSERT INTO `dd_invest_plan` VALUES ('11', '12', '2016-10-06', '90', '3', '2016-10-08', '4500', '15', '2');
INSERT INTO `dd_invest_plan` VALUES ('12', '13', '2016-10-06', '90', '3', '2016-10-08', '13500', '20', '2');
INSERT INTO `dd_invest_plan` VALUES ('13', '14', '2016-10-06', '90', '3', '2016-10-08', '13500', '20', '2');
INSERT INTO `dd_invest_plan` VALUES ('14', '15', '2016-10-06', '90', '3', '2016-10-08', '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('15', '16', '2016-10-06', '90', '3', '2016-10-08', '1500', '12', '2');
INSERT INTO `dd_invest_plan` VALUES ('16', '17', '2016-10-09', '90', '0', null, '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('17', '18', '2016-10-09', '90', '0', null, '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('18', '19', '2016-10-09', '90', '0', null, '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('19', '20', '2016-10-09', '90', '0', null, '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('20', '21', '2016-10-09', '90', '0', null, '1500', '12', '2');
INSERT INTO `dd_invest_plan` VALUES ('21', '22', '2016-10-09', '90', '0', null, '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('22', '23', '2016-10-09', '90', '0', null, '1500', '12', '2');
INSERT INTO `dd_invest_plan` VALUES ('23', '24', '2016-10-09', '90', '0', null, '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('24', '25', '2016-10-09', '90', '0', null, '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('25', '26', '2016-10-09', '90', '0', null, '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('26', '27', '2016-10-09', '90', '0', null, '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('27', '29', '2016-10-10', '90', '0', null, '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('28', '30', '2016-10-10', '90', '0', null, '4500', '15', '2');
INSERT INTO `dd_invest_plan` VALUES ('29', '31', '2016-10-10', '90', '0', null, '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('30', '33', '2016-10-10', '90', '0', null, '500', '10', '2');
INSERT INTO `dd_invest_plan` VALUES ('31', '34', '2017-02-17', '90', '0', null, '500', '10', '2');

-- ----------------------------
-- Table structure for dd_market
-- ----------------------------
DROP TABLE IF EXISTS `dd_market`;
CREATE TABLE `dd_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bankuser` varchar(30) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `bankcard` varchar(50) DEFAULT NULL,
  `bankaddress` varchar(255) DEFAULT NULL,
  `sn` varchar(25) DEFAULT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `coin` decimal(9,2) NOT NULL DEFAULT '0.00',
  `shui` decimal(11,2) NOT NULL DEFAULT '0.00',
  `rcoin` decimal(11,2) NOT NULL DEFAULT '0.00',
  `buyid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `addtime` varchar(20) DEFAULT NULL,
  `buytime` varchar(50) DEFAULT NULL,
  `lockdate` varchar(20) DEFAULT NULL,
  `key1` int(11) NOT NULL DEFAULT '0',
  `key2` int(11) NOT NULL DEFAULT '0',
  `contact` varchar(50) DEFAULT NULL,
  `complain` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_market
-- ----------------------------

-- ----------------------------
-- Table structure for dd_member
-- ----------------------------
DROP TABLE IF EXISTS `dd_member`;
CREATE TABLE `dd_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `nick` varchar(50) DEFAULT NULL,
  `upd1` varchar(50) DEFAULT NULL,
  `upd2` varchar(50) DEFAULT NULL,
  `upd3` varchar(50) DEFAULT NULL,
  `utype` int(11) NOT NULL DEFAULT '0' COMMENT '等级',
  `dan` int(11) NOT NULL DEFAULT '0' COMMENT '下单数',
  `reutype` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '5',
  `ft` int(11) NOT NULL DEFAULT '0',
  `lok` int(11) NOT NULL DEFAULT '0',
  `rid` int(11) NOT NULL DEFAULT '0' COMMENT '推荐人',
  `fid` int(11) NOT NULL DEFAULT '0' COMMENT '管理人（上家）',
  `line` int(11) NOT NULL DEFAULT '0' COMMENT '0:左区1:右区',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '报单中心（uid）',
  `od` int(11) NOT NULL DEFAULT '0',
  `renum` int(11) NOT NULL DEFAULT '0' COMMENT '推荐人数量',
  `drsum` int(11) NOT NULL DEFAULT '0' COMMENT '团队人数',
  `allrenum` int(11) NOT NULL DEFAULT '0',
  `ldansum` int(11) DEFAULT '0' COMMENT '左区域下单总计',
  `zdansum` int(11) DEFAULT '0',
  `rdansum` int(11) DEFAULT '0' COMMENT '右区域下单总计',
  `lsum` decimal(13,3) NOT NULL DEFAULT '0.000' COMMENT '左区域总计',
  `zsum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `rsum` decimal(13,3) NOT NULL DEFAULT '0.000' COMMENT '右区域总计',
  `lyu` decimal(13,3) NOT NULL DEFAULT '0.000' COMMENT '左区域剩余数量',
  `zyu` decimal(13,3) NOT NULL DEFAULT '0.000',
  `ryu` decimal(13,3) NOT NULL DEFAULT '0.000' COMMENT '右区域剩余数量',
  `isagent` int(11) NOT NULL DEFAULT '0',
  `money` decimal(13,3) NOT NULL DEFAULT '0.000',
  `gdsum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `allin` decimal(13,3) NOT NULL DEFAULT '0.000',
  `coin` decimal(13,3) NOT NULL DEFAULT '0.000',
  `score` decimal(13,3) NOT NULL DEFAULT '0.000',
  `xun` decimal(13,3) NOT NULL DEFAULT '0.000',
  `gp` decimal(13,3) NOT NULL DEFAULT '0.000',
  `kgu` float NOT NULL DEFAULT '0',
  `gu` float NOT NULL DEFAULT '0',
  `rebuy` decimal(13,3) NOT NULL DEFAULT '0.000',
  `pro` decimal(13,3) NOT NULL DEFAULT '0.000',
  `bt` float NOT NULL DEFAULT '0',
  `bt1` float NOT NULL DEFAULT '0',
  `bt2` float NOT NULL DEFAULT '0',
  `gt` float NOT NULL DEFAULT '0',
  `gt1` float NOT NULL DEFAULT '0',
  `ly` float NOT NULL DEFAULT '0',
  `gd` float NOT NULL DEFAULT '0',
  `gd1` float NOT NULL DEFAULT '0',
  `gd2` float NOT NULL DEFAULT '0',
  `fhjsum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `jdjsum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `wsum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `wrec` int(11) NOT NULL DEFAULT '0' COMMENT '周推荐',
  `wact` int(11) NOT NULL DEFAULT '0' COMMENT '周激活',
  `wee` int(11) NOT NULL DEFAULT '0' COMMENT '当前周数',
  `mrec` int(11) NOT NULL DEFAULT '0',
  `mact` int(11) NOT NULL DEFAULT '0',
  `mon` int(11) NOT NULL DEFAULT '0',
  `msum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `dpdaysum` decimal(13,3) NOT NULL DEFAULT '0.000' COMMENT '每日对碰总计',
  `jddaysum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `dpsum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `jdsum` decimal(13,3) NOT NULL DEFAULT '0.000',
  `trade` int(11) NOT NULL DEFAULT '0' COMMENT '交易次数',
  `tradedate` varchar(50) DEFAULT NULL COMMENT '封闭期',
  `realname` varchar(50) DEFAULT NULL,
  `sex` int(11) NOT NULL DEFAULT '0',
  `country` varchar(20) DEFAULT NULL,
  `idcard` varchar(50) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `bankuser` varchar(50) DEFAULT NULL,
  `bankcard` varchar(50) DEFAULT NULL,
  `bankaddress` varchar(255) DEFAULT NULL,
  `weixin` varchar(50) DEFAULT NULL,
  `epay` varchar(50) DEFAULT NULL,
  `epayname` varchar(50) DEFAULT NULL,
  `bit` varchar(50) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `regdate` varchar(20) DEFAULT NULL,
  `regweek` int(11) NOT NULL DEFAULT '0',
  `regmonth` int(11) NOT NULL DEFAULT '0',
  `actdate` varchar(20) DEFAULT NULL,
  `actweek` int(11) NOT NULL DEFAULT '0',
  `actmonth` int(11) NOT NULL DEFAULT '0',
  `loginip` varchar(20) DEFAULT NULL,
  `logindate` varchar(20) DEFAULT NULL,
  `lastip` varchar(20) DEFAULT NULL,
  `lastdate` varchar(20) DEFAULT NULL,
  `q` int(11) NOT NULL DEFAULT '0',
  `q1` varchar(150) DEFAULT NULL,
  `q2` varchar(150) DEFAULT NULL,
  `q3` varchar(150) DEFAULT NULL,
  `a1` varchar(150) DEFAULT NULL,
  `a2` varchar(150) DEFAULT NULL,
  `a3` varchar(150) DEFAULT NULL,
  `u1` int(11) NOT NULL DEFAULT '0',
  `u2` int(11) NOT NULL DEFAULT '0',
  `u3` int(11) NOT NULL DEFAULT '0',
  `u4` int(11) NOT NULL DEFAULT '0',
  `u5` int(11) NOT NULL DEFAULT '0',
  `fhday` int(11) NOT NULL DEFAULT '0',
  `belongid` int(11) NOT NULL DEFAULT '0',
  `qdstatus` int(11) NOT NULL DEFAULT '0',
  `resum` decimal(13,3) NOT NULL DEFAULT '0.000' COMMENT '推荐数量总计',
  `reyu` decimal(13,3) NOT NULL DEFAULT '0.000' COMMENT '推荐数量剩余',
  `areasum` decimal(13,3) NOT NULL DEFAULT '0.000' COMMENT '小区总业绩',
  `areayu` decimal(13,3) NOT NULL DEFAULT '0.000' COMMENT '小区剩余业绩',
  `zsj` int(11) NOT NULL DEFAULT '0',
  `coina` decimal(13,3) DEFAULT '0.000' COMMENT '可用账户',
  `coinb` decimal(13,3) DEFAULT '0.000' COMMENT '消费账户',
  `coinc` decimal(13,3) DEFAULT '0.000' COMMENT '复投账户',
  `qianbao` varchar(200) DEFAULT NULL COMMENT '钱包地址（转入）',
  `qianbaoc` varchar(200) DEFAULT NULL COMMENT '钱包地址（转出）',
  `ga` varchar(50) DEFAULT NULL COMMENT '谷歌认证',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_member
-- ----------------------------
INSERT INTO `dd_member` VALUES ('1', '88888888', '测试', '96e79218965eb72c92a549dd5a330112', '21218cca77804d2ba1922c33e0151105', '', '1', '7', '0', '1', '5', '0', '0', '0', '0', '0', '1', '0', '6', '0', '0', '0', '0', '3', '74000.000', '0.000', '17500.000', '56500.000', '0.000', '0.000', '1', '1000.000', '0.000', '1327.500', '0.000', '0.000', '0.000', '0.000', '0', '7', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '24000.000', '0', '0', '40', '0', '0', '10', '0.000', '2600.000', '0.000', '0.000', '5206.160', '0', '2015-05-03', '系统帐号', '0', '', 'sdf', '', '', '', '', '', '', '', '', '1234', '13888888888', '', '2016-10-05 17:07:37', '40', '10', '2016-10-05 17:13:35', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '24000.000', '24000.000', '91500.000', '91500.000', '0', '9999876141.000', '199.126', '199.124', null, 'eeQxau2GdogZ9hBKmARXze1eBMSKoV8tG9', 'FPMZ7DANUFQGRA42|1|1');
INSERT INTO `dd_member` VALUES ('2', 'ECF34674', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '1', '1', '0', '1', '1', '7', '0', '0', '0', '0', '0', '20000.000', '0.000', '40500.000', '0.000', '0.000', '20500.000', '1', '0.000', '0.000', '206.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '21500.000', '0', '0', '0', '0', '0', '0', '0.000', '8000.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', '', '', '', '', null, '', null, '', '', '11111111111', '', '2016-10-06 17:21:02', '40', '10', '2016-10-06 17:21:23', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '21500.000', '21500.000', '60500.000', '60500.000', '0', '31730.283', '726.251', '680.739', null, 'eiy1rHW38Rmeev1njmb1iT4XTBwGkEGTwe', 'LDDTZUTNI57SEENJ|1|1');
INSERT INTO `dd_member` VALUES ('3', 'ECF18137', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '3', '0', '0', '1', '5', '0', '0', '1', '1', '1', '1', '2', '8', '0', '0', '3', '0', '0', '8500.000', '0.000', '4500.000', '4000.000', '0.000', '0.000', '1', '0.000', '0.000', '683.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '6000.000', '0', '0', '0', '0', '0', '0', '0.000', '1350.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'sale@qijianke.com', '2016-10-06 17:23:18', '40', '10', '2016-10-06 17:23:37', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '6000.000', '6000.000', '13000.000', '13000.000', '0', '94675.678', '102.450', '119.846', null, null, null);
INSERT INTO `dd_member` VALUES ('4', 'ECF24644', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '2', '0', '0', '1', '5', '0', '0', '2', '2', '0', '1', '3', '2', '0', '0', '0', '0', '0', '4500.000', '0.000', '14000.000', '0.000', '0.000', '9500.000', '1', '0.000', '0.000', '60.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '1000.000', '0', '0', '0', '0', '0', '0', '0.000', '1060.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-06 17:32:24', '40', '10', '2016-10-06 17:32:40', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '1000.000', '1000.000', '18500.000', '18500.000', '0', '99491.305', '79.500', '83.257', null, null, null);
INSERT INTO `dd_member` VALUES ('5', 'ECF62479', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '2', '0', '0', '1', '5', '0', '0', '2', '2', '1', '1', '4', '5', '0', '0', '0', '0', '0', '5500.000', '0.000', '33500.000', '0.000', '0.000', '28000.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '33500.000', '0', '0', '0', '0', '0', '0', '0.000', '1320.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-06 17:33:31', '40', '10', '2016-10-06 17:33:42', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '33500.000', '33500.000', '39000.000', '39000.000', '0', '30563.854', '114.188', '119.830', null, null, null);
INSERT INTO `dd_member` VALUES ('6', 'ECF69714', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '3', '0', '0', '1', '5', '0', '0', '2', '5', '0', '1', '5', '0', '0', '0', '0', '0', '0', '500.000', '0.000', '500.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '150.000', '0.000', '0.000', '0.000', '0', null, '11', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'sale@qijianke.com', '2016-10-06 17:35:03', '40', '10', '2016-10-06 17:35:51', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '1000.000', '1000.000', '0', '149.667', '11.250', '28.573', null, null, null);
INSERT INTO `dd_member` VALUES ('7', 'ECF55517', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '2', '0', '0', '1', '5', '0', '0', '2', '4', '0', '1', '6', '0', '0', '0', '0', '0', '0', '3500.000', '0.000', '500.000', '3000.000', '0.000', '0.000', '1', '0.000', '0.000', '60.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '120.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', '', '2016-10-06 17:35:43', '40', '10', '2016-10-06 17:35:56', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '4000.000', '4000.000', '0', '51.472', '9.000', '10.848', null, null, null);
INSERT INTO `dd_member` VALUES ('8', 'ECF47146', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '4', '0', '0', '1', '5', '0', '0', '2', '4', '1', '1', '7', '1', '0', '0', '0', '0', '0', '500.000', '0.000', '0.000', '500.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '500.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-06 17:36:21', '40', '10', '2016-10-06 17:37:13', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '500.000', '500.000', '500.000', '500.000', '0', '307.856', '0.000', '54.504', null, null, null);
INSERT INTO `dd_member` VALUES ('9', 'ECF94413', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '2', '5', '1', '1', '8', '0', '0', '0', '0', '0', '0', '1500.000', '0.000', '31500.000', '0.000', '0.000', '30000.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '300.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', '', '', '', '', null, '', null, '', '', '11111111111', 'btc10000usd@163.com', '2016-10-06 17:37:04', '40', '10', '2016-10-06 17:37:17', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '33000.000', '33000.000', '0', '114.425', '22.500', '24.340', 'egHBxCn2XP6Fe4i7oCLmKHSdBDkebBMAd5', 'eiy1rHW38Rmeev1njmb1iT4XTBwGkEGTwe', null);
INSERT INTO `dd_member` VALUES ('10', 'ECF66543', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '5', '6', '0', '1', '9', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-06 17:43:33', '40', '10', '2016-10-06 17:43:49', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '8.480', '0.000', '1.850', null, null, null);
INSERT INTO `dd_member` VALUES ('11', 'ECF63727', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '2', '0', '0', '1', '5', '0', '0', '5', '9', '0', '1', '10', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-06 17:44:21', '40', '10', '2016-10-06 17:44:29', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '31.020', '0.000', '5.650', null, null, null);
INSERT INTO `dd_member` VALUES ('12', 'ECF88421', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '3', '0', '0', '1', '5', '0', '0', '5', '9', '1', '1', '11', '0', '0', '0', '0', '0', '0', '13500.000', '0.000', '13500.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '4050.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-06 17:50:17', '40', '10', '2016-10-06 17:53:53', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '27000.000', '27000.000', '0', '1514.863', '303.750', '321.107', null, null, null);
INSERT INTO `dd_member` VALUES ('13', 'ECF32422', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '4', '0', '0', '1', '5', '0', '0', '5', '12', '0', '1', '12', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '16398741478', 'btc10000usd@163.com', '2016-10-06 18:01:39', '40', '10', '2016-10-06 18:01:50', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '309.387', '0.000', '54.773', null, null, null);
INSERT INTO `dd_member` VALUES ('14', 'ECF88742', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '4', '0', '0', '1', '5', '0', '0', '5', '12', '1', '1', '13', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-06 18:02:41', '40', '10', '2016-10-06 18:20:09', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '152.013', '0.000', '27.002', null, null, null);
INSERT INTO `dd_member` VALUES ('15', 'ECF35817', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '2', '6', '1', '1', '14', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, '2222', '0', '', '1', '', '', '', '', null, '', null, '', '', '11111111111', '', '2016-10-06 18:27:53', '40', '10', '2016-10-06 18:28:10', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '104.216', '0.000', '0.920', 'egSBqLYyL9jrLsJQuVnryFR4DDVLhdqKXM', 'eiy1rHW38Rmeev1njmb1iT4XTBwGkEGTwe', null);
INSERT INTO `dd_member` VALUES ('16', 'ECF53369', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '2', '0', '0', '1', '5', '0', '0', '4', '7', '0', '1', '15', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, '1', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-06 19:38:51', '40', '10', '2016-10-06 19:39:14', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '14.989', '200.000', '97012.820', null, null, null);
INSERT INTO `dd_member` VALUES ('17', 'ECF97672', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '4', '7', '1', '1', '16', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, '1', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-06 19:44:59', '40', '10', '2016-10-09 15:30:13', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '-1.000', '0.000', '0.000', null, null, null);
INSERT INTO `dd_member` VALUES ('18', 'ECF13786', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '1', '3', '1', '1', '17', '0', '0', '0', '0', '0', '0', '2500.000', '0.000', '1500.000', '1000.000', '0.000', '0.000', '1', '0.000', '0.000', '150.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '300.000', '0.000', '0.000', '0.000', '0', null, '1', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-09 18:29:10', '40', '10', '2016-10-09 18:29:23', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '4000.000', '4000.000', '0', '105.000', '22.500', '22.500', null, null, null);
INSERT INTO `dd_member` VALUES ('19', 'ECF85749', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '1', '3', '0', '1', '18', '0', '0', '0', '1', '0', '2', '5500.000', '0.000', '2500.000', '3000.000', '0.000', '0.000', '1', '0.000', '0.000', '250.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '500.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '16398741478', 'btc10000usd@163.com', '2016-10-09 18:32:03', '40', '10', '2016-10-09 18:32:11', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '8000.000', '8000.000', '0', '175.000', '37.500', '37.500', null, null, null);
INSERT INTO `dd_member` VALUES ('20', 'ECF64645', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '3', '19', '0', '1', '19', '0', '0', '0', '1', '0', '0', '500.000', '0.000', '4500.000', '0.000', '0.000', '4000.000', '1', '0.000', '0.000', '50.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '100.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-09 18:52:11', '40', '10', '2016-10-09 18:53:05', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '5000.000', '5000.000', '0', '35.000', '7.500', '7.500', null, null, null);
INSERT INTO `dd_member` VALUES ('21', 'ECF32573', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '2', '0', '0', '1', '5', '0', '0', '3', '19', '1', '1', '20', '2', '0', '0', '1', '0', '1', '500.000', '0.000', '500.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '60.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '1000.000', '0', '0', '0', '0', '0', '0', '0.000', '120.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-09 18:52:57', '40', '10', '2016-10-09 18:53:10', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '1000.000', '1000.000', '1000.000', '1000.000', '0', '42.000', '9.000', '9.000', null, null, null);
INSERT INTO `dd_member` VALUES ('22', 'ECF74821', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '3', '18', '0', '1', '21', '0', '0', '0', '0', '0', '0', '1500.000', '0.000', '500.000', '1000.000', '0.000', '0.000', '1', '0.000', '0.000', '50.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '100.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-09 18:54:20', '40', '10', '2016-10-09 18:55:19', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '2000.000', '2000.000', '0', '35.000', '7.500', '7.500', null, null, null);
INSERT INTO `dd_member` VALUES ('23', 'ECF24714', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '2', '0', '0', '1', '5', '0', '0', '3', '18', '1', '1', '22', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-09 18:55:07', '40', '10', '2016-10-09 18:55:22', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', null, null, null);
INSERT INTO `dd_member` VALUES ('24', 'ECF19673', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '3', '22', '0', '1', '23', '0', '0', '0', '0', '0', '0', '500.000', '0.000', '500.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '50.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '100.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '16398741478', 'btc10000usd@163.com', '2016-10-09 18:59:52', '40', '10', '2016-10-09 19:00:33', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '1000.000', '1000.000', '0', '35.000', '7.500', '7.500', null, null, null);
INSERT INTO `dd_member` VALUES ('25', 'ECF48785', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '3', '22', '1', '1', '24', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, '1', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-09 19:00:26', '40', '10', '2016-10-09 19:00:37', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', null, null, null);
INSERT INTO `dd_member` VALUES ('26', 'ECF23969', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '3', '24', '0', '1', '25', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, '111111', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-09 19:29:47', '40', '10', '2016-10-09 19:30:22', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', null, null, null);
INSERT INTO `dd_member` VALUES ('27', 'ECF42738', '1', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '3', '24', '1', '1', '26', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, '1', '0', '', '1', null, null, null, null, null, null, null, null, '', '11111111111', 'btc10000usd@163.com', '2016-10-09 19:30:12', '40', '10', '2016-10-09 19:30:28', '40', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', null, null, null);
INSERT INTO `dd_member` VALUES ('29', 'ECF43464', 'ss', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '8', '8', '0', '1', '27', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, 'ss', '0', '', '1', null, null, null, null, null, null, null, null, '', '', '13094190934@163.com', '2016-10-10 10:36:20', '41', '10', '2016-10-10 14:51:09', '41', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', null, null, null);
INSERT INTO `dd_member` VALUES ('30', 'ECF94399', 'fff', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '3', '0', '0', '1', '5', '0', '0', '1', '20', '1', '1', '28', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, 'fff', '0', '', '1', null, null, null, null, null, null, null, null, '', '', '13094190934@163.com', '2016-10-10 14:52:10', '41', '10', '2016-10-10 14:52:15', '41', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', null, null, null);
INSERT INTO `dd_member` VALUES ('31', 'ECF72933', 'ff', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', null, '1', '0', '0', '1', '5', '0', '0', '1', '20', '0', '1', '29', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, 'fff', '0', '', '1', null, null, null, null, null, null, null, null, '', '', '3460383293@qq.com', '2016-10-10 14:55:34', '41', '10', '2016-10-10 14:55:40', '41', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', null, null, null);
INSERT INTO `dd_member` VALUES ('33', 'ECF49225', '111', 'e10adc3949ba59abbe56e057f20f883e', '25f9e794323b453885f5181f1b624d0b', null, '1', '0', '0', '1', '5', '0', '0', '21', '21', '0', '1', '30', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, '11', '0', '', '1', null, null, null, null, null, null, null, null, '', '', '', '2016-10-10 16:06:12', '41', '10', '2016-10-10 16:32:03', '41', '10', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', null, null, null);
INSERT INTO `dd_member` VALUES ('34', 'ECF73166', 'sss', 'e10adc3949ba59abbe56e057f20f883e', 'fcea920f7412b5da7be0cf42b8c93759', null, '1', '0', '0', '1', '5', '0', '0', '21', '21', '1', '19', '31', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0', '0', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0', null, 'sss', '0', '', '1', null, null, null, null, null, null, null, null, '', '', '', '2016-10-10 17:35:18', '41', '10', '2017-02-17 20:55:31', '7', '2', '127.0.0.1', '2017-02-21 14:34:01', '127.0.0.1', '2017-02-21 14:07:29', '0', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0.000', '0.000', '0.000', '0.000', '0', '0.000', '0.000', '0.000', null, null, null);

-- ----------------------------
-- Table structure for dd_menu
-- ----------------------------
DROP TABLE IF EXISTS `dd_menu`;
CREATE TABLE `dd_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '99',
  `title` varchar(100) DEFAULT NULL,
  `entitle` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `module` varchar(20) DEFAULT NULL,
  `did` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_menu
-- ----------------------------
INSERT INTO `dd_menu` VALUES ('1', '1', '0', '1', '关于我们', '集團業務', '#', '', '0', '1');
INSERT INTO `dd_menu` VALUES ('2', '2', '0', '1', '关于我们', '集團概況', '#', '', '0', '0');
INSERT INTO `dd_menu` VALUES ('3', '2', '0', '1', '董事长致词', '董事長致詞', '#', '', '11', '1');
INSERT INTO `dd_menu` VALUES ('4', '2', '0', '2', '公司简介', '公司簡介 ', '', '', '2', '1');
INSERT INTO `dd_menu` VALUES ('5', '1', '0', '1', '新能源投资', '新能源投資', '', '', '3', '1');
INSERT INTO `dd_menu` VALUES ('6', '1', '0', '2', '国际金融', '國際金融', '', '', '4', '1');
INSERT INTO `dd_menu` VALUES ('7', '1', '0', '3', '食品加工', '食品加工', '', '', '5', '1');
INSERT INTO `dd_menu` VALUES ('8', '1', '0', '3', '工业园区开发', '工業園區開發', '', '', '6', '1');
INSERT INTO `dd_menu` VALUES ('9', '1', '0', '5', '休闲娱乐', '休閒娛樂', '', '', '7', '1');
INSERT INTO `dd_menu` VALUES ('10', '10', '0', '3', '专长行业', '組織架構', '#', '', '9', '1');
INSERT INTO `dd_menu` VALUES ('38', '0', '0', '1', '专长行业', '', '#', '', '0', '0');
INSERT INTO `dd_menu` VALUES ('12', '0', '0', '2', '投资项目', '企業文化', '#', '', '0', '0');
INSERT INTO `dd_menu` VALUES ('13', '12', '0', '1', '投资项目', '企業文化', '#', '', '13', '1');
INSERT INTO `dd_menu` VALUES ('14', '0', '0', '7', '联系我们', '聯繫我們', '#', '', '10', '0');
INSERT INTO `dd_menu` VALUES ('15', '0', '0', '6', '会员登陆', '會員登陆', 'http://vip.diansoft.net/web150815/index.php/login/', '', '0', '0');
INSERT INTO `dd_menu` VALUES ('16', '0', '0', '5', '新闻中心', '新聞中心', '#', '', '0', '0');
INSERT INTO `dd_menu` VALUES ('17', '16', '0', '1', '公司公告', '公司公告', '', '', '1', '2');
INSERT INTO `dd_menu` VALUES ('18', '16', '0', '2', '行业新闻', '行業新聞', '', '', '2', '2');
INSERT INTO `dd_menu` VALUES ('21', '1', '0', '0', '公司简介', '', '#', '', '2', '1');
INSERT INTO `dd_menu` VALUES ('22', '1', '0', '0', '董事长致词', '', '#', '', '0', '1');
INSERT INTO `dd_menu` VALUES ('23', '23', '0', '0', '关于我们', '', '#', '', '11', '1');
INSERT INTO `dd_menu` VALUES ('24', '0', '0', '0', '关于我们', '', '#', '', '0', '0');
INSERT INTO `dd_menu` VALUES ('26', '24', '0', '1', '公司简介', '', '#', '', '2', '1');
INSERT INTO `dd_menu` VALUES ('25', '24', '0', '0', '董事长致词', '', '#', '', '11', '1');
INSERT INTO `dd_menu` VALUES ('27', '0', '0', '2', '休闲娱乐', '', '#', '', '0', '0');
INSERT INTO `dd_menu` VALUES ('28', '27', '0', '0', '新能源投资', '', '#', '', '7', '1');
INSERT INTO `dd_menu` VALUES ('29', '0', '0', '4', '企业文化', '', '#', '', '0', '0');
INSERT INTO `dd_menu` VALUES ('30', '29', '0', '0', '企业文化', '', '#', '', '9', '1');
INSERT INTO `dd_menu` VALUES ('32', '0', '0', '1', '投资团队', '', '#', '', '0', '0');
INSERT INTO `dd_menu` VALUES ('39', '38', '0', '99', '发放', '', '#', '', '2', '1');
INSERT INTO `dd_menu` VALUES ('40', '24', '0', '3', '天老总', '', '#', '', '12', '1');

-- ----------------------------
-- Table structure for dd_message
-- ----------------------------
DROP TABLE IF EXISTS `dd_message`;
CREATE TABLE `dd_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `toid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `hcontent` varchar(255) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `hdate` varchar(30) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `view` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_message
-- ----------------------------

-- ----------------------------
-- Table structure for dd_myzc
-- ----------------------------
DROP TABLE IF EXISTS `dd_myzc`;
CREATE TABLE `dd_myzc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `username` varchar(200) NOT NULL,
  `coinname` varchar(200) NOT NULL,
  `txid` varchar(200) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`),
  KEY `coinname` (`coinname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_myzc
-- ----------------------------
INSERT INTO `dd_myzc` VALUES ('1', '15', 'eiy1rHW38Rmeev1njmb1iT4XTBwGkEGTwe', 'ECF', '', '1.00000000', '0.05000000', '0.95000000', '0', '1475997111', '0', '1');

-- ----------------------------
-- Table structure for dd_myzr
-- ----------------------------
DROP TABLE IF EXISTS `dd_myzr`;
CREATE TABLE `dd_myzr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `username` varchar(200) NOT NULL,
  `coinname` varchar(200) NOT NULL,
  `txid` varchar(200) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `coinname` (`coinname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_myzr
-- ----------------------------
INSERT INTO `dd_myzr` VALUES ('1', '15', 'egSBqLYyL9jrLsJQuVnryFR4DDVLhdqKXM', 'ECF', 'ebcdc9cf966aa683bf10b72db3164730bae76add9fb273fb51cc934ea65de932', '100.00000000', '0.00000000', '100.00000000', '0', '1475997321', '0', '1');

-- ----------------------------
-- Table structure for dd_news
-- ----------------------------
DROP TABLE IF EXISTS `dd_news`;
CREATE TABLE `dd_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `entitle` varchar(255) DEFAULT NULL,
  `content` text,
  `encontent` text,
  `decription` varchar(255) DEFAULT NULL,
  `endescription` varchar(255) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `top` int(11) NOT NULL DEFAULT '0',
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_news
-- ----------------------------
INSERT INTO `dd_news` VALUES ('7', '0', 'ECF平台启用SSL加密通讯通告', '', '<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">尊敬的能量锎用户：</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\"></span><span style=\"font-size:12pt;font-family:宋体;\">我们很高兴的通知大家，通过技术运维部门的努力，系统于今天正式启用SSL加密算法！对平台数据链接进行了加密最高支持SHA256算法！从现在起即可通过https://ecfvip.biz</span><span><span style=\"font-size:12pt;\">访问ECF平台，明天起原有的http访问都会被强制加载到https加密访问！所有矿主就可以尽情享受安全的平台数据链接！本次SHA256算法的应用将大大提高网站的安全性，和所有矿主的交易安全性！</span></span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\"></span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">SHA256</span><span style=\"font-size:12pt;font-family:宋体;\">算法在不同客户端浏览器及操作系统环境中，存在一定兼容性问题。以下是对SHA256算法兼容性相关的统计信息。如若您使用的客户端浏览器软件无法达到SHA256算法的最低要求，建议您升级您的程序或系统版本，以确保更安全的使用我们的加密传输服务。</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\"></span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">操作系统及环境要求：</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\"></span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Android 2.3+</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Apple iOS 3.0+</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Apple OS X 10.5+</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Blackberry 5.0+</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">ChromeOS All</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Windows Outlook 2003 SP3+</span><span style=\"font-size:12pt;font-family:宋体;\">（Vista及以上系统）</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Windows Phone 7+</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Windows XP SP3+</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">OpenSSL 0.9.8o+</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Java 1.4.2+</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\"></span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">浏览器要求：</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\"></span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Adobe Acrobat/Reader 7</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Chrome 26+</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Chrome for Linux</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Chrome for Mac OS X 10.5+</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Firefox 1.5+</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Internet Explorer 6+ (Windows XP SP3</span><span style=\"font-size:12pt;font-family:宋体;\">及以上)</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Mozilla 1.4+ (NSS 3.8+)</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Netscape 7.1+</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Opera 9.0+</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Safari for 3+ Mac OS X 10.5+</span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\"></span> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\">\r\n	<span style=\"font-size:12pt;font-family:宋体;\">Accoin中国区客服中心&nbsp;2016.6.23</span> \r\n</p>', '', '', '', '', '0', '2016-10-05 17:02:31');

-- ----------------------------
-- Table structure for dd_node
-- ----------------------------
DROP TABLE IF EXISTS `dd_node`;
CREATE TABLE `dd_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_node
-- ----------------------------
INSERT INTO `dd_node` VALUES ('4', 'Admin', '后台模块', '1', '', '100', '0', '1');
INSERT INTO `dd_node` VALUES ('41', 'index', '消息列表', '1', '', '1', '27', '3');
INSERT INTO `dd_node` VALUES ('42', 'leave', '发送消息', '1', '', '2', '27', '3');
INSERT INTO `dd_node` VALUES ('7', 'Setting', '基本设置', '1', '', '1', '4', '2');
INSERT INTO `dd_node` VALUES ('8', 'index', '编辑', '1', '', '100', '7', '3');
INSERT INTO `dd_node` VALUES ('9', 'Coin', '奖金设置', '1', '', '2', '4', '2');
INSERT INTO `dd_node` VALUES ('10', 'Close', '关闭网站', '1', '', '3', '4', '2');
INSERT INTO `dd_node` VALUES ('11', 'Banklist', '提现方式设置', '1', '', '4', '4', '2');
INSERT INTO `dd_node` VALUES ('12', 'Coll', '收款方式设置', '1', '', '5', '4', '2');
INSERT INTO `dd_node` VALUES ('13', 'Data', '数据库管理', '1', '', '6', '4', '2');
INSERT INTO `dd_node` VALUES ('14', 'Clear', '重置网站数据', '1', '', '100', '4', '2');
INSERT INTO `dd_node` VALUES ('15', 'Member', '会员管理', '1', '', '7', '4', '2');
INSERT INTO `dd_node` VALUES ('16', 'index', '编辑', '1', '', '1', '9', '3');
INSERT INTO `dd_node` VALUES ('17', 'index', '编辑', '1', '', '1', '10', '3');
INSERT INTO `dd_node` VALUES ('18', 'index', '编辑', '1', '', '100', '11', '3');
INSERT INTO `dd_node` VALUES ('19', 'index', '编辑', '1', '', '100', '12', '3');
INSERT INTO `dd_node` VALUES ('20', 'index', '编辑', '1', '', '100', '13', '3');
INSERT INTO `dd_node` VALUES ('21', 'index', '编辑', '1', '', '100', '14', '3');
INSERT INTO `dd_node` VALUES ('22', 'index', '会员列表', '1', '', '1', '15', '3');
INSERT INTO `dd_node` VALUES ('23', 'edite', '编辑会员', '1', '', '2', '15', '3');
INSERT INTO `dd_node` VALUES ('24', 'activate', '激活会员', '1', '', '3', '15', '3');
INSERT INTO `dd_node` VALUES ('25', 'delete', '删除会员', '1', '', '100', '15', '3');
INSERT INTO `dd_node` VALUES ('26', ' Money', '财务管理', '1', '', '8', '4', '2');
INSERT INTO `dd_node` VALUES ('27', 'Message', '消息管理', '1', '', '9', '4', '2');
INSERT INTO `dd_node` VALUES ('28', 'News', '系统公告', '1', '', '9', '4', '2');
INSERT INTO `dd_node` VALUES ('29', 'Access', '管理员管理', '1', '', '10', '4', '2');
INSERT INTO `dd_node` VALUES ('31', 'index', '财务报表', '1', '', '1', '26', '3');
INSERT INTO `dd_node` VALUES ('32', 'lists', '奖金明细', '1', '', '2', '26', '3');
INSERT INTO `dd_node` VALUES ('33', 'member', '会员明细', '1', '', '3', '26', '3');
INSERT INTO `dd_node` VALUES ('34', 'degtail', '奖金详细', '1', '', '4', '26', '3');
INSERT INTO `dd_node` VALUES ('35', 'remittance', ' 汇款充值', '1', '', '5', '26', '3');
INSERT INTO `dd_node` VALUES ('36', 'online', '系统充值', '1', '', '6', '26', '3');
INSERT INTO `dd_node` VALUES ('37', 'online', '在线充值', '1', '', '8', '26', '3');
INSERT INTO `dd_node` VALUES ('38', 'cash', '会员提现', '1', '', '9', '26', '3');
INSERT INTO `dd_node` VALUES ('39', 'transfer', '会员转帐', '1', '', '11', '26', '3');
INSERT INTO `dd_node` VALUES ('40', 'conversion', '货币转换', '1', '', '12', '26', '3');
INSERT INTO `dd_node` VALUES ('43', 'view', '查看消息', '1', '', '3', '27', '3');
INSERT INTO `dd_node` VALUES ('44', 'delete', '删除消息', '1', '', '4', '27', '3');
INSERT INTO `dd_node` VALUES ('45', 'faview', '查看发送', '1', '', '100', '27', '3');
INSERT INTO `dd_node` VALUES ('46', 'index', '公告列表', '1', '', '1', '28', '3');
INSERT INTO `dd_node` VALUES ('47', 'edit', '添加编辑', '1', '', '100', '28', '3');
INSERT INTO `dd_node` VALUES ('48', 'delete', '删除', '1', '', '100', '28', '3');
INSERT INTO `dd_node` VALUES ('51', 'agent', '报单中心', '1', '', '100', '15', '3');
INSERT INTO `dd_node` VALUES ('52', 'password', '修改密码', '1', '', '100', '29', '3');
INSERT INTO `dd_node` VALUES ('69', 'apply', '申请列表', '1', '', '100', '15', '3');
INSERT INTO `dd_node` VALUES ('55', 'edit', '添加,编辑', '1', '', '1', '54', '3');
INSERT INTO `dd_node` VALUES ('56', 'delete', '删除', '1', '', '100', '54', '3');
INSERT INTO `dd_node` VALUES ('60', 'Slide', '幻灯片管理', '1', '', '100', '4', '2');
INSERT INTO `dd_node` VALUES ('61', 'edit', '添加,编辑', '1', '', '1', '58', '3');
INSERT INTO `dd_node` VALUES ('62', 'delete', '删除', '1', '', '100', '58', '3');
INSERT INTO `dd_node` VALUES ('72', 'fahlj', '发放日分红', '1', '', '100', '26', '3');
INSERT INTO `dd_node` VALUES ('73', 'fahkj', '发放周日奖', '1', '', '100', '26', '3');
INSERT INTO `dd_node` VALUES ('67', 'index', '添加,编辑', '1', '', '1', '60', '3');
INSERT INTO `dd_node` VALUES ('68', 'delete', '删除', '1', '', '100', '60', '3');

-- ----------------------------
-- Table structure for dd_operat
-- ----------------------------
DROP TABLE IF EXISTS `dd_operat`;
CREATE TABLE `dd_operat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_operat
-- ----------------------------
INSERT INTO `dd_operat` VALUES ('1', 'admin', '修改奖金设置', '2015-03-09 23:14:38', '修改');
INSERT INTO `dd_operat` VALUES ('2', 'admin', '修改内容:[网站设置]->[网站关闭内容]', '2015-03-09 23:21:11', '修改');
INSERT INTO `dd_operat` VALUES ('3', 'admin', '修改内容:[网站设置]->[网站关闭内容]', '2015-03-09 23:22:17', '修改');
INSERT INTO `dd_operat` VALUES ('4', 'admin', '修改内容:[网站设置]->[网站关闭内容]', '2015-03-09 23:22:29', '修改');
INSERT INTO `dd_operat` VALUES ('5', 'admin', '修改内容:[网站设置]->[网站关闭内容]', '2015-03-09 23:26:45', '修改');
INSERT INTO `dd_operat` VALUES ('6', 'admin', '修改内容:[网站设置]->[网站关闭内容]', '2015-03-10 12:44:12', '修改');
INSERT INTO `dd_operat` VALUES ('7', 'admin', '修改内容:[网站设置]->[网站关闭内容]', '2015-03-10 12:45:42', '修改');
INSERT INTO `dd_operat` VALUES ('8', 'admin', '修改内容:[网站设置]->[修改设置]', '2015-07-26 13:35:14', '修改');
INSERT INTO `dd_operat` VALUES ('9', 'admin', '修改内容:[网站设置]->[修改设置]', '2015-07-26 13:35:24', '修改');
INSERT INTO `dd_operat` VALUES ('10', 'admin', '修改内容:[网站设置]->[奖金设置]', '2015-07-30 17:41:02', '修改');
INSERT INTO `dd_operat` VALUES ('11', 'admin', '修改内容:[网站设置]->[奖金设置]', '2015-08-15 13:40:37', '修改');
INSERT INTO `dd_operat` VALUES ('12', 'admin', '修改内容:[网站设置]->[奖金设置]', '2015-08-15 14:35:00', '修改');
INSERT INTO `dd_operat` VALUES ('13', 'admin', '修改内容:[网站设置]->[奖金设置]', '2015-08-15 14:37:49', '修改');
INSERT INTO `dd_operat` VALUES ('14', 'admin', '修改内容:[网站设置]->[奖金设置]', '2015-08-15 14:38:43', '修改');
INSERT INTO `dd_operat` VALUES ('15', 'admin', '修改内容:[网站设置]->[奖金设置]', '2015-08-16 12:59:18', '修改');

-- ----------------------------
-- Table structure for dd_orderlist
-- ----------------------------
DROP TABLE IF EXISTS `dd_orderlist`;
CREATE TABLE `dd_orderlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `proname` varchar(255) DEFAULT NULL,
  `money` decimal(11,2) NOT NULL DEFAULT '0.00',
  `number` int(11) NOT NULL DEFAULT '0',
  `img` varchar(200) DEFAULT NULL,
  `total` decimal(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_orderlist
-- ----------------------------
INSERT INTO `dd_orderlist` VALUES ('1', '12', '8', '全球购 雷神笔记本', '6299.00', '3', '/Public/uploads/2016-03-10/56e107b8056b2.jpg', '18897.00');
INSERT INTO `dd_orderlist` VALUES ('2', '12', '4', '小米4c粉色高配版', '1299.00', '2', '/Public/uploads/2016-03-10/56e101441f163.jpg', '2598.00');
INSERT INTO `dd_orderlist` VALUES ('9', '15', '9', '雷神游戏本', '6299.00', '1', '/Public/uploads/2016-03-10/56e10ba2ce5dd.jpg', '6299.00');
INSERT INTO `dd_orderlist` VALUES ('8', '15', '5', '小米4c粉色高配版', '1299.00', '1', '/Public/uploads/2016-03-10/56e101441f163.jpg', '1299.00');
INSERT INTO `dd_orderlist` VALUES ('7', '15', '7', '全球购 雷神笔记本', '6299.00', '2', '/Public/uploads/2016-03-10/56e107b8056b2.jpg', '12598.00');
INSERT INTO `dd_orderlist` VALUES ('10', '16', '8', '全球购 雷神笔记本', '6299.00', '1', '/Public/uploads/2016-03-10/56e107b8056b2.jpg', '6299.00');
INSERT INTO `dd_orderlist` VALUES ('11', '17', '9', '雷神游戏本', '6299.00', '1', '/Public/uploads/2016-03-10/56e10ba2ce5dd.jpg', '6299.00');

-- ----------------------------
-- Table structure for dd_orders
-- ----------------------------
DROP TABLE IF EXISTS `dd_orders`;
CREATE TABLE `dd_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `shop` int(11) NOT NULL DEFAULT '0',
  `ordersn` varchar(100) DEFAULT NULL,
  `total` decimal(11,2) NOT NULL DEFAULT '0.00',
  `number` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `address` int(11) NOT NULL DEFAULT '0',
  `date` varchar(50) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `paytype` int(11) NOT NULL DEFAULT '0',
  `key1` int(11) NOT NULL DEFAULT '0',
  `padr` varchar(255) DEFAULT NULL,
  `ptel` varchar(20) DEFAULT NULL,
  `pun` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_orders
-- ----------------------------
INSERT INTO `dd_orders` VALUES ('16', '1', '0', 'RD1798570702', '6299.00', '1', '3', '3', '1464314176', '顺风:SF654981321 ', '0', '0', '测试收货地址', '15296385475', '测试收货用户');
INSERT INTO `dd_orders` VALUES ('15', '1', '0', 'RD8542963239', '20196.00', '4', '3', '1', '1464279919', '运达:YD646546871321', '0', '0', '测试收货地址', '15296385475', '测试收货用户');
INSERT INTO `dd_orders` VALUES ('12', '1', '0', 'RD8363341918', '21495.00', '5', '0', '3', '1464275653', '', '0', '0', '测试收货地址', '15296385475', '测试收货用户');
INSERT INTO `dd_orders` VALUES ('17', '2', '0', 'RD4984706963', '6299.00', '1', '0', '4', '1464612212', '', '0', '0', '5', '12323231234', '1');

-- ----------------------------
-- Table structure for dd_product
-- ----------------------------
DROP TABLE IF EXISTS `dd_product`;
CREATE TABLE `dd_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proname` text CHARACTER SET utf8,
  `ptype` int(11) NOT NULL DEFAULT '0',
  `lev` int(11) NOT NULL DEFAULT '1',
  `img` text CHARACTER SET utf8,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text CHARACTER SET utf8,
  `money` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '电子币价',
  `diap` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '积分价',
  `fanp` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '返积分',
  `fanz` int(11) NOT NULL DEFAULT '0',
  `discription` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tj` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dd_product
-- ----------------------------
INSERT INTO `dd_product` VALUES ('1', '小米4c粉色高配版', '0', '1', '/Public/uploads/2016-03-10/56e101441f163.jpg', '2016-03-10 13:31:58', '<div id=\"activity_header\">\r\n	<div style=\"text-align:center;\">\r\n		<a href=\"http://sale.jd.com/act/g5iCqmlGj6M.html\" target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2143/226/1680968084/72068/7236ebd5/56d647f8Ndfb3c1f7.jpg\" alt=\"\" /></a>\r\n	</div>\r\n	<div align=\"center\">\r\n		<img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t1942/51/2045145432/131509/53f93676/56a081b2N8806d4e5.jpg\" alt=\"\" border=\"0\" /> \r\n	</div>\r\n	<div style=\"text-align:center;\">\r\n		<a href=\"http://mi.jd.com\" target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2149/254/1590005100/28545/93567a4b/56d00057N5f9b27e7.jpg\" alt=\"\" /></a>&nbsp;\r\n	</div>\r\n	<div style=\"text-align:center;\">\r\n		<a href=\"http://sale.jd.com/act/CPhstJGeIpx26HO.html\" target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2272/169/2022910749/62988/baf6a754/56a5cb88Ne825b165.jpg\" alt=\"\" /></a>&nbsp;\r\n	</div>\r\n</div>\r\n<div class=\"content_tpl\">\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t2107/277/1808014496/1059583/2f3bedd1/56dfcfbcN0dc48479.jpg\" />\r\n		</div>\r\n	</div>\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t2500/119/876507372/1493222/dcfe1cad/5630a8ffN18131309.jpg\" />\r\n		</div>\r\n	</div>\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t2560/128/161360598/637183/ad5f9b05/56399dc5N4f1fc9b1.jpg\" />\r\n		</div>\r\n	</div>\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t1990/163/879548232/1467337/a68702d/5630a91eNfd370a23.jpg\" />\r\n		</div>\r\n	</div>\r\n</div>', '1299.00', '0.00', '0.00', '0', '小米 4c 高配版 全网通 粉色 移动联通电信4G手机 双卡双待', '0');
INSERT INTO `dd_product` VALUES ('2', '雷神游戏本', '0', '1', '/Public/uploads/2016-03-10/56e107b8056b2.jpg', '2016-03-10 13:35:52', '<div id=\"activity_header\">\r\n	<div align=\"center\">\r\n		<a target=\"_blank\" href=\"http://sale.jd.com/act/sX2zpxJQig.html\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2053/269/1647273970/83202/cb340b9f/56d4f0f4N63c3ad20.jpg\" alt=\"\" /></a>\r\n	</div>\r\n</div>\r\n<div id=\"J-detail-content\">\r\n	<div style=\"text-align:center;\">\r\n		<img class=\"\" src=\"http://img12.360buyimg.com/cms/jfs/t2227/183/1761556085/163512/e2e6820f/567bcf06Nd8459930.jpg\" alt=\"\" height=\"326\" border=\"0\" width=\"750\" /> \r\n	</div>\r\n	<div style=\"text-align:center;\">\r\n		<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2320/68/2233673034/101392/5c98a8ee/56ced3a1N152b01c8.jpg\" alt=\"\" height=\"283\" border=\"0\" width=\"750\" /> \r\n		<table id=\"__01\" class=\"ke-zeroborder\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\">\r\n		</table>\r\n		<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" width=\"750\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2128/75/2033228932/243250/af54e991/56a9cd3fNd377bd86.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t1984/318/2062755922/196996/2c7d9971/56a9cd46Nf6495cfa.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2062/148/1449966320/279661/8a73cad4/56a9cd52N368199e1.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img14.360buyimg.com/cms/jfs/t2563/350/1352271903/126740/9292ce89/56a9cd5aN2e875bc7.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t1972/365/2204393755/267385/f5e902b8/56a9cd63N87cf5159.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2278/179/2113953471/211119/45e27ad0/56a9cd69Nbee5cdc1.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2098/142/1472195154/231973/b1865871/56a9cd70Ne2d0f2ab.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2002/171/1507360410/288507/69c12411/56a9cfa3N71e1bd1b.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img10.360buyimg.com/cms/jfs/t2545/311/1355366489/173342/fbf29665/56a9cfabNfb8febda.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img10.360buyimg.com/cms/jfs/t2266/132/2258286125/286832/47eb12d7/56a9cfb2Nc06e6cde.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img12.360buyimg.com/cms/jfs/t1852/200/2166475257/275239/f394701f/56a9cfb9Nb72e692e.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n<br />\r\n	</div>\r\n<br />\r\n</div>\r\n<div align=\"center\">\r\n	<a target=\"_blank\" href=\"http://sale.jd.com/act/v6zC53exWcH8MqAS.html\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2020/313/2185410703/269758/989f7795/56a72edeNf2e8aa65.jpg\" alt=\"\" /></a>\r\n</div>\r\n<img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2236/83/2050816222/251950/697182f1/56ab0441N144064ce.jpg\" alt=\"\" /><br />\r\n<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t1291/283/981732241/513519/1d7523c5/55b06055Nac7b9141.jpg\" alt=\"\" height=\"878\" border=\"0\" width=\"750\" />', '6299.00', '0.00', '0.00', '0', '雷神(ThundeRobot)911-S2c 15.6英寸游戏笔记本电脑(i7-4720HQ 8G 128G+1T GTX960M 2G Windows 背光 FHD)', '0');
INSERT INTO `dd_product` VALUES ('3', '小米4c粉色高配版', '0', '1', '/Public/uploads/2016-03-10/56e101441f163.jpg', '2016-03-10 13:36:46', '<div id=\"activity_header\">\r\n	<div style=\"text-align:center;\">\r\n		<a href=\"http://sale.jd.com/act/g5iCqmlGj6M.html\" target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2143/226/1680968084/72068/7236ebd5/56d647f8Ndfb3c1f7.jpg\" alt=\"\" /></a> \r\n	</div>\r\n	<div align=\"center\">\r\n		<img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t1942/51/2045145432/131509/53f93676/56a081b2N8806d4e5.jpg\" alt=\"\" border=\"0\" /> \r\n	</div>\r\n	<div style=\"text-align:center;\">\r\n		<a href=\"http://mi.jd.com\" target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2149/254/1590005100/28545/93567a4b/56d00057N5f9b27e7.jpg\" alt=\"\" /></a> \r\n	</div>\r\n	<div style=\"text-align:center;\">\r\n		<a href=\"http://sale.jd.com/act/CPhstJGeIpx26HO.html\" target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2272/169/2022910749/62988/baf6a754/56a5cb88Ne825b165.jpg\" alt=\"\" /></a> \r\n	</div>\r\n</div>\r\n<div class=\"content_tpl\">\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t2107/277/1808014496/1059583/2f3bedd1/56dfcfbcN0dc48479.jpg\" /> \r\n		</div>\r\n	</div>\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t2500/119/876507372/1493222/dcfe1cad/5630a8ffN18131309.jpg\" /> \r\n		</div>\r\n	</div>\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t2560/128/161360598/637183/ad5f9b05/56399dc5N4f1fc9b1.jpg\" /> \r\n		</div>\r\n	</div>\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t1990/163/879548232/1467337/a68702d/5630a91eNfd370a23.jpg\" /> \r\n		</div>\r\n	</div>\r\n</div>', '1299.00', '0.00', '0.00', '0', '小米 4c 高配版 全网通 粉色 移动联通电信4G手机 双卡双待', '0');
INSERT INTO `dd_product` VALUES ('4', '小米4c粉色高配版', '0', '1', '/Public/uploads/2016-03-10/56e101441f163.jpg', '2016-03-10 13:36:51', '<div id=\"activity_header\">\r\n	<div style=\"text-align:center;\">\r\n		<a href=\"http://sale.jd.com/act/g5iCqmlGj6M.html\" target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2143/226/1680968084/72068/7236ebd5/56d647f8Ndfb3c1f7.jpg\" alt=\"\" /></a> \r\n	</div>\r\n	<div align=\"center\">\r\n		<img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t1942/51/2045145432/131509/53f93676/56a081b2N8806d4e5.jpg\" alt=\"\" border=\"0\" /> \r\n	</div>\r\n	<div style=\"text-align:center;\">\r\n		<a href=\"http://mi.jd.com\" target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2149/254/1590005100/28545/93567a4b/56d00057N5f9b27e7.jpg\" alt=\"\" /></a> \r\n	</div>\r\n	<div style=\"text-align:center;\">\r\n		<a href=\"http://sale.jd.com/act/CPhstJGeIpx26HO.html\" target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2272/169/2022910749/62988/baf6a754/56a5cb88Ne825b165.jpg\" alt=\"\" /></a> \r\n	</div>\r\n</div>\r\n<div class=\"content_tpl\">\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t2107/277/1808014496/1059583/2f3bedd1/56dfcfbcN0dc48479.jpg\" /> \r\n		</div>\r\n	</div>\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t2500/119/876507372/1493222/dcfe1cad/5630a8ffN18131309.jpg\" /> \r\n		</div>\r\n	</div>\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t2560/128/161360598/637183/ad5f9b05/56399dc5N4f1fc9b1.jpg\" /> \r\n		</div>\r\n	</div>\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t1990/163/879548232/1467337/a68702d/5630a91eNfd370a23.jpg\" /> \r\n		</div>\r\n	</div>\r\n</div>', '1299.00', '0.00', '0.00', '0', '小米 4c 高配版 全网通 粉色 移动联通电信4G手机 双卡双待', '0');
INSERT INTO `dd_product` VALUES ('5', '小米4c粉色高配版', '1', '1', '/Public/uploads/2016-03-10/56e101441f163.jpg', '2016-05-15 18:04:09', '<div id=\"activity_header\">\r\n	<div style=\"text-align:center;\">\r\n		<a href=\"http://sale.jd.com/act/g5iCqmlGj6M.html\" target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2143/226/1680968084/72068/7236ebd5/56d647f8Ndfb3c1f7.jpg\" alt=\"\" /></a> \r\n	</div>\r\n	<div align=\"center\">\r\n		<img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t1942/51/2045145432/131509/53f93676/56a081b2N8806d4e5.jpg\" alt=\"\" border=\"0\" /> \r\n	</div>\r\n	<div style=\"text-align:center;\">\r\n		<a href=\"http://mi.jd.com\" target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2149/254/1590005100/28545/93567a4b/56d00057N5f9b27e7.jpg\" alt=\"\" /></a> \r\n	</div>\r\n	<div style=\"text-align:center;\">\r\n		<a href=\"http://sale.jd.com/act/CPhstJGeIpx26HO.html\" target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2272/169/2022910749/62988/baf6a754/56a5cb88Ne825b165.jpg\" alt=\"\" /></a> \r\n	</div>\r\n</div>\r\n<div class=\"content_tpl\">\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t2107/277/1808014496/1059583/2f3bedd1/56dfcfbcN0dc48479.jpg\" /> \r\n		</div>\r\n	</div>\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t2500/119/876507372/1493222/dcfe1cad/5630a8ffN18131309.jpg\" /> \r\n		</div>\r\n	</div>\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t2560/128/161360598/637183/ad5f9b05/56399dc5N4f1fc9b1.jpg\" /> \r\n		</div>\r\n	</div>\r\n	<div class=\"formwork\">\r\n		<div class=\"formwork_img\">\r\n			<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t1990/163/879548232/1467337/a68702d/5630a91eNfd370a23.jpg\" /> \r\n		</div>\r\n	</div>\r\n</div>', '1299.00', '0.00', '0.00', '0', '小米 4c 高配版 全网通 粉色 移动联通电信4G手机 双卡双待', '0');
INSERT INTO `dd_product` VALUES ('6', '全球购 雷神笔记本', '1', '1', '/Public/uploads/2016-03-10/56e107b8056b2.jpg', '2016-05-15 19:04:10', '<div id=\"activity_header\">\r\n	<div align=\"center\">\r\n		<a target=\"_blank\" href=\"http://sale.jd.com/act/sX2zpxJQig.html\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2053/269/1647273970/83202/cb340b9f/56d4f0f4N63c3ad20.jpg\" alt=\"\" /></a> \r\n	</div>\r\n</div>\r\n<div id=\"J-detail-content\">\r\n	<div style=\"text-align:center;\">\r\n		<img class=\"\" src=\"http://img12.360buyimg.com/cms/jfs/t2227/183/1761556085/163512/e2e6820f/567bcf06Nd8459930.jpg\" alt=\"\" border=\"0\" height=\"326\" width=\"750\" /> \r\n	</div>\r\n	<div style=\"text-align:center;\">\r\n		<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2320/68/2233673034/101392/5c98a8ee/56ced3a1N152b01c8.jpg\" alt=\"\" border=\"0\" height=\"283\" width=\"750\" /> \r\n		<table id=\"__01\" class=\"ke-zeroborder\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\">\r\n		</table>\r\n		<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" width=\"750\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2128/75/2033228932/243250/af54e991/56a9cd3fNd377bd86.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t1984/318/2062755922/196996/2c7d9971/56a9cd46Nf6495cfa.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2062/148/1449966320/279661/8a73cad4/56a9cd52N368199e1.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img14.360buyimg.com/cms/jfs/t2563/350/1352271903/126740/9292ce89/56a9cd5aN2e875bc7.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t1972/365/2204393755/267385/f5e902b8/56a9cd63N87cf5159.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2278/179/2113953471/211119/45e27ad0/56a9cd69Nbee5cdc1.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2098/142/1472195154/231973/b1865871/56a9cd70Ne2d0f2ab.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2002/171/1507360410/288507/69c12411/56a9cfa3N71e1bd1b.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img10.360buyimg.com/cms/jfs/t2545/311/1355366489/173342/fbf29665/56a9cfabNfb8febda.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img10.360buyimg.com/cms/jfs/t2266/132/2258286125/286832/47eb12d7/56a9cfb2Nc06e6cde.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img12.360buyimg.com/cms/jfs/t1852/200/2166475257/275239/f394701f/56a9cfb9Nb72e692e.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n<br />\r\n	</div>\r\n<br />\r\n</div>\r\n<div align=\"center\">\r\n	<a target=\"_blank\" href=\"http://sale.jd.com/act/v6zC53exWcH8MqAS.html\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2020/313/2185410703/269758/989f7795/56a72edeNf2e8aa65.jpg\" alt=\"\" /></a> \r\n</div>\r\n<img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2236/83/2050816222/251950/697182f1/56ab0441N144064ce.jpg\" alt=\"\" /><br />\r\n<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t1291/283/981732241/513519/1d7523c5/55b06055Nac7b9141.jpg\" alt=\"\" border=\"0\" height=\"878\" width=\"750\" />', '6299.00', '0.00', '0.00', '0', '雷神(ThundeRobot)911-S2c 15.6英寸游戏笔记本电脑(i7-4720HQ 8G 128G+1T GTX960M 2G Windows 背光 FHD)', '0');
INSERT INTO `dd_product` VALUES ('7', '全球购 雷神笔记本', '1', '1', '/Public/uploads/2016-03-10/56e107b8056b2.jpg', '2016-05-15 19:04:03', '<div id=\"activity_header\">\r\n	<div align=\"center\">\r\n		<a target=\"_blank\" href=\"http://sale.jd.com/act/sX2zpxJQig.html\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2053/269/1647273970/83202/cb340b9f/56d4f0f4N63c3ad20.jpg\" alt=\"\" /></a> \r\n	</div>\r\n</div>\r\n<div id=\"J-detail-content\">\r\n	<div style=\"text-align:center;\">\r\n		<img class=\"\" src=\"http://img12.360buyimg.com/cms/jfs/t2227/183/1761556085/163512/e2e6820f/567bcf06Nd8459930.jpg\" alt=\"\" border=\"0\" height=\"326\" width=\"750\" /> \r\n	</div>\r\n	<div style=\"text-align:center;\">\r\n		<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2320/68/2233673034/101392/5c98a8ee/56ced3a1N152b01c8.jpg\" alt=\"\" border=\"0\" height=\"283\" width=\"750\" /> \r\n		<table id=\"__01\" class=\"ke-zeroborder\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\">\r\n		</table>\r\n		<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" width=\"750\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2128/75/2033228932/243250/af54e991/56a9cd3fNd377bd86.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t1984/318/2062755922/196996/2c7d9971/56a9cd46Nf6495cfa.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2062/148/1449966320/279661/8a73cad4/56a9cd52N368199e1.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img14.360buyimg.com/cms/jfs/t2563/350/1352271903/126740/9292ce89/56a9cd5aN2e875bc7.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t1972/365/2204393755/267385/f5e902b8/56a9cd63N87cf5159.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2278/179/2113953471/211119/45e27ad0/56a9cd69Nbee5cdc1.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2098/142/1472195154/231973/b1865871/56a9cd70Ne2d0f2ab.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2002/171/1507360410/288507/69c12411/56a9cfa3N71e1bd1b.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img10.360buyimg.com/cms/jfs/t2545/311/1355366489/173342/fbf29665/56a9cfabNfb8febda.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img10.360buyimg.com/cms/jfs/t2266/132/2258286125/286832/47eb12d7/56a9cfb2Nc06e6cde.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img12.360buyimg.com/cms/jfs/t1852/200/2166475257/275239/f394701f/56a9cfb9Nb72e692e.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n<br />\r\n	</div>\r\n<br />\r\n</div>\r\n<div align=\"center\">\r\n	<a target=\"_blank\" href=\"http://sale.jd.com/act/v6zC53exWcH8MqAS.html\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2020/313/2185410703/269758/989f7795/56a72edeNf2e8aa65.jpg\" alt=\"\" /></a> \r\n</div>\r\n<img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2236/83/2050816222/251950/697182f1/56ab0441N144064ce.jpg\" alt=\"\" /><br />\r\n<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t1291/283/981732241/513519/1d7523c5/55b06055Nac7b9141.jpg\" alt=\"\" border=\"0\" height=\"878\" width=\"750\" />', '6299.00', '0.00', '0.00', '0', '雷神(ThundeRobot)911-S2c 15.6英寸游戏笔记本电脑(i7-4720HQ 8G 128G+1T GTX960M 2G Windows 背光 FHD)', '0');
INSERT INTO `dd_product` VALUES ('8', '全球购 雷神笔记本', '3', '1', '/Public/uploads/2016-03-10/56e107b8056b2.jpg', '2016-05-15 19:03:53', '<div id=\"activity_header\">\r\n	<div align=\"center\">\r\n		<a target=\"_blank\" href=\"http://sale.jd.com/act/sX2zpxJQig.html\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2053/269/1647273970/83202/cb340b9f/56d4f0f4N63c3ad20.jpg\" alt=\"\" /></a> \r\n	</div>\r\n</div>\r\n<div id=\"J-detail-content\">\r\n	<div style=\"text-align:center;\">\r\n		<img class=\"\" src=\"http://img12.360buyimg.com/cms/jfs/t2227/183/1761556085/163512/e2e6820f/567bcf06Nd8459930.jpg\" alt=\"\" border=\"0\" height=\"326\" width=\"750\" /> \r\n	</div>\r\n	<div style=\"text-align:center;\">\r\n		<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2320/68/2233673034/101392/5c98a8ee/56ced3a1N152b01c8.jpg\" alt=\"\" border=\"0\" height=\"283\" width=\"750\" /> \r\n		<table id=\"__01\" class=\"ke-zeroborder\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\">\r\n		</table>\r\n		<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" width=\"750\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2128/75/2033228932/243250/af54e991/56a9cd3fNd377bd86.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t1984/318/2062755922/196996/2c7d9971/56a9cd46Nf6495cfa.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2062/148/1449966320/279661/8a73cad4/56a9cd52N368199e1.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img14.360buyimg.com/cms/jfs/t2563/350/1352271903/126740/9292ce89/56a9cd5aN2e875bc7.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t1972/365/2204393755/267385/f5e902b8/56a9cd63N87cf5159.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2278/179/2113953471/211119/45e27ad0/56a9cd69Nbee5cdc1.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2098/142/1472195154/231973/b1865871/56a9cd70Ne2d0f2ab.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2002/171/1507360410/288507/69c12411/56a9cfa3N71e1bd1b.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img10.360buyimg.com/cms/jfs/t2545/311/1355366489/173342/fbf29665/56a9cfabNfb8febda.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img10.360buyimg.com/cms/jfs/t2266/132/2258286125/286832/47eb12d7/56a9cfb2Nc06e6cde.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img12.360buyimg.com/cms/jfs/t1852/200/2166475257/275239/f394701f/56a9cfb9Nb72e692e.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n<br />\r\n	</div>\r\n<br />\r\n</div>\r\n<div align=\"center\">\r\n	<a target=\"_blank\" href=\"http://sale.jd.com/act/v6zC53exWcH8MqAS.html\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2020/313/2185410703/269758/989f7795/56a72edeNf2e8aa65.jpg\" alt=\"\" /></a> \r\n</div>\r\n<img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2236/83/2050816222/251950/697182f1/56ab0441N144064ce.jpg\" alt=\"\" /><br />\r\n<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t1291/283/981732241/513519/1d7523c5/55b06055Nac7b9141.jpg\" alt=\"\" border=\"0\" height=\"878\" width=\"750\" />', '6299.00', '0.00', '0.00', '0', '雷神(ThundeRobot)911-S2c 15.6英寸游戏笔记本电脑(i7-4720HQ 8G 128G+1T GTX960M 2G Windows 背光 FHD)', '0');
INSERT INTO `dd_product` VALUES ('9', '雷神游戏本', '1', '1', '/Public/uploads/2016-03-10/56e10ba2ce5dd.jpg', '2016-05-15 18:03:30', '<div id=\"activity_header\">\r\n	<div align=\"center\">\r\n		<a target=\"_blank\" href=\"http://sale.jd.com/act/sX2zpxJQig.html\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2053/269/1647273970/83202/cb340b9f/56d4f0f4N63c3ad20.jpg\" alt=\"\" /></a> \r\n	</div>\r\n</div>\r\n<div id=\"J-detail-content\">\r\n	<div style=\"text-align:center;\">\r\n		<img class=\"\" src=\"http://img12.360buyimg.com/cms/jfs/t2227/183/1761556085/163512/e2e6820f/567bcf06Nd8459930.jpg\" alt=\"\" border=\"0\" height=\"326\" width=\"750\" /> \r\n	</div>\r\n	<div style=\"text-align:center;\">\r\n		<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2320/68/2233673034/101392/5c98a8ee/56ced3a1N152b01c8.jpg\" alt=\"\" border=\"0\" height=\"283\" width=\"750\" /> \r\n		<table id=\"__01\" class=\"ke-zeroborder\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\">\r\n		</table>\r\n		<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" width=\"750\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2128/75/2033228932/243250/af54e991/56a9cd3fNd377bd86.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t1984/318/2062755922/196996/2c7d9971/56a9cd46Nf6495cfa.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2062/148/1449966320/279661/8a73cad4/56a9cd52N368199e1.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img14.360buyimg.com/cms/jfs/t2563/350/1352271903/126740/9292ce89/56a9cd5aN2e875bc7.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t1972/365/2204393755/267385/f5e902b8/56a9cd63N87cf5159.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2278/179/2113953471/211119/45e27ad0/56a9cd69Nbee5cdc1.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img13.360buyimg.com/cms/jfs/t2098/142/1472195154/231973/b1865871/56a9cd70Ne2d0f2ab.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2002/171/1507360410/288507/69c12411/56a9cfa3N71e1bd1b.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img10.360buyimg.com/cms/jfs/t2545/311/1355366489/173342/fbf29665/56a9cfabNfb8febda.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img10.360buyimg.com/cms/jfs/t2266/132/2258286125/286832/47eb12d7/56a9cfb2Nc06e6cde.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<img class=\"\" src=\"http://img12.360buyimg.com/cms/jfs/t1852/200/2166475257/275239/f394701f/56a9cfb9Nb72e692e.jpg\" alt=\"\" /> \r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n<br />\r\n	</div>\r\n<br />\r\n</div>\r\n<div align=\"center\">\r\n	<a target=\"_blank\" href=\"http://sale.jd.com/act/v6zC53exWcH8MqAS.html\"><img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2020/313/2185410703/269758/989f7795/56a72edeNf2e8aa65.jpg\" alt=\"\" /></a> \r\n</div>\r\n<img class=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t2236/83/2050816222/251950/697182f1/56ab0441N144064ce.jpg\" alt=\"\" /><br />\r\n<img class=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t1291/283/981732241/513519/1d7523c5/55b06055Nac7b9141.jpg\" alt=\"\" border=\"0\" height=\"878\" width=\"750\" />', '6299.00', '0.00', '0.00', '0', '雷神(ThundeRobot)911-S2c 15.6英寸游戏笔记本电脑(i7-4720HQ 8G 128G+1T GTX960M 2G Windows 背光 FHD)', '0');

-- ----------------------------
-- Table structure for dd_ptype
-- ----------------------------
DROP TABLE IF EXISTS `dd_ptype`;
CREATE TABLE `dd_ptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `fid` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_ptype
-- ----------------------------
INSERT INTO `dd_ptype` VALUES ('1', '测试1', '0', '999');
INSERT INTO `dd_ptype` VALUES ('3', '测试3', '0', '2');
INSERT INTO `dd_ptype` VALUES ('4', 'afsd', '0', '999');
INSERT INTO `dd_ptype` VALUES ('5', 'asdfasd', '0', '999');

-- ----------------------------
-- Table structure for dd_remittance
-- ----------------------------
DROP TABLE IF EXISTS `dd_remittance`;
CREATE TABLE `dd_remittance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `sn` varchar(50) DEFAULT NULL,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `inmoney` float(10,2) NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '0',
  `info` varchar(255) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `dodate` varchar(50) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_remittance
-- ----------------------------

-- ----------------------------
-- Table structure for dd_role
-- ----------------------------
DROP TABLE IF EXISTS `dd_role`;
CREATE TABLE `dd_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_role
-- ----------------------------
INSERT INTO `dd_role` VALUES ('4', 'test', '0', '1', 'test');

-- ----------------------------
-- Table structure for dd_role_user
-- ----------------------------
DROP TABLE IF EXISTS `dd_role_user`;
CREATE TABLE `dd_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_role_user
-- ----------------------------
INSERT INTO `dd_role_user` VALUES ('4', '4');

-- ----------------------------
-- Table structure for dd_slide
-- ----------------------------
DROP TABLE IF EXISTS `dd_slide`;
CREATE TABLE `dd_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_slide
-- ----------------------------
INSERT INTO `dd_slide` VALUES ('9', '2', '/Public/uploads/2015-08-31/55e37e9412061.jpg', '', '2', '0');
INSERT INTO `dd_slide` VALUES ('30', 'asd', '/Public/uploads/2015-08-31/55e37e9eaaab1.jpg', '', '0', '0');
INSERT INTO `dd_slide` VALUES ('31', '3', '/Public/uploads/2015-09-05/55eafe8bdd097.jpg', '', '0', '0');

-- ----------------------------
-- Table structure for dd_web
-- ----------------------------
DROP TABLE IF EXISTS `dd_web`;
CREATE TABLE `dd_web` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webtitle` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `copyright` varchar(255) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `webtext` text,
  `kuaitext` varchar(255) DEFAULT NULL,
  `tuitext` varchar(255) DEFAULT NULL,
  `zongtext` varchar(255) DEFAULT NULL,
  `cashtext` varchar(255) DEFAULT NULL,
  `huantext` varchar(255) DEFAULT NULL,
  `zhtext` varchar(255) DEFAULT NULL,
  `banktext` varchar(255) DEFAULT NULL,
  `huitext` varchar(255) DEFAULT NULL,
  `eptext` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_web
-- ----------------------------
INSERT INTO `dd_web` VALUES ('1', '神角力能量科技', '0', '以色列神角力能量科技有限公司 2016-2020 © AllRight reserved', '/Public/uploads/2016-10-05/57f4b3c0a4129.png', '<p>\r\n	<span> 网站测试100万asdfasdfasdfasdfasdfasdfa213423142342</span>\r\n</p>\r\n<p>\r\n	<span>jkashd9f87280hun34</span>\r\n</p>', '股权大厅提示信息', '领取奖金提示信息', '111欢迎加入我们,我们为您提供最好的服务最好的投资方案和计划。通过加入我们，您一定会获得超值的服务和可观的收益。', '奖金提现提示信息', '货币转换提示信息', '货币转帐提示信息', '银行信息提示信息', 'http://www.baidu.com', 'sadfasd');
