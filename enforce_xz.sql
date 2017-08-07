/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : enforce_xy

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 936

Date: 2017-08-07 16:26:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `area_dep`
-- ----------------------------
DROP TABLE IF EXISTS `area_dep`;
CREATE TABLE `area_dep` (
  `areaid` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `proid` int(11) DEFAULT '1' COMMENT '暂不用，固定填1',
  `fatherareaid` int(11) NOT NULL COMMENT '部门父ID',
  `areaname` varchar(128) NOT NULL COMMENT '区域(部门)名称',
  `areacode` varchar(32) DEFAULT '0000000000' COMMENT '部门代码',
  `rperson` varchar(64) DEFAULT NULL,
  `rphone` varchar(32) DEFAULT NULL,
  `code` varchar(10) DEFAULT '' COMMENT '部门代码,自定义,用于公安用户自动勾选交警部门权限',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '0:交警，1:其它',
  `is_read` int(1) NOT NULL DEFAULT '1' COMMENT '部门权限；1:读写,0:只读;父级是0，子级必须是0;',
  PRIMARY KEY (`areaid`),
  UNIQUE KEY `idx_areacode` (`areacode`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of area_dep
-- ----------------------------
INSERT INTO `area_dep` VALUES ('57', '1', '55', '机动车监管中心', '3602019902', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('56', '1', '55', '法制科', '3602019901', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('55', '1', '54', '特警大队', '36020199', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('54', '1', '53', '包头市交管支队', '360201', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('53', '1', '52', '包头市公安局', '36', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('58', '1', '54', '昆区大队', '36020101', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('61', '1', '58', '昆区一中队', '3602010102', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('62', '1', '58', '昆区二中队', '3602010104', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('63', '1', '58', '昆区三中队', '3602010103', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('64', '1', '58', '昆区四中队', '3602010106', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('65', '1', '58', '昆区五中队', '3602010101', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('66', '1', '58', '昆区六中队', '3602010105', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('67', '1', '58', '昆区事故中队', '3602010190', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('68', '1', '58', '昆区警务督察办', '3602010100', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('69', '1', '54', '青山区大队', '36020102', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('70', '1', '54', '东河区大队', '36020103', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('71', '1', '54', '九原区大队', '36020104', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('93', '1', '54', '东兴大队', '36020111', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('73', '1', '54', '土右大队', '36020112', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('74', '1', '54', '石拐大队', '36020113', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('75', '1', '54', '固阳大队', '36020117', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('76', '1', '54', '达茂大队', '36020114', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('92', '1', '54', '高新大队', '36020110', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('79', '1', '54', '南绕城大队', '36020116', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('80', '1', '54', '河西大队', '36020106', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('81', '1', '54', '北郊大队', '36020109', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('82', '1', '54', '车管所', '36020108', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('83', '1', '54', '机动大队', '360201123', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('84', '1', '54', '督察大队', '36020107', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('85', '1', '74', '石拐一中队', '3602011301', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('86', '1', '74', '石拐二中队', '3602011302', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('87', '1', '74', '石拐三中队', '3602011303', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('88', '1', '74', '石拐四中队', '3602011304', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('89', '1', '74', '石拐事故中队', '3602011390', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('90', '1', '74', '石拐督察法制办', '3602011300', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('94', '1', '54', '白云大队', '36020115', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('95', '1', '71', '九原督察法制办', '3602010400', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('96', '1', '71', '九原一中队', '3602010401', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('97', '1', '71', '九原二中队', '3602010402', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('98', '1', '71', '九原三中队', '3602010403', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('99', '1', '71', '九原四中队', '3602010404', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('100', '1', '71', '九原事故中队', '3602010490', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('101', '1', '80', '河西督察法制办', '3602010600', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('102', '1', '80', '河西二中队', '3602010601', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('103', '1', '80', '河西一中队', '3602010602', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('104', '1', '80', '河西三中队', '3602010603', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('105', '1', '80', '河西四中队', '3602010604', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('106', '1', '80', '河西事故中队', '3602010690', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('107', '1', '80', '河西检查站', '3602010605', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('108', '1', '84', '督察大队一中队', '3602010701', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('109', '1', '84', '督查大队二中队', '3602010702', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('110', '1', '82', '督车管所考核办', '3602010802', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('111', '1', '82', '车管所监督科', '3602010804', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('112', '1', '82', '车管所外检科', '3602010805', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('113', '1', '82', '车管所考务科', '3602010806', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('114', '1', '81', '北郊园区中队', '3602010905', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('115', '1', '81', '北郊督察法制办', '3602010900', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('116', '1', '81', '北郊一中队', '3602010901', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('117', '1', '81', '北郊二中队', '3602010902', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('118', '1', '81', '北郊三中队', '3602010903', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('119', '1', '81', '北郊四中队', '3602010904', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('120', '1', '81', '北郊事故中队', '3602010990', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('121', '1', '92', '高新督察法制办', '3602011000', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('122', '1', '92', '高新二中队', '3602011001', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('123', '1', '92', '高新一中队', '3602011002', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('124', '1', '92', '高新三中队', '3602011003', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('125', '1', '92', '高新事故中队', '3602011090', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('126', '1', '93', '东兴督察法制办', '3602011100', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('127', '1', '93', '东兴一中队', '3602011101', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('128', '1', '93', '东兴二中队', '3602011102', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('129', '1', '93', '东兴三中队', '3602011103', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('130', '1', '93', '东兴事故中队', '3602011190', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('131', '1', '93', '大队领导', '3602011109', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('132', '1', '73', '土右督察法制办', '3602011200', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('133', '1', '73', '土右一中队', '3602011201', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('134', '1', '73', '土右二中队', '3602011202', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('135', '1', '73', '土右三中队', '3602011203', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('136', '1', '73', '土右四中队', '3602011204', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('137', '1', '73', '土右五中队', '3602011205', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('138', '1', '73', '土右事故中队', '3602011290', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('139', '1', '83', '岗勤中队', '36020112301', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('140', '1', '83', '护校中队', '36020112302', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('141', '1', '76', '达茂督察法制办', '3602011400', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('142', '1', '76', '达茂一中队', '3602011401', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('143', '1', '76', '达茂二中队', '3602011402', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('144', '1', '76', '达茂三中队', '3602011403', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('145', '1', '76', '达茂事故中队', '3602011490', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('146', '1', '94', '白云督察法制办', '3602011500', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('147', '1', '94', '白云一中队', '3602011501', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('148', '1', '94', '白云二中队', '3602011502', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('149', '1', '94', '白云三中队', '3602011503', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('150', '1', '94', '白云事故中队', '3602011590', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('151', '1', '79', '南绕城督察法制办', '3602011600', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('152', '1', '79', '南绕城一中队', '3602011601', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('153', '1', '79', '南绕城二中队', '3602011602', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('154', '1', '79', '南绕城三中队', '3602011603', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('155', '1', '79', '南绕城事故中队', '3602011690', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('156', '1', '75', '固阳五中队', '3602011705', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('157', '1', '75', '固阳警务督察办', '3602011700', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('158', '1', '75', '固阳一中队', '3602011701', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('159', '1', '75', '固阳二中队', '3602011702', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('160', '1', '75', '固阳三中队', '3602011703', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('161', '1', '75', '固阳四中队', '3602011704', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('162', '1', '75', '固阳法制办', '3602011710', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('163', '1', '75', '固阳事故中队', '3602011790', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('164', '1', '69', '青山四级巡控', '3602010207', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('165', '1', '69', '青山督察法制办', '3602010200', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('166', '1', '69', '青山一中队', '3602010201', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('167', '1', '69', '青山二中队', '3602010202', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('168', '1', '69', '青山三中队', '3602010203', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('169', '1', '69', '青山四中队', '3602010204', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('170', '1', '69', '青山五中队', '3602010205', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('171', '1', '69', '青山六中队', '3602010206', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('172', '1', '69', '青山事故中队', '3602010290', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('173', '1', '70', '东河宣传中队', '3602115', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('174', '1', '70', '东河事故中队', '3602010390', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('175', '1', '70', '东河督察法制办', '3602010300', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('176', '1', '70', '东河一中队', '3602010301', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('177', '1', '70', '东河二中队', '3602010302', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('178', '1', '70', '东河三中队', '3602010303', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('179', '1', '70', '东河四中队', '3602010304', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('180', '1', '70', '东河五中队', '3602010305', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('181', '1', '70', '东河六中队', '3602010306', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('182', '1', '70', '东河管理中队', '36031000', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('183', '1', '113', '科目一考场', '360201080601', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('184', '1', '113', '科目二考场', '360201080602', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('185', '1', '113', '科目三考场', '360201080603', '', '', null, '1', '1');
INSERT INTO `area_dep` VALUES ('52', '1', '0', '内蒙古自治区公安局', '0000000000', null, null, null, '1', '1');

-- ----------------------------
-- Table structure for `area_pro`
-- ----------------------------
DROP TABLE IF EXISTS `area_pro`;
CREATE TABLE `area_pro` (
  `proid` int(11) NOT NULL AUTO_INCREMENT,
  `proname` varchar(32) NOT NULL,
  PRIMARY KEY (`proid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area_pro
-- ----------------------------
INSERT INTO `area_pro` VALUES ('1', '部门');

-- ----------------------------
-- Table structure for `case_201706`
-- ----------------------------
DROP TABLE IF EXISTS `case_201706`;
CREATE TABLE `case_201706` (
  `case_key` varchar(64) NOT NULL COMMENT '案件标识,格式：<yyyymmddHHmiss>_<警号>_<areacode>;不能编辑,内外提供视频时都自动生成;',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '案件标题;',
  `start_time` datetime NOT NULL COMMENT '案件开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '案件结束时间',
  `scsj` datetime NOT NULL COMMENT '上传时间',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '第1出警人警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '第1出警人警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '1' COMMENT '第1出警人单位编号',
  `areaname` varchar(128) DEFAULT '' COMMENT '第1出警人单位名称',
  `alarm_no` varchar(40) DEFAULT '' COMMENT '警情编号',
  `alarm_name` varchar(128) DEFAULT '' COMMENT '案事件名称',
  `alarm_addr` varchar(128) DEFAULT '',
  `alarm_type` int(1) NOT NULL DEFAULT '0' COMMENT '警情类型;0:未编辑(3个月);1:一般警情(6个月);2:重大警情(永久);3:阻碍民警执法妨碍公务(永久);4:行政强制执行(永久);5:当场盘问检查(6个月);6:无效数据(7天);7:其他(6个月)',
  `case_no` varchar(40) DEFAULT '' COMMENT '案件编号',
  `case_name` varchar(128) DEFAULT '' COMMENT '案件名称(描述)',
  `case_type` int(1) NOT NULL DEFAULT '0' COMMENT '案件类型;0:未知,1:刑事案件(永久),2:行政案件(永久)',
  `case_dept` varchar(64) DEFAULT NULL COMMENT '办案单位',
  `case_empl` varchar(16) DEFAULT NULL COMMENT '办案警员',
  `case_qualify` int(1) NOT NULL DEFAULT '0' COMMENT '执法资格;0:无;1:基本级;2:中级;3:高级;',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  `apply_jybh` varchar(32) DEFAULT '' COMMENT '案件申请警员编号',
  `apply_jyxm` varchar(60) DEFAULT '' COMMENT '案件申请警员名',
  `apply_areacode` varchar(32) DEFAULT NULL COMMENT '案件申请人部门ID',
  `apply_areaname` varchar(128) DEFAULT '' COMMENT '案件申请人部门名',
  `hand_status` int(1) NOT NULL DEFAULT '0' COMMENT '申请状态，0:初始态;1:待审核;2:移交完成',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `edit_name` varchar(128) DEFAULT NULL COMMENT '编辑人',
  PRIMARY KEY (`case_key`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_areacode` (`areacode`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_201706
-- ----------------------------
INSERT INTO `case_201706` VALUES ('20170623093621_JX0227_3602010201', '20170623093621_王磊', '2017-06-23 09:36:21', '2017-06-23 09:36:54', '2017-08-07 14:03:21', '王磊', 'JX0227', '3602010201', '青山一中队', '', '', '', '0', '', '', '0', null, null, '0', '', '', '', null, '', '0', '2017-08-07 14:16:13', null);

-- ----------------------------
-- Table structure for `case_201707`
-- ----------------------------
DROP TABLE IF EXISTS `case_201707`;
CREATE TABLE `case_201707` (
  `case_key` varchar(64) NOT NULL COMMENT '案件标识,格式：<yyyymmddHHmiss>_<警号>_<areacode>;不能编辑,内外提供视频时都自动生成;',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '案件标题;',
  `start_time` datetime NOT NULL COMMENT '案件开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '案件结束时间',
  `scsj` datetime NOT NULL COMMENT '上传时间',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '第1出警人警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '第1出警人警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '1' COMMENT '第1出警人单位编号',
  `areaname` varchar(128) DEFAULT '' COMMENT '第1出警人单位名称',
  `alarm_no` varchar(40) DEFAULT '' COMMENT '警情编号',
  `alarm_name` varchar(128) DEFAULT '' COMMENT '案事件名称',
  `alarm_addr` varchar(128) DEFAULT '',
  `alarm_type` int(1) NOT NULL DEFAULT '0' COMMENT '警情类型;0:未编辑(3个月);1:一般警情(6个月);2:重大警情(永久);3:阻碍民警执法妨碍公务(永久);4:行政强制执行(永久);5:当场盘问检查(6个月);6:无效数据(7天);7:其他(6个月)',
  `case_no` varchar(40) DEFAULT '' COMMENT '案件编号',
  `case_name` varchar(128) DEFAULT '' COMMENT '案件名称(描述)',
  `case_type` int(1) NOT NULL DEFAULT '0' COMMENT '案件类型;0:未知,1:刑事案件(永久),2:行政案件(永久)',
  `case_dept` varchar(64) DEFAULT NULL COMMENT '办案单位',
  `case_empl` varchar(16) DEFAULT NULL COMMENT '办案警员',
  `case_qualify` int(1) NOT NULL DEFAULT '0' COMMENT '执法资格;0:无;1:基本级;2:中级;3:高级;',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  `apply_jybh` varchar(32) DEFAULT '' COMMENT '案件申请警员编号',
  `apply_jyxm` varchar(60) DEFAULT '' COMMENT '案件申请警员名',
  `apply_areacode` varchar(32) DEFAULT NULL COMMENT '案件申请人部门ID',
  `apply_areaname` varchar(128) DEFAULT '' COMMENT '案件申请人部门名',
  `hand_status` int(1) NOT NULL DEFAULT '0' COMMENT '申请状态，0:初始态;1:待审核;2:移交完成',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `edit_name` varchar(128) DEFAULT NULL COMMENT '编辑人',
  PRIMARY KEY (`case_key`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_areacode` (`areacode`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_201707
-- ----------------------------

-- ----------------------------
-- Table structure for `case_201708`
-- ----------------------------
DROP TABLE IF EXISTS `case_201708`;
CREATE TABLE `case_201708` (
  `case_key` varchar(64) NOT NULL COMMENT '案件标识,格式：<yyyymmddHHmiss>_<警号>_<areacode>;不能编辑,内外提供视频时都自动生成;',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '案件标题;',
  `start_time` datetime NOT NULL COMMENT '案件开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '案件结束时间',
  `scsj` datetime NOT NULL COMMENT '上传时间',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '第1出警人警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '第1出警人警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '1' COMMENT '第1出警人单位编号',
  `areaname` varchar(128) DEFAULT '' COMMENT '第1出警人单位名称',
  `alarm_no` varchar(40) DEFAULT '' COMMENT '警情编号',
  `alarm_name` varchar(128) DEFAULT '' COMMENT '案事件名称',
  `alarm_addr` varchar(128) DEFAULT '',
  `alarm_type` int(1) NOT NULL DEFAULT '0' COMMENT '警情类型;0:未编辑(3个月);1:一般警情(6个月);2:重大警情(永久);3:阻碍民警执法妨碍公务(永久);4:行政强制执行(永久);5:当场盘问检查(6个月);6:无效数据(7天);7:其他(6个月)',
  `case_no` varchar(40) DEFAULT '' COMMENT '案件编号',
  `case_name` varchar(128) DEFAULT '' COMMENT '案件名称(描述)',
  `case_type` int(1) NOT NULL DEFAULT '0' COMMENT '案件类型;0:未知,1:刑事案件(永久),2:行政案件(永久)',
  `case_dept` varchar(64) DEFAULT NULL COMMENT '办案单位',
  `case_empl` varchar(16) DEFAULT NULL COMMENT '办案警员',
  `case_qualify` int(1) NOT NULL DEFAULT '0' COMMENT '执法资格;0:无;1:基本级;2:中级;3:高级;',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  `apply_jybh` varchar(32) DEFAULT '' COMMENT '案件申请警员编号',
  `apply_jyxm` varchar(60) DEFAULT '' COMMENT '案件申请警员名',
  `apply_areacode` varchar(32) DEFAULT NULL COMMENT '案件申请人部门ID',
  `apply_areaname` varchar(128) DEFAULT '' COMMENT '案件申请人部门名',
  `hand_status` int(1) NOT NULL DEFAULT '0' COMMENT '申请状态，0:初始态;1:待审核;2:移交完成',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `edit_name` varchar(128) DEFAULT NULL COMMENT '编辑人',
  PRIMARY KEY (`case_key`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_areacode` (`areacode`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_201708
-- ----------------------------

-- ----------------------------
-- Table structure for `case_201709`
-- ----------------------------
DROP TABLE IF EXISTS `case_201709`;
CREATE TABLE `case_201709` (
  `case_key` varchar(64) NOT NULL COMMENT '案件标识,格式：<yyyymmddHHmiss>_<警号>_<areacode>;不能编辑,内外提供视频时都自动生成;',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '案件标题;',
  `start_time` datetime NOT NULL COMMENT '案件开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '案件结束时间',
  `scsj` datetime NOT NULL COMMENT '上传时间',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '第1出警人警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '第1出警人警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '1' COMMENT '第1出警人单位编号',
  `areaname` varchar(128) DEFAULT '' COMMENT '第1出警人单位名称',
  `alarm_no` varchar(40) DEFAULT '' COMMENT '警情编号',
  `alarm_name` varchar(128) DEFAULT '' COMMENT '案事件名称',
  `alarm_addr` varchar(128) DEFAULT '',
  `alarm_type` int(1) NOT NULL DEFAULT '0' COMMENT '警情类型;0:未编辑(3个月);1:一般警情(6个月);2:重大警情(永久);3:阻碍民警执法妨碍公务(永久);4:行政强制执行(永久);5:当场盘问检查(6个月);6:无效数据(7天);7:其他(6个月)',
  `case_no` varchar(40) DEFAULT '' COMMENT '案件编号',
  `case_name` varchar(128) DEFAULT '' COMMENT '案件名称(描述)',
  `case_type` int(1) NOT NULL DEFAULT '0' COMMENT '案件类型;0:未知,1:刑事案件(永久),2:行政案件(永久)',
  `case_dept` varchar(64) DEFAULT NULL COMMENT '办案单位',
  `case_empl` varchar(16) DEFAULT NULL COMMENT '办案警员',
  `case_qualify` int(1) NOT NULL DEFAULT '0' COMMENT '执法资格;0:无;1:基本级;2:中级;3:高级;',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  `apply_jybh` varchar(32) DEFAULT '' COMMENT '案件申请警员编号',
  `apply_jyxm` varchar(60) DEFAULT '' COMMENT '案件申请警员名',
  `apply_areacode` varchar(32) DEFAULT NULL COMMENT '案件申请人部门ID',
  `apply_areaname` varchar(128) DEFAULT '' COMMENT '案件申请人部门名',
  `hand_status` int(1) NOT NULL DEFAULT '0' COMMENT '申请状态，0:初始态;1:待审核;2:移交完成',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `edit_name` varchar(128) DEFAULT NULL COMMENT '编辑人',
  PRIMARY KEY (`case_key`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_areacode` (`areacode`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_201709
-- ----------------------------

-- ----------------------------
-- Table structure for `case_video_201706`
-- ----------------------------
DROP TABLE IF EXISTS `case_video_201706`;
CREATE TABLE `case_video_201706` (
  `wjbh` varchar(100) NOT NULL DEFAULT '0' COMMENT '文件编号 <产口序号>_<警号>_<年月日时分秒>.<类型>',
  `case_key` varchar(64) NOT NULL COMMENT '案件标识，同case_201708.case_key',
  `start_time` datetime NOT NULL COMMENT '拍摄时间',
  `end_time` datetime DEFAULT NULL COMMENT '视频结束时间',
  `wjcd` int(11) DEFAULT '0' COMMENT '文件长度',
  `wjlx` int(2) DEFAULT NULL COMMENT '0:未知,1:视频,2:音频,3:图片',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '1' COMMENT '单位,同area_dep.areacode',
  `areaname` varchar(128) DEFAULT '' COMMENT '单位名称',
  `cpxh` varchar(7) NOT NULL DEFAULT '0000000' COMMENT '产品序号(执法仪编号),文件由人工提供时统一填99999',
  `ccfwq_ip` varchar(64) DEFAULT NULL COMMENT '存储服务器',
  `ccwz` varchar(200) DEFAULT NULL COMMENT '存储位置',
  `bfwz` varchar(200) NOT NULL DEFAULT 'http://' COMMENT '播放位置',
  `wlwz` varchar(200) DEFAULT NULL COMMENT '物理位置,绝对路径',
  `scsj` datetime NOT NULL COMMENT '上传时间',
  `bzlx` int(2) DEFAULT '0' COMMENT '标注类型,0:未标注,1:标注(典型案例)',
  `gzz_ip` varchar(64) NOT NULL COMMENT '工作站IP',
  `upload` int(2) NOT NULL DEFAULT '0' COMMENT '0:不上传，1：上传到中心服务器(重要视频)',
  `video_type` int(2) DEFAULT '9' COMMENT '视频分类(1:酒驾、2:事故、3:毒驾、4:违法、9:其他)',
  `source` int(1) NOT NULL DEFAULT '1' COMMENT '来源;1:执法记录仪,2:公安类,3:非公安类',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '',
  PRIMARY KEY (`wjbh`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_case_key` (`case_key`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_video_201706
-- ----------------------------
INSERT INTO `case_video_201706` VALUES ('TA00716_JX0227_20170623093621.MOV', '20170623093621_JX0227_3602010201', '2017-06-23 09:36:21', '2017-06-23 09:36:54', '33', '1', '王磊', 'JX0227', '3602010201', '青山一中队', 'TA00716', '192.168.0.26', null, 'http://192.168.0.26:80/pe_fileG/pedata/TA00716/20170623/TA00716_JX0227_20170623093621.MOV', null, '2017-08-07 14:16:13', '0', '192.168.0.26', '0', '9', '1', '2017-08-07 14:16:13', '');

-- ----------------------------
-- Table structure for `case_video_201707`
-- ----------------------------
DROP TABLE IF EXISTS `case_video_201707`;
CREATE TABLE `case_video_201707` (
  `wjbh` varchar(100) NOT NULL DEFAULT '0' COMMENT '文件编号 <产口序号>_<警号>_<年月日时分秒>.<类型>',
  `case_key` varchar(64) NOT NULL COMMENT '案件标识，同case_201708.case_key',
  `start_time` datetime NOT NULL COMMENT '拍摄时间',
  `end_time` datetime DEFAULT NULL COMMENT '视频结束时间',
  `wjcd` int(11) DEFAULT '0' COMMENT '文件长度',
  `wjlx` int(2) DEFAULT NULL COMMENT '0:未知,1:视频,2:音频,3:图片',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '1' COMMENT '单位,同area_dep.areacode',
  `areaname` varchar(128) DEFAULT '' COMMENT '单位名称',
  `cpxh` varchar(7) NOT NULL DEFAULT '0000000' COMMENT '产品序号(执法仪编号),文件由人工提供时统一填99999',
  `ccfwq_ip` varchar(64) DEFAULT NULL COMMENT '存储服务器',
  `ccwz` varchar(200) DEFAULT NULL COMMENT '存储位置',
  `bfwz` varchar(200) NOT NULL DEFAULT 'http://' COMMENT '播放位置',
  `wlwz` varchar(200) DEFAULT NULL COMMENT '物理位置,绝对路径',
  `scsj` datetime NOT NULL COMMENT '上传时间',
  `bzlx` int(2) DEFAULT '0' COMMENT '标注类型,0:未标注,1:标注(典型案例)',
  `gzz_ip` varchar(64) NOT NULL COMMENT '工作站IP',
  `upload` int(2) NOT NULL DEFAULT '0' COMMENT '0:不上传，1：上传到中心服务器(重要视频)',
  `video_type` int(2) DEFAULT '9' COMMENT '视频分类(1:酒驾、2:事故、3:毒驾、4:违法、9:其他)',
  `source` int(1) NOT NULL DEFAULT '1' COMMENT '来源;1:执法记录仪,2:公安类,3:非公安类',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '',
  PRIMARY KEY (`wjbh`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_case_key` (`case_key`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_video_201707
-- ----------------------------

-- ----------------------------
-- Table structure for `case_video_201708`
-- ----------------------------
DROP TABLE IF EXISTS `case_video_201708`;
CREATE TABLE `case_video_201708` (
  `wjbh` varchar(100) NOT NULL DEFAULT '0' COMMENT '文件编号 <产口序号>_<警号>_<年月日时分秒>.<类型>',
  `case_key` varchar(64) NOT NULL COMMENT '案件标识，同case_201708.case_key',
  `start_time` datetime NOT NULL COMMENT '拍摄时间',
  `end_time` datetime DEFAULT NULL COMMENT '视频结束时间',
  `wjcd` int(11) DEFAULT '0' COMMENT '文件长度',
  `wjlx` int(2) DEFAULT NULL COMMENT '0:未知,1:视频,2:音频,3:图片',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '1' COMMENT '单位,同area_dep.areacode',
  `areaname` varchar(128) DEFAULT '' COMMENT '单位名称',
  `cpxh` varchar(7) NOT NULL DEFAULT '0000000' COMMENT '产品序号(执法仪编号),文件由人工提供时统一填99999',
  `ccfwq_ip` varchar(64) DEFAULT NULL COMMENT '存储服务器',
  `ccwz` varchar(200) DEFAULT NULL COMMENT '存储位置',
  `bfwz` varchar(200) NOT NULL DEFAULT 'http://' COMMENT '播放位置',
  `wlwz` varchar(200) DEFAULT NULL COMMENT '物理位置,绝对路径',
  `scsj` datetime NOT NULL COMMENT '上传时间',
  `bzlx` int(2) DEFAULT '0' COMMENT '标注类型,0:未标注,1:标注(典型案例)',
  `gzz_ip` varchar(64) NOT NULL COMMENT '工作站IP',
  `upload` int(2) NOT NULL DEFAULT '0' COMMENT '0:不上传，1：上传到中心服务器(重要视频)',
  `video_type` int(2) DEFAULT '9' COMMENT '视频分类(1:酒驾、2:事故、3:毒驾、4:违法、9:其他)',
  `source` int(1) NOT NULL DEFAULT '1' COMMENT '来源;1:执法记录仪,2:公安类,3:非公安类',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '',
  PRIMARY KEY (`wjbh`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_case_key` (`case_key`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_video_201708
-- ----------------------------

-- ----------------------------
-- Table structure for `case_video_201709`
-- ----------------------------
DROP TABLE IF EXISTS `case_video_201709`;
CREATE TABLE `case_video_201709` (
  `wjbh` varchar(100) NOT NULL DEFAULT '0' COMMENT '文件编号 <产口序号>_<警号>_<年月日时分秒>.<类型>',
  `case_key` varchar(64) NOT NULL COMMENT '案件标识，同case_201708.case_key',
  `start_time` datetime NOT NULL COMMENT '拍摄时间',
  `end_time` datetime DEFAULT NULL COMMENT '视频结束时间',
  `wjcd` int(11) DEFAULT '0' COMMENT '文件长度',
  `wjlx` int(2) DEFAULT NULL COMMENT '0:未知,1:视频,2:音频,3:图片',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '1' COMMENT '单位,同area_dep.areacode',
  `areaname` varchar(128) DEFAULT '' COMMENT '单位名称',
  `cpxh` varchar(7) NOT NULL DEFAULT '0000000' COMMENT '产品序号(执法仪编号),文件由人工提供时统一填99999',
  `ccfwq_ip` varchar(64) DEFAULT NULL COMMENT '存储服务器',
  `ccwz` varchar(200) DEFAULT NULL COMMENT '存储位置',
  `bfwz` varchar(200) NOT NULL DEFAULT 'http://' COMMENT '播放位置',
  `wlwz` varchar(200) DEFAULT NULL COMMENT '物理位置,绝对路径',
  `scsj` datetime NOT NULL COMMENT '上传时间',
  `bzlx` int(2) DEFAULT '0' COMMENT '标注类型,0:未标注,1:标注(典型案例)',
  `gzz_ip` varchar(64) NOT NULL COMMENT '工作站IP',
  `upload` int(2) NOT NULL DEFAULT '0' COMMENT '0:不上传，1：上传到中心服务器(重要视频)',
  `video_type` int(2) DEFAULT '9' COMMENT '视频分类(1:酒驾、2:事故、3:毒驾、4:违法、9:其他)',
  `source` int(1) NOT NULL DEFAULT '1' COMMENT '来源;1:执法记录仪,2:公安类,3:非公安类',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '',
  PRIMARY KEY (`wjbh`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_case_key` (`case_key`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_video_201709
-- ----------------------------

-- ----------------------------
-- Table structure for `dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL COMMENT '类型',
  `name` varchar(255) NOT NULL COMMENT '字段描述',
  `value` varchar(255) DEFAULT '' COMMENT '字段值',
  `item` varchar(255) DEFAULT '' COMMENT '字段值描述',
  `order` int(5) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('1', 'status', '状态', '0', '离线', '0');
INSERT INTO `dictionary` VALUES ('2', 'status', '状态', '1', '在线', '0');
INSERT INTO `dictionary` VALUES ('3', 'deptype', '部门类型', '0', '无', '0');
INSERT INTO `dictionary` VALUES ('4', 'deptype', '部门类型', '1', '交警', '0');
INSERT INTO `dictionary` VALUES ('5', 'deptype', '部门类型', '2', '其他', '0');
INSERT INTO `dictionary` VALUES ('6', 'status', '状态', '', '', '0');
INSERT INTO `dictionary` VALUES ('7', 'deptype', '部门类型', '', '', '0');
INSERT INTO `dictionary` VALUES ('9', 'enable', '启用状态', '', '', '0');
INSERT INTO `dictionary` VALUES ('10', 'enable', '启用状态', '1', '启用', '1');
INSERT INTO `dictionary` VALUES ('11', 'enable', '启用状态', '0', '停用', '2');
INSERT INTO `dictionary` VALUES ('12', 'videotype', '视频类型', '', '', '0');
INSERT INTO `dictionary` VALUES ('14', 'videotype', '视频类型', '', '未知', '0');
INSERT INTO `dictionary` VALUES ('15', 'videotype', '视频类型', '1', '音频', '1');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `empid` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` int(11) NOT NULL DEFAULT '1' COMMENT '区域(部门)ID',
  `name` varchar(32) NOT NULL DEFAULT '无' COMMENT '警员名',
  `code` varchar(32) NOT NULL DEFAULT '无' COMMENT '登陆账号,一般是警员编号',
  `sex` char(4) DEFAULT '男',
  `phone` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `photo_path` varchar(128) DEFAULT NULL COMMENT '警员相片绝对位置(URL)',
  `password` varchar(32) NOT NULL COMMENT '登陆密码',
  `roleid` int(11) NOT NULL DEFAULT '1',
  `bindingip` int(11) NOT NULL DEFAULT '0' COMMENT '0:未梆定,1:梆定',
  `clientip` varchar(16) DEFAULT NULL,
  `userarea` text COMMENT '管理员是非空.用户有权限的区域ID集合，逗号分隔',
  PRIMARY KEY (`empid`),
  UNIQUE KEY `idx_code` (`code`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=650 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('86', '133', '张建军', 'JX0438', '男', '', null, '管理', null, 'JX0438', '23', '0', '', '133');
INSERT INTO `employee` VALUES ('87', '133', '特日贡', 'JX0927', '男', '', null, '警员', null, 'JX0927', '20', '0', null, null);
INSERT INTO `employee` VALUES ('88', '71', '李国伟', '021022', '男', '', null, '管理', null, '021022', '22', '0', '', '71,100,99,98,97,96,95');
INSERT INTO `employee` VALUES ('85', '73', '刘剑波', '024086', '男', '', null, '管理', null, '024086', '22', '0', '', '73,138,137,136,135,134,133,132');
INSERT INTO `employee` VALUES ('84', '85', '孙洋', 'JX1209', '男', '', null, '警员', null, 'JX1209', '20', '0', null, null);
INSERT INTO `employee` VALUES ('82', '74', '郭红', 'JX1217', '男', '', null, '管理', null, 'JX1217', '22', '0', '', '74,90,89,88,87,86,85');
INSERT INTO `employee` VALUES ('33', '54', '安锐', '020004', '男', '', '', '管理', '/upload/5949ebc0a2516.jpg', '020004', '19', '0', '', '53,54,94,150,149,148,147,146,93,131,130,129,128,127,126,92,125,124,123,122,121,84,109,108,83,140,139,82,113,185,184,183,112,111,110,81,120,119,118,117,116,115,114,80,107,106,105,104,103,102,101,79,155,154,153,152,151,76,145,144,143,142,141,75,163,162,161,160,159,158,157,156,74,90,89,88,87,86,85,73,138,137,136,135,134,133,132,71,100,99,98,97,96,95,70,182,181,180,179,178,177,176,175,174,173,69,172,171,170,169,168,167,166,165,164,58,68,67,66,65,64,63,62,61,55,57,56,189,190,191,192,193');
INSERT INTO `employee` VALUES ('1', '0', '系统管理员', 'admin', '男', null, null, null, null, '123456', '1', '0', null, '52,53,54,55,56,57,58,61,62,63,64,65,66,67,68,69,70,71,73,74,75,76,79,80,81,82,83,84,85,86,87,88,89,90,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,189,190,191,192,193');
INSERT INTO `employee` VALUES ('34', '54', '刑建国', '020764', '男', '', '', '管理', null, '020764', '19', '0', '', '54,94,150,149,148,147,146,93,131,130,129,128,127,126,92,125,124,123,122,121,84,109,108,83,140,139,82,113,185,184,183,112,111,110,81,120,119,118,117,116,115,114,80,107,106,105,104,103,102,101,79,155,154,153,152,151,76,145,144,143,142,141,75,163,162,161,160,159,158,157,156,74,90,89,88,87,86,85,73,138,137,136,135,134,133,132,71,100,99,98,97,96,95,70,182,181,180,179,178,177,176,175,174,173,69,172,171,170,169,168,167,166,165,164,58,68,67,66,65,64,63,62,61,55,57,56,189,190,191,192,193');
INSERT INTO `employee` VALUES ('83', '85', '高超', 'JX0706', '男', '', null, '管理', null, 'JX0706', '23', '0', '', '85');
INSERT INTO `employee` VALUES ('35', '166', '熊文涛', '024992', '男', '', '', '管理', null, '024992', '23', '0', '', '166');
INSERT INTO `employee` VALUES ('36', '54', '吕佳佳', 'JX0714', '男', '', '', '管理', null, 'JX0714', '19', '0', '', '54,94,150,149,148,147,146,93,131,130,129,128,127,126,92,125,124,123,122,121,84,109,108,83,140,139,82,113,185,184,183,112,111,110,81,120,119,118,117,116,115,114,80,107,106,105,104,103,102,101,79,155,154,153,152,151,76,145,144,143,142,141,75,163,162,161,160,159,158,157,156,74,90,89,88,87,86,85,73,138,137,136,135,134,133,132,71,100,99,98,97,96,95,70,182,181,180,179,178,177,176,175,174,173,69,172,171,170,169,168,167,166,165,164,58,68,67,66,65,64,63,62,61,55,57,56');
INSERT INTO `employee` VALUES ('37', '54', '刘馨', 'JX1110', '男', '', '', '警员', null, 'JX1110', '20', '0', null, null);
INSERT INTO `employee` VALUES ('38', '54', '任文龙', '000123', '男', '', '', '警员', '/upload/59494433a35d1.jpg', '000123', '20', '0', null, null);
INSERT INTO `employee` VALUES ('39', '58', '王玉炜', '021249', '男', '', null, '管理', null, '021249', '22', '0', '', '58,68,67,66,65,64,63,62,61');
INSERT INTO `employee` VALUES ('40', '58', '季成功', '020866', '男', '', null, '管理', null, '020866', '22', '0', '', '58');
INSERT INTO `employee` VALUES ('41', '58', '张瑞洪', '021229', '男', '', null, '管理', null, '021229', '22', '0', '', '58,68,67,66,65,64,63');
INSERT INTO `employee` VALUES ('42', '58', '王军', '020954', '男', '', null, '管理', null, '020954', '22', '0', '', '58,68,67,66,65,64,63,62,61');
INSERT INTO `employee` VALUES ('43', '58', '冯军', '024628', '男', '', null, '管理', null, '024628', '22', '0', '', '58,68,67,66,65,64,63,62,61');
INSERT INTO `employee` VALUES ('44', '58', '白岩松', '021032', '男', '', null, '管理', null, '021032', '22', '0', '', '58,68,67,66,65,64,63,62,61');
INSERT INTO `employee` VALUES ('45', '58', '郝胜利', '021074', '男', '', null, '警员', null, '021074', '20', '0', null, null);
INSERT INTO `employee` VALUES ('46', '69', '张强', '020923', '男', '', null, '管理', null, '020923', '22', '0', '', '69,172,171,170,169,168,167,166,165,164');
INSERT INTO `employee` VALUES ('47', '166', '纪宇宏', '000JJH', '男', '', null, '管理', null, '000JJH', '23', '0', '', '166');
INSERT INTO `employee` VALUES ('48', '166', '黄猛', '020707', '男', '', null, '警员', null, '020707', '20', '0', null, null);
INSERT INTO `employee` VALUES ('49', '94', '王振钧', '021115', '男', '', null, '管理', null, '021115', '22', '0', '', '94,150,149,148,147,146');
INSERT INTO `employee` VALUES ('50', '147', '张建楠', 'JX1177', '男', '', null, '警员', null, 'JX1177', '20', '0', null, null);
INSERT INTO `employee` VALUES ('51', '93', '陈琪铭', '020810', '男', '', null, '管理', null, '020810', '22', '0', '', '93,131,130,129,128,127,126');
INSERT INTO `employee` VALUES ('52', '127', '刘奇', 'JX1028', '男', '', null, '警员', null, 'JX1028', '20', '0', null, null);
INSERT INTO `employee` VALUES ('53', '127', '王帅', '024894', '男', '', null, '管理', null, '024894', '23', '0', '', '127');
INSERT INTO `employee` VALUES ('54', '92', '王玉基', '022820', '男', '', null, '管理', null, '022820', '22', '0', '', '92,125,124,123,122,121');
INSERT INTO `employee` VALUES ('55', '123', '何飓', 'JX0920', '男', '', null, '管理', null, 'JX0920', '23', '0', '', '123');
INSERT INTO `employee` VALUES ('56', '123', '赵斌', 'JX0386', '男', '', null, '警员', null, 'JX0386', '20', '0', null, null);
INSERT INTO `employee` VALUES ('57', '84', '杨来会', '021252', '男', '', null, '管理', null, '021252', '22', '0', '', '84,109,108');
INSERT INTO `employee` VALUES ('58', '108', '韩永乐', '020694', '男', '', null, '管理', null, '020694', '23', '0', '', '108');
INSERT INTO `employee` VALUES ('59', '108', '尹明泽', 'JX0112', '男', '', null, '警员', null, 'JX0112', '20', '0', null, null);
INSERT INTO `employee` VALUES ('60', '83', '徐海心', '021077', '男', '', null, '管理', null, '021077', '22', '0', '', '83,140,139');
INSERT INTO `employee` VALUES ('61', '83', '解永炯', '021403', '男', '', null, '管理', null, '021403', '22', '0', '', '83,140,139');
INSERT INTO `employee` VALUES ('62', '82', '燕东', '024529', '男', '', null, '管理', null, '024529', '22', '0', '', '82,113,112,111,110');
INSERT INTO `employee` VALUES ('63', '112', '王卫东', '020988', '男', '', null, '管理', null, '020988', '23', '0', '', '112');
INSERT INTO `employee` VALUES ('64', '112', '董立新', '024752', '男', '', null, '警员', null, '024752', '20', '0', null, null);
INSERT INTO `employee` VALUES ('65', '81', '王秀良', '024622', '男', '', null, '管理', null, '024622', '22', '0', '', '81,120,119,118,117,116,115,114');
INSERT INTO `employee` VALUES ('66', '116', '郭晓兵', 'JX0702', '男', '', null, '管理', null, 'JX0702', '23', '0', '', '116');
INSERT INTO `employee` VALUES ('67', '116', '张世民', '023547', '男', '', null, '警员', null, '023547', '20', '0', null, null);
INSERT INTO `employee` VALUES ('68', '140', '庄莹', 'JX0780', '男', '', null, '管理', null, 'JX0780', '23', '0', '', '140');
INSERT INTO `employee` VALUES ('69', '140', '杜小利', 'JX0653', '男', '', null, '警员', null, 'JX0653', '20', '0', null, null);
INSERT INTO `employee` VALUES ('70', '80', '崔志强', '020804', '男', '', null, '管理', null, '020804', '22', '0', '', '80,107,106,105,104,103,102,101');
INSERT INTO `employee` VALUES ('71', '103', '李永忠', '021722', '男', '', null, '管理', null, '021722', '23', '0', null, null);
INSERT INTO `employee` VALUES ('72', '103', '郝俊礼', '020920', '男', '', null, '警员', null, '020920', '20', '0', null, null);
INSERT INTO `employee` VALUES ('73', '79', '孙恒', '020819', '男', '', null, '管理', null, '020819', '22', '0', '', '79,155,154,153,152,151');
INSERT INTO `employee` VALUES ('74', '153', '赵圣玉', 'JX1081', '男', '', null, '管理', null, 'JX1081', '23', '0', '', '153');
INSERT INTO `employee` VALUES ('75', '153', '段军', '020907', '男', '', null, '警员', null, '020907', '20', '0', null, null);
INSERT INTO `employee` VALUES ('76', '76', '刘飞', '021073', '男', '', null, '管理', null, '021073', '22', '0', '', '76,145,144,143,142,141');
INSERT INTO `employee` VALUES ('77', '142', '苗芝茂', '002030', '男', '', null, '管理', null, '002030', '23', '0', '', '142');
INSERT INTO `employee` VALUES ('78', '142', '哈斯巴根', 'JX1015', '男', '', null, '警员', null, 'JX1015', '20', '0', null, null);
INSERT INTO `employee` VALUES ('79', '75', '李杰', '020772', '男', '', null, '管理', null, '020772', '22', '0', '', '75,163,162,161,160,159,158,157,156');
INSERT INTO `employee` VALUES ('80', '158', '王锦帅', 'JX1231', '男', '', null, '管理', null, 'JX1231', '23', '0', '', '158');
INSERT INTO `employee` VALUES ('81', '158', '马东兴', 'JX0473', '男', '', null, '警员', null, 'JX0473', '20', '0', null, null);
INSERT INTO `employee` VALUES ('89', '96', '王建光', 'JX0277', '男', '', null, '管理', null, 'JX0277', '23', '0', '', '96');
INSERT INTO `employee` VALUES ('90', '96', '张永强', '021173', '男', '', null, '警员', null, '021173', '20', '0', null, null);
INSERT INTO `employee` VALUES ('91', '70', '朱媛', 'JX0741', '男', '', null, '管理', null, 'JX0741', '22', '0', '', '70,182,181,180,179,178,177,176,175,174,173');
INSERT INTO `employee` VALUES ('92', '176', '张建基', '020794', '男', '', null, '管理', null, '020794', '23', '0', '', '176');
INSERT INTO `employee` VALUES ('93', '176', '周建军', '021138', '男', '', null, '警员', null, '021138', '20', '0', null, null);
INSERT INTO `employee` VALUES ('94', '61', '安满平', '021324', '男', '', null, '管理', null, '021324', '23', '0', '', '61');
INSERT INTO `employee` VALUES ('95', '61', '张成辉', '020731', '男', '', null, '警员', null, '020731', '20', '0', null, null);
INSERT INTO `employee` VALUES ('96', '61', '阿力玛斯', '020974', '男', '', null, '警员', null, '020974', '20', '0', null, null);
INSERT INTO `employee` VALUES ('97', '150', '张海龙', '001919', '男', '', null, '管理', null, '001919', '23', '0', '', '150');
INSERT INTO `employee` VALUES ('98', '150', '王群', '024942', '男', '', null, '警员', null, '024942', '20', '0', null, null);
INSERT INTO `employee` VALUES ('99', '167', '田元红', '024888', '男', '', null, '管理', null, '024888', '23', '0', '', '167');
INSERT INTO `employee` VALUES ('100', '167', '苏涛', '023789', '男', '', null, '警员', null, '023789', '20', '0', null, null);
INSERT INTO `employee` VALUES ('101', '128', '郝煊', 'JX0099', '男', '', null, '管理', null, 'JX0099', '23', '0', '', '128');
INSERT INTO `employee` VALUES ('102', '128', '方鹏', 'JX0475', '男', '', null, '警员', null, 'JX0475', '20', '0', null, null);
INSERT INTO `employee` VALUES ('103', '122', '杨超', 'JX1056', '男', '', null, '管理', null, 'JX1056', '23', '0', '', '122');
INSERT INTO `employee` VALUES ('104', '122', '王英', 'JX0915', '男', '', null, '警员', null, 'JX0915', '20', '0', null, null);
INSERT INTO `employee` VALUES ('105', '139', '刘丽', 'JX0659', '男', '', null, '管理', null, 'JX0659', '23', '0', '', '139');
INSERT INTO `employee` VALUES ('106', '139', '王立兴', 'JX0655', '男', '', null, '警员', null, 'JX0655', '20', '0', null, null);
INSERT INTO `employee` VALUES ('107', '111', '陈曦', '020406', '男', '', null, '管理', null, '020406', '23', '0', '', '111');
INSERT INTO `employee` VALUES ('108', '111', '闫守忠', '021231', '男', '', null, '警员', null, '021231', '20', '0', null, null);
INSERT INTO `employee` VALUES ('109', '117', '马小平', '020911', '男', '', null, '管理', null, '020911', '23', '0', '', '117');
INSERT INTO `employee` VALUES ('110', '117', '杨建明', '024766', '男', '', null, '警员', null, '024766', '20', '0', null, null);
INSERT INTO `employee` VALUES ('111', '102', '王培荣', '020997', '男', '', null, '管理', null, '020997', '23', '0', '', '102');
INSERT INTO `employee` VALUES ('112', '102', '徐建忠', '020985', '男', '', null, '警员', null, '020985', '20', '0', null, null);
INSERT INTO `employee` VALUES ('113', '152', '乔明', '021078', '男', '', null, '管理', null, '021078', '23', '0', '', '152');
INSERT INTO `employee` VALUES ('114', '152', '奥东乐', 'JX1148', '男', '', null, '警员', null, 'JX1148', '20', '0', null, null);
INSERT INTO `employee` VALUES ('115', '143', '湖泊清', '002025', '男', '', null, '管理', null, '002025', '23', '0', '', '143');
INSERT INTO `employee` VALUES ('116', '143', '张磊', 'JX1163', '男', '', null, '警员', null, 'JX1163', '20', '0', null, null);
INSERT INTO `employee` VALUES ('117', '159', '王成', 'JX1218', '男', '', null, '管理', null, 'JX1218', '23', '0', '', '159');
INSERT INTO `employee` VALUES ('118', '159', '郭忠义', 'JX0476', '男', '', null, '警员', null, 'JX0476', '20', '0', null, null);
INSERT INTO `employee` VALUES ('119', '88', '边志强', '020732', '男', '', null, '管理', null, '020732', '23', '0', '', '88');
INSERT INTO `employee` VALUES ('120', '88', '丁学彬', 'JX0975', '男', '', null, '警员', null, 'JX0975', '20', '0', null, null);
INSERT INTO `employee` VALUES ('121', '134', '李仲深', 'O21234', '男', '', null, '警员', null, 'O21234', '23', '0', '', '134');
INSERT INTO `employee` VALUES ('122', '134', '白禄', 'JX0931', '男', '', null, '警员', null, 'JX0931', '20', '0', null, null);
INSERT INTO `employee` VALUES ('123', '97', '赵刚', '000320', '男', '', null, '管理', null, '000320', '23', '0', '', '97');
INSERT INTO `employee` VALUES ('124', '97', '张永彬', 'JX0359', '男', '', null, '警员', null, 'JX0359', '20', '0', null, null);
INSERT INTO `employee` VALUES ('125', '177', '南涛', '022684', '男', '', null, '管理', null, '022684', '23', '0', '', '177');
INSERT INTO `employee` VALUES ('126', '177', '李帅', 'JX0317', '男', '', null, '警员', null, 'JX0317', '20', '0', null, null);
INSERT INTO `employee` VALUES ('127', '62', '刘洪', '024476', '男', '', null, '管理', null, '024476', '23', '0', '', '62');
INSERT INTO `employee` VALUES ('128', '62', '张斌', 'JX1070', '男', '', null, '警员', null, 'JX1070', '20', '0', null, null);
INSERT INTO `employee` VALUES ('129', '166', '王磊', 'JX0227', '男', '', null, '警员', null, 'JX0227', '20', '0', null, null);
INSERT INTO `employee` VALUES ('130', '166', '王飞', 'JX0198', '男', '', null, '管理', null, 'JX0198', '23', '0', '', '166');
INSERT INTO `employee` VALUES ('131', '166', '张宏硕', 'JX0663', '男', '', null, '管理', null, 'JX0663', '23', '0', '', '166');
INSERT INTO `employee` VALUES ('132', '166', '刘宇峰', 'JX1271', '男', '', null, '管理', null, 'JX1271', '23', '0', '', '166');
INSERT INTO `employee` VALUES ('133', '166', '刘德华', 'JX0214', '男', '', null, '警员', null, 'JX0214', '20', '0', null, null);
INSERT INTO `employee` VALUES ('134', '166', '张成', 'JX0219', '男', '', null, '警员', null, 'JX0219', '20', '0', null, null);
INSERT INTO `employee` VALUES ('135', '166', '祁博', 'JX0224', '男', '', null, '警员', null, 'JX0224', '20', '0', null, null);
INSERT INTO `employee` VALUES ('136', '166', '刘欣', 'JX0232', '男', '', null, '警员', null, 'JX0232', '20', '0', null, null);
INSERT INTO `employee` VALUES ('137', '166', '俎文强', 'JX0233', '男', '', null, '警员', null, 'JX0233', '20', '0', null, null);
INSERT INTO `employee` VALUES ('138', '166', '张元一', 'JX0243', '男', '', null, '警员', null, 'JX0243', '20', '0', null, null);
INSERT INTO `employee` VALUES ('139', '166', '满建伟', 'JX0260', '男', '', null, '警员', null, 'JX0260', '20', '0', null, null);
INSERT INTO `employee` VALUES ('140', '166', '井杨春', 'JX0393', '男', '', null, '警员', null, 'JX0393', '20', '0', null, null);
INSERT INTO `employee` VALUES ('141', '166', '毕少原', 'JX0856', '男', '', null, '警员', null, 'JX0856', '20', '0', null, null);
INSERT INTO `employee` VALUES ('142', '166', '冯超', 'JX0858', '男', '', null, '警员', null, 'JX0858', '20', '0', null, null);
INSERT INTO `employee` VALUES ('143', '166', '王慧博', 'JX0867', '男', '', null, '警员', null, 'JX0867', '20', '0', null, null);
INSERT INTO `employee` VALUES ('144', '166', '杨毅', 'JX0870', '男', '', null, '警员', null, 'JX0870', '20', '0', null, null);
INSERT INTO `employee` VALUES ('145', '166', '赵雪峰', 'JX0873', '男', '', null, '警员', null, 'JX0873', '20', '0', null, null);
INSERT INTO `employee` VALUES ('146', '166', '白鹤', 'JX1084', '男', '', null, '警员', null, 'JX1084', '20', '0', null, null);
INSERT INTO `employee` VALUES ('147', '166', '刘伟梁', 'JX1109', '男', '', null, '警员', null, 'JX1109', '20', '0', null, null);
INSERT INTO `employee` VALUES ('148', '166', '王晓栋', 'JX1127', '男', '', null, '警员', null, 'JX1127', '20', '0', null, null);
INSERT INTO `employee` VALUES ('149', '166', '于晓伟', 'JX1139', '男', '', null, '警员', null, 'JX1139', '20', '0', null, null);
INSERT INTO `employee` VALUES ('150', '166', '王增平', 'JX0120', '男', '', null, '警员', null, 'JX0120', '20', '0', null, null);
INSERT INTO `employee` VALUES ('151', '172', '马凤贺', '021061', '男', '', null, '管理', null, '021061', '23', '0', '', '172');
INSERT INTO `employee` VALUES ('152', '172', '候毅', 'JX0152', '男', '', null, '管理', null, 'JX0152', '23', '0', '', '172');
INSERT INTO `employee` VALUES ('153', '172', '王帅', 'JX1125', '男', '', null, '管理', null, 'JX1125', '23', '0', '', '172');
INSERT INTO `employee` VALUES ('154', '172', '苏和', '000811', '男', '', null, '管理', null, '000811', '23', '0', '', '172');
INSERT INTO `employee` VALUES ('155', '172', '耿鑫', '000805', '男', '', null, '管理', null, '000805', '23', '0', '', '172');
INSERT INTO `employee` VALUES ('156', '172', '王磊', '023123', '男', '', null, '警员', null, '023123', '20', '0', null, null);
INSERT INTO `employee` VALUES ('157', '172', '张臻喆', '024444', '男', '', null, '警员', null, '024444', '20', '0', null, null);
INSERT INTO `employee` VALUES ('158', '172', '刘计林', '024617', '男', '', null, '警员', null, '024617', '20', '0', null, null);
INSERT INTO `employee` VALUES ('159', '172', '张俊平', '024749', '男', '', null, '警员', null, '024749', '20', '0', null, null);
INSERT INTO `employee` VALUES ('160', '172', '李岩', '024867', '男', '', null, '警员', null, '024867', '20', '0', null, null);
INSERT INTO `employee` VALUES ('161', '172', '卜永生', '024916', '男', '', null, '警员', null, '024916', '20', '0', null, null);
INSERT INTO `employee` VALUES ('162', '172', '宋永超', '024965', '男', '', null, '警员', null, '024965', '20', '0', null, null);
INSERT INTO `employee` VALUES ('163', '171', '王占山', '024742', '男', '', null, '管理', null, '024742', '23', '0', '', '171');
INSERT INTO `employee` VALUES ('164', '171', '刘波涛', '021127', '男', '', null, '警员', null, '021127', '20', '0', null, null);
INSERT INTO `employee` VALUES ('165', '171', '布赫', '024889', '男', '', null, '警员', null, '024889', '20', '0', null, null);
INSERT INTO `employee` VALUES ('166', '171', '陈磊', 'JX0209', '男', '', null, '警员', null, 'JX0209', '20', '0', null, null);
INSERT INTO `employee` VALUES ('167', '171', '金晓光', 'JX0222', '男', '', null, '警员', null, 'JX0222', '20', '0', null, null);
INSERT INTO `employee` VALUES ('168', '171', '曹培', 'JX0225', '男', '', null, '警员', null, 'JX0225', '20', '0', null, null);
INSERT INTO `employee` VALUES ('169', '171', '高乐', 'JX0266', '男', '', null, '警员', null, 'JX0266', '20', '0', null, null);
INSERT INTO `employee` VALUES ('170', '171', '满意', 'JX0275', '男', '', null, '警员', null, 'JX0275', '20', '0', null, null);
INSERT INTO `employee` VALUES ('171', '171', '程胤众', 'JX0469', '男', '', null, '警员', null, 'JX0469', '20', '0', null, null);
INSERT INTO `employee` VALUES ('172', '171', '程超柏', 'JX0857', '男', '', null, '警员', null, 'JX0857', '20', '0', null, null);
INSERT INTO `employee` VALUES ('173', '171', '刘帆', 'JX0863', '男', '', null, '警员', null, 'JX0863', '20', '0', null, null);
INSERT INTO `employee` VALUES ('174', '170', '李包建', '021038', '男', '', null, '管理', null, '021038', '23', '0', '', '170');
INSERT INTO `employee` VALUES ('175', '170', '孙焕章', '024625', '男', '', null, '警员', null, '024625', '20', '0', null, null);
INSERT INTO `employee` VALUES ('176', '170', '杜永硕', '024714', '男', '', null, '警员', null, '024714', '20', '0', null, null);
INSERT INTO `employee` VALUES ('177', '170', '沈万栋', '024832', '男', '', null, '警员', null, '024832', '20', '0', null, null);
INSERT INTO `employee` VALUES ('178', '170', '田健', 'JX0223', '男', '', null, '警员', null, 'JX0223', '20', '0', null, null);
INSERT INTO `employee` VALUES ('179', '170', '王林', 'JX0229', '男', '', null, '警员', null, 'JX0229', '20', '0', null, null);
INSERT INTO `employee` VALUES ('180', '170', '徐楠', 'JX0230', '男', '', null, '警员', null, 'JX0230', '20', '0', null, null);
INSERT INTO `employee` VALUES ('181', '170', '李伟', 'JX0245', '男', '', null, '警员', null, 'JX0245', '20', '0', null, null);
INSERT INTO `employee` VALUES ('182', '170', '佘涛', 'JX1130', '男', '', null, '警员', null, 'JX1130', '20', '0', null, null);
INSERT INTO `employee` VALUES ('183', '170', '魏守奕', 'JX1131', '男', '', null, '警员', null, 'JX1131', '20', '0', null, null);
INSERT INTO `employee` VALUES ('184', '170', '魏银龙', 'JX1138', '男', '', null, '警员', null, 'JX1138', '20', '0', null, null);
INSERT INTO `employee` VALUES ('185', '169', '王强', '021063', '男', '', null, '管理', null, '021063', '23', '0', '', '169');
INSERT INTO `employee` VALUES ('186', '169', '刘青松', '024779', '男', '', null, '管理', null, '024779', '23', '0', '', '169');
INSERT INTO `employee` VALUES ('187', '169', '冀树忠', '024756', '男', '', null, '管理', null, '024756', '23', '0', '', '169');
INSERT INTO `employee` VALUES ('188', '169', '付东', '023953', '男', '', null, '警员', null, '023953', '20', '0', null, null);
INSERT INTO `employee` VALUES ('189', '169', '樊国栋', '024792', '男', '', null, '警员', null, '024792', '20', '0', null, null);
INSERT INTO `employee` VALUES ('190', '169', '吴建民', 'JX0199', '男', '', null, '警员', null, 'JX0199', '20', '0', null, null);
INSERT INTO `employee` VALUES ('191', '169', '李刚强', 'JX0200', '男', '', null, '警员', null, 'JX0200', '20', '0', null, null);
INSERT INTO `employee` VALUES ('192', '169', '呼格', 'JX0235', '男', '', null, '警员', null, 'JX0235', '20', '0', null, null);
INSERT INTO `employee` VALUES ('193', '169', '王有青', 'JX0252', '男', '', null, '警员', null, 'JX0252', '20', '0', null, null);
INSERT INTO `employee` VALUES ('194', '169', '杨海', 'JX0255', '男', '', null, '警员', null, 'JX0255', '20', '0', null, null);
INSERT INTO `employee` VALUES ('195', '169', '潘劲松', 'JX0262', '男', '', null, '警员', null, 'JX0262', '20', '0', null, null);
INSERT INTO `employee` VALUES ('196', '169', '曹剑锋', 'JX0271', '男', '', null, '警员', null, 'JX0271', '20', '0', null, null);
INSERT INTO `employee` VALUES ('197', '169', '乔华', 'JX0273', '男', '', null, '警员', null, 'JX0273', '20', '0', null, null);
INSERT INTO `employee` VALUES ('198', '169', '贾祥', 'JX0860', '男', '', null, '警员', null, 'JX0860', '20', '0', null, null);
INSERT INTO `employee` VALUES ('199', '169', '要亭', 'JX1075', '男', '', null, '警员', null, 'JX1075', '20', '0', null, null);
INSERT INTO `employee` VALUES ('200', '169', '郝国庆', 'JX1092', '男', '', null, '警员', null, 'JX1092', '20', '0', null, null);
INSERT INTO `employee` VALUES ('201', '169', '杨晓暾', 'JX1137', '男', '', null, '警员', null, 'JX1137', '20', '0', null, null);
INSERT INTO `employee` VALUES ('202', '168', '达来', 'JX0157', '男', '', null, '管理', null, 'JX0157', '23', '0', '', '168');
INSERT INTO `employee` VALUES ('203', '168', '胡碧宇', 'JX0825', '男', '', null, '管理', null, 'JX0825', '23', '0', '', '168');
INSERT INTO `employee` VALUES ('204', '168', '于谦', 'JX0095', '男', '', null, '管理', null, 'JX0095', '23', '0', '', '168');
INSERT INTO `employee` VALUES ('205', '168', '范杰', '000565', '男', '', null, '管理', null, '000565', '23', '0', '', '168');
INSERT INTO `employee` VALUES ('206', '168', '张永亮', '020086', '男', '', null, '警员', null, '020086', '20', '0', null, null);
INSERT INTO `employee` VALUES ('207', '168', '孙建国', '020734', '男', '', null, '警员', null, '020734', '20', '0', null, null);
INSERT INTO `employee` VALUES ('208', '168', '孙铮', '024022', '男', '', null, '警员', null, '024022', '20', '0', null, null);
INSERT INTO `employee` VALUES ('209', '168', '李利军', '024870', '男', '', null, '警员', null, '024870', '20', '0', null, null);
INSERT INTO `employee` VALUES ('210', '168', '刘洋', 'JX0201', '男', '', null, '警员', null, 'JX0201', '20', '0', null, null);
INSERT INTO `employee` VALUES ('211', '168', '马国瑞', 'JX0215', '男', '', null, '警员', null, 'JX0215', '20', '0', null, null);
INSERT INTO `employee` VALUES ('212', '168', '达来', 'JX0272', '男', '', null, '警员', null, 'JX0272', '20', '0', null, null);
INSERT INTO `employee` VALUES ('213', '168', '胡碧宇', 'JX0829', '男', '', null, '警员', null, 'JX0829', '20', '0', null, null);
INSERT INTO `employee` VALUES ('214', '168', '赵宏亮', 'JX0868', '男', '', null, '警员', null, 'JX0868', '20', '0', null, null);
INSERT INTO `employee` VALUES ('215', '168', '赵宇龙', 'JX1077', '男', '', null, '警员', null, 'JX1077', '20', '0', null, null);
INSERT INTO `employee` VALUES ('216', '168', '武楠', 'JX1133', '男', '', null, '警员', null, 'JX1133', '20', '0', null, null);
INSERT INTO `employee` VALUES ('217', '167', '郝明', 'JX0221', '男', '', null, '管理', null, 'JX0221', '23', '0', '', '167');
INSERT INTO `employee` VALUES ('218', '167', '罗强', 'JX0872', '男', '', null, '管理', null, 'JX0872', '23', '0', '', '167');
INSERT INTO `employee` VALUES ('219', '167', '胡俊峰', '024962', '男', '', null, '警员', null, '024962', '20', '0', null, null);
INSERT INTO `employee` VALUES ('220', '167', '乔文章', 'JX0202', '男', '', null, '警员', null, 'JX0202', '20', '0', null, null);
INSERT INTO `employee` VALUES ('221', '167', '宋泓杨', 'JX0234', '男', '', null, '警员', null, 'JX0234', '20', '0', null, null);
INSERT INTO `employee` VALUES ('222', '167', '张帅', 'JX0237', '男', '', null, '警员', null, 'JX0237', '20', '0', null, null);
INSERT INTO `employee` VALUES ('223', '167', '张超', 'JX0270', '男', '', null, '警员', null, 'JX0270', '20', '0', null, null);
INSERT INTO `employee` VALUES ('224', '167', '刘文彬', 'JX1076', '男', '', null, '警员', null, 'JX1076', '20', '0', null, null);
INSERT INTO `employee` VALUES ('225', '167', '刘旭', 'JX1111', '男', '', null, '警员', null, 'JX1111', '20', '0', null, null);
INSERT INTO `employee` VALUES ('226', '167', '王蒙', 'JX1124', '男', '', null, '警员', null, 'JX1124', '20', '0', null, null);
INSERT INTO `employee` VALUES ('227', '167', '刑智翔', 'JX1134', '男', '', null, '警员', null, 'JX1134', '20', '0', null, null);
INSERT INTO `employee` VALUES ('228', '69', '李怀忠', '021171', '男', '', null, '管理', null, '021171', '22', '0', '', '69,172,171,170,169,168,167,166,165,164');
INSERT INTO `employee` VALUES ('229', '69', '钟国庆', '020979', '男', '', null, '管理', null, '020979', '22', '0', '', '69,172,171,170,169,168,167,166,165,164');
INSERT INTO `employee` VALUES ('230', '69', '苏彬', '021197', '男', '', null, '管理', null, '021197', '22', '0', '', '69,172,171,170,169,168,167,166,165,164');
INSERT INTO `employee` VALUES ('231', '69', '曹征', '021054', '男', '', null, '管理', null, '021054', '22', '0', '', '69,172,171,170,169,168,167,166,165,164');
INSERT INTO `employee` VALUES ('232', '69', '赵梦武', '021137', '男', '', null, '管理', null, '021137', '22', '0', '', '69,172,171,170,169,168,167,166,165,164');
INSERT INTO `employee` VALUES ('233', '69', '孙瑞安', '021026', '男', '', null, '管理', null, '021026', '22', '0', '', '69,172,171,170,169,168,167,166,165,164');
INSERT INTO `employee` VALUES ('234', '94', '边雪峰', '025008', '男', '', null, '管理', null, '025008', '22', '0', '', '94,150,149,148,147,146');
INSERT INTO `employee` VALUES ('235', '94', '胡志明', '023502', '男', '', null, '管理', null, '023502', '22', '0', '', '94,150,149,148,147,146');
INSERT INTO `employee` VALUES ('236', '147', '乔景哲', 'JX1175', '男', '', null, '警员', null, 'JX1175', '20', '0', null, null);
INSERT INTO `employee` VALUES ('237', '147', '刘欢', 'JX0983', '男', '', null, '警员', null, 'JX0983', '20', '0', null, null);
INSERT INTO `employee` VALUES ('238', '148', '郑鸿宇', 'JX1178', '男', '', null, '警员', null, 'JX1178', '20', '0', null, null);
INSERT INTO `employee` VALUES ('239', '148', '张建平', 'JX0523', '男', '', null, '警员', null, 'JX0523', '20', '0', null, null);
INSERT INTO `employee` VALUES ('240', '148', '闫帅', 'JX0495', '男', '', null, '警员', null, 'JX0495', '20', '0', null, null);
INSERT INTO `employee` VALUES ('241', '150', '贺刚', 'JX1176', '男', '', null, '警员', null, 'JX1176', '20', '0', null, null);
INSERT INTO `employee` VALUES ('242', '150', '邸娜', 'JX1180', '男', '', null, '警员', null, 'JX1180', '20', '0', null, null);
INSERT INTO `employee` VALUES ('243', '150', '信佳', '024901', '男', '', null, '警员', null, '024901', '20', '0', null, null);
INSERT INTO `employee` VALUES ('244', '150', '郑国章', 'JX0508', '男', '', null, '管理', null, 'JX0508', '23', '0', '', '150');
INSERT INTO `employee` VALUES ('245', '150', '许志远', '001911', '男', '', null, '管理', null, '001911', '23', '0', '', '150');
INSERT INTO `employee` VALUES ('246', '150', '张静', 'JX0487', '男', '', null, '警员', null, 'JX0487', '20', '0', null, null);
INSERT INTO `employee` VALUES ('247', '93', '李东雄', '021044', '男', '', null, '管理', null, '021044', '22', '0', '', '93,131,130,129,128,127,126');
INSERT INTO `employee` VALUES ('248', '93', '曹学政', '024089', '男', '', null, '管理', null, '024089', '22', '0', '', '93,131,130,129,128,127,126');
INSERT INTO `employee` VALUES ('249', '93', '赵宝华', '023667', '男', '', null, '管理', null, '023667', '22', '0', '', '93,131,130,129,128,127,126');
INSERT INTO `employee` VALUES ('250', '93', '王启', '021145', '男', '', null, '管理', null, '021145', '22', '0', '', '93,131,130,129,128,127,126');
INSERT INTO `employee` VALUES ('251', '127', '安彪', 'JX1058', '男', '', null, '警员', null, 'JX1058', '20', '0', null, null);
INSERT INTO `employee` VALUES ('252', '127', '吕德', '020880', '男', '', null, '警员', null, '020880', '20', '0', null, null);
INSERT INTO `employee` VALUES ('253', '127', '张长青', 'JX1033', '男', '', null, '警员', null, 'JX1033', '20', '0', null, null);
INSERT INTO `employee` VALUES ('254', '127', '张素敏', 'JX1034', '男', '', null, '警员', null, 'JX1034', '20', '0', null, null);
INSERT INTO `employee` VALUES ('255', '127', '武建杰', 'JX0488', '男', '', null, '警员', null, 'JX0488', '20', '0', null, null);
INSERT INTO `employee` VALUES ('256', '127', '苗丽斌', 'JX0494', '男', '', null, '警员', null, 'JX0494', '20', '0', null, null);
INSERT INTO `employee` VALUES ('257', '127', '杨志彤', 'JX0499', '男', '', null, '警员', null, 'JX0499', '20', '0', null, null);
INSERT INTO `employee` VALUES ('258', '127', '赵伟', 'JX0501', '男', '', null, '警员', null, 'JX0501', '20', '0', null, null);
INSERT INTO `employee` VALUES ('259', '127', '康伟', 'JX0503', '男', '', null, '警员', null, 'JX0503', '20', '0', null, null);
INSERT INTO `employee` VALUES ('260', '127', '杨勇强', 'JX0505', '男', '', null, '警员', null, 'JX0505', '20', '0', null, null);
INSERT INTO `employee` VALUES ('261', '127', '王楠', 'JX0507', '男', '', null, '警员', null, 'JX0507', '20', '0', null, null);
INSERT INTO `employee` VALUES ('262', '127', '孙剑波', 'JX0510', '男', '', null, '警员', null, 'JX0510', '20', '0', null, null);
INSERT INTO `employee` VALUES ('263', '127', '高楠', 'JX0511', '男', '', null, '警员', null, 'JX0511', '20', '0', null, null);
INSERT INTO `employee` VALUES ('264', '127', '任志超', 'JX0524', '男', '', null, '警员', null, 'JX0524', '20', '0', null, null);
INSERT INTO `employee` VALUES ('265', '127', '张云波', '024956', '男', '', null, '警员', null, '024956', '20', '0', null, null);
INSERT INTO `employee` VALUES ('266', '127', '郑强', 'JX0316', '男', '', null, '警员', null, 'JX0316', '20', '0', null, null);
INSERT INTO `employee` VALUES ('267', '127', '高海波', '022181', '男', '', null, '警员', null, '022181', '20', '0', null, null);
INSERT INTO `employee` VALUES ('268', '127', '徐海云', '023304', '男', '', null, '警员', null, '023304', '20', '0', null, null);
INSERT INTO `employee` VALUES ('269', '127', '解树怀', '024125', '男', '', null, '警员', null, '024125', '20', '0', null, null);
INSERT INTO `employee` VALUES ('270', '127', '张小平', '024224', '男', '', null, '警员', null, '024224', '20', '0', null, null);
INSERT INTO `employee` VALUES ('271', '127', '史培文', '024732', '男', '', null, '警员', null, '024732', '20', '0', null, null);
INSERT INTO `employee` VALUES ('272', '127', '孙庆华', '024733', '男', '', null, '警员', null, '024733', '20', '0', null, null);
INSERT INTO `employee` VALUES ('273', '127', '曹伟', '024751', '男', '', null, '警员', null, '024751', '20', '0', null, null);
INSERT INTO `employee` VALUES ('274', '127', '杜飙', '024801', '男', '', null, '管理', null, '024801', '23', '0', '', '127');
INSERT INTO `employee` VALUES ('275', '127', '王楠', 'JX0509', '男', '', null, '管理', null, 'JX0509', '23', '0', '', '127');
INSERT INTO `employee` VALUES ('276', '127', '康纬', 'JX0423', '男', '', null, '管理', null, 'JX0423', '23', '0', '', '127');
INSERT INTO `employee` VALUES ('277', '127', '张凯', 'JX0671', '男', '', null, '管理', null, 'JX0671', '23', '0', '', '127');
INSERT INTO `employee` VALUES ('278', '127', '张伟', 'JX0708', '男', '', null, '管理', null, 'JX0708', '23', '0', '', '127');
INSERT INTO `employee` VALUES ('279', '127', '张嘉伦', 'JX0382', '男', '', null, '管理', null, 'JX0382', '23', '0', '', '127');
INSERT INTO `employee` VALUES ('280', '127', '袁博', 'JX0710', '男', '', null, '管理', null, 'JX0710', '23', '0', '', '127');
INSERT INTO `employee` VALUES ('281', '127', '孟照军', '020837', '男', '', null, '警员', null, '020837', '20', '0', null, null);
INSERT INTO `employee` VALUES ('282', '127', '白峻屹', '020853', '男', '', null, '警员', null, '020853', '20', '0', null, null);
INSERT INTO `employee` VALUES ('283', '128', '杜磊', 'JX1024', '男', '', null, '警员', null, 'JX1024', '20', '0', null, null);
INSERT INTO `employee` VALUES ('284', '128', '李建平', 'JX0497', '男', '', null, '警员', null, 'JX0497', '20', '0', null, null);
INSERT INTO `employee` VALUES ('285', '128', '张美祥', 'JX0506', '男', '', null, '警员', null, 'JX0506', '20', '0', null, null);
INSERT INTO `employee` VALUES ('286', '128', '马鸣阳', 'JX0519', '男', '', null, '警员', null, 'JX0519', '20', '0', null, null);
INSERT INTO `employee` VALUES ('287', '128', '任佳乐', 'JX0730', '男', '', null, '警员', null, 'JX0730', '20', '0', null, null);
INSERT INTO `employee` VALUES ('288', '128', '何勇', '024824', '男', '', null, '警员', null, '024824', '20', '0', null, null);
INSERT INTO `employee` VALUES ('289', '128', '贾真', 'JX0330', '男', '', null, '警员', null, 'JX0330', '20', '0', null, null);
INSERT INTO `employee` VALUES ('290', '128', '孙瑞', '021134', '男', '', null, '警员', null, '021134', '20', '0', null, null);
INSERT INTO `employee` VALUES ('291', '128', '张慧臣', '023459', '男', '', null, '警员', null, '023459', '20', '0', null, null);
INSERT INTO `employee` VALUES ('292', '128', '王关春', '024129', '男', '', null, '警员', null, '024129', '20', '0', null, null);
INSERT INTO `employee` VALUES ('293', '128', '贾文', '024719', '男', '', null, '警员', null, '024719', '20', '0', null, null);
INSERT INTO `employee` VALUES ('294', '128', '邢亦农', '024745', '男', '', null, '警员', null, '024745', '20', '0', null, null);
INSERT INTO `employee` VALUES ('295', '128', '韩斌', '024747', '男', '', null, '警员', null, '024747', '20', '0', null, null);
INSERT INTO `employee` VALUES ('296', '128', '韩婧', 'JX1025', '男', '', null, '警员', null, 'JX1025', '20', '0', null, null);
INSERT INTO `employee` VALUES ('298', '129', '丁刚', 'JX1085', '男', '', null, '警员', null, 'JX1085', '20', '0', null, null);
INSERT INTO `employee` VALUES ('299', '129', '张宏伟', 'JX1006', '男', '', null, '警员', null, 'JX1006', '20', '0', null, null);
INSERT INTO `employee` VALUES ('300', '129', '李振宇', 'JX1027', '男', '', null, '警员', null, 'JX1027', '20', '0', null, null);
INSERT INTO `employee` VALUES ('301', '129', '徐全有', 'JX1032', '男', '', null, '警员', null, 'JX1032', '20', '0', null, null);
INSERT INTO `employee` VALUES ('302', '129', '王晓宇', 'JX0483', '男', '', null, '警员', null, 'JX0483', '20', '0', null, null);
INSERT INTO `employee` VALUES ('303', '129', '程秀丽', 'JX0502', '男', '', null, '警员', null, 'JX0502', '20', '0', null, null);
INSERT INTO `employee` VALUES ('304', '129', '乔志鹏', 'JX0582', '男', '', null, '警员', null, 'JX0582', '20', '0', null, null);
INSERT INTO `employee` VALUES ('305', '129', '巴音娜', 'JX0667', '男', '', null, '警员', null, 'JX0667', '20', '0', null, null);
INSERT INTO `employee` VALUES ('306', '129', '任建军', '024831', '男', '', null, '警员', null, '024831', '20', '0', null, null);
INSERT INTO `employee` VALUES ('307', '129', '孔飞', '024863', '男', '', null, '警员', null, '024863', '20', '0', null, null);
INSERT INTO `employee` VALUES ('308', '129', '张志平', '021111', '男', '', null, '警员', null, '021111', '20', '0', null, null);
INSERT INTO `employee` VALUES ('309', '129', '田景云', '021136', '男', '', null, '警员', null, '021136', '20', '0', null, null);
INSERT INTO `employee` VALUES ('310', '129', '张子云', '021168', '男', '', null, '警员', null, '021168', '20', '0', null, null);
INSERT INTO `employee` VALUES ('311', '129', '张宏伟', 'JX0116', '男', '', null, '管理', null, 'JX0116', '23', '0', '', '129');
INSERT INTO `employee` VALUES ('312', '129', '刘晓龙', 'JX0480', '男', '', null, '管理', null, 'JX0480', '23', '0', '', '129');
INSERT INTO `employee` VALUES ('313', '129', '张连元', '021270', '男', '', null, '管理', null, '021270', '23', '0', '', '129');
INSERT INTO `employee` VALUES ('314', '129', '孙亚军', '021104', '男', '', null, '警员', null, '021104', '20', '0', null, null);
INSERT INTO `employee` VALUES ('315', '130', '谢继国', '021095', '男', '', null, '管理', null, '021095', '23', '0', '', '130');
INSERT INTO `employee` VALUES ('316', '130', '云欣杰', '020668', '男', '', null, '警员', null, '020668', '20', '0', null, null);
INSERT INTO `employee` VALUES ('317', '130', '孙鹏飞', '000832', '男', '', null, '管理', null, '000832', '23', '0', '', '130');
INSERT INTO `employee` VALUES ('318', '130', '世龙', '000836', '男', '', null, '管理', null, '000836', '23', '0', '', '130');
INSERT INTO `employee` VALUES ('319', '130', '张春乐', 'JX0529', '男', '', null, '管理', null, 'JX0529', '23', '0', '', '130');
INSERT INTO `employee` VALUES ('320', '130', '沈晓刚', '020956', '男', '', null, '警员', null, '020956', '20', '0', null, null);
INSERT INTO `employee` VALUES ('321', '130', '任利民', '021166', '男', '', null, '管理', null, '021166', '23', '0', '', '130');
INSERT INTO `employee` VALUES ('322', '130', '李岩', '023926', '男', '', null, '管理', null, '023926', '23', '0', '', '130');
INSERT INTO `employee` VALUES ('323', '130', '汪洋', '024804', '男', '', null, '警员', null, '024804', '20', '0', null, null);
INSERT INTO `employee` VALUES ('324', '130', '李岩', 'T10164', '男', '', null, '警员', null, 'T10164', '20', '0', null, null);
INSERT INTO `employee` VALUES ('325', '92', '张可成', '021034', '男', '', null, '管理', null, '021034', '22', '0', '', '92,125,124,123,122,121');
INSERT INTO `employee` VALUES ('326', '92', '王洪利', '021999', '男', '', null, '管理', null, '021999', '22', '0', '', '92,125,124,123,122,121');
INSERT INTO `employee` VALUES ('327', '92', '李建国', '021695', '男', '', null, '管理', null, '021695', '22', '0', '', '92,125,124,123,122,121');
INSERT INTO `employee` VALUES ('328', '92', '邢利刚', '021028', '男', '', null, '管理', null, '021028', '22', '0', '', '92,125,124,123,122,121');
INSERT INTO `employee` VALUES ('329', '122', '刘洋', 'JX0597', '男', '', null, '管理', null, 'JX0597', '23', '0', '', '122');
INSERT INTO `employee` VALUES ('330', '122', '赵阿杰', 'JX0415', '男', '', null, '警员', null, 'JX0415', '20', '0', null, null);
INSERT INTO `employee` VALUES ('331', '122', '王建军', 'JX0411', '男', '', null, '警员', null, 'JX0411', '20', '0', null, null);
INSERT INTO `employee` VALUES ('332', '122', '秦政', '024885', '男', '', null, '警员', null, '024885', '20', '0', null, null);
INSERT INTO `employee` VALUES ('333', '122', '邢文广', '024784', '男', '', null, '警员', null, '024784', '20', '0', null, null);
INSERT INTO `employee` VALUES ('334', '122', '刘洋', 'JX0425', '男', '', null, '警员', null, 'JX0425', '20', '0', null, null);
INSERT INTO `employee` VALUES ('335', '122', '夏曰峰', 'JX0422', '男', '', null, '警员', null, 'JX0422', '20', '0', null, null);
INSERT INTO `employee` VALUES ('336', '122', '郭永恩', 'JX0421', '男', '', null, '警员', null, 'JX0421', '20', '0', null, null);
INSERT INTO `employee` VALUES ('337', '122', '吕建国', 'JX0924', '男', '', null, '警员', null, 'JX0924', '20', '0', null, null);
INSERT INTO `employee` VALUES ('338', '122', '李鹏', 'JX0922', '男', '', null, '警员', null, 'JX0922', '20', '0', null, null);
INSERT INTO `employee` VALUES ('339', '122', '刘喆', 'JX0916', '男', '', null, '警员', null, 'JX0916', '20', '0', null, null);
INSERT INTO `employee` VALUES ('340', '122', '杨耀光', '021036', '男', '', null, '警员', null, '021036', '20', '0', null, null);
INSERT INTO `employee` VALUES ('341', '122', '武建华', 'JX1059', '男', '', null, '警员', null, 'JX1059', '20', '0', null, null);
INSERT INTO `employee` VALUES ('342', '123', '刘继伟', 'JX0419', '男', '', null, '警员', null, 'JX0419', '20', '0', null, null);
INSERT INTO `employee` VALUES ('343', '123', '李蓓', 'JX0426', '男', '', null, '警员', null, 'JX0426', '20', '0', null, null);
INSERT INTO `employee` VALUES ('344', '123', '王长献', 'JX0429', '男', '', null, '警员', null, 'JX0429', '20', '0', null, null);
INSERT INTO `employee` VALUES ('345', '123', '何飓', 'JX0636', '男', '', null, '警员', null, 'JX0636', '20', '0', null, null);
INSERT INTO `employee` VALUES ('346', '123', '贾斌', '024861', '男', '', null, '警员', null, '024861', '20', '0', null, null);
INSERT INTO `employee` VALUES ('347', '123', '胡志强', 'JX0410', '男', '', null, '警员', null, 'JX0410', '20', '0', null, null);
INSERT INTO `employee` VALUES ('348', '123', '吕彦斌', 'JX0414', '男', '', null, '警员', null, 'JX0414', '20', '0', null, null);
INSERT INTO `employee` VALUES ('349', '123', '刘会明', '021117', '男', '', null, '警员', null, '021117', '20', '0', null, null);
INSERT INTO `employee` VALUES ('350', '123', '张守元', '024161', '男', '', null, '警员', null, '024161', '20', '0', null, null);
INSERT INTO `employee` VALUES ('351', '124', '杨佳根', 'JX0917', '男', '', null, '警员', null, 'JX0917', '20', '0', null, null);
INSERT INTO `employee` VALUES ('352', '124', '刘小飞', 'JX0923', '男', '', null, '警员', null, 'JX0923', '20', '0', null, null);
INSERT INTO `employee` VALUES ('353', '124', '张仙民', '024847', '男', '', null, '警员', null, '024847', '20', '0', null, null);
INSERT INTO `employee` VALUES ('354', '124', '于飞', 'JX0406', '男', '', null, '警员', null, 'JX0406', '20', '0', null, null);
INSERT INTO `employee` VALUES ('355', '124', '娜仁', 'JX0407', '男', '', null, '警员', null, 'JX0407', '20', '0', null, null);
INSERT INTO `employee` VALUES ('356', '124', '雷雳', 'JX0408', '男', '', null, '警员', null, 'JX0408', '20', '0', null, null);
INSERT INTO `employee` VALUES ('357', '124', '慕军效', '020999', '男', '', null, '警员', null, '020999', '20', '0', null, null);
INSERT INTO `employee` VALUES ('358', '124', '王亮', 'JX0412', '男', '', null, '警员', null, 'JX0412', '20', '0', null, null);
INSERT INTO `employee` VALUES ('359', '124', '武文斌', 'JX0416', '男', '', null, '警员', null, 'JX0416', '20', '0', null, null);
INSERT INTO `employee` VALUES ('360', '124', '马靖杰', 'JX0418', '男', '', null, '警员', null, 'JX0418', '20', '0', null, null);
INSERT INTO `employee` VALUES ('361', '124', '邢海强', '021118', '男', '', null, '警员', null, '021118', '20', '0', null, null);
INSERT INTO `employee` VALUES ('362', '124', '王钢', '020955', '男', '', null, '警员', null, '020955', '20', '0', null, null);
INSERT INTO `employee` VALUES ('363', '124', '安占', 'JX0409', '男', '', null, '警员', null, 'JX0409', '20', '0', null, null);
INSERT INTO `employee` VALUES ('364', '125', '费思坤', 'JX0918', '男', '', null, '警员', null, 'JX0918', '20', '0', null, null);
INSERT INTO `employee` VALUES ('365', '125', '王玉祥', '023463', '男', '', null, '警员', null, '023463', '20', '0', null, null);
INSERT INTO `employee` VALUES ('366', '125', '张若超', '021051', '男', '', null, '警员', null, '021051', '20', '0', null, null);
INSERT INTO `employee` VALUES ('367', '125', '且伟', '000841', '男', '', null, '管理', null, '000841', '23', '0', '', '125');
INSERT INTO `employee` VALUES ('368', '125', '巴雅尔布赫', '000808', '男', '', null, '管理', null, '000808', '23', '0', '', '125');
INSERT INTO `employee` VALUES ('369', '125', '石筱池', '024598', '男', '', null, '警员', null, '024598', '20', '0', null, null);
INSERT INTO `employee` VALUES ('370', '84', '刘义', '021267', '男', '', null, '管理', null, '021267', '22', '0', '', '84,109,108');
INSERT INTO `employee` VALUES ('371', '84', '张永平', '024646', '男', '', null, '管理', null, '024646', '22', '0', '', '84,109,108');
INSERT INTO `employee` VALUES ('372', '84', '一帆', 'JX0717', '男', '', null, '管理', null, 'JX0717', '22', '0', '', '84,109,108');
INSERT INTO `employee` VALUES ('373', '84', '张青', 'JX0719', '男', '', null, '管理', null, 'JX0719', '22', '0', '', '84,109,108');
INSERT INTO `employee` VALUES ('374', '108', '闫宏斌', '021039', '男', '', null, '警员', null, '021039', '20', '0', null, null);
INSERT INTO `employee` VALUES ('375', '108', '温磊', '024806', '男', '', null, '警员', null, '024806', '20', '0', null, null);
INSERT INTO `employee` VALUES ('376', '140', '王硕', 'JX0740', '男', '', null, '警员', null, 'JX0740', '20', '0', null, null);
INSERT INTO `employee` VALUES ('377', '140', '张诗晗', 'JX0724', '男', '', null, '警员', null, 'JX0724', '20', '0', null, null);
INSERT INTO `employee` VALUES ('378', '140', '贾艳', 'JX0692', '男', '', null, '警员', null, 'JX0692', '20', '0', null, null);
INSERT INTO `employee` VALUES ('379', '140', '杨晓婷', 'JX0691', '男', '', null, '警员', null, 'JX0691', '20', '0', null, null);
INSERT INTO `employee` VALUES ('380', '140', '杨倩', 'JX0738', '男', '', null, '警员', null, 'JX0738', '20', '0', null, null);
INSERT INTO `employee` VALUES ('381', '140', '郭小雪', 'JX0737', '男', '', null, '警员', null, 'JX0737', '20', '0', null, null);
INSERT INTO `employee` VALUES ('382', '140', '王倩颖', 'JX0727', '男', '', null, '警员', null, 'JX0727', '20', '0', null, null);
INSERT INTO `employee` VALUES ('383', '140', '郝茹苑', 'JX0739', '男', '', null, '警员', null, 'JX0739', '20', '0', null, null);
INSERT INTO `employee` VALUES ('384', '140', '汪润洁', 'JX0712', '男', '', null, '警员', null, 'JX0712', '20', '0', null, null);
INSERT INTO `employee` VALUES ('385', '140', '张瑶', 'JX1144', '男', '', null, '警员', null, 'JX1144', '20', '0', null, null);
INSERT INTO `employee` VALUES ('386', '140', '王立军', 'JX1063', '男', '', null, '警员', null, 'JX1063', '20', '0', null, null);
INSERT INTO `employee` VALUES ('387', '140', '李梦龙', 'JX1066', '男', '', null, '警员', null, 'JX1066', '20', '0', null, null);
INSERT INTO `employee` VALUES ('388', '140', '史晓蒙', 'JX0744', '男', '', null, '警员', null, 'JX0744', '20', '0', null, null);
INSERT INTO `employee` VALUES ('389', '140', '谢美玲', 'JX0684', '男', '', null, '警员', null, 'JX0684', '20', '0', null, null);
INSERT INTO `employee` VALUES ('390', '140', '柴娜', 'JX0797', '男', '', null, '警员', null, 'JX0797', '20', '0', null, null);
INSERT INTO `employee` VALUES ('391', '140', '王真', 'JX0697', '男', '', null, '警员', null, 'JX0697', '20', '0', null, null);
INSERT INTO `employee` VALUES ('392', '140', '孙美', 'JX0785', '男', '', null, '警员', null, 'JX0785', '20', '0', null, null);
INSERT INTO `employee` VALUES ('393', '140', '蔚文', 'JX0795', '男', '', null, '警员', null, 'JX0795', '20', '0', null, null);
INSERT INTO `employee` VALUES ('394', '140', '王倩', 'JX0683', '男', '', null, '警员', null, 'JX0683', '20', '0', null, null);
INSERT INTO `employee` VALUES ('395', '140', '张诗迪', 'JX0700', '男', '', null, '警员', null, 'JX0700', '20', '0', null, null);
INSERT INTO `employee` VALUES ('396', '140', '张文静', 'JX0689', '男', '', null, '警员', null, 'JX0689', '20', '0', null, null);
INSERT INTO `employee` VALUES ('397', '140', '林彬', 'JX0794', '男', '', null, '警员', null, 'JX0794', '20', '0', null, null);
INSERT INTO `employee` VALUES ('398', '140', '胡瑞霞', 'JX0709', '男', '', null, '警员', null, 'JX0709', '20', '0', null, null);
INSERT INTO `employee` VALUES ('399', '140', '孙蔼斯', 'JX0731', '男', '', null, '警员', null, 'JX0731', '20', '0', null, null);
INSERT INTO `employee` VALUES ('400', '140', '谭菲菲', 'JX0675', '男', '', null, '警员', null, 'JX0675', '20', '0', null, null);
INSERT INTO `employee` VALUES ('401', '139', '杨浩', 'JX1069', '男', '', null, '警员', null, 'JX1069', '20', '0', null, null);
INSERT INTO `employee` VALUES ('402', '139', '胡鹏程', 'JX1072', '男', '', null, '警员', null, 'JX1072', '20', '0', null, null);
INSERT INTO `employee` VALUES ('403', '139', '肖宇', 'JX0766', '男', '', null, '警员', null, 'JX0766', '20', '0', null, null);
INSERT INTO `employee` VALUES ('404', '139', '王超', 'JX0776', '男', '', null, '警员', null, 'JX0776', '20', '0', null, null);
INSERT INTO `employee` VALUES ('405', '139', '杨旭', 'JX0640', '男', '', null, '警员', null, 'JX0640', '20', '0', null, null);
INSERT INTO `employee` VALUES ('406', '139', '安宁', 'JX0793', '男', '', null, '警员', null, 'JX0793', '20', '0', null, null);
INSERT INTO `employee` VALUES ('407', '139', '张晓洁', 'JX0770', '男', '', null, '警员', null, 'JX0770', '20', '0', null, null);
INSERT INTO `employee` VALUES ('408', '139', '艾娅提', 'JX0713', '男', '', null, '警员', null, 'JX0713', '20', '0', null, null);
INSERT INTO `employee` VALUES ('409', '139', '闫雪', '001067', '男', '', null, '警员', null, '001067', '20', '0', null, null);
INSERT INTO `employee` VALUES ('410', '139', '王治国', 'JX0666', '男', '', null, '警员', null, 'JX0666', '20', '0', null, null);
INSERT INTO `employee` VALUES ('411', '139', '王娇杨', 'JX0685', '男', '', null, '警员', null, 'JX0685', '20', '0', null, null);
INSERT INTO `employee` VALUES ('412', '139', '李欣', 'JX0759', '男', '', null, '警员', null, 'JX0759', '20', '0', null, null);
INSERT INTO `employee` VALUES ('413', '139', '孟颖', 'JX0760', '男', '', null, '警员', null, 'JX0760', '20', '0', null, null);
INSERT INTO `employee` VALUES ('414', '139', '曹晓燕', 'JX0762', '男', '', null, '警员', null, 'JX0762', '20', '0', null, null);
INSERT INTO `employee` VALUES ('415', '139', '杨晓蕾', 'JX0764', '男', '', null, '警员', null, 'JX0764', '20', '0', null, null);
INSERT INTO `employee` VALUES ('416', '139', '马婧然', 'JX0767', '男', '', null, '警员', null, 'JX0767', '20', '0', null, null);
INSERT INTO `employee` VALUES ('417', '139', '尹路', 'JX0769', '男', '', null, '警员', null, 'JX0769', '20', '0', null, null);
INSERT INTO `employee` VALUES ('418', '139', '曲薪羽', 'JX0771', '男', '', null, '警员', null, 'JX0771', '20', '0', null, null);
INSERT INTO `employee` VALUES ('419', '139', '范琳', 'JX0774', '男', '', null, '警员', null, 'JX0774', '20', '0', null, null);
INSERT INTO `employee` VALUES ('420', '139', '黄世旭', 'JX0777', '男', '', null, '警员', null, 'JX0777', '20', '0', null, null);
INSERT INTO `employee` VALUES ('421', '139', '赵寒蕊', 'JX0779', '男', '', null, '警员', null, 'JX0779', '20', '0', null, null);
INSERT INTO `employee` VALUES ('422', '139', '张欣', 'JX1060', '男', '', null, '警员', null, 'JX1060', '20', '0', null, null);
INSERT INTO `employee` VALUES ('423', '139', '罗健', 'JX1062', '男', '', null, '警员', null, 'JX1062', '20', '0', null, null);
INSERT INTO `employee` VALUES ('424', '139', '袭阳', 'JX0662', '男', '', null, '警员', null, 'JX0662', '20', '0', null, null);
INSERT INTO `employee` VALUES ('425', '139', '王雪茹', 'JX0665', '男', '', null, '警员', null, 'JX0665', '20', '0', null, null);
INSERT INTO `employee` VALUES ('426', '139', '张方华', 'JX0672', '男', '', null, '警员', null, 'JX0672', '20', '0', null, null);
INSERT INTO `employee` VALUES ('427', '139', '赵鹏飞', 'JX0674', '男', '', null, '警员', null, 'JX0674', '20', '0', null, null);
INSERT INTO `employee` VALUES ('428', '139', '李卉', 'JX0757', '男', '', null, '警员', null, 'JX0757', '20', '0', null, null);
INSERT INTO `employee` VALUES ('429', '139', '黄建萍', 'JX0761', '男', '', null, '警员', null, 'JX0761', '20', '0', null, null);
INSERT INTO `employee` VALUES ('430', '139', '苗波', 'JX0765', '男', '', null, '警员', null, 'JX0765', '20', '0', null, null);
INSERT INTO `employee` VALUES ('431', '139', '朱琳', 'JX0768', '男', '', null, '警员', null, 'JX0768', '20', '0', null, null);
INSERT INTO `employee` VALUES ('432', '139', '王超', 'JX0772', '女', '', null, '警员', null, 'JX0772', '20', '0', null, null);
INSERT INTO `employee` VALUES ('433', '139', '赵蕾', 'JX0775', '女', '', null, '警员', null, 'JX0775', '20', '0', null, null);
INSERT INTO `employee` VALUES ('434', '139', '王路阳', 'JX0783', '男', '', null, '警员', null, 'JX0783', '20', '0', null, null);
INSERT INTO `employee` VALUES ('435', '139', '盛伟', 'JX1067', '男', '', null, '警员', null, 'JX1067', '20', '0', null, null);
INSERT INTO `employee` VALUES ('436', '139', '董薇', 'JX1086', '男', '', null, '警员', null, 'JX1086', '20', '0', null, null);
INSERT INTO `employee` VALUES ('437', '139', '韩伟', 'JX0763', '男', '', null, '警员', null, 'JX0763', '20', '0', null, null);
INSERT INTO `employee` VALUES ('438', '139', '武跃庭', 'JX0773', '男', '', null, '警员', null, 'JX0773', '20', '0', null, null);
INSERT INTO `employee` VALUES ('439', '139', '毕其格', 'JX0657', '男', '', null, '警员', null, 'JX0657', '20', '0', null, null);
INSERT INTO `employee` VALUES ('440', '139', '陈晨', 'JX0656', '男', '', null, '警员', null, 'JX0656', '20', '0', null, null);
INSERT INTO `employee` VALUES ('441', '139', '邵晶晶', 'JX0642', '男', '', null, '警员', null, 'JX0642', '20', '0', null, null);
INSERT INTO `employee` VALUES ('442', '139', '谢照伟', 'JX0643', '男', '', null, '警员', null, 'JX0643', '20', '0', null, null);
INSERT INTO `employee` VALUES ('443', '139', '于阿拉塔', 'JX0644', '男', '', null, '警员', null, 'JX0644', '20', '0', null, null);
INSERT INTO `employee` VALUES ('444', '139', '杜丽君', 'JX0645', '男', '', null, '警员', null, 'JX0645', '20', '0', null, null);
INSERT INTO `employee` VALUES ('445', '139', '葛伟', 'JX0646', '男', '', null, '警员', null, 'JX0646', '20', '0', null, null);
INSERT INTO `employee` VALUES ('446', '139', '杨馥毓', 'JX0647', '男', '', null, '警员', null, 'JX0647', '20', '0', null, null);
INSERT INTO `employee` VALUES ('447', '139', '尹一琦', 'JX0649', '男', '', null, '警员', null, 'JX0649', '20', '0', null, null);
INSERT INTO `employee` VALUES ('448', '139', '乌日娜', 'JX0650', '男', '', null, '警员', null, 'JX0650', '20', '0', null, null);
INSERT INTO `employee` VALUES ('449', '139', '许佳静', 'JX0651', '男', '', null, '警员', null, 'JX0651', '20', '0', null, null);
INSERT INTO `employee` VALUES ('450', '139', '李璐瑶', 'JX0652', '男', '', null, '警员', null, 'JX0652', '20', '0', null, null);
INSERT INTO `employee` VALUES ('451', '82', '郭和义', '020751', '男', '', null, '管理', null, '020751', '22', '0', '', '82,113,112,111,110');
INSERT INTO `employee` VALUES ('452', '82', '任丽萍', '020831', '男', '', null, '管理', null, '020831', '22', '0', '', '82,113,112,111,110');
INSERT INTO `employee` VALUES ('453', '82', '郄亮', '021009', '男', '', null, '管理', null, '021009', '22', '0', '', '82,113,112,111,110');
INSERT INTO `employee` VALUES ('454', '82', '沈成利', '021273', '男', '', null, '管理', null, '021273', '22', '0', '', '82,113,112,111,110');
INSERT INTO `employee` VALUES ('455', '111', '刘睿', '024803', '男', '', null, '警员', null, '024803', '20', '0', null, null);
INSERT INTO `employee` VALUES ('456', '111', '侯毅', '024857', '男', '', null, '警员', null, '024857', '20', '0', null, null);
INSERT INTO `employee` VALUES ('457', '112', '袁永生', '021345', '男', '', null, '管理', null, '021345', '23', '0', '', '112');
INSERT INTO `employee` VALUES ('458', '112', '化树平', '024825', '男', '', null, '警员', null, '024825', '20', '0', null, null);
INSERT INTO `employee` VALUES ('459', '112', '李松波', '024872', '男', '', null, '警员', null, '024872', '20', '0', null, null);
INSERT INTO `employee` VALUES ('460', '112', '李杰', '024929', '男', '', null, '警员', null, '024929', '20', '0', null, null);
INSERT INTO `employee` VALUES ('461', '112', '陈旭', '025022', '男', '', null, '警员', null, '025022', '20', '0', null, null);
INSERT INTO `employee` VALUES ('462', '112', '孙立新', '021135', '男', '', null, '警员', null, '021135', '20', '0', null, null);
INSERT INTO `employee` VALUES ('463', '112', '吕强', '021198', '男', '', null, '警员', null, '021198', '20', '0', null, null);
INSERT INTO `employee` VALUES ('464', '112', '杨建军', '021242', '男', '', null, '警员', null, '021242', '20', '0', null, null);
INSERT INTO `employee` VALUES ('465', '112', '刘金柱', '021739', '男', '', null, '警员', null, '021739', '20', '0', null, null);
INSERT INTO `employee` VALUES ('466', '112', '张利胜', '021908', '男', '', null, '警员', null, '021908', '20', '0', null, null);
INSERT INTO `employee` VALUES ('467', '112', '张小平', '023494', '男', '', null, '警员', null, '023494', '20', '0', null, null);
INSERT INTO `employee` VALUES ('468', '112', '陆卫宏', '023708', '男', '', null, '警员', null, '023708', '20', '0', null, null);
INSERT INTO `employee` VALUES ('469', '112', '许刚', '024623', '男', '', null, '警员', null, '024623', '20', '0', null, null);
INSERT INTO `employee` VALUES ('470', '112', '葛爱钦', '023950', '男', '', null, '警员', null, '023950', '20', '0', null, null);
INSERT INTO `employee` VALUES ('471', '113', '王建军管理', '123456', '男', '', null, '管理', null, '123456', '23', '0', '', '113,185,184,183');
INSERT INTO `employee` VALUES ('472', '113', '马君', '021092', '男', '', null, '警员', null, '021092', '20', '0', null, null);
INSERT INTO `employee` VALUES ('473', '113', '周德根', '024811', '男', '', null, '警员', null, '024811', '20', '0', null, null);
INSERT INTO `employee` VALUES ('474', '113', '布赫', '024813', '男', '', null, '警员', null, '024813', '20', '0', null, null);
INSERT INTO `employee` VALUES ('475', '113', '王志华', '024838', '男', '', null, '警员', null, '024838', '20', '0', null, null);
INSERT INTO `employee` VALUES ('476', '113', '张军', '024905', '男', '', null, '警员', null, '024905', '20', '0', null, null);
INSERT INTO `employee` VALUES ('477', '113', '赵香云', '024909', '男', '', null, '警员', null, '024909', '20', '0', null, null);
INSERT INTO `employee` VALUES ('478', '113', '李风波', '024930', '男', '', null, '警员', null, '024930', '20', '0', null, null);
INSERT INTO `employee` VALUES ('479', '113', '刘义', '024933', '男', '', null, '警员', null, '024933', '20', '0', null, null);
INSERT INTO `employee` VALUES ('480', '113', '肖燕', '024949', '男', '', null, '警员', null, '024949', '20', '0', null, null);
INSERT INTO `employee` VALUES ('481', '113', '邢鹏飞', '024967', '男', '', null, '警员', null, '024967', '20', '0', null, null);
INSERT INTO `employee` VALUES ('482', '113', '赵雁杰', '025032', '男', '', null, '警员', null, '025032', '20', '0', null, null);
INSERT INTO `employee` VALUES ('483', '113', '杨磊', '021129', '男', '', null, '警员', null, '021129', '20', '0', null, null);
INSERT INTO `employee` VALUES ('484', '113', '杨圆虹', '021152', '男', '', null, '警员', null, '021152', '20', '0', null, null);
INSERT INTO `employee` VALUES ('485', '113', '童慧明', '021161', '男', '', null, '警员', null, '021161', '20', '0', null, null);
INSERT INTO `employee` VALUES ('486', '113', '刘俊生', '021184', '男', '', null, '警员', null, '021184', '20', '0', null, null);
INSERT INTO `employee` VALUES ('487', '113', '胡海荣', '021244', '男', '', null, '警员', null, '021244', '20', '0', null, null);
INSERT INTO `employee` VALUES ('488', '113', '郭志远', '022988', '男', '', null, '警员', null, '022988', '20', '0', null, null);
INSERT INTO `employee` VALUES ('489', '113', '武连旺', '023545', '男', '', null, '警员', null, '023545', '20', '0', null, null);
INSERT INTO `employee` VALUES ('490', '113', '焦志辉', '023949', '男', '', null, '警员', null, '023949', '20', '0', null, null);
INSERT INTO `employee` VALUES ('491', '113', '刘勇', '024726', '男', '', null, '警员', null, '024726', '20', '0', null, null);
INSERT INTO `employee` VALUES ('492', '113', '刘宝胜', '024760', '男', '', null, '警员', null, '024760', '20', '0', null, null);
INSERT INTO `employee` VALUES ('493', '113', '房邵伟', '020635', '男', '', null, '警员', null, '020635', '20', '0', null, null);
INSERT INTO `employee` VALUES ('494', '113', '许志刚', '020695', '男', '', null, '警员', null, '020695', '20', '0', null, null);
INSERT INTO `employee` VALUES ('495', '113', '白海英', '020703', '男', '', null, '警员', null, '020703', '20', '0', null, null);
INSERT INTO `employee` VALUES ('496', '113', '王建军', '020941', '男', '', null, '管理', null, '020941', '23', '0', '', '113,185,184,183');
INSERT INTO `employee` VALUES ('497', '113', '赵冰', '024087', '男', '', null, '管理', null, '024087', '23', '0', '', '113,185,184,183');
INSERT INTO `employee` VALUES ('498', '81', '赵永斌', '020994', '男', '', null, '管理', null, '020994', '22', '0', '', '81,120,119,118,117,116,115,114');
INSERT INTO `employee` VALUES ('499', '81', '云允廷', '020253', '男', '', null, '管理', null, '020253', '22', '0', '', '81,120,119,118,117,116,115,114');
INSERT INTO `employee` VALUES ('500', '81', '高刚', '020902', '男', '', null, '管理', null, '020902', '22', '0', '', '81,120,119,118,117,116,115,114');
INSERT INTO `employee` VALUES ('501', '81', '宋建刚', '021263', '男', '', null, '管理', null, '021263', '22', '0', '', '81,120,119,118,117,116,115,114');
INSERT INTO `employee` VALUES ('502', '81', '马利军', '024130', '男', '', null, '警员', null, '024130', '20', '0', null, null);
INSERT INTO `employee` VALUES ('503', '81', '陈磊', '021052', '男', '', null, '管理', null, '021052', '22', '0', '', '81,120,119,118,117,116,115,114');
INSERT INTO `employee` VALUES ('504', '116', '李春军', 'JX0572', '男', '', null, '管理', null, 'JX0572', '23', '0', '', '116');
INSERT INTO `employee` VALUES ('505', '116', '杨睿', 'JX1049', '男', '', null, '警员', null, 'JX1049', '20', '0', null, null);
INSERT INTO `employee` VALUES ('506', '116', '高扬', 'JX1089', '男', '', null, '警员', null, 'JX1089', '20', '0', null, null);
INSERT INTO `employee` VALUES ('507', '116', '贾威', 'JX1095', '男', '', null, '警员', null, 'JX1095', '20', '0', null, null);
INSERT INTO `employee` VALUES ('508', '116', '李铁真', 'JX1102', '男', '', null, '警员', null, 'JX1102', '20', '0', null, null);
INSERT INTO `employee` VALUES ('509', '116', '王皓誉', 'JX1122', '男', '', null, '警员', null, 'JX1122', '20', '0', null, null);
INSERT INTO `employee` VALUES ('510', '116', '虞震', 'JX1140', '男', '', null, '警员', null, 'JX1140', '20', '0', null, null);
INSERT INTO `employee` VALUES ('511', '116', '王守金', '020986', '男', '', null, '警员', null, '020986', '20', '0', null, null);
INSERT INTO `employee` VALUES ('512', '116', '王康', 'JX0784', '男', '', null, '警员', null, 'JX0784', '20', '0', null, null);
INSERT INTO `employee` VALUES ('513', '116', '李强', 'JX0592', '男', '', null, '警员', null, 'JX0592', '20', '0', null, null);
INSERT INTO `employee` VALUES ('514', '116', '张彦波', '024908', '男', '', null, '警员', null, '024908', '20', '0', null, null);
INSERT INTO `employee` VALUES ('515', '116', '樊嘉琪', '024922', '男', '', null, '警员', null, '024922', '20', '0', null, null);
INSERT INTO `employee` VALUES ('516', '116', '温永胜', '021125', '男', '', null, '警员', null, '021125', '20', '0', null, null);
INSERT INTO `employee` VALUES ('517', '116', '刘龙', 'JX1153', '男', '', null, '警员', null, 'JX1153', '20', '0', null, null);
INSERT INTO `employee` VALUES ('518', '117', '陈政含', 'JX1042', '男', '', null, '警员', null, 'JX1042', '20', '0', null, null);
INSERT INTO `employee` VALUES ('519', '117', '张永祥', 'JX0570', '男', '', null, '警员', null, 'JX0570', '20', '0', null, null);
INSERT INTO `employee` VALUES ('520', '117', '程超', 'JX0574', '男', '', null, '警员', null, 'JX0574', '20', '0', null, null);
INSERT INTO `employee` VALUES ('521', '117', '李磊', 'JX0575', '男', '', null, '警员', null, 'JX0575', '20', '0', null, null);
INSERT INTO `employee` VALUES ('522', '117', '王敏', 'JX0585', '男', '', null, '警员', null, 'JX0585', '20', '0', null, null);
INSERT INTO `employee` VALUES ('523', '117', '王伟明', 'JX0595', '男', '', null, '警员', null, 'JX0595', '20', '0', null, null);
INSERT INTO `employee` VALUES ('524', '117', '武建业', '021055', '男', '', null, '警员', null, '021055', '20', '0', null, null);
INSERT INTO `employee` VALUES ('525', '117', '裴少华', '024883', '男', '', null, '警员', null, '024883', '20', '0', null, null);
INSERT INTO `employee` VALUES ('526', '117', '张剑锋', '023481', '男', '', null, '警员', null, '023481', '20', '0', null, null);
INSERT INTO `employee` VALUES ('527', '117', '达布拉', '023504', '男', '', null, '警员', null, '023504', '20', '0', null, null);
INSERT INTO `employee` VALUES ('528', '117', '宋铁盛', '020674', '男', '', null, '警员', null, '020674', '20', '0', null, null);
INSERT INTO `employee` VALUES ('529', '117', '王荣', '020921', '男', '', null, '警员', null, '020921', '20', '0', null, null);
INSERT INTO `employee` VALUES ('530', '118', '张锐琨', 'JX1288', '男', '', null, '管理', null, 'JX1288', '23', '0', '', '118');
INSERT INTO `employee` VALUES ('531', '118', '赵刚', '020968', '男', '', null, '警员', null, '020968', '20', '0', null, null);
INSERT INTO `employee` VALUES ('532', '118', '王超', 'JX1119', '男', '', null, '警员', null, 'JX1119', '20', '0', null, null);
INSERT INTO `employee` VALUES ('533', '118', '李小平', '023724', '男', '', null, '管理', null, '023724', '23', '0', '', '118');
INSERT INTO `employee` VALUES ('534', '118', '祝海', '021068', '男', '', null, '管理', null, '021068', '23', '0', '', '118');
INSERT INTO `employee` VALUES ('535', '118', '高彬', '024755', '男', '', null, '管理', null, '024755', '23', '0', '', '118');
INSERT INTO `employee` VALUES ('536', '118', '胡强国', '023598', '男', '', null, '管理', null, '023598', '23', '0', '', '118');
INSERT INTO `employee` VALUES ('537', '118', '张守荣', 'JX1053', '男', '', null, '管理', null, 'JX1053', '23', '0', '', '118');
INSERT INTO `employee` VALUES ('538', '118', '曹斌', '023727', '男', '', null, '管理', null, '023727', '23', '0', '', '118');
INSERT INTO `employee` VALUES ('539', '118', '边城', 'JX1041', '男', '', null, '警员', null, 'JX1041', '20', '0', null, null);
INSERT INTO `employee` VALUES ('540', '118', '宋宜达', 'JX0578', '男', '', null, '警员', null, 'JX0578', '20', '0', null, null);
INSERT INTO `employee` VALUES ('541', '118', '郭文天', 'JX0633', '男', '', null, '警员', null, 'JX0633', '20', '0', null, null);
INSERT INTO `employee` VALUES ('542', '118', '许波', '024785', '男', '', null, '警员', null, '024785', '20', '0', null, null);
INSERT INTO `employee` VALUES ('543', '118', '张敏', '024845', '男', '', null, '警员', null, '024845', '20', '0', null, null);
INSERT INTO `employee` VALUES ('544', '118', '刘永平', '024939', '男', '', null, '警员', null, '024939', '20', '0', null, null);
INSERT INTO `employee` VALUES ('545', '118', '杨文强', '24903', '男', '', null, '警员', null, '24903', '20', '0', null, null);
INSERT INTO `employee` VALUES ('546', '118', '王志', 'JX0211', '男', '', null, '警员', null, 'JX0211', '20', '0', null, null);
INSERT INTO `employee` VALUES ('547', '118', '刘新法', '024727', '男', '', null, '警员', null, '024727', '20', '0', null, null);
INSERT INTO `employee` VALUES ('548', '118', '李涛', 'JX1101', '男', '', null, '警员', null, 'JX1101', '20', '0', null, null);
INSERT INTO `employee` VALUES ('549', '119', '张小平', '024088', '男', '', null, '管理', null, '024088', '23', '0', '', '119');
INSERT INTO `employee` VALUES ('550', '119', '黄海生', '021067', '男', '', null, '警员', null, '021067', '20', '0', null, null);
INSERT INTO `employee` VALUES ('551', '119', '尹茂盛', 'JX0586', '男', '', null, '管理', null, 'JX0586', '23', '0', '', '119');
INSERT INTO `employee` VALUES ('552', '119', '莫晨雨', 'JX1114', '男', '', null, '警员', null, 'JX1114', '20', '0', null, null);
INSERT INTO `employee` VALUES ('553', '119', '孙平', '001087', '男', '', null, '管理', null, '001087', '23', '0', '', '119');
INSERT INTO `employee` VALUES ('554', '119', '温都苏', 'JX0593', '男', '', null, '管理', null, 'JX0593', '23', '0', '', '119');
INSERT INTO `employee` VALUES ('555', '119', '张春明', 'JX1044', '男', '', null, '警员', null, 'JX1044', '20', '0', null, null);
INSERT INTO `employee` VALUES ('556', '119', '张岩', 'JX0568', '男', '', null, '警员', null, 'JX0568', '20', '0', null, null);
INSERT INTO `employee` VALUES ('557', '119', '马蓉', 'JX0569', '男', '', null, '警员', null, 'JX0569', '20', '0', null, null);
INSERT INTO `employee` VALUES ('558', '119', '李磊', 'JX0576', '男', '', null, '警员', null, 'JX0576', '20', '0', null, null);
INSERT INTO `employee` VALUES ('559', '119', '黄经纬', 'JX0594', '男', '', null, '警员', null, 'JX0594', '20', '0', null, null);
INSERT INTO `employee` VALUES ('560', '119', '王新民', '024764', '男', '', null, '警员', null, '024764', '20', '0', null, null);
INSERT INTO `employee` VALUES ('561', '119', '王晓燕', '024947', '男', '', null, '警员', null, '024947', '20', '0', null, null);
INSERT INTO `employee` VALUES ('562', '119', '殷林', '024995', '男', '', null, '警员', null, '024995', '20', '0', null, null);
INSERT INTO `employee` VALUES ('563', '119', '王玉明', '021674', '男', '', null, '警员', null, '021674', '20', '0', null, null);
INSERT INTO `employee` VALUES ('564', '119', '于力', '024027', '男', '', null, '警员', null, '024027', '20', '0', null, null);
INSERT INTO `employee` VALUES ('565', '119', '于力', '024047', '男', '', null, '警员', null, '024047', '20', '0', null, null);
INSERT INTO `employee` VALUES ('566', '119', '桂宏刚', '020122', '男', '', null, '警员', null, '020122', '20', '0', null, null);
INSERT INTO `employee` VALUES ('567', '119', '闫杰', '020886', '男', '', null, '警员', null, '020886', '20', '0', null, null);
INSERT INTO `employee` VALUES ('568', '119', '王建合', '021190', '男', '', null, '管理', null, '021190', '23', '0', '', '119');
INSERT INTO `employee` VALUES ('569', '120', '厍建东', '023465', '男', '', null, '管理', null, '023465', '23', '0', '', '120');
INSERT INTO `employee` VALUES ('570', '120', '刘强', '000840', '男', '', null, '管理', null, '000840', '23', '0', '', '120');
INSERT INTO `employee` VALUES ('571', '120', '刘占军', '000839', '男', '', null, '管理', null, '000839', '23', '0', '', '120');
INSERT INTO `employee` VALUES ('572', '120', '苏瑜', 'JX1055', '男', '', null, '警员', null, 'JX1055', '20', '0', null, null);
INSERT INTO `employee` VALUES ('573', '120', '王冠方', 'JX1121', '男', '', null, '警员', null, 'JX1121', '20', '0', null, null);
INSERT INTO `employee` VALUES ('574', '120', '胡晓宇', '021194', '男', '', null, '管理', null, '021194', '23', '0', '', '120');
INSERT INTO `employee` VALUES ('575', '120', '吕永全', '023541', '男', '', null, '警员', null, '023541', '20', '0', null, null);
INSERT INTO `employee` VALUES ('576', '120', '安德稳', '021069', '男', '', null, '管理', null, '021069', '23', '0', '', '120');
INSERT INTO `employee` VALUES ('577', '120', '栗博', 'JX1045', '男', '', null, '警员', null, 'JX1045', '20', '0', null, null);
INSERT INTO `employee` VALUES ('578', '120', '李波', 'JX1048', '男', '', null, '警员', null, 'JX1048', '20', '0', null, null);
INSERT INTO `employee` VALUES ('579', '120', '李昊峰', 'JX0735', '男', '', null, '警员', null, 'JX0735', '20', '0', null, null);
INSERT INTO `employee` VALUES ('580', '120', '张宏军', '024809', '男', '', null, '警员', null, '024809', '20', '0', null, null);
INSERT INTO `employee` VALUES ('581', '120', '许鑫', '024968', '男', '', null, '警员', null, '024968', '20', '0', null, null);
INSERT INTO `employee` VALUES ('582', '120', '屠明', '021053', '男', '', null, '警员', null, '021053', '20', '0', null, null);
INSERT INTO `employee` VALUES ('583', '107', '张磊', '021010', '男', '', null, '管理', null, '021010', '23', '0', '', '107');
INSERT INTO `employee` VALUES ('584', '107', '赵东', '020697', '男', '', null, '管理', null, '020697', '23', '0', '', '107');
INSERT INTO `employee` VALUES ('585', '107', '杜慧军', 'JX0444', '男', '', null, '管理', null, 'JX0444', '23', '0', '', '107');
INSERT INTO `employee` VALUES ('586', '107', '吴斌', '021966', '男', '', null, '管理', null, '021966', '23', '0', '', '107');
INSERT INTO `employee` VALUES ('587', '107', '任平均', '023540', '男', '', null, '管理', null, '023540', '23', '0', '', '107');
INSERT INTO `employee` VALUES ('588', '107', '刘耀春', '023837', '男', '', null, '管理', null, '023837', '23', '0', '', '107');
INSERT INTO `employee` VALUES ('589', '107', '燕永飞', '001009', '男', '', null, '管理', null, '001009', '23', '0', '', '107');
INSERT INTO `employee` VALUES ('590', '107', '姚尧', 'JX0561', '男', '', null, '管理', null, 'JX0561', '23', '0', '', '107');
INSERT INTO `employee` VALUES ('591', '107', '焦志涛', 'JX0565', '男', '', null, '警员', null, 'JX0565', '20', '0', null, null);
INSERT INTO `employee` VALUES ('592', '107', '赵振铎', 'JX1038', '男', '', null, '警员', null, 'JX1038', '20', '0', null, null);
INSERT INTO `employee` VALUES ('593', '107', '周文龙', 'JX1039', '男', '', null, '警员', null, 'JX1039', '20', '0', null, null);
INSERT INTO `employee` VALUES ('594', '114', '杨大年', '020711', '男', '', null, '管理', null, '020711', '23', '0', '', '114');
INSERT INTO `employee` VALUES ('595', '114', '孟繁强', '020938', '男', '', null, '管理', null, '020938', '23', '0', '', '114');
INSERT INTO `employee` VALUES ('596', '114', '焦文翔', 'JX1247', '男', '', null, '警员', null, 'JX1247', '20', '0', null, null);
INSERT INTO `employee` VALUES ('597', '114', '王庆杰', '021344', '男', '', null, '警员', null, '021344', '20', '0', null, null);
INSERT INTO `employee` VALUES ('598', '114', '杨国强', '024026', '男', '', null, '警员', null, '024026', '20', '0', null, null);
INSERT INTO `employee` VALUES ('599', '114', '王峰', 'JX0500', '男', '', null, '警员', null, 'JX0500', '20', '0', null, null);
INSERT INTO `employee` VALUES ('600', '114', '张建斌', '020995', '男', '', null, '警员', null, '020995', '20', '0', null, null);
INSERT INTO `employee` VALUES ('601', '114', '王浩鹏', 'JX1194', '男', '', null, '警员', null, 'JX1194', '20', '0', null, null);
INSERT INTO `employee` VALUES ('602', '114', '常超', 'JX0992', '男', '', null, '警员', null, 'JX0992', '20', '0', null, null);
INSERT INTO `employee` VALUES ('603', '114', '赵永来', 'JX0577', '男', '', null, '警员', null, 'JX0577', '20', '0', null, null);
INSERT INTO `employee` VALUES ('604', '164', '权瑞宝', '021064', '男', '', null, '管理', null, '021064', '23', '0', '', '164');
INSERT INTO `employee` VALUES ('605', '164', '樊鹏举', '021033', '男', '', null, '管理', null, '021033', '23', '0', '', '164');
INSERT INTO `employee` VALUES ('606', '164', '樊利生', '021070', '男', '', null, '管理', null, '021070', '23', '0', '', '164');
INSERT INTO `employee` VALUES ('607', '164', '郭永强', 'JX0261', '男', '', null, '管理', null, 'JX0261', '23', '0', '', '164');
INSERT INTO `employee` VALUES ('608', '164', '巴图', 'JX0265', '男', '', null, '警员', null, 'JX0265', '20', '0', null, null);
INSERT INTO `employee` VALUES ('609', '164', '满意', 'JX0241', '男', '', null, '警员', null, 'JX0241', '20', '0', null, null);
INSERT INTO `employee` VALUES ('610', '164', '史佐', '021075', '男', '', null, '警员', null, '021075', '20', '0', null, null);
INSERT INTO `employee` VALUES ('611', '164', '罗保全', '021226', '男', '', null, '警员', null, '021226', '20', '0', null, null);
INSERT INTO `employee` VALUES ('612', '164', '徐宝基', '024019', '男', '', null, '警员', null, '024019', '20', '0', null, null);
INSERT INTO `employee` VALUES ('613', '164', '陈庆林', '024024', '男', '', null, '警员', null, '024024', '20', '0', null, null);
INSERT INTO `employee` VALUES ('614', '164', '魏杰', '024979', '男', '', null, '警员', null, '024979', '20', '0', null, null);
INSERT INTO `employee` VALUES ('615', '164', '刘伟', '024996', '男', '', null, '警员', null, '024996', '20', '0', null, null);
INSERT INTO `employee` VALUES ('616', '80', '杨鸿', '021007', '男', '', null, '管理', null, '021007', '22', '0', '', '80,107,106,105,104,103,102,101');
INSERT INTO `employee` VALUES ('617', '80', '刘晓东', '021059', '男', '', null, '管理', null, '021059', '22', '0', '', '80,107,106,105,104,103,102,101');
INSERT INTO `employee` VALUES ('618', '80', '孔令杰', '020898', '男', '', null, '管理', null, '020898', '22', '0', '', '80,107,106,105,104,103,102,101');
INSERT INTO `employee` VALUES ('619', '80', '朱胜龙', '023518', '男', '', null, '管理', null, '023518', '22', '0', '', '80,107,106,105,104,103,102,101');
INSERT INTO `employee` VALUES ('620', '80', '蒋保国', '020981', '男', '', null, '管理', null, '020981', '22', '0', '', '80,107,106,105,104,103,102,101');
INSERT INTO `employee` VALUES ('621', '102', '胡格吉勒图', '020975', '男', '', null, '管理', null, '020975', '23', '0', '', '102');
INSERT INTO `employee` VALUES ('622', '102', '袁海峰', '021880', '男', '', null, '警员', null, '021880', '20', '0', null, null);
INSERT INTO `employee` VALUES ('623', '102', '张河刚', '023718', '男', '', null, '警员', null, '023718', '20', '0', null, null);
INSERT INTO `employee` VALUES ('624', '102', '郝国栋', '024797', '男', '', null, '警员', null, '024797', '20', '0', null, null);
INSERT INTO `employee` VALUES ('625', '102', '武晓钢', '024839', '男', '', null, '警员', null, '024839', '20', '0', null, null);
INSERT INTO `employee` VALUES ('626', '102', '张荣', 'JX0435', '男', '', null, '警员', null, 'JX0435', '20', '0', null, null);
INSERT INTO `employee` VALUES ('627', '102', '段海威', 'JX0547', '男', '', null, '警员', null, 'JX0547', '20', '0', null, null);
INSERT INTO `employee` VALUES ('628', '102', '郭同旭', 'JX0548', '男', '', null, '警员', null, 'JX0548', '20', '0', null, null);
INSERT INTO `employee` VALUES ('629', '102', '魏强', 'JX0552', '男', '', null, '警员', null, 'JX0552', '20', '0', null, null);
INSERT INTO `employee` VALUES ('630', '102', '郝璐璐', 'JX0553', '男', '', null, '警员', null, 'JX0553', '20', '0', null, null);
INSERT INTO `employee` VALUES ('631', '102', '谢博文', 'JX0554', '男', '', null, '警员', null, 'JX0554', '20', '0', null, null);
INSERT INTO `employee` VALUES ('632', '102', '李柏江', 'JX0563', '男', '', null, '警员', null, 'JX0563', '20', '0', null, null);
INSERT INTO `employee` VALUES ('633', '102', '吴红艳', 'JX0604', '男', '', null, '警员', null, 'JX0604', '20', '0', null, null);
INSERT INTO `employee` VALUES ('634', '102', '贺文', 'JX1073', '男', '', null, '警员', null, 'JX1073', '20', '0', null, null);
INSERT INTO `employee` VALUES ('635', '103', '鲍强', 'JX0360', '男', '', null, '管理', null, 'JX0360', '23', '0', '', '103');
INSERT INTO `employee` VALUES ('636', '103', '赵永忠', '021014', '男', '', null, '警员', null, '021014', '20', '0', null, null);
INSERT INTO `employee` VALUES ('637', '103', '李海波', '024197', '男', '', null, '警员', null, '024197', '20', '0', null, null);
INSERT INTO `employee` VALUES ('638', '103', '贾志强', '024721', '男', '', null, '警员', null, '024721', '20', '0', null, null);
INSERT INTO `employee` VALUES ('639', '103', '郜飞', '024961', '男', '', null, '警员', null, '024961', '20', '0', null, null);
INSERT INTO `employee` VALUES ('640', '103', '李庆林', '024999', '男', '', null, '警员', null, '024999', '20', '0', null, null);
INSERT INTO `employee` VALUES ('641', '103', '葛庆飞', 'JX0432', '男', '', null, '警员', null, 'JX0432', '20', '0', null, null);
INSERT INTO `employee` VALUES ('642', '103', '赵勇', 'JX0545', '男', '', null, '警员', null, 'JX0545', '20', '0', null, null);
INSERT INTO `employee` VALUES ('643', '103', '王娟', 'JX0558', '男', '', null, '警员', null, 'JX0558', '20', '0', null, null);
INSERT INTO `employee` VALUES ('644', '103', '刘治国', 'JX0648', '男', '', null, '警员', null, 'JX0648', '20', '0', null, null);
INSERT INTO `employee` VALUES ('645', '103', '陈诚', 'JX0695', '男', '', null, '警员', null, 'JX0695', '20', '0', null, null);
INSERT INTO `employee` VALUES ('646', '103', '云梦瑶', 'JX0799', '男', '', null, '警员', null, 'JX0799', '20', '0', null, null);
INSERT INTO `employee` VALUES ('647', '103', '任学枫', 'JX1185', '男', '', null, '警员', null, 'JX1185', '20', '0', null, null);
INSERT INTO `employee` VALUES ('648', '103', '郝冀昆', 'JX1186', '男', '', null, '警员', null, 'JX1186', '20', '0', null, null);
INSERT INTO `employee` VALUES ('649', '103', '潘奕辰', 'JX1190', '男', '', null, '警员', null, 'JX1190', '20', '0', null, null);

-- ----------------------------
-- Table structure for `ftp_dir`
-- ----------------------------
DROP TABLE IF EXISTS `ftp_dir`;
CREATE TABLE `ftp_dir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ftp_ip` varchar(20) NOT NULL DEFAULT '127.0.0.1' COMMENT 'ftp服务器ip',
  `ftp_port` int(11) NOT NULL DEFAULT '21',
  `ftp_user` varchar(20) NOT NULL DEFAULT 'dh',
  `ftp_pwd` varchar(20) NOT NULL DEFAULT '123456',
  `web_path` varchar(128) NOT NULL DEFAULT '/pe_file/' COMMENT '站点下数据目录,格式:/pe_file<1位或0位盘符>,如/pe_fileD；',
  `ftp_path` varchar(128) NOT NULL COMMENT '绝对路径.FTP数据上传到该目录',
  `is_ftp_dir` int(1) NOT NULL DEFAULT '0' COMMENT '0:不是;1:是',
  `ftp_lock` int(1) NOT NULL DEFAULT '0' COMMENT '0:可切换目录；1：锁定FTP用户的目录；',
  `enable` int(1) NOT NULL DEFAULT '0' COMMENT '0:不启用ftp;1:启用ftp',
  `symbol` varchar(20) DEFAULT NULL COMMENT 'ftp路径所在的盘符',
  `total` double(20,0) DEFAULT '0' COMMENT 'ftp目录的空间大小',
  `free` double(20,0) DEFAULT '0' COMMENT 'ftp目录的剩余空间大小(M)',
  `usage` double(6,2) DEFAULT '0.00' COMMENT 'ftp目录的空间使用率',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_web_path` (`web_path`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ftp_dir
-- ----------------------------
INSERT INTO `ftp_dir` VALUES ('1', '192.168.0.26', '621', 'dh', '123456', '/pe_file/', 'D:\\Workspace\\pe_file\\', '0', '0', '0', 'D:\\', '199999', '188578', '5.00');
INSERT INTO `ftp_dir` VALUES ('2', '192.168.0.26', '621', 'dh', '123456', '/pe_fileI/', 'I:\\', '1', '0', '0', 'I:\\', '0', '0', '0.00');
INSERT INTO `ftp_dir` VALUES ('3', '192.168.0.26', '621', 'dh', '123456', '/pe_fileJ/', 'J:\\', '1', '0', '0', 'J:\\', '0', '0', '0.00');
INSERT INTO `ftp_dir` VALUES ('4', '192.168.0.26', '621', 'dh', '123456', '/pe_fileK/', 'K:\\', '1', '0', '0', 'K:\\', '0', '0', '0.00');
INSERT INTO `ftp_dir` VALUES ('5', '192.168.0.26', '621', 'dh', '123456', '/pe_fileG/', 'G:\\', '1', '0', '1', 'G:\\', '199998', '197662', '1.00');
INSERT INTO `ftp_dir` VALUES ('6', '192.168.0.26', '21', 'dh', '123456', '/pe_fileH/', 'H:\\', '1', '0', '0', 'H:\\', '0', '0', '0.00');
INSERT INTO `ftp_dir` VALUES ('7', '192.168.0.26', '21', 'dh', '123456', '/pe_fileF/', 'F:\\', '1', '0', '0', 'F:\\', '199999', '161122', '19.00');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT '0' COMMENT '菜单父ID',
  `name` varchar(64) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `ordernum` int(11) DEFAULT '0',
  `iconcls` varchar(64) DEFAULT NULL,
  `enable` int(2) DEFAULT '1' COMMENT '0:禁用,1:启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('100', '0', '系统管理', '', '0', 'icon-wrench', '1');
INSERT INTO `menu` VALUES ('101', '100', '角色管理', 'Role/index', '1', 'icon-folder_user', '1');
INSERT INTO `menu` VALUES ('103', '100', '部门管理', 'Area/index', '3', 'icon-world', '1');
INSERT INTO `menu` VALUES ('200', '0', '设备管理', '', '2', 'icon-tux', '1');
INSERT INTO `menu` VALUES ('201', '200', '执法仪配置', 'Dev/pe_base_show', '1', 'icon-tux', '1');
INSERT INTO `menu` VALUES ('303', '300', '工作站日志', 'Log/log_show?logType=wslog', '2', null, '1');
INSERT INTO `menu` VALUES ('302', '300', '执法仪日志', 'Log/log_show?logType=pelog', '1', null, '1');
INSERT INTO `menu` VALUES ('301', '300', '系统日志', 'Log/log_show?logType=syslog', '0', null, '1');
INSERT INTO `menu` VALUES ('300', '0', '日志查询', null, '1', null, '1');
INSERT INTO `menu` VALUES ('400', '0', '统计分析', '', '3', 'icon-group_link', '1');
INSERT INTO `menu` VALUES ('401', '400', '执法仪统计', 'Dev/pe_show_status', '1', 'icon-group_link', '1');
INSERT INTO `menu` VALUES ('402', '400', '工作量统计', 'Media/show_sat?satType=work_sat', '2', 'icon-user_comment', '1');
INSERT INTO `menu` VALUES ('404', '400', '考核统计', 'Media/show_sat?satType=assessmeny_sat', '3', 'icon-film_link', '1');
INSERT INTO `menu` VALUES ('500', '0', '数据管理', '', '4', 'icon-script', '1');
INSERT INTO `menu` VALUES ('502', '500', '执法查询', 'Media/law_query', '1', null, '1');
INSERT INTO `menu` VALUES ('501', '500', '数据比对', 'Media/data_com', '0', null, '1');
INSERT INTO `menu` VALUES ('104', '100', '警员录入', 'Employee/index', '4', 'icon-vcard', '1');
INSERT INTO `menu` VALUES ('105', '100', '警员查看', 'Employee/showEmpPhoto', '5', 'icon-picture_go', '1');
INSERT INTO `menu` VALUES ('203', '200', '工作站管理', 'WorkStation/ws_base_show', '3', null, '1');
INSERT INTO `menu` VALUES ('600', '0', '调阅管理', null, '2', null, '1');
INSERT INTO `menu` VALUES ('602', '600', '申请列表', 'Apply/apply', '2', null, '1');
INSERT INTO `menu` VALUES ('603', '600', '审批', 'Apply/allow_apply', '3', null, '1');
INSERT INTO `menu` VALUES ('604', '600', '调阅查询', 'Apply/apply_video', '4', null, '1');

-- ----------------------------
-- Table structure for `pe_base`
-- ----------------------------
DROP TABLE IF EXISTS `pe_base`;
CREATE TABLE `pe_base` (
  `cpxh` varchar(7) NOT NULL COMMENT '产品(执法仪)序号 ',
  `standard` varchar(30) DEFAULT NULL COMMENT '设备规格',
  `product` varchar(100) DEFAULT NULL COMMENT '生产厂家',
  `areacode` varchar(32) NOT NULL DEFAULT '单位,同area_dep.areacode',
  `areaname` varchar(128) DEFAULT NULL COMMENT '单位,同area_dep.areaname',
  `jybh` varchar(6) NOT NULL COMMENT '警员编号',
  `jyxm` varchar(32) DEFAULT NULL COMMENT '警员姓名',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0:停用,1:维修,2:正常',
  `times` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`cpxh`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pe_base
-- ----------------------------
INSERT INTO `pe_base` VALUES ('1000478', null, null, '0', null, 'JX0232', '刘欣', '0', '0', null);
INSERT INTO `pe_base` VALUES ('1234511', null, null, '0', null, '020004', '安锐', '0', '0', null);
INSERT INTO `pe_base` VALUES ('TA00382', null, null, '0', null, '020707', '黄猛', '0', '0', null);
INSERT INTO `pe_base` VALUES ('TA00471', null, null, '0', null, 'JX0856', '毕少原', '0', '0', null);
INSERT INTO `pe_base` VALUES ('TA00472', null, null, '0', null, 'JX0224', '祁博', '0', '0', null);
INSERT INTO `pe_base` VALUES ('TA00474', null, null, '0', null, 'JX0867', '王慧博', '0', '0', null);
INSERT INTO `pe_base` VALUES ('TA00475', null, null, '0', null, 'JX1084', '白鹤', '0', '0', null);
INSERT INTO `pe_base` VALUES ('TA00716', null, null, '0', null, 'JX0227', '王磊', '0', '0', null);
INSERT INTO `pe_base` VALUES ('TA00720', null, null, '0', null, 'JX0243', '张元一', '0', '0', null);

-- ----------------------------
-- Table structure for `pe_log_list`
-- ----------------------------
DROP TABLE IF EXISTS `pe_log_list`;
CREATE TABLE `pe_log_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpxh` varchar(7) NOT NULL DEFAULT '0000000' COMMENT '产品(执法仪)序号',
  `comment` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `rzsj` datetime NOT NULL COMMENT '日志时间',
  `jybh` varchar(6) NOT NULL COMMENT '警员编号',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '警员姓名',
  `gzz_ip` varchar(64) NOT NULL COMMENT '工作站ip',
  `auth_key` varchar(32) DEFAULT NULL COMMENT '认证密钥',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pe_log_list
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(64) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `functionlist` varchar(4096) DEFAULT NULL,
  `level` int(2) DEFAULT NULL COMMENT '0-5级',
  PRIMARY KEY (`roleid`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '系统管理员', '拥有所有操作权限', '100,101,102,103,104,105,200,201,202,203,300,301,302,303,304,400,401,402,403,404,405,406,407,408,500,501,502,503,504,505,600,602,603,604', '0');
INSERT INTO `role` VALUES ('19', '市局管理员', '拥有所有操作权限', '500,502,501,400,405,404,402,401,300,303,302,301,200,203,201,600,604,603,602,105,104,103', '1');
INSERT INTO `role` VALUES ('20', '警员', '拥有数据管理，日志查询,调阅查询', '500,502,501,402,201,604,303,302', '4');
INSERT INTO `role` VALUES ('22', '县局管理员', '没有角色管理，有其它权限', '500,502,501,400,405,404,402,401,200,203,201,600,604,603,602,300,303,302,301,105,104,103', '2');
INSERT INTO `role` VALUES ('23', '基层管理员', '没有角色管理，有其它权限', '500,502,501,400,405,404,402,401,200,203,201,600,604,603,602,300,303,302,301,105,104,103', '3');

-- ----------------------------
-- Table structure for `server_machine`
-- ----------------------------
DROP TABLE IF EXISTS `server_machine`;
CREATE TABLE `server_machine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areacode` varchar(32) NOT NULL COMMENT '单位,同area_dep.areacode',
  `areaname` varchar(128) DEFAULT NULL COMMENT '单位,同area_dep.areaname',
  `server_ip` varchar(20) NOT NULL COMMENT '服务器IP',
  `server_port` int(11) DEFAULT NULL,
  `trademark` varchar(32) DEFAULT NULL COMMENT '服务器品牌',
  `config` varchar(128) DEFAULT NULL COMMENT '服务器配置',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '服务器状态；0:离线,1:正常',
  `account` varchar(32) DEFAULT NULL COMMENT '账号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `db_user` varchar(32) DEFAULT NULL COMMENT '数据库用户',
  `db_pwd` varchar(32) DEFAULT NULL COMMENT '数据库密码',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of server_machine
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '0',
  `cmt` varchar(128) NOT NULL DEFAULT '',
  `dte` datetime NOT NULL,
  `module` varchar(32) DEFAULT NULL,
  `ip` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=659 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL COMMENT '公告标题',
  `content` varchar(512) DEFAULT NULL COMMENT '公告描述',
  `areacode` varchar(32) DEFAULT NULL COMMENT '单位,同area_dep.areacode',
  `areaname` varchar(128) DEFAULT NULL COMMENT '部门名称',
  `creater_id` varchar(32) DEFAULT NULL COMMENT '创建人，登陆用户id',
  `creater_name` varchar(32) DEFAULT NULL COMMENT '创建人，登陆用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `start_time` datetime NOT NULL COMMENT '公告有效开始时间',
  `end_time` datetime NOT NULL COMMENT '公告有效结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `ws_base`
-- ----------------------------
DROP TABLE IF EXISTS `ws_base`;
CREATE TABLE `ws_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gzz_ip` varchar(64) NOT NULL COMMENT '工作站IP',
  `areacode` varchar(32) DEFAULT NULL COMMENT '单位,同area_dep.areacode',
  `areaname` varchar(128) DEFAULT NULL COMMENT '单位,同area_dep.areaname',
  `fzr` varchar(64) DEFAULT NULL COMMENT '负责人',
  `dh` varchar(32) DEFAULT NULL COMMENT '负责人电话',
  `zxzt` int(2) NOT NULL DEFAULT '1' COMMENT '在线状态,0:不在线，1：在线',
  `ztsj` datetime NOT NULL COMMENT '状态时间',
  `qyzt` int(2) NOT NULL DEFAULT '1' COMMENT '启用状态 0:未启用，1：启用',
  `auth_key` varchar(32) DEFAULT NULL COMMENT '认证密钥 MD5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ws_base
-- ----------------------------
INSERT INTO `ws_base` VALUES ('1', '10.102.131.121', '0', '青山区一中队', '', '', '0', '2017-08-01 13:16:17', '1', null);
INSERT INTO `ws_base` VALUES ('2', '192.168.43.45', '0', '工作站', '', '', '0', '2017-08-01 13:16:18', '1', null);
INSERT INTO `ws_base` VALUES ('3', '192.168.0.26', null, null, null, null, '1', '2017-08-01 15:32:31', '1', null);
INSERT INTO `ws_base` VALUES ('4', '192.168.1.102', null, null, null, null, '1', '2017-08-01 20:38:39', '1', null);

-- ----------------------------
-- Table structure for `ws_log`
-- ----------------------------
DROP TABLE IF EXISTS `ws_log`;
CREATE TABLE `ws_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gzz_ip` varchar(64) NOT NULL COMMENT '工作站ip',
  `comment` varchar(128) NOT NULL DEFAULT '0' COMMENT '日志类型,1:开机，2：关机，3：接入记录仪，4：移除记录仪，5：采集文件，',
  `dxbh` varchar(100) DEFAULT NULL COMMENT '对象编号,执法记录仪或文件编号',
  `rzsj` datetime NOT NULL COMMENT '日志时间',
  `auth_key` varchar(32) DEFAULT NULL COMMENT '认证密钥',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ws_log
-- ----------------------------
