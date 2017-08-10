/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : enforce_xy

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 936

Date: 2017-08-10 10:15:10
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
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '部门代码',
  `rperson` varchar(64) DEFAULT NULL,
  `rphone` varchar(32) DEFAULT NULL,
  `code` varchar(10) DEFAULT '' COMMENT '部门代码,自定义,用于公安用户自动勾选交警部门权限',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '0:交警，1:其它,2:法制',
  `is_read` int(1) NOT NULL DEFAULT '1' COMMENT '部门权限；1:读写,0:只读;父级是0，子级必须是0;',
  PRIMARY KEY (`areaid`),
  UNIQUE KEY `idx_areacode` (`areacode`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=668 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of area_dep
-- ----------------------------
INSERT INTO `area_dep` VALUES ('196', '1', '0', '河南省公安厅', '41', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('197', '1', '196', '信阳市公安局', '4115', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('198', '1', '197', '老城分局', '411501', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('199', '1', '197', '浉河分局', '411502', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('200', '1', '197', '羊山分局', '411503', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('201', '1', '197', '明港分局', '411504', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('202', '1', '197', '洋河分局', '411505', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('203', '1', '197', '平桥分局', '411506', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('204', '1', '197', '上天梯分局', '411507', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('205', '1', '197', '高新分局', '411508', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('206', '1', '197', '鸡公山分局', '411509', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('207', '1', '197', '南湾分局', '411510', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('208', '1', '197', '淮滨县公安局', '411511', '姜树豪', '13949159672', '411511', '1', '0');
INSERT INTO `area_dep` VALUES ('209', '1', '197', '直属分局', '411512', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('210', '1', '197', '新县公安局', '411513', null, null, '411513', '1', '0');
INSERT INTO `area_dep` VALUES ('211', '1', '197', '光山县公安局', '411514', null, null, '411514', '1', '0');
INSERT INTO `area_dep` VALUES ('212', '1', '197', '潢川县公安局', '411515', '张局长', null, '411515', '1', '0');
INSERT INTO `area_dep` VALUES ('213', '1', '197', '罗山县公安局', '411516', null, null, '411516', '1', '0');
INSERT INTO `area_dep` VALUES ('214', '1', '197', '商城县公安局', '411517', null, null, '411517', '1', '0');
INSERT INTO `area_dep` VALUES ('215', '1', '197', '息县公安局', '411518', '邢磊', '13937666277', '411518', '1', '0');
INSERT INTO `area_dep` VALUES ('216', '1', '198', '老城分局-老城派出所', '41150101', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('217', '1', '198', '老城分局-民权派出所', '41150102', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('218', '1', '198', '老城分局-车站派出所', '41150103', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('219', '1', '198', '老城分局-五里墩派出所', '41150104', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('220', '1', '198', '老城分局-金牛山派出所', '41150105', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('221', '1', '198', '老城分局-工区派出所', '41150106', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('222', '1', '198', '老城分局-产业集聚区派出所', '41150107', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('223', '1', '198', '老城分局-公交派出所', '41150108', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('224', '1', '198', '老城分局-公园派出所', '41150109', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('225', '1', '198', '老城分局-老城分局警务综合室', '41150110', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('226', '1', '198', '老城分局-老城分局社区警务大队', '41150111', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('227', '1', '198', '老城分局-老城分局执法执纪监督室', '41150112', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('228', '1', '198', '老城分局-老城分局治安管理大队', '41150113', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('229', '1', '198', '老城分局-老城分局案件侦办大队', '41150114', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('230', '1', '198', '老城分局-老城分局巡逻防控大队', '41150115', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('231', '1', '199', '浉河分局-五星派出所', '41150201', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('232', '1', '199', '浉河分局-湖东派出所', '41150202', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('233', '1', '199', '浉河分局-游河派出所', '41150203', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('234', '1', '199', '浉河分局-东双河派出所', '41150204', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('235', '1', '199', '浉河分局-谭家河派出所', '41150205', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('236', '1', '199', '浉河分局-十三里桥派出所', '41150206', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('237', '1', '199', '浉河分局-董家河派出所', '41150207', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('238', '1', '199', '浉河分局-吴家店派出所', '41150208', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('239', '1', '199', '浉河分局-浉河港派出所', '41150209', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('240', '1', '199', '浉河分局-柳林派出所', '41150210', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('241', '1', '199', '浉河分局-浉河分局警务综合室', '41150211', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('242', '1', '199', '浉河分局-浉河分局执法执纪监督室', '41150212', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('243', '1', '199', '浉河分局-浉河分局法制大队', '41150213', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('244', '1', '199', '浉河分局-浉河分局案件侦办大队', '41150214', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('245', '1', '199', '浉河分局-浉河分局交管巡防大队', '41150215', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('246', '1', '199', '浉河分局-浉河分局社区警务大队', '41150216', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('247', '1', '199', '浉河分局-浉河分局治安管理大队', '41150217', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('248', '1', '200', '羊山分局-楚王城派出所', '41150301', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('249', '1', '200', '羊山分局-前进派出所', '41150302', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('250', '1', '200', '羊山分局-龙飞山派出所', '41150303', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('251', '1', '200', '羊山分局-羊山派出所', '41150304', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('252', '1', '200', '羊山分局-行政中心派出所', '41150305', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('253', '1', '200', '羊山分局-北湖派出所', '41150306', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('254', '1', '200', '羊山分局-羊山分局治安大队', '41150307', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('255', '1', '200', '羊山分局-羊山分局案件侦办大队', '41150308', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('256', '1', '200', '羊山分局-羊山分局特勤大队', '41150309', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('257', '1', '200', '羊山分局-羊山分局巡逻防控大队', '41150310', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('258', '1', '200', '羊山分局-羊山分局警务综合室', '41150311', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('259', '1', '200', '羊山分局-羊山分局家居小镇警务室', '41150312', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('260', '1', '200', '羊山分局-羊山派出所社区警务大队', '41150313', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('261', '1', '200', '羊山分局-羊山分局执法执纪监督室', '41150314', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('262', '1', '201', '明港分局-明港派出所', '41150401', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('263', '1', '201', '明港分局-铁东派出所', '41150402', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('264', '1', '201', '明港分局-铁西派出所', '41150403', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('265', '1', '201', '明港分局-兰店派出所', '41150404', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('266', '1', '201', '明港分局-刑集派出所', '41150405', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('267', '1', '201', '明港分局-王岗派出所', '41150406', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('268', '1', '201', '明港分局-甘岸派出所', '41150407', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('269', '1', '201', '明港分局-长台关派出所', '41150408', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('270', '1', '201', '明港分局-城阳城址派出所', '41150409', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('271', '1', '201', '明港分局-明港分局执法执纪监督室', '41150410', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('272', '1', '201', '明港分局-明港分局案件侦办大队', '41150411', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('273', '1', '201', '明港分局-明港分局治安管理大队', '41150412', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('274', '1', '201', '明港分局-明港分局巡防大队', '41150413', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('275', '1', '201', '明港分局-明港分局社区警务大队', '41150414', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('276', '1', '201', '明港分局-明港分局警务综合室', '41150415', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('277', '1', '201', '明港分局-平昌关派出所', '41150416', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('278', '1', '201', '明港分局-查山派出所', '41150417', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('279', '1', '201', '明港分局-高粱店派出所', '41150418', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('280', '1', '202', '洋河分局-洋河派出所', '41150501', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('281', '1', '202', '洋河分局-九店派出所', '41150502', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('282', '1', '202', '洋河分局-彭家湾派出所', '41150503', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('283', '1', '202', '洋河分局-胡店派出所', '41150504', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('284', '1', '202', '洋河分局-肖王派出所', '41150505', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('285', '1', '202', '洋河分局-肖店派出所', '41150506', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('286', '1', '202', '洋河分局-龙井派出所', '41150507', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('287', '1', '202', '洋河分局-洋河分局警务综合室', '41150508', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('288', '1', '202', '洋河分局-洋河分局执法执纪室', '41150509', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('289', '1', '202', '洋河分局-洋河分局案件侦办大队', '41150510', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('290', '1', '202', '洋河分局-洋河分局社区警务大队', '41150511', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('291', '1', '202', '洋河分局-洋河分局巡逻防控大队', '41150512', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('292', '1', '203', '平桥分局-平桥派出所', '41150601', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('293', '1', '203', '平桥分局-工业园派出所', '41150602', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('294', '1', '203', '平桥分局-震雷山派出所', '41150603', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('295', '1', '203', '平桥分局-平西派出所', '41150604', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('296', '1', '203', '平桥分局-五里派出所', '41150605', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('297', '1', '203', '平桥分局-平桥分局警务综合室', '41150606', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('298', '1', '203', '平桥分局-平桥分局执法执纪监督室', '41150607', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('299', '1', '203', '平桥分局-平桥分局治安管理大队', '41150608', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('300', '1', '203', '平桥分局-平桥分局案件侦办大队', '41150609', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('301', '1', '203', '平桥分局-平桥分局交管巡防大队', '41150610', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('302', '1', '203', '平桥分局-平桥分局社区警务大队', '41150611', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('303', '1', '204', '上天梯分局-土城派出所', '41150701', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('304', '1', '204', '上天梯分局-上天梯分局社区警务大队', '41150702', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('305', '1', '204', '上天梯分局-上天梯分局案件侦办大队', '41150703', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('306', '1', '204', '上天梯分局-上天梯分局警务综合室', '41150704', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('307', '1', '204', '上天梯分局-上天梯分局执法执纪监督室', '41150705', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('308', '1', '204', '上天梯分局-上天梯分局', '41150706', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('309', '1', '205', '高新分局-珍珠路派出所', '41150801', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('310', '1', '205', '高新分局-城东派出所', '41150802', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('311', '1', '205', '高新分局-高新分局警务综合室', '41150803', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('312', '1', '205', '高新分局-高新分局社区警务大队', '41150804', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('313', '1', '205', '高新分局-高新分局案件侦办大队', '41150805', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('314', '1', '206', '鸡公山分局-李家寨派出所', '41150901', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('315', '1', '206', '鸡公山分局-鸡公山派出所', '41150902', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('316', '1', '206', '鸡公山分局-鸡公山分局警务综合室', '41150903', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('317', '1', '206', '鸡公山分局-鸡公山分局案件侦办大队', '41150904', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('318', '1', '206', '鸡公山分局-鸡公山分局社区警务大队', '41150905', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('319', '1', '207', '南湾分局-南湾派出所', '41151001', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('320', '1', '207', '南湾分局-贤山派出所', '41151002', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('321', '1', '207', '南湾分局-南湾分局警务综合室', '41151003', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('322', '1', '207', '南湾分局-南湾分局案件侦办大队', '41151004', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('323', '1', '207', '南湾分局-南湾分局社区警务大队', '41151005', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('324', '1', '208', '淮滨县公安局-城关派出所', '41151101', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('325', '1', '208', '淮滨县公安局-北城派出所', '41151102', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('326', '1', '208', '淮滨县公安局-张里派出所', '41151103', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('327', '1', '208', '淮滨县公安局-防胡派出所', '41151104', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('328', '1', '208', '淮滨县公安局-新里派出所', '41151105', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('329', '1', '208', '淮滨县公安局-马集派出所', '41151106', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('330', '1', '208', '淮滨县公安局-芦集派出所', '41151107', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('331', '1', '208', '淮滨县公安局-邓湾派出所', '41151108', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('332', '1', '208', '淮滨县公安局-台头派出所', '41151109', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('333', '1', '208', '淮滨县公安局-巡特警大队', '41151110', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('334', '1', '208', '淮滨县公安局-治安大队', '41151111', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('335', '1', '208', '淮滨县公安局-经侦大队', '41151112', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('336', '1', '208', '淮滨县公安局-刑警大队', '41151113', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('337', '1', '208', '淮滨县公安局-工业园派出所', '41151114', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('338', '1', '208', '淮滨县公安局-期思派出所', '41151115', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('339', '1', '208', '淮滨县公安局-谷堆派出所', '41151116', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('340', '1', '208', '淮滨县公安局-王店派出所', '41151117', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('341', '1', '208', '淮滨县公安局-麻里派出所', '41151118', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('342', '1', '208', '淮滨县公安局-张庄派出所', '41151119', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('343', '1', '208', '淮滨县公安局-固城派出所', '41151120', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('344', '1', '208', '淮滨县公安局-三空桥派出所', '41151121', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('345', '1', '208', '淮滨县公安局-赵集派出所', '41151122', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('346', '1', '208', '淮滨县公安局-栏杆派出所', '41151123', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('347', '1', '208', '淮滨县公安局-王家岗派出所', '41151124', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('348', '1', '209', '信阳市公安局-出入境大队', '41151201', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('349', '1', '209', '信阳市公安局-刑警支队', '41151202', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('350', '1', '209', '信阳市公安局-110勤务大队', '41151203', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('351', '1', '209', '信阳市公安局-法制支队', '41151204', null, null, '', '2', '1');
INSERT INTO `area_dep` VALUES ('352', '1', '209', '信阳市公安局-巡特警支队', '41151205', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('353', '1', '209', '信阳市公安局-国保支队', '41151206', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('354', '1', '209', '信阳市公安局-禁毒支队', '41151207', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('355', '1', '209', '信阳市公安局-经侦支队', '41151208', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('356', '1', '209', '信阳市公安局-治安支队', '41151209', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('357', '1', '209', '信阳市公安局-网监支队', '41151210', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('358', '1', '209', '信阳市公安局-反恐怖支队', '41151211', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('359', '1', '209', '信阳市公安局-监管支队', '41151212', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('360', '1', '209', '信阳市公安局-交通警察支队', '41151213', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('545', '1', '350', '110勤务大队-110步行街勤务站', '4115120301', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('361', '1', '210', '新县公安局-巡特警大队', '41151301', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('362', '1', '210', '新县公安局-刑警大队', '41151302', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('363', '1', '210', '新县公安局-办案中心', '41151303', null, null, '', '2', '0');
INSERT INTO `area_dep` VALUES ('364', '1', '210', '新县公安局-城关派出所', '41151304', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('365', '1', '210', '新县公安局-产业集聚区派出所', '41151305', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('366', '1', '210', '新县公安局-新集派出所', '41151306', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('367', '1', '210', '新县公安局-浒湾派出所', '41151307', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('368', '1', '210', '新县公安局-八里贩派出所', '41151308', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('369', '1', '210', '新县公安局-沙窝派出所', '41151309', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('370', '1', '210', '新县公安局-周河派出所', '41151310', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('371', '1', '210', '新县公安局-吴陈河派出所', '41151311', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('372', '1', '210', '新县公安局-千斤派出所', '41151312', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('373', '1', '210', '新县公安局-苏河派出所', '41151313', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('374', '1', '210', '新县公安局-卡房派出所', '41151314', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('375', '1', '210', '新县公安局-陡山河派出所', '41151315', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('376', '1', '210', '新县公安局-郭家河派出所', '41151316', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('377', '1', '210', '新县公安局-陈店派出所', '41151317', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('378', '1', '210', '新县公安局-箭厂河派出所', '41151318', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('379', '1', '210', '新县公安局-泗店派出所', '41151319', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('380', '1', '210', '新县公安局-田铺派出所', '41151320', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('381', '1', '210', '新县公安局-香山湖派出所', '41151321', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('382', '1', '211', '光山县公安局-巡特警大队', '41151401', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('383', '1', '211', '光山县公安局-十里派出所', '41151402', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('384', '1', '211', '光山县公安局-弦山派出所', '41151403', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('385', '1', '211', '光山县公安局-交警大队', '41151404', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('386', '1', '211', '光山县公安局-紫水派出所', '41151405', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('387', '1', '211', '光山县公安局-治安大队', '41151406', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('388', '1', '211', '光山县公安局-寨河派出所', '41151407', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('389', '1', '211', '光山县公安局-槐店派出所', '41151408', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('390', '1', '211', '光山县公安局-晏河派出所', '41151409', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('391', '1', '211', '光山县公安局-孙铁铺派出所', '41151410', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('392', '1', '211', '光山县公安局-泼河派出所', '41151411', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('393', '1', '211', '光山县公安局-马畈派出所', '41151412', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('394', '1', '211', '光山县公安局-白雀派出所', '41151413', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('395', '1', '211', '光山县公安局-刑警大队', '41151414', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('396', '1', '211', '光山县公安局-北项店派出所', '41151415', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('397', '1', '211', '光山县公安局-仙居派出所', '41151416', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('398', '1', '211', '光山县公安局-文殊派出所', '41151417', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('399', '1', '212', '潢川县公安局-北城派出所', '41151501', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('400', '1', '212', '潢川县公安局-南城派出所', '41151502', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('401', '1', '212', '潢川县公安局-环城派出所', '41151503', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('402', '1', '212', '潢川县公安局-东城派出所', '41151504', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('403', '1', '212', '潢川县公安局-产业集聚区派出所', '41151505', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('404', '1', '212', '潢川县公安局-伞陂派出所', '41151506', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('405', '1', '212', '潢川县公安局-付店派出所', '41151507', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('406', '1', '212', '潢川县公安局-魏岗派出所', '41151508', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('407', '1', '212', '潢川县公安局-牛岗派出所', '41151509', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('408', '1', '212', '潢川县公安局-黄岗派出所', '41151510', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('409', '1', '212', '潢川县公安局-110专业勤务大队', '41151511', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('410', '1', '212', '潢川县公安局-办案中心', '41151512', null, null, '', '2', '0');
INSERT INTO `area_dep` VALUES ('411', '1', '212', '潢川县公安局-巡特警大队', '41151513', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('412', '1', '212', '潢川县公安局-交警大队', '41151514', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('413', '1', '212', '潢川县公安局-刑警大队', '41151515', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('414', '1', '212', '潢川县公安局-森林派出所', '41151516', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('415', '1', '212', '潢川县公安局-隆古派出所', '41151517', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('416', '1', '212', '潢川县公安局-双柳派出所', '41151518', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('417', '1', '212', '潢川县公安局-谈店派出所', '41151519', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('418', '1', '212', '潢川县公安局-小吕店派出所', '41151520', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('419', '1', '212', '潢川县公安局-来龙派出所', '41151521', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('420', '1', '212', '潢川县公安局-踅孜派出所', '41151522', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('421', '1', '212', '潢川县公安局-白店派出所', '41151523', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('422', '1', '212', '潢川县公安局-仁和派出所', '41151524', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('423', '1', '212', '潢川县公安局-卜集派出所', '41151525', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('424', '1', '212', '潢川县公安局-彭店派出所', '41151526', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('425', '1', '212', '潢川县公安局-上油岗派出所', '41151527', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('426', '1', '212', '潢川县公安局-江集派出所', '41151528', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('427', '1', '212', '潢川县公安局-张集派出所', '41151529', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('428', '1', '212', '潢川县公安局-桃林派出所', '41151530', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('429', '1', '212', '潢川县公安局-传流店派出所', '41151531', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('430', '1', '212', '潢川县公安局-新办案中心', '41151532', null, null, '', '2', '0');
INSERT INTO `area_dep` VALUES ('431', '1', '213', '罗山县公安局-宝城派出所', '41151601', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('432', '1', '213', '罗山县公安局-龙山派出所', '41151602', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('433', '1', '213', '罗山县公安局-刑警大队', '41151603', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('434', '1', '213', '罗山县公安局-丽水派出所', '41151604', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('435', '1', '213', '罗山县公安局-网监大队', '41151605', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('436', '1', '213', '罗山县公安局-巡特警大队', '41151606', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('437', '1', '213', '罗山县公安局-国保大队', '41151607', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('438', '1', '213', '罗山县公安局-治安大队', '41151608', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('439', '1', '213', '罗山县公安局-执法办案中心', '41151609', null, null, '', '2', '0');
INSERT INTO `area_dep` VALUES ('440', '1', '213', '罗山县公安局-看守所', '41151610', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('441', '1', '213', '罗山县公安局-拘留所', '41151611', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('442', '1', '213', '罗山县公安局-竹竿派出所', '41151612', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('443', '1', '213', '罗山县公安局-东铺派出所', '41151613', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('444', '1', '213', '罗山县公安局-尤店派出所', '41151614', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('445', '1', '213', '罗山县公安局-高店派出所', '41151615', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('446', '1', '213', '罗山县公安局-楠杆派出所', '41151616', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('447', '1', '213', '罗山县公安局-五一派出所', '41151617', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('448', '1', '213', '罗山县公安局-子路派出所', '41151618', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('449', '1', '213', '罗山县公安局-青山派出所', '41151619', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('450', '1', '213', '罗山县公安局-庙仙派出所', '41151620', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('451', '1', '213', '罗山县公安局-莽张派出所', '41151621', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('452', '1', '213', '罗山县公安局-周党派出所', '41151622', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('453', '1', '213', '罗山县公安局-定远派出所', '41151623', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('454', '1', '213', '罗山县公安局-山店派出所', '41151624', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('455', '1', '213', '罗山县公安局-潘新派出所', '41151625', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('456', '1', '213', '罗山县公安局-彭新派出所', '41151626', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('457', '1', '213', '罗山县公安局-灵山派出所', '41151627', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('458', '1', '213', '罗山县公安局-灵山寺派出所', '41151628', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('459', '1', '213', '罗山县公安局-铁铺派出所', '41151629', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('460', '1', '213', '罗山县公安局-朱堂派出所', '41151630', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('461', '1', '213', '罗山县公安局-城关派出所', '41151631', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('462', '1', '213', '罗山县公安局-反恐大队', '41151632', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('463', '1', '213', '罗山县公安局-规范信访秩序执法大队', '41151633', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('464', '1', '213', '罗山县公安局-经侦大队', '41151634', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('465', '1', '213', '罗山县公安局-禁毒大队', '41151635', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('466', '1', '214', '商城县公安局-法制大队', '41151701', null, null, '', '2', '0');
INSERT INTO `area_dep` VALUES ('467', '1', '214', '商城县公安局-巡特警大队', '41151702', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('468', '1', '214', '商城县公安局-城关派出所', '41151703', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('469', '1', '214', '商城县公安局-鲇鱼山派出所', '41151704', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('470', '1', '214', '商城县公安局-上石桥派出所', '41151705', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('471', '1', '214', '商城县公安局-汪桥派出所', '41151706', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('472', '1', '214', '商城县公安局-刑警大队', '41151707', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('473', '1', '214', '商城县公安局-治安大队', '41151708', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('474', '1', '214', '商城县公安局-双椿铺派出所', '41151709', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('475', '1', '214', '商城县公安局-余集派出所', '41151710', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('476', '1', '214', '商城县公安局-汪岗派出所', '41151711', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('477', '1', '214', '商城县公安局-鄢岗派出所', '41151712', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('478', '1', '214', '商城县公安局-观庙派出所', '41151713', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('479', '1', '214', '商城县公安局-河凤桥派出所', '41151714', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('480', '1', '214', '商城县公安局-伏山派出所', '41151715', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('481', '1', '214', '商城县公安局-达权店派出所', '41151716', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('482', '1', '214', '商城县公安局-禁毒大队', '41151717', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('483', '1', '214', '商城县公安局-金刚台派出所', '41151718', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('484', '1', '214', '商城县公安局-李集派出所', '41151719', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('485', '1', '214', '商城县公安局-吴河派出所', '41151720', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('486', '1', '214', '商城县公安局-丰集派出所', '41151721', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('487', '1', '214', '商城县公安局-冯店派出所', '41151722', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('488', '1', '214', '商城县公安局-产业集聚区派出所', '41151723', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('489', '1', '214', '商城县公安局-长竹园派出所', '41151724', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('490', '1', '214', '商城县公安局-苏仙石派出所', '41151725', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('491', '1', '214', '商城县公安局-汤泉池派出所', '41151726', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('492', '1', '214', '商城县公安局-白塔集派出所', '41151727', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('493', '1', '214', '商城县公安局-经侦大队', '41151728', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('494', '1', '214', '商城县公安局-国保大队', '41151729', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('495', '1', '214', '商城县公安局-出入境管理大队', '41151730', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('496', '1', '214', '商城县公安局-黄柏山国家森林公园派出所', '41151731', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('497', '1', '214', '商城县公安局-网监大队', '41151732', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('498', '1', '214', '商城公安局-鲇水派出所', '41151733', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('499', '1', '215', '息县公安局-经侦大队', '41151801', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('500', '1', '215', '息县公安局-刑警大队', '41151802', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('501', '1', '215', '息县公安局-治安大队', '41151803', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('502', '1', '215', '息县公安局-巡特警大队', '41151804', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('503', '1', '215', '息县公安局-网监大队', '41151805', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('504', '1', '215', '息县公安局-出入境管理股', '41151806', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('505', '1', '215', '息县公安局-国保大队', '41151807', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('506', '1', '215', '息县公安局-禁毒大队', '41151808', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('507', '1', '215', '息县公安局-龙湖派出所', '41151809', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('508', '1', '215', '息县公安局-户政股', '41151810', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('509', '1', '215', '息县公安局-纪委', '41151811', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('510', '1', '215', '息县公安局-督察大队', '41151812', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('511', '1', '215', '息县公安局-警令部', '41151813', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('512', '1', '215', '息县公安局-拘留所', '41151814', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('513', '1', '215', '息县公安局-看守所', '41151815', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('514', '1', '215', '息县公安局-视频监控', '41151816', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('515', '1', '215', '息县公安局-控申股', '41151817', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('516', '1', '215', '息县公安局-情报中心', '41151818', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('517', '1', '215', '息县公安局-通信股', '41151819', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('518', '1', '215', '息县公安局-政治处', '41151820', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('519', '1', '215', '息县公安局-装备财务科', '41151821', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('520', '1', '215', '息县公安局-淮河派出所', '41151822', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('521', '1', '215', '息县公安局-谯楼派出所', '41151823', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('522', '1', '215', '息县公安局-中渡店派出所', '41151824', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('523', '1', '215', '息县公安局-八里岔派出所', '41151825', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('524', '1', '215', '息县公安局-曹黄林派出所', '41151826', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('525', '1', '215', '息县公安局-关店派出所', '41151827', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('526', '1', '215', '息县公安局-杨店派出所', '41151828', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('527', '1', '215', '息县公安局-彭店派出所', '41151829', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('528', '1', '215', '息县公安局-张陶派出所', '41151830', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('529', '1', '215', '息县公安局-东岳派出所', '41151831', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('530', '1', '215', '息县公安局-路口派出所', '41151832', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('531', '1', '215', '息县公安局-白土店派出所', '41151833', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('532', '1', '215', '息县公安局-孙庙派出所', '41151834', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('533', '1', '215', '息县公安局-项店派出所', '41151835', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('534', '1', '215', '息县公安局-夏庄派出所', '41151836', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('535', '1', '215', '息县公安局-小茴派出所', '41151837', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('536', '1', '215', '息县公安局-包信派出所', '41151838', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('537', '1', '215', '息县公安局-岗李店派出所', '41151839', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('538', '1', '215', '息县公安局-陈棚派出所', '41151840', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('539', '1', '215', '息县公安局-长陵派出所', '41151841', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('540', '1', '215', '息县公安局-临河派出所', '41151842', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('541', '1', '215', '息县公安局-金地派出所', '41151843', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('542', '1', '215', '息县公安局-许店派出所', '41151844', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('543', '1', '215', '息县公安局-法制大队', '41151845', null, null, '', '2', '0');
INSERT INTO `area_dep` VALUES ('544', '1', '215', '息县公安局-消防大队', '41151846', null, null, '', '1', '0');
INSERT INTO `area_dep` VALUES ('546', '1', '350', '110勤务大队-110浉河勤务站', '4115120302', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('547', '1', '350', '110勤务大队-110平桥勤务站', '4115120303', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('548', '1', '350', '110勤务大队-110羊山勤务站', '4115120304', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('549', '1', '350', '110勤务大队-110领秀城勤务站', '4115120305', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('550', '1', '350', '110勤务大队-110军韵花园勤务站', '4115120306', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('551', '1', '350', '110勤务大队-110小南门勤务站', '4115120307', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('552', '1', '350', '110勤务大队-110文化中心勤务站', '4115120308', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('553', '1', '350', '110勤务大队-110国际商城勤务站', '4115120309', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('554', '1', '350', '110勤务大队-110农林学院勤务站', '4115120310', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('555', '1', '350', '110勤务大队-110博士名城勤务站', '4115120311', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('556', '1', '350', '110勤务大队-110消防队勤务站', '4115120312', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('557', '1', '350', '110勤务大队-110丽宝广场勤务站', '4115120313', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('558', '1', '351', '信阳市案审大队', '4115120401', null, null, '', '2', '1');
INSERT INTO `area_dep` VALUES ('559', '1', '351', '执法管理大队', '4115120402', null, null, '', '2', '1');
INSERT INTO `area_dep` VALUES ('560', '1', '351', '信阳市办案中心', '4115120403', null, null, '', '2', '1');
INSERT INTO `area_dep` VALUES ('561', '1', '352', '巡特警支队机关', '4115120501', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('562', '1', '352', '巡特警支队案件大队', '4115120502', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('563', '1', '352', '巡特警支队突击大队', '4115120503', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('564', '1', '352', '巡特警支队特警大队', '4115120504', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('565', '1', '352', '巡特警支队机动大队', '4115120505', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('566', '1', '359', '看守所', '4115121201', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('567', '1', '360', '浉河勤务大队', '4115121301', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('568', '1', '360', '平桥勤务大队', '4115121302', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('569', '1', '360', '明港勤务大队', '4115121303', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('570', '1', '360', '公路巡逻民警大队', '4115121304', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('571', '1', '360', '交通事故处理大队', '4115121305', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('572', '1', '360', '交通管理综合执法大队', '4115121306', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('573', '1', '360', '车管所', '4115121307', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('574', '1', '360', '考训科', '4115121308', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('575', '1', '360', '法制科', '4115121309', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('576', '1', '360', '交通秩序科', '4115121310', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('577', '1', '360', '事故处理指导科', '4115121311', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('578', '1', '360', '政治处', '4115121312', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('579', '1', '360', '宣传科', '4115121313', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('580', '1', '360', '装备财务科', '4115121314', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('581', '1', '360', '秘书科', '4115121315', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('582', '1', '360', '纪委', '4115121316', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('583', '1', '360', '交通设施管理科', '4115121317', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('584', '1', '360', '老干科', '4115121318', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('585', '1', '360', '机动大队', '4115121319', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('586', '1', '360', '光山县交警大队', '4115121320', null, null, '411514', '0', '0');
INSERT INTO `area_dep` VALUES ('587', '1', '360', '新县交警大队', '4115121321', null, null, '411513', '0', '0');
INSERT INTO `area_dep` VALUES ('593', '1', '567', '东风中队', '411512130101', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('588', '1', '360', '商城县交警大队', '4115121322', null, null, '411517', '0', '0');
INSERT INTO `area_dep` VALUES ('589', '1', '360', '淮滨县交警大队', '4115121323', null, null, '411511', '0', '0');
INSERT INTO `area_dep` VALUES ('590', '1', '360', '息县公安交通警察大队', '4115121324', null, null, '411518', '0', '0');
INSERT INTO `area_dep` VALUES ('591', '1', '360', '潢川县公安交通警察大队', '4115121325', null, null, '411515', '0', '0');
INSERT INTO `area_dep` VALUES ('592', '1', '360', '罗山县公安交通警察大队', '4115121326', null, null, '411516', '0', '0');
INSERT INTO `area_dep` VALUES ('594', '1', '567', '中山中队', '411512130102', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('595', '1', '567', '车站中队', '411512130103', null, null, '', '0', '1');
INSERT INTO `area_dep` VALUES ('596', '1', '586', '罗成中队', '411512132001', null, null, '411514', '0', '0');
INSERT INTO `area_dep` VALUES ('597', '1', '586', '白雀中队', '411512132002', null, null, '411514', '0', '0');
INSERT INTO `area_dep` VALUES ('598', '1', '586', '事故中队', '411512132003', null, null, '411514', '0', '0');
INSERT INTO `area_dep` VALUES ('599', '1', '586', '泼河中队', '411512132004', null, null, '411514', '0', '0');
INSERT INTO `area_dep` VALUES ('600', '1', '587', '箭厂河公安检查站', '411512132101', null, null, '411513', '0', '0');
INSERT INTO `area_dep` VALUES ('614', '1', '590', '二中队', '411512132403', null, null, '411518', '0', '0');
INSERT INTO `area_dep` VALUES ('601', '1', '589', '城关中队', '411512132301', null, null, '411511', '0', '0');
INSERT INTO `area_dep` VALUES ('602', '1', '589', '法制办', '411512132302', null, null, '411511', '0', '0');
INSERT INTO `area_dep` VALUES ('603', '1', '589', '源头办', '411512132303', null, null, '411511', '0', '0');
INSERT INTO `area_dep` VALUES ('604', '1', '589', '机动中队', '411512132304', null, null, '411511', '0', '0');
INSERT INTO `area_dep` VALUES ('605', '1', '589', '办公室', '411512132305', null, null, '411511', '0', '0');
INSERT INTO `area_dep` VALUES ('606', '1', '589', '车管所', '411512132306', null, null, '411511', '0', '0');
INSERT INTO `area_dep` VALUES ('607', '1', '589', '赵集中队', '411512132307', null, null, '411511', '0', '0');
INSERT INTO `area_dep` VALUES ('608', '1', '589', '马集中队', '411512132308', null, null, '411511', '0', '0');
INSERT INTO `area_dep` VALUES ('609', '1', '589', '王店中队', '411512132309', null, null, '411511', '0', '0');
INSERT INTO `area_dep` VALUES ('610', '1', '589', '事故中队', '411512132310', null, null, '411511', '0', '0');
INSERT INTO `area_dep` VALUES ('611', '1', '589', '治超中队', '411512132311', null, null, '411511', '0', '0');
INSERT INTO `area_dep` VALUES ('612', '1', '590', '城关中队', '411512132401', null, null, '411518', '0', '0');
INSERT INTO `area_dep` VALUES ('613', '1', '590', '一中队', '411512132402', null, null, '411518', '0', '0');
INSERT INTO `area_dep` VALUES ('615', '1', '590', '三中队', '411512132404', null, null, '411518', '0', '0');
INSERT INTO `area_dep` VALUES ('616', '1', '590', '包信中队', '411512132405', null, null, '411518', '0', '0');
INSERT INTO `area_dep` VALUES ('617', '1', '590', '事故中队', '411512132406', null, null, '411518', '0', '0');
INSERT INTO `area_dep` VALUES ('618', '1', '590', '治超中队', '411512132407', null, null, '411518', '0', '0');
INSERT INTO `area_dep` VALUES ('619', '1', '590', '处理办', '411512132408', null, null, '411518', '0', '0');
INSERT INTO `area_dep` VALUES ('620', '1', '590', '车管所', '411512132409', null, null, '411518', '0', '0');
INSERT INTO `area_dep` VALUES ('621', '1', '591', '桃林中队', '411512132501', null, null, '411515', '0', '0');
INSERT INTO `area_dep` VALUES ('622', '1', '591', '付店中队', '411512132502', null, null, '411515', '0', '0');
INSERT INTO `area_dep` VALUES ('623', '1', '591', '城关中队', '411512132503', null, null, '411515', '0', '0');
INSERT INTO `area_dep` VALUES ('624', '1', '591', '巍岗中队', '411512132504', null, null, '411515', '0', '0');
INSERT INTO `area_dep` VALUES ('625', '1', '591', '仁和中队', '411512132505', null, null, '411515', '0', '0');
INSERT INTO `area_dep` VALUES ('626', '1', '591', '伞陂中队', '411512132506', null, null, '411515', '0', '0');
INSERT INTO `area_dep` VALUES ('627', '1', '591', '机动中队', '411512132507', null, null, '411515', '0', '0');
INSERT INTO `area_dep` VALUES ('628', '1', '591', '打黑队', '411512132508', null, null, '411515', '0', '0');
INSERT INTO `area_dep` VALUES ('629', '1', '591', '科技中队', '411512132509', null, null, '411515', '0', '0');
INSERT INTO `area_dep` VALUES ('630', '1', '591', '事故中队', '411512132510', null, null, '411515', '0', '0');
INSERT INTO `area_dep` VALUES ('631', '1', '591', '车驾管', '411512132511', null, null, '411515', '0', '0');
INSERT INTO `area_dep` VALUES ('632', '1', '591', '违法处理', '411512132512', null, null, '411515', '0', '0');
INSERT INTO `area_dep` VALUES ('633', '1', '592', '办公室', '411512132601', null, null, '411516', '0', '0');
INSERT INTO `area_dep` VALUES ('635', '1', '592', '技术中队', '411512132603', null, null, '411516', '0', '0');
INSERT INTO `area_dep` VALUES ('634', '1', '592', '事故处理中队', '411512132602', null, null, '411516', '0', '0');
INSERT INTO `area_dep` VALUES ('636', '1', '592', '沙管中队', '411512132604', null, null, '411516', '0', '0');
INSERT INTO `area_dep` VALUES ('637', '1', '592', '科技中队', '411512132605', null, null, '411516', '0', '0');
INSERT INTO `area_dep` VALUES ('638', '1', '592', '宣教室', '411512132606', null, null, '411516', '0', '0');
INSERT INTO `area_dep` VALUES ('639', '1', '592', '车管所', '411512132607', null, null, '411516', '0', '0');
INSERT INTO `area_dep` VALUES ('640', '1', '592', '城关中队', '411512132608', null, null, '411516', '0', '0');
INSERT INTO `area_dep` VALUES ('641', '1', '592', '伍家坡中队', '411512132609', null, null, '411516', '0', '0');
INSERT INTO `area_dep` VALUES ('642', '1', '592', '竹竿中队', '411512132610', null, null, '411516', '0', '0');
INSERT INTO `area_dep` VALUES ('643', '1', '592', '周党中队', '411512132611', null, null, '411516', '0', '0');
INSERT INTO `area_dep` VALUES ('644', '1', '592', '涩港中队', '411512132612', null, null, '411516', '0', '0');
INSERT INTO `area_dep` VALUES ('645', '1', '592', '机动中队', '411512132613', null, null, '411516', '0', '0');
INSERT INTO `area_dep` VALUES ('647', '1', '228', '二中队', '4115011302', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('648', '1', '228', '三中队', '4115011303', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('646', '1', '228', '一中队', '4115011301', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('649', '1', '229', '一中队', '4115011401', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('650', '1', '229', '二中队', '4115011402', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('651', '1', '229', '三中队', '4115011403', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('652', '1', '229', '四中队', '4115011404', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('653', '1', '229', '五中队', '4115011405', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('654', '1', '229', '六中队', '4115011406', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('655', '1', '229', '七中队', '4115011407', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('656', '1', '229', '八中队', '4115011408', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('657', '1', '229', '九中队', '4115011409', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('658', '1', '230', '一中队', '4115011501', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('659', '1', '230', '二中队', '4115011502', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('660', '1', '230', '三中队', '4115011503', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('661', '1', '230', '四中队', '4115011504', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('662', '1', '566', '管教一中队', '411512120101', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('663', '1', '566', '管教二中队', '411512120102', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('664', '1', '566', '巡视监控中队', '411512120103', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('665', '1', '566', '收押提讯中队', '411512120104', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('666', '1', '566', '后勤保障中队', '411512120105', null, null, '', '1', '1');
INSERT INTO `area_dep` VALUES ('667', '1', '566', '女子管理中队', '411512120106', null, null, '', '1', '1');

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
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '案件开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '案件结束时间',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '上传时间',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '第1出警人警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '第1出警人警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '第1出警人单位编号',
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
  `apply_areacode` varchar(32) DEFAULT '' COMMENT '案件申请人部门ID',
  `apply_areaname` varchar(128) DEFAULT '' COMMENT '案件申请人部门名',
  `hand_status` int(1) NOT NULL DEFAULT '0' COMMENT '申请状态，0:初始态;1:待审核;2:移交完成',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '更新时间',
  `edit_name` varchar(128) DEFAULT NULL COMMENT '编辑人',
  PRIMARY KEY (`case_key`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_areacode` (`areacode`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_201706
-- ----------------------------
INSERT INTO `case_201706` VALUES ('20170623093621_086338_4115', '20170623093621_申忠', '2017-06-23 09:36:21', '2017-06-23 09:36:54', '2017-08-09 15:28:14', '申忠', '086338', '4115', '信阳市公安局', '', '', '', '0', '', '', '0', null, null, '0', '', '', '', '', '', '0', '2017-08-09 15:28:14', null);

-- ----------------------------
-- Table structure for `case_201707`
-- ----------------------------
DROP TABLE IF EXISTS `case_201707`;
CREATE TABLE `case_201707` (
  `case_key` varchar(64) NOT NULL COMMENT '案件标识,格式：<yyyymmddHHmiss>_<警号>_<areacode>;不能编辑,内外提供视频时都自动生成;',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '案件标题;',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '案件开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '案件结束时间',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '上传时间',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '第1出警人警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '第1出警人警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '第1出警人单位编号',
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
  `apply_areacode` varchar(32) DEFAULT '' COMMENT '案件申请人部门ID',
  `apply_areaname` varchar(128) DEFAULT '' COMMENT '案件申请人部门名',
  `hand_status` int(1) NOT NULL DEFAULT '0' COMMENT '申请状态，0:初始态;1:待审核;2:移交完成',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '更新时间',
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
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '案件开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '案件结束时间',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '上传时间',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '第1出警人警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '第1出警人警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '第1出警人单位编号',
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
  `apply_areacode` varchar(32) DEFAULT '' COMMENT '案件申请人部门ID',
  `apply_areaname` varchar(128) DEFAULT '' COMMENT '案件申请人部门名',
  `hand_status` int(1) NOT NULL DEFAULT '0' COMMENT '申请状态，0:初始态;1:待审核;2:移交完成',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '更新时间',
  `edit_name` varchar(128) DEFAULT NULL COMMENT '编辑人',
  PRIMARY KEY (`case_key`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_areacode` (`areacode`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_201708
-- ----------------------------
INSERT INTO `case_201708` VALUES ('20170807093621_JX0227_3602010201', '20170623093621_王磊', '2017-08-07 09:36:21', '2017-08-07 09:36:54', '2017-08-07 14:03:21', '申忠', '086338', '4115', '信阳市公安局', '', '', '', '0', '', '', '0', '', '', '0', '', '', '', '', '', '0', '2017-08-07 17:37:35', '');

-- ----------------------------
-- Table structure for `case_201709`
-- ----------------------------
DROP TABLE IF EXISTS `case_201709`;
CREATE TABLE `case_201709` (
  `case_key` varchar(64) NOT NULL COMMENT '案件标识,格式：<yyyymmddHHmiss>_<警号>_<areacode>;不能编辑,内外提供视频时都自动生成;',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '案件标题;',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '案件开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '案件结束时间',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '上传时间',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '第1出警人警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '第1出警人警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '第1出警人单位编号',
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
  `apply_areacode` varchar(32) DEFAULT '' COMMENT '案件申请人部门ID',
  `apply_areaname` varchar(128) DEFAULT '' COMMENT '案件申请人部门名',
  `hand_status` int(1) NOT NULL DEFAULT '0' COMMENT '申请状态，0:初始态;1:待审核;2:移交完成',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '更新时间',
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
  `case_key` varchar(64) NOT NULL DEFAULT '' COMMENT '案件标识，同case_201708.case_key',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '拍摄时间',
  `end_time` datetime DEFAULT NULL COMMENT '视频结束时间',
  `wjcd` int(11) DEFAULT '0' COMMENT '文件长度',
  `wjlx` int(2) DEFAULT NULL COMMENT '0:未知,1:视频,2:音频,3:图片',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '单位,同area_dep.areacode',
  `areaname` varchar(128) DEFAULT '' COMMENT '单位名称',
  `cpxh` varchar(7) NOT NULL DEFAULT '0000000' COMMENT '产品序号(执法仪编号),文件由人工提供时统一填99999',
  `ccfwq_ip` varchar(64) DEFAULT NULL COMMENT '存储服务器',
  `ccwz` varchar(200) DEFAULT NULL COMMENT '存储位置',
  `bfwz` varchar(200) NOT NULL DEFAULT 'http://' COMMENT '播放位置',
  `wlwz` varchar(200) DEFAULT NULL COMMENT '物理位置,绝对路径',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '上传时间',
  `bzlx` int(2) DEFAULT '0' COMMENT '标注类型,0:未标注,1:标注(典型案例)',
  `gzz_ip` varchar(64) DEFAULT NULL COMMENT '工作站IP',
  `upload` int(2) NOT NULL DEFAULT '0' COMMENT '0:不上传，1：上传到中心服务器(重要视频)',
  `video_type` int(2) DEFAULT '9' COMMENT '视频分类(1:酒驾、2:事故、3:毒驾、4:违法、9:其他)',
  `source` int(1) NOT NULL DEFAULT '1' COMMENT '来源;1:执法记录仪,2:公安类,3:非公安类',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '',
  PRIMARY KEY (`wjbh`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_case_key` (`case_key`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_video_201706
-- ----------------------------
INSERT INTO `case_video_201706` VALUES ('TA00716_086338_20170623093621.MOV', '20170623093621_086338_4115', '2017-06-23 09:36:21', '2017-06-23 09:36:54', '33', '1', '申忠', '086338', '4115', '信阳市公安局', 'TA00716', '192.168.0.26', null, 'http://192.168.0.26:80/pe_fileG/pedata/TA00716/20170623/TA00716_086338_20170623093621.MOV', null, '2017-08-09 15:28:14', '0', '192.168.0.26', '0', '9', '1', '2017-08-09 15:28:14', '');

-- ----------------------------
-- Table structure for `case_video_201707`
-- ----------------------------
DROP TABLE IF EXISTS `case_video_201707`;
CREATE TABLE `case_video_201707` (
  `wjbh` varchar(100) NOT NULL DEFAULT '0' COMMENT '文件编号 <产口序号>_<警号>_<年月日时分秒>.<类型>',
  `case_key` varchar(64) NOT NULL DEFAULT '' COMMENT '案件标识，同case_201708.case_key',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '拍摄时间',
  `end_time` datetime DEFAULT NULL COMMENT '视频结束时间',
  `wjcd` int(11) DEFAULT '0' COMMENT '文件长度',
  `wjlx` int(2) DEFAULT NULL COMMENT '0:未知,1:视频,2:音频,3:图片',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '单位,同area_dep.areacode',
  `areaname` varchar(128) DEFAULT '' COMMENT '单位名称',
  `cpxh` varchar(7) NOT NULL DEFAULT '0000000' COMMENT '产品序号(执法仪编号),文件由人工提供时统一填99999',
  `ccfwq_ip` varchar(64) DEFAULT NULL COMMENT '存储服务器',
  `ccwz` varchar(200) DEFAULT NULL COMMENT '存储位置',
  `bfwz` varchar(200) NOT NULL DEFAULT 'http://' COMMENT '播放位置',
  `wlwz` varchar(200) DEFAULT NULL COMMENT '物理位置,绝对路径',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '上传时间',
  `bzlx` int(2) DEFAULT '0' COMMENT '标注类型,0:未标注,1:标注(典型案例)',
  `gzz_ip` varchar(64) DEFAULT NULL COMMENT '工作站IP',
  `upload` int(2) NOT NULL DEFAULT '0' COMMENT '0:不上传，1：上传到中心服务器(重要视频)',
  `video_type` int(2) DEFAULT '9' COMMENT '视频分类(1:酒驾、2:事故、3:毒驾、4:违法、9:其他)',
  `source` int(1) NOT NULL DEFAULT '1' COMMENT '来源;1:执法记录仪,2:公安类,3:非公安类',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '更新时间',
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
  `case_key` varchar(64) NOT NULL DEFAULT '' COMMENT '案件标识，同case_201708.case_key',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '拍摄时间',
  `end_time` datetime DEFAULT NULL COMMENT '视频结束时间',
  `wjcd` int(11) DEFAULT '0' COMMENT '文件长度',
  `wjlx` int(2) DEFAULT NULL COMMENT '0:未知,1:视频,2:音频,3:图片',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '单位,同area_dep.areacode',
  `areaname` varchar(128) DEFAULT '' COMMENT '单位名称',
  `cpxh` varchar(7) NOT NULL DEFAULT '0000000' COMMENT '产品序号(执法仪编号),文件由人工提供时统一填99999',
  `ccfwq_ip` varchar(64) DEFAULT NULL COMMENT '存储服务器',
  `ccwz` varchar(200) DEFAULT NULL COMMENT '存储位置',
  `bfwz` varchar(200) NOT NULL DEFAULT 'http://' COMMENT '播放位置',
  `wlwz` varchar(200) DEFAULT NULL COMMENT '物理位置,绝对路径',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '上传时间',
  `bzlx` int(2) DEFAULT '0' COMMENT '标注类型,0:未标注,1:标注(典型案例)',
  `gzz_ip` varchar(64) DEFAULT NULL COMMENT '工作站IP',
  `upload` int(2) NOT NULL DEFAULT '0' COMMENT '0:不上传，1：上传到中心服务器(重要视频)',
  `video_type` int(2) DEFAULT '9' COMMENT '视频分类(1:酒驾、2:事故、3:毒驾、4:违法、9:其他)',
  `source` int(1) NOT NULL DEFAULT '1' COMMENT '来源;1:执法记录仪,2:公安类,3:非公安类',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '',
  PRIMARY KEY (`wjbh`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_case_key` (`case_key`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_video_201708
-- ----------------------------
INSERT INTO `case_video_201708` VALUES ('TA00716_JX0227_20170807093621.MOV', '20170807093621_JX0227_3602010201', '2017-08-07 09:36:21', '2017-08-07 09:36:54', '33', '1', '申忠', '086338', '4115', '信阳市公安局', 'TA00716', '192.168.0.26', '', 'http://192.168.0.26:80/pe_fileG/pedata/TA00716/20170807/TA00716_JX0227_20170807093621.MOV', '', '2017-08-07 14:16:13', '0', '192.168.0.26', '0', '9', '1', '2017-08-07 14:16:13', '');

-- ----------------------------
-- Table structure for `case_video_201709`
-- ----------------------------
DROP TABLE IF EXISTS `case_video_201709`;
CREATE TABLE `case_video_201709` (
  `wjbh` varchar(100) NOT NULL DEFAULT '0' COMMENT '文件编号 <产口序号>_<警号>_<年月日时分秒>.<类型>',
  `case_key` varchar(64) NOT NULL DEFAULT '' COMMENT '案件标识，同case_201708.case_key',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '拍摄时间',
  `end_time` datetime DEFAULT NULL COMMENT '视频结束时间',
  `wjcd` int(11) DEFAULT '0' COMMENT '文件长度',
  `wjlx` int(2) DEFAULT NULL COMMENT '0:未知,1:视频,2:音频,3:图片',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '警员姓名',
  `jybh` varchar(6) NOT NULL DEFAULT '000000' COMMENT '警员编号',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '单位,同area_dep.areacode',
  `areaname` varchar(128) DEFAULT '' COMMENT '单位名称',
  `cpxh` varchar(7) NOT NULL DEFAULT '0000000' COMMENT '产品序号(执法仪编号),文件由人工提供时统一填99999',
  `ccfwq_ip` varchar(64) DEFAULT NULL COMMENT '存储服务器',
  `ccwz` varchar(200) DEFAULT NULL COMMENT '存储位置',
  `bfwz` varchar(200) NOT NULL DEFAULT 'http://' COMMENT '播放位置',
  `wlwz` varchar(200) DEFAULT NULL COMMENT '物理位置,绝对路径',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '上传时间',
  `bzlx` int(2) DEFAULT '0' COMMENT '标注类型,0:未标注,1:标注(典型案例)',
  `gzz_ip` varchar(64) DEFAULT NULL COMMENT '工作站IP',
  `upload` int(2) NOT NULL DEFAULT '0' COMMENT '0:不上传，1：上传到中心服务器(重要视频)',
  `video_type` int(2) DEFAULT '9' COMMENT '视频分类(1:酒驾、2:事故、3:毒驾、4:违法、9:其他)',
  `source` int(1) NOT NULL DEFAULT '1' COMMENT '来源;1:执法记录仪,2:公安类,3:非公安类',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '更新时间',
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
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '部门代码',
  `name` varchar(32) NOT NULL DEFAULT '无' COMMENT '警员名',
  `code` varchar(32) NOT NULL DEFAULT '无' COMMENT '登陆账号,一般是警员编号',
  `sex` char(4) DEFAULT '男',
  `phone` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `photo_path` varchar(128) DEFAULT NULL COMMENT '警员相片绝对位置(URL)',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '登陆密码',
  `roleid` int(11) NOT NULL DEFAULT '1',
  `bindingip` int(11) NOT NULL DEFAULT '0' COMMENT '0:未梆定,1:梆定',
  `clientip` varchar(16) DEFAULT NULL,
  `userarea` text COMMENT '管理员是非空.用户有权限的区域ID集合，逗号分隔',
  `login` int(1) NOT NULL DEFAULT '1' COMMENT '1:登陆;0:不能',
  PRIMARY KEY (`empid`),
  UNIQUE KEY `idx_code` (`code`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=652 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('650', '41', '超级管理员', 'admin', '男', null, null, '管理', null, '123456', '1', '0', null, '41', '1');
INSERT INTO `employee` VALUES ('651', '4115', '申忠', '086338', '男', '13849752188', null, '管理', null, '086338', '19', '0', null, '4115', '1');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '菜单父ID',
  `name` varchar(64) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `ordernum` int(11) DEFAULT '0',
  `iconcls` varchar(64) DEFAULT NULL,
  `enable` int(2) DEFAULT '1' COMMENT '0:禁用,1:启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=512 DEFAULT CHARSET=latin1;

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
INSERT INTO `menu` VALUES ('404', '400', '考核统计', 'Media/show_sat?satType=assessmeny_sat', '3', 'icon-film_link', '1');
INSERT INTO `menu` VALUES ('500', '0', '数据管理', '', '4', 'icon-script', '1');
INSERT INTO `menu` VALUES ('502', '500', '数据采集', 'Case/show_case', '1', '', '1');
INSERT INTO `menu` VALUES ('501', '500', '数据编辑', 'Case/show_case', '0', '', '1');
INSERT INTO `menu` VALUES ('104', '100', '警员录入', 'Employee/index', '4', 'icon-vcard', '1');
INSERT INTO `menu` VALUES ('105', '100', '警员查看', 'Employee/showEmpPhoto', '5', 'icon-picture_go', '1');
INSERT INTO `menu` VALUES ('203', '200', '工作站管理', 'WorkStation/ws_base_show', '3', null, '1');
INSERT INTO `menu` VALUES ('503', '500', '数据查询', 'Case/show_case', '2', '', '1');
INSERT INTO `menu` VALUES ('504', '0', '警情移交', '', '2', '', '1');
INSERT INTO `menu` VALUES ('506', '504', '申请列表', 'Case/show_apply_case', '0', '', '1');
INSERT INTO `menu` VALUES ('507', '504', '申请审核', 'Case/allow_case', '1', '', '1');
INSERT INTO `menu` VALUES ('508', '504', '移交视频', 'Case/show_applyed', '2', '', '1');
INSERT INTO `menu` VALUES ('509', '200', '服务器管理', 'Server/server_show', '2', '', '1');
INSERT INTO `menu` VALUES ('510', '100', '公告管理', 'Announce/index', '5', '', '1');
INSERT INTO `menu` VALUES ('511', '400', '公安岗勤', 'Case/sat_case', '3', '', '1');

-- ----------------------------
-- Table structure for `pe_base`
-- ----------------------------
DROP TABLE IF EXISTS `pe_base`;
CREATE TABLE `pe_base` (
  `cpxh` varchar(7) NOT NULL COMMENT '产品(执法仪)序号 ',
  `standard` varchar(30) DEFAULT NULL COMMENT '设备规格',
  `product` varchar(100) DEFAULT NULL COMMENT '生产厂家',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '单位,同area_dep.areacode',
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
INSERT INTO `pe_base` VALUES ('TA00716', null, null, '4115', '信阳市公安局', '086338', '申忠', '0', '0', null);
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
INSERT INTO `role` VALUES ('1', '系统管理员', '拥有所有操作权限', '100,101,102,103,104,105,200,201,202,203,300,301,302,303,304,400,401,403,404,405,406,407,408,500,501,502,503,504,1,504,506,507,508,509,510,511', '0');
INSERT INTO `role` VALUES ('19', '市局管理员', '拥有所有操作权限', '500,502,501,400,405,404,401,300,303,302,301,200,203,201,105,104,103,1,509,511', '1');
INSERT INTO `role` VALUES ('20', '警员', '拥有数据管理，日志查询,调阅查询', '500,502,501,201,303,302,1', '4');
INSERT INTO `role` VALUES ('22', '县局管理员', '没有角色管理，有其它权限', '500,502,501,400,405,404,401,200,203,201,300,303,302,301,105,104,103,1,509,511', '2');
INSERT INTO `role` VALUES ('23', '基层管理员', '没有角色管理，有其它权限', '500,502,501,400,405,404,401,200,203,201,300,303,302,301,105,104,103,1,509,511', '3');

-- ----------------------------
-- Table structure for `server_machine`
-- ----------------------------
DROP TABLE IF EXISTS `server_machine`;
CREATE TABLE `server_machine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '单位,同area_dep.areacode',
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
-- Table structure for `sync_case`
-- ----------------------------
DROP TABLE IF EXISTS `sync_case`;
CREATE TABLE `sync_case` (
  `tab_name` varchar(32) NOT NULL COMMENT '相关表',
  `case_key` varchar(64) NOT NULL COMMENT '案件标识',
  `status` int(1) NOT NULL COMMENT '1:增加;2:删除;3:修改',
  `update_time` bigint(15) NOT NULL COMMENT '当前操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_case
-- ----------------------------

-- ----------------------------
-- Table structure for `sync_case_video`
-- ----------------------------
DROP TABLE IF EXISTS `sync_case_video`;
CREATE TABLE `sync_case_video` (
  `tab_name` varchar(32) NOT NULL COMMENT '相关表',
  `wjbh` varchar(100) NOT NULL COMMENT '文件编号',
  `status` int(1) NOT NULL COMMENT '1:增加;2:删除;3:修改',
  `update_time` bigint(15) NOT NULL COMMENT '当前操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_case_video
-- ----------------------------

-- ----------------------------
-- Table structure for `sync_employee`
-- ----------------------------
DROP TABLE IF EXISTS `sync_employee`;
CREATE TABLE `sync_employee` (
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '部门代码',
  `name` varchar(32) NOT NULL DEFAULT '无' COMMENT '警员名',
  `old_code` varchar(32) DEFAULT NULL,
  `code` varchar(32) NOT NULL COMMENT '警员编号',
  `status` int(1) NOT NULL COMMENT '1:增加;2:删除;3:修改',
  `update_time` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_employee
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
  `areacode` varchar(32) DEFAULT '' COMMENT '单位,同area_dep.areacode',
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
