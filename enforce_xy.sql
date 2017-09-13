/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : enforce_xz

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 936

Date: 2017-09-07 15:18:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for area_dep
-- ----------------------------
DROP TABLE IF EXISTS `area_dep`;
CREATE TABLE `area_dep` (
  `areaid` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `proid` int(11) DEFAULT '1' COMMENT '�ݲ��ã��̶���1',
  `fatherareaid` int(11) NOT NULL COMMENT '���Ÿ�ID',
  `areaname` varchar(128) NOT NULL COMMENT '����(����)����',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '���Ŵ���',
  `rperson` varchar(64) DEFAULT NULL,
  `rphone` varchar(32) DEFAULT NULL,
  `is_read` int(1) NOT NULL DEFAULT '1' COMMENT '����Ȩ�ޣ�1:��д,0:ֻ��;������0���Ӽ�������0;',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '�������',
  PRIMARY KEY (`areaid`),
  UNIQUE KEY `idx_areacode` (`areacode`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=668 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of area_dep
-- ----------------------------
INSERT INTO `area_dep` VALUES ('196', '1', '0', '����ʡ������', '41', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('197', '1', '196', '�����й�����', '4115', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('198', '1', '197', '�ϳǷ־�', '411501', '', '', '1', '1');
INSERT INTO `area_dep` VALUES ('199', '1', '197', '���ӷ־�', '411502', '', '', '1', '5');
INSERT INTO `area_dep` VALUES ('200', '1', '197', '��ɽ�־�', '411503', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('201', '1', '197', '���۷־�', '411504', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('202', '1', '197', '��ӷ־�', '411505', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('203', '1', '197', 'ƽ�ŷ־�', '411506', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('204', '1', '197', '�����ݷ־�', '411507', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('205', '1', '197', '���·־�', '411508', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('206', '1', '197', '����ɽ�־�', '411509', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('207', '1', '197', '����־�', '411510', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('208', '1', '197', '�����ع�����', '411511', '������', '13949159672', '1', '1');
INSERT INTO `area_dep` VALUES ('209', '1', '197', 'ֱ���־�', '411512', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('210', '1', '197', '���ع�����', '411513', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('211', '1', '197', '��ɽ�ع�����', '411514', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('212', '1', '197', '�괨�ع�����', '411515', '�žֳ�', null, '1', '1');
INSERT INTO `area_dep` VALUES ('213', '1', '197', '��ɽ�ع�����', '411516', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('214', '1', '197', '�̳��ع�����', '411517', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('215', '1', '197', 'Ϣ�ع�����', '411518', '����', '13937666277', '1', '1');
INSERT INTO `area_dep` VALUES ('216', '1', '198', '�ϳǷ־�-�ϳ��ɳ���', '41150101', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('217', '1', '198', '�ϳǷ־�-��Ȩ�ɳ���', '41150102', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('218', '1', '198', '�ϳǷ־�-��վ�ɳ���', '41150103', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('219', '1', '198', '�ϳǷ־�-������ɳ���', '41150104', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('220', '1', '198', '�ϳǷ־�-��ţɽ�ɳ���', '41150105', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('221', '1', '198', '�ϳǷ־�-�����ɳ���', '41150106', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('222', '1', '198', '�ϳǷ־�-��ҵ�������ɳ���', '41150107', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('223', '1', '198', '�ϳǷ־�-�����ɳ���', '41150108', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('224', '1', '198', '�ϳǷ־�-��԰�ɳ���', '41150109', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('225', '1', '198', '�ϳǷ־�-�ϳǷ־־����ۺ���', '41150110', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('226', '1', '198', '�ϳǷ־�-�ϳǷ־�����������', '41150111', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('227', '1', '198', '�ϳǷ־�-�ϳǷ־�ִ��ִ�ͼල��', '41150112', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('228', '1', '198', '�ϳǷ־�-�ϳǷ־��ΰ��������', '41150113', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('229', '1', '198', '�ϳǷ־�-�ϳǷ־ְ��������', '41150114', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('230', '1', '198', '�ϳǷ־�-�ϳǷ־�Ѳ�߷��ش��', '41150115', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('231', '1', '199', '���ӷ־�-�����ɳ���', '41150201', '', '', '1', '10');
INSERT INTO `area_dep` VALUES ('232', '1', '199', '���ӷ־�-�����ɳ���', '41150202', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('233', '1', '199', '���ӷ־�-�κ��ɳ���', '41150203', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('234', '1', '199', '���ӷ־�-��˫���ɳ���', '41150204', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('235', '1', '199', '���ӷ־�-̷�Һ��ɳ���', '41150205', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('236', '1', '199', '���ӷ־�-ʮ�������ɳ���', '41150206', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('237', '1', '199', '���ӷ־�-���Һ��ɳ���', '41150207', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('238', '1', '199', '���ӷ־�-��ҵ��ɳ���', '41150208', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('239', '1', '199', '���ӷ־�-���Ӹ��ɳ���', '41150209', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('240', '1', '199', '���ӷ־�-�����ɳ���', '41150210', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('241', '1', '199', '���ӷ־�-���ӷ־־����ۺ���', '41150211', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('242', '1', '199', '���ӷ־�-���ӷ־�ִ��ִ�ͼල��', '41150212', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('243', '1', '199', '���ӷ־�-���ӷ־ַ��ƴ��', '41150213', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('244', '1', '199', '���ӷ־�-���ӷ־ְ��������', '41150214', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('245', '1', '199', '���ӷ־�-���ӷ־ֽ���Ѳ�����', '41150215', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('246', '1', '199', '���ӷ־�-���ӷ־�����������', '41150216', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('247', '1', '199', '���ӷ־�-���ӷ־��ΰ��������', '41150217', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('248', '1', '200', '��ɽ�־�-�������ɳ���', '41150301', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('249', '1', '200', '��ɽ�־�-ǰ���ɳ���', '41150302', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('250', '1', '200', '��ɽ�־�-����ɽ�ɳ���', '41150303', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('251', '1', '200', '��ɽ�־�-��ɽ�ɳ���', '41150304', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('252', '1', '200', '��ɽ�־�-���������ɳ���', '41150305', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('253', '1', '200', '��ɽ�־�-�����ɳ���', '41150306', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('254', '1', '200', '��ɽ�־�-��ɽ�־��ΰ����', '41150307', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('255', '1', '200', '��ɽ�־�-��ɽ�־ְ��������', '41150308', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('256', '1', '200', '��ɽ�־�-��ɽ�־����ڴ��', '41150309', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('257', '1', '200', '��ɽ�־�-��ɽ�־�Ѳ�߷��ش��', '41150310', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('258', '1', '200', '��ɽ�־�-��ɽ�־־����ۺ���', '41150311', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('259', '1', '200', '��ɽ�־�-��ɽ�־ּҾ�С������', '41150312', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('260', '1', '200', '��ɽ�־�-��ɽ�ɳ�������������', '41150313', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('261', '1', '200', '��ɽ�־�-��ɽ�־�ִ��ִ�ͼල��', '41150314', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('262', '1', '201', '���۷־�-�����ɳ���', '41150401', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('263', '1', '201', '���۷־�-�����ɳ���', '41150402', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('264', '1', '201', '���۷־�-�����ɳ���', '41150403', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('265', '1', '201', '���۷־�-�����ɳ���', '41150404', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('266', '1', '201', '���۷־�-�̼��ɳ���', '41150405', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('267', '1', '201', '���۷־�-�����ɳ���', '41150406', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('268', '1', '201', '���۷־�-�ʰ��ɳ���', '41150407', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('269', '1', '201', '���۷־�-��̨���ɳ���', '41150408', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('270', '1', '201', '���۷־�-������ַ�ɳ���', '41150409', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('271', '1', '201', '���۷־�-���۷־�ִ��ִ�ͼල��', '41150410', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('272', '1', '201', '���۷־�-���۷־ְ��������', '41150411', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('273', '1', '201', '���۷־�-���۷־��ΰ��������', '41150412', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('274', '1', '201', '���۷־�-���۷־�Ѳ�����', '41150413', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('275', '1', '201', '���۷־�-���۷־�����������', '41150414', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('276', '1', '201', '���۷־�-���۷־־����ۺ���', '41150415', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('277', '1', '201', '���۷־�-ƽ�����ɳ���', '41150416', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('278', '1', '201', '���۷־�-��ɽ�ɳ���', '41150417', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('279', '1', '201', '���۷־�-�������ɳ���', '41150418', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('280', '1', '202', '��ӷ־�-����ɳ���', '41150501', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('281', '1', '202', '��ӷ־�-�ŵ��ɳ���', '41150502', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('282', '1', '202', '��ӷ־�-�������ɳ���', '41150503', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('283', '1', '202', '��ӷ־�-�����ɳ���', '41150504', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('284', '1', '202', '��ӷ־�-Ф���ɳ���', '41150505', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('285', '1', '202', '��ӷ־�-Ф���ɳ���', '41150506', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('286', '1', '202', '��ӷ־�-�����ɳ���', '41150507', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('287', '1', '202', '��ӷ־�-��ӷ־־����ۺ���', '41150508', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('288', '1', '202', '��ӷ־�-��ӷ־�ִ��ִ����', '41150509', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('289', '1', '202', '��ӷ־�-��ӷ־ְ��������', '41150510', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('290', '1', '202', '��ӷ־�-��ӷ־�����������', '41150511', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('291', '1', '202', '��ӷ־�-��ӷ־�Ѳ�߷��ش��', '41150512', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('292', '1', '203', 'ƽ�ŷ־�-ƽ���ɳ���', '41150601', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('293', '1', '203', 'ƽ�ŷ־�-��ҵ԰�ɳ���', '41150602', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('294', '1', '203', 'ƽ�ŷ־�-����ɽ�ɳ���', '41150603', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('295', '1', '203', 'ƽ�ŷ־�-ƽ���ɳ���', '41150604', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('296', '1', '203', 'ƽ�ŷ־�-�����ɳ���', '41150605', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('297', '1', '203', 'ƽ�ŷ־�-ƽ�ŷ־־����ۺ���', '41150606', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('298', '1', '203', 'ƽ�ŷ־�-ƽ�ŷ־�ִ��ִ�ͼල��', '41150607', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('299', '1', '203', 'ƽ�ŷ־�-ƽ�ŷ־��ΰ��������', '41150608', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('300', '1', '203', 'ƽ�ŷ־�-ƽ�ŷ־ְ��������', '41150609', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('301', '1', '203', 'ƽ�ŷ־�-ƽ�ŷ־ֽ���Ѳ�����', '41150610', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('302', '1', '203', 'ƽ�ŷ־�-ƽ�ŷ־�����������', '41150611', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('303', '1', '204', '�����ݷ־�-�����ɳ���', '41150701', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('304', '1', '204', '�����ݷ־�-�����ݷ־�����������', '41150702', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('305', '1', '204', '�����ݷ־�-�����ݷ־ְ��������', '41150703', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('306', '1', '204', '�����ݷ־�-�����ݷ־־����ۺ���', '41150704', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('307', '1', '204', '�����ݷ־�-�����ݷ־�ִ��ִ�ͼල��', '41150705', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('308', '1', '204', '�����ݷ־�-�����ݷ־�', '41150706', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('309', '1', '205', '���·־�-����·�ɳ���', '41150801', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('310', '1', '205', '���·־�-�Ƕ��ɳ���', '41150802', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('311', '1', '205', '���·־�-���·־־����ۺ���', '41150803', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('312', '1', '205', '���·־�-���·־�����������', '41150804', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('313', '1', '205', '���·־�-���·־ְ��������', '41150805', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('314', '1', '206', '����ɽ�־�-���կ�ɳ���', '41150901', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('315', '1', '206', '����ɽ�־�-����ɽ�ɳ���', '41150902', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('316', '1', '206', '����ɽ�־�-����ɽ�־־����ۺ���', '41150903', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('317', '1', '206', '����ɽ�־�-����ɽ�־ְ��������', '41150904', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('318', '1', '206', '����ɽ�־�-����ɽ�־�����������', '41150905', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('319', '1', '207', '����־�-�����ɳ���', '41151001', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('320', '1', '207', '����־�-��ɽ�ɳ���', '41151002', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('321', '1', '207', '����־�-����־־����ۺ���', '41151003', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('322', '1', '207', '����־�-����־ְ��������', '41151004', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('323', '1', '207', '����־�-����־�����������', '41151005', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('324', '1', '208', '�����ع�����-�ǹ��ɳ���', '41151101', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('325', '1', '208', '�����ع�����-�����ɳ���', '41151102', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('326', '1', '208', '�����ع�����-�����ɳ���', '41151103', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('327', '1', '208', '�����ع�����-�����ɳ���', '41151104', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('328', '1', '208', '�����ع�����-�����ɳ���', '41151105', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('329', '1', '208', '�����ع�����-�����ɳ���', '41151106', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('330', '1', '208', '�����ع�����-«���ɳ���', '41151107', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('331', '1', '208', '�����ع�����-�����ɳ���', '41151108', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('332', '1', '208', '�����ع�����-̨ͷ�ɳ���', '41151109', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('333', '1', '208', '�����ع�����-Ѳ�ؾ����', '41151110', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('334', '1', '208', '�����ع�����-�ΰ����', '41151111', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('335', '1', '208', '�����ع�����-������', '41151112', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('336', '1', '208', '�����ع�����-�̾����', '41151113', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('337', '1', '208', '�����ع�����-��ҵ԰�ɳ���', '41151114', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('338', '1', '208', '�����ع�����-��˼�ɳ���', '41151115', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('339', '1', '208', '�����ع�����-�ȶ��ɳ���', '41151116', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('340', '1', '208', '�����ع�����-�����ɳ���', '41151117', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('341', '1', '208', '�����ع�����-�����ɳ���', '41151118', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('342', '1', '208', '�����ع�����-��ׯ�ɳ���', '41151119', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('343', '1', '208', '�����ع�����-�̳��ɳ���', '41151120', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('344', '1', '208', '�����ع�����-�������ɳ���', '41151121', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('345', '1', '208', '�����ع�����-�Լ��ɳ���', '41151122', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('346', '1', '208', '�����ع�����-�����ɳ���', '41151123', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('347', '1', '208', '�����ع�����-���Ҹ��ɳ���', '41151124', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('348', '1', '209', '�����й�����-���뾳���', '41151201', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('349', '1', '209', '�����й�����-�̾�֧��', '41151202', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('350', '1', '209', '�����й�����-110������', '41151203', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('351', '1', '209', '�����й�����-����֧��', '41151204', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('352', '1', '209', '�����й�����-Ѳ�ؾ�֧��', '41151205', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('353', '1', '209', '�����й�����-����֧��', '41151206', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('354', '1', '209', '�����й�����-����֧��', '41151207', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('355', '1', '209', '�����й�����-����֧��', '41151208', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('356', '1', '209', '�����й�����-�ΰ�֧��', '41151209', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('357', '1', '209', '�����й�����-����֧��', '41151210', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('358', '1', '209', '�����й�����-���ֲ�֧��', '41151211', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('359', '1', '209', '�����й�����-���֧��', '41151212', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('360', '1', '209', '�����й�����-��ͨ����֧��', '41151213', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('545', '1', '350', '110������-110���н�����վ', '4115120301', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('361', '1', '210', '���ع�����-Ѳ�ؾ����', '41151301', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('362', '1', '210', '���ع�����-�̾����', '41151302', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('363', '1', '210', '���ع�����-�참����', '41151303', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('364', '1', '210', '���ع�����-�ǹ��ɳ���', '41151304', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('365', '1', '210', '���ع�����-��ҵ�������ɳ���', '41151305', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('366', '1', '210', '���ع�����-�¼��ɳ���', '41151306', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('367', '1', '210', '���ع�����-����ɳ���', '41151307', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('368', '1', '210', '���ع�����-���ﷷ�ɳ���', '41151308', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('369', '1', '210', '���ع�����-ɳ���ɳ���', '41151309', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('370', '1', '210', '���ع�����-�ܺ��ɳ���', '41151310', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('371', '1', '210', '���ع�����-��º��ɳ���', '41151311', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('372', '1', '210', '���ع�����-ǧ���ɳ���', '41151312', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('373', '1', '210', '���ع�����-�պ��ɳ���', '41151313', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('374', '1', '210', '���ع�����-�����ɳ���', '41151314', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('375', '1', '210', '���ع�����-��ɽ���ɳ���', '41151315', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('376', '1', '210', '���ع�����-���Һ��ɳ���', '41151316', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('377', '1', '210', '���ع�����-�µ��ɳ���', '41151317', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('378', '1', '210', '���ع�����-�������ɳ���', '41151318', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('379', '1', '210', '���ع�����-�����ɳ���', '41151319', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('380', '1', '210', '���ع�����-�����ɳ���', '41151320', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('381', '1', '210', '���ع�����-��ɽ���ɳ���', '41151321', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('382', '1', '211', '��ɽ�ع�����-Ѳ�ؾ����', '41151401', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('383', '1', '211', '��ɽ�ع�����-ʮ���ɳ���', '41151402', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('384', '1', '211', '��ɽ�ع�����-��ɽ�ɳ���', '41151403', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('385', '1', '211', '��ɽ�ع�����-�������', '41151404', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('386', '1', '211', '��ɽ�ع�����-��ˮ�ɳ���', '41151405', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('387', '1', '211', '��ɽ�ع�����-�ΰ����', '41151406', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('388', '1', '211', '��ɽ�ع�����-կ���ɳ���', '41151407', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('389', '1', '211', '��ɽ�ع�����-�����ɳ���', '41151408', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('390', '1', '211', '��ɽ�ع�����-�̺��ɳ���', '41151409', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('391', '1', '211', '��ɽ�ع�����-�������ɳ���', '41151410', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('392', '1', '211', '��ɽ�ع�����-�ú��ɳ���', '41151411', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('393', '1', '211', '��ɽ�ع�����-����ɳ���', '41151412', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('394', '1', '211', '��ɽ�ع�����-��ȸ�ɳ���', '41151413', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('395', '1', '211', '��ɽ�ع�����-�̾����', '41151414', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('396', '1', '211', '��ɽ�ع�����-������ɳ���', '41151415', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('397', '1', '211', '��ɽ�ع�����-�ɾ��ɳ���', '41151416', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('398', '1', '211', '��ɽ�ع�����-�����ɳ���', '41151417', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('399', '1', '212', '�괨�ع�����-�����ɳ���', '41151501', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('400', '1', '212', '�괨�ع�����-�ϳ��ɳ���', '41151502', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('401', '1', '212', '�괨�ع�����-�����ɳ���', '41151503', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('402', '1', '212', '�괨�ع�����-�����ɳ���', '41151504', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('403', '1', '212', '�괨�ع�����-��ҵ�������ɳ���', '41151505', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('404', '1', '212', '�괨�ع�����-ɡ���ɳ���', '41151506', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('405', '1', '212', '�괨�ع�����-�����ɳ���', '41151507', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('406', '1', '212', '�괨�ع�����-κ���ɳ���', '41151508', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('407', '1', '212', '�괨�ع�����-ţ���ɳ���', '41151509', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('408', '1', '212', '�괨�ع�����-�Ƹ��ɳ���', '41151510', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('409', '1', '212', '�괨�ع�����-110רҵ������', '41151511', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('410', '1', '212', '�괨�ع�����-�참����', '41151512', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('411', '1', '212', '�괨�ع�����-Ѳ�ؾ����', '41151513', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('412', '1', '212', '�괨�ع�����-�������', '41151514', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('413', '1', '212', '�괨�ع�����-�̾����', '41151515', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('414', '1', '212', '�괨�ع�����-ɭ���ɳ���', '41151516', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('415', '1', '212', '�괨�ع�����-¡���ɳ���', '41151517', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('416', '1', '212', '�괨�ع�����-˫���ɳ���', '41151518', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('417', '1', '212', '�괨�ع�����-̸���ɳ���', '41151519', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('418', '1', '212', '�괨�ع�����-С�����ɳ���', '41151520', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('419', '1', '212', '�괨�ع�����-�����ɳ���', '41151521', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('420', '1', '212', '�괨�ع�����-�����ɳ���', '41151522', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('421', '1', '212', '�괨�ع�����-�׵��ɳ���', '41151523', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('422', '1', '212', '�괨�ع�����-�ʺ��ɳ���', '41151524', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('423', '1', '212', '�괨�ع�����-�����ɳ���', '41151525', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('424', '1', '212', '�괨�ع�����-�����ɳ���', '41151526', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('425', '1', '212', '�괨�ع�����-���͸��ɳ���', '41151527', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('426', '1', '212', '�괨�ع�����-�����ɳ���', '41151528', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('427', '1', '212', '�괨�ع�����-�ż��ɳ���', '41151529', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('428', '1', '212', '�괨�ع�����-�����ɳ���', '41151530', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('429', '1', '212', '�괨�ع�����-�������ɳ���', '41151531', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('430', '1', '212', '�괨�ع�����-�°참����', '41151532', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('431', '1', '213', '��ɽ�ع�����-�����ɳ���', '41151601', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('432', '1', '213', '��ɽ�ع�����-��ɽ�ɳ���', '41151602', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('433', '1', '213', '��ɽ�ع�����-�̾����', '41151603', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('434', '1', '213', '��ɽ�ع�����-��ˮ�ɳ���', '41151604', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('435', '1', '213', '��ɽ�ع�����-������', '41151605', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('436', '1', '213', '��ɽ�ع�����-Ѳ�ؾ����', '41151606', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('437', '1', '213', '��ɽ�ع�����-�������', '41151607', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('438', '1', '213', '��ɽ�ع�����-�ΰ����', '41151608', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('439', '1', '213', '��ɽ�ع�����-ִ���참����', '41151609', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('440', '1', '213', '��ɽ�ع�����-������', '41151610', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('441', '1', '213', '��ɽ�ع�����-������', '41151611', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('442', '1', '213', '��ɽ�ع�����-����ɳ���', '41151612', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('443', '1', '213', '��ɽ�ع�����-�����ɳ���', '41151613', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('444', '1', '213', '��ɽ�ع�����-�ȵ��ɳ���', '41151614', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('445', '1', '213', '��ɽ�ع�����-�ߵ��ɳ���', '41151615', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('446', '1', '213', '��ɽ�ع�����-骸��ɳ���', '41151616', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('447', '1', '213', '��ɽ�ع�����-��һ�ɳ���', '41151617', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('448', '1', '213', '��ɽ�ع�����-��·�ɳ���', '41151618', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('449', '1', '213', '��ɽ�ع�����-��ɽ�ɳ���', '41151619', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('450', '1', '213', '��ɽ�ع�����-�����ɳ���', '41151620', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('451', '1', '213', '��ɽ�ع�����-ç���ɳ���', '41151621', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('452', '1', '213', '��ɽ�ع�����-�ܵ��ɳ���', '41151622', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('453', '1', '213', '��ɽ�ع�����-��Զ�ɳ���', '41151623', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('454', '1', '213', '��ɽ�ع�����-ɽ���ɳ���', '41151624', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('455', '1', '213', '��ɽ�ع�����-�����ɳ���', '41151625', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('456', '1', '213', '��ɽ�ع�����-�����ɳ���', '41151626', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('457', '1', '213', '��ɽ�ع�����-��ɽ�ɳ���', '41151627', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('458', '1', '213', '��ɽ�ع�����-��ɽ���ɳ���', '41151628', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('459', '1', '213', '��ɽ�ع�����-�����ɳ���', '41151629', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('460', '1', '213', '��ɽ�ع�����-�����ɳ���', '41151630', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('461', '1', '213', '��ɽ�ع�����-�ǹ��ɳ���', '41151631', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('462', '1', '213', '��ɽ�ع�����-���ִ��', '41151632', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('463', '1', '213', '��ɽ�ع�����-�淶�ŷ�����ִ�����', '41151633', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('464', '1', '213', '��ɽ�ع�����-������', '41151634', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('465', '1', '213', '��ɽ�ع�����-�������', '41151635', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('466', '1', '214', '�̳��ع�����-���ƴ��', '41151701', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('467', '1', '214', '�̳��ع�����-Ѳ�ؾ����', '41151702', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('468', '1', '214', '�̳��ع�����-�ǹ��ɳ���', '41151703', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('469', '1', '214', '�̳��ع�����-����ɽ�ɳ���', '41151704', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('470', '1', '214', '�̳��ع�����-��ʯ���ɳ���', '41151705', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('471', '1', '214', '�̳��ع�����-�����ɳ���', '41151706', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('472', '1', '214', '�̳��ع�����-�̾����', '41151707', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('473', '1', '214', '�̳��ع�����-�ΰ����', '41151708', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('474', '1', '214', '�̳��ع�����-˫�����ɳ���', '41151709', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('475', '1', '214', '�̳��ع�����-�༯�ɳ���', '41151710', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('476', '1', '214', '�̳��ع�����-�����ɳ���', '41151711', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('477', '1', '214', '�̳��ع�����-۳���ɳ���', '41151712', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('478', '1', '214', '�̳��ع�����-�����ɳ���', '41151713', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('479', '1', '214', '�̳��ع�����-�ӷ����ɳ���', '41151714', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('480', '1', '214', '�̳��ع�����-��ɽ�ɳ���', '41151715', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('481', '1', '214', '�̳��ع�����-��Ȩ���ɳ���', '41151716', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('482', '1', '214', '�̳��ع�����-�������', '41151717', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('483', '1', '214', '�̳��ع�����-���̨�ɳ���', '41151718', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('484', '1', '214', '�̳��ع�����-��ɳ���', '41151719', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('485', '1', '214', '�̳��ع�����-����ɳ���', '41151720', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('486', '1', '214', '�̳��ع�����-�Ἧ�ɳ���', '41151721', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('487', '1', '214', '�̳��ع�����-����ɳ���', '41151722', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('488', '1', '214', '�̳��ع�����-��ҵ�������ɳ���', '41151723', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('489', '1', '214', '�̳��ع�����-����԰�ɳ���', '41151724', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('490', '1', '214', '�̳��ع�����-����ʯ�ɳ���', '41151725', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('491', '1', '214', '�̳��ع�����-��Ȫ���ɳ���', '41151726', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('492', '1', '214', '�̳��ع�����-�������ɳ���', '41151727', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('493', '1', '214', '�̳��ع�����-������', '41151728', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('494', '1', '214', '�̳��ع�����-�������', '41151729', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('495', '1', '214', '�̳��ع�����-���뾳�������', '41151730', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('496', '1', '214', '�̳��ع�����-�ư�ɽ����ɭ�ֹ�԰�ɳ���', '41151731', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('497', '1', '214', '�̳��ع�����-������', '41151732', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('498', '1', '214', '�̳ǹ�����-��ˮ�ɳ���', '41151733', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('499', '1', '215', 'Ϣ�ع�����-������', '41151801', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('500', '1', '215', 'Ϣ�ع�����-�̾����', '41151802', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('501', '1', '215', 'Ϣ�ع�����-�ΰ����', '41151803', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('502', '1', '215', 'Ϣ�ع�����-Ѳ�ؾ����', '41151804', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('503', '1', '215', 'Ϣ�ع�����-������', '41151805', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('504', '1', '215', 'Ϣ�ع�����-���뾳������', '41151806', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('505', '1', '215', 'Ϣ�ع�����-�������', '41151807', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('506', '1', '215', 'Ϣ�ع�����-�������', '41151808', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('507', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151809', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('508', '1', '215', 'Ϣ�ع�����-������', '41151810', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('509', '1', '215', 'Ϣ�ع�����-��ί', '41151811', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('510', '1', '215', 'Ϣ�ع�����-������', '41151812', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('511', '1', '215', 'Ϣ�ع�����-���', '41151813', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('512', '1', '215', 'Ϣ�ع�����-������', '41151814', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('513', '1', '215', 'Ϣ�ع�����-������', '41151815', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('514', '1', '215', 'Ϣ�ع�����-��Ƶ���', '41151816', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('515', '1', '215', 'Ϣ�ع�����-�����', '41151817', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('516', '1', '215', 'Ϣ�ع�����-�鱨����', '41151818', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('517', '1', '215', 'Ϣ�ع�����-ͨ�Ź�', '41151819', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('518', '1', '215', 'Ϣ�ع�����-���δ�', '41151820', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('519', '1', '215', 'Ϣ�ع�����-װ�������', '41151821', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('520', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151822', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('521', '1', '215', 'Ϣ�ع�����-��¥�ɳ���', '41151823', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('522', '1', '215', 'Ϣ�ع�����-�жɵ��ɳ���', '41151824', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('523', '1', '215', 'Ϣ�ع�����-������ɳ���', '41151825', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('524', '1', '215', 'Ϣ�ع�����-�ܻ����ɳ���', '41151826', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('525', '1', '215', 'Ϣ�ع�����-�ص��ɳ���', '41151827', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('526', '1', '215', 'Ϣ�ع�����-����ɳ���', '41151828', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('527', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151829', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('528', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151830', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('529', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151831', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('530', '1', '215', 'Ϣ�ع�����-·���ɳ���', '41151832', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('531', '1', '215', 'Ϣ�ع�����-�������ɳ���', '41151833', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('532', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151834', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('533', '1', '215', 'Ϣ�ع�����-����ɳ���', '41151835', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('534', '1', '215', 'Ϣ�ع�����-��ׯ�ɳ���', '41151836', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('535', '1', '215', 'Ϣ�ع�����-С���ɳ���', '41151837', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('536', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151838', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('537', '1', '215', 'Ϣ�ع�����-������ɳ���', '41151839', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('538', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151840', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('539', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151841', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('540', '1', '215', 'Ϣ�ع�����-�ٺ��ɳ���', '41151842', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('541', '1', '215', 'Ϣ�ع�����-����ɳ���', '41151843', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('542', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151844', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('543', '1', '215', 'Ϣ�ع�����-���ƴ��', '41151845', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('544', '1', '215', 'Ϣ�ع�����-�������', '41151846', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('546', '1', '350', '110������-110��������վ', '4115120302', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('547', '1', '350', '110������-110ƽ������վ', '4115120303', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('548', '1', '350', '110������-110��ɽ����վ', '4115120304', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('549', '1', '350', '110������-110���������վ', '4115120305', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('550', '1', '350', '110������-110���ϻ�԰����վ', '4115120306', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('551', '1', '350', '110������-110С��������վ', '4115120307', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('552', '1', '350', '110������-110�Ļ���������վ', '4115120308', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('553', '1', '350', '110������-110�����̳�����վ', '4115120309', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('554', '1', '350', '110������-110ũ��ѧԺ����վ', '4115120310', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('555', '1', '350', '110������-110��ʿ��������վ', '4115120311', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('556', '1', '350', '110������-110����������վ', '4115120312', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('557', '1', '350', '110������-110�����㳡����վ', '4115120313', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('558', '1', '351', '����֧�Ӱ�����', '4115120401', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('559', '1', '351', '����֧��ִ���������', '4115120402', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('560', '1', '351', '����֧�Ӱ참����', '4115120403', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('561', '1', '352', 'Ѳ�ؾ�֧�ӻ���', '4115120501', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('562', '1', '352', 'Ѳ�ؾ�֧�Ӱ������', '4115120502', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('563', '1', '352', 'Ѳ�ؾ�֧��ͻ�����', '4115120503', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('564', '1', '352', 'Ѳ�ؾ�֧���ؾ����', '4115120504', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('565', '1', '352', 'Ѳ�ؾ�֧�ӻ������', '4115120505', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('566', '1', '359', '���֧�ӿ�����', '4115121201', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('567', '1', '360', '����������', '4115121301', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('568', '1', '360', 'ƽ��������', '4115121302', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('569', '1', '360', '����������', '4115121303', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('570', '1', '360', '��·Ѳ���񾯴��', '4115121304', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('571', '1', '360', '��ͨ�¹ʴ������', '4115121305', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('572', '1', '360', '��ͨ�����ۺ�ִ�����', '4115121306', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('573', '1', '360', '������', '4115121307', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('574', '1', '360', '��ѵ��', '4115121308', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('575', '1', '360', '���ƿ�', '4115121309', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('576', '1', '360', '��ͨ�����', '4115121310', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('577', '1', '360', '�¹ʴ���ָ����', '4115121311', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('578', '1', '360', '���δ�', '4115121312', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('579', '1', '360', '������', '4115121313', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('580', '1', '360', 'װ�������', '4115121314', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('581', '1', '360', '�����', '4115121315', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('582', '1', '360', '��ί', '4115121316', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('583', '1', '360', '��ͨ��ʩ������', '4115121317', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('584', '1', '360', '�ϸɿ�', '4115121318', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('585', '1', '360', '�������', '4115121319', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('586', '1', '360', '��ɽ�ؽ������', '4115121320', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('587', '1', '360', '���ؽ������', '4115121321', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('593', '1', '567', '�����ж�', '411512130101', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('588', '1', '360', '�̳��ؽ������', '4115121322', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('589', '1', '360', '�����ؽ������', '4115121323', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('590', '1', '360', 'Ϣ�ع�����ͨ������', '4115121324', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('591', '1', '360', '�괨�ع�����ͨ������', '4115121325', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('592', '1', '360', '��ɽ�ع�����ͨ������', '4115121326', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('594', '1', '567', '��ɽ�ж�', '411512130102', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('595', '1', '567', '��վ�ж�', '411512130103', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('596', '1', '586', '�޳��ж�', '411512132001', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('597', '1', '586', '��ȸ�ж�', '411512132002', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('598', '1', '586', '��ɽ�¹��ж�', '411512132003', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('599', '1', '586', '�ú��ж�', '411512132004', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('600', '1', '587', '�����ӹ������վ', '411512132101', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('614', '1', '590', '���ж�', '411512132403', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('601', '1', '589', '�ǹ��ж�', '411512132301', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('602', '1', '589', '���ư�', '411512132302', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('603', '1', '589', 'Դͷ��', '411512132303', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('604', '1', '589', '�����ж�', '411512132304', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('605', '1', '589', '�����칫��', '411512132305', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('606', '1', '589', '�����ؽ�����ӳ�����', '411512132306', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('607', '1', '589', '�Լ��ж�', '411512132307', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('608', '1', '589', '�����ж�', '411512132308', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('609', '1', '589', '�����ж�', '411512132309', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('610', '1', '589', '�����¹��ж�', '411512132310', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('611', '1', '589', '�γ��ж�', '411512132311', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('612', '1', '590', '�ǹ��ж�', '411512132401', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('613', '1', '590', 'һ�ж�', '411512132402', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('615', '1', '590', '���ж�', '411512132404', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('616', '1', '590', '�����ж�', '411512132405', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('617', '1', '590', '�¹��ж�', '411512132406', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('618', '1', '590', '�γ��ж�', '411512132407', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('619', '1', '590', '������', '411512132408', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('620', '1', '590', '������', '411512132409', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('621', '1', '591', '�����ж�', '411512132501', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('622', '1', '591', '�����ж�', '411512132502', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('623', '1', '591', '�ǹ��ж�', '411512132503', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('624', '1', '591', 'Ρ���ж�', '411512132504', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('625', '1', '591', '�ʺ��ж�', '411512132505', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('626', '1', '591', 'ɡ���ж�', '411512132506', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('627', '1', '591', '�����ж�', '411512132507', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('628', '1', '591', '��ڶ�', '411512132508', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('629', '1', '591', '�Ƽ��ж�', '411512132509', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('630', '1', '591', '�¹��ж�', '411512132510', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('631', '1', '591', '���ݹ�', '411512132511', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('632', '1', '591', 'Υ������', '411512132512', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('633', '1', '592', '�칫��', '411512132601', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('635', '1', '592', '�����ж�', '411512132603', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('634', '1', '592', '�¹ʴ����ж�', '411512132602', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('636', '1', '592', 'ɳ���ж�', '411512132604', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('637', '1', '592', '�Ƽ��ж�', '411512132605', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('638', '1', '592', '������', '411512132606', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('639', '1', '592', '������', '411512132607', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('640', '1', '592', '�ǹ��ж�', '411512132608', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('641', '1', '592', '������ж�', '411512132609', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('642', '1', '592', '����ж�', '411512132610', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('643', '1', '592', '�ܵ��ж�', '411512132611', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('644', '1', '592', 'ɬ���ж�', '411512132612', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('645', '1', '592', '�����ж�', '411512132613', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('647', '1', '228', '�ϳǷ־��ΰ�������Ӷ��ж�', '4115011302', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('648', '1', '228', '�ϳǷ־��ΰ�����������ж�', '4115011303', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('646', '1', '228', '�ϳǷ־��ΰ��������һ�ж�', '4115011301', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('649', '1', '229', '�ϳǷ־ְ��������һ�ж�', '4115011401', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('650', '1', '229', '�ϳǷ־ְ�������Ӷ��ж�', '4115011402', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('651', '1', '229', '�ϳǷ־ְ�����������ж�', '4115011403', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('652', '1', '229', '�ϳǷ־ְ�����������ж�', '4115011404', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('653', '1', '229', '�ϳǷ־ְ�����������ж�', '4115011405', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('654', '1', '229', '�ϳǷ־ְ�����������ж�', '4115011406', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('655', '1', '229', '�ϳǷ־ְ�����������ж�', '4115011407', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('656', '1', '229', '�ϳǷ־ְ�������Ӱ��ж�', '4115011408', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('657', '1', '229', '�ϳǷ־ְ�������Ӿ��ж�', '4115011409', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('658', '1', '230', '�ϳǷ־�Ѳ�߷��ش��һ�ж�', '4115011501', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('659', '1', '230', '�ϳǷ־�Ѳ�߷��ش�Ӷ��ж�', '4115011502', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('660', '1', '230', '�ϳǷ־�Ѳ�߷��ش�����ж�', '4115011503', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('661', '1', '230', '�ϳǷ־�Ѳ�߷��ش�����ж�', '4115011504', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('662', '1', '566', '�������ܽ�һ�ж�', '411512120101', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('663', '1', '566', '�������̶ܽ��ж�', '411512120102', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('664', '1', '566', '������Ѳ�Ӽ���ж�', '411512120103', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('665', '1', '566', '��������Ѻ��Ѷ�ж�', '411512120104', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('666', '1', '566', '���������ڱ����ж�', '411512120105', null, null, '1', '1');
INSERT INTO `area_dep` VALUES ('667', '1', '566', '������Ů�ӹ����ж�', '411512120106', null, null, '1', '1');

-- ----------------------------
-- Table structure for area_dep_copy
-- ----------------------------
DROP TABLE IF EXISTS `area_dep_copy`;
CREATE TABLE `area_dep_copy` (
  `areaid` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `proid` int(11) DEFAULT '1' COMMENT '�ݲ��ã��̶���1',
  `fatherareaid` int(11) NOT NULL COMMENT '���Ÿ�ID',
  `areaname` varchar(128) NOT NULL COMMENT '����(����)����',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '���Ŵ���',
  `rperson` varchar(64) DEFAULT NULL,
  `rphone` varchar(32) DEFAULT NULL,
  `is_read` int(1) NOT NULL DEFAULT '1' COMMENT '����Ȩ�ޣ�1:��д,0:ֻ��;������0���Ӽ�������0;',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '�������',
  PRIMARY KEY (`areaid`),
  UNIQUE KEY `idx_areacode` (`areacode`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=668 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of area_dep_copy
-- ----------------------------
INSERT INTO `area_dep_copy` VALUES ('196', '1', '0', '����ʡ������', '41', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('197', '1', '196', '�����й�����', '4115', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('198', '1', '197', '�ϳǷ־�', '411501', '', '', '1', '2');
INSERT INTO `area_dep_copy` VALUES ('199', '1', '197', '���ӷ־�', '411502', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('200', '1', '197', '��ɽ�־�', '411503', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('201', '1', '197', '���۷־�', '411504', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('202', '1', '197', '��ӷ־�', '411505', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('203', '1', '197', 'ƽ�ŷ־�', '411506', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('204', '1', '197', '�����ݷ־�', '411507', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('205', '1', '197', '���·־�', '411508', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('206', '1', '197', '����ɽ�־�', '411509', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('207', '1', '197', '����־�', '411510', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('208', '1', '197', '�����ع�����', '411511', '������', '13949159672', '0', '1');
INSERT INTO `area_dep_copy` VALUES ('209', '1', '197', 'ֱ���־�', '411512', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('210', '1', '197', '���ع�����', '411513', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('211', '1', '197', '��ɽ�ع�����', '411514', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('212', '1', '197', '�괨�ع�����', '411515', '�žֳ�', null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('213', '1', '197', '��ɽ�ع�����', '411516', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('214', '1', '197', '�̳��ع�����', '411517', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('215', '1', '197', 'Ϣ�ع�����', '411518', '����', '13937666277', '0', '1');
INSERT INTO `area_dep_copy` VALUES ('216', '1', '198', '�ϳǷ־�-�ϳ��ɳ���', '41150101', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('217', '1', '198', '�ϳǷ־�-��Ȩ�ɳ���', '41150102', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('218', '1', '198', '�ϳǷ־�-��վ�ɳ���', '01150103', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('219', '1', '198', '�ϳǷ־�-������ɳ���', '01150104', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('220', '1', '198', '�ϳǷ־�-��ţɽ�ɳ���', '01150105', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('221', '1', '198', '�ϳǷ־�-�����ɳ���', '01150106', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('222', '1', '198', '�ϳǷ־�-��ҵ�������ɳ���', '01150107', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('223', '1', '198', '�ϳǷ־�-�����ɳ���', '01150108', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('224', '1', '198', '�ϳǷ־�-��԰�ɳ���', '01150109', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('225', '1', '198', '�ϳǷ־�-�ϳǷ־־����ۺ���', '01150110', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('226', '1', '198', '�ϳǷ־�-�ϳǷ־�����������', '01150111', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('227', '1', '198', '�ϳǷ־�-�ϳǷ־�ִ��ִ�ͼල��', '01150112', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('228', '1', '198', '�ϳǷ־�-�ϳǷ־��ΰ��������', '01150113', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('229', '1', '198', '�ϳǷ־�-�ϳǷ־ְ��������', '01150114', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('230', '1', '198', '�ϳǷ־�-�ϳǷ־�Ѳ�߷��ش��', '01150115', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('231', '1', '199', '���ӷ־�-�����ɳ���', '41150201', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('232', '1', '199', '���ӷ־�-�����ɳ���', '41150202', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('233', '1', '199', '���ӷ־�-�κ��ɳ���', '41150203', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('234', '1', '199', '���ӷ־�-��˫���ɳ���', '41150204', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('235', '1', '199', '���ӷ־�-̷�Һ��ɳ���', '41150205', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('236', '1', '199', '���ӷ־�-ʮ�������ɳ���', '41150206', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('237', '1', '199', '���ӷ־�-���Һ��ɳ���', '41150207', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('238', '1', '199', '���ӷ־�-��ҵ��ɳ���', '41150208', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('239', '1', '199', '���ӷ־�-���Ӹ��ɳ���', '41150209', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('240', '1', '199', '���ӷ־�-�����ɳ���', '41150210', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('241', '1', '199', '���ӷ־�-���ӷ־־����ۺ���', '41150211', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('242', '1', '199', '���ӷ־�-���ӷ־�ִ��ִ�ͼල��', '41150212', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('243', '1', '199', '���ӷ־�-���ӷ־ַ��ƴ��', '41150213', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('244', '1', '199', '���ӷ־�-���ӷ־ְ��������', '41150214', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('245', '1', '199', '���ӷ־�-���ӷ־ֽ���Ѳ�����', '41150215', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('246', '1', '199', '���ӷ־�-���ӷ־�����������', '41150216', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('247', '1', '199', '���ӷ־�-���ӷ־��ΰ��������', '41150217', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('248', '1', '200', '��ɽ�־�-�������ɳ���', '41150301', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('249', '1', '200', '��ɽ�־�-ǰ���ɳ���', '41150302', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('250', '1', '200', '��ɽ�־�-����ɽ�ɳ���', '41150303', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('251', '1', '200', '��ɽ�־�-��ɽ�ɳ���', '41150304', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('252', '1', '200', '��ɽ�־�-���������ɳ���', '41150305', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('253', '1', '200', '��ɽ�־�-�����ɳ���', '41150306', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('254', '1', '200', '��ɽ�־�-��ɽ�־��ΰ����', '41150307', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('255', '1', '200', '��ɽ�־�-��ɽ�־ְ��������', '41150308', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('256', '1', '200', '��ɽ�־�-��ɽ�־����ڴ��', '41150309', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('257', '1', '200', '��ɽ�־�-��ɽ�־�Ѳ�߷��ش��', '41150310', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('258', '1', '200', '��ɽ�־�-��ɽ�־־����ۺ���', '41150311', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('259', '1', '200', '��ɽ�־�-��ɽ�־ּҾ�С������', '41150312', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('260', '1', '200', '��ɽ�־�-��ɽ�ɳ�������������', '41150313', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('261', '1', '200', '��ɽ�־�-��ɽ�־�ִ��ִ�ͼල��', '41150314', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('262', '1', '201', '���۷־�-�����ɳ���', '41150401', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('263', '1', '201', '���۷־�-�����ɳ���', '41150402', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('264', '1', '201', '���۷־�-�����ɳ���', '41150403', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('265', '1', '201', '���۷־�-�����ɳ���', '41150404', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('266', '1', '201', '���۷־�-�̼��ɳ���', '41150405', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('267', '1', '201', '���۷־�-�����ɳ���', '41150406', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('268', '1', '201', '���۷־�-�ʰ��ɳ���', '41150407', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('269', '1', '201', '���۷־�-��̨���ɳ���', '41150408', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('270', '1', '201', '���۷־�-������ַ�ɳ���', '41150409', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('271', '1', '201', '���۷־�-���۷־�ִ��ִ�ͼල��', '41150410', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('272', '1', '201', '���۷־�-���۷־ְ��������', '41150411', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('273', '1', '201', '���۷־�-���۷־��ΰ��������', '41150412', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('274', '1', '201', '���۷־�-���۷־�Ѳ�����', '41150413', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('275', '1', '201', '���۷־�-���۷־�����������', '41150414', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('276', '1', '201', '���۷־�-���۷־־����ۺ���', '41150415', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('277', '1', '201', '���۷־�-ƽ�����ɳ���', '41150416', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('278', '1', '201', '���۷־�-��ɽ�ɳ���', '41150417', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('279', '1', '201', '���۷־�-�������ɳ���', '41150418', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('280', '1', '202', '��ӷ־�-����ɳ���', '41150501', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('281', '1', '202', '��ӷ־�-�ŵ��ɳ���', '41150502', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('282', '1', '202', '��ӷ־�-�������ɳ���', '41150503', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('283', '1', '202', '��ӷ־�-�����ɳ���', '41150504', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('284', '1', '202', '��ӷ־�-Ф���ɳ���', '41150505', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('285', '1', '202', '��ӷ־�-Ф���ɳ���', '41150506', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('286', '1', '202', '��ӷ־�-�����ɳ���', '41150507', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('287', '1', '202', '��ӷ־�-��ӷ־־����ۺ���', '41150508', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('288', '1', '202', '��ӷ־�-��ӷ־�ִ��ִ����', '41150509', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('289', '1', '202', '��ӷ־�-��ӷ־ְ��������', '41150510', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('290', '1', '202', '��ӷ־�-��ӷ־�����������', '41150511', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('291', '1', '202', '��ӷ־�-��ӷ־�Ѳ�߷��ش��', '41150512', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('292', '1', '203', 'ƽ�ŷ־�-ƽ���ɳ���', '41150601', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('293', '1', '203', 'ƽ�ŷ־�-��ҵ԰�ɳ���', '41150602', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('294', '1', '203', 'ƽ�ŷ־�-����ɽ�ɳ���', '41150603', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('295', '1', '203', 'ƽ�ŷ־�-ƽ���ɳ���', '41150604', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('296', '1', '203', 'ƽ�ŷ־�-�����ɳ���', '41150605', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('297', '1', '203', 'ƽ�ŷ־�-ƽ�ŷ־־����ۺ���', '41150606', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('298', '1', '203', 'ƽ�ŷ־�-ƽ�ŷ־�ִ��ִ�ͼල��', '41150607', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('299', '1', '203', 'ƽ�ŷ־�-ƽ�ŷ־��ΰ��������', '41150608', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('300', '1', '203', 'ƽ�ŷ־�-ƽ�ŷ־ְ��������', '41150609', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('301', '1', '203', 'ƽ�ŷ־�-ƽ�ŷ־ֽ���Ѳ�����', '41150610', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('302', '1', '203', 'ƽ�ŷ־�-ƽ�ŷ־�����������', '41150611', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('303', '1', '204', '�����ݷ־�-�����ɳ���', '41150701', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('304', '1', '204', '�����ݷ־�-�����ݷ־�����������', '41150702', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('305', '1', '204', '�����ݷ־�-�����ݷ־ְ��������', '41150703', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('306', '1', '204', '�����ݷ־�-�����ݷ־־����ۺ���', '41150704', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('307', '1', '204', '�����ݷ־�-�����ݷ־�ִ��ִ�ͼල��', '41150705', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('308', '1', '204', '�����ݷ־�-�����ݷ־�', '41150706', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('309', '1', '205', '���·־�-����·�ɳ���', '41150801', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('310', '1', '205', '���·־�-�Ƕ��ɳ���', '41150802', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('311', '1', '205', '���·־�-���·־־����ۺ���', '41150803', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('312', '1', '205', '���·־�-���·־�����������', '41150804', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('313', '1', '205', '���·־�-���·־ְ��������', '41150805', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('314', '1', '206', '����ɽ�־�-���կ�ɳ���', '41150901', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('315', '1', '206', '����ɽ�־�-����ɽ�ɳ���', '41150902', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('316', '1', '206', '����ɽ�־�-����ɽ�־־����ۺ���', '41150903', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('317', '1', '206', '����ɽ�־�-����ɽ�־ְ��������', '41150904', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('318', '1', '206', '����ɽ�־�-����ɽ�־�����������', '41150905', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('319', '1', '207', '����־�-�����ɳ���', '41151001', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('320', '1', '207', '����־�-��ɽ�ɳ���', '41151002', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('321', '1', '207', '����־�-����־־����ۺ���', '41151003', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('322', '1', '207', '����־�-����־ְ��������', '41151004', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('323', '1', '207', '����־�-����־�����������', '41151005', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('324', '1', '208', '�����ع�����-�ǹ��ɳ���', '41151101', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('325', '1', '208', '�����ع�����-�����ɳ���', '41151102', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('326', '1', '208', '�����ع�����-�����ɳ���', '41151103', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('327', '1', '208', '�����ع�����-�����ɳ���', '41151104', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('328', '1', '208', '�����ع�����-�����ɳ���', '41151105', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('329', '1', '208', '�����ع�����-�����ɳ���', '41151106', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('330', '1', '208', '�����ع�����-«���ɳ���', '41151107', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('331', '1', '208', '�����ع�����-�����ɳ���', '41151108', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('332', '1', '208', '�����ع�����-̨ͷ�ɳ���', '41151109', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('333', '1', '208', '�����ع�����-Ѳ�ؾ����', '41151110', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('334', '1', '208', '�����ع�����-�ΰ����', '41151111', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('335', '1', '208', '�����ع�����-������', '41151112', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('336', '1', '208', '�����ع�����-�̾����', '41151113', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('337', '1', '208', '�����ع�����-��ҵ԰�ɳ���', '41151114', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('338', '1', '208', '�����ع�����-��˼�ɳ���', '41151115', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('339', '1', '208', '�����ع�����-�ȶ��ɳ���', '41151116', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('340', '1', '208', '�����ع�����-�����ɳ���', '41151117', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('341', '1', '208', '�����ع�����-�����ɳ���', '41151118', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('342', '1', '208', '�����ع�����-��ׯ�ɳ���', '41151119', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('343', '1', '208', '�����ع�����-�̳��ɳ���', '41151120', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('344', '1', '208', '�����ع�����-�������ɳ���', '41151121', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('345', '1', '208', '�����ع�����-�Լ��ɳ���', '41151122', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('346', '1', '208', '�����ع�����-�����ɳ���', '41151123', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('347', '1', '208', '�����ع�����-���Ҹ��ɳ���', '41151124', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('348', '1', '209', '�����й�����-���뾳���', '41151201', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('349', '1', '209', '�����й�����-�̾�֧��', '41151202', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('350', '1', '209', '�����й�����-110������', '41151203', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('351', '1', '209', '�����й�����-����֧��', '41151204', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('352', '1', '209', '�����й�����-Ѳ�ؾ�֧��', '41151205', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('353', '1', '209', '�����й�����-����֧��', '41151206', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('354', '1', '209', '�����й�����-����֧��', '41151207', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('355', '1', '209', '�����й�����-����֧��', '41151208', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('356', '1', '209', '�����й�����-�ΰ�֧��', '41151209', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('357', '1', '209', '�����й�����-����֧��', '41151210', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('358', '1', '209', '�����й�����-���ֲ�֧��', '41151211', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('359', '1', '209', '�����й�����-���֧��', '41151212', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('360', '1', '209', '�����й�����-��ͨ����֧��', '41151213', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('545', '1', '350', '110������-110���н�����վ', '4115120301', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('361', '1', '210', '���ع�����-Ѳ�ؾ����', '41151301', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('362', '1', '210', '���ع�����-�̾����', '41151302', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('363', '1', '210', '���ع�����-�참����', '41151303', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('364', '1', '210', '���ع�����-�ǹ��ɳ���', '41151304', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('365', '1', '210', '���ع�����-��ҵ�������ɳ���', '41151305', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('366', '1', '210', '���ع�����-�¼��ɳ���', '41151306', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('367', '1', '210', '���ع�����-����ɳ���', '41151307', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('368', '1', '210', '���ع�����-���ﷷ�ɳ���', '41151308', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('369', '1', '210', '���ع�����-ɳ���ɳ���', '41151309', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('370', '1', '210', '���ع�����-�ܺ��ɳ���', '41151310', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('371', '1', '210', '���ع�����-��º��ɳ���', '41151311', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('372', '1', '210', '���ع�����-ǧ���ɳ���', '41151312', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('373', '1', '210', '���ع�����-�պ��ɳ���', '41151313', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('374', '1', '210', '���ع�����-�����ɳ���', '41151314', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('375', '1', '210', '���ع�����-��ɽ���ɳ���', '41151315', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('376', '1', '210', '���ع�����-���Һ��ɳ���', '41151316', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('377', '1', '210', '���ع�����-�µ��ɳ���', '41151317', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('378', '1', '210', '���ع�����-�������ɳ���', '41151318', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('379', '1', '210', '���ع�����-�����ɳ���', '41151319', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('380', '1', '210', '���ع�����-�����ɳ���', '41151320', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('381', '1', '210', '���ع�����-��ɽ���ɳ���', '41151321', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('382', '1', '211', '��ɽ�ع�����-Ѳ�ؾ����', '41151401', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('383', '1', '211', '��ɽ�ع�����-ʮ���ɳ���', '41151402', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('384', '1', '211', '��ɽ�ع�����-��ɽ�ɳ���', '41151403', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('385', '1', '211', '��ɽ�ع�����-�������', '41151404', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('386', '1', '211', '��ɽ�ع�����-��ˮ�ɳ���', '41151405', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('387', '1', '211', '��ɽ�ع�����-�ΰ����', '41151406', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('388', '1', '211', '��ɽ�ع�����-կ���ɳ���', '41151407', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('389', '1', '211', '��ɽ�ع�����-�����ɳ���', '41151408', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('390', '1', '211', '��ɽ�ع�����-�̺��ɳ���', '41151409', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('391', '1', '211', '��ɽ�ع�����-�������ɳ���', '41151410', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('392', '1', '211', '��ɽ�ع�����-�ú��ɳ���', '41151411', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('393', '1', '211', '��ɽ�ع�����-����ɳ���', '41151412', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('394', '1', '211', '��ɽ�ع�����-��ȸ�ɳ���', '41151413', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('395', '1', '211', '��ɽ�ع�����-�̾����', '41151414', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('396', '1', '211', '��ɽ�ع�����-������ɳ���', '41151415', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('397', '1', '211', '��ɽ�ع�����-�ɾ��ɳ���', '41151416', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('398', '1', '211', '��ɽ�ع�����-�����ɳ���', '41151417', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('399', '1', '212', '�괨�ع�����-�����ɳ���', '41151501', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('400', '1', '212', '�괨�ع�����-�ϳ��ɳ���', '41151502', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('401', '1', '212', '�괨�ع�����-�����ɳ���', '41151503', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('402', '1', '212', '�괨�ع�����-�����ɳ���', '41151504', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('403', '1', '212', '�괨�ع�����-��ҵ�������ɳ���', '41151505', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('404', '1', '212', '�괨�ع�����-ɡ���ɳ���', '41151506', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('405', '1', '212', '�괨�ع�����-�����ɳ���', '41151507', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('406', '1', '212', '�괨�ع�����-κ���ɳ���', '41151508', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('407', '1', '212', '�괨�ع�����-ţ���ɳ���', '41151509', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('408', '1', '212', '�괨�ع�����-�Ƹ��ɳ���', '41151510', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('409', '1', '212', '�괨�ع�����-110רҵ������', '41151511', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('410', '1', '212', '�괨�ع�����-�참����', '41151512', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('411', '1', '212', '�괨�ع�����-Ѳ�ؾ����', '41151513', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('412', '1', '212', '�괨�ع�����-�������', '41151514', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('413', '1', '212', '�괨�ع�����-�̾����', '41151515', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('414', '1', '212', '�괨�ع�����-ɭ���ɳ���', '41151516', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('415', '1', '212', '�괨�ع�����-¡���ɳ���', '41151517', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('416', '1', '212', '�괨�ع�����-˫���ɳ���', '41151518', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('417', '1', '212', '�괨�ع�����-̸���ɳ���', '41151519', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('418', '1', '212', '�괨�ع�����-С�����ɳ���', '41151520', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('419', '1', '212', '�괨�ع�����-�����ɳ���', '41151521', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('420', '1', '212', '�괨�ع�����-�����ɳ���', '41151522', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('421', '1', '212', '�괨�ع�����-�׵��ɳ���', '41151523', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('422', '1', '212', '�괨�ع�����-�ʺ��ɳ���', '41151524', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('423', '1', '212', '�괨�ع�����-�����ɳ���', '41151525', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('424', '1', '212', '�괨�ع�����-�����ɳ���', '41151526', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('425', '1', '212', '�괨�ع�����-���͸��ɳ���', '41151527', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('426', '1', '212', '�괨�ع�����-�����ɳ���', '41151528', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('427', '1', '212', '�괨�ع�����-�ż��ɳ���', '41151529', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('428', '1', '212', '�괨�ع�����-�����ɳ���', '41151530', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('429', '1', '212', '�괨�ع�����-�������ɳ���', '41151531', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('430', '1', '212', '�괨�ع�����-�°참����', '41151532', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('431', '1', '213', '��ɽ�ع�����-�����ɳ���', '41151601', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('432', '1', '213', '��ɽ�ع�����-��ɽ�ɳ���', '41151602', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('433', '1', '213', '��ɽ�ع�����-�̾����', '41151603', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('434', '1', '213', '��ɽ�ع�����-��ˮ�ɳ���', '41151604', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('435', '1', '213', '��ɽ�ع�����-������', '41151605', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('436', '1', '213', '��ɽ�ع�����-Ѳ�ؾ����', '41151606', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('437', '1', '213', '��ɽ�ع�����-�������', '41151607', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('438', '1', '213', '��ɽ�ع�����-�ΰ����', '41151608', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('439', '1', '213', '��ɽ�ع�����-ִ���참����', '41151609', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('440', '1', '213', '��ɽ�ع�����-������', '41151610', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('441', '1', '213', '��ɽ�ع�����-������', '41151611', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('442', '1', '213', '��ɽ�ع�����-����ɳ���', '41151612', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('443', '1', '213', '��ɽ�ع�����-�����ɳ���', '41151613', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('444', '1', '213', '��ɽ�ع�����-�ȵ��ɳ���', '41151614', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('445', '1', '213', '��ɽ�ع�����-�ߵ��ɳ���', '41151615', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('446', '1', '213', '��ɽ�ع�����-骸��ɳ���', '41151616', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('447', '1', '213', '��ɽ�ع�����-��һ�ɳ���', '41151617', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('448', '1', '213', '��ɽ�ع�����-��·�ɳ���', '41151618', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('449', '1', '213', '��ɽ�ع�����-��ɽ�ɳ���', '41151619', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('450', '1', '213', '��ɽ�ع�����-�����ɳ���', '41151620', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('451', '1', '213', '��ɽ�ع�����-ç���ɳ���', '41151621', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('452', '1', '213', '��ɽ�ع�����-�ܵ��ɳ���', '41151622', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('453', '1', '213', '��ɽ�ع�����-��Զ�ɳ���', '41151623', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('454', '1', '213', '��ɽ�ع�����-ɽ���ɳ���', '41151624', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('455', '1', '213', '��ɽ�ع�����-�����ɳ���', '41151625', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('456', '1', '213', '��ɽ�ع�����-�����ɳ���', '41151626', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('457', '1', '213', '��ɽ�ع�����-��ɽ�ɳ���', '41151627', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('458', '1', '213', '��ɽ�ع�����-��ɽ���ɳ���', '41151628', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('459', '1', '213', '��ɽ�ع�����-�����ɳ���', '41151629', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('460', '1', '213', '��ɽ�ع�����-�����ɳ���', '41151630', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('461', '1', '213', '��ɽ�ع�����-�ǹ��ɳ���', '41151631', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('462', '1', '213', '��ɽ�ع�����-���ִ��', '41151632', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('463', '1', '213', '��ɽ�ع�����-�淶�ŷ�����ִ�����', '41151633', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('464', '1', '213', '��ɽ�ع�����-������', '41151634', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('465', '1', '213', '��ɽ�ع�����-�������', '41151635', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('466', '1', '214', '�̳��ع�����-���ƴ��', '41151701', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('467', '1', '214', '�̳��ع�����-Ѳ�ؾ����', '41151702', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('468', '1', '214', '�̳��ع�����-�ǹ��ɳ���', '41151703', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('469', '1', '214', '�̳��ع�����-����ɽ�ɳ���', '41151704', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('470', '1', '214', '�̳��ع�����-��ʯ���ɳ���', '41151705', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('471', '1', '214', '�̳��ع�����-�����ɳ���', '41151706', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('472', '1', '214', '�̳��ع�����-�̾����', '41151707', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('473', '1', '214', '�̳��ع�����-�ΰ����', '41151708', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('474', '1', '214', '�̳��ع�����-˫�����ɳ���', '41151709', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('475', '1', '214', '�̳��ع�����-�༯�ɳ���', '41151710', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('476', '1', '214', '�̳��ع�����-�����ɳ���', '41151711', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('477', '1', '214', '�̳��ع�����-۳���ɳ���', '41151712', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('478', '1', '214', '�̳��ع�����-�����ɳ���', '41151713', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('479', '1', '214', '�̳��ع�����-�ӷ����ɳ���', '41151714', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('480', '1', '214', '�̳��ع�����-��ɽ�ɳ���', '41151715', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('481', '1', '214', '�̳��ع�����-��Ȩ���ɳ���', '41151716', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('482', '1', '214', '�̳��ع�����-�������', '41151717', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('483', '1', '214', '�̳��ع�����-���̨�ɳ���', '41151718', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('484', '1', '214', '�̳��ع�����-��ɳ���', '41151719', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('485', '1', '214', '�̳��ع�����-����ɳ���', '41151720', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('486', '1', '214', '�̳��ع�����-�Ἧ�ɳ���', '41151721', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('487', '1', '214', '�̳��ع�����-����ɳ���', '41151722', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('488', '1', '214', '�̳��ع�����-��ҵ�������ɳ���', '41151723', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('489', '1', '214', '�̳��ع�����-����԰�ɳ���', '41151724', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('490', '1', '214', '�̳��ع�����-����ʯ�ɳ���', '41151725', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('491', '1', '214', '�̳��ع�����-��Ȫ���ɳ���', '41151726', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('492', '1', '214', '�̳��ع�����-�������ɳ���', '41151727', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('493', '1', '214', '�̳��ع�����-������', '41151728', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('494', '1', '214', '�̳��ع�����-�������', '41151729', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('495', '1', '214', '�̳��ع�����-���뾳�������', '41151730', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('496', '1', '214', '�̳��ع�����-�ư�ɽ����ɭ�ֹ�԰�ɳ���', '41151731', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('497', '1', '214', '�̳��ع�����-������', '41151732', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('498', '1', '214', '�̳ǹ�����-��ˮ�ɳ���', '41151733', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('499', '1', '215', 'Ϣ�ع�����-������', '41151801', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('500', '1', '215', 'Ϣ�ع�����-�̾����', '41151802', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('501', '1', '215', 'Ϣ�ع�����-�ΰ����', '41151803', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('502', '1', '215', 'Ϣ�ع�����-Ѳ�ؾ����', '41151804', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('503', '1', '215', 'Ϣ�ع�����-������', '41151805', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('504', '1', '215', 'Ϣ�ع�����-���뾳������', '41151806', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('505', '1', '215', 'Ϣ�ع�����-�������', '41151807', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('506', '1', '215', 'Ϣ�ع�����-�������', '41151808', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('507', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151809', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('508', '1', '215', 'Ϣ�ع�����-������', '41151810', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('509', '1', '215', 'Ϣ�ع�����-��ί', '41151811', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('510', '1', '215', 'Ϣ�ع�����-������', '41151812', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('511', '1', '215', 'Ϣ�ع�����-���', '41151813', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('512', '1', '215', 'Ϣ�ع�����-������', '41151814', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('513', '1', '215', 'Ϣ�ع�����-������', '41151815', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('514', '1', '215', 'Ϣ�ع�����-��Ƶ���', '41151816', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('515', '1', '215', 'Ϣ�ع�����-�����', '41151817', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('516', '1', '215', 'Ϣ�ع�����-�鱨����', '41151818', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('517', '1', '215', 'Ϣ�ع�����-ͨ�Ź�', '41151819', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('518', '1', '215', 'Ϣ�ع�����-���δ�', '41151820', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('519', '1', '215', 'Ϣ�ع�����-װ�������', '41151821', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('520', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151822', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('521', '1', '215', 'Ϣ�ع�����-��¥�ɳ���', '41151823', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('522', '1', '215', 'Ϣ�ع�����-�жɵ��ɳ���', '41151824', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('523', '1', '215', 'Ϣ�ع�����-������ɳ���', '41151825', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('524', '1', '215', 'Ϣ�ع�����-�ܻ����ɳ���', '41151826', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('525', '1', '215', 'Ϣ�ع�����-�ص��ɳ���', '41151827', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('526', '1', '215', 'Ϣ�ع�����-����ɳ���', '41151828', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('527', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151829', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('528', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151830', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('529', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151831', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('530', '1', '215', 'Ϣ�ع�����-·���ɳ���', '41151832', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('531', '1', '215', 'Ϣ�ع�����-�������ɳ���', '41151833', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('532', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151834', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('533', '1', '215', 'Ϣ�ع�����-����ɳ���', '41151835', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('534', '1', '215', 'Ϣ�ع�����-��ׯ�ɳ���', '41151836', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('535', '1', '215', 'Ϣ�ع�����-С���ɳ���', '41151837', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('536', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151838', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('537', '1', '215', 'Ϣ�ع�����-������ɳ���', '41151839', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('538', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151840', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('539', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151841', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('540', '1', '215', 'Ϣ�ع�����-�ٺ��ɳ���', '41151842', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('541', '1', '215', 'Ϣ�ع�����-����ɳ���', '41151843', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('542', '1', '215', 'Ϣ�ع�����-�����ɳ���', '41151844', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('543', '1', '215', 'Ϣ�ع�����-���ƴ��', '41151845', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('544', '1', '215', 'Ϣ�ع�����-�������', '41151846', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('546', '1', '350', '110������-110��������վ', '4115120302', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('547', '1', '350', '110������-110ƽ������վ', '4115120303', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('548', '1', '350', '110������-110��ɽ����վ', '4115120304', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('549', '1', '350', '110������-110���������վ', '4115120305', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('550', '1', '350', '110������-110���ϻ�԰����վ', '4115120306', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('551', '1', '350', '110������-110С��������վ', '4115120307', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('552', '1', '350', '110������-110�Ļ���������վ', '4115120308', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('553', '1', '350', '110������-110�����̳�����վ', '4115120309', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('554', '1', '350', '110������-110ũ��ѧԺ����վ', '4115120310', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('555', '1', '350', '110������-110��ʿ��������վ', '4115120311', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('556', '1', '350', '110������-110����������վ', '4115120312', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('557', '1', '350', '110������-110�����㳡����վ', '4115120313', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('558', '1', '351', '����֧�Ӱ�����', '4115120401', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('559', '1', '351', '����֧��ִ���������', '4115120402', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('560', '1', '351', '����֧�Ӱ참����', '4115120403', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('561', '1', '352', 'Ѳ�ؾ�֧�ӻ���', '4115120501', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('562', '1', '352', 'Ѳ�ؾ�֧�Ӱ������', '4115120502', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('563', '1', '352', 'Ѳ�ؾ�֧��ͻ�����', '4115120503', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('564', '1', '352', 'Ѳ�ؾ�֧���ؾ����', '4115120504', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('565', '1', '352', 'Ѳ�ؾ�֧�ӻ������', '4115120505', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('566', '1', '359', '���֧�ӿ�����', '4115121201', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('567', '1', '360', '����������', '4115121301', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('568', '1', '360', 'ƽ��������', '4115121302', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('569', '1', '360', '����������', '4115121303', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('570', '1', '360', '��·Ѳ���񾯴��', '4115121304', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('571', '1', '360', '��ͨ�¹ʴ������', '4115121305', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('572', '1', '360', '��ͨ�����ۺ�ִ�����', '4115121306', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('573', '1', '360', '������', '4115121307', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('574', '1', '360', '��ѵ��', '4115121308', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('575', '1', '360', '���ƿ�', '4115121309', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('576', '1', '360', '��ͨ�����', '4115121310', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('577', '1', '360', '�¹ʴ���ָ����', '4115121311', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('578', '1', '360', '���δ�', '4115121312', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('579', '1', '360', '������', '4115121313', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('580', '1', '360', 'װ�������', '4115121314', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('581', '1', '360', '�����', '4115121315', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('582', '1', '360', '��ί', '4115121316', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('583', '1', '360', '��ͨ��ʩ������', '4115121317', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('584', '1', '360', '�ϸɿ�', '4115121318', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('585', '1', '360', '�������', '4115121319', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('586', '1', '360', '��ɽ�ؽ������', '4115121320', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('587', '1', '360', '���ؽ������', '4115121321', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('593', '1', '567', '�����ж�', '411512130101', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('588', '1', '360', '�̳��ؽ������', '4115121322', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('589', '1', '360', '�����ؽ������', '4115121323', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('590', '1', '360', 'Ϣ�ع�����ͨ������', '4115121324', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('591', '1', '360', '�괨�ع�����ͨ������', '4115121325', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('592', '1', '360', '��ɽ�ع�����ͨ������', '4115121326', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('594', '1', '567', '��ɽ�ж�', '411512130102', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('595', '1', '567', '��վ�ж�', '411512130103', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('596', '1', '586', '�޳��ж�', '411512132001', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('597', '1', '586', '��ȸ�ж�', '411512132002', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('598', '1', '586', '��ɽ�¹��ж�', '411512132003', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('599', '1', '586', '�ú��ж�', '411512132004', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('600', '1', '587', '�����ӹ������վ', '411512132101', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('614', '1', '590', '���ж�', '411512132403', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('601', '1', '589', '�ǹ��ж�', '411512132301', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('602', '1', '589', '���ư�', '411512132302', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('603', '1', '589', 'Դͷ��', '411512132303', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('604', '1', '589', '�����ж�', '411512132304', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('605', '1', '589', '�����칫��', '411512132305', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('606', '1', '589', '�����ؽ�����ӳ�����', '411512132306', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('607', '1', '589', '�Լ��ж�', '411512132307', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('608', '1', '589', '�����ж�', '411512132308', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('609', '1', '589', '�����ж�', '411512132309', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('610', '1', '589', '�����¹��ж�', '411512132310', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('611', '1', '589', '�γ��ж�', '411512132311', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('612', '1', '590', '�ǹ��ж�', '411512132401', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('613', '1', '590', 'һ�ж�', '411512132402', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('615', '1', '590', '���ж�', '411512132404', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('616', '1', '590', '�����ж�', '411512132405', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('617', '1', '590', '�¹��ж�', '411512132406', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('618', '1', '590', '�γ��ж�', '411512132407', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('619', '1', '590', '������', '411512132408', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('620', '1', '590', '������', '411512132409', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('621', '1', '591', '�����ж�', '411512132501', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('622', '1', '591', '�����ж�', '411512132502', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('623', '1', '591', '�ǹ��ж�', '411512132503', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('624', '1', '591', 'Ρ���ж�', '411512132504', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('625', '1', '591', '�ʺ��ж�', '411512132505', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('626', '1', '591', 'ɡ���ж�', '411512132506', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('627', '1', '591', '�����ж�', '411512132507', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('628', '1', '591', '��ڶ�', '411512132508', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('629', '1', '591', '�Ƽ��ж�', '411512132509', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('630', '1', '591', '�¹��ж�', '411512132510', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('631', '1', '591', '���ݹ�', '411512132511', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('632', '1', '591', 'Υ������', '411512132512', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('633', '1', '592', '�칫��', '411512132601', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('635', '1', '592', '�����ж�', '411512132603', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('634', '1', '592', '�¹ʴ����ж�', '411512132602', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('636', '1', '592', 'ɳ���ж�', '411512132604', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('637', '1', '592', '�Ƽ��ж�', '411512132605', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('638', '1', '592', '������', '411512132606', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('639', '1', '592', '������', '411512132607', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('640', '1', '592', '�ǹ��ж�', '411512132608', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('641', '1', '592', '������ж�', '411512132609', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('642', '1', '592', '����ж�', '411512132610', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('643', '1', '592', '�ܵ��ж�', '411512132611', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('644', '1', '592', 'ɬ���ж�', '411512132612', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('645', '1', '592', '�����ж�', '411512132613', null, null, '0', '1');
INSERT INTO `area_dep_copy` VALUES ('647', '1', '228', '�ϳǷ־��ΰ�������Ӷ��ж�', '4115011302', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('648', '1', '228', '�ϳǷ־��ΰ�����������ж�', '4115011303', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('646', '1', '228', '�ϳǷ־��ΰ��������һ�ж�', '4115011301', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('649', '1', '229', '�ϳǷ־ְ��������һ�ж�', '4115011401', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('650', '1', '229', '�ϳǷ־ְ�������Ӷ��ж�', '4115011402', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('651', '1', '229', '�ϳǷ־ְ�����������ж�', '4115011403', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('652', '1', '229', '�ϳǷ־ְ�����������ж�', '4115011404', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('653', '1', '229', '�ϳǷ־ְ�����������ж�', '4115011405', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('654', '1', '229', '�ϳǷ־ְ�����������ж�', '4115011406', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('655', '1', '229', '�ϳǷ־ְ�����������ж�', '4115011407', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('656', '1', '229', '�ϳǷ־ְ�������Ӱ��ж�', '4115011408', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('657', '1', '229', '�ϳǷ־ְ�������Ӿ��ж�', '4115011409', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('658', '1', '230', '�ϳǷ־�Ѳ�߷��ش��һ�ж�', '4115011501', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('659', '1', '230', '�ϳǷ־�Ѳ�߷��ش�Ӷ��ж�', '4115011502', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('660', '1', '230', '�ϳǷ־�Ѳ�߷��ش�����ж�', '4115011503', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('661', '1', '230', '�ϳǷ־�Ѳ�߷��ش�����ж�', '4115011504', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('662', '1', '566', '�������ܽ�һ�ж�', '411512120101', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('663', '1', '566', '�������̶ܽ��ж�', '411512120102', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('664', '1', '566', '������Ѳ�Ӽ���ж�', '411512120103', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('665', '1', '566', '��������Ѻ��Ѷ�ж�', '411512120104', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('666', '1', '566', '���������ڱ����ж�', '411512120105', null, null, '1', '1');
INSERT INTO `area_dep_copy` VALUES ('667', '1', '566', '������Ů�ӹ����ж�', '411512120106', null, null, '1', '1');

-- ----------------------------
-- Table structure for area_pro
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
INSERT INTO `area_pro` VALUES ('1', '����');

-- ----------------------------
-- Table structure for case_201706
-- ----------------------------
DROP TABLE IF EXISTS `case_201706`;
CREATE TABLE `case_201706` (
  `case_key` varchar(64) NOT NULL COMMENT '������ʶ,��ʽ��<yyyymmddHHmiss>_<����>_<areacode>;���ܱ༭,�����ṩ��Ƶʱ���Զ�����;',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '��������;',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '������ʼʱ��',
  `end_time` datetime DEFAULT NULL COMMENT '��������ʱ��',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '�ϴ�ʱ��',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '��1�����˾�Ա����',
  `jybh` varchar(32) NOT NULL DEFAULT '000000' COMMENT '��1�����˾�Ա���',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '��1�����˵�λ���',
  `areaname` varchar(128) DEFAULT '' COMMENT '��1�����˵�λ����',
  `alarm_no` varchar(40) DEFAULT '' COMMENT '������',
  `alarm_name` varchar(128) DEFAULT '' COMMENT '���¼�����',
  `alarm_addr` varchar(128) DEFAULT '',
  `alarm_type` int(1) NOT NULL DEFAULT '0' COMMENT '��������;0:δ�༭(3����);1:һ�㾯��(6����);2:�ش���(����);3:�谭��ִ����������(����);4:����ǿ��ִ��(����);5:�������ʼ��(6����);6:��Ч����(7��);7:����(6����)',
  `case_no` varchar(40) DEFAULT '' COMMENT '�������',
  `case_name` varchar(128) DEFAULT '' COMMENT '��������(����)',
  `case_type` int(1) NOT NULL DEFAULT '0' COMMENT '��������;0:δ֪,1:���°���(����),2:��������(����)',
  `case_dept` varchar(64) DEFAULT NULL COMMENT '�참��λ',
  `case_empl` varchar(16) DEFAULT NULL COMMENT '�참��Ա',
  `remark` varchar(256) DEFAULT '' COMMENT '��ע',
  `apply_jybh` varchar(32) DEFAULT '' COMMENT '�������뾯Ա���',
  `apply_jyxm` varchar(60) DEFAULT '' COMMENT '�������뾯Ա��',
  `apply_areacode` varchar(32) DEFAULT '' COMMENT '���������˲���ID',
  `apply_areaname` varchar(128) DEFAULT '' COMMENT '���������˲�����',
  `apply_time` datetime DEFAULT '2017-01-01 00:00:00' COMMENT '�ƽ�����',
  `hand_status` int(1) NOT NULL DEFAULT '0' COMMENT '����״̬��0:��ʼ̬;1:�����;2:�ƽ����',
  `source` int(1) DEFAULT '1' COMMENT '��Դ;1:ִ����¼��,2:������,3:�ǹ�����',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `edit_name` varchar(128) DEFAULT NULL COMMENT '�༭��',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:����,1:��ɾ,2:Ӳɾ',
  PRIMARY KEY (`case_key`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_areacode` (`areacode`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_201706
-- ----------------------------
INSERT INTO `case_201706` VALUES ('20170623093621_086338_4115', '20170623093621_����', '2017-06-23 09:36:21', '2017-06-23 09:36:54', '2017-08-12 11:18:57', '����', '086338', '4115', '�����й�����', '111222333', 'test', '', '7', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-08-25 17:35:22', '��������Ա', '0');

-- ----------------------------
-- Table structure for case_201707
-- ----------------------------
DROP TABLE IF EXISTS `case_201707`;
CREATE TABLE `case_201707` (
  `case_key` varchar(64) NOT NULL COMMENT '������ʶ,��ʽ��<yyyymmddHHmiss>_<����>_<areacode>;���ܱ༭,�����ṩ��Ƶʱ���Զ�����;',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '��������;',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '������ʼʱ��',
  `end_time` datetime DEFAULT NULL COMMENT '��������ʱ��',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '�ϴ�ʱ��',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '��1�����˾�Ա����',
  `jybh` varchar(32) NOT NULL DEFAULT '000000' COMMENT '��1�����˾�Ա���',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '��1�����˵�λ���',
  `areaname` varchar(128) DEFAULT '' COMMENT '��1�����˵�λ����',
  `alarm_no` varchar(40) DEFAULT '' COMMENT '������',
  `alarm_name` varchar(128) DEFAULT '' COMMENT '���¼�����',
  `alarm_addr` varchar(128) DEFAULT '',
  `alarm_type` int(1) NOT NULL DEFAULT '0' COMMENT '��������;0:δ�༭(3����);1:һ�㾯��(6����);2:�ش���(����);3:�谭��ִ����������(����);4:����ǿ��ִ��(����);5:�������ʼ��(6����);6:��Ч����(7��);7:����(6����)',
  `case_no` varchar(40) DEFAULT '' COMMENT '�������',
  `case_name` varchar(128) DEFAULT '' COMMENT '��������(����)',
  `case_type` int(1) NOT NULL DEFAULT '0' COMMENT '��������;0:δ֪,1:���°���(����),2:��������(����)',
  `case_dept` varchar(64) DEFAULT NULL COMMENT '�참��λ',
  `case_empl` varchar(16) DEFAULT NULL COMMENT '�참��Ա',
  `remark` varchar(256) DEFAULT '' COMMENT '��ע',
  `apply_jybh` varchar(32) DEFAULT '' COMMENT '�������뾯Ա���',
  `apply_jyxm` varchar(60) DEFAULT '' COMMENT '�������뾯Ա��',
  `apply_areacode` varchar(32) DEFAULT '' COMMENT '���������˲���ID',
  `apply_areaname` varchar(128) DEFAULT '' COMMENT '���������˲�����',
  `apply_time` datetime DEFAULT '2017-01-01 00:00:00' COMMENT '�ƽ�����',
  `hand_status` int(1) NOT NULL DEFAULT '0' COMMENT '����״̬��0:��ʼ̬;1:�����;2:�ƽ����',
  `source` int(1) DEFAULT '1' COMMENT '��Դ;1:ִ����¼��,2:������,3:�ǹ�����',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `edit_name` varchar(128) DEFAULT NULL COMMENT '�༭��',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:����,1:��ɾ,2:Ӳɾ',
  PRIMARY KEY (`case_key`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_areacode` (`areacode`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_201707
-- ----------------------------

-- ----------------------------
-- Table structure for case_201708
-- ----------------------------
DROP TABLE IF EXISTS `case_201708`;
CREATE TABLE `case_201708` (
  `case_key` varchar(64) NOT NULL COMMENT '������ʶ,��ʽ��<yyyymmddHHmiss>_<����>_<areacode>;���ܱ༭,�����ṩ��Ƶʱ���Զ�����;',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '��������;',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '������ʼʱ��',
  `end_time` datetime DEFAULT NULL COMMENT '��������ʱ��',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '�ϴ�ʱ��',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '��1�����˾�Ա����',
  `jybh` varchar(32) NOT NULL DEFAULT '000000' COMMENT '��1�����˾�Ա���',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '��1�����˵�λ���',
  `areaname` varchar(128) DEFAULT '' COMMENT '��1�����˵�λ����',
  `alarm_no` varchar(40) DEFAULT '' COMMENT '������',
  `alarm_name` varchar(128) DEFAULT '' COMMENT '���¼�����',
  `alarm_addr` varchar(128) DEFAULT '',
  `alarm_type` int(1) NOT NULL DEFAULT '0' COMMENT '��������;0:δ�༭(3����);1:һ�㾯��(6����);2:�ش���(����);3:�谭��ִ����������(����);4:����ǿ��ִ��(����);5:�������ʼ��(6����);6:��Ч����(7��);7:����(6����)',
  `case_no` varchar(40) DEFAULT '' COMMENT '�������',
  `case_name` varchar(128) DEFAULT '' COMMENT '��������(����)',
  `case_type` int(1) NOT NULL DEFAULT '0' COMMENT '��������;0:δ֪,1:���°���(����),2:��������(����)',
  `case_dept` varchar(64) DEFAULT NULL COMMENT '�참��λ',
  `case_empl` varchar(16) DEFAULT NULL COMMENT '�참��Ա',
  `remark` varchar(256) DEFAULT '' COMMENT '��ע',
  `apply_jybh` varchar(32) DEFAULT '' COMMENT '�������뾯Ա���',
  `apply_jyxm` varchar(60) DEFAULT '' COMMENT '�������뾯Ա��',
  `apply_areacode` varchar(32) DEFAULT '' COMMENT '���������˲���ID',
  `apply_areaname` varchar(128) DEFAULT '' COMMENT '���������˲�����',
  `apply_time` datetime DEFAULT '2017-01-01 00:00:00' COMMENT '�ƽ�����',
  `hand_status` int(1) NOT NULL DEFAULT '0' COMMENT '����״̬��0:��ʼ̬;1:�����;2:�ƽ����',
  `source` int(1) DEFAULT '1' COMMENT '��Դ;1:ִ����¼��,2:������,3:�ǹ�����',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `edit_name` varchar(128) DEFAULT NULL COMMENT '�༭��',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:����,1:��ɾ,2:Ӳɾ',
  PRIMARY KEY (`case_key`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_areacode` (`areacode`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_201708
-- ----------------------------
INSERT INTO `case_201708` VALUES ('20170819054036_085907_41151106', '2017-08-19 05:40:36 ���� data', '2017-08-19 05:40:36', '2017-08-19 06:02:37', '2017-01-01 00:00:00', '����', '085907', '41151106', '�����ع�����-�����ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170819072259_185065_41151115', '2017-08-19 07:22:59 �Ű��� data', '2017-08-19 07:22:59', '2017-08-19 07:49:08', '2017-01-01 00:00:00', '�Ű���', '185065', '41151115', '�����ع�����-��˼�ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170819085954_085442_411512132406', '2017-08-19 08:59:54 ������ data', '2017-08-19 08:59:54', '2017-08-19 09:26:09', '2017-01-01 00:00:00', '������', '085442', '411512132406', '�¹��ж�', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170819130923_087374_41150102', '2017-08-19 13:09:23 ��� data', '2017-08-19 13:09:23', '2017-08-19 13:38:25', '2017-01-01 00:00:00', '���', '087374', '41150102', '�ϳǷ־�-��Ȩ�ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170819205627_087981_41150115', '2017-08-19 20:56:27 ����� data', '2017-08-19 20:56:27', '2017-08-19 21:24:17', '2017-01-01 00:00:00', '�����', '087981', '41150115', '�ϳǷ־�-�ϳǷ־�Ѳ�߷��ش��', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170819215140_087851_41150605', '2017-08-19 21:51:40 ������ data', '2017-08-19 21:51:40', '2017-08-19 22:16:14', '2017-01-01 00:00:00', '������', '087851', '41150605', 'ƽ�ŷ־�-�����ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170819215336_088633_41151725', '2017-08-19 21:53:36 ���ͷ� data', '2017-08-19 21:53:36', '2017-08-19 22:12:40', '2017-01-01 00:00:00', '���ͷ�', '088633', '41151725', '�̳��ع�����-����ʯ�ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170819234241_187998_41151635', '2017-08-19 23:42:41 Ԭ�� data', '2017-08-19 23:42:41', '2017-08-20 00:07:56', '2017-01-01 00:00:00', 'Ԭ��', '187998', '41151635', '��ɽ�ع�����-�������', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170819234506_087251_41150213', '2017-08-19 23:45:06 ���Բ� data', '2017-08-19 23:45:06', '2017-08-20 00:14:20', '2017-01-01 00:00:00', '���Բ�', '087251', '41150213', '���ӷ־�-���ӷ־ַ��ƴ��', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170820012335_085701_41151103', '2017-08-20 01:23:35 ��� data', '2017-08-20 01:23:35', '2017-08-20 01:43:15', '2017-01-01 00:00:00', '���', '085701', '41151103', '�����ع�����-�����ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170820060604_087903_41150412', '2017-08-20 06:06:04 �ų�� data', '2017-08-20 06:06:04', '2017-08-20 06:25:31', '2017-01-01 00:00:00', '�ų��', '087903', '41150412', '���۷־�-���۷־��ΰ��������', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170820065012_037621_4115121302', '2017-08-20 06:50:12 ѧԱ21 data', '2017-08-20 06:50:12', '2017-08-20 07:18:56', '2017-01-01 00:00:00', 'ѧԱ21', '037621', '4115121302', 'ƽ��������', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170820070840_084776_41151527', '2017-08-20 07:08:40 ���� data', '2017-08-20 07:08:40', '2017-08-20 07:31:10', '2017-01-01 00:00:00', '����', '084776', '41151527', '�괨�ع�����-���͸��ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170820075557_085744_41151124', '2017-08-20 07:55:57 ��Ǳ�� data', '2017-08-20 07:55:57', '2017-08-20 08:22:11', '2017-01-01 00:00:00', '��Ǳ��', '085744', '41151124', '�����ع�����-���Ҹ��ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170820103001_088587_41151707', '2017-08-20 10:30:01 ������ data', '2017-08-20 10:30:01', '2017-08-20 10:57:58', '2017-01-01 00:00:00', '������', '088587', '41151707', '�̳��ع�����-�̾����', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170820103926_088083_41151403', '2017-08-20 10:39:26 ���ʤ data', '2017-08-20 10:39:26', '2017-08-20 11:07:07', '2017-01-01 00:00:00', '���ʤ', '088083', '41151403', '��ɽ�ع�����-��ɽ�ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170820105503_189409_41151829', '2017-08-20 10:55:03 ��� data', '2017-08-20 10:55:03', '2017-08-20 11:22:55', '2017-01-01 00:00:00', '���', '189409', '41151829', 'Ϣ�ع�����-�����ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170820105759_187759_41150901', '2017-08-20 10:57:59 ���� data', '2017-08-20 10:57:59', '2017-08-20 11:22:12', '2017-01-01 00:00:00', '����', '187759', '41150901', '����ɽ�־�-���կ�ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170820110614_088021_41150105', '2017-08-20 11:06:14 ������ data', '2017-08-20 11:06:14', '2017-08-20 11:26:15', '2017-01-01 00:00:00', '������', '088021', '41150105', '�ϳǷ־�-��ţɽ�ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170820232532_088380_41151412', '2017-08-20 23:25:32 ���� data', '2017-08-20 23:25:32', '2017-08-20 23:53:41', '2017-01-01 00:00:00', '����', '088380', '41151412', '��ɽ�ع�����-����ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170821002548_187701_41150411', '2017-08-21 00:25:48 �Ż� data', '2017-08-21 00:25:48', '2017-08-21 00:44:21', '2017-01-01 00:00:00', '�Ż�', '187701', '41150411', '���۷־�-���۷־ְ��������', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170821021716_087285_4115121304', '2017-08-21 02:17:16 �Һ� data', '2017-08-21 02:17:16', '2017-08-21 02:43:17', '2017-01-01 00:00:00', '�Һ�', '087285', '4115121304', '��·Ѳ���񾯴��', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170821052936_084086_41150311', '2017-08-21 05:29:36 ��� data', '2017-08-21 05:29:36', '2017-08-21 05:52:36', '2017-01-01 00:00:00', '���', '084086', '41150311', '��ɽ�־�-��ɽ�־־����ۺ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170821065409_0000000_411514', '20170821065409_������', '2017-08-21 06:54:09', null, '2017-08-26 14:52:52', '������', '088268', '411514', '��ɽ�ع�����', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170821081625_087852_41150604', '2017-08-21 08:16:25 ��� data', '2017-08-21 08:16:25', '2017-08-21 08:35:14', '2017-01-01 00:00:00', '���', '087852', '41150604', 'ƽ�ŷ־�-ƽ���ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170821082412_087753_41150405', '2017-08-21 08:24:12 �ϼ��� data', '2017-08-21 08:24:12', '2017-08-21 08:46:27', '2017-01-01 00:00:00', '�ϼ���', '087753', '41150405', '���۷־�-�̼��ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170821091325_086990_4115121311', '2017-08-21 09:13:25 ���Ǻ� data', '2017-08-21 09:13:25', '2017-08-21 09:37:59', '2017-01-01 00:00:00', '���Ǻ�', '086990', '4115121311', '�¹ʴ���ָ����', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170821124247_187531_41150601', '2017-08-21 12:42:47 ���ⶫ data', '2017-08-21 12:42:47', '2017-08-21 13:04:39', '2017-01-01 00:00:00', '���ⶫ', '187531', '41150601', 'ƽ�ŷ־�-ƽ���ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170821143802_087928_41151205', '2017-08-21 14:38:02 ���ĸ� data', '2017-08-21 14:38:02', '2017-08-21 15:04:20', '2017-01-01 00:00:00', '���ĸ�', '087928', '41151205', '�����й�����-Ѳ�ؾ�֧��', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170821145409_088268_411514', '2017-08-21 14:54:09 ������ data', '2017-08-21 14:54:09', '2017-08-21 15:11:48', '2017-01-01 00:00:00', '������', '088268', '411514', '��ɽ�ع�����', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170821162702_088079_4115121320', '2017-08-21 16:27:02 ���� data', '2017-08-21 16:27:02', '2017-08-21 16:56:27', '2017-01-01 00:00:00', '����', '088079', '4115121320', '��ɽ�ؽ������', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170821195646_003-SA_411512120103', '2017-08-21 19:56:46 �ﰲ data', '2017-08-21 19:56:46', '2017-08-21 20:25:44', '2017-01-01 00:00:00', '�ﰲ', '003-SA', '411512120103', '������Ѳ�Ӽ���ж�', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170821225022_086412_41151203', '2017-08-21 22:50:22 ��� data', '2017-08-21 22:50:22', '2017-08-21 23:17:39', '2017-01-01 00:00:00', '���', '086412', '41151203', '�����й�����-110������', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170822012858_186328_4115120505', '2017-08-22 01:28:58 ������ data', '2017-08-22 01:28:58', '2017-08-22 01:49:42', '2017-01-01 00:00:00', '������', '186328', '4115120505', 'Ѳ�ؾ�֧�ӻ������', '', '', '', '0', '', '', '0', '', '', '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-08-26 15:37:56', null, '0');
INSERT INTO `case_201708` VALUES ('20170822024730_186209_41151202', '2017-08-22 02:47:30 ���Ȼ data', '2017-08-22 02:47:30', '2017-08-22 03:09:36', '2017-01-01 00:00:00', '���Ȼ', '186209', '41151202', '�����й�����-�̾�֧��', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170822084535_HBJJ_4115121323', '2017-08-22 08:45:35 �������� data', '2017-08-22 08:45:35', '2017-08-22 09:14:47', '2017-01-01 00:00:00', '��������', 'HBJJ', '4115121323', '�����ؽ������', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170822104909_087906_41150401', '2017-08-22 10:49:09 ������ data', '2017-08-22 10:49:09', '2017-08-22 11:14:01', '2017-01-01 00:00:00', '������', '087906', '41150401', '���۷־�-�����ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170822132104_084982_41150309', '2017-08-22 13:21:04 ��Ϊ�� data', '2017-08-22 13:21:04', '2017-08-22 13:47:30', '2017-01-01 00:00:00', '��Ϊ��', '084982', '41150309', '��ɽ�־�-��ɽ�־����ڴ��', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170822135627_087294_41150216', '2017-08-22 13:56:27 ���� data', '2017-08-22 13:56:27', '2017-08-22 14:17:53', '2017-01-01 00:00:00', '����', '087294', '41150216', '���ӷ־�-���ӷ־�����������', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170822143852_087013_411501', '2017-08-22 14:38:52 �˻��� data', '2017-08-22 14:38:52', '2017-08-24 17:46:52', '2017-01-01 00:00:00', '�˻���', '087013', '411501', '�ϳǷ־�', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-08-26 20:44:02', null, '0');
INSERT INTO `case_201708` VALUES ('20170822181754_TC_411518', '2017-08-22 18:17:54 tc data', '2017-08-22 18:17:54', '2017-08-22 18:44:48', '2017-01-01 00:00:00', 'tc', 'TC', '411518', 'Ϣ�ع�����', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170822195319_ZA0019_41151804', '2017-08-22 19:53:19 ���� data', '2017-08-22 19:53:19', '2017-08-22 20:16:52', '2017-01-01 00:00:00', '����', 'ZA0019', '41151804', 'Ϣ�ع�����-Ѳ�ؾ����', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170822203426_SAKURA_41151213', '2017-08-22 20:34:26 ���� data', '2017-08-22 20:34:26', '2017-08-22 21:00:19', '2017-01-01 00:00:00', '����', 'SAKURA', '41151213', '�����й�����-��ͨ����֧��', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170822223419_186026_4115120303', '2017-08-22 22:34:19 ���� data', '2017-08-22 22:34:19', '2017-08-22 23:02:25', '2017-01-01 00:00:00', '����', '186026', '4115120303', '110������-110ƽ������վ', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170823012736_ZA0065_41151804', '2017-08-23 01:27:36 �غ�Ȼ data', '2017-08-23 01:27:36', '2017-08-23 01:48:32', '2017-01-01 00:00:00', '�غ�Ȼ', 'ZA0065', '41151804', 'Ϣ�ع�����-Ѳ�ؾ����', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170823020636_999999_41150706', '2017-08-23 02:06:36 ���� data', '2017-08-23 02:06:36', '2017-08-23 02:35:53', '2017-01-01 00:00:00', '����', '999999', '41150706', '�����ݷ־�-�����ݷ־�', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170823022914_188052_41151624', '2017-08-23 02:29:14 ֣�� data', '2017-08-23 02:29:14', '2017-08-23 02:50:22', '2017-01-01 00:00:00', '֣��', '188052', '41151624', '��ɽ�ع�����-ɽ���ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170823024345_187679_41150402', '2017-08-23 02:43:45 ��ӱ־ data', '2017-08-23 02:43:45', '2017-08-23 03:08:42', '2017-01-01 00:00:00', '��ӱ־', '187679', '41150402', '���۷־�-�����ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170823065937_189622_41151834', '2017-08-23 06:59:37 Ƚ��ΰ data', '2017-08-23 06:59:37', '2017-08-23 07:24:39', '2017-01-01 00:00:00', 'Ƚ��ΰ', '189622', '41151834', 'Ϣ�ع�����-�����ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170823070823_088878_4115121321', '2017-08-23 07:08:23 ��ΰ data', '2017-08-23 07:08:23', '2017-08-23 07:34:46', '2017-01-01 00:00:00', '��ΰ', '088878', '4115121321', '���ؽ������', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170823084614_ZA0012_41151804', '2017-08-23 08:46:14 ��� data', '2017-08-23 08:46:14', '2017-08-23 09:11:02', '2017-01-01 00:00:00', '���', 'ZA0012', '41151804', 'Ϣ�ع�����-Ѳ�ؾ����', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170823154110_084781_41151515', '2017-08-23 15:41:10 ���� data', '2017-08-23 15:41:10', '2017-08-23 16:04:03', '2017-01-01 00:00:00', '����', '084781', '41151515', '�괨�ع�����-�̾����', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170823190349_188401_41151504', '2017-08-23 19:03:49 ����� data', '2017-08-23 19:03:49', '2017-08-23 19:21:21', '2017-01-01 00:00:00', '�����', '188401', '41151504', '�괨�ع�����-�����ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170823195610_189485_41151839', '2017-08-23 19:56:10 ��һ�� data', '2017-08-23 19:56:10', '2017-08-23 20:20:31', '2017-01-01 00:00:00', '��һ��', '189485', '41151839', 'Ϣ�ع�����-������ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170823235734_188168_41151604', '2017-08-23 23:57:34 ��ˬ data', '2017-08-23 23:57:34', '2017-08-24 00:15:09', '2017-01-01 00:00:00', '��ˬ', '188168', '41151604', '��ɽ�ع�����-��ˮ�ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824002746_084349_41151608', '2017-08-24 00:27:46 ���� data', '2017-08-24 00:27:46', '2017-08-24 00:47:48', '2017-01-01 00:00:00', '����', '084349', '41151608', '��ɽ�ع�����-�ΰ����', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824034644_086401_411510', '2017-08-24 03:46:44 ���� data', '2017-08-24 03:46:44', '2017-08-24 04:13:45', '2017-01-01 00:00:00', '����', '086401', '411510', '����־�', '22', '22', '', '1', '', '', '0', '', '', '', '084790', '����', '41151205', '�����й�����-Ѳ�ؾ�֧��', '2017-01-01 00:00:00', '2', '1', '2017-08-27 20:05:16', '��������Ա', '0');
INSERT INTO `case_201708` VALUES ('20170824035539_085919_41151111', '2017-08-24 03:55:39 �»� data', '2017-08-24 03:55:39', '2017-08-24 04:15:00', '2017-01-01 00:00:00', '�»�', '085919', '41151111', '�����ع�����-�ΰ����', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824073935_XF0002_41151613', '2017-08-24 07:39:35 ��Ϊ�� data', '2017-08-24 07:39:35', '2017-08-24 08:05:46', '2017-01-01 00:00:00', '��Ϊ��', 'XF0002', '41151613', '��ɽ�ع�����-�����ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824093120_ZSM_4115121301', '2017-08-24 09:31:20 ������ data', '2017-08-24 09:31:20', '2017-08-24 09:52:32', '2017-01-01 00:00:00', '������', 'ZSM', '4115121301', '����������', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824094305_086435_41151208', '2017-08-24 09:43:05 ��� data', '2017-08-24 09:43:05', '2017-08-24 10:01:02', '2017-01-01 00:00:00', '���', '086435', '41151208', '�����й�����-����֧��', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824104939_084017_41151634', '2017-08-24 10:49:39 ֣��� data', '2017-08-24 10:49:39', '2017-08-24 11:15:31', '2017-01-01 00:00:00', '֣���', '084017', '41151634', '��ɽ�ع�����-������', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824112958_185765_41151703', '2017-08-24 11:29:58 ���ʳ� data', '2017-08-24 11:29:58', '2017-08-24 11:55:21', '2017-01-01 00:00:00', '���ʳ�', '185765', '41151703', '�̳��ع�����-�ǹ��ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824122406_087787_411504', '2017-08-24 12:24:06 ���� data', '2017-08-24 12:24:06', '2017-08-24 12:47:00', '2017-01-01 00:00:00', '����', '087787', '411504', '���۷־�', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824122932_087468_41150201', '2017-08-24 12:29:32 ʩ��ɽ data', '2017-08-24 12:29:32', '2017-08-24 12:56:15', '2017-01-01 00:00:00', 'ʩ��ɽ', '087468', '41150201', '���ӷ־�-�����ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824124838_085640_41151813', '2017-08-24 12:48:38 ��÷ data', '2017-08-24 12:48:38', '2017-08-24 13:07:45', '2017-01-01 00:00:00', '��÷', '085640', '41151813', 'Ϣ�ع�����-���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824135509_189587_41151842', '2017-08-24 13:55:09 ����ȫ data', '2017-08-24 13:55:09', '2017-08-24 14:17:28', '2017-01-01 00:00:00', '����ȫ', '189587', '41151842', 'Ϣ�ع�����-�ٺ��ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824143059_187011_41150214', '2017-08-24 14:30:59 ������ data', '2017-08-24 14:30:59', '2017-08-24 14:59:36', '2017-01-01 00:00:00', '������', '187011', '41150214', '���ӷ־�-���ӷ־ְ��������', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824160222_188031_411512132613', '2017-08-24 16:02:22 ����Ǭ data', '2017-08-24 16:02:22', '2017-08-24 16:29:01', '2017-01-01 00:00:00', '����Ǭ', '188031', '411512132613', '�����ж�', '', '', '', '0', '', '', '0', '', '', '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-08-26 11:35:29', null, '0');
INSERT INTO `case_201708` VALUES ('20170824174439_087388_41150208', '2017-08-24 17:44:39 ���˽� data', '2017-08-24 17:44:39', '2017-08-24 18:04:05', '2017-01-01 00:00:00', '���˽�', '087388', '41150208', '���ӷ־�-��ҵ��ɳ���', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824174539_085532_411501', '20170824174539_����', '2017-08-24 17:45:39', '2017-08-24 17:46:52', '2017-08-27 19:34:57', '����', '085532', '411501', '�ϳǷ־�', '333', '333', '', '2', '444', '333', '1', null, null, '', '123123', 'ceshi', '4115', '�����й�����', '2017-01-01 00:00:00', '2', '1', '2017-08-28 14:57:46', '����', '0');
INSERT INTO `case_201708` VALUES ('20170824174539_T11366_411501', '20170824174539_����', '2017-08-24 17:45:39', '2017-08-26 20:30:19', '2017-08-26 20:55:36', '����', '085532', '411501', '�ϳǷ־�', '111', '111', '', '1', '888', '888', '1', '', '', '', '123123', 'ceshi', '4115', '�����й�����', '2017-01-01 00:00:00', '0', '1', '2017-09-05 11:21:25', '��������Ա', '0');
INSERT INTO `case_201708` VALUES ('20170824192757_086991_41151202', '2017-08-24 19:27:57 ��  �� data', '2017-08-24 19:27:57', '2017-08-24 19:50:33', '2017-01-01 00:00:00', '��  ��', '086991', '41151202', '�����й�����-�̾�֧��', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170824213355_008_4115120306', '2017-08-24 21:33:55 ͿС�� data', '2017-08-24 21:33:55', '2017-08-24 21:58:25', '2017-01-01 00:00:00', 'ͿС��', '008', '4115120306', '110������-110���ϻ�԰����վ', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-01-01 00:00:00', null, '0');
INSERT INTO `case_201708` VALUES ('20170826110630_cpxhpe_41', '2017-08-26 11:05:07 ��������Ա ����', '2017-08-26 11:06:30', null, '2017-08-26 11:05:07', '��������Ա', 'admin', '41', '����ʡ������', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-08-26 14:49:51', '��������Ա', '0');
INSERT INTO `case_201708` VALUES ('20170826113314_085532_411501', '20170826113314_����', '2017-08-26 11:33:14', '2017-08-27 19:27:50', '2017-08-27 19:34:58', '����', '085532', '411501', '�ϳǷ־�', '', '', '', '0', '', '', '0', '', '', '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-08-30 09:26:54', '', '0');
INSERT INTO `case_201708` VALUES ('20170827192725_T11366_411501', '20170827192725_����', '2017-08-27 19:27:25', '2017-08-27 19:27:50', '2017-08-30 09:35:05', '����', '085532', '411501', '�ϳǷ־�', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-08-27 19:35:01', null, '0');
INSERT INTO `case_201708` VALUES ('20170829102710_cpxhpe_4115', '2017-08-29 10:26:52 ceshi ����', '2017-08-29 10:27:10', null, '2017-08-29 10:26:52', 'ceshi', '123123', '4115', '�����й�����', '', '', '', '0', '', '', '0', null, null, '', '', '', '', '', '2017-01-01 00:00:00', '0', '3', '2017-08-29 15:17:58', 'ceshi', '0');

-- ----------------------------
-- Table structure for case_201709
-- ----------------------------
DROP TABLE IF EXISTS `case_201709`;
CREATE TABLE `case_201709` (
  `case_key` varchar(64) NOT NULL COMMENT '������ʶ,��ʽ��<yyyymmddHHmiss>_<����>_<areacode>;���ܱ༭,�����ṩ��Ƶʱ���Զ�����;',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '��������;',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '������ʼʱ��',
  `end_time` datetime DEFAULT NULL COMMENT '��������ʱ��',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '�ϴ�ʱ��',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '��1�����˾�Ա����',
  `jybh` varchar(32) NOT NULL DEFAULT '000000' COMMENT '��1�����˾�Ա���',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '��1�����˵�λ���',
  `areaname` varchar(128) DEFAULT '' COMMENT '��1�����˵�λ����',
  `alarm_no` varchar(40) DEFAULT '' COMMENT '������',
  `alarm_name` varchar(128) DEFAULT '' COMMENT '���¼�����',
  `alarm_addr` varchar(128) DEFAULT '',
  `alarm_type` int(1) NOT NULL DEFAULT '0' COMMENT '��������;0:δ�༭(3����);1:һ�㾯��(6����);2:�ش���(����);3:�谭��ִ����������(����);4:����ǿ��ִ��(����);5:�������ʼ��(6����);6:��Ч����(7��);7:����(6����)',
  `case_no` varchar(40) DEFAULT '' COMMENT '�������',
  `case_name` varchar(128) DEFAULT '' COMMENT '��������(����)',
  `case_type` int(1) NOT NULL DEFAULT '0' COMMENT '��������;0:δ֪,1:���°���(����),2:��������(����)',
  `case_dept` varchar(64) DEFAULT NULL COMMENT '�참��λ',
  `case_empl` varchar(16) DEFAULT NULL COMMENT '�참��Ա',
  `remark` varchar(256) DEFAULT '' COMMENT '��ע',
  `apply_jybh` varchar(32) DEFAULT '' COMMENT '�������뾯Ա���',
  `apply_jyxm` varchar(60) DEFAULT '' COMMENT '�������뾯Ա��',
  `apply_areacode` varchar(32) DEFAULT '' COMMENT '���������˲���ID',
  `apply_areaname` varchar(128) DEFAULT '' COMMENT '���������˲�����',
  `apply_time` datetime DEFAULT '2017-01-01 00:00:00' COMMENT '�ƽ�����',
  `hand_status` int(1) NOT NULL DEFAULT '0' COMMENT '����״̬��0:��ʼ̬;1:�����;2:�ƽ����',
  `source` int(1) DEFAULT '1' COMMENT '��Դ;1:ִ����¼��,2:������,3:�ǹ�����',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `edit_name` varchar(128) DEFAULT NULL COMMENT '�༭��',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:����,1:��ɾ,2:Ӳɾ',
  PRIMARY KEY (`case_key`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_areacode` (`areacode`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_201709
-- ----------------------------
INSERT INTO `case_201709` VALUES ('20170905091015_085532_411501', '20170905091015_����', '2017-09-05 09:10:15', '2017-09-05 09:12:58', '2017-09-05 09:32:44', '����', '085532', '411501', '�ϳǷ־�', '', '', '', '0', '', '', '0', '', '', '', 'admin', '��������Ա', '4115', '�����й�����', '2017-01-01 00:00:00', '0', '1', '2017-09-05 10:51:20', '��������Ա', '0');
INSERT INTO `case_201709` VALUES ('20170905114815_085532_411501', '20170905114815_����', '2017-09-05 11:48:15', '2017-09-05 11:49:16', '2017-09-05 12:35:49', '����', '085532', '411501', '�ϳǷ־�', 'tt', 'tt', '', '1', 'tt', 'tt', '1', '', '', '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-09-05 15:03:04', '��������Ա', '0');
INSERT INTO `case_201709` VALUES ('20170905123133_085532_411501', '20170905123133_����', '2017-09-05 12:31:33', '2017-09-05 12:34:54', '2017-09-05 12:35:54', '����', '085532', '411501', '�ϳǷ־�', '', '', '', '0', '', '', '0', '', '', '', '', '', '', '', '2017-01-01 00:00:00', '0', '1', '2017-09-05 12:36:01', '', '0');

-- ----------------------------
-- Table structure for case_201710
-- ----------------------------
DROP TABLE IF EXISTS `case_201710`;
CREATE TABLE `case_201710` (
  `case_key` varchar(64) NOT NULL COMMENT '������ʶ,��ʽ��<yyyymmddHHmiss>_<����>_<areacode>;���ܱ༭,�����ṩ��Ƶʱ���Զ�����;',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '��������;',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '������ʼʱ��',
  `end_time` datetime DEFAULT NULL COMMENT '��������ʱ��',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '�ϴ�ʱ��',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '��1�����˾�Ա����',
  `jybh` varchar(32) NOT NULL DEFAULT '000000' COMMENT '��1�����˾�Ա���',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '��1�����˵�λ���',
  `areaname` varchar(128) DEFAULT '' COMMENT '��1�����˵�λ����',
  `alarm_no` varchar(40) DEFAULT '' COMMENT '������',
  `alarm_name` varchar(128) DEFAULT '' COMMENT '���¼�����',
  `alarm_addr` varchar(128) DEFAULT '',
  `alarm_type` int(1) NOT NULL DEFAULT '0' COMMENT '��������;0:δ�༭(3����);1:һ�㾯��(6����);2:�ش���(����);3:�谭��ִ����������(����);4:����ǿ��ִ��(����);5:�������ʼ��(6����);6:��Ч����(7��);7:����(6����)',
  `case_no` varchar(40) DEFAULT '' COMMENT '�������',
  `case_name` varchar(128) DEFAULT '' COMMENT '��������(����)',
  `case_type` int(1) NOT NULL DEFAULT '0' COMMENT '��������;0:δ֪,1:���°���(����),2:��������(����)',
  `case_dept` varchar(64) DEFAULT NULL COMMENT '�참��λ',
  `case_empl` varchar(16) DEFAULT NULL COMMENT '�참��Ա',
  `remark` varchar(256) DEFAULT '' COMMENT '��ע',
  `apply_jybh` varchar(32) DEFAULT '' COMMENT '�������뾯Ա���',
  `apply_jyxm` varchar(60) DEFAULT '' COMMENT '�������뾯Ա��',
  `apply_areacode` varchar(32) DEFAULT '' COMMENT '���������˲���ID',
  `apply_areaname` varchar(128) DEFAULT '' COMMENT '���������˲�����',
  `apply_time` datetime DEFAULT '2017-01-01 00:00:00' COMMENT '�ƽ�����',
  `hand_status` int(1) NOT NULL DEFAULT '0' COMMENT '����״̬��0:��ʼ̬;1:�����;2:�ƽ����',
  `source` int(1) DEFAULT '1' COMMENT '��Դ;1:ִ����¼��,2:������,3:�ǹ�����',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `edit_name` varchar(128) DEFAULT NULL COMMENT '�༭��',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:����,1:��ɾ,2:Ӳɾ',
  PRIMARY KEY (`case_key`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_areacode` (`areacode`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_201710
-- ----------------------------

-- ----------------------------
-- Table structure for case_video_201706
-- ----------------------------
DROP TABLE IF EXISTS `case_video_201706`;
CREATE TABLE `case_video_201706` (
  `wjbh` varchar(100) NOT NULL DEFAULT '0' COMMENT '�ļ���� <�������>_<����>_<������ʱ����>.<����>',
  `case_key` varchar(64) NOT NULL DEFAULT '' COMMENT '������ʶ��ͬcase_201708.case_key',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `end_time` datetime DEFAULT NULL COMMENT '��Ƶ����ʱ��',
  `wjcd` int(11) DEFAULT '0' COMMENT '�ļ�����',
  `wjlx` int(2) DEFAULT NULL COMMENT '0:δ֪,1:��Ƶ,2:��Ƶ,3:ͼƬ',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '��Ա����',
  `jybh` varchar(32) NOT NULL DEFAULT '000000' COMMENT '��Ա���',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '��λ,ͬarea_dep.areacode',
  `areaname` varchar(128) DEFAULT '' COMMENT '��λ����',
  `cpxh` varchar(12) NOT NULL DEFAULT '0000000' COMMENT '��Ʒ���(ִ���Ǳ��),�ļ����˹��ṩʱͳһ��99999',
  `ccfwq_ip` varchar(64) DEFAULT NULL COMMENT '�洢������',
  `ccwz` varchar(200) DEFAULT NULL COMMENT '�洢λ��',
  `bfwz` varchar(200) NOT NULL DEFAULT 'http://' COMMENT '����λ��',
  `wlwz` varchar(200) DEFAULT NULL COMMENT '����λ��,����·��',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '�ϴ�ʱ��',
  `bzlx` int(2) DEFAULT '0' COMMENT '��ע����,0:δ��ע,1:��ע(���Ͱ���)',
  `gzz_ip` varchar(64) DEFAULT NULL COMMENT '����վIP',
  `upload` int(2) NOT NULL DEFAULT '0' COMMENT '0:���ϴ���1���ϴ������ķ�����(��Ҫ��Ƶ)',
  `video_type` int(2) DEFAULT '9' COMMENT '��Ƶ����(1:�Ƽݡ�2:�¹ʡ�3:���ݡ�4:Υ����9:����)',
  `source` int(1) NOT NULL DEFAULT '1' COMMENT '��Դ;1:ִ����¼��,2:������,3:�ǹ�����',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `remark` varchar(256) DEFAULT '',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:����,1:��ɾ,2:Ӳɾ',
  PRIMARY KEY (`wjbh`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_case_key` (`case_key`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_video_201706
-- ----------------------------
INSERT INTO `case_video_201706` VALUES ('TA00716_086338_20170623093621.MOV', '20170623093621_086338_4115', '2017-06-23 09:36:21', '2017-06-23 09:36:54', '33', '1', '����', '086338', '4115', '�����й�����', 'TA00716', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/TA00716/20170623/TA00716_086338_20170623093621.MOV', null, '2017-08-23 11:18:57', '0', '192.168.3.108', '0', '9', '1', '2017-08-23 11:18:57', '', '0');

-- ----------------------------
-- Table structure for case_video_201707
-- ----------------------------
DROP TABLE IF EXISTS `case_video_201707`;
CREATE TABLE `case_video_201707` (
  `wjbh` varchar(100) NOT NULL DEFAULT '0' COMMENT '�ļ���� <�������>_<����>_<������ʱ����>.<����>',
  `case_key` varchar(64) NOT NULL DEFAULT '' COMMENT '������ʶ��ͬcase_201708.case_key',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `end_time` datetime DEFAULT NULL COMMENT '��Ƶ����ʱ��',
  `wjcd` int(11) DEFAULT '0' COMMENT '�ļ�����',
  `wjlx` int(2) DEFAULT NULL COMMENT '0:δ֪,1:��Ƶ,2:��Ƶ,3:ͼƬ',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '��Ա����',
  `jybh` varchar(32) NOT NULL DEFAULT '000000' COMMENT '��Ա���',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '��λ,ͬarea_dep.areacode',
  `areaname` varchar(128) DEFAULT '' COMMENT '��λ����',
  `cpxh` varchar(12) NOT NULL DEFAULT '0000000' COMMENT '��Ʒ���(ִ���Ǳ��),�ļ����˹��ṩʱͳһ��99999',
  `ccfwq_ip` varchar(64) DEFAULT NULL COMMENT '�洢������',
  `ccwz` varchar(200) DEFAULT NULL COMMENT '�洢λ��',
  `bfwz` varchar(200) NOT NULL DEFAULT 'http://' COMMENT '����λ��',
  `wlwz` varchar(200) DEFAULT NULL COMMENT '����λ��,����·��',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '�ϴ�ʱ��',
  `bzlx` int(2) DEFAULT '0' COMMENT '��ע����,0:δ��ע,1:��ע(���Ͱ���)',
  `gzz_ip` varchar(64) DEFAULT NULL COMMENT '����վIP',
  `upload` int(2) NOT NULL DEFAULT '0' COMMENT '0:���ϴ���1���ϴ������ķ�����(��Ҫ��Ƶ)',
  `video_type` int(2) DEFAULT '9' COMMENT '��Ƶ����(1:�Ƽݡ�2:�¹ʡ�3:���ݡ�4:Υ����9:����)',
  `source` int(1) NOT NULL DEFAULT '1' COMMENT '��Դ;1:ִ����¼��,2:������,3:�ǹ�����',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `remark` varchar(256) DEFAULT '',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:����,1:��ɾ,2:Ӳɾ',
  PRIMARY KEY (`wjbh`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_case_key` (`case_key`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_video_201707
-- ----------------------------

-- ----------------------------
-- Table structure for case_video_201708
-- ----------------------------
DROP TABLE IF EXISTS `case_video_201708`;
CREATE TABLE `case_video_201708` (
  `wjbh` varchar(100) NOT NULL DEFAULT '0' COMMENT '�ļ���� <�������>_<����>_<������ʱ����>.<����>',
  `case_key` varchar(64) NOT NULL DEFAULT '' COMMENT '������ʶ��ͬcase_201708.case_key',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `end_time` datetime DEFAULT NULL COMMENT '��Ƶ����ʱ��',
  `wjcd` int(11) DEFAULT '0' COMMENT '�ļ�����',
  `wjlx` int(2) DEFAULT NULL COMMENT '0:δ֪,1:��Ƶ,2:��Ƶ,3:ͼƬ',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '��Ա����',
  `jybh` varchar(32) NOT NULL DEFAULT '000000' COMMENT '��Ա���',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '��λ,ͬarea_dep.areacode',
  `areaname` varchar(128) DEFAULT '' COMMENT '��λ����',
  `cpxh` varchar(12) NOT NULL DEFAULT '0000000' COMMENT '��Ʒ���(ִ���Ǳ��),�ļ����˹��ṩʱͳһ��99999',
  `ccfwq_ip` varchar(64) DEFAULT NULL COMMENT '�洢������',
  `ccwz` varchar(200) DEFAULT NULL COMMENT '�洢λ��',
  `bfwz` varchar(200) NOT NULL DEFAULT 'http://' COMMENT '����λ��',
  `wlwz` varchar(200) DEFAULT NULL COMMENT '����λ��,����·��',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '�ϴ�ʱ��',
  `bzlx` int(2) DEFAULT '0' COMMENT '��ע����,0:δ��ע,1:��ע(���Ͱ���)',
  `gzz_ip` varchar(64) DEFAULT NULL COMMENT '����վIP',
  `upload` int(2) NOT NULL DEFAULT '0' COMMENT '0:���ϴ���1���ϴ������ķ�����(��Ҫ��Ƶ)',
  `video_type` int(2) DEFAULT '9' COMMENT '��Ƶ����(1:�Ƽݡ�2:�¹ʡ�3:���ݡ�4:Υ����9:����)',
  `source` int(1) NOT NULL DEFAULT '1' COMMENT '��Դ;1:ִ����¼��,2:������,3:�ǹ�����',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `remark` varchar(256) DEFAULT '',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:����,1:��ɾ,2:Ӳɾ',
  PRIMARY KEY (`wjbh`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_case_key` (`case_key`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_video_201708
-- ----------------------------
INSERT INTO `case_video_201708` VALUES ('@2017081821403627731', '20170819054036_085907_41151106', '2017-08-18 21:40:36', '2017-08-18 21:45:26', '290', '1', '����', '085907', '41151106', '�����ع�����-�����ɳ���', '0000000', null, 'file/1503092436.0/@2017081821403627731', 'http://192.168.77.33/file/1503092436.0/@2017081821403627731', null, '2017-08-19 13:58:52', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081821403628326', '20170819054036_085907_41151106', '2017-08-18 21:40:36', null, '0', '0', '����', '085907', '41151106', '�����ع�����-�����ɳ���', '0000000', null, 'file/1503092436.0/@2017081821403628326', 'http://192.168.77.33/file/1503092436.0/@2017081821403628326', null, '2017-08-19 14:42:36', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081821403644730', '20170819054036_085907_41151106', '2017-08-18 21:40:36', null, '0', '2', '����', '085907', '41151106', '�����ع�����-�����ɳ���', '0000000', null, 'file/1503092436.0/@2017081821403644730', 'http://192.168.77.33/file/1503092436.0/@2017081821403644730', null, '2017-08-19 14:29:33', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081823225924454', '20170819072259_185065_41151115', '2017-08-18 23:22:59', null, '0', '0', '�Ű���', '185065', '41151115', '�����ع�����-��˼�ɳ���', '0000000', null, 'file/1503098579.0/@2017081823225924454', 'http://192.168.77.33/file/1503098579.0/@2017081823225924454', null, '2017-08-19 15:52:44', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081823225938549', '20170819072259_185065_41151115', '2017-08-18 23:22:59', '2017-08-18 23:25:00', '121', '1', '�Ű���', '185065', '41151115', '�����ع�����-��˼�ɳ���', '0000000', null, 'file/1503098579.0/@2017081823225938549', 'http://192.168.77.33/file/1503098579.0/@2017081823225938549', null, '2017-08-19 16:06:16', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081823225938874', '20170819072259_185065_41151115', '2017-08-18 23:22:59', null, '0', '0', '�Ű���', '185065', '41151115', '�����ع�����-��˼�ɳ���', '0000000', null, 'file/1503098579.0/@2017081823225938874', 'http://192.168.77.33/file/1503098579.0/@2017081823225938874', null, '2017-08-19 15:30:33', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081900595419233', '20170819085954_085442_411512132406', '2017-08-19 00:59:54', '2017-08-19 01:03:27', '213', '1', '������', '085442', '411512132406', '�¹��ж�', '0000000', null, 'file/1503104394.0/@2017081900595419233', 'http://192.168.77.33/file/1503104394.0/@2017081900595419233', null, '2017-08-19 17:13:51', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081900595424716', '20170819085954_085442_411512132406', '2017-08-19 00:59:54', null, '0', '2', '������', '085442', '411512132406', '�¹��ж�', '0000000', null, 'file/1503104394.0/@2017081900595424716', 'http://192.168.77.33/file/1503104394.0/@2017081900595424716', null, '2017-08-19 17:12:22', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081900595440810', '20170819085954_085442_411512132406', '2017-08-19 00:59:54', null, '0', '2', '������', '085442', '411512132406', '�¹��ж�', '0000000', null, 'file/1503104394.0/@2017081900595440810', 'http://192.168.77.33/file/1503104394.0/@2017081900595440810', null, '2017-08-19 18:15:13', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081905092333783', '20170819130923_087374_41150102', '2017-08-19 05:09:23', null, '0', '0', '���', '087374', '41150102', '�ϳǷ־�-��Ȩ�ɳ���', '0000000', null, 'file/1503119363.0/@2017081905092333783', 'http://192.168.77.33/file/1503119363.0/@2017081905092333783', null, '2017-08-19 21:41:27', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081905092343409', '20170819130923_087374_41150102', '2017-08-19 05:09:23', null, '0', '2', '���', '087374', '41150102', '�ϳǷ־�-��Ȩ�ɳ���', '0000000', null, 'file/1503119363.0/@2017081905092343409', 'http://192.168.77.33/file/1503119363.0/@2017081905092343409', null, '2017-08-19 23:00:09', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081905092344296', '20170819130923_087374_41150102', '2017-08-19 05:09:23', null, '0', '2', '���', '087374', '41150102', '�ϳǷ־�-��Ȩ�ɳ���', '0000000', null, 'file/1503119363.0/@2017081905092344296', 'http://192.168.77.33/file/1503119363.0/@2017081905092344296', null, '2017-08-19 22:33:33', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081912562724984', '20170819205627_087981_41150115', '2017-08-19 12:56:27', null, '0', '2', '�����', '087981', '41150115', '�ϳǷ־�-�ϳǷ־�Ѳ�߷��ش��', '0000000', null, 'file/1503147387.0/@2017081912562724984', 'http://192.168.77.33/file/1503147387.0/@2017081912562724984', null, '2017-08-20 06:21:14', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081912562740481', '20170819205627_087981_41150115', '2017-08-19 12:56:27', null, '0', '2', '�����', '087981', '41150115', '�ϳǷ־�-�ϳǷ־�Ѳ�߷��ش��', '0000000', null, 'file/1503147387.0/@2017081912562740481', 'http://192.168.77.33/file/1503147387.0/@2017081912562740481', null, '2017-08-20 05:42:29', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081912562754655', '20170819205627_087981_41150115', '2017-08-19 12:56:27', null, '0', '3', '�����', '087981', '41150115', '�ϳǷ־�-�ϳǷ־�Ѳ�߷��ش��', '0000000', null, 'file/1503147387.0/@2017081912562754655', 'http://192.168.77.33/file/1503147387.0/@2017081912562754655', null, '2017-08-20 06:54:05', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081913514032676', '20170819215140_087851_41150605', '2017-08-19 13:51:40', '2017-08-19 13:54:44', '184', '1', '������', '087851', '41150605', 'ƽ�ŷ־�-�����ɳ���', '0000000', null, 'file/1503150700.0/@2017081913514032676', 'http://192.168.77.33/file/1503150700.0/@2017081913514032676', null, '2017-08-20 07:33:06', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081913514041211', '20170819215140_087851_41150605', '2017-08-19 13:51:40', null, '0', '2', '������', '087851', '41150605', 'ƽ�ŷ־�-�����ɳ���', '0000000', null, 'file/1503150700.0/@2017081913514041211', 'http://192.168.77.33/file/1503150700.0/@2017081913514041211', null, '2017-08-20 06:42:59', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081913514055771', '20170819215140_087851_41150605', '2017-08-19 13:51:40', null, '0', '2', '������', '087851', '41150605', 'ƽ�ŷ־�-�����ɳ���', '0000000', null, 'file/1503150700.0/@2017081913514055771', 'http://192.168.77.33/file/1503150700.0/@2017081913514055771', null, '2017-08-20 06:00:55', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081913533621421', '20170819215336_088633_41151725', '2017-08-19 13:53:36', null, '0', '0', '���ͷ�', '088633', '41151725', '�̳��ع�����-����ʯ�ɳ���', '0000000', null, 'file/1503150816.0/@2017081913533621421', 'http://192.168.77.33/file/1503150816.0/@2017081913533621421', null, '2017-08-20 06:29:31', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081913533628303', '20170819215336_088633_41151725', '2017-08-19 13:53:36', '2017-08-19 13:56:24', '168', '1', '���ͷ�', '088633', '41151725', '�̳��ع�����-����ʯ�ɳ���', '0000000', null, 'file/1503150816.0/@2017081913533628303', 'http://192.168.77.33/file/1503150816.0/@2017081913533628303', null, '2017-08-20 06:07:24', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081913533655643', '20170819215336_088633_41151725', '2017-08-19 13:53:36', null, '0', '3', '���ͷ�', '088633', '41151725', '�̳��ع�����-����ʯ�ɳ���', '0000000', null, 'file/1503150816.0/@2017081913533655643', 'http://192.168.77.33/file/1503150816.0/@2017081913533655643', null, '2017-08-20 07:28:59', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081915424116104', '20170819234241_187998_41151635', '2017-08-19 15:42:41', null, '0', '0', 'Ԭ��', '187998', '41151635', '��ɽ�ع�����-�������', '0000000', null, 'file/1503157361.0/@2017081915424116104', 'http://192.168.77.33/file/1503157361.0/@2017081915424116104', null, '2017-08-20 08:34:34', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081915424127098', '20170819234241_187998_41151635', '2017-08-19 15:42:41', null, '0', '0', 'Ԭ��', '187998', '41151635', '��ɽ�ع�����-�������', '0000000', null, 'file/1503157361.0/@2017081915424127098', 'http://192.168.77.33/file/1503157361.0/@2017081915424127098', null, '2017-08-20 07:52:19', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081915424154122', '20170819234241_187998_41151635', '2017-08-19 15:42:41', '2017-08-19 15:46:08', '207', '1', 'Ԭ��', '187998', '41151635', '��ɽ�ع�����-�������', '0000000', null, 'file/1503157361.0/@2017081915424154122', 'http://192.168.77.33/file/1503157361.0/@2017081915424154122', null, '2017-08-20 08:48:41', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081915450621088', '20170819234506_087251_41150213', '2017-08-19 15:45:06', null, '0', '2', '���Բ�', '087251', '41150213', '���ӷ־�-���ӷ־ַ��ƴ��', '0000000', null, 'file/1503157506.0/@2017081915450621088', 'http://192.168.77.33/file/1503157506.0/@2017081915450621088', null, '2017-08-20 09:29:03', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081915450629545', '20170819234506_087251_41150213', '2017-08-19 15:45:06', null, '0', '3', '���Բ�', '087251', '41150213', '���ӷ־�-���ӷ־ַ��ƴ��', '0000000', null, 'file/1503157506.0/@2017081915450629545', 'http://192.168.77.33/file/1503157506.0/@2017081915450629545', null, '2017-08-20 08:10:58', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708191545068679', '20170819234506_087251_41150213', '2017-08-19 15:45:06', null, '0', '2', '���Բ�', '087251', '41150213', '���ӷ־�-���ӷ־ַ��ƴ��', '0000000', null, 'file/1503157506.0/@201708191545068679', 'http://192.168.77.33/file/1503157506.0/@201708191545068679', null, '2017-08-20 07:47:26', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081917233510786', '20170820012335_085701_41151103', '2017-08-19 17:23:35', null, '0', '2', '���', '085701', '41151103', '�����ع�����-�����ɳ���', '0000000', null, 'file/1503163415.0/@2017081917233510786', 'http://192.168.77.33/file/1503163415.0/@2017081917233510786', null, '2017-08-20 10:09:47', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081917233533778', '20170820012335_085701_41151103', '2017-08-19 17:23:35', null, '0', '3', '���', '085701', '41151103', '�����ع�����-�����ɳ���', '0000000', null, 'file/1503163415.0/@2017081917233533778', 'http://192.168.77.33/file/1503163415.0/@2017081917233533778', null, '2017-08-20 10:14:40', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081917233548607', '20170820012335_085701_41151103', '2017-08-19 17:23:35', null, '0', '3', '���', '085701', '41151103', '�����ع�����-�����ɳ���', '0000000', null, 'file/1503163415.0/@2017081917233548607', 'http://192.168.77.33/file/1503163415.0/@2017081917233548607', null, '2017-08-20 09:39:02', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081922060443041', '20170820060604_087903_41150412', '2017-08-19 22:06:04', null, '0', '2', '�ų��', '087903', '41150412', '���۷־�-���۷־��ΰ��������', '0000000', null, 'file/1503180364.0/@2017081922060443041', 'http://192.168.77.33/file/1503180364.0/@2017081922060443041', null, '2017-08-20 15:31:19', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081922060455043', '20170820060604_087903_41150412', '2017-08-19 22:06:04', null, '0', '0', '�ų��', '087903', '41150412', '���۷־�-���۷־��ΰ��������', '0000000', null, 'file/1503180364.0/@2017081922060455043', 'http://192.168.77.33/file/1503180364.0/@2017081922060455043', null, '2017-08-20 14:38:39', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708192206046744', '20170820060604_087903_41150412', '2017-08-19 22:06:04', null, '0', '2', '�ų��', '087903', '41150412', '���۷־�-���۷־��ΰ��������', '0000000', null, 'file/1503180364.0/@201708192206046744', 'http://192.168.77.33/file/1503180364.0/@201708192206046744', null, '2017-08-20 14:39:42', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081922501212602', '20170820065012_037621_4115121302', '2017-08-19 22:50:12', null, '0', '0', 'ѧԱ21', '037621', '4115121302', 'ƽ��������', '0000000', null, 'file/1503183012.0/@2017081922501212602', 'http://192.168.77.33/file/1503183012.0/@2017081922501212602', null, '2017-08-20 15:20:16', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081922501219077', '20170820065012_037621_4115121302', '2017-08-19 22:50:12', null, '0', '2', 'ѧԱ21', '037621', '4115121302', 'ƽ��������', '0000000', null, 'file/1503183012.0/@2017081922501219077', 'http://192.168.77.33/file/1503183012.0/@2017081922501219077', null, '2017-08-20 15:03:38', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081922501236048', '20170820065012_037621_4115121302', '2017-08-19 22:50:12', null, '0', '2', 'ѧԱ21', '037621', '4115121302', 'ƽ��������', '0000000', null, 'file/1503183012.0/@2017081922501236048', 'http://192.168.77.33/file/1503183012.0/@2017081922501236048', null, '2017-08-20 15:02:53', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081923084017008', '20170820070840_084776_41151527', '2017-08-19 23:08:40', '2017-08-19 23:12:11', '211', '1', '����', '084776', '41151527', '�괨�ع�����-���͸��ɳ���', '0000000', null, 'file/1503184120.0/@2017081923084017008', 'http://192.168.77.33/file/1503184120.0/@2017081923084017008', null, '2017-08-20 16:30:18', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081923084027252', '20170820070840_084776_41151527', '2017-08-19 23:08:40', null, '0', '3', '����', '084776', '41151527', '�괨�ع�����-���͸��ɳ���', '0000000', null, 'file/1503184120.0/@2017081923084027252', 'http://192.168.77.33/file/1503184120.0/@2017081923084027252', null, '2017-08-20 16:12:25', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081923084035786', '20170820070840_084776_41151527', '2017-08-19 23:08:40', '2017-08-19 23:11:50', '190', '1', '����', '084776', '41151527', '�괨�ع�����-���͸��ɳ���', '0000000', null, 'file/1503184120.0/@2017081923084035786', 'http://192.168.77.33/file/1503184120.0/@2017081923084035786', null, '2017-08-20 16:10:18', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081923555726942', '20170820075557_085744_41151124', '2017-08-19 23:55:57', '2017-08-19 23:59:43', '226', '1', '��Ǳ��', '085744', '41151124', '�����ع�����-���Ҹ��ɳ���', '0000000', null, 'file/1503186957.0/@2017081923555726942', 'http://192.168.77.33/file/1503186957.0/@2017081923555726942', null, '2017-08-20 16:20:58', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081923555734881', '20170820075557_085744_41151124', '2017-08-19 23:55:57', null, '0', '3', '��Ǳ��', '085744', '41151124', '�����ع�����-���Ҹ��ɳ���', '0000000', null, 'file/1503186957.0/@2017081923555734881', 'http://192.168.77.33/file/1503186957.0/@2017081923555734881', null, '2017-08-20 16:37:32', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017081923555740391', '20170820075557_085744_41151124', '2017-08-19 23:55:57', null, '0', '0', '��Ǳ��', '085744', '41151124', '�����ع�����-���Ҹ��ɳ���', '0000000', null, 'file/1503186957.0/@2017081923555740391', 'http://192.168.77.33/file/1503186957.0/@2017081923555740391', null, '2017-08-20 17:00:20', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082002300137768', '20170820103001_088587_41151707', '2017-08-20 02:30:01', null, '0', '0', '������', '088587', '41151707', '�̳��ع�����-�̾����', '0000000', null, 'file/1503196201.0/@2017082002300137768', 'http://192.168.77.33/file/1503196201.0/@2017082002300137768', null, '2017-08-20 19:04:44', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082002300160267', '20170820103001_088587_41151707', '2017-08-20 02:30:01', null, '0', '0', '������', '088587', '41151707', '�̳��ع�����-�̾����', '0000000', null, 'file/1503196201.0/@2017082002300160267', 'http://192.168.77.33/file/1503196201.0/@2017082002300160267', null, '2017-08-20 20:16:37', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708200230016514', '20170820103001_088587_41151707', '2017-08-20 02:30:01', '2017-08-20 02:33:46', '225', '1', '������', '088587', '41151707', '�̳��ع�����-�̾����', '0000000', null, 'file/1503196201.0/@201708200230016514', 'http://192.168.77.33/file/1503196201.0/@201708200230016514', null, '2017-08-20 19:50:34', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082002392616146', '20170820103926_088083_41151403', '2017-08-20 02:39:26', null, '0', '3', '���ʤ', '088083', '41151403', '��ɽ�ع�����-��ɽ�ɳ���', '0000000', null, 'file/1503196766.0/@2017082002392616146', 'http://192.168.77.33/file/1503196766.0/@2017082002392616146', null, '2017-08-20 20:05:59', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082002392645028', '20170820103926_088083_41151403', '2017-08-20 02:39:26', '2017-08-20 02:43:59', '273', '1', '���ʤ', '088083', '41151403', '��ɽ�ع�����-��ɽ�ɳ���', '0000000', null, 'file/1503196766.0/@2017082002392645028', 'http://192.168.77.33/file/1503196766.0/@2017082002392645028', null, '2017-08-20 20:11:37', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082002392647022', '20170820103926_088083_41151403', '2017-08-20 02:39:26', null, '0', '0', '���ʤ', '088083', '41151403', '��ɽ�ع�����-��ɽ�ɳ���', '0000000', null, 'file/1503196766.0/@2017082002392647022', 'http://192.168.77.33/file/1503196766.0/@2017082002392647022', null, '2017-08-20 19:53:38', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082002550344538', '20170820105503_189409_41151829', '2017-08-20 02:55:03', null, '0', '0', '���', '189409', '41151829', 'Ϣ�ع�����-�����ɳ���', '0000000', null, 'file/1503197703.0/@2017082002550344538', 'http://192.168.77.33/file/1503197703.0/@2017082002550344538', null, '2017-08-20 20:54:18', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082002550354163', '20170820105503_189409_41151829', '2017-08-20 02:55:03', null, '0', '3', '���', '189409', '41151829', 'Ϣ�ع�����-�����ɳ���', '0000000', null, 'file/1503197703.0/@2017082002550354163', 'http://192.168.77.33/file/1503197703.0/@2017082002550354163', null, '2017-08-20 19:56:53', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708200255038769', '20170820105503_189409_41151829', '2017-08-20 02:55:03', null, '0', '2', '���', '189409', '41151829', 'Ϣ�ع�����-�����ɳ���', '0000000', null, 'file/1503197703.0/@201708200255038769', 'http://192.168.77.33/file/1503197703.0/@201708200255038769', null, '2017-08-20 20:39:02', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082002575919661', '20170820105759_187759_41150901', '2017-08-20 02:57:59', null, '0', '0', '����', '187759', '41150901', '����ɽ�־�-���կ�ɳ���', '0000000', null, 'file/1503197879.0/@2017082002575919661', 'http://192.168.77.33/file/1503197879.0/@2017082002575919661', null, '2017-08-20 20:06:28', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082002575921089', '20170820105759_187759_41150901', '2017-08-20 02:57:59', null, '0', '0', '����', '187759', '41150901', '����ɽ�־�-���կ�ɳ���', '0000000', null, 'file/1503197879.0/@2017082002575921089', 'http://192.168.77.33/file/1503197879.0/@2017082002575921089', null, '2017-08-20 19:21:04', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082002575930600', '20170820105759_187759_41150901', '2017-08-20 02:57:59', null, '0', '0', '����', '187759', '41150901', '����ɽ�־�-���կ�ɳ���', '0000000', null, 'file/1503197879.0/@2017082002575930600', 'http://192.168.77.33/file/1503197879.0/@2017082002575930600', null, '2017-08-20 19:18:18', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082003061431673', '20170820110614_088021_41150105', '2017-08-20 03:06:14', '2017-08-20 03:09:05', '171', '1', '������', '088021', '41150105', '�ϳǷ־�-��ţɽ�ɳ���', '0000000', null, 'file/1503198374.0/@2017082003061431673', 'http://192.168.77.33/file/1503198374.0/@2017082003061431673', null, '2017-08-20 19:22:20', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082003061448483', '20170820110614_088021_41150105', '2017-08-20 03:06:14', null, '0', '3', '������', '088021', '41150105', '�ϳǷ־�-��ţɽ�ɳ���', '0000000', null, 'file/1503198374.0/@2017082003061448483', 'http://192.168.77.33/file/1503198374.0/@2017082003061448483', null, '2017-08-20 19:42:21', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082003061458165', '20170820110614_088021_41150105', '2017-08-20 03:06:14', null, '0', '3', '������', '088021', '41150105', '�ϳǷ־�-��ţɽ�ɳ���', '0000000', null, 'file/1503198374.0/@2017082003061458165', 'http://192.168.77.33/file/1503198374.0/@2017082003061458165', null, '2017-08-20 20:27:04', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082015253250957', '20170820232532_088380_41151412', '2017-08-20 15:25:32', null, '0', '3', '����', '088380', '41151412', '��ɽ�ع�����-����ɳ���', '0000000', null, 'file/1503242732.0/@2017082015253250957', 'http://192.168.77.33/file/1503242732.0/@2017082015253250957', null, '2017-08-21 08:24:18', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082015253253113', '20170820232532_088380_41151412', '2017-08-20 15:25:32', null, '0', '3', '����', '088380', '41151412', '��ɽ�ع�����-����ɳ���', '0000000', null, 'file/1503242732.0/@2017082015253253113', 'http://192.168.77.33/file/1503242732.0/@2017082015253253113', null, '2017-08-21 07:40:36', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082015253262841', '20170820232532_088380_41151412', '2017-08-20 15:25:32', null, '0', '3', '����', '088380', '41151412', '��ɽ�ع�����-����ɳ���', '0000000', null, 'file/1503242732.0/@2017082015253262841', 'http://192.168.77.33/file/1503242732.0/@2017082015253262841', null, '2017-08-21 07:46:19', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082016254812429', '20170821002548_187701_41150411', '2017-08-20 16:25:48', null, '0', '0', '�Ż�', '187701', '41150411', '���۷־�-���۷־ְ��������', '0000000', null, 'file/1503246348.0/@2017082016254812429', 'http://192.168.77.33/file/1503246348.0/@2017082016254812429', null, '2017-08-21 09:00:06', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082016254814326', '20170821002548_187701_41150411', '2017-08-20 16:25:48', '2017-08-20 16:28:57', '189', '1', '�Ż�', '187701', '41150411', '���۷־�-���۷־ְ��������', '0000000', null, 'file/1503246348.0/@2017082016254814326', 'http://192.168.77.33/file/1503246348.0/@2017082016254814326', null, '2017-08-21 09:28:50', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082016254860965', '20170821002548_187701_41150411', '2017-08-20 16:25:48', null, '0', '2', '�Ż�', '187701', '41150411', '���۷־�-���۷־ְ��������', '0000000', null, 'file/1503246348.0/@2017082016254860965', 'http://192.168.77.33/file/1503246348.0/@2017082016254860965', null, '2017-08-21 09:57:54', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082018171614438', '20170821021716_087285_4115121304', '2017-08-20 18:17:16', null, '0', '2', '�Һ�', '087285', '4115121304', '��·Ѳ���񾯴��', '0000000', null, 'file/1503253036.0/@2017082018171614438', 'http://192.168.77.33/file/1503253036.0/@2017082018171614438', null, '2017-08-21 12:16:15', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708201817167139', '20170821021716_087285_4115121304', '2017-08-20 18:17:16', null, '0', '3', '�Һ�', '087285', '4115121304', '��·Ѳ���񾯴��', '0000000', null, 'file/1503253036.0/@201708201817167139', 'http://192.168.77.33/file/1503253036.0/@201708201817167139', null, '2017-08-21 10:57:57', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708201817167931', '20170821021716_087285_4115121304', '2017-08-20 18:17:16', null, '0', '2', '�Һ�', '087285', '4115121304', '��·Ѳ���񾯴��', '0000000', null, 'file/1503253036.0/@201708201817167931', 'http://192.168.77.33/file/1503253036.0/@201708201817167931', null, '2017-08-21 11:37:00', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082021293617588', '20170821052936_084086_41150311', '2017-08-20 21:29:36', null, '0', '0', '���', '084086', '41150311', '��ɽ�־�-��ɽ�־־����ۺ���', '0000000', null, 'file/1503264576.0/@2017082021293617588', 'http://192.168.77.33/file/1503264576.0/@2017082021293617588', null, '2017-08-21 14:54:39', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082021293630020', '20170821052936_084086_41150311', '2017-08-20 21:29:36', null, '0', '3', '���', '084086', '41150311', '��ɽ�־�-��ɽ�־־����ۺ���', '0000000', null, 'file/1503264576.0/@2017082021293630020', 'http://192.168.77.33/file/1503264576.0/@2017082021293630020', null, '2017-08-21 13:52:13', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082021293653191', '20170821052936_084086_41150311', '2017-08-20 21:29:36', '2017-08-20 21:34:01', '265', '1', '���', '084086', '41150311', '��ɽ�־�-��ɽ�־־����ۺ���', '0000000', null, 'file/1503264576.0/@2017082021293653191', 'http://192.168.77.33/file/1503264576.0/@2017082021293653191', null, '2017-08-21 14:04:02', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082100162544910', '20170821081625_087852_41150604', '2017-08-21 00:16:25', '2017-08-21 00:18:30', '125', '1', '���', '087852', '41150604', 'ƽ�ŷ־�-ƽ���ɳ���', '0000000', null, 'file/1503274585.0/@2017082100162544910', 'http://192.168.77.33/file/1503274585.0/@2017082100162544910', null, '2017-08-21 17:01:18', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082100162546045', '20170821081625_087852_41150604', '2017-08-21 00:16:25', null, '0', '0', '���', '087852', '41150604', 'ƽ�ŷ־�-ƽ���ɳ���', '0000000', null, 'file/1503274585.0/@2017082100162546045', 'http://192.168.77.33/file/1503274585.0/@2017082100162546045', null, '2017-08-21 18:05:08', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082100162556268', '20170821081625_087852_41150604', '2017-08-21 00:16:25', null, '0', '3', '���', '087852', '41150604', 'ƽ�ŷ־�-ƽ���ɳ���', '0000000', null, 'file/1503274585.0/@2017082100162556268', 'http://192.168.77.33/file/1503274585.0/@2017082100162556268', null, '2017-08-21 16:30:35', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082100241231382', '20170821082412_087753_41150405', '2017-08-21 00:24:12', null, '0', '0', '�ϼ���', '087753', '41150405', '���۷־�-�̼��ɳ���', '0000000', null, 'file/1503275052.0/@2017082100241231382', 'http://192.168.77.33/file/1503275052.0/@2017082100241231382', null, '2017-08-21 18:13:20', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082100241242014', '20170821082412_087753_41150405', '2017-08-21 00:24:12', '2017-08-21 00:29:06', '294', '1', '�ϼ���', '087753', '41150405', '���۷־�-�̼��ɳ���', '0000000', null, 'file/1503275052.0/@2017082100241242014', 'http://192.168.77.33/file/1503275052.0/@2017082100241242014', null, '2017-08-21 18:08:55', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082100241262222', '20170821082412_087753_41150405', '2017-08-21 00:24:12', '2017-08-21 00:26:20', '128', '1', '�ϼ���', '087753', '41150405', '���۷־�-�̼��ɳ���', '0000000', null, 'file/1503275052.0/@2017082100241262222', 'http://192.168.77.33/file/1503275052.0/@2017082100241262222', null, '2017-08-21 16:26:46', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082101132512146', '20170821091325_086990_4115121311', '2017-08-21 01:13:25', '2017-08-21 01:18:06', '281', '1', '���Ǻ�', '086990', '4115121311', '�¹ʴ���ָ����', '0000000', null, 'file/1503278005.0/@2017082101132512146', 'http://192.168.77.33/file/1503278005.0/@2017082101132512146', null, '2017-08-21 19:02:53', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082101132517434', '20170821091325_086990_4115121311', '2017-08-21 01:13:25', null, '0', '3', '���Ǻ�', '086990', '4115121311', '�¹ʴ���ָ����', '0000000', null, 'file/1503278005.0/@2017082101132517434', 'http://192.168.77.33/file/1503278005.0/@2017082101132517434', null, '2017-08-21 17:52:50', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082101132531554', '20170821091325_086990_4115121311', '2017-08-21 01:13:25', null, '0', '0', '���Ǻ�', '086990', '4115121311', '�¹ʴ���ָ����', '0000000', null, 'file/1503278005.0/@2017082101132531554', 'http://192.168.77.33/file/1503278005.0/@2017082101132531554', null, '2017-08-21 18:21:11', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082104424743635', '20170821124247_187531_41150601', '2017-08-21 04:42:47', null, '0', '3', '���ⶫ', '187531', '41150601', 'ƽ�ŷ־�-ƽ���ɳ���', '0000000', null, 'file/1503290567.0/@2017082104424743635', 'http://192.168.77.33/file/1503290567.0/@2017082104424743635', null, '2017-08-21 20:42:59', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082104424756063', '20170821124247_187531_41150601', '2017-08-21 04:42:47', null, '0', '0', '���ⶫ', '187531', '41150601', 'ƽ�ŷ־�-ƽ���ɳ���', '0000000', null, 'file/1503290567.0/@2017082104424756063', 'http://192.168.77.33/file/1503290567.0/@2017082104424756063', null, '2017-08-21 21:57:44', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082104424764370', '20170821124247_187531_41150601', '2017-08-21 04:42:47', null, '0', '0', '���ⶫ', '187531', '41150601', 'ƽ�ŷ־�-ƽ���ɳ���', '0000000', null, 'file/1503290567.0/@2017082104424764370', 'http://192.168.77.33/file/1503290567.0/@2017082104424764370', null, '2017-08-21 21:21:08', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082106380215206', '20170821143802_087928_41151205', '2017-08-21 06:38:02', null, '0', '0', '���ĸ�', '087928', '41151205', '�����й�����-Ѳ�ؾ�֧��', '0000000', null, 'file/1503297482.0/@2017082106380215206', 'http://192.168.77.33/file/1503297482.0/@2017082106380215206', null, '2017-08-21 23:34:50', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082106380229501', '20170821143802_087928_41151205', '2017-08-21 06:38:02', null, '0', '3', '���ĸ�', '087928', '41151205', '�����й�����-Ѳ�ؾ�֧��', '0000000', null, 'file/1503297482.0/@2017082106380229501', 'http://192.168.77.33/file/1503297482.0/@2017082106380229501', null, '2017-08-21 22:55:56', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082106380247131', '20170821143802_087928_41151205', '2017-08-21 06:38:02', null, '0', '2', '���ĸ�', '087928', '41151205', '�����й�����-Ѳ�ؾ�֧��', '0000000', null, 'file/1503297482.0/@2017082106380247131', 'http://192.168.77.33/file/1503297482.0/@2017082106380247131', null, '2017-08-22 00:23:52', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082106540944823', '20170821145409_088268_411514', '2017-08-21 06:54:09', '2017-08-21 06:56:34', '145', '1', '������', '088268', '411514', '��ɽ�ع�����', '0000000', null, 'file/1503298449.0/@2017082106540944823', 'http://192.168.77.33/file/1503298449.0/@2017082106540944823', null, '2017-08-21 23:31:23', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082106540957693', '20170821065409_0000000_411514', '2017-08-21 06:54:09', null, '0', '0', '������', '088268', '411514', '��ɽ�ع�����', '0000000', null, 'file/1503298449.0/@2017082106540957693', 'http://192.168.77.33/file/1503298449.0/@2017082106540957693', null, '2017-08-22 00:42:16', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082108270240867', '20170821162702_088079_4115121320', '2017-08-21 08:27:02', null, '0', '0', '����', '088079', '4115121320', '��ɽ�ؽ������', '0000000', null, 'file/1503304022.0/@2017082108270240867', 'http://192.168.77.33/file/1503304022.0/@2017082108270240867', null, '2017-08-22 02:01:02', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082108270251008', '20170821162702_088079_4115121320', '2017-08-21 08:27:02', null, '0', '3', '����', '088079', '4115121320', '��ɽ�ؽ������', '0000000', null, 'file/1503304022.0/@2017082108270251008', 'http://192.168.77.33/file/1503304022.0/@2017082108270251008', null, '2017-08-22 01:50:42', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082108270259631', '20170821162702_088079_4115121320', '2017-08-21 08:27:02', '2017-08-21 08:31:09', '247', '1', '����', '088079', '4115121320', '��ɽ�ؽ������', '0000000', null, 'file/1503304022.0/@2017082108270259631', 'http://192.168.77.33/file/1503304022.0/@2017082108270259631', null, '2017-08-22 01:20:59', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082111564617007', '20170821195646_003-SA_411512120103', '2017-08-21 11:56:46', null, '0', '0', '�ﰲ', '003-SA', '411512120103', '������Ѳ�Ӽ���ж�', '0000000', null, 'file/1503316606.0/@2017082111564617007', 'http://192.168.77.33/file/1503316606.0/@2017082111564617007', null, '2017-08-22 05:28:20', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082111564636119', '20170821195646_003-SA_411512120103', '2017-08-21 11:56:46', null, '0', '3', '�ﰲ', '003-SA', '411512120103', '������Ѳ�Ӽ���ж�', '0000000', null, 'file/1503316606.0/@2017082111564636119', 'http://192.168.77.33/file/1503316606.0/@2017082111564636119', null, '2017-08-22 04:18:44', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082111564640892', '20170821195646_003-SA_411512120103', '2017-08-21 11:56:46', null, '0', '3', '�ﰲ', '003-SA', '411512120103', '������Ѳ�Ӽ���ж�', '0000000', null, 'file/1503316606.0/@2017082111564640892', 'http://192.168.77.33/file/1503316606.0/@2017082111564640892', null, '2017-08-22 04:54:50', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082114502215839', '20170821225022_086412_41151203', '2017-08-21 14:50:22', '2017-08-21 14:52:30', '128', '1', '���', '086412', '41151203', '�����й�����-110������', '0000000', null, 'file/1503327022.0/@2017082114502215839', 'http://192.168.77.33/file/1503327022.0/@2017082114502215839', null, '2017-08-22 07:03:35', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708211450224711', '20170821225022_086412_41151203', '2017-08-21 14:50:22', '2017-08-21 14:53:45', '203', '1', '���', '086412', '41151203', '�����й�����-110������', '0000000', null, 'file/1503327022.0/@201708211450224711', 'http://192.168.77.33/file/1503327022.0/@201708211450224711', null, '2017-08-22 08:22:48', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082114502250864', '20170821225022_086412_41151203', '2017-08-21 14:50:22', null, '0', '2', '���', '086412', '41151203', '�����й�����-110������', '0000000', null, 'file/1503327022.0/@2017082114502250864', 'http://192.168.77.33/file/1503327022.0/@2017082114502250864', null, '2017-08-22 08:39:21', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082118473010669', '20170822024730_186209_41151202', '2017-08-21 18:47:30', null, '0', '2', '���Ȼ', '186209', '41151202', '�����й�����-�̾�֧��', '0000000', null, 'file/1503341250.0/@2017082118473010669', 'http://192.168.77.33/file/1503341250.0/@2017082118473010669', null, '2017-08-22 11:26:33', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082118473012286', '20170822024730_186209_41151202', '2017-08-21 18:47:30', null, '0', '2', '���Ȼ', '186209', '41151202', '�����й�����-�̾�֧��', '0000000', null, 'file/1503341250.0/@2017082118473012286', 'http://192.168.77.33/file/1503341250.0/@2017082118473012286', null, '2017-08-22 11:01:15', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082118473026597', '20170822024730_186209_41151202', '2017-08-21 18:47:30', null, '0', '3', '���Ȼ', '186209', '41151202', '�����й�����-�̾�֧��', '0000000', null, 'file/1503341250.0/@2017082118473026597', 'http://192.168.77.33/file/1503341250.0/@2017082118473026597', null, '2017-08-22 11:35:56', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082200453522339', '20170822084535_HBJJ_4115121323', '2017-08-22 00:45:35', '2017-08-22 00:49:31', '236', '1', '��������', 'HBJJ', '4115121323', '�����ؽ������', '0000000', null, 'file/1503362735.0/@2017082200453522339', 'http://192.168.77.33/file/1503362735.0/@2017082200453522339', null, '2017-08-22 17:27:33', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082200453530130', '20170822084535_HBJJ_4115121323', '2017-08-22 00:45:35', null, '0', '2', '��������', 'HBJJ', '4115121323', '�����ؽ������', '0000000', null, 'file/1503362735.0/@2017082200453530130', 'http://192.168.77.33/file/1503362735.0/@2017082200453530130', null, '2017-08-22 18:30:32', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082200453539426', '20170822084535_HBJJ_4115121323', '2017-08-22 00:45:35', null, '0', '3', '��������', 'HBJJ', '4115121323', '�����ؽ������', '0000000', null, 'file/1503362735.0/@2017082200453539426', 'http://192.168.77.33/file/1503362735.0/@2017082200453539426', null, '2017-08-22 17:13:38', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082202490912004', '20170822104909_087906_41150401', '2017-08-22 02:49:09', null, '0', '3', '������', '087906', '41150401', '���۷־�-�����ɳ���', '0000000', null, 'file/1503370149.0/@2017082202490912004', 'http://192.168.77.33/file/1503370149.0/@2017082202490912004', null, '2017-08-22 19:04:11', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082202490936704', '20170822104909_087906_41150401', '2017-08-22 02:49:09', '2017-08-22 02:53:31', '262', '1', '������', '087906', '41150401', '���۷־�-�����ɳ���', '0000000', null, 'file/1503370149.0/@2017082202490936704', 'http://192.168.77.33/file/1503370149.0/@2017082202490936704', null, '2017-08-22 19:22:02', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082202490940797', '20170822104909_087906_41150401', '2017-08-22 02:49:09', null, '0', '3', '������', '087906', '41150401', '���۷־�-�����ɳ���', '0000000', null, 'file/1503370149.0/@2017082202490940797', 'http://192.168.77.33/file/1503370149.0/@2017082202490940797', null, '2017-08-22 19:28:17', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082205210422606', '20170822132104_084982_41150309', '2017-08-22 05:21:04', null, '0', '3', '��Ϊ��', '084982', '41150309', '��ɽ�־�-��ɽ�־����ڴ��', '0000000', null, 'file/1503379264.0/@2017082205210422606', 'http://192.168.77.33/file/1503379264.0/@2017082205210422606', null, '2017-08-22 21:43:24', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082205210449162', '20170822132104_084982_41150309', '2017-08-22 05:21:04', '2017-08-22 05:25:23', '259', '1', '��Ϊ��', '084982', '41150309', '��ɽ�־�-��ɽ�־����ڴ��', '0000000', null, 'file/1503379264.0/@2017082205210449162', 'http://192.168.77.33/file/1503379264.0/@2017082205210449162', null, '2017-08-22 23:17:09', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708220521047141', '20170822132104_084982_41150309', '2017-08-22 05:21:04', null, '0', '3', '��Ϊ��', '084982', '41150309', '��ɽ�־�-��ɽ�־����ڴ��', '0000000', null, 'file/1503379264.0/@201708220521047141', 'http://192.168.77.33/file/1503379264.0/@201708220521047141', null, '2017-08-22 22:41:38', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082205562718906', '20170822135627_087294_41150216', '2017-08-22 05:56:27', null, '0', '2', '����', '087294', '41150216', '���ӷ־�-���ӷ־�����������', '0000000', null, 'file/1503381387.0/@2017082205562718906', 'http://192.168.77.33/file/1503381387.0/@2017082205562718906', null, '2017-08-22 21:59:37', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082205562743030', '20170822135627_087294_41150216', '2017-08-22 05:56:27', null, '0', '0', '����', '087294', '41150216', '���ӷ־�-���ӷ־�����������', '0000000', null, 'file/1503381387.0/@2017082205562743030', 'http://192.168.77.33/file/1503381387.0/@2017082205562743030', null, '2017-08-22 23:15:11', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082205562762788', '20170822135627_087294_41150216', '2017-08-22 05:56:27', null, '0', '0', '����', '087294', '41150216', '���ӷ־�-���ӷ־�����������', '0000000', null, 'file/1503381387.0/@2017082205562762788', 'http://192.168.77.33/file/1503381387.0/@2017082205562762788', null, '2017-08-22 22:59:14', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082206385252934', '20170822143852_087013_411501', '2017-08-22 06:38:52', null, '0', '0', '�˻���', '087013', '411501', '�ϳǷ־�', '0000000', null, 'file/1503383932.0/@2017082206385252934', 'http://192.168.77.33/file/1503383932.0/@2017082206385252934', null, '2017-08-22 23:24:00', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082206385262821', '20170822143852_087013_411501', '2017-08-22 06:38:52', null, '0', '0', '�˻���', '087013', '411501', '�ϳǷ־�', '0000000', null, 'file/1503383932.0/@2017082206385262821', 'http://192.168.77.33/file/1503383932.0/@2017082206385262821', null, '2017-08-22 23:39:06', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082206385264042', '20170822143852_087013_411501', '2017-08-22 06:38:52', null, '0', '2', '�˻���', '087013', '411501', '�ϳǷ־�', '0000000', null, 'file/1503383932.0/@2017082206385264042', 'http://192.168.77.33/file/1503383932.0/@2017082206385264042', null, '2017-08-23 00:24:12', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082210175423866', '20170822181754_TC_411518', '2017-08-22 10:17:54', '2017-08-22 10:22:51', '297', '1', 'tc', 'TC', '411518', 'Ϣ�ع�����', '0000000', null, 'file/1503397074.0/@2017082210175423866', 'http://192.168.77.33/file/1503397074.0/@2017082210175423866', null, '2017-08-23 03:03:20', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082210175435244', '20170822181754_TC_411518', '2017-08-22 10:17:54', null, '0', '3', 'tc', 'TC', '411518', 'Ϣ�ع�����', '0000000', null, 'file/1503397074.0/@2017082210175435244', 'http://192.168.77.33/file/1503397074.0/@2017082210175435244', null, '2017-08-23 02:51:05', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082210175443442', '20170822181754_TC_411518', '2017-08-22 10:17:54', null, '0', '0', 'tc', 'TC', '411518', 'Ϣ�ع�����', '0000000', null, 'file/1503397074.0/@2017082210175443442', 'http://192.168.77.33/file/1503397074.0/@2017082210175443442', null, '2017-08-23 03:26:58', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082211531922464', '20170822195319_ZA0019_41151804', '2017-08-22 11:53:19', null, '0', '2', '����', 'ZA0019', '41151804', 'Ϣ�ع�����-Ѳ�ؾ����', '0000000', null, 'file/1503402799.0/@2017082211531922464', 'http://192.168.77.33/file/1503402799.0/@2017082211531922464', null, '2017-08-23 05:24:36', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082211531931822', '20170822195319_ZA0019_41151804', '2017-08-22 11:53:19', null, '0', '2', '����', 'ZA0019', '41151804', 'Ϣ�ع�����-Ѳ�ؾ����', '0000000', null, 'file/1503402799.0/@2017082211531931822', 'http://192.168.77.33/file/1503402799.0/@2017082211531931822', null, '2017-08-23 05:39:14', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708221153198175', '20170822195319_ZA0019_41151804', '2017-08-22 11:53:19', '2017-08-22 11:56:43', '204', '1', '����', 'ZA0019', '41151804', 'Ϣ�ع�����-Ѳ�ؾ����', '0000000', null, 'file/1503402799.0/@201708221153198175', 'http://192.168.77.33/file/1503402799.0/@201708221153198175', null, '2017-08-23 04:15:41', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082212342612046', '20170822203426_SAKURA_41151213', '2017-08-22 12:34:26', null, '0', '3', '����', 'SAKURA', '41151213', '�����й�����-��ͨ����֧��', '0000000', null, 'file/1503405266.0/@2017082212342612046', 'http://192.168.77.33/file/1503405266.0/@2017082212342612046', null, '2017-08-23 04:50:42', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082212342631014', '20170822203426_SAKURA_41151213', '2017-08-22 12:34:26', null, '0', '2', '����', 'SAKURA', '41151213', '�����й�����-��ͨ����֧��', '0000000', null, 'file/1503405266.0/@2017082212342631014', 'http://192.168.77.33/file/1503405266.0/@2017082212342631014', null, '2017-08-23 05:49:44', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082212342653992', '20170822203426_SAKURA_41151213', '2017-08-22 12:34:26', '2017-08-22 12:37:25', '179', '1', '����', 'SAKURA', '41151213', '�����й�����-��ͨ����֧��', '0000000', null, 'file/1503405266.0/@2017082212342653992', 'http://192.168.77.33/file/1503405266.0/@2017082212342653992', null, '2017-08-23 05:12:40', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082214341956033', '20170822223419_186026_4115120303', '2017-08-22 14:34:19', null, '0', '3', '����', '186026', '4115120303', '110������-110ƽ������վ', '0000000', null, 'file/1503412459.0/@2017082214341956033', 'http://192.168.77.33/file/1503412459.0/@2017082214341956033', null, '2017-08-23 06:40:27', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082214341959333', '20170822223419_186026_4115120303', '2017-08-22 14:34:19', null, '0', '0', '����', '186026', '4115120303', '110������-110ƽ������վ', '0000000', null, 'file/1503412459.0/@2017082214341959333', 'http://192.168.77.33/file/1503412459.0/@2017082214341959333', null, '2017-08-23 07:16:23', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082214341961076', '20170822223419_186026_4115120303', '2017-08-22 14:34:19', null, '0', '3', '����', '186026', '4115120303', '110������-110ƽ������վ', '0000000', null, 'file/1503412459.0/@2017082214341961076', 'http://192.168.77.33/file/1503412459.0/@2017082214341961076', null, '2017-08-23 07:28:54', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082217273644594', '20170823012736_ZA0065_41151804', '2017-08-22 17:27:36', null, '0', '2', '�غ�Ȼ', 'ZA0065', '41151804', 'Ϣ�ع�����-Ѳ�ؾ����', '0000000', null, 'file/1503422856.0/@2017082217273644594', 'http://192.168.77.33/file/1503422856.0/@2017082217273644594', null, '2017-08-23 10:53:41', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082217273650633', '20170823012736_ZA0065_41151804', '2017-08-22 17:27:36', '2017-08-22 17:31:46', '250', '1', '�غ�Ȼ', 'ZA0065', '41151804', 'Ϣ�ع�����-Ѳ�ؾ����', '0000000', null, 'file/1503422856.0/@2017082217273650633', 'http://192.168.77.33/file/1503422856.0/@2017082217273650633', null, '2017-08-23 10:46:35', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082217273652810', '20170823012736_ZA0065_41151804', '2017-08-22 17:27:36', null, '0', '0', '�غ�Ȼ', 'ZA0065', '41151804', 'Ϣ�ع�����-Ѳ�ؾ����', '0000000', null, 'file/1503422856.0/@2017082217273652810', 'http://192.168.77.33/file/1503422856.0/@2017082217273652810', null, '2017-08-23 09:50:09', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082218063622472', '20170823020636_999999_41150706', '2017-08-22 18:06:36', null, '0', '2', '����', '999999', '41150706', '�����ݷ־�-�����ݷ־�', '0000000', null, 'file/1503425196.0/@2017082218063622472', 'http://192.168.77.33/file/1503425196.0/@2017082218063622472', null, '2017-08-23 11:40:04', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082218063638297', '20170823020636_999999_41150706', '2017-08-22 18:06:36', '2017-08-22 18:09:24', '168', '1', '����', '999999', '41150706', '�����ݷ־�-�����ݷ־�', '0000000', null, 'file/1503425196.0/@2017082218063638297', 'http://192.168.77.33/file/1503425196.0/@2017082218063638297', null, '2017-08-23 11:21:20', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082218063654188', '20170823020636_999999_41150706', '2017-08-22 18:06:36', null, '0', '2', '����', '999999', '41150706', '�����ݷ־�-�����ݷ־�', '0000000', null, 'file/1503425196.0/@2017082218063654188', 'http://192.168.77.33/file/1503425196.0/@2017082218063654188', null, '2017-08-23 10:34:25', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082218291422275', '20170823022914_188052_41151624', '2017-08-22 18:29:14', null, '0', '0', '֣��', '188052', '41151624', '��ɽ�ع�����-ɽ���ɳ���', '0000000', null, 'file/1503426554.0/@2017082218291422275', 'http://192.168.77.33/file/1503426554.0/@2017082218291422275', null, '2017-08-23 10:55:06', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082218291439288', '20170823022914_188052_41151624', '2017-08-22 18:29:14', null, '0', '0', '֣��', '188052', '41151624', '��ɽ�ع�����-ɽ���ɳ���', '0000000', null, 'file/1503426554.0/@2017082218291439288', 'http://192.168.77.33/file/1503426554.0/@2017082218291439288', null, '2017-08-23 10:47:41', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082218291441673', '20170823022914_188052_41151624', '2017-08-22 18:29:14', null, '0', '3', '֣��', '188052', '41151624', '��ɽ�ع�����-ɽ���ɳ���', '0000000', null, 'file/1503426554.0/@2017082218291441673', 'http://192.168.77.33/file/1503426554.0/@2017082218291441673', null, '2017-08-23 11:37:08', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082218434534419', '20170823024345_187679_41150402', '2017-08-22 18:43:45', null, '0', '0', '��ӱ־', '187679', '41150402', '���۷־�-�����ɳ���', '0000000', null, 'file/1503427425.0/@2017082218434534419', 'http://192.168.77.33/file/1503427425.0/@2017082218434534419', null, '2017-08-23 12:08:27', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082218434543208', '20170823024345_187679_41150402', '2017-08-22 18:43:45', null, '0', '3', '��ӱ־', '187679', '41150402', '���۷־�-�����ɳ���', '0000000', null, 'file/1503427425.0/@2017082218434543208', 'http://192.168.77.33/file/1503427425.0/@2017082218434543208', null, '2017-08-23 12:20:24', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082218434560691', '20170823024345_187679_41150402', '2017-08-22 18:43:45', null, '0', '2', '��ӱ־', '187679', '41150402', '���۷־�-�����ɳ���', '0000000', null, 'file/1503427425.0/@2017082218434560691', 'http://192.168.77.33/file/1503427425.0/@2017082218434560691', null, '2017-08-23 12:06:09', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082222593712351', '20170823065937_189622_41151834', '2017-08-22 22:59:37', null, '0', '0', 'Ƚ��ΰ', '189622', '41151834', 'Ϣ�ع�����-�����ɳ���', '0000000', null, 'file/1503442777.0/@2017082222593712351', 'http://192.168.77.33/file/1503442777.0/@2017082222593712351', null, '2017-08-23 15:36:35', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082222593730535', '20170823065937_189622_41151834', '2017-08-22 22:59:37', null, '0', '2', 'Ƚ��ΰ', '189622', '41151834', 'Ϣ�ع�����-�����ɳ���', '0000000', null, 'file/1503442777.0/@2017082222593730535', 'http://192.168.77.33/file/1503442777.0/@2017082222593730535', null, '2017-08-23 16:04:21', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708222259375554', '20170823065937_189622_41151834', '2017-08-22 22:59:37', null, '0', '3', 'Ƚ��ΰ', '189622', '41151834', 'Ϣ�ع�����-�����ɳ���', '0000000', null, 'file/1503442777.0/@201708222259375554', 'http://192.168.77.33/file/1503442777.0/@201708222259375554', null, '2017-08-23 15:39:40', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082223082320119', '20170823070823_088878_4115121321', '2017-08-22 23:08:23', null, '0', '3', '��ΰ', '088878', '4115121321', '���ؽ������', '0000000', null, 'file/1503443303.0/@2017082223082320119', 'http://192.168.77.33/file/1503443303.0/@2017082223082320119', null, '2017-08-23 16:34:55', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082223082331319', '20170823070823_088878_4115121321', '2017-08-22 23:08:23', null, '0', '3', '��ΰ', '088878', '4115121321', '���ؽ������', '0000000', null, 'file/1503443303.0/@2017082223082331319', 'http://192.168.77.33/file/1503443303.0/@2017082223082331319', null, '2017-08-23 15:36:57', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082223082355552', '20170823070823_088878_4115121321', '2017-08-22 23:08:23', null, '0', '3', '��ΰ', '088878', '4115121321', '���ؽ������', '0000000', null, 'file/1503443303.0/@2017082223082355552', 'http://192.168.77.33/file/1503443303.0/@2017082223082355552', null, '2017-08-23 16:37:19', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082300461437063', '20170823084614_ZA0012_41151804', '2017-08-23 00:46:14', null, '0', '2', '���', 'ZA0012', '41151804', 'Ϣ�ع�����-Ѳ�ؾ����', '0000000', null, 'file/1503449174.0/@2017082300461437063', 'http://192.168.77.33/file/1503449174.0/@2017082300461437063', null, '2017-08-23 17:33:31', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082300461458562', '20170823084614_ZA0012_41151804', '2017-08-23 00:46:14', null, '0', '0', '���', 'ZA0012', '41151804', 'Ϣ�ع�����-Ѳ�ؾ����', '0000000', null, 'file/1503449174.0/@2017082300461458562', 'http://192.168.77.33/file/1503449174.0/@2017082300461458562', null, '2017-08-23 18:19:42', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082300461464487', '20170823084614_ZA0012_41151804', '2017-08-23 00:46:14', '2017-08-23 00:48:36', '142', '1', '���', 'ZA0012', '41151804', 'Ϣ�ع�����-Ѳ�ؾ����', '0000000', null, 'file/1503449174.0/@2017082300461464487', 'http://192.168.77.33/file/1503449174.0/@2017082300461464487', null, '2017-08-23 18:15:05', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082307411026412', '20170823154110_084781_41151515', '2017-08-23 07:41:10', null, '0', '0', '����', '084781', '41151515', '�괨�ع�����-�̾����', '0000000', null, 'file/1503474070.0/@2017082307411026412', 'http://192.168.77.33/file/1503474070.0/@2017082307411026412', null, '2017-08-24 01:28:22', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082307411030899', '20170823154110_084781_41151515', '2017-08-23 07:41:10', null, '0', '2', '����', '084781', '41151515', '�괨�ع�����-�̾����', '0000000', null, 'file/1503474070.0/@2017082307411030899', 'http://192.168.77.33/file/1503474070.0/@2017082307411030899', null, '2017-08-24 01:10:11', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082307411047807', '20170823154110_084781_41151515', '2017-08-23 07:41:10', null, '0', '2', '����', '084781', '41151515', '�괨�ع�����-�̾����', '0000000', null, 'file/1503474070.0/@2017082307411047807', 'http://192.168.77.33/file/1503474070.0/@2017082307411047807', null, '2017-08-24 01:39:59', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082311034940029', '20170823190349_188401_41151504', '2017-08-23 11:03:49', '2017-08-23 11:08:46', '297', '1', '�����', '188401', '41151504', '�괨�ع�����-�����ɳ���', '0000000', null, 'file/1503486229.0/@2017082311034940029', 'http://192.168.77.33/file/1503486229.0/@2017082311034940029', null, '2017-08-24 04:58:38', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082311034943977', '20170823190349_188401_41151504', '2017-08-23 11:03:49', '2017-08-23 11:07:42', '233', '1', '�����', '188401', '41151504', '�괨�ع�����-�����ɳ���', '0000000', null, 'file/1503486229.0/@2017082311034943977', 'http://192.168.77.33/file/1503486229.0/@2017082311034943977', null, '2017-08-24 04:54:19', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082311034951658', '20170823190349_188401_41151504', '2017-08-23 11:03:49', null, '0', '3', '�����', '188401', '41151504', '�괨�ع�����-�����ɳ���', '0000000', null, 'file/1503486229.0/@2017082311034951658', 'http://192.168.77.33/file/1503486229.0/@2017082311034951658', null, '2017-08-24 04:35:18', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082311561037517', '20170823195610_189485_41151839', '2017-08-23 11:56:10', null, '0', '3', '��һ��', '189485', '41151839', 'Ϣ�ع�����-������ɳ���', '0000000', null, 'file/1503489370.0/@2017082311561037517', 'http://192.168.77.33/file/1503489370.0/@2017082311561037517', null, '2017-08-24 05:53:55', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082311561056184', '20170823195610_189485_41151839', '2017-08-23 11:56:10', null, '0', '2', '��һ��', '189485', '41151839', 'Ϣ�ع�����-������ɳ���', '0000000', null, 'file/1503489370.0/@2017082311561056184', 'http://192.168.77.33/file/1503489370.0/@2017082311561056184', null, '2017-08-24 05:02:48', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708231156107065', '20170823195610_189485_41151839', '2017-08-23 11:56:10', '2017-08-23 11:58:29', '139', '1', '��һ��', '189485', '41151839', 'Ϣ�ع�����-������ɳ���', '0000000', null, 'file/1503489370.0/@201708231156107065', 'http://192.168.77.33/file/1503489370.0/@201708231156107065', null, '2017-08-24 04:11:25', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082315573410075', '20170823235734_188168_41151604', '2017-08-23 15:57:34', '2017-08-23 16:01:49', '255', '1', '��ˬ', '188168', '41151604', '��ɽ�ع�����-��ˮ�ɳ���', '0000000', null, 'file/1503503854.0/@2017082315573410075', 'http://192.168.77.33/file/1503503854.0/@2017082315573410075', null, '2017-08-24 08:52:08', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082315573439975', '20170823235734_188168_41151604', '2017-08-23 15:57:34', null, '0', '3', '��ˬ', '188168', '41151604', '��ɽ�ع�����-��ˮ�ɳ���', '0000000', null, 'file/1503503854.0/@2017082315573439975', 'http://192.168.77.33/file/1503503854.0/@2017082315573439975', null, '2017-08-24 08:39:10', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082315573446032', '20170823235734_188168_41151604', '2017-08-23 15:57:34', null, '0', '2', '��ˬ', '188168', '41151604', '��ɽ�ع�����-��ˮ�ɳ���', '0000000', null, 'file/1503503854.0/@2017082315573446032', 'http://192.168.77.33/file/1503503854.0/@2017082315573446032', null, '2017-08-24 08:40:05', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082316274612854', '20170824002746_084349_41151608', '2017-08-23 16:27:46', null, '0', '2', '����', '084349', '41151608', '��ɽ�ع�����-�ΰ����', '0000000', null, 'file/1503505666.0/@2017082316274612854', 'http://192.168.77.33/file/1503505666.0/@2017082316274612854', null, '2017-08-24 08:46:34', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082316274647365', '20170824002746_084349_41151608', '2017-08-23 16:27:46', null, '0', '0', '����', '084349', '41151608', '��ɽ�ع�����-�ΰ����', '0000000', null, 'file/1503505666.0/@2017082316274647365', 'http://192.168.77.33/file/1503505666.0/@2017082316274647365', null, '2017-08-24 09:47:03', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082316274650038', '20170824002746_084349_41151608', '2017-08-23 16:27:46', null, '0', '2', '����', '084349', '41151608', '��ɽ�ع�����-�ΰ����', '0000000', null, 'file/1503505666.0/@2017082316274650038', 'http://192.168.77.33/file/1503505666.0/@2017082316274650038', null, '2017-08-24 09:58:58', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708231946444082', '20170824034644_086401_411510', '2017-08-23 19:46:44', null, '0', '2', '����', '086401', '411510', '����־�', '0000000', null, 'file/1503517604.0/@201708231946444082', 'http://192.168.77.33/file/1503517604.0/@201708231946444082', null, '2017-08-24 13:39:26', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082319464447889', '20170824034644_086401_411510', '2017-08-23 19:46:44', null, '0', '0', '����', '086401', '411510', '����־�', '0000000', null, 'file/1503517604.0/@2017082319464447889', 'http://192.168.77.33/file/1503517604.0/@2017082319464447889', null, '2017-08-24 13:13:35', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082319464462573', '', '2017-08-23 19:46:44', null, '0', '0', '����', '086401', '411510', '����־�', '0000000', null, 'file/1503517604.0/@2017082319464462573', 'http://192.168.77.33/file/1503517604.0/@2017082319464462573', null, '2017-08-24 12:44:18', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082319553913493', '20170824035539_085919_41151111', '2017-08-23 19:55:39', '2017-08-23 19:59:32', '233', '1', '�»�', '085919', '41151111', '�����ع�����-�ΰ����', '0000000', null, 'file/1503518139.0/@2017082319553913493', 'http://192.168.77.33/file/1503518139.0/@2017082319553913493', null, '2017-08-24 13:40:30', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082319553935890', '20170824035539_085919_41151111', '2017-08-23 19:55:39', null, '0', '2', '�»�', '085919', '41151111', '�����ع�����-�ΰ����', '0000000', null, 'file/1503518139.0/@2017082319553935890', 'http://192.168.77.33/file/1503518139.0/@2017082319553935890', null, '2017-08-24 13:21:29', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082319553952167', '20170824035539_085919_41151111', '2017-08-23 19:55:39', '2017-08-23 20:00:14', '275', '1', '�»�', '085919', '41151111', '�����ع�����-�ΰ����', '0000000', null, 'file/1503518139.0/@2017082319553952167', 'http://192.168.77.33/file/1503518139.0/@2017082319553952167', null, '2017-08-24 13:44:17', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082323393550863', '20170824073935_XF0002_41151613', '2017-08-23 23:39:35', '2017-08-23 23:41:52', '137', '1', '��Ϊ��', 'XF0002', '41151613', '��ɽ�ع�����-�����ɳ���', '0000000', null, 'file/1503531575.0/@2017082323393550863', 'http://192.168.77.33/file/1503531575.0/@2017082323393550863', null, '2017-08-24 16:53:16', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082323393559557', '20170824073935_XF0002_41151613', '2017-08-23 23:39:35', null, '0', '3', '��Ϊ��', 'XF0002', '41151613', '��ɽ�ع�����-�����ɳ���', '0000000', null, 'file/1503531575.0/@2017082323393559557', 'http://192.168.77.33/file/1503531575.0/@2017082323393559557', null, '2017-08-24 16:36:26', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082323393559959', '20170824073935_XF0002_41151613', '2017-08-23 23:39:35', null, '0', '2', '��Ϊ��', 'XF0002', '41151613', '��ɽ�ع�����-�����ɳ���', '0000000', null, 'file/1503531575.0/@2017082323393559959', 'http://192.168.77.33/file/1503531575.0/@2017082323393559959', null, '2017-08-24 17:04:27', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082401312011113', '20170824093120_ZSM_4115121301', '2017-08-24 01:31:20', '2017-08-24 01:33:32', '132', '1', '������', 'ZSM', '4115121301', '����������', '0000000', null, 'file/1503538280.0/@2017082401312011113', 'http://192.168.77.33/file/1503538280.0/@2017082401312011113', null, '2017-08-24 18:57:28', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082401312027607', '20170824093120_ZSM_4115121301', '2017-08-24 01:31:20', null, '0', '0', '������', 'ZSM', '4115121301', '����������', '0000000', null, 'file/1503538280.0/@2017082401312027607', 'http://192.168.77.33/file/1503538280.0/@2017082401312027607', null, '2017-08-24 19:21:12', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082401430521267', '20170824094305_086435_41151208', '2017-08-24 01:43:05', null, '0', '3', '���', '086435', '41151208', '�����й�����-����֧��', '0000000', null, 'file/1503538985.0/@2017082401430521267', 'http://192.168.77.33/file/1503538985.0/@2017082401430521267', null, '2017-08-24 18:12:33', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082401430523497', '20170824094305_086435_41151208', '2017-08-24 01:43:05', null, '0', '0', '���', '086435', '41151208', '�����й�����-����֧��', '0000000', null, 'file/1503538985.0/@2017082401430523497', 'http://192.168.77.33/file/1503538985.0/@2017082401430523497', null, '2017-08-24 18:46:48', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082401430526564', '20170824094305_086435_41151208', '2017-08-24 01:43:05', null, '0', '2', '���', '086435', '41151208', '�����й�����-����֧��', '0000000', null, 'file/1503538985.0/@2017082401430526564', 'http://192.168.77.33/file/1503538985.0/@2017082401430526564', null, '2017-08-24 19:37:44', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082402493912670', '20170824104939_084017_41151634', '2017-08-24 02:49:39', null, '0', '0', '֣���', '084017', '41151634', '��ɽ�ع�����-������', '0000000', null, 'file/1503542979.0/@2017082402493912670', 'http://192.168.77.33/file/1503542979.0/@2017082402493912670', null, '2017-08-24 18:54:19', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082402493919840', '20170824104939_084017_41151634', '2017-08-24 02:49:39', null, '0', '3', '֣���', '084017', '41151634', '��ɽ�ع�����-������', '0000000', null, 'file/1503542979.0/@2017082402493919840', 'http://192.168.77.33/file/1503542979.0/@2017082402493919840', null, '2017-08-24 20:37:23', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082402493932072', '20170824104939_084017_41151634', '2017-08-24 02:49:39', null, '0', '3', '֣���', '084017', '41151634', '��ɽ�ع�����-������', '0000000', null, 'file/1503542979.0/@2017082402493932072', 'http://192.168.77.33/file/1503542979.0/@2017082402493932072', null, '2017-08-24 20:21:52', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082403295810321', '20170824112958_185765_41151703', '2017-08-24 03:29:58', '2017-08-24 03:32:39', '161', '1', '���ʳ�', '185765', '41151703', '�̳��ع�����-�ǹ��ɳ���', '0000000', null, 'file/1503545398.0/@2017082403295810321', 'http://192.168.77.33/file/1503545398.0/@2017082403295810321', null, '2017-08-24 20:33:52', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082403295828833', '20170824112958_185765_41151703', '2017-08-24 03:29:58', null, '0', '2', '���ʳ�', '185765', '41151703', '�̳��ع�����-�ǹ��ɳ���', '0000000', null, 'file/1503545398.0/@2017082403295828833', 'http://192.168.77.33/file/1503545398.0/@2017082403295828833', null, '2017-08-24 19:33:31', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082403295860695', '20170824112958_185765_41151703', '2017-08-24 03:29:58', null, '0', '0', '���ʳ�', '185765', '41151703', '�̳��ع�����-�ǹ��ɳ���', '0000000', null, 'file/1503545398.0/@2017082403295860695', 'http://192.168.77.33/file/1503545398.0/@2017082403295860695', null, '2017-08-24 20:12:54', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082404240625682', '20170824122406_087787_411504', '2017-08-24 04:24:06', '2017-08-24 04:26:36', '150', '1', '����', '087787', '411504', '���۷־�', '0000000', null, 'file/1503548646.0/@2017082404240625682', 'http://192.168.77.33/file/1503548646.0/@2017082404240625682', null, '2017-08-24 20:49:53', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082404240631233', '20170824122406_087787_411504', '2017-08-24 04:24:06', null, '0', '3', '����', '087787', '411504', '���۷־�', '0000000', null, 'file/1503548646.0/@2017082404240631233', 'http://192.168.77.33/file/1503548646.0/@2017082404240631233', null, '2017-08-24 21:25:53', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082404240659951', '20170824122406_087787_411504', '2017-08-24 04:24:06', null, '0', '2', '����', '087787', '411504', '���۷־�', '0000000', null, 'file/1503548646.0/@2017082404240659951', 'http://192.168.77.33/file/1503548646.0/@2017082404240659951', null, '2017-08-24 21:42:10', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082404293225073', '20170824122932_087468_41150201', '2017-08-24 04:29:32', null, '0', '0', 'ʩ��ɽ', '087468', '41150201', '���ӷ־�-�����ɳ���', '0000000', null, 'file/1503548972.0/@2017082404293225073', 'http://192.168.77.33/file/1503548972.0/@2017082404293225073', null, '2017-08-24 22:25:43', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708240429328328', '20170824122932_087468_41150201', '2017-08-24 04:29:32', '2017-08-24 04:31:36', '124', '1', 'ʩ��ɽ', '087468', '41150201', '���ӷ־�-�����ɳ���', '0000000', null, 'file/1503548972.0/@201708240429328328', 'http://192.168.77.33/file/1503548972.0/@201708240429328328', null, '2017-08-24 20:35:53', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708240429329855', '20170824122932_087468_41150201', '2017-08-24 04:29:32', null, '0', '3', 'ʩ��ɽ', '087468', '41150201', '���ӷ־�-�����ɳ���', '0000000', null, 'file/1503548972.0/@201708240429329855', 'http://192.168.77.33/file/1503548972.0/@201708240429329855', null, '2017-08-24 21:24:33', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082404483825812', '20170824124838_085640_41151813', '2017-08-24 04:48:38', '2017-08-24 04:53:00', '262', '1', '��÷', '085640', '41151813', 'Ϣ�ع�����-���', '0000000', null, 'file/1503550118.0/@2017082404483825812', 'http://192.168.77.33/file/1503550118.0/@2017082404483825812', null, '2017-08-24 22:39:24', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082404483834106', '20170824124838_085640_41151813', '2017-08-24 04:48:38', null, '0', '0', '��÷', '085640', '41151813', 'Ϣ�ع�����-���', '0000000', null, 'file/1503550118.0/@2017082404483834106', 'http://192.168.77.33/file/1503550118.0/@2017082404483834106', null, '2017-08-24 20:53:49', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082404483835674', '20170824124838_085640_41151813', '2017-08-24 04:48:38', '2017-08-24 04:50:50', '132', '1', '��÷', '085640', '41151813', 'Ϣ�ع�����-���', '0000000', null, 'file/1503550118.0/@2017082404483835674', 'http://192.168.77.33/file/1503550118.0/@2017082404483835674', null, '2017-08-24 21:46:00', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082405550922857', '20170824135509_189587_41151842', '2017-08-24 05:55:09', '2017-08-24 05:57:18', '129', '1', '����ȫ', '189587', '41151842', 'Ϣ�ع�����-�ٺ��ɳ���', '0000000', null, 'file/1503554109.0/@2017082405550922857', 'http://192.168.77.33/file/1503554109.0/@2017082405550922857', null, '2017-08-24 23:46:37', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082405550934055', '20170824135509_189587_41151842', '2017-08-24 05:55:09', '2017-08-24 05:59:31', '262', '1', '����ȫ', '189587', '41151842', 'Ϣ�ع�����-�ٺ��ɳ���', '0000000', null, 'file/1503554109.0/@2017082405550934055', 'http://192.168.77.33/file/1503554109.0/@2017082405550934055', null, '2017-08-24 22:31:19', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082405550938646', '20170824135509_189587_41151842', '2017-08-24 05:55:09', '2017-08-24 05:58:39', '210', '1', '����ȫ', '189587', '41151842', 'Ϣ�ع�����-�ٺ��ɳ���', '0000000', null, 'file/1503554109.0/@2017082405550938646', 'http://192.168.77.33/file/1503554109.0/@2017082405550938646', null, '2017-08-24 22:06:21', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082406305915349', '20170824143059_187011_41150214', '2017-08-24 06:30:59', null, '0', '3', '������', '187011', '41150214', '���ӷ־�-���ӷ־ְ��������', '0000000', null, 'file/1503556259.0/@2017082406305915349', 'http://192.168.77.33/file/1503556259.0/@2017082406305915349', null, '2017-08-24 23:33:32', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@201708240630595269', '20170824143059_187011_41150214', '2017-08-24 06:30:59', null, '0', '0', '������', '187011', '41150214', '���ӷ־�-���ӷ־ְ��������', '0000000', null, 'file/1503556259.0/@201708240630595269', 'http://192.168.77.33/file/1503556259.0/@201708240630595269', null, '2017-08-24 23:34:08', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082406305963819', '20170824143059_187011_41150214', '2017-08-24 06:30:59', '2017-08-24 06:34:22', '203', '1', '������', '187011', '41150214', '���ӷ־�-���ӷ־ְ��������', '0000000', null, 'file/1503556259.0/@2017082406305963819', 'http://192.168.77.33/file/1503556259.0/@2017082406305963819', null, '2017-08-24 23:20:11', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082408022231712', '20170824160222_188031_411512132613', '2017-08-24 08:02:22', null, '0', '2', '����Ǭ', '188031', '411512132613', '�����ж�', '0000000', null, 'file/1503561742.0/@2017082408022231712', 'http://192.168.77.33/file/1503561742.0/@2017082408022231712', null, '2017-08-25 00:39:34', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082408022241021', '20170824160222_188031_411512132613', '2017-08-24 08:02:22', null, '0', '0', '����Ǭ', '188031', '411512132613', '�����ж�', '0000000', null, 'file/1503561742.0/@2017082408022241021', 'http://192.168.77.33/file/1503561742.0/@2017082408022241021', null, '2017-08-25 01:48:01', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082408022245696', '20170824160222_188031_411512132613', '2017-08-24 08:02:22', null, '0', '3', '����Ǭ', '188031', '411512132613', '�����ж�', '0000000', null, 'file/1503561742.0/@2017082408022245696', 'http://192.168.77.33/file/1503561742.0/@2017082408022245696', null, '2017-08-25 00:54:06', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082409443910041', '20170824174439_087388_41150208', '2017-08-24 09:44:39', null, '0', '2', '���˽�', '087388', '41150208', '���ӷ־�-��ҵ��ɳ���', '0000000', null, 'file/1503567879.0/@2017082409443910041', 'http://192.168.77.33/file/1503567879.0/@2017082409443910041', null, '2017-08-25 02:20:07', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082409443942295', '20170824174439_087388_41150208', '2017-08-24 09:44:39', null, '0', '0', '���˽�', '087388', '41150208', '���ӷ־�-��ҵ��ɳ���', '0000000', null, 'file/1503567879.0/@2017082409443942295', 'http://192.168.77.33/file/1503567879.0/@2017082409443942295', null, '2017-08-25 03:00:11', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082409443946578', '20170824174439_087388_41150208', '2017-08-24 09:44:39', null, '0', '0', '���˽�', '087388', '41150208', '���ӷ־�-��ҵ��ɳ���', '0000000', null, 'file/1503567879.0/@2017082409443946578', 'http://192.168.77.33/file/1503567879.0/@2017082409443946578', null, '2017-08-25 02:38:37', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082411275713797', '20170824192757_086991_41151202', '2017-08-24 11:27:57', null, '0', '0', '��  ��', '086991', '41151202', '�����й�����-�̾�֧��', '0000000', null, 'file/1503574077.0/@2017082411275713797', 'http://192.168.77.33/file/1503574077.0/@2017082411275713797', null, '2017-08-25 03:50:18', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082411275727170', '20170824192757_086991_41151202', '2017-08-24 11:27:57', null, '0', '0', '��  ��', '086991', '41151202', '�����й�����-�̾�֧��', '0000000', null, 'file/1503574077.0/@2017082411275727170', 'http://192.168.77.33/file/1503574077.0/@2017082411275727170', null, '2017-08-25 03:44:03', '0', null, '0', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082411275761439', '20170824192757_086991_41151202', '2017-08-24 11:27:57', '2017-08-24 11:32:51', '294', '1', '��  ��', '086991', '41151202', '�����й�����-�̾�֧��', '0000000', null, 'file/1503574077.0/@2017082411275761439', 'http://192.168.77.33/file/1503574077.0/@2017082411275761439', null, '2017-08-25 05:01:12', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082413335528930', '20170824213355_008_4115120306', '2017-08-24 13:33:55', '2017-08-24 13:37:03', '188', '1', 'ͿС��', '008', '4115120306', '110������-110���ϻ�԰����վ', '0000000', null, 'file/1503581635.0/@2017082413335528930', 'http://192.168.77.33/file/1503581635.0/@2017082413335528930', null, '2017-08-25 06:34:07', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('@2017082413335533397', '20170824213355_008_4115120306', '2017-08-24 13:33:55', null, '0', '0', 'ͿС��', '008', '4115120306', '110������-110���ϻ�԰����վ', '0000000', null, 'file/1503581635.0/@2017082413335533397', 'http://192.168.77.33/file/1503581635.0/@2017082413335533397', null, '2017-08-25 07:31:48', '0', null, '1', '9', '1', '2017-01-01 00:00:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('cpxhpe_123123_20170829102724.MP4', '20170829102710_cpxhpe_4115', '2017-08-29 10:27:24', null, '0', '1', 'ceshi', '123123', '4115', '�����й�����', 'cpxhpe', '192.168.3.109', null, 'http://192.168.3.109:80/pe_fileG/pedata/cpxhpe/20170829/cpxhpe_123123_20170829102724.MP4', null, '2017-08-29 10:27:24', '0', null, '0', '9', '2', '2017-08-29 10:27:24', '', '0');
INSERT INTO `case_video_201708` VALUES ('cpxhpe_admin_20170826103410.jpg', '20170824174539_T11366_411501', '2017-08-26 10:34:10', null, '0', '3', '��������Ա', 'admin', '41', '����ʡ������', 'cpxhpe', '192.168.77.33', null, 'http://192.168.77.33:80/pe_fileG/pedata/cpxhpe/20170826/cpxhpe_admin_20170826103410.jpg', null, '2017-08-26 10:34:10', '0', null, '0', '9', '3', '2017-08-26 10:34:10', '', '0');
INSERT INTO `case_video_201708` VALUES ('cpxhpe_admin_20170826115319.txt', '20170826110630_cpxhpe_41', '2017-08-26 11:53:19', null, '0', '0', '��������Ա', 'admin', '41', '����ʡ������', 'cpxhpe', '192.168.77.33', null, 'http://192.168.77.33:80/pe_fileG/pedata/cpxhpe/20170826/cpxhpe_admin_20170826115319.txt', null, '2017-08-26 11:53:19', '0', null, '0', '9', '3', '2017-08-26 11:53:19', '', '0');
INSERT INTO `case_video_201708` VALUES ('cpxhpe_admin_20170826142534.jpg', '20170826110630_cpxhpe_41', '2017-08-26 14:25:34', null, '0', '3', '��������Ա', 'admin', '41', '����ʡ������', 'cpxhpe', '192.168.77.33', null, 'http://192.168.77.33:80/pe_fileG/pedata/cpxhpe/20170826/cpxhpe_admin_20170826142534.jpg', null, '2017-08-26 14:25:34', '0', null, '0', '9', '2', '2017-08-26 14:25:34', '', '0');
INSERT INTO `case_video_201708` VALUES ('cpxhpe_admin_20170826200029.jpg', '', '2017-08-26 20:00:29', null, '0', '3', '��������Ա', 'admin', '41', '����ʡ������', 'cpxhpe', '192.168.77.33', null, 'http://192.168.77.33:80/pe_fileG/pedata/cpxhpe/20170826/cpxhpe_admin_20170826200029.jpg', null, '2017-08-26 20:00:29', '0', null, '0', '9', '2', '2017-08-26 20:00:29', '', '0');
INSERT INTO `case_video_201708` VALUES ('T11366_085532_20170824174539.MP4', '20170824174539_T11366_411501', '2017-08-24 17:45:39', '2017-08-24 17:46:52', '73', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170824/T11366_085532_20170824174539.MP4', null, '2017-08-25 15:48:18', '0', '192.168.3.110', '0', '9', '1', '2017-08-25 15:48:18', '', '0');
INSERT INTO `case_video_201708` VALUES ('T11366_085532_20170826113314.MP4', '20170826113314_085532_411501', '2017-08-26 11:33:14', '2017-08-26 11:33:30', '16', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170826/T11366_085532_20170826113314.MP4', null, '2017-08-27 19:34:58', '0', '192.168.77.33', '0', '9', '1', '2017-08-27 19:34:58', '', '0');
INSERT INTO `case_video_201708` VALUES ('T11366_085532_20170826113337.MP4', '20170826113314_085532_411501', '2017-08-26 11:33:37', '2017-08-26 11:33:46', '9', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170826/T11366_085532_20170826113337.MP4', null, '2017-08-27 19:34:59', '0', '192.168.77.33', '0', '9', '1', '2017-08-27 19:34:59', '', '0');
INSERT INTO `case_video_201708` VALUES ('T11366_085532_20170827192641.MP4', '20170826113314_085532_411501', '2017-08-27 19:26:41', '2017-08-27 19:26:54', '13', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170827/T11366_085532_20170827192641.MP4', null, '2017-08-27 19:35:00', '0', '192.168.77.33', '0', '9', '1', '2017-08-27 19:35:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('T11366_085532_20170827192703.MP4', '20170826113314_085532_411501', '2017-08-27 19:27:03', '2017-08-27 19:27:18', '15', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170827/T11366_085532_20170827192703.MP4', null, '2017-08-27 19:35:00', '0', '192.168.77.33', '0', '9', '1', '2017-08-27 19:35:00', '', '0');
INSERT INTO `case_video_201708` VALUES ('T11366_085532_20170827192725.MP4', '20170827192725_T11366_411501', '2017-08-27 19:27:25', '2017-08-27 19:27:38', '13', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170827/T11366_085532_20170827192725.MP4', null, '2017-08-27 19:35:01', '0', '192.168.77.33', '0', '9', '1', '2017-08-27 19:35:01', '', '0');
INSERT INTO `case_video_201708` VALUES ('T11366_085532_20170827192743.MP4', '20170827192725_T11366_411501', '2017-08-27 19:27:43', '2017-08-27 19:27:50', '7', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170827/T11366_085532_20170827192743.MP4', null, '2017-08-27 19:35:02', '0', '192.168.77.33', '0', '9', '1', '2017-08-27 19:35:02', '', '0');

-- ----------------------------
-- Table structure for case_video_201709
-- ----------------------------
DROP TABLE IF EXISTS `case_video_201709`;
CREATE TABLE `case_video_201709` (
  `wjbh` varchar(100) NOT NULL DEFAULT '0' COMMENT '�ļ���� <�������>_<����>_<������ʱ����>.<����>',
  `case_key` varchar(64) NOT NULL DEFAULT '' COMMENT '������ʶ��ͬcase_201708.case_key',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `end_time` datetime DEFAULT NULL COMMENT '��Ƶ����ʱ��',
  `wjcd` int(11) DEFAULT '0' COMMENT '�ļ�����',
  `wjlx` int(2) DEFAULT NULL COMMENT '0:δ֪,1:��Ƶ,2:��Ƶ,3:ͼƬ',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '��Ա����',
  `jybh` varchar(32) NOT NULL DEFAULT '000000' COMMENT '��Ա���',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '��λ,ͬarea_dep.areacode',
  `areaname` varchar(128) DEFAULT '' COMMENT '��λ����',
  `cpxh` varchar(12) NOT NULL DEFAULT '0000000' COMMENT '��Ʒ���(ִ���Ǳ��),�ļ����˹��ṩʱͳһ��99999',
  `ccfwq_ip` varchar(64) DEFAULT NULL COMMENT '�洢������',
  `ccwz` varchar(200) DEFAULT NULL COMMENT '�洢λ��',
  `bfwz` varchar(200) NOT NULL DEFAULT 'http://' COMMENT '����λ��',
  `wlwz` varchar(200) DEFAULT NULL COMMENT '����λ��,����·��',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '�ϴ�ʱ��',
  `bzlx` int(2) DEFAULT '0' COMMENT '��ע����,0:δ��ע,1:��ע(���Ͱ���)',
  `gzz_ip` varchar(64) DEFAULT NULL COMMENT '����վIP',
  `upload` int(2) NOT NULL DEFAULT '0' COMMENT '0:���ϴ���1���ϴ������ķ�����(��Ҫ��Ƶ)',
  `video_type` int(2) DEFAULT '9' COMMENT '��Ƶ����(1:�Ƽݡ�2:�¹ʡ�3:���ݡ�4:Υ����9:����)',
  `source` int(1) NOT NULL DEFAULT '1' COMMENT '��Դ;1:ִ����¼��,2:������,3:�ǹ�����',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `remark` varchar(256) DEFAULT '',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:����,1:��ɾ,2:Ӳɾ',
  PRIMARY KEY (`wjbh`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_case_key` (`case_key`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_video_201709
-- ----------------------------
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905091015.MP4', '20170905091015_085532_411501', '2017-09-05 09:10:15', '2017-09-05 09:10:24', '9', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905091015.MP4', null, '2017-09-05 09:32:44', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 09:32:44', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905091034.MP4', '20170905091015_085532_411501', '2017-09-05 09:10:34', '2017-09-05 09:10:42', '8', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905091034.MP4', null, '2017-09-05 09:32:45', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 09:32:45', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905091054.MP4', '20170905091015_085532_411501', '2017-09-05 09:10:54', '2017-09-05 09:11:08', '14', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905091054.MP4', null, '2017-09-05 09:32:46', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 09:32:46', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905091117.MP4', '20170905091015_085532_411501', '2017-09-05 09:11:17', '2017-09-05 09:11:26', '9', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905091117.MP4', null, '2017-09-05 09:32:46', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 09:32:46', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905091132.JPG', '20170905091015_085532_411501', '2017-09-05 09:11:32', '2017-09-05 09:11:32', '0', '3', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905091132.JPG', null, '2017-09-05 09:32:47', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 09:32:47', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905091136.JPG', '20170905091015_085532_411501', '2017-09-05 09:11:36', '2017-09-05 09:11:36', '0', '3', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905091136.JPG', null, '2017-09-05 09:32:47', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 09:32:47', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905091144.JPG', '20170905091015_085532_411501', '2017-09-05 09:11:44', '2017-09-05 09:11:44', '0', '3', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905091144.JPG', null, '2017-09-05 09:32:48', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 09:32:48', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905091222.MP4', '20170905091015_085532_411501', '2017-09-05 09:12:22', '2017-09-05 09:12:34', '12', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905091222.MP4', null, '2017-09-05 09:32:49', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 09:32:49', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905091244.MP4', '20170905091015_085532_411501', '2017-09-05 09:12:44', '2017-09-05 09:12:58', '14', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905091244.MP4', null, '2017-09-05 09:32:49', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 09:32:49', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905114815.MP4', '20170905114815_085532_411501', '2017-09-05 11:48:15', '2017-09-05 11:48:30', '15', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905114815.MP4', null, '2017-09-05 12:35:49', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 12:35:49', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905114838.MP4', '20170905114815_085532_411501', '2017-09-05 11:48:38', '2017-09-05 11:48:46', '8', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905114838.MP4', null, '2017-09-05 12:35:50', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 12:35:50', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905114901.MP4', '20170905114815_085532_411501', '2017-09-05 11:49:01', '2017-09-05 11:49:16', '15', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905114901.MP4', null, '2017-09-05 12:35:51', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 12:35:51', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905115017.MP4', '20170905114815_085532_411501', '2017-09-05 11:50:17', '2017-09-05 11:50:42', '25', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905115017.MP4', null, '2017-09-05 12:35:52', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 12:35:52', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905115212.JPG', '20170905114815_085532_411501', '2017-09-05 11:52:12', '2017-09-05 11:52:12', '0', '3', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905115212.JPG', null, '2017-09-05 12:35:53', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 12:35:53', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905123133.MP4', '20170905123133_085532_411501', '2017-09-05 12:31:33', '2017-09-05 12:31:46', '13', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905123133.MP4', null, '2017-09-05 12:35:54', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 12:35:54', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905123201.MP4', '20170905123133_085532_411501', '2017-09-05 12:32:01', '2017-09-05 12:32:18', '17', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905123201.MP4', null, '2017-09-05 12:35:55', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 12:35:55', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905123227.MP4', '20170905123133_085532_411501', '2017-09-05 12:32:27', '2017-09-05 12:32:36', '9', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905123227.MP4', null, '2017-09-05 12:35:56', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 12:35:56', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905123243.MP4', '20170905123133_085532_411501', '2017-09-05 12:32:43', '2017-09-05 12:32:50', '7', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905123243.MP4', null, '2017-09-05 12:35:56', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 12:35:56', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905123256.MP4', '20170905123133_085532_411501', '2017-09-05 12:32:56', '2017-09-05 12:33:06', '10', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905123256.MP4', null, '2017-09-05 12:35:57', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 12:35:57', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905123319.MP4', '20170905123133_085532_411501', '2017-09-05 12:33:19', '2017-09-05 12:33:30', '11', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905123319.MP4', null, '2017-09-05 12:35:58', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 12:35:58', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905123337.MP4', '20170905123133_085532_411501', '2017-09-05 12:33:37', '2017-09-05 12:33:46', '9', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905123337.MP4', null, '2017-09-05 12:35:59', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 12:35:59', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905123408.MP4', '20170905123133_085532_411501', '2017-09-05 12:34:08', '2017-09-05 12:34:28', '20', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905123408.MP4', null, '2017-09-05 12:36:00', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 12:36:00', '', '0');
INSERT INTO `case_video_201709` VALUES ('T11366_085532_20170905123444.MP4', '20170905123133_085532_411501', '2017-09-05 12:34:44', '2017-09-05 12:34:54', '10', '1', '����', '085532', '411501', '�ϳǷ־�', 'T11366', 'localhost', null, 'http://localhost:80/pe_fileG/pedata/T11366/20170905/T11366_085532_20170905123444.MP4', null, '2017-09-05 12:36:01', '0', '192.168.3.113', '0', '9', '1', '2017-09-05 12:36:01', '', '0');

-- ----------------------------
-- Table structure for case_video_201710
-- ----------------------------
DROP TABLE IF EXISTS `case_video_201710`;
CREATE TABLE `case_video_201710` (
  `wjbh` varchar(100) NOT NULL DEFAULT '0' COMMENT '�ļ���� <�������>_<����>_<������ʱ����>.<����>',
  `case_key` varchar(64) NOT NULL DEFAULT '' COMMENT '������ʶ��ͬcase_201708.case_key',
  `start_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `end_time` datetime DEFAULT NULL COMMENT '��Ƶ����ʱ��',
  `wjcd` int(11) DEFAULT '0' COMMENT '�ļ�����',
  `wjlx` int(2) DEFAULT NULL COMMENT '0:δ֪,1:��Ƶ,2:��Ƶ,3:ͼƬ',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '��Ա����',
  `jybh` varchar(32) NOT NULL DEFAULT '000000' COMMENT '��Ա���',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '��λ,ͬarea_dep.areacode',
  `areaname` varchar(128) DEFAULT '' COMMENT '��λ����',
  `cpxh` varchar(12) NOT NULL DEFAULT '0000000' COMMENT '��Ʒ���(ִ���Ǳ��),�ļ����˹��ṩʱͳһ��99999',
  `ccfwq_ip` varchar(64) DEFAULT NULL COMMENT '�洢������',
  `ccwz` varchar(200) DEFAULT NULL COMMENT '�洢λ��',
  `bfwz` varchar(200) NOT NULL DEFAULT 'http://' COMMENT '����λ��',
  `wlwz` varchar(200) DEFAULT NULL COMMENT '����λ��,����·��',
  `scsj` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '�ϴ�ʱ��',
  `bzlx` int(2) DEFAULT '0' COMMENT '��ע����,0:δ��ע,1:��ע(���Ͱ���)',
  `gzz_ip` varchar(64) DEFAULT NULL COMMENT '����վIP',
  `upload` int(2) NOT NULL DEFAULT '0' COMMENT '0:���ϴ���1���ϴ������ķ�����(��Ҫ��Ƶ)',
  `video_type` int(2) DEFAULT '9' COMMENT '��Ƶ����(1:�Ƽݡ�2:�¹ʡ�3:���ݡ�4:Υ����9:����)',
  `source` int(1) NOT NULL DEFAULT '1' COMMENT '��Դ;1:ִ����¼��,2:������,3:�ǹ�����',
  `update_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `remark` varchar(256) DEFAULT '',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:����,1:��ɾ,2:Ӳɾ',
  PRIMARY KEY (`wjbh`),
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_case_key` (`case_key`) USING BTREE,
  KEY `idx_start_time` (`start_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_video_201710
-- ----------------------------

-- ----------------------------
-- Table structure for dept_role
-- ----------------------------
DROP TABLE IF EXISTS `dept_role`;
CREATE TABLE `dept_role` (
  `dept_role_id` bigint(19) NOT NULL DEFAULT '0' COMMENT '���Ž�ɫID 13λʱ������',
  `rolename` varchar(64) NOT NULL DEFAULT '' COMMENT '���Ž�ɫ��',
  `remark` varchar(128) DEFAULT NULL COMMENT '���Ž�ɫ˵��',
  `dept_list` varchar(4096) DEFAULT '' COMMENT '���Ŵ����б�',
  PRIMARY KEY (`dept_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dept_role
-- ----------------------------
INSERT INTO `dept_role` VALUES ('1', '�鿴���в�������', '', '41');
INSERT INTO `dept_role` VALUES ('2', '�鿴ֱ���־�', '', '411512');
INSERT INTO `dept_role` VALUES ('3', '��ɽ��', '', '411516,4115121326');
INSERT INTO `dept_role` VALUES ('1504598438080', 'Ϣ��', '', '411518,4115121324');

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL COMMENT '����',
  `name` varchar(255) NOT NULL COMMENT '�ֶ�����',
  `value` varchar(255) DEFAULT '' COMMENT '�ֶ�ֵ',
  `item` varchar(255) DEFAULT '' COMMENT '�ֶ�ֵ����',
  `order` int(5) NOT NULL COMMENT '����',
  PRIMARY KEY (`id`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('1', 'status', '״̬', '0', '����', '0');
INSERT INTO `dictionary` VALUES ('2', 'status', '״̬', '1', '����', '0');
INSERT INTO `dictionary` VALUES ('3', 'deptype', '��������', '0', '��', '0');
INSERT INTO `dictionary` VALUES ('4', 'deptype', '��������', '1', '����', '0');
INSERT INTO `dictionary` VALUES ('5', 'deptype', '��������', '2', '����', '0');
INSERT INTO `dictionary` VALUES ('6', 'status', '״̬', '', '', '0');
INSERT INTO `dictionary` VALUES ('7', 'deptype', '��������', '', '', '0');
INSERT INTO `dictionary` VALUES ('9', 'enable', '����״̬', '', '', '0');
INSERT INTO `dictionary` VALUES ('10', 'enable', '����״̬', '1', '����', '1');
INSERT INTO `dictionary` VALUES ('11', 'enable', '����״̬', '0', 'ͣ��', '2');
INSERT INTO `dictionary` VALUES ('12', 'videotype', '��Ƶ����', '', '', '0');
INSERT INTO `dictionary` VALUES ('14', 'videotype', '��Ƶ����', '', 'δ֪', '0');
INSERT INTO `dictionary` VALUES ('15', 'videotype', '��Ƶ����', '1', '��Ƶ', '1');
INSERT INTO `dictionary` VALUES ('16', 'alarm_type', '��������', '', '', '0');
INSERT INTO `dictionary` VALUES ('17', 'alarm_type', '��������', '0', 'δ�༭��3���£�', '9');
INSERT INTO `dictionary` VALUES ('18', 'alarm_type', '��������', '', '��ѡ��', '0');
INSERT INTO `dictionary` VALUES ('19', 'alarm_type', '��������', '1', 'һ�㾯��(6����)', '1');
INSERT INTO `dictionary` VALUES ('20', 'alarm_type', '��������', '2', '�ش���(����)', '2');
INSERT INTO `dictionary` VALUES ('21', 'alarm_type', '��������', '3', '�谭��ִ����������(����)', '3');
INSERT INTO `dictionary` VALUES ('22', 'alarm_type', '��������', '4', '����ǿ��ִ��(����)', '4');
INSERT INTO `dictionary` VALUES ('23', 'alarm_type', '��������', '5', '�������ʼ��(6����)', '5');
INSERT INTO `dictionary` VALUES ('24', 'alarm_type', '��������', '6', '��Ч����(7��)', '6');
INSERT INTO `dictionary` VALUES ('25', 'alarm_type', '��������', '7', '����(6����)', '7');
INSERT INTO `dictionary` VALUES ('26', 'case_type', '��������', '', '', '0');
INSERT INTO `dictionary` VALUES ('27', 'case_type', '��������', '0', 'δ֪', '1');
INSERT INTO `dictionary` VALUES ('28', 'case_type', '��������', '', '��ѡ��', '0');
INSERT INTO `dictionary` VALUES ('29', 'case_type', '��������', '2', '���참��', '3');
INSERT INTO `dictionary` VALUES ('30', 'case_type', '��������', '1', '��������', '2');
INSERT INTO `dictionary` VALUES ('31', 'is_read', '��������', '', '', '0');
INSERT INTO `dictionary` VALUES ('32', 'is_read', '��������', '1', '��д', '1');
INSERT INTO `dictionary` VALUES ('33', 'is_read', '��������', '0', 'ֻ��', '0');
INSERT INTO `dictionary` VALUES ('34', 'areatype', '��������', '', '', '0');
INSERT INTO `dictionary` VALUES ('35', 'areatype', '��������', '0', '����', '0');
INSERT INTO `dictionary` VALUES ('36', 'areatype', '��������', '1', '����', '1');
INSERT INTO `dictionary` VALUES ('37', 'areatype', '��������', '2', '����', '2');
INSERT INTO `dictionary` VALUES ('38', 'video_source', '������Դ', '', '', '0');
INSERT INTO `dictionary` VALUES ('39', 'video_source', '������Դ', '1', 'ִ����¼��', '1');
INSERT INTO `dictionary` VALUES ('40', 'video_source', '������Դ', '2', '������ɼ�', '2');
INSERT INTO `dictionary` VALUES ('41', 'video_source', '������Դ', '3', '�ǹ�����ɼ�', '3');
INSERT INTO `dictionary` VALUES ('42', 'empl_qualify', 'ִ���ʸ�', '', '', '0');
INSERT INTO `dictionary` VALUES ('43', 'empl_qualify', 'ִ���ʸ�', '1', '����', '1');
INSERT INTO `dictionary` VALUES ('44', 'empl_qualify', 'ִ���ʸ�', '0', '��', '0');
INSERT INTO `dictionary` VALUES ('45', 'empl_qualify', 'ִ���ʸ�', '2', '�м�', '2');
INSERT INTO `dictionary` VALUES ('46', 'empl_qualify', 'ִ���ʸ�', '3', '�߼�', '3');
INSERT INTO `dictionary` VALUES ('47', 'pe_status', 'ִ����״̬', '', '', '0');
INSERT INTO `dictionary` VALUES ('48', 'pe_status', 'ִ����״̬', '0', 'ͣ��', '2');
INSERT INTO `dictionary` VALUES ('49', 'pe_status', 'ִ����״̬', '1', 'ά��', '1');
INSERT INTO `dictionary` VALUES ('50', 'pe_status', 'ִ����״̬', '2', '����', '0');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `empid` int(11) NOT NULL AUTO_INCREMENT,
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '���Ŵ���',
  `name` varchar(32) NOT NULL DEFAULT '��' COMMENT '��Ա��',
  `code` varchar(32) NOT NULL DEFAULT '��' COMMENT '��½�˺�,һ���Ǿ�Ա���',
  `sex` char(4) DEFAULT '��',
  `phone` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `photo_path` varchar(128) DEFAULT NULL COMMENT '��Ա��Ƭ����λ��(URL)',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '��½����',
  `roleid` bigint(19) NOT NULL DEFAULT '1',
  `bindingip` int(11) NOT NULL DEFAULT '0' COMMENT '0:δ��,1:��',
  `clientip` varchar(16) DEFAULT NULL,
  `userarea` text COMMENT '����Ա�Ƿǿ�.�û���Ȩ�޵�����ID���ϣ����ŷָ�',
  `login` int(1) NOT NULL DEFAULT '1' COMMENT '1:��½;0:����',
  `online_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `dept_role_id` bigint(19) NOT NULL DEFAULT '0' COMMENT '���Ž�ɫID',
  `empl_qualify` int(1) NOT NULL DEFAULT '0' COMMENT 'ִ���ʸ�;0:��;1:������;2:�м�;3:�߼�;',
  `create_user` varchar(32) DEFAULT '' COMMENT '������',
  PRIMARY KEY (`empid`),
  UNIQUE KEY `idx_code` (`code`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3859 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('650', '4115', '��������Ա', 'admin', '��', null, null, '����', null, '123456', '1', '0', null, '4115', '1', '2017-09-07 15:17:30', '0', '0', '');
INSERT INTO `employee` VALUES ('665', '4115', '����', '086338', '��', '', null, '', null, '123456', '19', '0', null, '4115', '1', '2017-09-04 15:44:15', '0', '0', '');
INSERT INTO `employee` VALUES ('654', '4115', '������', '087793', '��', '', null, '', null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('655', '4115', '���پ�', '084837', '��', '', null, '', null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('656', '4115', '������', '186626', '��', '', null, '', null, '123456', '19', '0', null, '4115', '1', '2017-08-27 09:10:58', '0', '0', '');
INSERT INTO `employee` VALUES ('657', '4115', 'ף��', '186353', '��', '', null, '', null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('658', '4115', '����', '086713', '��', '', null, '', null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('659', '4115', '������', '086183', '��', '', null, '', null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('666', '4115', '���', '086363', '��', '', null, '', null, '123456', '19', '0', '', '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('667', '41151845', '�����', '189505', '��', null, null, null, null, '123456', '23', '0', null, '41151845', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('668', '411501', '��˼ʫ', '000000', '��', null, null, null, null, '123456', '22', '0', null, '411501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('669', '41150502', '����', '086278', '��', null, null, null, null, '123456', '23', '0', null, '41150502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('670', '41150311', '���', '084086', '��', null, null, null, null, '123456', '23', '0', null, '41150311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('671', '41150113', '����1', '084141', '��', null, null, null, null, '123456', '23', '0', null, '41150113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('672', '41150110', '����', '084210', '��', null, null, null, null, '123456', '23', '0', null, '41150110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('673', '41150104', '����', '084679', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('674', '41151205', '����', '084790', '��', null, null, null, null, '123456', '22', '0', null, '41151205', '1', '2017-09-05 11:03:07', '0', '0', '');
INSERT INTO `employee` VALUES ('675', '411504', '������', '084826', '��', null, null, null, null, '123456', '22', '0', null, '411504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('676', '41150305', 'ʯ��', '084955', '��', null, null, null, null, '123456', '23', '0', null, '41150305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('677', '41150309', 'Ԭ����', '084976', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('678', '41150601', '�ƾ���', '084977', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('679', '41150103', '�̻���', '084978', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('680', '41150402', '��˧', '084979', '��', null, null, null, null, '123456', '23', '0', null, '41150402', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('681', '41150309', '��ʿ��', '084980', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('682', '41150403', '�����', '084981', '��', null, null, null, null, '123456', '23', '0', null, '41150403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('683', '41150309', '��Ϊ��', '084982', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('684', '4115120308', '�����', '084984', '��', null, null, null, null, '123456', '23', '0', null, '4115120308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('685', '41150308', '��Ԫ��', '084985', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('686', '4115120502', '������', '084986', '��', null, null, null, null, '123456', '23', '0', null, '4115120502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('687', '41150304', '������', '084989', '��', null, null, null, null, '123456', '23', '0', null, '41150304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('688', '41150601', '������', '084990', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('689', '4115120504', '�α�', '084991', '��', null, null, null, null, '123456', '23', '0', null, '4115120504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('690', '41150302', '����', '084992', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('691', '41150204', '������', '084994', '��', null, null, null, null, '123456', '23', '0', null, '41150204', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('692', '41150309', '��Ρ', '084996', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('693', '4115120504', '³����', '084998', '��', null, null, null, null, '123456', '23', '0', null, '4115120504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('694', '41150302', '����Ⱥ', '084999', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('695', '41150805', '����', '085300', '��', null, null, null, null, '123456', '23', '0', null, '41150805', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('696', '4115120301', '��ΰ', '085423', '��', null, null, null, null, '123456', '23', '0', null, '4115120301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('697', '411502', '���߷�', '085510', '��', null, null, null, null, '123456', '22', '0', null, '411502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('698', '411501', '����', '085532', '��', null, null, null, null, '123456', '22', '0', null, '411501', '1', '2017-09-05 11:04:18', '0', '0', '');
INSERT INTO `employee` VALUES ('699', '41150111', '�ź�', '085580', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('700', '411502', '����', '085606', '��', null, null, null, null, '123456', '22', '0', null, '411502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('701', '41150802', '������', '085623', '��', null, null, null, null, '123456', '23', '0', null, '41150802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('702', '41150104', '����', '085635', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('703', '41150110', '������', '085687', '��', null, null, null, null, '123456', '23', '0', null, '41150110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('704', '41150301', '��Ƽ', '085703', '��', null, null, null, null, '123456', '23', '0', null, '41150301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('705', '4115120501', '����', '085715', '��', null, null, null, null, '123456', '23', '0', null, '4115120501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('706', '41150101', '������', '085798', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-09-05 16:41:26', '0', '0', '');
INSERT INTO `employee` VALUES ('707', '41150110', '����', '085898', '��', null, null, null, null, '123456', '23', '0', null, '41150110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('708', '41150314', '֣��', '085992', '��', null, null, null, null, '123456', '23', '0', null, '41150314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('709', '411501', '������', '086021', '��', null, null, null, null, '123456', '22', '0', null, '411501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('710', '411506', '��ϣ��', '086027', '��', null, null, null, null, '123456', '22', '0', null, '411506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('711', '411506', 'л�ǹ�', '086056', '��', null, null, null, null, '123456', '22', '0', null, '411506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('712', '411503', '�ܵ���', '086072', '��', null, null, null, null, '123456', '22', '0', null, '411503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('713', '411507', '����', '086109', '��', null, null, null, null, '123456', '22', '0', null, '411507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('714', '41150313', '�Ļݹ�', '086119', '��', null, null, null, null, '123456', '23', '0', null, '41150313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('715', '411508', '��־��', '086122', '��', null, null, null, null, '123456', '22', '0', null, '411508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('716', '4115120307', '����', '086196', '��', null, null, null, null, '123456', '23', '0', null, '4115120307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('717', '4115120503', '���', '086207', '��', null, null, null, null, '123456', '23', '0', null, '4115120503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('718', '4115120501', '�����', '086211', '��', null, null, null, null, '123456', '23', '0', null, '4115120501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('719', '41150203', '���', '086219', '��', null, null, null, null, '123456', '23', '0', null, '41150203', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('720', '41150301', 'ʷ����', '086221', '��', null, null, null, null, '123456', '23', '0', null, '41150301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('721', '41150604', 'Ҷ����', '086267', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('722', '41151001', '��ѧϰ', '086309', '��', null, null, null, null, '123456', '23', '0', null, '41151001', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('723', '41150706', '����', '086312', '��', null, null, null, null, '123456', '23', '0', null, '41150706', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('724', '411503', '����ǿ', '086350', '��', null, null, null, null, '123456', '22', '0', null, '411503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('725', '4115120501', '����', '086360', '��', null, null, null, null, '123456', '23', '0', null, '4115120501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('726', '41150905', '������', '086368', '��', null, null, null, null, '123456', '23', '0', null, '41150905', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('727', '41150304', '��ѧ��', '086375', '��', null, null, null, null, '123456', '23', '0', null, '41150304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('728', '4115120309', '�����', '086402', '��', null, null, null, null, '123456', '23', '0', null, '4115120309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('729', '41150610', '��ΰ��', '086404', '��', null, null, null, null, '123456', '23', '0', null, '41150610', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('730', '41151203', '������', '086405', '��', null, null, null, null, '123456', '22', '0', null, '41151203', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('731', '41150310', '������', '086406', '��', null, null, null, null, '123456', '23', '0', null, '41150310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('732', '4115120313', '��ѧ��', '086407', '��', null, null, null, null, '123456', '23', '0', null, '4115120313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('733', '41150610', '��ˮƽ', '086409', '��', null, null, null, null, '123456', '23', '0', null, '41150610', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('734', '4115120505', '�ż�ά', '086410', '��', null, null, null, null, '123456', '23', '0', null, '4115120505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('735', '4115120301', '���', '001-WJ', '��', null, null, null, null, '123456', '23', '0', null, '4115120301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('736', '4115120313', '����', '086413', '��', null, null, null, null, '123456', '23', '0', null, '4115120313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('737', '41150106', '��ҵ��', '086415', '��', null, null, null, null, '123456', '23', '0', null, '41150106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('738', '4115120501', '���¿�', '086418', '��', null, null, null, null, '123456', '23', '0', null, '4115120501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('739', '4115120308', '����', '086420', '��', null, null, null, null, '123456', '23', '0', null, '4115120308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('740', '41150101', '��ʥ��', '086422', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-09-05 16:25:28', '0', '0', '');
INSERT INTO `employee` VALUES ('741', '4115120306', '���', '086423', '��', null, null, null, null, '123456', '23', '0', null, '4115120306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('742', '4115120505', '����', '086425', '��', null, null, null, null, '123456', '23', '0', null, '4115120505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('743', '41151203', '����', '086426', '��', null, null, null, null, '123456', '22', '0', null, '41151203', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('744', '4115120309', '���ԣ�С��', '086428', '��', null, null, null, null, '123456', '23', '0', null, '4115120309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('745', '41150307', '������', '086441', '��', null, null, null, null, '123456', '23', '0', null, '41150307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('746', '4115120312', '������', '086446', '��', null, null, null, null, '123456', '23', '0', null, '4115120312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('747', '41151002', '�ƺ���', '086453', '��', null, null, null, null, '123456', '23', '0', null, '41151002', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('748', '4115120312', '��ѧ��', '086455', '��', null, null, null, null, '123456', '23', '0', null, '4115120312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('749', '4115120312', '������', '086465', '��', null, null, null, null, '123456', '23', '0', null, '4115120312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('750', '4115120505', '�볿', '086502', '��', null, null, null, null, '123456', '23', '0', null, '4115120505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('751', '4115120311', '����', '086513', '��', null, null, null, null, '123456', '23', '0', null, '4115120311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('752', '4115120505', '��ҵ��', '086525', '��', null, null, null, null, '123456', '23', '0', null, '4115120505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('753', '4115120301', '��һ��', '086531', '��', null, null, null, null, '123456', '23', '0', null, '4115120301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('754', '4115120304', '����', '086533', '��', null, null, null, null, '123456', '23', '0', null, '4115120304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('755', '41150313', '�Ա�', '086538', '��', null, null, null, null, '123456', '23', '0', null, '41150313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('756', '411503', '����', '086539', '��', null, null, null, null, '123456', '22', '0', null, '411503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('757', '4115120501', '����ɯ', '086612', '��', null, null, null, null, '123456', '23', '0', null, '4115120501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('758', '41151201', '�����', '086615', '��', null, null, null, null, '123456', '22', '0', null, '41151201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('759', '41150905', '������', '086645', '��', null, null, null, null, '123456', '23', '0', null, '41150905', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('760', '41150310', '����', '086646', '��', null, null, null, null, '123456', '23', '0', null, '41150310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('761', '41150309', '�ױ���', '086647', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('762', '4115120501', '����÷', '086648', '��', null, null, null, null, '123456', '23', '0', null, '4115120501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('763', '4115120501', '����', '086650', '��', null, null, null, null, '123456', '23', '0', null, '4115120501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('764', '41150704', '��ǿ', '086691', '��', null, null, null, null, '123456', '23', '0', null, '41150704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('765', '41150303', '���', '086773', '��', null, null, null, null, '123456', '23', '0', null, '41150303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('766', '411503', '����', '086719', '��', null, null, null, null, '123456', '22', '0', null, '411503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('767', '41150104', '�Ŵ���', '086800', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('768', '4115120310', '��־ǿ', '086853', '��', null, null, null, null, '123456', '23', '0', null, '4115120310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('769', '411506', '��ά��', '086866', '��', null, null, null, null, '123456', '22', '0', null, '411506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('770', '41150803', '������', '086971', '��', null, null, null, null, '123456', '23', '0', null, '41150803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('771', '41150301', '������', '086987', '��', null, null, null, null, '123456', '23', '0', null, '41150301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('772', '411501', '�˻���', '087013', '��', null, null, null, null, '123456', '22', '0', null, '411501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('773', '41150216', '���ս�', '087018', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('774', '41150211', '�̻���', '087023', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('775', '41150215', '������', '087024', '��', null, null, null, null, '123456', '23', '0', null, '41150215', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('776', '41150211', '����', '087025', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('777', '41150209', '��ȫ��', '087026', '��', null, null, null, null, '123456', '23', '0', null, '41150209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('778', '41150104', '����', '087027', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('779', '41150209', '�ܾ���', '087028', '��', null, null, null, null, '123456', '23', '0', null, '41150209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('780', '41150216', '����', '087029', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('781', '411506', '������', '087030', '��', null, null, null, null, '123456', '22', '0', null, '411506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('782', '41150211', '����', '087031', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('783', '41150114', '������', '087032', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('784', '41150104', '���Ƕ�', '087034', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('785', '41150211', '����', '087038', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('786', '41150102', '�żҹ�', '087045', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('787', '41150212', '������', '087046', '��', null, null, null, null, '123456', '23', '0', null, '41150212', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('788', '41150110', '��־��', '087048', '��', null, null, null, null, '123456', '23', '0', null, '41150110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('789', '41150111', '���', '087049', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('790', '41150212', '��Ϊ', '087051', '��', null, null, null, null, '123456', '23', '0', null, '41150212', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('791', '41150604', 'ţ����', '087059', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('792', '41150102', '������', '087061', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('793', '41150101', '������', '087062', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('794', '41150215', '����', '087064', '��', null, null, null, null, '123456', '23', '0', null, '41150215', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('795', '41150211', 'ʷ����', '087065', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('796', '41150214', '����', '087069', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('797', '41150101', '����', '087070', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('798', '41150111', '��ϼ', '087071', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('799', '41150115', '�ջ�', '087072', '��', null, null, null, null, '123456', '23', '0', null, '41150115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('800', '41150217', '����', '087076', '��', null, null, null, null, '123456', '23', '0', null, '41150217', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('801', '41150107', '�չ���', '087077', '��', null, null, null, null, '123456', '23', '0', null, '41150107', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('802', '41150112', 'Ҧ����', '087079', '��', null, null, null, null, '123456', '23', '0', null, '41150112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('803', '41150111', '������', '087080', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('804', '41150105', '�̺���', '087081', '��', null, null, null, null, '123456', '23', '0', null, '41150105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('805', '41150103', '̷����', '087082', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('806', '41150214', '������', '087083', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('807', '411501', '������', '087084', '��', null, null, null, null, '123456', '22', '0', null, '411501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('808', '41150202', '����', '087085', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('809', '41150112', '�Ⲩ', '087088', '��', null, null, null, null, '123456', '23', '0', null, '41150112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('810', '41150213', '�⻪��', '087097', '��', null, null, null, null, '123456', '23', '0', null, '41150213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('811', '41150114', '����', '087099', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('812', '41150214', '��Ө', '087100', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('813', '41150201', '��δ��', '087101', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('814', '41150113', '���', '087102', '��', null, null, null, null, '123456', '23', '0', null, '41150113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('815', '411501', 'Ǯ�˻�', '087103', '��', null, null, null, null, '123456', '22', '0', null, '411501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('816', '4115120501', '������', '087107', '��', null, null, null, null, '123456', '23', '0', null, '4115120501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('817', '41150114', '֣����', '087110', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('818', '41150202', '����', '087111', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('819', '41150104', '������', '087114', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('820', '41150211', '������', '087115', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('821', '41150107', '����', '087117', '��', null, null, null, null, '123456', '23', '0', null, '41150107', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('822', '411508', '������', '087119', '��', null, null, null, null, '123456', '22', '0', null, '411508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('823', '41150214', '������', '087120', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('824', '41150214', '����', '087121', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('825', '41150113', '�Ʋ���', '087122', '��', null, null, null, null, '123456', '23', '0', null, '41150113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('826', '41150106', '���Ӫ', '087128', '��', null, null, null, null, '123456', '23', '0', null, '41150106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('827', '41150114', '����', '087129', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('828', '41150114', '����', '087133', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('829', '41150208', '���', '087134', '��', null, null, null, null, '123456', '23', '0', null, '41150208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('830', '41150104', '���', '087136', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('831', '41150217', '����ΰ', '087137', '��', null, null, null, null, '123456', '23', '0', null, '41150217', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('832', '41150113', '����', '087139', '��', null, null, null, null, '123456', '23', '0', null, '41150113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('833', '41150103', '���ҿ�', '087141', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('834', '41150202', '����', '087143', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('835', '41150107', 'Ҷ����', '087144', '��', null, null, null, null, '123456', '23', '0', null, '41150107', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('836', '41150215', '����', '087145', '��', null, null, null, null, '123456', '23', '0', null, '41150215', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('837', '41150214', '³��', '087146', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('838', '41150113', '�׻���', '087147', '��', null, null, null, null, '123456', '23', '0', null, '41150113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('839', '41150216', '��־', '087148', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('840', '41150214', '������', '087149', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('841', '41150217', '�½�', '087151', '��', null, null, null, null, '123456', '23', '0', null, '41150217', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('842', '41150217', '������', '087152', '��', null, null, null, null, '123456', '23', '0', null, '41150217', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('843', '4115121304', '����־', '087153', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('844', '41150110', '������', '087155', '��', null, null, null, null, '123456', '23', '0', null, '41150110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('845', '41150115', 'Ҷǿ', '087156', '��', null, null, null, null, '123456', '23', '0', null, '41150115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('846', '41150102', '������', '087158', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('847', '41150114', '�žó�', '087159', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('848', '41150111', '����', '087160', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('849', '41150114', '������', '087162', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('850', '41150101', '�Ž���', '087163', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('851', '41150202', '������', '087165', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('852', '41150214', '¬����', '087166', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('853', '41150214', '�Ժ�ΰ', '087169', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('854', '41150114', '���ܴ�', '087170', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('855', '41150201', '����', '087171', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('856', '41150214', '������', '087172', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('857', '41150102', '������', '087174', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('858', '41150214', '�󿡽�', '087176', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('859', '41150214', '������', '087177', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('860', '41150114', '�ƿ�', '087180', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('861', '41150105', '��Ӿ', '087181', '��', null, null, null, null, '123456', '23', '0', null, '41150105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('862', '41150211', '����', '087185', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('863', '41150214', '�γ���', '087187', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('864', '41150103', 'Ф����', '087189', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('865', '41150214', '�佨��', '087192', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('866', '41150213', 'ʯ��', '087196', '��', null, null, null, null, '123456', '23', '0', null, '41150213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('867', '41150112', '�Թ���', '087198', '��', null, null, null, null, '123456', '23', '0', null, '41150112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('868', '41150211', '������', '087200', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('869', '41150101', '�ƶ���', '087203', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('870', '411502', '����', '087206', '��', null, null, null, null, '123456', '22', '0', null, '411502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('871', '41150212', '������', '087208', '��', null, null, null, null, '123456', '23', '0', null, '41150212', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('872', '41150102', 'κ����', '087209', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('873', '41150104', '���', '087210', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('874', '41150113', '�޷���', '087217', '��', null, null, null, null, '123456', '23', '0', null, '41150113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('875', '41150216', '���½�', '087218', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('876', '41150217', '����', '087219', '��', null, null, null, null, '123456', '23', '0', null, '41150217', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('877', '41150113', '���½�', '087220', '��', null, null, null, null, '123456', '23', '0', null, '41150113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('878', '41150105', '����', '087222', '��', null, null, null, null, '123456', '23', '0', null, '41150105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('879', '41150216', '����', '087227', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('880', '41150111', '���˳�', '087230', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('881', '41150101', '����ǿ', '087231', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('882', '41150102', '������', '087234', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('883', '41150201', '���ɰ�', '087235', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('884', '41150113', '����', '087236', '��', null, null, null, null, '123456', '23', '0', null, '41150113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('885', '41150201', '������', '087237', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('886', '41150102', '��ɽ��', '087238', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('887', '411501', '������', '087239', '��', null, null, null, null, '123456', '22', '0', null, '411501', '1', '2017-09-05 16:31:54', '0', '0', '');
INSERT INTO `employee` VALUES ('888', '41150102', '����', '087242', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('889', '41150102', '����', '087243', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('890', '41150106', '���ǿ', '087244', '��', null, null, null, null, '123456', '23', '0', null, '41150106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('891', '411502', '����', '087248', '��', null, null, null, null, '123456', '22', '0', null, '411502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('892', '41150214', '�ܺ���', '087250', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('893', '41150213', '���Բ�', '087251', '��', null, null, null, null, '123456', '23', '0', null, '41150213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('894', '41150201', '�۶���', '087254', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('895', '41150216', '¬��ΰ', '087256', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('896', '41150214', '����', '087262', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('897', '41150105', '����', '087263', '��', null, null, null, null, '123456', '23', '0', null, '41150105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('898', '41150216', '������', '087265', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('899', '41150103', '���¸�', '087271', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('900', '41150201', '�ܳ���', '087273', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('901', '41150101', '������', '087274', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('902', '41150216', '�Ž���', '087275', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('903', '41150106', '�½�', '087283', '��', null, null, null, null, '123456', '23', '0', null, '41150106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('904', '41150111', '¬��Ԫ', '087284', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('905', '41150111', '����', '087291', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('906', '41150107', '�Ź⺣', '087293', '��', null, null, null, null, '123456', '23', '0', null, '41150107', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('907', '41150216', '����', '087294', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('908', '41150203', 'Ԭΰ��', '087297', '��', null, null, null, null, '123456', '23', '0', null, '41150203', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('909', '41151004', '������', '087299', '��', null, null, null, null, '123456', '23', '0', null, '41151004', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('910', '41150202', '���ˮ', '087301', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('911', '41150202', '������', '087307', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('912', '41150206', '�����', '087310', '��', null, null, null, null, '123456', '23', '0', null, '41150206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('913', '41150202', '������', '087313', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('914', '41150101', '���', '087314', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('915', '41150103', '���ٺ�', '087316', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('916', '41150202', '������', '087317', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('917', '41150112', '���֥', '087324', '��', null, null, null, null, '123456', '23', '0', null, '41150112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('918', '41150114', 'Ԭ����', '087325', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('919', '41150205', '������', '087327', '��', null, null, null, null, '123456', '23', '0', null, '41150205', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('920', '41150201', '����', '087328', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('921', '41150101', '������', '087329', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('922', '411502', '������', '087330', '��', null, null, null, null, '123456', '22', '0', null, '411502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('923', '41150111', '������', '087338', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('924', '41150201', '����', '087340', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('925', '41150217', '����', '087342', '��', null, null, null, null, '123456', '23', '0', null, '41150217', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('926', '41150204', '����', '087345', '��', null, null, null, null, '123456', '23', '0', null, '41150204', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('927', '41150902', '�λ���', '087349', '��', null, null, null, null, '123456', '23', '0', null, '41150902', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('928', '41150902', '����', '087353', '��', null, null, null, null, '123456', '23', '0', null, '41150902', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('929', '41150102', '�ֻ�', '087355', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('930', '41150114', '����', '087356', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('931', '41150112', '�����', '087360', '��', null, null, null, null, '123456', '23', '0', null, '41150112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('932', '41150216', '������', '087363', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('933', '41150411', '�Ź���', '087368', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('934', '4115120305', '���', '087371', '��', null, null, null, null, '123456', '23', '0', null, '4115120305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('935', '41150102', '���', '087374', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('936', '41150103', '����Ԩ', '087381', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('937', '41150202', '������', '087383', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('938', '41150211', '������', '087384', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('939', '41150201', '�����', '087386', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('940', '41150210', '����', '087387', '��', null, null, null, null, '123456', '23', '0', null, '41150210', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('941', '41150208', '���˽�', '087388', '��', null, null, null, null, '123456', '23', '0', null, '41150208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('942', '41150106', '���̶�', '087391', '��', null, null, null, null, '123456', '23', '0', null, '41150106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('943', '4115120501', '������', '087395', '��', null, null, null, null, '123456', '23', '0', null, '4115120501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('944', '41150313', '�ǿ', '087400', '��', null, null, null, null, '123456', '23', '0', null, '41150313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('945', '4115120505', '�佨��', '087401', '��', null, null, null, null, '123456', '23', '0', null, '4115120505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('946', '41150308', '���ں�', '087402', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('947', '41150114', '���ܾ�', '087403', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('948', '4115120502', '����Ⱥ', '087405', '��', null, null, null, null, '123456', '23', '0', null, '4115120502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('949', '41150104', '���', '087410', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('950', '41150106', '�º�', '087415', '��', null, null, null, null, '123456', '23', '0', null, '41150106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('951', '41150107', '���', '087416', '��', null, null, null, null, '123456', '23', '0', null, '41150107', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('952', '41150115', '�ܰ���', '087417', '��', null, null, null, null, '123456', '23', '0', null, '41150115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('953', '41150307', '�����', '087420', '��', null, null, null, null, '123456', '23', '0', null, '41150307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('954', '41150110', '��ܰ��', '087421', '��', null, null, null, null, '123456', '23', '0', null, '41150110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('955', '41150112', '��ҵ��', '087430', '��', null, null, null, null, '123456', '23', '0', null, '41150112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('956', '41150201', '������', '087432', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('957', '41150217', '��˳', '087434', '��', null, null, null, null, '123456', '23', '0', null, '41150217', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('958', '41150217', 'ʢ��Ԫ', '087435', '��', null, null, null, null, '123456', '23', '0', null, '41150217', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('959', '41150201', '��ѧ��', '087438', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('960', '41150103', 'ʯ����', '087444', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('961', '41150114', '������', '087445', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('962', '41150216', '����', '087446', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('963', '41150104', '������', '087451', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('964', '41150111', '����Ⱥ', '087452', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('965', '41150110', '������', '087453', '��', null, null, null, null, '123456', '23', '0', null, '41150110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('966', '41150102', '����', '087454', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('967', '41150104', '��ѧֲ', '087455', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('968', '41150111', 'л����', '087456', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('969', '41150103', '������', '087458', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('970', '41150114', '���', '087459', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('971', '41150106', '֣����', '087460', '��', null, null, null, null, '123456', '23', '0', null, '41150106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('972', '41150206', '��', '087461', '��', null, null, null, null, '123456', '23', '0', null, '41150206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('973', '41150104', '��ұ', '087462', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('974', '41150212', 'Ԭ����', '087463', '��', null, null, null, null, '123456', '23', '0', null, '41150212', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('975', '41150211', '�߷���', '087464', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('976', '41150102', '��ΰ', '087465', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('977', '41150114', '����', '087466', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('978', '41150113', '��ǰ��', '087467', '��', null, null, null, null, '123456', '23', '0', null, '41150113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('979', '41150201', 'ʩ��ɽ', '087468', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('980', '41151001', '�ʵ���', '087470', '��', null, null, null, null, '123456', '23', '0', null, '41151001', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('981', '4115121304', '�ż�ΰ', '087471', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('982', '41150111', 'ɣ����', '087472', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('983', '41151002', '�³ɲ�', '087473', '��', null, null, null, null, '123456', '23', '0', null, '41151002', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('984', '4115120307', '����', '087477', '��', null, null, null, null, '123456', '23', '0', null, '4115120307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('985', '41150202', '����', '087480', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('986', '41150111', '����Ө', '087481', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('987', '41150211', '������', '087482', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('988', '41150216', '��Ӧ��', '087483', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('989', '41150111', '����', '087485', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('990', '41150216', '����ɭ', '087486', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('991', '41150111', '���к�', '087487', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('992', '41150214', 'ʷ����', '087488', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('993', '41150106', '����', '087496', '��', null, null, null, null, '123456', '23', '0', null, '41150106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('994', '411502', '�쵤', '087497', '��', null, null, null, null, '123456', '22', '0', null, '411502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('995', '41150211', '����Ƽ', '087498', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('996', '411502', '�ܲ���', '087500', '��', null, null, null, null, '123456', '22', '0', null, '411502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('997', '4115120301', '������', '087502', '��', null, null, null, null, '123456', '23', '0', null, '4115120301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('998', '41151001', '÷ӭ��', '087503', '��', null, null, null, null, '123456', '23', '0', null, '41151001', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('999', '41150205', '����', '087505', '��', null, null, null, null, '123456', '23', '0', null, '41150205', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1000', '41150212', '������', '087506', '��', null, null, null, null, '123456', '23', '0', null, '41150212', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1001', '41150101', '�޾�', '087507', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1002', '41150217', '����', '087509', '��', null, null, null, null, '123456', '23', '0', null, '41150217', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1003', '41150508', '���ǻ�', '087511', '��', null, null, null, null, '123456', '23', '0', null, '41150508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1004', '41150604', '֣���', '087513', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1005', '411505', '��ǿ��', '087516', '��', null, null, null, null, '123456', '22', '0', null, '411505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1006', '41150505', '����', '087517', '��', null, null, null, null, '123456', '23', '0', null, '41150505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1007', '411506', '���÷', '087518', '��', null, null, null, null, '123456', '22', '0', null, '411506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1008', '41150601', '������', '087525', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1009', '41150601', '����ΰ', '087526', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1010', '41150606', '���ľ�', '087527', '��', null, null, null, null, '123456', '23', '0', null, '41150606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1011', '41150607', '�����', '087528', '��', null, null, null, null, '123456', '23', '0', null, '41150607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1012', '41150503', '������', '087535', '��', null, null, null, null, '123456', '23', '0', null, '41150503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1013', '41150606', '���ƻ�', '087536', '��', null, null, null, null, '123456', '23', '0', null, '41150606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1014', '41150801', '��ΰ', '087544', '��', null, null, null, null, '123456', '23', '0', null, '41150801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1015', '41150602', '�±�', '087545', '��', null, null, null, null, '123456', '23', '0', null, '41150602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1016', '41150301', '���Ȼ�', '087550', '��', null, null, null, null, '123456', '23', '0', null, '41150301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1017', '41150408', '�Գ���', '087551', '��', null, null, null, null, '123456', '23', '0', null, '41150408', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1018', '4115120313', '�����', '087553', '��', null, null, null, null, '123456', '23', '0', null, '4115120313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1019', '41150610', '��־��', '087555', '��', null, null, null, null, '123456', '23', '0', null, '41150610', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1020', '41150114', '����', '087557', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1021', '41150512', '֣��ȫ', '087561', '��', null, null, null, null, '123456', '23', '0', null, '41150512', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1022', '41150803', '����', '087563', '��', null, null, null, null, '123456', '23', '0', null, '41150803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1023', '41150110', '����', '087564', '��', null, null, null, null, '123456', '23', '0', null, '41150110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1024', '41150609', '������', '087565', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1025', '41150802', 'ռ����', '087567', '��', null, null, null, null, '123456', '23', '0', null, '41150802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1026', '41150606', '����', '087568', '��', null, null, null, null, '123456', '23', '0', null, '41150606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1027', '41150611', 'Ҷ����', '087573', '��', null, null, null, null, '123456', '23', '0', null, '41150611', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1028', '41150506', '�˷�', '087575', '��', null, null, null, null, '123456', '23', '0', null, '41150506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1029', '41150510', '������', '087578', '��', null, null, null, null, '123456', '23', '0', null, '41150510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1030', '41150508', '��ΰ', '087581', '��', null, null, null, null, '123456', '23', '0', null, '41150508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1031', '41150510', '�޺��', '087585', '��', null, null, null, null, '123456', '23', '0', null, '41150510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1032', '41150506', '���', '087586', '��', null, null, null, null, '123456', '23', '0', null, '41150506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1033', '41150606', '���', '087588', '��', null, null, null, null, '123456', '23', '0', null, '41150606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1034', '41150607', '������', '087592', '��', null, null, null, null, '123456', '23', '0', null, '41150607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1035', '41150609', '�κ�', '087594', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1036', '41150601', '�Ż�ϲ', '087597', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1037', '41150510', '������', '087599', '��', null, null, null, null, '123456', '23', '0', null, '41150510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1038', '41150802', '������', '087602', '��', null, null, null, null, '123456', '23', '0', null, '41150802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1039', '41150611', '������', '087603', '��', null, null, null, null, '123456', '23', '0', null, '41150611', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1040', '41150601', '�̾�', '087604', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1041', '41150609', '��Ӣ', '087607', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1042', '411504', '����', '087608', '��', null, null, null, null, '123456', '22', '0', null, '411504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1043', '41150611', '������', '087616', '��', null, null, null, null, '123456', '23', '0', null, '41150611', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1044', '41150609', '�쳯��', '087618', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1045', '41150509', '��Ρ', '087619', '��', null, null, null, null, '123456', '23', '0', null, '41150509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1046', '41150601', '�Ź���', '087620', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1047', '41150611', '̷����', '087621', '��', null, null, null, null, '123456', '23', '0', null, '41150611', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1048', '41150414', '�Ż�', '087622', '��', null, null, null, null, '123456', '23', '0', null, '41150414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1049', '41150604', '����', '087624', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1050', '41150510', '������', '087625', '��', null, null, null, null, '123456', '23', '0', null, '41150510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1051', '41150512', '�����', '087626', '��', null, null, null, null, '123456', '23', '0', null, '41150512', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1052', '41150609', 'ʢ����', '087627', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1053', '41150603', '����', '087628', '��', null, null, null, null, '123456', '23', '0', null, '41150603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1054', '41150508', '��ʥ��', '087629', '��', null, null, null, null, '123456', '23', '0', null, '41150508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1055', '411506', '������', '087630', '��', null, null, null, null, '123456', '22', '0', null, '411506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1056', '411508', '����', '087631', '��', null, null, null, null, '123456', '22', '0', null, '411508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1057', '41150508', '֣��Ⱥ', '087633', '��', null, null, null, null, '123456', '23', '0', null, '41150508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1058', '41150611', '����', '087636', '��', null, null, null, null, '123456', '23', '0', null, '41150611', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1059', '41150602', '������', '087639', '��', null, null, null, null, '123456', '23', '0', null, '41150602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1060', '41150604', '��Ⱥ', '087640', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1061', '41150412', '������', '087641', '��', null, null, null, null, '123456', '23', '0', null, '41150412', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1062', '41150601', '������', '087642', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1063', '41150610', '������', '087646', '��', null, null, null, null, '123456', '23', '0', null, '41150610', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1064', '41150603', '����', '087647', '��', null, null, null, null, '123456', '23', '0', null, '41150603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1065', '4115120313', '���', '087648', '��', null, null, null, null, '123456', '23', '0', null, '4115120313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1066', '41150505', '�����', '087650', '��', null, null, null, null, '123456', '23', '0', null, '41150505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1067', '41150610', '�Ŵ�', '087651', '��', null, null, null, null, '123456', '23', '0', null, '41150610', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1068', '41150606', '��ΰ', '087652', '��', null, null, null, null, '123456', '23', '0', null, '41150606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1069', '41150416', '������', '087653', '��', null, null, null, null, '123456', '23', '0', null, '41150416', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1070', '41150408', '�µ���', '087655', '��', null, null, null, null, '123456', '23', '0', null, '41150408', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1071', '4115120313', '��ΰ', '087656', '��', null, null, null, null, '123456', '23', '0', null, '4115120313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1072', '41150801', '������', '087657', '��', null, null, null, null, '123456', '23', '0', null, '41150801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1073', '41150507', '���', '087659', '��', null, null, null, null, '123456', '23', '0', null, '41150507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1074', '41150311', '���໪', '087660', '��', null, null, null, null, '123456', '23', '0', null, '41150311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1075', '41150601', '����', '087663', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1076', '41150607', '����', '087664', '��', null, null, null, null, '123456', '23', '0', null, '41150607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1077', '41150601', '��ǰ˳', '087665', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1078', '41150604', '�฻��', '087667', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1079', '411508', '��ȫ��', '087669', '��', null, null, null, null, '123456', '22', '0', null, '411508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1080', '41150511', '������', '087671', '��', null, null, null, null, '123456', '23', '0', null, '41150511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1081', '41150606', '��ΰ', '087672', '��', null, null, null, null, '123456', '23', '0', null, '41150606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1082', '41150501', '������', '087673', '��', null, null, null, null, '123456', '23', '0', null, '41150501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1083', '41150802', '���ٸ�', '087675', '��', null, null, null, null, '123456', '23', '0', null, '41150802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1084', '41150607', '�����', '087676', '��', null, null, null, null, '123456', '23', '0', null, '41150607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1085', '41150611', '�ŷ��', '087677', '��', null, null, null, null, '123456', '23', '0', null, '41150611', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1086', '41150601', '������', '087678', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1087', '41150601', '����', '087679', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1088', '41150510', '������', '087681', '��', null, null, null, null, '123456', '23', '0', null, '41150510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1089', '41150601', '������', '087682', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1090', '41150314', '������', '087684', '��', null, null, null, null, '123456', '23', '0', null, '41150314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1091', '41150304', '����', '087687', '��', null, null, null, null, '123456', '23', '0', null, '41150304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1092', '411506', '����', '087689', '��', null, null, null, null, '123456', '22', '0', null, '411506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1093', '41150303', 'Ф־��', '087691', '��', null, null, null, null, '123456', '23', '0', null, '41150303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1094', '41150304', '�Ը���', '087692', '��', null, null, null, null, '123456', '23', '0', null, '41150304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1095', '41150304', '��³ԥ', '087693', '��', null, null, null, null, '123456', '23', '0', null, '41150304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1096', '41150107', '�ܹ㶫', '087694', '��', null, null, null, null, '123456', '23', '0', null, '41150107', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1097', '41150304', '����', '087695', '��', null, null, null, null, '123456', '23', '0', null, '41150304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1098', '41150307', '������', '087696', '��', null, null, null, null, '123456', '23', '0', null, '41150307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1099', '41150302', '���޺�', '087697', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1100', '41150304', '���Ʒ�', '087700', '��', null, null, null, null, '123456', '23', '0', null, '41150304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1101', '41150508', '�����', '087701', '��', null, null, null, null, '123456', '23', '0', null, '41150508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1102', '41150303', '������', '087702', '��', null, null, null, null, '123456', '23', '0', null, '41150303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1103', '41150804', '����', '087705', '��', null, null, null, null, '123456', '23', '0', null, '41150804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1104', '41150312', '»����', '087706', '��', null, null, null, null, '123456', '23', '0', null, '41150312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1105', '41150610', '������', '087707', '��', null, null, null, null, '123456', '23', '0', null, '41150610', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1106', '41150301', '���ҹ�', '087709', '��', null, null, null, null, '123456', '23', '0', null, '41150301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1107', '41150604', '��˫ΰ', '087710', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1108', '41150314', '���', '087711', '��', null, null, null, null, '123456', '23', '0', null, '41150314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1109', '41150511', '������', '087713', '��', null, null, null, null, '123456', '23', '0', null, '41150511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1110', '41150302', '����', '087716', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1111', '41150803', '������', '087720', '��', null, null, null, null, '123456', '23', '0', null, '41150803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1112', '41150302', '����', '087721', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1113', '41150413', '������', '087723', '��', null, null, null, null, '123456', '23', '0', null, '41150413', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1114', '41150310', '������', '087725', '��', null, null, null, null, '123456', '23', '0', null, '41150310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1115', '41150303', '�⽨ѫ', '087726', '��', null, null, null, null, '123456', '23', '0', null, '41150303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1116', '41150304', '���', '087727', '��', null, null, null, null, '123456', '23', '0', null, '41150304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1117', '41150604', '����', '087728', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1118', '41150511', '������', '087729', '��', null, null, null, null, '123456', '23', '0', null, '41150511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1119', '41150601', '����', '087730', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1120', '41150508', '������', '087731', '��', null, null, null, null, '123456', '23', '0', null, '41150508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1121', '41150608', '�����', '087732', '��', null, null, null, null, '123456', '23', '0', null, '41150608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1122', '41150115', 'л��ʤ', '087733', '��', null, null, null, null, '123456', '23', '0', null, '41150115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1123', '41150503', '�ܹ���', '087734', '��', null, null, null, null, '123456', '23', '0', null, '41150503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1124', '41150502', '֣����', '087735', '��', null, null, null, null, '123456', '23', '0', null, '41150502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1125', '41150611', '���ܻ�', '087736', '��', null, null, null, null, '123456', '23', '0', null, '41150611', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1126', '41150606', '�ܴ���', '087737', '��', null, null, null, null, '123456', '23', '0', null, '41150606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1127', '41150610', '������', '087738', '��', null, null, null, null, '123456', '23', '0', null, '41150610', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1128', '41150601', '����', '087740', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1129', '41150605', '��־ǿ', '087741', '��', null, null, null, null, '123456', '23', '0', null, '41150605', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1130', '4115120503', '������', '087742', '��', null, null, null, null, '123456', '23', '0', null, '4115120503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1131', '41150606', '�ƻ�', '087743', '��', null, null, null, null, '123456', '23', '0', null, '41150606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1132', '41150609', '�׽�ϲ', '087745', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1133', '41150601', '����', '087747', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1134', '41150313', '�»�', '087749', '��', null, null, null, null, '123456', '23', '0', null, '41150313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1135', '41150405', '�ϼ���', '087753', '��', null, null, null, null, '123456', '23', '0', null, '41150405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1136', '41150510', '����', '087755', '��', null, null, null, null, '123456', '23', '0', null, '41150510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1137', '41150301', '������', '087756', '��', null, null, null, null, '123456', '23', '0', null, '41150301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1138', '41150509', '�ƽ���', '087759', '��', null, null, null, null, '123456', '23', '0', null, '41150509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1139', '41150512', '����', '087761', '��', null, null, null, null, '123456', '23', '0', null, '41150512', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1140', '41150511', '�����', '087762', '��', null, null, null, null, '123456', '23', '0', null, '41150511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1141', '41150604', '��ѧ��', '087763', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1142', '4115120303', '����ʤ', '087764', '��', null, null, null, null, '123456', '23', '0', null, '4115120303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1143', '41150609', '�ư���', '087765', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1144', '41150610', '��־', '087770', '��', null, null, null, null, '123456', '23', '0', null, '41150610', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1145', '41150609', '����', '087771', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1146', '41150502', '������', '087773', '��', null, null, null, null, '123456', '23', '0', null, '41150502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1147', '41150608', '����', '087774', '��', null, null, null, null, '123456', '23', '0', null, '41150608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1148', '41150601', '����ͥ', '087775', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1149', '41150411', '����', '087776', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1150', '41150411', '�̺�', '087777', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1151', '41150301', '̷����', '087778', '��', null, null, null, null, '123456', '23', '0', null, '41150301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1152', '41150509', '������', '087780', '��', null, null, null, null, '123456', '23', '0', null, '41150509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1153', '41150611', '�Ϲ���', '087783', '��', null, null, null, null, '123456', '23', '0', null, '41150611', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1154', '41150414', '֣��', '087785', '��', null, null, null, null, '123456', '23', '0', null, '41150414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1155', '41150306', '���ͳ�', '087786', '��', null, null, null, null, '123456', '23', '0', null, '41150306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1156', '411504', '����', '087787', '��', null, null, null, null, '123456', '22', '0', null, '411504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1157', '41150309', '��ȫ��', '087788', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1158', '41150416', '����ѫ', '087789', '��', null, null, null, null, '123456', '23', '0', null, '41150416', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1159', '41150102', '����', '087792', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1160', '411503', '����', '087794', '��', null, null, null, null, '123456', '22', '0', null, '411503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1161', '41150407', '������', '087795', '��', null, null, null, null, '123456', '23', '0', null, '41150407', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1162', '41150611', '�����', '087798', '��', null, null, null, null, '123456', '23', '0', null, '41150611', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1163', '41150604', '��Ծ��', '087799', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1164', '41150307', '������', '087801', '��', null, null, null, null, '123456', '23', '0', null, '41150307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1165', '41150413', '������', '087803', '��', null, null, null, null, '123456', '23', '0', null, '41150413', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1166', '41150309', '���', '087804', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1167', '41150608', '��ΰ', '087805', '��', null, null, null, null, '123456', '23', '0', null, '41150608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1168', '41150604', '����Ⱥ', '087806', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1169', '41150510', '��ƽ��', '087807', '��', null, null, null, null, '123456', '23', '0', null, '41150510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1170', '41150501', '��Ρ', '087808', '��', null, null, null, null, '123456', '23', '0', null, '41150501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1171', '41150509', '������', '087813', '��', null, null, null, null, '123456', '23', '0', null, '41150509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1172', '41150904', '����Ⱥ', '087818', '��', null, null, null, null, '123456', '23', '0', null, '41150904', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1173', '41150308', '������', '087820', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1174', '411506', '����', '087821', '��', null, null, null, null, '123456', '22', '0', null, '411506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1175', '41150606', '����', '087824', '��', null, null, null, null, '123456', '23', '0', null, '41150606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1176', '41150311', '���', '087828', '��', null, null, null, null, '123456', '23', '0', null, '41150311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1177', '41150308', 'л����', '087832', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1178', '41150608', '�', '087833', '��', null, null, null, null, '123456', '23', '0', null, '41150608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1179', '411506', '�Դ�ΰ', '087834', '��', null, null, null, null, '123456', '22', '0', null, '411506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1180', '41150604', '���ر�', '087835', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1181', '41150606', '������', '087837', '��', null, null, null, null, '123456', '23', '0', null, '41150606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1182', '41150409', '����', '087838', '��', null, null, null, null, '123456', '23', '0', null, '41150409', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1183', '41150603', 'ӹ�', '087839', '��', null, null, null, null, '123456', '23', '0', null, '41150603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1184', '41150602', 'κ��Ȩ', '087840', '��', null, null, null, null, '123456', '23', '0', null, '41150602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1185', '41150202', '¬ӱ', '087844', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1186', '41150304', '��ʢ��', '087846', '��', null, null, null, null, '123456', '23', '0', null, '41150304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1187', '41150605', '������', '087851', '��', null, null, null, null, '123456', '23', '0', null, '41150605', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1188', '41150604', '���', '087852', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1189', '41150607', '�ܾ�', '087853', '��', null, null, null, null, '123456', '23', '0', null, '41150607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1190', '41150409', '������', '087855', '��', null, null, null, null, '123456', '23', '0', null, '41150409', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1191', '41150606', '���', '087856', '��', null, null, null, null, '123456', '23', '0', null, '41150606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1192', '41150407', '����', '087857', '��', null, null, null, null, '123456', '23', '0', null, '41150407', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1193', '41150606', '���', '087858', '��', null, null, null, null, '123456', '23', '0', null, '41150606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1194', '41150403', '�����', '087864', '��', null, null, null, null, '123456', '23', '0', null, '41150403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1195', '41150406', '��־��', '087867', '��', null, null, null, null, '123456', '23', '0', null, '41150406', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1196', '41150105', '��־��', '087870', '��', null, null, null, null, '123456', '23', '0', null, '41150105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1197', '41150415', '����', '087871', '��', null, null, null, null, '123456', '23', '0', null, '41150415', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1198', '411504', '��Ӣ��', '087875', '��', null, null, null, null, '123456', '22', '0', null, '411504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1199', '41150410', '�﷨��', '087879', '��', null, null, null, null, '123456', '23', '0', null, '41150410', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1200', '411504', '��С��', '087880', '��', null, null, null, null, '123456', '22', '0', null, '411504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1201', '41150504', '�޴���', '087881', '��', null, null, null, null, '123456', '23', '0', null, '41150504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1202', '41150410', '���Ǳ�', '087882', '��', null, null, null, null, '123456', '23', '0', null, '41150410', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1203', '41150418', '����ʤ', '087885', '��', null, null, null, null, '123456', '23', '0', null, '41150418', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1204', '41150411', '������', '087886', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1205', '41150609', '�Ŵ�Ӧ', '087888', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1206', '41150413', '����', '087889', '��', null, null, null, null, '123456', '23', '0', null, '41150413', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1207', '41150401', '������', '087890', '��', null, null, null, null, '123456', '23', '0', null, '41150401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1208', '41150403', '�׺��', '087891', '��', null, null, null, null, '123456', '23', '0', null, '41150403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1209', '41150502', '����', '087894', '��', null, null, null, null, '123456', '23', '0', null, '41150502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1210', '41150407', '�����', '087897', '��', null, null, null, null, '123456', '23', '0', null, '41150407', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1211', '41150402', '�', '087898', '��', null, null, null, null, '123456', '23', '0', null, '41150402', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1212', '41150404', '�ನ', '087899', '��', null, null, null, null, '123456', '23', '0', null, '41150404', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1213', '41150602', '����', '087900', '��', null, null, null, null, '123456', '23', '0', null, '41150602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1214', '41150412', '�ų��', '087903', '��', null, null, null, null, '123456', '23', '0', null, '41150412', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1215', '41150401', '������', '087906', '��', null, null, null, null, '123456', '23', '0', null, '41150401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1216', '41150407', '����', '087912', '��', null, null, null, null, '123456', '23', '0', null, '41150407', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1217', '41150202', '֣˫��', '087913', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1218', '41150401', '������', '087917', '��', null, null, null, null, '123456', '23', '0', null, '41150401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1219', '41150202', '����', '087920', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1220', '41151002', '����', '087921', '��', null, null, null, null, '123456', '23', '0', null, '41151002', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1221', '41150413', '��Ϧ��', '087922', '��', null, null, null, null, '123456', '23', '0', null, '41150413', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1222', '41150415', '����', '087925', '��', null, null, null, null, '123456', '23', '0', null, '41150415', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1223', '411504', '������', '087931', '��', null, null, null, null, '123456', '22', '0', null, '411504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1224', '41150111', '���˱�', '087933', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1225', '411504', '���', '087934', '��', null, null, null, null, '123456', '22', '0', null, '411504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1226', '41150414', '������', '087935', '��', null, null, null, null, '123456', '23', '0', null, '41150414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1227', '41151003', 'ʷ��', '087936', '��', null, null, null, null, '123456', '23', '0', null, '41151003', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1228', '41150410', '������', '087938', '��', null, null, null, null, '123456', '23', '0', null, '41150410', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1229', '41150404', '������', '087945', '��', null, null, null, null, '123456', '23', '0', null, '41150404', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1230', '4115120309', '��ǿ', '087946', '��', null, null, null, null, '123456', '23', '0', null, '4115120309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1231', '41151203', '�����', '087947', '��', null, null, null, null, '123456', '22', '0', null, '41151203', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1232', '41150417', '���Ŀ�', '087948', '��', null, null, null, null, '123456', '23', '0', null, '41150417', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1233', '41150414', '���ʤ', '087949', '��', null, null, null, null, '123456', '23', '0', null, '41150414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1234', '41150104', '��ʤ��', '087950', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1235', '4115120501', '��ʫ��', '087955', '��', null, null, null, null, '123456', '23', '0', null, '4115120501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1236', '41150412', '����', '087957', '��', null, null, null, null, '123456', '23', '0', null, '41150412', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1237', '41150401', '���޺�', '087959', '��', null, null, null, null, '123456', '23', '0', null, '41150401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1238', '41150403', '��˼��', '087960', '��', null, null, null, null, '123456', '23', '0', null, '41150403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1239', '41150411', '����', '087964', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1240', '411505', '��־��', '087965', '��', null, null, null, null, '123456', '22', '0', null, '411505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1241', '41150402', '����', '087973', '��', null, null, null, null, '123456', '23', '0', null, '41150402', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1242', '41150408', '����', '087975', '��', null, null, null, null, '123456', '23', '0', null, '41150408', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1243', '41150303', '���ƽ�', '087976', '��', null, null, null, null, '123456', '23', '0', null, '41150303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1244', '411504', '����þ', '087978', '��', null, null, null, null, '123456', '22', '0', null, '411504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1245', '41150112', '����', '087979', '��', null, null, null, null, '123456', '23', '0', null, '41150112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1246', '41150415', '÷�ʶ�', '087980', '��', null, null, null, null, '123456', '23', '0', null, '41150415', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1247', '41150115', '�����', '087981', '��', null, null, null, null, '123456', '23', '0', null, '41150115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1248', '41150106', '����', '087988', '��', null, null, null, null, '123456', '23', '0', null, '41150106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1249', '41150604', '��Ԫ��', '087989', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1250', '41150405', '������', '087995', '��', null, null, null, null, '123456', '23', '0', null, '41150405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1251', '41150415', '����', '087997', '��', null, null, null, null, '123456', '23', '0', null, '41150415', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1252', '411509', '³Ц��', '088000', '��', null, null, null, null, '123456', '22', '0', null, '411509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1253', '41150413', '����', '088003', '��', null, null, null, null, '123456', '23', '0', null, '41150413', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1254', '41150201', '��ǿ', '088007', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1255', '41150901', '����', '088011', '��', null, null, null, null, '123456', '23', '0', null, '41150901', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1256', '41150903', '�¶���', 'CDL', '��', null, null, null, null, '123456', '23', '0', null, '41150903', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1257', '41150901', '������', '088013', '��', null, null, null, null, '123456', '23', '0', null, '41150901', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1258', '41150105', '������', '088021', '��', null, null, null, null, '123456', '23', '0', null, '41150105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1259', '41150114', '����', '088022', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1260', '41150902', '֣ï��', '088026', '��', null, null, null, null, '123456', '23', '0', null, '41150902', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1261', '41150106', '�ⳬ', '088029', '��', null, null, null, null, '123456', '23', '0', null, '41150106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1262', '41150701', '��Զΰ', '088038', '��', null, null, null, null, '123456', '23', '0', null, '41150701', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1263', '41150703', '����', '088040', '��', null, null, null, null, '123456', '23', '0', null, '41150703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1264', '41150705', '��־��', '088041', '��', null, null, null, null, '123456', '23', '0', null, '41150705', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1265', '41150702', '����', '088043', '��', null, null, null, null, '123456', '23', '0', null, '41150702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1266', '41150703', '����', '088048', '��', null, null, null, null, '123456', '23', '0', null, '41150703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1267', '41150310', '������', '088082', '��', null, null, null, null, '123456', '23', '0', null, '41150310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1268', '411503', '����ۼ', '088121', '��', null, null, null, null, '123456', '22', '0', null, '411503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1269', '41150301', '��Ӧ��', '088269', '��', null, null, null, null, '123456', '23', '0', null, '41150301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1270', '41150113', '��֦��', '088295', '��', null, null, null, null, '123456', '23', '0', null, '41150113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1271', '41150308', 'ʯ����', '088301', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1272', '41150309', '�ŵ���', '088372', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1273', '411501', '������', '088588', '��', null, null, null, null, '123456', '22', '0', null, '411501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1274', '411501', '�k', '088697', '��', null, null, null, null, '123456', '22', '0', null, '411501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1275', '411503', '��Զ��', '088888', '��', null, null, null, null, '123456', '22', '0', null, '411503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1276', '41150506', '������', '185010', '��', null, null, null, null, '123456', '23', '0', null, '41150506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1277', '41150217', '������', '185328', '��', null, null, null, null, '123456', '23', '0', null, '41150217', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1278', '41150303', '��ѩ��', '185713', '��', null, null, null, null, '123456', '23', '0', null, '41150303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1279', '41150510', '������', '186036', '��', null, null, null, null, '123456', '23', '0', null, '41150510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1280', '41150601', '���', '186053', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1281', '4115120503', '������', '186063', '��', null, null, null, null, '123456', '23', '0', null, '4115120503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1282', '41150207', '��Сǿ', '186183', '��', null, null, null, null, '123456', '23', '0', null, '41150207', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1283', '41150201', '�����', '186218', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1284', '4115120502', '������', '186227', '��', null, null, null, null, '123456', '23', '0', null, '4115120502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1285', '4115120503', '�ܺ���', '186231', '��', null, null, null, null, '123456', '23', '0', null, '4115120503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1286', '41150407', '�½���', '186235', '��', null, null, null, null, '123456', '23', '0', null, '41150407', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1287', '4115120505', '�Ͼ���', '186239', '��', null, null, null, null, '123456', '23', '0', null, '4115120505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1288', '4115120302', 'л��ʢ', '186252', '��', null, null, null, null, '123456', '23', '0', null, '4115120302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1289', '4115120302', '����ǿ', '186253', '��', null, null, null, null, '123456', '23', '0', null, '4115120302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1290', '4115120504', '����', '186255', '��', null, null, null, null, '123456', '23', '0', null, '4115120504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1291', '4115120503', '���̻�', '186256', '��', null, null, null, null, '123456', '23', '0', null, '4115120503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1292', '4115120503', 'Ҷ����', '186258', '��', null, null, null, null, '123456', '23', '0', null, '4115120503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1293', '4115120502', '����', '186259', '��', null, null, null, null, '123456', '23', '0', null, '4115120502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1294', '4115120308', '֣��', '186260', '��', null, null, null, null, '123456', '23', '0', null, '4115120308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1295', '4115120504', '����', '186262', '��', null, null, null, null, '123456', '23', '0', null, '4115120504', '1', '2017-08-28 11:48:18', '0', '0', '');
INSERT INTO `employee` VALUES ('1296', '4115120504', '������', '186263', '��', null, null, null, null, '123456', '23', '0', null, '4115120504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1297', '4115120503', '�θ߷�', '186265', '��', null, null, null, null, '123456', '23', '0', null, '4115120503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1298', '4115120301', '������', '186266', '��', null, null, null, null, '123456', '23', '0', null, '4115120301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1299', '41150309', '�߽�', '186270', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1300', '4115120302', '����', '186271', '��', null, null, null, null, '123456', '23', '0', null, '4115120302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1301', '41150309', '����', '186273', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1302', '41150703', '�ֻ�', '186275', '��', null, null, null, null, '123456', '23', '0', null, '41150703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1303', '4115120503', '������', '186276', '��', null, null, null, null, '123456', '23', '0', null, '4115120503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1304', '4115120504', '�Ϸ�ǿ', '186277', '��', null, null, null, null, '123456', '23', '0', null, '4115120504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1305', '4115120307', '������', '186278', '��', null, null, null, null, '123456', '23', '0', null, '4115120307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1306', '4115120505', '�Դ��', '186279', '��', null, null, null, null, '123456', '23', '0', null, '4115120505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1307', '4115120504', '����', '186300', '��', null, null, null, null, '123456', '23', '0', null, '4115120504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1308', '4115120501', '����', '186301', '��', null, null, null, null, '123456', '23', '0', null, '4115120501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1309', '4115120504', '֣����', '186302', '��', null, null, null, null, '123456', '23', '0', null, '4115120504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1310', '4115120503', '���Զ', '186303', '��', null, null, null, null, '123456', '23', '0', null, '4115120503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1311', '4115120505', '����ѫ', '186306', '��', null, null, null, null, '123456', '23', '0', null, '4115120505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1312', '4115120306', '��˼��', '186307', '��', null, null, null, null, '123456', '23', '0', null, '4115120306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1313', '41150608', '��ΰ', '186309', '��', null, null, null, null, '123456', '23', '0', null, '41150608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1314', '41150601', '���ⶫ', '187531', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1315', '4115120505', '������', '186328', '��', null, null, null, null, '123456', '23', '0', null, '4115120505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1316', '41150104', '������', '186932', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1317', '41150101', 'Ҷ����', '186933', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1318', '41150107', '���ƾ�', '186935', '��', null, null, null, null, '123456', '23', '0', null, '41150107', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1319', '41150110', '���Ӧ', '186936', '��', null, null, null, null, '123456', '23', '0', null, '41150110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1320', '41150103', '���Ʊ�', '186937', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1321', '41150114', '������', '186938', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1322', '41150101', '�½��', '186939', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1323', '41150114', '����ϲ', '186940', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1324', '41150104', '�̳�', '186941', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1325', '41150114', '����ǰ', '186942', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1326', '41150114', '�ſ���', '186943', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1327', '41150201', 'κ��', '186944', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1328', '41150102', '������', '186945', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1329', '41150102', '���ط�', '186946', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1330', '41150114', '�����', '186947', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1331', '41150101', '������', '186948', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1332', '4115120303', '������', '186949', '��', null, null, null, null, '123456', '23', '0', null, '4115120303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1333', '41150201', '���ʤ', '186950', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1334', '41150112', '���', '186952', '��', null, null, null, null, '123456', '23', '0', null, '41150112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1335', '41150102', '������', '186953', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1336', '41150105', '�Լ���', '186954', '��', null, null, null, null, '123456', '23', '0', null, '41150105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1337', '411503', '������', '186955', '��', null, null, null, null, '123456', '22', '0', null, '411503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1338', '41150103', '����˳', '186956', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1339', '41150103', '��ӦԪ', '186957', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1340', '41150202', '�ϰ�¼', '186958', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1341', '4115011401', '˾ѧ��', '186959', '��', null, null, null, null, '123456', '23', '0', null, '4115011401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1342', '41150201', '���', '186960', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1343', '41150211', '��־��', '186961', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1344', '41150114', '�߸�Ҫ', '186962', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1345', '41150104', '�Ʒ���', '186964', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1346', '41150101', 'ղ��', '186966', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1347', '41150105', '������', '186967', '��', null, null, null, null, '123456', '23', '0', null, '41150105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1348', '4115120313', '�ž���', '186969', '��', null, null, null, null, '123456', '23', '0', null, '4115120313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1349', '4115120306', '��ǿ', '186970', '��', null, null, null, null, '123456', '23', '0', null, '4115120306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1350', '41150105', '�޺���', '186971', '��', null, null, null, null, '123456', '23', '0', null, '41150105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1351', '41150213', '����', '186972', '��', null, null, null, null, '123456', '23', '0', null, '41150213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1352', '41151202', '����', '186974', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1353', '41150106', '����', '186975', '��', null, null, null, null, '123456', '23', '0', null, '41150106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1354', '41150202', '���÷', '186976', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1355', '41150114', '��Ң', '186977', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1356', '41150207', '������', '186982', '��', null, null, null, null, '123456', '23', '0', null, '41150207', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1357', '41150101', '������', '186983', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1358', '41150308', '����', '186985', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1359', '41150214', '��Ρ', '186988', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1360', '41150114', '����', '186989', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1361', '41150214', '��ѩ��', '186990', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1362', '41150214', '����Բ', '186991', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1363', '41150214', '����', '186992', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1364', '41150103', '������', '186995', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1365', '41150114', '������', '186996', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1366', '41150111', '������', '186997', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1367', '41150112', '�½���', '186998', '��', null, null, null, null, '123456', '23', '0', null, '41150112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1368', '41150211', '����', '186999', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1369', '41150110', '���Ա�', '187000', '��', null, null, null, null, '123456', '23', '0', null, '41150110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1370', '41150214', '����', '187001', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1371', '41151202', '��˫��', '187002', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1372', '41150201', '����', '187006', '��', null, null, null, null, '123456', '23', '0', null, '41150201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1373', '41150214', '��ǿ', '187007', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1374', '41150211', '���Ƕ�', '187008', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1375', '41150211', '����÷', '187009', '��', null, null, null, null, '123456', '23', '0', null, '41150211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1376', '41150114', 'Ԭ����', '187010', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1377', '41150214', '������', '187011', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1378', '41150114', '��ǿ', '187012', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1379', '41151203', '������', '187013', '��', null, null, null, null, '123456', '22', '0', null, '41151203', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1380', '41150110', '�ر�', '187015', '��', null, null, null, null, '123456', '23', '0', null, '41150110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1381', '41150114', '���꽡', '187016', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1382', '41150216', '����ٻ', '187017', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1383', '41150215', '�ž�', '187018', '��', null, null, null, null, '123456', '23', '0', null, '41150215', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1384', '41150202', '�׷���', '187019', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1385', '41150216', '����', '187021', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1386', '41150202', '������', '187022', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1387', '41150114', '���', '187025', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1388', '41150102', '�ܲ���', '187026', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1389', '41150103', '��̫ƽ', '187027', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1390', '41150114', '��ΰ', '187028', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1391', '41150111', '��־Զ', '187031', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1392', '41150203', '�ķ�', '187032', '��', null, null, null, null, '123456', '23', '0', null, '41150203', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1393', '41150214', '����', '187036', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1394', '41150309', '���״�', '187037', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1395', '41150214', 'л����', '187038', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1396', '41150208', '�����', '187039', '��', null, null, null, null, '123456', '23', '0', null, '41150208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1397', '41150203', 'Ԭ����', '187046', '��', null, null, null, null, '123456', '23', '0', null, '41150203', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1398', '411502', '�ٻ�', '187050', '��', null, null, null, null, '123456', '22', '0', null, '411502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1399', '41150214', '��Х��', '187051', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1400', '41150205', '������', '187053', '��', null, null, null, null, '123456', '23', '0', null, '41150205', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1401', '41150205', '������', '187055', '��', null, null, null, null, '123456', '23', '0', null, '41150205', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1402', '41150212', '����', '187056', '��', null, null, null, null, '123456', '23', '0', null, '41150212', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1403', '41150209', '�����', '187057', '��', null, null, null, null, '123456', '23', '0', null, '41150209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1404', '41150209', '����', '187058', '��', null, null, null, null, '123456', '23', '0', null, '41150209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1405', '41150208', '�Ž�', '187059', '��', null, null, null, null, '123456', '23', '0', null, '41150208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1406', '41150204', '����', '187060', '��', null, null, null, null, '123456', '23', '0', null, '41150204', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1407', '41150207', '�޼һ�', '187062', '��', null, null, null, null, '123456', '23', '0', null, '41150207', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1408', '41150203', '������', '187063', '��', null, null, null, null, '123456', '23', '0', null, '41150203', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1409', '41150208', '����', '187065', '��', null, null, null, null, '123456', '23', '0', null, '41150208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1410', '41150110', '����', '187066', '��', null, null, null, null, '123456', '23', '0', null, '41150110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1411', '4115120307', '����', '187067', '��', null, null, null, null, '123456', '23', '0', null, '4115120307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1412', '41150115', '����', '187068', '��', null, null, null, null, '123456', '23', '0', null, '41150115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1413', '4115120312', '���', '187069', '��', null, null, null, null, '123456', '23', '0', null, '4115120312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1414', '41150113', '����÷', '187070', '��', null, null, null, null, '123456', '23', '0', null, '41150113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1415', '41150114', '������', '187071', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1416', '41150101', '�ν�', '187073', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1417', '41150114', '���', '187074', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1418', '41150106', '����', '187075', '��', null, null, null, null, '123456', '23', '0', null, '41150106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1419', '41150111', '������', '187076', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1420', '41150114', '����', '187077', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1421', '41150101', '�ų�', '187078', '��', '', null, '', null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1422', '4115120301', '���ڱ�', '187079', '��', null, null, null, null, '123456', '23', '0', null, '4115120301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1423', '41150106', '������', '187080', '��', null, null, null, null, '123456', '23', '0', null, '41150106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1424', '41150103', '����', '187081', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1425', '41150107', '�ū�', '187086', '��', null, null, null, null, '123456', '23', '0', null, '41150107', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1426', '41150114', '���ӳ�', '187087', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1427', '41150105', 'л��ƽ', '187099', '��', null, null, null, null, '123456', '23', '0', null, '41150105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1428', '41150114', '�ƴ�', '187110', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1429', '41150214', '��ѧ��', '187167', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1430', '41150214', '����', '187168', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1431', '41150210', '����', '187169', '��', null, null, null, null, '123456', '23', '0', null, '41150210', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1432', '41150216', '��ʱ��', '187170', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1433', '41150204', '������', '187171', '��', null, null, null, null, '123456', '23', '0', null, '41150204', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1434', '41150110', '��ѩ', '187187', '��', null, null, null, null, '123456', '23', '0', null, '41150110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1435', '41150206', '������', '187188', '��', null, null, null, null, '123456', '23', '0', null, '41150206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1436', '411505', '����ɽ', '187331', '��', null, null, null, null, '123456', '22', '0', null, '411505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1437', '41150609', '������', '187333', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1438', '41150601', '����', '187335', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1439', '41150502', '�ſ�', '187336', '��', null, null, null, null, '123456', '23', '0', null, '41150502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1440', '41150609', '�Գ�', '187337', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1441', '41150609', '̷��', '187338', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1442', '41150502', '����', '187339', '��', null, null, null, null, '123456', '23', '0', null, '41150502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1443', '4115120501', '������', '187351', '��', null, null, null, null, '123456', '23', '0', null, '4115120501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1444', '4115120502', '���б�', '187353', '��', null, null, null, null, '123456', '23', '0', null, '4115120502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1445', '41150510', '��ʤ', '187355', '��', null, null, null, null, '123456', '23', '0', null, '41150510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1446', '41150510', 'Ф��', '187356', '��', null, null, null, null, '123456', '23', '0', null, '41150510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1447', '41150801', '���Ⱥ�', '187363', '��', null, null, null, null, '123456', '23', '0', null, '41150801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1448', '41150609', '��Ǹ�', '187366', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1449', '41150510', '������', '187368', '��', null, null, null, null, '123456', '23', '0', null, '41150510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1450', '41150607', 'Ǯ�ۻ�', '187369', '��', null, null, null, null, '123456', '23', '0', null, '41150607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1451', '41150609', '�ܻ�', '187370', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1452', '41150417', '������', '187376', '��', null, null, null, null, '123456', '23', '0', null, '41150417', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1453', '41150416', '������', '187379', '��', null, null, null, null, '123456', '23', '0', null, '41150416', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1454', '41150601', '���Ļ�', '187380', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1455', '411505', '������', '187388', '��', null, null, null, null, '123456', '22', '0', null, '411505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1456', '4115120305', '�ܱ�Ԫ', '187396', '��', null, null, null, null, '123456', '23', '0', null, '4115120305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1457', '41150401', '��ǿ', '187398', '��', null, null, null, null, '123456', '23', '0', null, '41150401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1458', '411508', '��һ��', '187399', '��', null, null, null, null, '123456', '22', '0', null, '411508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1459', '41150801', '��Ϧ', '187428', '��', null, null, null, null, '123456', '23', '0', null, '41150801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1460', '41150805', '÷��', '187408', '��', null, null, null, null, '123456', '23', '0', null, '41150805', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1461', '41150802', '��ҹ�', '187409', '��', null, null, null, null, '123456', '23', '0', null, '41150802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1462', '411508', '����', '187426', '��', null, null, null, null, '123456', '22', '0', null, '411508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1463', '41150501', '�Ȿ��', '187444', '��', null, null, null, null, '123456', '23', '0', null, '41150501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1464', '41150507', '������', '187455', '��', null, null, null, null, '123456', '23', '0', null, '41150507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1465', '41150511', '����', '187456', '��', null, null, null, null, '123456', '23', '0', null, '41150511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1466', '41150504', '��־��', '187460', '��', null, null, null, null, '123456', '23', '0', null, '41150504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1467', '41150501', '����', '187463', '��', null, null, null, null, '123456', '23', '0', null, '41150501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1468', '41150505', '�����', '187466', '��', null, null, null, null, '123456', '23', '0', null, '41150505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1469', '41150506', '¬��ʯ', '187467', '��', null, null, null, null, '123456', '23', '0', null, '41150506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1470', '41150510', '����˹', '187469', '��', null, null, null, null, '123456', '23', '0', null, '41150510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1471', '41150505', '����', '187477', '��', null, null, null, null, '123456', '23', '0', null, '41150505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1472', '41150508', '���', '187480', '��', null, null, null, null, '123456', '23', '0', null, '41150508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1473', '41150504', '����', '187481', '��', null, null, null, null, '123456', '23', '0', null, '41150504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1474', '41150503', '����', '187487', '��', null, null, null, null, '123456', '23', '0', null, '41150503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1475', '41150501', '��¶¶', '187488', '��', null, null, null, null, '123456', '23', '0', null, '41150501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1476', '411505', '�ܴ���', '187496', '��', null, null, null, null, '123456', '22', '0', null, '411505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1477', '41150503', '����', '187499', '��', null, null, null, null, '123456', '23', '0', null, '41150503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1478', '41150508', '�ⷼ', '187500', '��', null, null, null, null, '123456', '23', '0', null, '41150508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1479', '41150312', '��־��', '187506', '��', null, null, null, null, '123456', '23', '0', null, '41150312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1480', '41150304', '������', '187508', '��', null, null, null, null, '123456', '23', '0', null, '41150304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1481', '41150609', '����', '187517', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1482', '41150609', '���Ǻ�', '187518', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1483', '41150601', '�ϼ���', '187520', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1484', '41150603', '����', '187555', '��', null, null, null, null, '123456', '23', '0', null, '41150603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1485', '41150609', '��˫˫', '187567', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1486', '41150604', '�Ŷ�', '187598', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1487', '41150604', '��ٻ��', '187599', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1488', '41150416', '������', '187600', '��', null, null, null, null, '123456', '23', '0', null, '41150416', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1489', '41150607', '���', '187601', '��', null, null, null, null, '123456', '23', '0', null, '41150607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1490', '41150411', '�·���', '187631', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1491', '41150407', '�붫', '187632', '��', null, null, null, null, '123456', '23', '0', null, '41150407', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1492', '41150110', '�ŭ[', '187636', '��', null, null, null, null, '123456', '23', '0', null, '41150110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1493', '41150401', '������', '187637', '��', null, null, null, null, '123456', '23', '0', null, '41150401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1494', '41150417', '��ˮ', '187638', '��', null, null, null, null, '123456', '23', '0', null, '41150417', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1495', '41150411', '��׳', '187639', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1496', '41150414', '����', '187651', '��', null, null, null, null, '123456', '23', '0', null, '41150414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1497', '41150102', '��־Զ', '187656', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1498', '41150314', '������', '187653', '��', null, null, null, null, '123456', '23', '0', null, '41150314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1499', '4115120301', '����', '187660', '��', null, null, null, null, '123456', '23', '0', null, '4115120301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1500', '41150409', '������', '187661', '��', null, null, null, null, '123456', '23', '0', null, '41150409', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1501', '41150411', 'Ф��', '187667', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1502', '41150504', '����', '187668', '��', null, null, null, null, '123456', '23', '0', null, '41150504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1503', '41150411', '������', '187669', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1504', '411504', '��ѧ��', '187672', '��', null, null, null, null, '123456', '22', '0', null, '411504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1505', '4115120503', '�ŵ�', 'DD', '��', null, null, null, null, '123456', '23', '0', null, '4115120503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1506', '41150402', '��ӱ־', '187679', '��', null, null, null, null, '123456', '23', '0', null, '41150402', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1507', '41150702', '������', '187680', '��', null, null, null, null, '123456', '23', '0', null, '41150702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1508', '41150511', '������', '187681', '��', null, null, null, null, '123456', '23', '0', null, '41150511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1509', '41150412', '����', '187682', '��', null, null, null, null, '123456', '23', '0', null, '41150412', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1510', '41150403', '������', '187683', '��', null, null, null, null, '123456', '23', '0', null, '41150403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1511', '4115120304', '��ΰ', '187685', '��', null, null, null, null, '123456', '23', '0', null, '4115120304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1512', '41150408', '����', '187686', '��', null, null, null, null, '123456', '23', '0', null, '41150408', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1513', '41150411', '��ΰ', '187687', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1514', '41150411', '��Ԫ��', '187688', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1515', '41150405', '�Ź�˫', '187689', '��', null, null, null, null, '123456', '23', '0', null, '41150405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1516', '41151201', '���', '187690', '��', null, null, null, null, '123456', '22', '0', null, '41151201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1517', '41150418', '��С��', '187691', '��', null, null, null, null, '123456', '23', '0', null, '41150418', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1518', '41150401', '������', '187692', '��', null, null, null, null, '123456', '23', '0', null, '41150401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1519', '41150403', '����', '187695', '��', null, null, null, null, '123456', '23', '0', null, '41150403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1520', '41150402', '�߽�', '187696', '��', null, null, null, null, '123456', '23', '0', null, '41150402', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1521', '41150415', 'Ԭ��ϼ', '187697', '��', null, null, null, null, '123456', '23', '0', null, '41150415', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1522', '41150411', '����', '187698', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1523', '41150405', '������', '187699', '��', null, null, null, null, '123456', '23', '0', null, '41150405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1524', '41150411', '�톴', '187700', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1525', '41150411', '�Ż�', '187701', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1526', '41150407', 'ʷ��Դ', '187702', '��', null, null, null, null, '123456', '23', '0', null, '41150407', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1527', '41150411', '����', '187703', '��', null, null, null, null, '123456', '23', '0', null, '41150411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1528', '41150418', 'ʦԶ', '187705', '��', null, null, null, null, '123456', '23', '0', null, '41150418', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1529', '41150414', '��ѧ��', '187707', '��', null, null, null, null, '123456', '23', '0', null, '41150414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1530', '41150410', '��Ȩ', '187708', '��', null, null, null, null, '123456', '23', '0', null, '41150410', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1531', '41150403', '����', '187709', '��', null, null, null, null, '123456', '23', '0', null, '41150403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1532', '41150406', '�ź���', '187710', '��', null, null, null, null, '123456', '23', '0', null, '41150406', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1533', '41150904', '��ά��', '187751', '��', null, null, null, null, '123456', '23', '0', null, '41150904', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1534', '41150903', '��С��', '187753', '��', null, null, null, null, '123456', '23', '0', null, '41150903', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1535', '41150901', '������', '187755', '��', null, null, null, null, '123456', '23', '0', null, '41150901', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1536', '41150904', '������', '187756', '��', null, null, null, null, '123456', '23', '0', null, '41150904', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1537', '41150901', '��ٻ', '187757', '��', null, null, null, null, '123456', '23', '0', null, '41150901', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1538', '41150902', '���Ľ�', '187758', '��', null, null, null, null, '123456', '23', '0', null, '41150902', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1539', '41150901', '����', '187759', '��', null, null, null, null, '123456', '23', '0', null, '41150901', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1540', '411509', '����ʤ', '187777', '��', null, null, null, null, '123456', '22', '0', null, '411509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1541', '41150704', '����', '187801', '��', null, null, null, null, '123456', '23', '0', null, '41150704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1542', '411507', '���', '187807', '��', null, null, null, null, '123456', '22', '0', null, '411507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1543', '411507', '����ѩ', '187808', '��', null, null, null, null, '123456', '22', '0', null, '411507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1544', '41150302', '����˳', '187809', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1545', '41150704', '����', '187815', '��', null, null, null, null, '123456', '23', '0', null, '41150704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1546', '41150704', '����', '187816', '��', null, null, null, null, '123456', '23', '0', null, '41150704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1547', '41150702', '������', '187820', '��', null, null, null, null, '123456', '23', '0', null, '41150702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1548', '41151001', '����', '187861', '��', null, null, null, null, '123456', '23', '0', null, '41151001', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1549', '41151001', '������', '187862', '��', null, null, null, null, '123456', '23', '0', null, '41151001', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1550', '41151002', '����', '187863', '��', null, null, null, null, '123456', '23', '0', null, '41151002', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1551', '41151004', 'Ǯ��Ԫ', '187869', '��', null, null, null, null, '123456', '23', '0', null, '41151004', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1552', '41150302', '�߽�', '187872', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1553', '41150308', '����', '187873', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1554', '41150306', '������', '187875', '��', null, null, null, null, '123456', '23', '0', null, '41150306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1555', '411503', '������', '187876', '��', null, null, null, null, '123456', '22', '0', null, '411503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1556', '41150313', '������', '187877', '��', null, null, null, null, '123456', '23', '0', null, '41150313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1557', '41150308', '����ǿ', '187878', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1558', '41150307', 'Ф԰', '187879', '��', null, null, null, null, '123456', '23', '0', null, '41150307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1559', '411503', '�¾�', '187880', '��', null, null, null, null, '123456', '22', '0', null, '411503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1560', '41150308', '����', '187881', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1561', '41150308', '����', '187883', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1562', '41150303', '������', '187885', '��', null, null, null, null, '123456', '23', '0', null, '41150303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1563', '41150306', '������', '187886', '��', null, null, null, null, '123456', '23', '0', null, '41150306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1564', '41150302', '����', '187887', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1565', '41150304', '��־��', '187890', '��', null, null, null, null, '123456', '23', '0', null, '41150304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1566', '41150301', '�²�ƽ', '187891', '��', null, null, null, null, '123456', '23', '0', null, '41150301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1567', '41150301', '������', '187892', '��', null, null, null, null, '123456', '23', '0', null, '41150301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1568', '4115120304', '����', '187893', '��', null, null, null, null, '123456', '23', '0', null, '4115120304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1569', '41150313', '��С��', '187896', '��', null, null, null, null, '123456', '23', '0', null, '41150313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1570', '41150308', '������', '187897', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1571', '41150311', '����', '187898', '��', null, null, null, null, '123456', '23', '0', null, '41150311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1572', '41150313', '�׾�', '187899', '��', null, null, null, null, '123456', '23', '0', null, '41150313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1573', '41150308', '֣��', '187900', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1574', '4115120311', '�س���', '187901', '��', null, null, null, null, '123456', '23', '0', null, '4115120311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1575', '41150308', '�Ź���', '187902', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1576', '41150301', 'κ����', '187903', '��', null, null, null, null, '123456', '23', '0', null, '41150301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1577', '41150302', '����', '187905', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1578', '41150302', '����ԥ', '187906', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1579', '41150302', '����', '187907', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1580', '41150301', '����', '187908', '��', null, null, null, null, '123456', '23', '0', null, '41150301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1581', '41150311', '֣����', '187909', '��', null, null, null, null, '123456', '23', '0', null, '41150311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1582', '41150309', '������', '187910', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1583', '41150307', '������', '187911', '��', null, null, null, null, '123456', '23', '0', null, '41150307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1584', '41150309', '����', '187912', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1585', '41150308', '�ַ�', '187915', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1586', '41150301', '����', '187916', '��', null, null, null, null, '123456', '23', '0', null, '41150301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1587', '41150304', '������', '187917', '��', null, null, null, null, '123456', '23', '0', null, '41150304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1588', '41150309', '������', '187920', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1589', '41150309', '������', '187921', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1590', '41150309', '������', '187922', '��', null, null, null, null, '123456', '23', '0', null, '41150309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1591', '41150304', '����', '187923', '��', null, null, null, null, '123456', '23', '0', null, '41150304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1592', '41150308', '�ؿ�', '187924', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1593', '41150302', '����', '187925', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1594', '41150313', '������', '187926', '��', null, null, null, null, '123456', '23', '0', null, '41150313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1595', '41150308', '���', '187927', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1596', '41151203', '�ž�γ', '187928', '��', null, null, null, null, '123456', '22', '0', null, '41151203', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1597', '41150302', 'κ�S', '187929', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1598', '41150216', '����', '188009', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1599', '41150111', '����', '188023', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1600', '41150202', '���', '188086', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1601', '41150313', '����', '188299', '��', null, null, null, null, '123456', '23', '0', null, '41150313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1602', '41150301', 'ë���', '188901', '��', null, null, null, null, '123456', '23', '0', null, '41150301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1603', '41150308', 'Ǯ����', '187931', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1604', '4115120301', 'ղ����', '189479', '��', null, null, null, null, '123456', '23', '0', null, '4115120301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1605', '4115120307', '����', '189573', '��', null, null, null, null, '123456', '23', '0', null, '4115120307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1606', '41150507', '�ֳ�', '087874', '��', null, null, null, null, '123456', '23', '0', null, '41150507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1607', '41150204', '�¾�', '187061', '��', null, null, null, null, '123456', '23', '0', null, '41150204', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1608', '41150106', '����', '187098', '��', null, null, null, null, '123456', '23', '0', null, '41150106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1609', '41150601', '������', '187377', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1610', '41150805', '���ط�', '187433', '��', null, null, null, null, '123456', '23', '0', null, '41150805', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1611', '411507', '����', '187810', '��', null, null, null, null, '123456', '22', '0', null, '411507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1612', '41151004', '�¿�', '187839', '��', null, null, null, null, '123456', '23', '0', null, '41151004', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1613', '41150103', '����ΰ', 'HSW', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1614', '41150702', '����ѩ', 'JWX', '��', null, null, null, null, '123456', '23', '0', null, '41150702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1615', '41150805', '����', 'LP', '��', null, null, null, null, '123456', '23', '0', null, '41150805', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1616', '41150804', '³��', 'LY', '��', null, null, null, null, '123456', '23', '0', null, '41150804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1617', '41150609', '������', 'LYM', '��', null, null, null, null, '123456', '23', '0', null, '41150609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1618', '41150805', '���Ի�', '187410', '��', null, null, null, null, '123456', '23', '0', null, '41150805', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1619', '41150702', '������', '187802', '��', null, null, null, null, '123456', '23', '0', null, '41150702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1620', '41150803', '������', 'RXF', '��', null, null, null, null, '123456', '23', '0', null, '41150803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1621', '41150214', '�λ���', '187052', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1622', '41150601', 'ʢ�', 'SN', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1623', '41150601', '��Ρ', '187378', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1624', '41150802', '������', '187400', '��', null, null, null, null, '123456', '23', '0', null, '41150802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1625', '41150801', '�ܴ���', '187416', '��', null, null, null, null, '123456', '23', '0', null, '41150801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1626', '41150601', '���ɭ', '187373', '��', null, null, null, null, '123456', '23', '0', null, '41150601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1627', '41150602', '����', 'XL', '��', null, null, null, null, '123456', '23', '0', null, '41150602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1628', '41150302', '������', '086512', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1629', '41150416', '�ຣ', '187706', '��', null, null, null, null, '123456', '23', '0', null, '41150416', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1630', '41150302', '����', '187930', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1631', '41150604', '�ŵ���', 'ZDD', '��', null, null, null, null, '123456', '23', '0', null, '41150604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1632', '411507', '�ܽ�', '187803', '��', null, null, null, null, '123456', '22', '0', null, '411507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1633', '411509', '�¶���', '088012', '��', null, null, null, null, '123456', '22', '0', null, '411509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1634', '41151205', '����', 'QT', '��', null, null, null, null, '123456', '22', '0', null, '41151205', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1635', '411502', 'test', 'TEST', '��', null, null, null, null, '123456', '22', '0', null, '411502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1636', '41150105', '����', '187091', '��', null, null, null, null, '123456', '23', '0', null, '41150105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1637', '41150101', '����', '084987', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1638', '41150202', '���ѷ�', '187179', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1639', '41150206', '����ǿ', '084708', '��', null, null, null, null, '123456', '23', '0', null, '41150206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1640', '4115120304', '����', 'LL', '��', null, null, null, null, '123456', '23', '0', null, '4115120304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1641', '4115120310', '����ɽ', '186286', '��', null, null, null, null, '123456', '23', '0', null, '4115120310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1642', '4115120310', '�հ���', '186779', '��', null, null, null, null, '123456', '23', '0', null, '4115120310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1643', '4115120311', '����', '186237', '��', null, null, null, null, '123456', '23', '0', null, '4115120311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1644', '4115120304', '����', '186121', '��', null, null, null, null, '123456', '23', '0', null, '4115120304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1645', '411501', '֣Ӧΰ', '186951', '��', null, null, null, null, '123456', '22', '0', null, '411501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1646', '4115120302', '���¹�', '187176', '��', null, null, null, null, '123456', '23', '0', null, '4115120302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1647', '4115120302', '���', '186272', '��', null, null, null, null, '123456', '23', '0', null, '4115120302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1648', '4115120302', '����', '186029', '��', null, null, null, null, '123456', '23', '0', null, '4115120302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1649', '41151203', 'Ԭ����', '187177', '��', null, null, null, null, '123456', '22', '0', null, '41151203', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1650', '4115120305', '����', '186621', '��', null, null, null, null, '123456', '23', '0', null, '4115120305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1651', '41151204', '����֧��01', '����֧��01', '��', null, null, null, null, '123456', '22', '0', null, '41151204', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1652', '41151204', '����֧��02', '����֧��02', '��', null, null, null, null, '123456', '22', '0', null, '41151204', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1653', '41151204', '����֧��03', '����֧��03', '��', null, null, null, null, '123456', '22', '0', null, '41151204', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1654', '41151204', '����֧��04', '����֧��04', '��', null, null, null, null, '123456', '22', '0', null, '41151204', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1655', '41150206', 'Ԭ��', '087246', '��', null, null, null, null, '123456', '23', '0', null, '41150206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1656', '41150105', 'л��԰', '187093', '��', null, null, null, null, '123456', '23', '0', null, '41150105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1657', '41150103', '�׺���', '086443', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1658', '4115120307', '����', '187023', '��', null, null, null, null, '123456', '23', '0', null, '4115120307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1659', '4115120312', '�º���', '186238', '��', null, null, null, null, '123456', '23', '0', null, '4115120312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1660', '4115120312', '�߻�', '186678', '��', null, null, null, null, '123456', '23', '0', null, '4115120312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1661', '4115120301', '����ΰ', '186828', '��', null, null, null, null, '123456', '23', '0', null, '4115120301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1662', '4115120308', '���л�', '086670', '��', null, null, null, null, '123456', '23', '0', null, '4115120308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1663', '4115120308', '����ƽ', '186688', '��', null, null, null, null, '123456', '23', '0', null, '4115120308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1664', '4115120308', '���', '087952', '��', null, null, null, null, '123456', '23', '0', null, '4115120308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1665', '41151205', '���ĸ�', '087928', '��', null, null, null, null, '123456', '22', '0', null, '41151205', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1666', '411510', '����', '086401', '��', '', null, '', null, '123456', '22', '0', null, '411510', '1', '2017-08-28 11:41:20', '0', '0', '');
INSERT INTO `employee` VALUES ('1667', '4115120303', '�쾺', '188090', '��', null, null, null, null, '123456', '23', '0', null, '4115120303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1668', '4115120303', '����ΰ', '086920', '��', null, null, null, null, '123456', '23', '0', null, '4115120303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1669', '4115120303', '����', '186026', '��', null, null, null, null, '123456', '23', '0', null, '4115120303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1670', '4115120503', '�����', '186190', '��', null, null, null, null, '123456', '23', '0', null, '4115120503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1671', '41151201', '¬����', '086879', '��', null, null, null, null, '123456', '22', '0', null, '41151201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1672', '41150113', '��ӱ�', '187083', '��', null, null, null, null, '123456', '23', '0', null, '41150113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1673', '41150114', '����˳', '187085', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1674', '411518', '��Ԫ��', '085355', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1675', '4115', '��ʥ��', '087357', '��', '', null, '', null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1676', '4115', '����', '186035', '��', '', null, '', null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1677', '41150701', '��־��', '086622', '��', null, null, null, null, '123456', '23', '0', null, '41150701', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1678', '4115', '֣����', '186251', '��', '', null, '', null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1679', '4115', '�ನ', '085752', '��', '', null, '', null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1680', '4115', '��ˬ', '087744', '��', null, null, null, null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1681', '4115121201', '���з�', '186065', '��', null, null, null, null, '123456', '23', '0', null, '4115121201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1682', '4115121201', '̷ƽɽ', '087991', '��', null, null, null, null, '123456', '23', '0', null, '4115121201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1683', '411512120101', 'ʯ����', '086263', '��', null, null, null, null, '123456', '23', '0', null, '411512120101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1684', '411512120101', '�ɫh��', '186052', '��', null, null, null, null, '123456', '23', '0', null, '411512120101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1685', '411512120102', '������', '087493', '��', null, null, null, null, '123456', '23', '0', null, '411512120102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1686', '411512120104', '������', '186037', '��', null, null, null, null, '123456', '23', '0', null, '411512120104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1687', '411512120101', '������', '187671', '��', null, null, null, null, '123456', '23', '0', null, '411512120101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1688', '411512120102', '��ʫ��', '087712', '��', null, null, null, null, '123456', '23', '0', null, '411512120102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1689', '411512120103', '�ΰ', '087954', '��', null, null, null, null, '123456', '23', '0', null, '411512120103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1690', '41151201', '��ƽƽ', '86558', '��', null, null, null, null, '123456', '22', '0', null, '41151201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1691', '41151201', '����', '86636', '��', null, null, null, null, '123456', '22', '0', null, '41151201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1692', '41151201', '�׻�', '86626', '��', null, null, null, null, '123456', '22', '0', null, '41151201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1693', '41151201', '�Ͻ���', '186032', '��', null, null, null, null, '123456', '22', '0', null, '41151201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1694', '41151201', '�¾�', '086881', '��', null, null, null, null, '123456', '22', '0', null, '41151201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1695', '411512120103', '������', '086286', '��', null, null, null, null, '123456', '23', '0', null, '411512120103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1696', '411512120103', '����', '087552', '��', null, null, null, null, '123456', '23', '0', null, '411512120103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1697', '411512120103', '��ʿΰ', '086235', '��', null, null, null, null, '123456', '23', '0', null, '411512120103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1698', '411512120103', '���ƽ', '087302', '��', null, null, null, null, '123456', '23', '0', null, '411512120103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1699', '411512120103', '������', '186370', '��', null, null, null, null, '123456', '23', '0', null, '411512120103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1700', '411512120103', '��ΰ', '001-DW', '��', null, null, null, null, '123456', '23', '0', null, '411512120103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1701', '411512120103', '�', '002-LB', '��', null, null, null, null, '123456', '23', '0', null, '411512120103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1702', '411512120103', '�ﰲ', '003-SA', '��', null, null, null, null, '123456', '23', '0', null, '411512120103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1703', '41150502', '�ι���', '087822', '��', null, null, null, null, '123456', '23', '0', null, '41150502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1704', '41151203', '���', '086412', '��', null, null, null, null, '123456', '22', '0', null, '41151203', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1705', '4115', '�Ծ�', '086357', '��', null, null, null, null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1706', '4115', '���', '186632', '��', null, null, null, null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1707', '41150107', '����־', '086212', '��', null, null, null, null, '123456', '23', '0', null, '41150107', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1708', '41150102', '������', '187082', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1709', '41150102', 'ë����', '086411', '��', null, null, null, null, '123456', '23', '0', null, '41150102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1710', '41150114', 'ţ����', '187088', '��', null, null, null, null, '123456', '23', '0', null, '41150114', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1711', '41150308', '�콨��', '187918', '��', null, null, null, null, '123456', '23', '0', null, '41150308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1712', '41150111', '��ΰ', '087135', '��', null, null, null, null, '123456', '23', '0', null, '41150111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1713', '41150101', '���׳�', '187312', '��', null, null, null, null, '123456', '23', '0', null, '41150101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1714', '41150104', '���', '186257', '��', null, null, null, null, '123456', '23', '0', null, '41150104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1715', '41151211', '������', '086859', '��', null, null, null, null, '123456', '22', '0', null, '41151211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1716', '41151211', '����ΰ', '186061', '��', null, null, null, null, '123456', '22', '0', null, '41151211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1717', '41151211', '����ϼ', '186118', '��', null, null, null, null, '123456', '22', '0', null, '41151211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1718', '41151211', '����ʤ', '186280', '��', null, null, null, null, '123456', '22', '0', null, '41151211', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1719', '41151210', '������', '186356', '��', null, null, null, null, '123456', '22', '0', null, '41151210', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1720', '41151210', '����', '087490', '��', null, null, null, null, '123456', '22', '0', null, '41151210', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1721', '41151209', '���', '84839', '��', null, null, null, null, '123456', '22', '0', null, '41151209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1722', '41151209', '�����', '186228', '��', null, null, null, null, '123456', '22', '0', null, '41151209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1723', '41151209', '������', '87130', '��', null, null, null, null, '123456', '22', '0', null, '41151209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1724', '41151209', '��ҫ', '86986', '��', null, null, null, null, '123456', '22', '0', null, '41151209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1725', '41151209', '��־��', '186225', '��', null, null, null, null, '123456', '22', '0', null, '41151209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1726', '41151209', '���', '086469', '��', null, null, null, null, '123456', '22', '0', null, '41151209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1727', '41151209', '������', '86967', '��', null, null, null, null, '123456', '22', '0', null, '41151209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1728', '41151209', '����', 'KZ', '��', null, null, null, null, '123456', '22', '0', null, '41151209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1729', '41151209', '��ҫ��', '186226', '��', null, null, null, null, '123456', '22', '0', null, '41151209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1730', '41151209', '���Ժ�', '187072', '��', null, null, null, null, '123456', '22', '0', null, '41151209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1731', '41151209', '����', '87399', '��', null, null, null, null, '123456', '22', '0', null, '41151209', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1732', '41151208', '����', '086106', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1733', '41151208', '�ƺ�', '087998', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1734', '41151208', '���', '087164', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1735', '41151208', '������', '086885', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1736', '41151208', '�ܺ�', '086705', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1737', '41151208', '����', '086323', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1738', '41151208', '����־', '186690', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1739', '41151208', 'ҶԶ��', '186030', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1740', '41151208', '����ʤ', '087769', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1741', '41151208', '��ɭ', '087398', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1742', '41151208', '��н��', '086361', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1743', '41151208', '���Ϻ�', '086569', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1744', '41151208', '����', '086378', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1745', '41151208', '����', '086981', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1746', '41151208', '����', '087127', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1747', '41151208', '������', '087956', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1748', '41151208', '������', '086110', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1749', '41151208', '���»�', '188999', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1750', '41151208', '���', '086435', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1751', '4115120304', '������', '186963', '��', null, null, null, null, '123456', '23', '0', null, '4115120304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1752', '41150103', '����ΰ', '123456', '��', null, null, null, null, '123456', '23', '0', null, '41150103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1753', '4115120302', '������', '001', '��', null, null, null, null, '123456', '23', '0', null, '4115120302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1754', '4115120302', 'Ѧ����', '002', '��', null, null, null, null, '123456', '23', '0', null, '4115120302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1755', '4115120302', '������', '003', '��', null, null, null, null, '123456', '23', '0', null, '4115120302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1756', '4115120305', '���', '004', '��', null, null, null, null, '123456', '23', '0', null, '4115120305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1757', '4115120302', '���', '005', '��', null, null, null, null, '123456', '23', '0', null, '4115120302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1758', '4115120302', '����Զ', '006', '��', null, null, null, null, '123456', '23', '0', null, '4115120302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1759', '4115120306', '������', '0909', '��', null, null, null, null, '123456', '23', '0', null, '4115120306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1760', '4115120306', 'ͿС��', '008', '��', null, null, null, null, '123456', '23', '0', null, '4115120306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1761', '4115120302', '������', '009', '��', null, null, null, null, '123456', '23', '0', null, '4115120302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1762', '4115120306', '�Գ�Ⱥ', '010', '��', null, null, null, null, '123456', '23', '0', null, '4115120306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1763', '4115120305', '��  ��', '011', '��', null, null, null, null, '123456', '23', '0', null, '4115120305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1764', '4115120305', '��  ��', '012', '��', null, null, null, null, '123456', '23', '0', null, '4115120305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1765', '41151004', '����', '187858', '��', null, null, null, null, '123456', '23', '0', null, '41151004', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1766', '41151202', '���¹�', '187358', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1767', '41151202', '�̽�', '186979', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1768', '41151202', '�Ԡ�', '186978', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1769', '41151202', '����', '189550', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1770', '41151202', '������', '087924', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1771', '41151202', '۳˼��', '186980', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1772', '41151202', '����ס', '186993', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1773', '41151202', '���Ŀ�', '086421', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1774', '41151202', '������', '187020', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1775', '41151202', '����', '187003', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1776', '41151202', '�ֺ�', '187005', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1777', '41151202', '�޳���', '187662', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1778', '41151202', '�', '187359', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1779', '41151202', '�ƺ�ƽ', '087168', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1780', '41151202', '������', '087370', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1781', '41151202', '��־��', '087944', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1782', '41151202', '����', '187665', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1783', '41151202', '����', '186189', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1784', '41151202', '�����', '187663', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1785', '41151202', '֣��', '189085', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1786', '411518', '����', '110', '��', '', null, '', null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '1504598438080', '0', '');
INSERT INTO `employee` VALUES ('1787', '41151803', '�����', '085533', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1788', '41151822', 'κ����', '189386', '��', null, null, null, null, '123456', '23', '0', null, '41151822', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1789', '41151822', '�ẕ̇�', '189581', '��', null, null, null, null, '123456', '23', '0', null, '41151822', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1790', '41151822', '����', '189531', '��', null, null, null, null, '123456', '23', '0', null, '41151822', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1791', '41151822', '������', '189540', '��', null, null, null, null, '123456', '23', '0', null, '41151822', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1792', '41151822', '����', '189397', '��', null, null, null, null, '123456', '23', '0', null, '41151822', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1793', '41151822', '����', '189470', '��', null, null, null, null, '123456', '23', '0', null, '41151822', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1794', '41151824', '�ź�', '189527', '��', null, null, null, null, '123456', '23', '0', null, '41151824', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1795', '41151824', '����', '189478', '��', null, null, null, null, '123456', '23', '0', null, '41151824', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1796', '41151822', '������', '189562', '��', null, null, null, null, '123456', '23', '0', null, '41151822', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1797', '41151838', '����', '085590', '��', null, null, null, null, '123456', '23', '0', null, '41151838', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1798', '41151838', '������', '189483', '��', null, null, null, null, '123456', '23', '0', null, '41151838', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1799', '41151838', '��̫��', '189490', '��', null, null, null, null, '123456', '23', '0', null, '41151838', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1800', '41151801', '��ǿ', '085361', '��', null, null, null, null, '123456', '23', '0', null, '41151801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1801', '41151801', '����', '085451', '��', null, null, null, null, '123456', '23', '0', null, '41151801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1802', '41150216', '����', '188099', '��', null, null, null, null, '123456', '23', '0', null, '41150216', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1803', '41151801', '����ΰ', '189591', '��', null, null, null, null, '123456', '23', '0', null, '41151801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1804', '41151801', '���۾�', '189509', '��', null, null, null, null, '123456', '23', '0', null, '41151801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1805', '41151801', '������', '085615', '��', null, null, null, null, '123456', '23', '0', null, '41151801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1806', '41151805', '�����', '085358', '��', null, null, null, null, '123456', '23', '0', null, '41151805', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1807', '41151805', '������', '189510', '��', null, null, null, null, '123456', '23', '0', null, '41151805', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1808', '41151804', '��־��', '085475', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1809', '41151804', 'κ  ��', '189465', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1810', '41151804', '��  ��', '189599', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1811', '41151804', '��  ��', '189428', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1812', '41151804', '������', '189491', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1813', '41151804', '����ǿ', '189404', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1814', '41151804', '��  ��', '189430', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1815', '41151804', '����', '189401', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1816', '41151825', '����', '189633', '��', null, null, null, null, '123456', '23', '0', null, '41151825', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1817', '41151825', '������', '085627', '��', null, null, null, null, '123456', '23', '0', null, '41151825', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1818', '41151825', 'ţ����', '189595', '��', null, null, null, null, '123456', '23', '0', null, '41151825', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1819', '41151815', '����', '189419', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1820', '41151825', '��ƽ', '189592', '��', null, null, null, null, '123456', '23', '0', null, '41151825', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1821', '41151823', '����', '189506', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1822', '41151823', '���к�', '085667', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1823', '41151823', '��־��', '189583', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1824', '41151823', '����', '189384', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1825', '41151823', '�ź�', '189579', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1826', '41151823', '����', '085613', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1827', '41151823', '��ǿ', '189459', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1828', '41151823', '֣��', '189379', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1829', '41151823', '����', '189615', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1830', '41151823', '������', '189475', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1831', '41151823', '�ſ���', '189473', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1832', '41151823', '������', '085576', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1833', '41151823', '�ƴ��', '085443', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1834', '41151823', '����', '189383', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1835', '41151823', '�Ŵ��', '189533', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1836', '41151840', '���', '085504', '��', null, null, null, null, '123456', '23', '0', null, '41151840', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1837', '41151840', '���', '189421', '��', null, null, null, null, '123456', '23', '0', null, '41151840', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1838', '41151829', '�⿭', '189532', '��', null, null, null, null, '123456', '23', '0', null, '41151829', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1839', '41151829', '���Ļ�', '085352', '��', null, null, null, null, '123456', '23', '0', null, '41151829', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1840', '41151815', '���', '189504', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1841', '41151829', '���', '189409', '��', null, null, null, null, '123456', '23', '0', null, '41151829', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1842', '41151843', '���ΰ', '085401', '��', null, null, null, null, '123456', '23', '0', null, '41151843', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1843', '41151843', '����', '085399', '��', null, null, null, null, '123456', '23', '0', null, '41151843', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1844', '41151808', '��ΰ', '189669', '��', null, null, null, null, '123456', '23', '0', null, '41151808', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1845', '41151808', '�ܿ�', '085403', '��', null, null, null, null, '123456', '23', '0', null, '41151808', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1846', '41151837', '����', '085516', '��', null, null, null, null, '123456', '23', '0', null, '41151837', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1847', '41151837', '�ŷ�', '085474', '��', null, null, null, null, '123456', '23', '0', null, '41151837', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1848', '41151837', '�ܱ�', '189576', '��', null, null, null, null, '123456', '23', '0', null, '41151837', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1849', '41151830', '������', '085511', '��', null, null, null, null, '123456', '23', '0', null, '41151830', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1850', '41151830', '��ƽ', '085575', '��', null, null, null, null, '123456', '23', '0', null, '41151830', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1851', '41151830', '������', '189546', '��', null, null, null, null, '123456', '23', '0', null, '41151830', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1852', '41151803', '�鴺��', '085622', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1853', '41151817', 'ë����', '189389', '��', null, null, null, null, '123456', '23', '0', null, '41151817', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1854', '41151802', '����', '189381', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1855', '41151826', '����', '189607', '��', null, null, null, null, '123456', '23', '0', null, '41151826', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1856', '41151809', '����', '189489', '��', null, null, null, null, '123456', '23', '0', null, '41151809', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1857', '41151834', '����', '085541', '��', null, null, null, null, '123456', '23', '0', null, '41151834', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1858', '41151834', 'Ӻ�', '085633', '��', null, null, null, null, '123456', '23', '0', null, '41151834', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1859', '41151834', '��ΰ', '189561', '��', null, null, null, null, '123456', '23', '0', null, '41151834', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1860', '41151834', 'Ƚ��ΰ', '189622', '��', null, null, null, null, '123456', '23', '0', null, '41151834', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1861', '41151809', '�ź���', '085526', '��', null, null, null, null, '123456', '23', '0', null, '41151809', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1862', '41151809', '����', '189594', '��', null, null, null, null, '123456', '23', '0', null, '41151809', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1863', '41151809', '����', '189571', '��', null, null, null, null, '123456', '23', '0', null, '41151809', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1864', '41151809', 'л�޲�', '189612', '��', null, null, null, null, '123456', '23', '0', null, '41151809', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1865', '41151809', '��ǿ', '189556', '��', null, null, null, null, '123456', '23', '0', null, '41151809', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1866', '41151809', '�����', '085588', '��', null, null, null, null, '123456', '23', '0', null, '41151809', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1867', '41151809', '������', '189522', '��', null, null, null, null, '123456', '23', '0', null, '41151809', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1868', '41151809', '����ΰ', '189548', '��', null, null, null, null, '123456', '23', '0', null, '41151809', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1869', '41151809', '��ΰǿ', '189477', '��', null, null, null, null, '123456', '23', '0', null, '41151809', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1870', '41151809', '��־��', '189552', '��', null, null, null, null, '123456', '23', '0', null, '41151809', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1871', '41151833', '����ǿ', '085636', '��', null, null, null, null, '123456', '23', '0', null, '41151833', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1872', '41151802', '���˳�', '189433', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1873', '41151833', 'Ԭΰ', '189494', '��', null, null, null, null, '123456', '23', '0', null, '41151833', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1874', '41151802', '����', '189411', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1875', '41151831', '����ȫ', '189427', '��', null, null, null, null, '123456', '23', '0', null, '41151831', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1876', '41151831', '����', '085581', '��', null, null, null, null, '123456', '23', '0', null, '41151831', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1877', '41151832', '�ڽ�', '085607', '��', null, null, null, null, '123456', '23', '0', null, '41151832', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1878', '41151832', '������', '189604', '��', null, null, null, null, '123456', '23', '0', null, '41151832', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1879', '41151832', 'л�ؼ�', '189460', '��', null, null, null, null, '123456', '23', '0', null, '41151832', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1880', '41151832', '����', '189435', '��', null, null, null, null, '123456', '23', '0', null, '41151832', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1881', '41151832', '������', '189493', '��', null, null, null, null, '123456', '23', '0', null, '41151832', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1882', '41151835', '������', '189393', '��', null, null, null, null, '123456', '23', '0', null, '41151835', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1883', '41151835', '��ΰ', '189544', '��', null, null, null, null, '123456', '23', '0', null, '41151835', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1884', '41151827', '����', '085447', '��', null, null, null, null, '123456', '23', '0', null, '41151827', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1885', '41151827', '����', '189557', '��', null, null, null, null, '123456', '23', '0', null, '41151827', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1886', '41151842', '����', '085444', '��', null, null, null, null, '123456', '23', '0', null, '41151842', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1887', '41151842', '����', '189462', '��', null, null, null, null, '123456', '23', '0', null, '41151842', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1888', '41151842', '������', '189444', '��', null, null, null, null, '123456', '23', '0', null, '41151842', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1889', '41151839', '����', '189420', '��', null, null, null, null, '123456', '23', '0', null, '41151839', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1890', '41151839', '��һ��', '189485', '��', null, null, null, null, '123456', '23', '0', null, '41151839', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1891', '41151839', '̷��', '085414', '��', null, null, null, null, '123456', '23', '0', null, '41151839', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1892', '41151841', '�', '085384', '��', null, null, null, null, '123456', '23', '0', null, '41151841', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1893', '41151841', '�Ƴ�', '189448', '��', null, null, null, null, '123456', '23', '0', null, '41151841', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1894', '41151841', '�ƾ�', '189417', '��', null, null, null, null, '123456', '23', '0', null, '41151841', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1895', '41151803', '����', '085538', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1896', '41151803', '֣��ǿ', '085417', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1897', '41151803', '��ѵ��', '085402', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1898', '41151803', '����', '189502', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1899', '41151803', '���Ӻ�', '085488', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1900', '41151803', '������', '085473', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1901', '41151803', '��ΰ', '189625', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1902', '41151836', 'Ҧ����', '189374', '��', null, null, null, null, '123456', '23', '0', null, '41151836', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1903', '41151815', '������', '189486', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1904', '41151836', '������', '189408', '��', null, null, null, null, '123456', '23', '0', null, '41151836', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1905', '41151836', '����', '085670', '��', null, null, null, null, '123456', '23', '0', null, '41151836', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1906', '41151828', '����ǿ', '189392', '��', null, null, null, null, '123456', '23', '0', null, '41151828', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1907', '41151817', '���Ӻ�', '085518', '��', null, null, null, null, '123456', '23', '0', null, '41151817', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1908', '41151828', '������', '189410', '��', null, null, null, null, '123456', '23', '0', null, '41151828', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1909', '41151828', '̸  ƽ', '189482', '��', null, null, null, null, '123456', '23', '0', null, '41151828', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1910', '41151802', '��Ȫ', '085324', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1911', '41151802', '����', '189560', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1912', '41151802', '��ΰ', '189501', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1913', '41151802', '����', '189423', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1914', '41151802', 'ɳ��', '085496', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1915', '41151802', '��С��', '189372', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1916', '41151802', '������', '189476', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1917', '41151802', '����', '189605', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1918', '41151802', 'л��', '189382', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1919', '41151802', '������', '189456', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1920', '41151802', '��ΰ', '189537', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1921', '41151802', '����һ', '189468', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1922', '41151802', '�޿���', '189508', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1923', '41151802', '������', '189606', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1924', '41151802', '����', '189469', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1925', '41151802', '�뻶', '189400', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1926', '41151807', '������', '085611', '��', null, null, null, null, '123456', '23', '0', null, '41151807', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1927', '41151806', '����', '085346', '��', null, null, null, null, '123456', '23', '0', null, '41151806', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1928', '41151806', 'Ҧ���', '085654', '��', null, null, null, null, '123456', '23', '0', null, '41151806', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1929', '41151806', '������', '189378', '��', null, null, null, null, '123456', '23', '0', null, '41151806', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1930', '41151806', '�￡', '189623', '��', null, null, null, null, '123456', '23', '0', null, '41151806', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1931', '41151806', '��ϼ', '085409', '��', null, null, null, null, '123456', '23', '0', null, '41151806', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1932', '41151806', '��ӨӨ', '085327', '��', null, null, null, null, '123456', '23', '0', null, '41151806', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1933', '41150202', '�����', '188198', '��', null, null, null, null, '123456', '23', '0', null, '41150202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1934', '41151801', '����', '189586', '��', null, null, null, null, '123456', '23', '0', null, '41151801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1935', '41151828', '�̷�', '085446', '��', null, null, null, null, '123456', '23', '0', null, '41151828', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1936', '41151803', 'л����', '085614', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1937', '41151803', '�����', '085600', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1938', '41151803', '��־��', '085394', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1939', '41151803', '����', '085415', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1940', '41151803', '̷�¹�', '085522', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1941', '41151805', '�÷', '189539', '��', null, null, null, null, '123456', '23', '0', null, '41151805', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1942', '41151808', '�����', '085448', '��', null, null, null, null, '123456', '23', '0', null, '41151808', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1943', '41151808', '�κ�', '189613', '��', null, null, null, null, '123456', '23', '0', null, '41151808', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1944', '41151808', '������', '085572', '��', null, null, null, null, '123456', '23', '0', null, '41151808', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1945', '41151804', '�غ�Ȼ', 'ZA0065', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1946', '41151804', '��˧��', 'ZA0063', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1947', '41151804', '�º���', 'ZA0016', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1948', '41151804', '����', 'ZA0036', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1949', '41151804', '����', 'ZA0066', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1950', '41151804', '��ǿ', 'ZA0009', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1951', '41151804', '����', 'ZA0026', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1952', '41151801', '�޷�', '085569', '��', null, null, null, null, '123456', '23', '0', null, '41151801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1953', '41151801', '������', '085478', '��', null, null, null, null, '123456', '23', '0', null, '41151801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1954', '41151801', '�·�ʤ', '085363', '��', null, null, null, null, '123456', '23', '0', null, '41151801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1955', '41151801', '����', '085665', '��', null, null, null, null, '123456', '23', '0', null, '41151801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1956', '41151801', '������', '085398', '��', null, null, null, null, '123456', '23', '0', null, '41151801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1957', '41151801', '����', '085390', '��', null, null, null, null, '123456', '23', '0', null, '41151801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1958', '41150302', '�Ļݹ�', '087843', '��', null, null, null, null, '123456', '23', '0', null, '41150302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1959', '41151807', '���', '189608', '��', null, null, null, null, '123456', '23', '0', null, '41151807', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1960', '41151807', '�˳���', '085491', '��', null, null, null, null, '123456', '23', '0', null, '41151807', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1961', '41151803', '�����', '085503', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1962', '41151803', '����', '085524', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1963', '41151803', '�̹�ҫ', '085386', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1964', '41151803', '������', '085512', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1965', '41151803', '����', '189563', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1966', '41151803', '��ǿ', '085367', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1967', '41151804', '������', 'ZA0022', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1968', '41151804', '����ҵ', 'ZA0123', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1969', '41151804', '�ų���', 'ZA0027', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1970', '41151804', '���', 'ZA0077', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1971', '41151804', '�ȿ���', 'ZA0057', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1972', '41151804', '���ǿ', 'ZA0071', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1973', '41151804', '���', 'ZA0012', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1974', '41151804', '�뾸��', 'TJ0079', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1975', '41151804', '����', 'ZA0028', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1976', '41151804', '����', 'ZA0042', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1977', '41151804', '����', 'ZA0025', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1978', '41151804', '��̻�', 'ZA0002', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1979', '41151804', '����', 'ZA0037', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1980', '41151804', '�־���', 'ZA0033', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1981', '41151804', '����', 'ZA0018', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1982', '41151804', '��ʨ��', 'ZA0008', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1983', '41151804', '����', 'ZA0075', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1984', '41151804', '��ҫ��', 'ZA0049', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1985', '41151802', '����', '085413', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1986', '41151802', '���', '189438', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1987', '41151802', '��ǿ', '085334', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1988', '41151802', '����', '189589', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1989', '41151802', '��־��', '189441', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1990', '41151802', '����˼', '189572', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1991', '41151802', '������', '189566', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1992', '41151802', '����', '189432', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1993', '41151802', '��ΰ', '189395', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1994', '41151802', '����', '189416', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1995', '41151826', '��ΰ', '189463', '��', null, null, null, null, '123456', '23', '0', null, '41151826', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1996', '41151826', '����ʫ', '189398', '��', null, null, null, null, '123456', '23', '0', null, '41151826', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1997', '41151826', '����', '189422', '��', null, null, null, null, '123456', '23', '0', null, '41151826', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1998', '41151827', '�Խ���', '189507', '��', null, null, null, null, '123456', '23', '0', null, '41151827', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('1999', '41151827', '˾��ΰ', '085624', '��', null, null, null, null, '123456', '23', '0', null, '41151827', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2000', '41151827', '��ҫ��', '189426', '��', null, null, null, null, '123456', '23', '0', null, '41151827', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2001', '41151804', '�����', '189402', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2002', '41151804', '�ƿ�', 'ZA0076', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2003', '41151804', '¬�Ľ�', 'ZA0055', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2004', '41151804', '�Ÿ�', 'ZA0000', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2005', '41151834', '����', '189597', '��', null, null, null, null, '123456', '23', '0', null, '41151834', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2006', '411518', '����', '085508', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2007', '411518', '���¿�', '189388', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2008', '411518', '��ΰ', '085548', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2009', '411518', '��ΰ', '189626', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2010', '411518', '�Ŵ���', '085517', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2011', '411518', 'κ����', '085658', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2012', '411518', 'л����', '085626', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2013', '411518', '�ֲ�', '085387', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2014', '411518', '�¾�', '085378', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2015', '411518', '����', '085539', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2016', '411518', '��ΰ', '085348', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2017', '411518', 'κ����', '085328', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2018', '411518', '����', '085330', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2019', '411518', '����', '085489', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2020', '41151821', '������', '085466', '��', null, null, null, null, '123456', '23', '0', null, '41151821', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2021', '41151821', '�ϼ̺�', '085656', '��', null, null, null, null, '123456', '23', '0', null, '41151821', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2022', '41151821', '��ӱ', '189668', '��', null, null, null, null, '123456', '23', '0', null, '41151821', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2023', '41151821', '֣־��', '085365', '��', null, null, null, null, '123456', '23', '0', null, '41151821', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2024', '41151821', '����', '189629', '��', null, null, null, null, '123456', '23', '0', null, '41151821', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2025', '41151821', '½��', '189678', '��', null, null, null, null, '123456', '23', '0', null, '41151821', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2026', '41151845', '����÷', '085631', '��', null, null, null, null, '123456', '23', '0', null, '41151845', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2027', '41151845', '������', '189503', '��', null, null, null, null, '123456', '23', '0', null, '41151845', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2028', '41151845', '����', '085416', '��', null, null, null, null, '123456', '23', '0', null, '41151845', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2029', '41151845', '����', '085418', '��', null, null, null, null, '123456', '23', '0', null, '41151845', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2030', '411518', '������', '189545', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2031', '41151845', '���»�', '085582', '��', null, null, null, null, '123456', '23', '0', null, '41151845', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2032', '41151845', '��һ��', '189474', '��', null, null, null, null, '123456', '23', '0', null, '41151845', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2033', '41151845', '����', '189603', '��', null, null, null, null, '123456', '23', '0', null, '41151845', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2034', '41151807', '��Ρ', '085662', '��', null, null, null, null, '123456', '23', '0', null, '41151807', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2035', '41151807', '����', '085345', '��', null, null, null, null, '123456', '23', '0', null, '41151807', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2036', '41151807', '¬����', '085493', '��', null, null, null, null, '123456', '23', '0', null, '41151807', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2037', '41151807', '������', '085499', '��', null, null, null, null, '123456', '23', '0', null, '41151807', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2038', '41151807', '����', '085506', '��', null, null, null, null, '123456', '23', '0', null, '41151807', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2039', '41151807', '������', '189387', '��', null, null, null, null, '123456', '23', '0', null, '41151807', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2040', '41151807', '����', '085461', '��', null, null, null, null, '123456', '23', '0', null, '41151807', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2041', '41151807', '������', '085495', '��', null, null, null, null, '123456', '23', '0', null, '41151807', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2042', '41151807', 'л�»�', '085571', '��', null, null, null, null, '123456', '23', '0', null, '41151807', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2043', '41151807', '��ΰ��', '085339', '��', null, null, null, null, '123456', '23', '0', null, '41151807', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2044', '41151810', '������', '085395', '��', null, null, null, null, '123456', '23', '0', null, '41151810', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2045', '41151810', '����', '085645', '��', null, null, null, null, '123456', '23', '0', null, '41151810', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2046', '41151810', '�Ծ�', '085663', '��', null, null, null, null, '123456', '23', '0', null, '41151810', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2047', '41151810', '������', '085433', '��', null, null, null, null, '123456', '23', '0', null, '41151810', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2048', '41151811', '���', '085597', '��', null, null, null, null, '123456', '23', '0', null, '41151811', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2049', '41151811', '����', '085369', '��', null, null, null, null, '123456', '23', '0', null, '41151811', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2050', '41151811', '����', '189582', '��', null, null, null, null, '123456', '23', '0', null, '41151811', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2051', '41151812', 'л��', '085520', '��', null, null, null, null, '123456', '23', '0', null, '41151812', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2052', '41151812', '�����', '085331', '��', null, null, null, null, '123456', '23', '0', null, '41151812', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2053', '41151813', '��ǿ', '189530', '��', null, null, null, null, '123456', '23', '0', null, '41151813', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2054', '41151813', '����', '085351', '��', null, null, null, null, '123456', '23', '0', null, '41151813', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2055', '41151813', '������', '085338', '��', null, null, null, null, '123456', '23', '0', null, '41151813', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2056', '41151813', '����', '085407', '��', null, null, null, null, '123456', '23', '0', null, '41151813', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2057', '41151813', 'ʱ��', '189371', '��', null, null, null, null, '123456', '23', '0', null, '41151813', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2058', '41151813', '�ѻ�', '085647', '��', null, null, null, null, '123456', '23', '0', null, '41151813', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2059', '41151813', '��÷', '085640', '��', null, null, null, null, '123456', '23', '0', null, '41151813', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2060', '41151813', '������', '189558', '��', null, null, null, null, '123456', '23', '0', null, '41151813', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2061', '41151813', '�ž���', '189481', '��', null, null, null, null, '123456', '23', '0', null, '41151813', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2062', '41151813', '���', '189449', '��', null, null, null, null, '123456', '23', '0', null, '41151813', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2063', '41151813', '����÷', '189429', '��', null, null, null, null, '123456', '23', '0', null, '41151813', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2064', '41151813', '��˳��', '189492', '��', null, null, null, null, '123456', '23', '0', null, '41151813', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2065', '41151814', '��¸�', '085452', '��', null, null, null, null, '123456', '23', '0', null, '41151814', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2066', '41151814', '������', '085513', '��', null, null, null, null, '123456', '23', '0', null, '41151814', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2067', '41151814', '����ƽ', '189627', '��', null, null, null, null, '123456', '23', '0', null, '41151814', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2068', '41151814', '����', '189518', '��', null, null, null, null, '123456', '23', '0', null, '41151814', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2069', '41151814', '������', '189619', '��', null, null, null, null, '123456', '23', '0', null, '41151814', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2070', '41151814', '����', '085454', '��', null, null, null, null, '123456', '23', '0', null, '41151814', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2071', '41151815', '������', '085455', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2072', '41151815', '������', '085476', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2073', '41151815', '���ƶ�', '085591', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2074', '41151815', '��ͮ', '189624', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2075', '41151815', '����Ȩ', '085578', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2076', '41151836', '������', '189609', '��', null, null, null, null, '123456', '23', '0', null, '41151836', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2077', '41151815', '����', '189588', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2078', '41151815', '������', '085354', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2079', '41151815', '������', '085530', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2080', '41151841', '֣����', '189553', '��', null, null, null, null, '123456', '23', '0', null, '41151841', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2081', '41151815', '��ΰ', '189375', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2082', '41151815', '����', '085480', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2083', '41151830', '�����', '189610', '��', null, null, null, null, '123456', '23', '0', null, '41151830', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2084', '41151815', '����', '189512', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2085', '41151815', '�˿�', '189434', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2086', '41151815', '����', '189443', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2087', '41151815', '��ǿ', '189442', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2088', '41151802', '����', '189484', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2089', '41151802', '������', '189406', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2090', '41151816', '��ǿ', '189373', '��', null, null, null, null, '123456', '23', '0', null, '41151816', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2091', '41151816', '����', '189575', '��', null, null, null, null, '123456', '23', '0', null, '41151816', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2092', '41151817', '�ƽ���', '085501', '��', null, null, null, null, '123456', '23', '0', null, '41151817', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2093', '41151817', '����', '085419', '��', null, null, null, null, '123456', '23', '0', null, '41151817', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2094', '41151817', '������', '085420', '��', null, null, null, null, '123456', '23', '0', null, '41151817', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2095', '41151817', '������', '085459', '��', null, null, null, null, '123456', '23', '0', null, '41151817', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2096', '41151817', '������', '085344', '��', null, null, null, null, '123456', '23', '0', null, '41151817', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2097', '41151818', '���', '085595', '��', null, null, null, null, '123456', '23', '0', null, '41151818', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2098', '41151818', '�ž�', '189396', '��', null, null, null, null, '123456', '23', '0', null, '41151818', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2099', '41151818', 'Ī���', '085579', '��', null, null, null, null, '123456', '23', '0', null, '41151818', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2100', '41151818', 'ʯϼ', '085634', '��', null, null, null, null, '123456', '23', '0', null, '41151818', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2101', '41151818', '������', '189480', '��', null, null, null, null, '123456', '23', '0', null, '41151818', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2102', '41151818', '�־�', '189596', '��', null, null, null, null, '123456', '23', '0', null, '41151818', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2103', '41151819', '������', '085460', '��', null, null, null, null, '123456', '23', '0', null, '41151819', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2104', '41151819', '���', '085349', '��', null, null, null, null, '123456', '23', '0', null, '41151819', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2105', '41151819', '����', '189568', '��', null, null, null, null, '123456', '23', '0', null, '41151819', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2106', '41151805', '֣��', '085519', '��', null, null, null, null, '123456', '23', '0', null, '41151805', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2107', '41151805', '�����', '189542', '��', null, null, null, null, '123456', '23', '0', null, '41151805', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2108', '41151805', '����', '189620', '��', null, null, null, null, '123456', '23', '0', null, '41151805', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2109', '41151820', '������', '085638', '��', null, null, null, null, '123456', '23', '0', null, '41151820', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2110', '41151820', '������', '085353', '��', null, null, null, null, '123456', '23', '0', null, '41151820', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2111', '41151820', '¬��', '189399', '��', null, null, null, null, '123456', '23', '0', null, '41151820', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2112', '41151820', '����', '085560', '��', null, null, null, null, '123456', '23', '0', null, '41151820', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2113', '41151820', '������', '085630', '��', null, null, null, null, '123456', '23', '0', null, '41151820', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2114', '41151833', '�¿�', '085462', '��', null, null, null, null, '123456', '23', '0', null, '41151833', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2115', '41151833', '����ǿ', '085463', '��', null, null, null, null, '123456', '23', '0', null, '41151833', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2116', '41151802', '����ΰ', '189538', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2117', '41151833', '������', '189437', '��', null, null, null, null, '123456', '23', '0', null, '41151833', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2118', '41151838', '����', '189447', '��', null, null, null, null, '123456', '23', '0', null, '41151838', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2119', '41151840', '��Դ', '085570', '��', null, null, null, null, '123456', '23', '0', null, '41151840', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2120', '41151831', '��Ρ', '085553', '��', null, null, null, null, '123456', '23', '0', null, '41151831', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2121', '41151831', '��ѩ÷', '189541', '��', null, null, null, null, '123456', '23', '0', null, '41151831', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2122', '41151831', '��ǿ', '189578', '��', null, null, null, null, '123456', '23', '0', null, '41151831', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2123', '41151839', 'Ҷ����', '085603', '��', null, null, null, null, '123456', '23', '0', null, '41151839', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2124', '41151839', '�߶�', '189565', '��', null, null, null, null, '123456', '23', '0', null, '41151839', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2125', '41151839', '���侲', '189488', '��', null, null, null, null, '123456', '23', '0', null, '41151839', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2126', '41151822', '���վ�', '189555', '��', null, null, null, null, '123456', '23', '0', null, '41151822', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2127', '41151822', '����', '189580', '��', null, null, null, null, '123456', '23', '0', null, '41151822', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2128', '41151822', '��֥��', '085604', '��', null, null, null, null, '123456', '23', '0', null, '41151822', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2129', '41151822', '���е�', '085458', '��', null, null, null, null, '123456', '23', '0', null, '41151822', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2130', '41151822', '����', '189390', '��', null, null, null, null, '123456', '23', '0', null, '41151822', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2131', '41151840', '�Ŷ�', '189377', '��', null, null, null, null, '123456', '23', '0', null, '41151840', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2132', '41151843', '�����', '189536', '��', null, null, null, null, '123456', '23', '0', null, '41151843', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2133', '41151843', '���³�', '085393', '��', null, null, null, null, '123456', '23', '0', null, '41151843', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2134', '41151843', '��÷', '189425', '��', null, null, null, null, '123456', '23', '0', null, '41151843', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2135', '41151809', '�ļ�', '189440', '��', null, null, null, null, '123456', '23', '0', null, '41151809', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2136', '41151823', '�ź�', '085343', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2137', '41151823', '����', '085602', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2138', '41151823', '����', '085612', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2139', '41151823', '¬����', '189686', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2140', '41151815', '����', '085594', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2141', '41151834', '��ΰ', '085643', '��', null, null, null, null, '123456', '23', '0', null, '41151834', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2142', '41151836', '���з�', '085568', '��', null, null, null, null, '123456', '23', '0', null, '41151836', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2143', '41151835', '������', '085525', '��', null, null, null, null, '123456', '23', '0', null, '41151835', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2144', '41151815', '���', '085628', '��', null, null, null, null, '123456', '23', '0', null, '41151815', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2145', '41151835', '����', '085621', '��', null, null, null, null, '123456', '23', '0', null, '41151835', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2146', '41151837', '������', '189446', '��', null, null, null, null, '123456', '23', '0', null, '41151837', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2147', '41151837', '����ǰ', '189403', '��', null, null, null, null, '123456', '23', '0', null, '41151837', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2148', '41151824', '����', '085439', '��', null, null, null, null, '123456', '23', '0', null, '41151824', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2149', '41151844', '����', '189467', '��', null, null, null, null, '123456', '23', '0', null, '41151844', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2150', '41151804', '�����', '085565', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2151', '41151804', '������', '085410', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2152', '41151828', '����', '189461', '��', null, null, null, null, '123456', '23', '0', null, '41151828', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2153', '41151830', '����', '085450', '��', null, null, null, null, '123456', '23', '0', null, '41151830', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2154', '41151830', '�۹���', '189436', '��', null, null, null, null, '123456', '23', '0', null, '41151830', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2155', '41151803', '�����', '085502', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2156', '41151803', '�ŷ�', '085481', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2157', '41151803', '�۴�', '189689', '��', null, null, null, null, '123456', '23', '0', null, '41151803', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2158', '41151824', '�ſ�', '085457', '��', null, null, null, null, '123456', '23', '0', null, '41151824', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2159', '41151808', '������', '085370', '��', null, null, null, null, '123456', '23', '0', null, '41151808', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2160', '41151806', '�����', '085456', '��', null, null, null, null, '123456', '23', '0', null, '41151806', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2161', '41151801', '�ƽ�', '085430', '��', null, null, null, null, '123456', '23', '0', null, '41151801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2162', '41151801', '̷��', '189500', '��', null, null, null, null, '123456', '23', '0', null, '41151801', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2163', '41151802', '������', '085536', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2164', '41151802', '������', '085405', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2165', '41151802', '��ӱ', '085646', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2166', '41151802', '����', '085648', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2167', '41151802', '����', '189602', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2168', '41151802', '�ź���', '085657', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2169', '41151802', '����', '085661', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2170', '41151802', '������', '189394', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2171', '41151802', '����', '085364', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2172', '41151802', '��ף��', '085449', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2173', '41151802', '������', '085641', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2174', '41151802', '������', '189543', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2175', '41151802', '��ƽ', '085605', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2176', '41151802', '���ľ�', '085573', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2177', '41151802', '����', '189431', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2178', '41151802', 'Ф��', '189391', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2179', '41151802', '����', '189598', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2180', '41151802', '����', '189405', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2181', '41151802', '�̽�', '085529', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2182', '41151802', '���޻�', '189439', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2183', '41151802', '������', '085389', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2184', '41151802', '������', '189585', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2185', '41151802', '�¿���', '189418', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2186', '41151802', '���˾�', '189414', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2187', '41151802', '����ΰ', '189554', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2188', '41151802', '���', '189412', '��', null, null, null, null, '123456', '23', '0', null, '41151802', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2189', '41151829', '������', '189496', '��', null, null, null, null, '123456', '23', '0', null, '41151829', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2190', '41151830', '���', '085453', '��', null, null, null, null, '123456', '23', '0', null, '41151830', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2191', '41151842', '����ȫ', '189587', '��', null, null, null, null, '123456', '23', '0', null, '41151842', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2192', '41151208', '�⽡', '087495', '��', null, null, null, null, '123456', '22', '0', null, '41151208', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2193', '41151804', '����', 'ZA0019', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2194', '41151804', '����', 'ZA0110', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2195', '41151804', '����', 'ZA1111', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2196', '41151804', '������', 'ZA0048', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2197', '411518', '����', '189559', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2198', '41151206', '���', '086101', '��', null, null, null, null, '123456', '22', '0', null, '41151206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2199', '41151206', 'Ҧ��', '086587', '��', null, null, null, null, '123456', '22', '0', null, '41151206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2200', '41151206', '����', '086100', '��', null, null, null, null, '123456', '22', '0', null, '41151206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2201', '41151206', '����', '086600', '��', null, null, null, null, '123456', '22', '0', null, '41151206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2202', '41151206', '����', '087233', '��', null, null, null, null, '123456', '22', '0', null, '41151206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2203', '41151206', '������', '086029', '��', null, null, null, null, '123456', '22', '0', null, '41151206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2204', '41151206', '���', '087253', '��', null, null, null, null, '123456', '22', '0', null, '41151206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2205', '41151206', '������', '086677', '��', null, null, null, null, '123456', '22', '0', null, '41151206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2206', '41151206', '������', '086203', '��', null, null, null, null, '123456', '22', '0', null, '41151206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2207', '41151206', '��־��', '086605', '��', null, null, null, null, '123456', '22', '0', null, '41151206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2208', '41151206', '�ž�', '086102', '��', null, null, null, null, '123456', '22', '0', null, '41151206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2209', '41151206', '�¾���', '186629', '��', null, null, null, null, '123456', '22', '0', null, '41151206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2210', '41151206', '������', '087078', '��', null, null, null, null, '123456', '22', '0', null, '41151206', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2211', '41151207', '�Կ���', '087905', '��', null, null, null, null, '123456', '22', '0', null, '41151207', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2212', '41151207', '�Ž�', '086458', '��', null, null, null, null, '123456', '22', '0', null, '41151207', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2213', '41151207', '������', '087182', '��', null, null, null, null, '123456', '22', '0', null, '41151207', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2214', '41151207', '��ԥ��', '086216', '��', null, null, null, null, '123456', '22', '0', null, '41151207', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2215', '41151207', '�ܵ���', '087704', '��', null, null, null, null, '123456', '22', '0', null, '41151207', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2216', '41151207', '�����', '086403', '��', null, null, null, null, '123456', '22', '0', null, '41151207', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2217', '41151207', '���ҫ', '087260', '��', null, null, null, null, '123456', '22', '0', null, '41151207', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2218', '41151207', 'Ӧ���', '0086458', '��', null, null, null, null, '123456', '22', '0', null, '41151207', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2219', '41151202', '������', '086176', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2220', '41151202', '����ȫ', '087123', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2221', '41151202', '��  ��', '087841', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2222', '41151202', '������', '186201', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2223', '41151202', '��  ��', '087534', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2224', '41151202', '������', '186168', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2225', '41151202', '������', '186165', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2226', '41151202', '÷  ��', '186163', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2227', '41151202', '������', '186166', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2228', '41151202', '������', '186167', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2229', '41151202', '������', '186157', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2230', '41151202', '���Ļ�', '186133', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2231', '41151202', '��  ��', '086187', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2232', '41151202', '��  ��', '087540', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2233', '41151202', '��  ��', '086621', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2234', '41151202', '��άΰ', '186217', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2235', '41151202', 'Ф  ��', '186187', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2236', '41151202', 'л����', '186222', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2237', '41151202', '���Ȼ', '186209', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2238', '41151202', '���', '186131', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2239', '41151202', '��  ��', '186281', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2240', '41151202', '��  �', '086619', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2241', '41151202', '�Ź���', '086596', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2242', '41151202', '�ϳ���', '087303', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2243', '41151202', 'Ҧ����', '086195', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2244', '41151202', '�º���', '086172', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2245', '41151202', '��  ��', '084121', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2246', '41151202', '�콨��', '086197', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2247', '41151202', '�ʺ�ҫ', '086182', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2248', '41151202', '������', 'ZYY', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2249', '41151202', '�½���', '186208', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2250', '41151202', '������', '086590', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2251', '41151202', '�Ų���', '086190', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2252', '41151202', '���', '087766', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2253', '41151202', '������', '086130', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2254', '41151202', '������', '085546', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2255', '41151202', '��־��', '085239', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2256', '41151202', '����', '086351', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2257', '41151202', '������', '086934', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2258', '41151202', '����', '186067', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2259', '41151202', '�ⴺȫ', '087892', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2260', '41151202', '��ҫ��', '086462', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2261', '41151202', '��־��', '187657', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2262', '41151202', '���', '187675', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2263', '41151202', '�����', '187361', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2264', '41151202', '��  ��', '186162', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2265', '41151202', '�����', '186129', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2266', '41151202', 'ʱ  ��', '087816', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2267', '41151202', '��  ��', '086991', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2268', '41151202', 'ף  ǿ', '186130', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2269', '41151202', '����ҫ', '086192', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2270', '41151202', '֣��', '086381', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2271', '41151202', '�ű���', '1986986', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2272', '41151202', '��  ��', '087154', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2273', '41151202', '��  ��', '087510', '��', null, null, null, null, '123456', '22', '0', null, '41151202', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2274', '41151827', '�ż���', '085340', '��', null, null, null, null, '123456', '23', '0', null, '41151827', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2275', '41151201', '�ź���', '084680', '��', null, null, null, null, '123456', '22', '0', null, '41151201', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2276', '411517', '�ܳ���', '185721', '��', null, null, null, null, '123456', '22', '0', null, '411517', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2277', '4115', '�ⴺ��', '087397', '��', null, null, null, null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2278', '4115', '��ǿ', '086961', '��', null, null, null, null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2279', '4115', '��ΰ', '186202', '��', null, null, null, null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2280', '4115', '�Ʊ�', '187635', '��', null, null, null, null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2281', '4115', '����', '086440', '��', null, null, null, null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2282', '4115', '�', '186159', '��', null, null, null, null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2283', '4115', '�⽨ΰ', '086537', '��', null, null, null, null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2284', '4115', '���', '186931', '��', null, null, null, null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2285', '4115', '���', '085547', '��', null, null, null, null, '123456', '19', '0', null, '4115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2286', '41150605', '��־��', '086261', '��', null, null, null, null, '123456', '23', '0', null, '41150605', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2287', '411518', 'tc', 'TC', '��', null, null, null, null, '123456', '22', '0', null, '411518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2288', '4115121314', '����', '000216', '��', null, null, null, null, '123456', '22', '0', null, '4115121314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2289', '4115121310', '�̹�', '084065', '��', null, null, null, null, '123456', '23', '0', null, '4115121310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2290', '4115121307', '���r', '084360', '��', null, null, null, null, '123456', '23', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2291', '4115121310', '���и�', '084829', '��', null, null, null, null, '123456', '23', '0', null, '4115121310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2292', '4115121313', 'Ҧ����', '085099', '��', null, null, null, null, '123456', '23', '0', null, '4115121313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2293', '4115121307', '������', '085125', '��', null, null, null, null, '123456', '23', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2294', '41151213', '���ƽ', '085286', '��', null, null, null, null, '123456', '23', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2295', '411512132306', '�»�', '085691', '��', null, null, null, null, '123456', '23', '0', null, '411512132306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2296', '411512132309', '������', '085698', '��', null, null, null, null, '123456', '23', '0', null, '411512132309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2297', '411512132308', '������', '085702', '��', null, null, null, null, '123456', '23', '0', null, '411512132308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2298', '411512132308', '����', '085706', '��', null, null, null, null, '123456', '23', '0', null, '411512132308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2299', '411512132306', '����', '085709', '��', null, null, null, null, '123456', '23', '0', null, '411512132306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2300', '4115121317', '��֪��', '085740', '��', null, null, null, null, '123456', '22', '0', null, '4115121317', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2301', '411512132304', '������', '085759', '��', null, null, null, null, '123456', '23', '0', null, '411512132304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2302', '411512132309', '������', '085766', '��', null, null, null, null, '123456', '23', '0', null, '411512132309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2303', '411512132306', '����', '085817', '��', null, null, null, null, '123456', '23', '0', null, '411512132306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2304', '4115121323', '�����', '085818', '��', null, null, null, null, '123456', '22', '0', null, '4115121323', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2305', '4115121323', '������', '085825', '��', null, null, null, null, '123456', '22', '0', null, '4115121323', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2306', '411512132307', '������', '085826', '��', null, null, null, null, '123456', '23', '0', null, '411512132307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2307', '411512132310', '�󷢽�', '085837', '��', null, null, null, null, '123456', '23', '0', null, '411512132310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2308', '411512132309', '���¸�', '085856', '��', null, null, null, null, '123456', '23', '0', null, '411512132309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2309', '411512132301', '�����', '085857', '��', null, null, null, null, '123456', '23', '0', null, '411512132301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2310', '411512132310', '�º���', '085886', '��', null, null, null, null, '123456', '23', '0', null, '411512132310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2311', '411512132304', '���ʴ�', '085927', '��', null, null, null, null, '123456', '23', '0', null, '411512132304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2312', '411512132304', '������', '085968', '��', null, null, null, null, '123456', '23', '0', null, '411512132304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2313', '411512132309', '���Ԫ', '085983', '��', null, null, null, null, '123456', '23', '0', null, '411512132309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2314', '4115121323', '������', '085989', '��', null, null, null, null, '123456', '22', '0', null, '4115121323', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2315', '411512132306', '������', '085991', '��', null, null, null, null, '123456', '23', '0', null, '411512132306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2316', '4115121305', '����', '086043', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2317', '4115121307', '�����', '086051', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2318', '4115121311', '��ΰ', '086333', '��', null, null, null, null, '123456', '22', '0', null, '4115121311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2319', '4115121308', '����', '086437', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2320', '4115121314', '����', '086666', '��', null, null, null, null, '123456', '22', '0', null, '4115121314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2321', '4115121318', '¬��ƽ', '086668', '��', null, null, null, null, '123456', '22', '0', null, '4115121318', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2322', '4115121315', '֣�', '086676', '��', null, null, null, null, '123456', '22', '0', null, '4115121315', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2323', '4115121317', '���㾲', '086679', '��', null, null, null, null, '123456', '22', '0', null, '4115121317', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2324', '4115121319', '����', '086680', '��', null, null, null, null, '123456', '22', '0', null, '4115121319', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2325', '4115121313', '�Ʒ�', '086681', '��', null, null, null, null, '123456', '22', '0', null, '4115121313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2326', '4115121315', '������', '086682', '��', null, null, null, null, '123456', '22', '0', null, '4115121315', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2327', '4115121307', '����', '086695', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2328', '4115121319', '�ܽ���', '086696', '��', null, null, null, null, '123456', '22', '0', null, '4115121319', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2329', '4115121309', '�����', '086712', '��', null, null, null, null, '123456', '22', '0', null, '4115121309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2330', '4115121307', '֣����', '086718', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2331', '41151213', '����', '086730', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2332', '4115121311', '��ϼ', '086737', '��', null, null, null, null, '123456', '22', '0', null, '4115121311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2333', '4115121307', '���̺�', '086738', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2334', '4115121307', 'Ѧ�˻�', '086752', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2335', '4115121314', '���ո�', '086756', '��', null, null, null, null, '123456', '22', '0', null, '4115121314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2336', '4115121319', '���ٻ�', '086758', '��', null, null, null, null, '123456', '22', '0', null, '4115121319', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2337', '4115121304', '���޺�', '086765', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2338', '4115121311', '������', '086767', '��', null, null, null, null, '123456', '22', '0', null, '4115121311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2339', '4115121317', '��־��', '086770', '��', null, null, null, null, '123456', '22', '0', null, '4115121317', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2340', '4115121305', '����', '086772', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2341', '4115121309', '����', '086784', '��', null, null, null, null, '123456', '22', '0', null, '4115121309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2342', '4115121307', '�ܴ���', '086786', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2343', '4115121304', '�ư���', '086787', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2344', '4115121309', '��ʤǿ', '086790', '��', null, null, null, null, '123456', '22', '0', null, '4115121309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2345', '4115121305', '������', '086801', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2346', '4115121307', '���', '086803', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2347', '4115121307', '�º���', '086805', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2348', '4115121307', '������', '086808', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2349', '4115121319', '��Զ��', '086812', '��', null, null, null, null, '123456', '22', '0', null, '4115121319', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2350', '4115121319', '������', '086813', '��', null, null, null, null, '123456', '22', '0', null, '4115121319', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2351', '41151213', '������', '086815', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2352', '4115121307', '����', '086819', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2353', '4115121308', '��ȫ��', '086822', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2354', '4115121306', '����Ρ', '086824', '��', null, null, null, null, '123456', '22', '0', null, '4115121306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2355', '4115121312', '���鰲', '086828', '��', null, null, null, null, '123456', '22', '0', null, '4115121312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2356', '4115121316', '����', '086830', '��', null, null, null, null, '123456', '22', '0', null, '4115121316', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2357', '4115121305', 'л��', '086831', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2358', '4115121303', '�����', '086832', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2359', '4115121311', '����', '086836', '��', null, null, null, null, '123456', '22', '0', null, '4115121311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2360', '4115121307', '�����', '086837', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2361', '4115121304', '��ȫʤ', '086839', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2362', '4115121309', '��ұ�', '086840', '��', null, null, null, null, '123456', '22', '0', null, '4115121309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2363', '4115121303', '��͢', '086842', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2364', '4115121310', '����', '086845', '��', null, null, null, null, '123456', '22', '0', null, '4115121310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2365', '4115121305', '�ܿ���', '086846', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2366', '4115121302', '����ȫ', '086848', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2367', '4115121304', '��ɽ', '086849', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2368', '4115121307', '�����', '086852', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2369', '4115121307', '����', '086855', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2370', '4115121304', '������', '086856', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2371', '4115121314', '������', '086858', '��', null, null, null, null, '123456', '22', '0', null, '4115121314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2372', '4115121314', '����', '086863', '��', null, null, null, null, '123456', '22', '0', null, '4115121314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2373', '4115121303', '��ѧ��', '086867', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2374', '4115121307', '��С��', '086873', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2375', '4115121311', '�', '086888', '��', null, null, null, null, '123456', '22', '0', null, '4115121311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2376', '4115121312', '�����', '086891', '��', null, null, null, null, '123456', '22', '0', null, '4115121312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2377', '4115121305', '���鸻', '086895', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2378', '41151213', '��ϲ', '086896', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2379', '4115121311', '����', '086899', '��', null, null, null, null, '123456', '22', '0', null, '4115121311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2380', '4115121305', '���', '086903', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2381', '4115121305', '����ƽ', '086904', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2382', '411512130102', '���н�', '086905', '��', null, null, null, null, '123456', '23', '0', null, '411512130102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2383', '4115121307', '���', '086911', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2384', '4115121307', '�ư�ƽ', '086916', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2385', '4115121319', '���', '086918', '��', null, null, null, null, '123456', '22', '0', null, '4115121319', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2386', '4115121316', '����', '086921', '��', null, null, null, null, '123456', '22', '0', null, '4115121316', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2387', '4115121301', '��ù�', '086922', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2388', '4115121308', '��Ȫ��', '086925', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2389', '4115121307', '������', '086926', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2390', '41151213', '�మ��', '086932', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2391', '4115121306', '������', '086938', '��', null, null, null, null, '123456', '22', '0', null, '4115121306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2392', '4115121308', '��־��', '086949', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2393', '4115121303', '����', '086956', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2394', '4115121308', '���ΰ�', '086966', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2395', '4115121305', '��̺�', '086973', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2396', '4115121308', '����', '086978', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2397', '4115121318', '�Ӹ�ѧ', '086979', '��', null, null, null, null, '123456', '22', '0', null, '4115121318', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2398', '4115121310', '����', '086983', '��', null, null, null, null, '123456', '22', '0', null, '4115121310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2399', '4115121311', '���Ǻ�', '086990', '��', null, null, null, null, '123456', '22', '0', null, '4115121311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2400', '4115121308', '�Ų�', '086992', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2401', '4115121309', '������', '086996', '��', null, null, null, null, '123456', '22', '0', null, '4115121309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2402', '41151213', '�ι���', '086999', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2403', '4115121308', '������', '087211', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2404', '4115121314', 'Ҧ��ϼ', '087252', '��', null, null, null, null, '123456', '22', '0', null, '4115121314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2405', '4115121305', '����', '087407', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2406', '4115121307', '��ΰ', '087543', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2407', '4115121315', '����', '087583', '��', null, null, null, null, '123456', '22', '0', null, '4115121315', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2408', '4115121313', '��ƽ', '087610', '��', null, null, null, null, '123456', '22', '0', null, '4115121313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2409', '4115121309', '�ν�', '087810', '��', null, null, null, null, '123456', '22', '0', null, '4115121309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2410', '4115121314', 'ղȫ��', '087850', '��', null, null, null, null, '123456', '22', '0', null, '4115121314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2411', '4115121320', '����', '088079', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2412', '4115121320', '��Ӧ��', '088106', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2413', '4115121320', '������', '088196', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2414', '4115121320', '�ﲨ', '088208', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2415', '4115121320', '����', '088216', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2416', '4115121320', '������', '088238', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2417', '4115121320', '���ҳ�', '088262', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2418', '4115121320', '������', '088263', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2419', '4115121320', '������', '088345', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2420', '4115121320', '�¹���', '088350', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2421', '4115121320', '������', '123321', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2422', '4115121322', '��־��', '088406', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2423', '4115121322', '����', '088409', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2424', '4115121322', '��͢��', '088429', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2425', '4115121322', '�̸�', '088452', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2426', '4115121322', '��־Զ', '088459', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2427', '4115121322', '������', '088465', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2428', '4115121322', '����', '088466', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2429', '4115121322', '����˫', '088469', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2430', '4115121322', '�´���', '088478', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2431', '4115121322', '��ΰ', '088489', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2432', '4115121322', '�˹�֥', '088493', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2433', '4115121322', '��ŵ', '088515', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2434', '4115121322', '������', '088529', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2435', '4115121316', 'ʯ��', '088548', '��', null, null, null, null, '123456', '22', '0', null, '4115121316', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2436', '4115121322', '�¬B', '088626', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2437', '4115121309', 'ǿ�˻�', 'ǿ�˻�', '��', null, null, null, null, '123456', '22', '0', null, '4115121309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2438', '4115121309', '����', '����', '��', null, null, null, null, '123456', '22', '0', null, '4115121309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2439', '411512132303', '�¸�', '085771', '��', null, null, null, null, '123456', '23', '0', null, '411512132303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2440', '411512132310', '���', '085820', '��', null, null, null, null, '123456', '23', '0', null, '411512132310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2441', '411512132310', '����', '085834', '��', null, null, null, null, '123456', '23', '0', null, '411512132310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2442', '411512132302', '����', '085855', '��', null, null, null, null, '123456', '23', '0', null, '411512132302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2443', '411512132311', '���', '085867', '��', null, null, null, null, '123456', '23', '0', null, '411512132311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2444', '411512132305', '֣����', '085926', '��', null, null, null, null, '123456', '23', '0', null, '411512132305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2445', '411512132303', '������', '085969', '��', null, null, null, null, '123456', '23', '0', null, '411512132303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2446', '411512132306', '֣����', '085985', '��', null, null, null, null, '123456', '23', '0', null, '411512132306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2447', '41151213', '��Ӧ��', '086030', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2448', '4115121308', '��Ƚ', '086367', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2449', '4115121318', '����', '086667', '��', null, null, null, null, '123456', '22', '0', null, '4115121318', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2450', '41151213', '����', '086678', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2451', '4115121310', '���ʹ�', '086683', '��', null, null, null, null, '123456', '22', '0', null, '4115121310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2452', '4115121314', '������', '086717', '��', null, null, null, null, '123456', '22', '0', null, '4115121314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2453', '4115121305', '�ſ���', '086732', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2454', '4115121305', '����', '086747', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2455', '4115121304', '����', '086763', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2456', '4115121301', '�¶���', '086768', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2457', '4115121308', '��̫��', '086782', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2458', '4115121311', '��÷', '086785', '��', null, null, null, null, '123456', '22', '0', null, '4115121311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2459', '4115121303', '������', '086791', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2460', '4115121303', '������', '086806', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2461', '4115121305', '����', '086814', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2462', '4115121317', '������', '086816', '��', null, null, null, null, '123456', '22', '0', null, '4115121317', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2463', '4115121303', '��Զ', '086827', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2464', '4115121311', '���Ź�', '086928', '��', null, null, null, null, '123456', '22', '0', null, '4115121311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2465', '4115121303', '����', '086952', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2466', '4115121302', '������', '086968', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2467', '411512130103', '����', '086993', '��', null, null, null, null, '123456', '23', '0', null, '411512130103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2468', '4115121304', '����', '087008', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2469', '4115121304', '�Һ�', '087285', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2470', '4115121306', '���', '087422', '��', null, null, null, null, '123456', '22', '0', null, '4115121306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2471', '4115121305', '��ͨ', '087632', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2472', '41151213', '������', '087999', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2473', '4115121320', '������', '088110', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2474', '4115121307', '������', '088217', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2475', '4115121320', '���ڲ�', '088253', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2476', '4115121320', '���Զ', '088311', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2477', '4115121320', '����', '088384', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2478', '4115121322', '����', '088411', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2479', '4115121311', '�Ʊ�', '088456', '��', null, null, null, null, '123456', '22', '0', null, '4115121311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2480', '4115121322', '����', '088468', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2481', '4115121322', '����', '088486', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2482', '4115121322', '���б�', '088498', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2483', '4115121322', '����', '088603', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2484', '4115121322', '������', '185723', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2485', '4115121307', '�߸���', '186288', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2486', '4115121308', '������', '186663', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2487', '4115121307', '�����', '186669', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2488', '4115121303', '��·��', '186689', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2489', '4115121305', '�����', '186699', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2490', '4115121304', '����', '186768', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2491', '4115121301', '����־', '186778', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2492', '4115121304', '������', '186789', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2493', '4115121301', '����ΰ', '186799', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2494', '41151213', '�º�', '088669', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2495', '4115121322', '÷ʿѧ', '088673', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2496', '4115121322', 'Ϳ����', '088676', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2497', '4115121322', '����', '088679', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2498', '41151213', '�����', '088757', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2499', '4115121321', '����', '088787', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2500', '4115121321', '�ι⺣', '088799', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2501', '4115121321', '���β�', '088848', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2502', '4115121321', '������', '088868', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2503', '4115121321', '��ΰ', '088878', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2504', '4115121314', '����', '088909', '��', null, null, null, null, '123456', '22', '0', null, '4115121314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2505', '4115121321', '��ΰ', '088911', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2506', '4115121321', '������', '088921', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2507', '4115121321', '������', '088923', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2508', '4115121321', '����ʤ', '088975', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2509', '4115121321', '���ɽ', '088987', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2510', '4115121322', '��־ɽ', '088499', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2511', '4115121301', '����', '123', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2512', '41151811', '���S', '185001', '��', null, null, null, null, '123456', '22', '0', null, '41151811', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2513', '411512132310', '������', '185006', '��', null, null, null, null, '123456', '23', '0', null, '411512132310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2514', '411512132309', 'ʦ����', '185026', '��', null, null, null, null, '123456', '23', '0', null, '411512132309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2515', '411512132305', 'Ԭ�Ѷ�', '185031', '��', null, null, null, null, '123456', '23', '0', null, '411512132305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2516', '411512132302', '������', '185036', '��', null, null, null, null, '123456', '23', '0', null, '411512132302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2517', '411512132306', '������', '185099', '��', null, null, null, null, '123456', '23', '0', null, '411512132306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2518', '4115121320', '����', '185361', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2519', '41151405', '�Ʊ���', '185393', '��', null, null, null, null, '123456', '23', '0', null, '41151405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2520', '4115121320', '�ջ�', '185396', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2521', '4115121322', '����ʢ', '185671', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2522', '4115121322', '�ຣ��', '185672', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2523', '4115121322', '���', '185675', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2524', '4115121322', '����ΰ', '185676', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2525', '4115121322', 'л��', '185746', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2526', '4115121322', '����', '185753', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2527', '4115121306', '����', '186602', '��', null, null, null, null, '123456', '22', '0', null, '4115121306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2528', '4115121307', '����', '186606', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2529', '4115121304', '�ź���', '186615', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2530', '4115121308', '����ƽ', '186618', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2531', '4115121314', '����', '186619', '��', null, null, null, null, '123456', '22', '0', null, '4115121314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2532', '4115121310', '���', '186666', '��', null, null, null, null, '123456', '22', '0', null, '4115121310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2533', '4115121303', '�����', '186668', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2534', '4115121306', '���', '186681', '��', null, null, null, null, '123456', '22', '0', null, '4115121306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2535', '4115121305', 'Ҧ����', '186692', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2536', '4115121304', '��ΰ', '186693', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2537', '4115121302', '����˳', '186718', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2538', '4115121302', '̷��ΰ', '186719', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2539', '4115121303', '��ΰ��', '186766', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2540', '4115121304', '����', '186776', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2541', '4115121304', '������', '186780', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2542', '4115121306', '������', '186786', '��', null, null, null, null, '123456', '22', '0', null, '4115121306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2543', '4115121303', '�׾�ΰ', '186790', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2544', '4115121303', '������', '186791', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2545', '4115121301', '���ǿ', '186805', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2546', '4115121307', 'Ѧ�ֶ�', '186806', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2547', '4115121312', '��ΰ��', '186809', '��', null, null, null, null, '123456', '22', '0', null, '4115121312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2548', '4115121303', '�ű�', '186822', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2549', '4115121307', '������', '186829', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2550', '4115121307', 'Ҧ־��', '186855', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2551', '4115121316', '����ҫ', '186866', '��', null, null, null, null, '123456', '22', '0', null, '4115121316', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2552', '4115121301', '�ƽ�', '186878', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2553', '4115121308', '��Ȫ��', '186880', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2554', '4115121304', '�Ϻ���', '186888', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2555', '4115121301', '����', '186896', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2556', '4115121321', '����', '189825', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2557', '4115121321', '�ſ���', '189850', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2558', '4115121321', '��ΰ��', '189871', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2559', '4115121321', '����', '189881', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2560', '4115121321', '�ۼ���', '189886', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2561', '4115121321', '����', '189906', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2562', '4115121321', '���', '189933', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2563', '4115121321', '����', '189989', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2564', '4115121322', '������', '088637', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2565', '4115121302', '�ϻ���', 'BHL', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2566', '4115121301', '�ͽ���', 'BJD', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2567', '4115121301', '�¾���', 'CJW', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2568', '411512132301', '������', 'CLX', '��', null, null, null, null, '123456', '23', '0', null, '411512132301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2569', '4115121302', '������', '186685', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2570', '4115121301', '������', '186662', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2571', '4115121301', '���', 'FH', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2572', '4115121301', '����', 'FL', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2573', '4115121301', '������', 'FLY', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2574', '4115121323', '������', 'FPC', '��', null, null, null, null, '123456', '22', '0', null, '4115121323', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2575', '4115121302', '���', 'FT', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2576', '4115121301', '������', 'FYY', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2577', '4115121301', '����', 'GF', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2578', '4115121301', '�߻�', 'GH', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2579', '4115121320', '��ɽ����', 'GSJJ', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2580', '4115121301', '������', 'GXY', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2581', '4115121301', '����ʤ', 'GYS', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2582', '4115121301', '���涫', '086771', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2583', '4115121301', '�ư���', '186899', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2584', '4115121323', '��������', 'HBJJ', '��', null, null, null, null, '123456', '22', '0', null, '4115121323', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2585', '4115121304', '�ݴ�Ծ', 'HCY', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2586', '4115121302', '�ƹ���', '086623', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2587', '4115121301', '����', 'HH', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2588', '4115121308', '�ƺ���', 'HHB', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2589', '4115121301', '�ƿ�', 'HJ', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2590', '4115121308', '�ƽ���', 'HJJ', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2591', '4115121301', '�¾�ë', '087007', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2592', '41151213', '���ľ�', 'HWJ', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2593', '4115121309', '�ۿ˳�', 'KKC', '��', null, null, null, null, '123456', '22', '0', null, '4115121309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2594', '4115121301', '������', 'KWD', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2595', '4115121301', '������', 'LCD', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2596', '4115121302', '�λ�', 'LH', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2597', '4115121302', '���', '186770', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2598', '411512132308', '���', 'LJH', '��', null, null, null, null, '123456', '23', '0', null, '411512132308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2599', '4115121302', '�ּ̾�', 'LJJ', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2600', '4115121301', '��ǿ', '186696', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2601', '4115121301', '���ܷ�', 'LSF', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2602', '4115121301', '��Ρ', 'LW', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2603', '4115121301', '���ľ�', 'LWJ', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2604', '4115121301', '��ϲ��', '186801', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2605', '4115121301', '������', 'LYQ', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2606', '4115121301', '������', 'LZY', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2607', '4115121302', '����', 'PP', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2608', '4115121302', '����Ƽ', '186679', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2609', '41151213', 'ǿ�˻�', 'QYH', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2610', '4115121301', '����', 'RY', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2611', '4115121301', '����', '186627', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2612', '4115121304', '�հ���', 'SAM', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2613', '4115121301', '�￡��', 'SJR', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2614', '4115121302', '˾ǿ', '086902', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2615', '4115121302', '��ΰ', '086887', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2616', '4115121302', '����', '086731', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2617', '4115121301', '�վ�', 'TJ', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2618', '4115121301', '������', 'WCQ', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2619', '4115121302', '���ΰ', '186608', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2620', '4115121301', '������', 'WHT', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2621', '4115121301', '������', '086798', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2622', '4115121301', '�����', 'WYJ', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2623', '4115121307', '������', 'WYZ', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2624', '411512130103', 'Э��', 'XG', '��', null, null, null, null, '123456', '23', '0', null, '411512130103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2625', '41151213', '��������', 'XYJJ', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2626', '4115121302', '������', 'YAJ', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2627', '4115121301', '�Ʊ�', 'YB', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2628', '4115121320', '�̷�', 'YF', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2629', '4115121301', 'Ԭ��', 'YJ', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2630', '41151213', '����', 'YL', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2631', '4115121302', '������', '186686', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2632', '4115121302', '�����', '086857', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2633', '4115121304', '������', 'YXD', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2634', '4115121303', '������', 'YXY', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2635', '4115121309', '��С��', 'Z', '��', null, null, null, null, '123456', '22', '0', null, '4115121309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2636', '4115121301', '�ܹ��', 'ZGJ', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2637', '4115121302', '�ܺ�', 'ZH', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2638', '4115121301', '�ž�', 'ZJ.', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2639', '4115121307', '�ܾ���', 'ZJL', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2640', '4115121301', 'տ��', 'ZL', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2641', '4115121301', '������', 'ZLG', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2642', '4115121302', '��ƽ��', 'ZPS', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2643', '4115121301', '����', 'ZQ', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2644', '4115121301', '������', 'ZSM', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2645', '4115121307', '������', 'ZXH', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2646', '4115121309', '����', 'ZY', '��', null, null, null, null, '123456', '22', '0', null, '4115121309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2647', '4115121301', '����', 'ZYF', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2648', '4115121302', '������', '086854', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2649', '41151213', 'Ф����', 'ZGCG03', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2650', '4115121307', '������', 'zgcg11', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2651', '4115121304', 'ѧԱ2', '037602', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2652', '4115121304', 'ѧԱ8', '037608', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2653', '4115121303', 'ѧԱ9', '037609', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2654', '4115121302', 'ѧԱ18', '037618', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2655', '4115121301', '�¹�', '186622', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2656', '4115121320', '���', '185381', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2657', '4115121322', '�̳���', '185735', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2658', '4115121322', '���в�', '088477', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2659', '4115121301', '���', '086759', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2660', '4115121301', '��ΰ', 'ZW', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2661', '4115121302', '������', 'ZQM', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2662', '4115121307', '����', '086907', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2663', '4115121308', '����', '186819', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2664', '4115121311', '�����', '086890', '��', null, null, null, null, '123456', '22', '0', null, '4115121311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2665', '4115121320', '������', '088224', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2666', '4115121321', 'ʩ�¿�', '088918', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2667', '4115121322', '����', '185705', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2668', '411512132304', '���ʴ�2', 'WA', '��', null, null, null, null, '123456', '23', '0', null, '411512132304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2669', '41151213', '��Զ��', '086886', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2670', '41151213', '�ۿ˳�', '186788', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2671', '4115121302', '�����', '086783', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2672', '4115121320', '����', '088318', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2673', '4115121302', 'ѧԱ13', '037613', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2674', '4115121302', '�¹�2��', '000002', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2675', '4115121302', '�¹�5��', '000005', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2676', '4115121302', 'ƽ���ж�1��', '000006', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2677', '4115121302', '�������ж�1��', '000021', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2678', '4115121301', '��һ·�ж�һ', '100003', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2679', '4115121301', '�¹��ж�6', '100021', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2680', '4115121320', '���', '088213', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2681', '4115121320', '��־��', '185515', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2682', '4115121320', '������', '088151', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2683', '4115121321', '����', '189968', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2684', '4115121322', '������', '088696', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2685', '4115121304', 'ѧԱ3', '037603', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2686', '4115121304', 'ѧԱ7', '037607', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2687', '4115121303', 'ѧԱ10', '037610', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2688', '4115121303', 'ѧԱ11', '037611', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2689', '4115121303', 'ѧԱ12', '037612', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2690', '4115121302', 'ѧԱ14', '037614', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2691', '4115121302', 'ѧԱ17', '037617', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2692', '4115121302', 'ѧԱ19', '037619', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2693', '4115121302', 'ѧԱ20', '037620', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2694', '4115121302', 'ѧԱ21', '037621', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2695', '4115121302', 'ѧԱ22', '037622', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2696', '4115121302', '���M', '186683', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2697', '4115121302', '�������ж�1��', '000011', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2698', '4115121302', '�������ж�2��', '000012', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2699', '4115121302', '�������ж�3��', '000013', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2700', '4115121302', '��ɽ�ж�2��', '000017', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2701', '4115121302', '��ɽ�ж�3��', '000018', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2702', '4115121302', '�������ж�2��', '000022', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2703', '4115121301', '��һ·�ж�2', '100004', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2704', '4115121301', '��Ǵ���ж�2', '100007', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2705', '4115121301', '�����ж�1', '100008', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2706', '4115121301', '�Լ����ж�1', '100009', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2707', '4115121301', '�����ж�1', '100014', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2708', '4115121301', 'ʮ�������ж�1', '100015', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2709', '4115121301', '�¹��ж�1', '100016', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2710', '4115121301', '�¹��ж�2', '100017', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2711', '4115121301', '�¹��ж�5', '100020', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2712', '4115121307', '��·ǿ', '666', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2713', '4115121303', '����', 'MGGQ001', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2714', '4115121303', '���', 'MGGQ003', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2715', '411512132003', '������', '088218', '��', null, null, null, null, '123456', '23', '0', null, '411512132003', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2716', '4115121320', '������', '088324', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2717', '4115121304', 'ѧԱ5', '037605', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2718', '4115121302', '�¹�1��', '000001', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2719', '4115121302', '�¹�4��', '000004', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2720', '4115121302', 'ƽ���ж�3��', '000008', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2721', '4115121302', '�������ж�4��', '000014', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2722', '4115121302', '�������ж�5��', '000015', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2723', '4115121302', '��ɽ�ж�1��', '000016', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2724', '4115121302', '��ɽ�ж�4��', '000019', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2725', '4115121302', '��ɽ�ж�5��', '000020', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2726', '4115121302', '�������ж�3��', '000023', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2727', '4115121302', '��ҵ���ж�2��', '000025', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2728', '4115121301', '��վ�ж�1', '100001', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2729', '4115121301', '��վ�ж�2', '100002', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2730', '4115121301', '�����ж�һ', '100012', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2731', '4115121301', '�¹��ж�3', '100018', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2732', '411512132003', '����', '185069', '��', null, null, null, null, '123456', '23', '0', null, '411512132003', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2733', '411512132003', '���', '185365', '��', null, null, null, null, '123456', '23', '0', null, '411512132003', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2734', '4115121301', '�żһ�', 'ZJH', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2735', '4115121303', '���·�', '087408', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2736', '4115121304', 'ѧԱ6', '037606', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2737', '4115121301', '���廪', '186815', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2738', '4115121303', '������', '186823', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2739', '4115121305', '������', '186856', '��', null, null, null, null, '123456', '22', '0', null, '4115121305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2740', '4115121316', '������', '186886', '��', null, null, null, null, '123456', '22', '0', null, '4115121316', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2741', '4115121321', '�⿡', '189875', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2742', '4115121321', '�����', '189890', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2743', '4115121321', '�찲��', '189978', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2744', '4115121301', '�·���', 'CFS', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2745', '4115121302', '����', '086793', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2746', '4115121302', '������', 'LSX', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2747', '4115121302', '�����', 'LYF', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2748', '4115121304', '����', '186898', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2749', '4115121302', '����ΰ', 'QWW', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2750', '41151213', '����', 'SAKURA', '��', null, null, null, null, '123456', '19', '0', null, '41151213', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2751', '411512132301', '������', 'SLH', '��', null, null, null, null, '123456', '22', '0', null, '411512132301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2752', '4115121307', '������', 'SXL', '��', null, null, null, null, '123456', '22', '0', null, '4115121307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2753', '4115121302', 'Ϳ�ٻ�', '086910', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2754', '4115121301', '���', 'WF', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2755', '411512132304', '���ʴ�1', 'WR', '��', null, null, null, null, '123456', '23', '0', null, '411512132304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2756', '4115121309', '�మ��', 'YAH', '��', null, null, null, null, '123456', '22', '0', null, '4115121309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2757', '4115121301', '�', 'YC', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2758', '4115121302', 'Ҧ�ҿ�', 'YJJ', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2759', '4115121301', '���', 'YT', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2760', '4115121302', 'Ԭ־ʤ', '086809', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2761', '4115121301', 'ף��ɽ', '186620', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2762', '4115121301', '�Ž�', 'ZJ', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2763', '4115121302', '����', '086909', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2764', '4115121302', '����־', '086953', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2765', '4115121302', '��ȫ��', '186816', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2766', '4115121308', '����Ȩ', 'ZSQ', '��', null, null, null, null, '123456', '22', '0', null, '4115121308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2767', '4115121304', '������', '186916', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2768', '4115121302', '��ҫ��', '186758', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2769', '4115121302', 'ѧԱ15', '037615', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2770', '4115121302', 'ѧԱ16', '037616', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2771', '4115121303', '����', 'MGGQ002', '��', null, null, null, null, '123456', '22', '0', null, '4115121303', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2772', '4115121302', '�¹�3��', '000003', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2773', '4115121304', 'ѧԱ1', '037601', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2774', '4115121304', 'ѧԱ4', '037604', '��', null, null, null, null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2775', '4115121302', 'ƽ���ж�2��', '000007', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2776', '4115121302', 'ƽ���ж�4��', '000009', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2777', '4115121302', 'ƽ���ж�5��', '000010', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2778', '4115121302', '��ҵ���ж�1��', '000024', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2779', '4115121302', '��ҵ���ж�3��', '000026', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2780', '4115121302', '��ҵ���ж�4��', '000027', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2781', '4115121302', '����ӷ���', '000028', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2782', '4115121301', '��ɽ·�ж�һ', '100005', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2783', '4115121301', '��Ǵ���ж�1', '100006', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2784', '4115121301', 'Ф�����ж�1', '100010', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2785', '4115121301', 'Ф�����ж�2', '100011', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2786', '4115121301', '�����жӶ�', '100013', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2787', '4115121301', '�¹��ж�4', '100019', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2788', '411512132402', '���˻�', '085396', '��', null, null, null, null, '123456', '23', '0', null, '411512132402', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2789', '411512132406', '��̫ƽ', '085408', '��', null, null, null, null, '123456', '23', '0', null, '411512132406', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2790', '4115121324', '������', '085421', '��', null, null, null, null, '123456', '22', '0', null, '4115121324', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2791', '4115121324', '�º�ΰ', '085432', '��', null, null, null, null, '123456', '22', '0', null, '4115121324', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2792', '411512132406', '������', '085442', '��', null, null, null, null, '123456', '23', '0', null, '411512132406', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2793', '4115121324', '��̺�', '085505', '��', null, null, null, null, '123456', '22', '0', null, '4115121324', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2794', '411512132402', '�ϻ���', '085537', '��', null, null, null, null, '123456', '23', '0', null, '411512132402', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2795', '411512132403', '����', '085544', '��', null, null, null, null, '123456', '23', '0', null, '411512132403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2796', '411512132403', '����ǿ', '085550', '��', null, null, null, null, '123456', '23', '0', null, '411512132403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2797', '411512132406', '���ٻ�', '085554', '��', null, null, null, null, '123456', '23', '0', null, '411512132406', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2798', '411512132407', '����', '085556', '��', null, null, null, null, '123456', '23', '0', null, '411512132407', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2799', '411512132409', '��ΰ��', '085558', '��', null, null, null, null, '123456', '23', '0', null, '411512132409', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2800', '411512132404', '����', '085561', '��', null, null, null, null, '123456', '23', '0', null, '411512132404', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2801', '4115121324', 'л��', '085589', '��', null, null, null, null, '123456', '22', '0', null, '4115121324', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2802', '411512132409', '����', '085632', '��', null, null, null, null, '123456', '23', '0', null, '411512132409', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2803', '4115121324', '������', '085637', '��', null, null, null, null, '123456', '22', '0', null, '4115121324', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2804', '4115121324', '��ѧ־', '085649', '��', null, null, null, null, '123456', '22', '0', null, '4115121324', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2805', '411512132406', '����', '189376', '��', null, null, null, null, '123456', '23', '0', null, '411512132406', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2806', '411512132406', '����', '189380', '��', null, null, null, null, '123456', '23', '0', null, '411512132406', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2807', '411512132401', '����', '189464', '��', null, null, null, null, '123456', '23', '0', null, '411512132401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2808', '411512132407', '���', '189514', '��', null, null, null, null, '123456', '23', '0', null, '411512132407', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2809', '411512132405', '���ӽ�', '189515', '��', null, null, null, null, '123456', '23', '0', null, '411512132405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2810', '4115121324', '�κ���', '189519', '��', null, null, null, null, '123456', '22', '0', null, '4115121324', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2811', '4115121324', '�����', '189520', '��', null, null, null, null, '123456', '22', '0', null, '4115121324', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2812', '4115121324', '��ǿ', '189523', '��', null, null, null, null, '123456', '22', '0', null, '4115121324', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2813', '411512132406', '������', '189525', '��', null, null, null, null, '123456', '23', '0', null, '411512132406', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2814', '411512132406', '�����', '189526', '��', null, null, null, null, '123456', '23', '0', null, '411512132406', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2815', '411512132408', '��һ��', '189528', '��', null, null, null, null, '123456', '23', '0', null, '411512132408', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2816', '411512132406', '�����', '189577', '��', null, null, null, null, '123456', '23', '0', null, '411512132406', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2817', '411512132401', '�κ���', 'HHT', '��', null, null, null, null, '123456', '23', '0', null, '411512132401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2818', '411512132511', '�˾�', '084373', '��', null, null, null, null, '123456', '23', '0', null, '411512132511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2819', '411512132503', '����', '084422', '��', null, null, null, null, '123456', '23', '0', null, '411512132503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2820', '41151514', '���', '084594', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2821', '411512132506', '���ɺ�', '084600', '��', null, null, null, null, '123456', '23', '0', null, '411512132506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2822', '4115121325', '����Ǭ', '084602', '��', null, null, null, null, '123456', '22', '0', null, '4115121325', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2823', '411512132503', '���˺�', '084630', '��', null, null, null, null, '123456', '23', '0', null, '411512132503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2824', '411512132504', '������', '084638', '��', null, null, null, null, '123456', '23', '0', null, '411512132504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2825', '411512132503', '������', '084671', '��', null, null, null, null, '123456', '23', '0', null, '411512132503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2826', '411512132509', '������', '084673', '��', null, null, null, null, '123456', '23', '0', null, '411512132509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2827', '411512132509', '����', '084687', '��', null, null, null, null, '123456', '23', '0', null, '411512132509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2828', '411512132507', '�Ź���', '084700', '��', null, null, null, null, '123456', '23', '0', null, '411512132507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2829', '411512132510', '�μҲ�', '084705', '��', null, null, null, null, '123456', '23', '0', null, '411512132510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2830', '411512132504', '���', '084707', '��', null, null, null, null, '123456', '23', '0', null, '411512132504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2831', '411512132510', '����', '084709', '��', null, null, null, null, '123456', '23', '0', null, '411512132510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2832', '411512132511', '������', '084716', '��', null, null, null, null, '123456', '23', '0', null, '411512132511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2833', '411512132503', '���ڲ�', '084718', '��', null, null, null, null, '123456', '23', '0', null, '411512132503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2834', '411512132505', '�̲�', '084727', '��', null, null, null, null, '123456', '23', '0', null, '411512132505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2835', '411512132510', '�˿�', '084733', '��', null, null, null, null, '123456', '23', '0', null, '411512132510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2836', '411512132502', 'ԬҰ', '084783', '��', null, null, null, null, '123456', '23', '0', null, '411512132502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2837', '411512132505', '����', '084786', '��', null, null, null, null, '123456', '23', '0', null, '411512132505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2838', '411512132511', '������', '084806', '��', null, null, null, null, '123456', '23', '0', null, '411512132511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2839', '411512132506', '�ܼұ�', '084808', '��', null, null, null, null, '123456', '23', '0', null, '411512132506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2840', '411512132509', '������', 'GCJ', '��', null, null, null, null, '123456', '23', '0', null, '411512132509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2841', '411512132512', '����', '084769', '��', null, null, null, null, '123456', '23', '0', null, '411512132512', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2842', '411512132510', '�º��', '188596', '��', null, null, null, null, '123456', '23', '0', null, '411512132510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2843', '411512132507', '����', '084625', '��', null, null, null, null, '123456', '23', '0', null, '411512132507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2844', '411512132507', 'Ҧ��', '084699', '��', null, null, null, null, '123456', '23', '0', null, '411512132507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2845', '411512132507', '�Ź�', '084691', '��', null, null, null, null, '123456', '23', '0', null, '411512132507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2846', '411512132503', '������', '084421', '��', null, null, null, null, '123456', '23', '0', null, '411512132503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2847', '411512132511', '��٩', '084672', '��', null, null, null, null, '123456', '23', '0', null, '411512132511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2848', '411512132511', '�', '084395', '��', null, null, null, null, '123456', '23', '0', null, '411512132511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2849', '411512132507', '�����', '45078207', '��', null, null, null, null, '123456', '23', '0', null, '411512132507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2850', '411512132507', '�����', '45078206', '��', null, null, null, null, '123456', '23', '0', null, '411512132507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2851', '411512132509', '����Զ', '084729', '��', null, null, null, null, '123456', '23', '0', null, '411512132509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2852', '41151514', '������', '084675', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2853', '411512132611', '�ﶫı', '084020', '��', null, null, null, null, '123456', '23', '0', null, '411512132611', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2854', '411512132602', '�򽨹�', '084095', '��', null, null, null, null, '123456', '23', '0', null, '411512132602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2855', '411512132611', '����', '084103', '��', null, null, null, null, '123456', '23', '0', null, '411512132611', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2856', '411512132608', '̷����', '084147', '��', null, null, null, null, '123456', '23', '0', null, '411512132608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2857', '4115121326', '��Ⱥ��', '084165', '��', null, null, null, null, '123456', '22', '0', null, '4115121326', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2858', '4115121326', '³��', '084167', '��', null, null, null, null, '123456', '22', '0', null, '4115121326', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2859', '4115121326', '�Ű���', '084168', '��', null, null, null, null, '123456', '22', '0', null, '4115121326', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2860', '411512132601', '³ΰ', '084169', '��', null, null, null, null, '123456', '23', '0', null, '411512132601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2861', '411512132607', '����ҵ', '084171', '��', null, null, null, null, '123456', '23', '0', null, '411512132607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2862', '411512132607', '������', '084173', '��', null, null, null, null, '123456', '23', '0', null, '411512132607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2863', '4115121326', '������', '084175', '��', null, null, null, null, '123456', '22', '0', null, '4115121326', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2864', '411512132602', '�µ¸�', '084178', '��', null, null, null, null, '123456', '23', '0', null, '411512132602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2865', '411512132603', '�س���', '084179', '��', null, null, null, null, '123456', '23', '0', null, '411512132603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2866', '411512132607', '����', '084180', '��', null, null, null, null, '123456', '23', '0', null, '411512132607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2867', '411512132602', '�޽���', '084181', '��', null, null, null, null, '123456', '23', '0', null, '411512132602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2868', '4115121326', '����', '084186', '��', null, null, null, null, '123456', '22', '0', null, '4115121326', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2869', '411512132607', '���˹�', '084187', '��', null, null, null, null, '123456', '23', '0', null, '411512132607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2870', '411512132608', '�¸�', '084188', '��', null, null, null, null, '123456', '23', '0', null, '411512132608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2871', '411512132609', '����', '084190', '��', null, null, null, null, '123456', '23', '0', null, '411512132609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2872', '41151611', '���', '084191', '��', null, null, null, null, '123456', '23', '0', null, '41151611', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2873', '411512132602', '�֦', '084192', '��', null, null, null, null, '123456', '23', '0', null, '411512132602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2874', '411512132609', '����ǿ', '084193', '��', null, null, null, null, '123456', '23', '0', null, '411512132609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2875', '411512132606', '���Ǵ�', '084194', '��', null, null, null, null, '123456', '23', '0', null, '411512132606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2876', '411512132602', '���˷�', '084195', '��', null, null, null, null, '123456', '23', '0', null, '411512132602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2877', '4115121326', '�׵���', '084196', '��', null, null, null, null, '123456', '22', '0', null, '4115121326', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2878', '4115121326', '����', '084197', '��', null, null, null, null, '123456', '22', '0', null, '4115121326', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2879', '411512132612', '�Ż�', '084199', '��', null, null, null, null, '123456', '23', '0', null, '411512132612', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2880', '4115121326', '�����', '084202', '��', null, null, null, null, '123456', '22', '0', null, '4115121326', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2881', '411512132608', '�Լ���', '084203', '��', null, null, null, null, '123456', '23', '0', null, '411512132608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2882', '411512132612', '����', '084212', '��', null, null, null, null, '123456', '23', '0', null, '411512132612', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2883', '411512132602', '�и�', '084218', '��', null, null, null, null, '123456', '23', '0', null, '411512132602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2884', '4115121326', '������', '084287', '��', null, null, null, null, '123456', '22', '0', null, '4115121326', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2885', '4115121326', '���º�', '084305', '��', null, null, null, null, '123456', '22', '0', null, '4115121326', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2886', '411512132610', 'Ԭ����', '084311', '��', null, null, null, null, '123456', '23', '0', null, '411512132610', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2887', '411512132607', '��ٻ', '084357', '��', null, null, null, null, '123456', '23', '0', null, '411512132607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2888', '411512132601', '����', '084358', '��', null, null, null, null, '123456', '23', '0', null, '411512132601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2889', '411512132607', '����ϼ', '084365', '��', null, null, null, null, '123456', '23', '0', null, '411512132607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2890', '411512132601', '����', '084366', '��', null, null, null, null, '123456', '23', '0', null, '411512132601', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2891', '4115121326', '����', '084367', '��', null, null, null, null, '123456', '22', '0', null, '4115121326', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2892', '411512132602', '�ܿ�', '084368', '��', null, null, null, null, '123456', '23', '0', null, '411512132602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2893', '4115121326', '����', '084369', '��', null, null, null, null, '123456', '22', '0', null, '4115121326', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2894', '411512132602', '���½�', '188001', '��', null, null, null, null, '123456', '23', '0', null, '411512132602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2895', '411512132602', '����', '188019', '��', null, null, null, null, '123456', '23', '0', null, '411512132602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2896', '411512132607', '����', '188029', '��', null, null, null, null, '123456', '23', '0', null, '411512132607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2897', '411512132613', '����Ǭ', '188031', '��', null, null, null, null, '123456', '23', '0', null, '411512132613', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2898', '411512132602', '�Ŵ���', '188036', '��', null, null, null, null, '123456', '23', '0', null, '411512132602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2899', '411512132608', '�¹⺺', '188039', '��', null, null, null, null, '123456', '23', '0', null, '411512132608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2900', '411512132612', '�ܽ�', '188057', '��', null, null, null, null, '123456', '23', '0', null, '411512132612', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2901', '411512132610', '����ǿ', '188062', '��', null, null, null, null, '123456', '23', '0', null, '411512132610', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2902', '411512132609', '����', '188075', '��', null, null, null, null, '123456', '23', '0', null, '411512132609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2903', '41151621', '����', '188109', '��', null, null, null, null, '123456', '23', '0', null, '41151621', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2904', '411512132611', '�Ź�ΰ', '188150', '��', null, null, null, null, '123456', '23', '0', null, '411512132611', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2905', '411512132602', '¬��', '188151', '��', null, null, null, null, '123456', '23', '0', null, '411512132602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2906', '4115121326', '����', 'CH', '��', null, null, null, null, '123456', '22', '0', null, '4115121326', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2907', '4115121326', '������', '084093', '��', null, null, null, null, '123456', '22', '0', null, '4115121326', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2908', '411515', 'HC', 'HC', '��', null, null, null, null, '123456', '22', '0', null, '411515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2909', '41151823', '�����', '189385', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2910', '411512132608', '������', '188053', '��', null, null, null, null, '123456', '23', '0', null, '411512132608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2911', '411512132608', '����', '188022', '��', null, null, null, null, '123456', '23', '0', null, '411512132608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2912', '4115121322', '����ΰ', '185750', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2913', '411512132101', '������', 'TDY123456', '��', null, null, null, null, '123456', '22', '0', null, '411512132101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2914', '41151804', '���', 'ZA0001', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2915', '41151804', '��ǿ', 'ZA0011', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2916', '4115121322', '����', '088408', '��', null, null, null, null, '123456', '22', '0', null, '4115121322', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2917', '4115121301', '�¹�108', '100030', '��', null, null, null, null, '123456', '22', '0', null, '4115121301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2918', '41150701', '����־', '088039', '��', null, null, null, null, '123456', '23', '0', null, '41150701', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2919', '4115121323', '¬��', '085697', '��', null, null, null, null, '123456', '22', '0', null, '4115121323', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2920', '4115121320', '������', '088231', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2921', '4115121320', '�ֺ���', '088205', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2922', '41151835', '�Ÿ�', '189570', '��', null, null, null, null, '123456', '23', '0', null, '41151835', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2923', '4115121321', '�', '190000', '��', null, null, null, null, '123456', '22', '0', null, '4115121321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2924', '41151804', '���ǻ�', 'ZA0038', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2925', '411512132304', '���³�', '085941', '��', null, null, null, null, '123456', '23', '0', null, '411512132304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2926', '41151823', '����', '085471', '��', null, null, null, null, '123456', '23', '0', null, '41151823', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2927', '411517', 'SC', 'SC', '��', null, null, null, null, '123456', '22', '0', null, '411517', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2928', '41151707', 'ë����', '088640', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2929', '41151707', '������', '088674', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2930', '41151707', '��  ��', '088422', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2931', '41151707', '��С��', '185715', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2932', '41151707', '��־��', '185729', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2933', '41151707', '��  �D', '185725', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2934', '41151708', '��  ��', '088729', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2935', '41151708', '�½���', '088672', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2936', '41151708', '��ʤ', '088407', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2937', '41151708', '������', '185708', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2938', '41151708', '��  ��', '185697', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2939', '41151708', '����', '088413', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2940', '41151708', '������', '088492', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2941', '41151708', '�￡��', '088602', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2942', '41151708', '��ʢ��', '088604', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2943', '41151708', '��ͤ��', '088624', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2944', '41151708', '÷  ��', '088726', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2945', '41151708', 'Ҷ�λ�', '088634', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2946', '41151710', '������', '185812', '��', null, null, null, null, '123456', '23', '0', null, '41151710', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2947', '41151710', '������', '088657', '��', null, null, null, null, '123456', '23', '0', null, '41151710', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2948', '41151710', '�Ϲ���', '088461', '��', null, null, null, null, '123456', '23', '0', null, '41151710', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2949', '41151710', 'Ǯ���', '185743', '��', null, null, null, null, '123456', '23', '0', null, '41151710', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2950', '41151712', '�ĺ��', '185809', '��', null, null, null, null, '123456', '23', '0', null, '41151712', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2951', '41151712', '���Ȼ', '185742', '��', null, null, null, null, '123456', '23', '0', null, '41151712', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2952', '41151712', '���ӱ�', '088485', '��', null, null, null, null, '123456', '23', '0', null, '41151712', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2953', '41151712', '�챣��', '088460', '��', null, null, null, null, '123456', '23', '0', null, '41151712', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2954', '41151702', 'ʯ����', '088433', '��', null, null, null, null, '123456', '23', '0', null, '41151702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2955', '41151702', '����̶', '185782', '��', null, null, null, null, '123456', '23', '0', null, '41151702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2956', '41151702', '������', '185779', '��', null, null, null, null, '123456', '23', '0', null, '41151702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2957', '41151702', '�κ���', '186000', '��', null, null, null, null, '123456', '23', '0', null, '41151702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2958', '41151702', 'Ҧ����', '185781', '��', null, null, null, null, '123456', '23', '0', null, '41151702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2959', '41151702', '��  ��', '088497', '��', null, null, null, null, '123456', '23', '0', null, '41151702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2960', '41151702', '������', '088935', '��', null, null, null, null, '123456', '23', '0', null, '41151702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2961', '41151702', '��  ��', '185780', '��', null, null, null, null, '123456', '23', '0', null, '41151702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2962', '41151702', '������', '185680', '��', null, null, null, null, '123456', '23', '0', null, '41151702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2963', '41151720', '������', '185757', '��', null, null, null, null, '123456', '23', '0', null, '41151720', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2964', '41151720', '��  ��', '088648', '��', null, null, null, null, '123456', '23', '0', null, '41151720', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2965', '41151720', '��  ��', '185790', '��', null, null, null, null, '123456', '23', '0', null, '41151720', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2966', '41151704', '����ǿ', '088447', '��', null, null, null, null, '123456', '23', '0', null, '41151704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2967', '41151732', '��  ��', '185813', '��', null, null, null, null, '123456', '23', '0', null, '41151732', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2968', '41151732', '���ȷ�', '088569', '��', null, null, null, null, '123456', '23', '0', null, '41151732', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2969', '41151706', '������', '088635', '��', null, null, null, null, '123456', '23', '0', null, '41151706', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2970', '41151706', '������', '088421', '��', null, null, null, null, '123456', '23', '0', null, '41151706', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2971', '41151706', '����ά', '185770', '��', null, null, null, null, '123456', '23', '0', null, '41151706', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2972', '41151706', '�Կ�Ƚ', '185696', '��', null, null, null, null, '123456', '23', '0', null, '41151706', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2973', '41151711', '�ŵ¸�', '088708', '��', null, null, null, null, '123456', '23', '0', null, '41151711', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2974', '41151711', '��  ��', '088463', '��', null, null, null, null, '123456', '23', '0', null, '41151711', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2975', '41151711', '��ΰ��', '088440', '��', null, null, null, null, '123456', '23', '0', null, '41151711', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2976', '41151726', '��  ��', '088734', '��', null, null, null, null, '123456', '23', '0', null, '41151726', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2977', '41151726', '��  ��', '185703', '��', null, null, null, null, '123456', '23', '0', null, '41151726', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2978', '41151725', '���ͷ�', '088633', '��', null, null, null, null, '123456', '23', '0', null, '41151725', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2979', '41151707', '������', '088445', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2980', '41151725', '��  ��', '185747', '��', null, null, null, null, '123456', '23', '0', null, '41151725', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2981', '41151725', '�ƶ���', '111114', '��', null, null, null, null, '123456', '23', '0', null, '41151725', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2982', '41151709', '���ƶ�', '088575', '��', null, null, null, null, '123456', '23', '0', null, '41151709', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2983', '41151709', '������', '185681', '��', null, null, null, null, '123456', '23', '0', null, '41151709', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2984', '411517', '���ӻ�', '088514', '��', null, null, null, null, '123456', '22', '0', null, '411517', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2985', '41151709', '��˼��', '185821', '��', null, null, null, null, '123456', '23', '0', null, '41151709', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2986', '41151709', '�ƺ���', '185802', '��', null, null, null, null, '123456', '23', '0', null, '41151709', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2987', '41151705', '������', '088654', '��', null, null, null, null, '123456', '23', '0', null, '41151705', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2988', '41151705', '������', '088494', '��', null, null, null, null, '123456', '23', '0', null, '41151705', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2989', '41151705', '������', '185712', '��', null, null, null, null, '123456', '23', '0', null, '41151705', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2990', '41151704', '�Թ���', '185792', '��', null, null, null, null, '123456', '23', '0', null, '41151704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2991', '41151704', 'ʢ����', '185720', '��', null, null, null, null, '123456', '23', '0', null, '41151704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2992', '41151704', 'л���', '185718', '��', null, null, null, null, '123456', '23', '0', null, '41151704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2993', '41151704', '��  ��', '185706', '��', null, null, null, null, '123456', '23', '0', null, '41151704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2994', '41151704', '��  �', '111116', '��', null, null, null, null, '123456', '23', '0', null, '41151704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2995', '41151704', 'л�', 'FJ1016', '��', null, null, null, null, '123456', '23', '0', null, '41151704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2996', '41151719', '����ң', '088740', '��', null, null, null, null, '123456', '23', '0', null, '41151719', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2997', '41151719', '�����', '185817', '��', null, null, null, null, '123456', '23', '0', null, '41151719', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2998', '41151708', 'Ԭ  ��', '088437', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('2999', '41151719', '������', '088534', '��', null, null, null, null, '123456', '23', '0', null, '41151719', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3000', '41151728', '�౾��', '088430', '��', null, null, null, null, '123456', '23', '0', null, '41151728', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3001', '41151728', '���Һ�', '088543', '��', null, null, null, null, '123456', '23', '0', null, '41151728', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3002', '41151728', '��ǰ��', '088627', '��', null, null, null, null, '123456', '23', '0', null, '41151728', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3003', '41151728', '�����', '088707', '��', null, null, null, null, '123456', '23', '0', null, '41151728', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3004', '41151717', '���˸�', '088601', '��', null, null, null, null, '123456', '23', '0', null, '41151717', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3005', '41151717', '��  ��', '185769', '��', null, null, null, null, '123456', '23', '0', null, '41151717', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3006', '41151717', '��  ��', '088704', '��', null, null, null, null, '123456', '23', '0', null, '41151717', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3007', '41151718', '���', '088670', '��', null, null, null, null, '123456', '23', '0', null, '41151718', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3008', '41151718', '������', '088484', '��', null, null, null, null, '123456', '23', '0', null, '41151718', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3009', '41151718', '�ױ���', '185710', '��', null, null, null, null, '123456', '23', '0', null, '41151718', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3010', '41151718', '��  ��', '185822', '��', null, null, null, null, '123456', '23', '0', null, '41151718', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3011', '41151731', '��  ��', '088462', '��', null, null, null, null, '123456', '23', '0', null, '41151731', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3012', '41151731', '��  ��', '185679', '��', null, null, null, null, '123456', '23', '0', null, '41151731', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3013', '41151714', '����˫', '088652', '��', null, null, null, null, '123456', '23', '0', null, '41151714', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3014', '41151714', '�ܳ���', '088662', '��', null, null, null, null, '123456', '23', '0', null, '41151714', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3015', '41151714', '��Զ��', '185772', '��', null, null, null, null, '123456', '23', '0', null, '41151714', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3016', '41151714', '�����D', '185771', '��', null, null, null, null, '123456', '23', '0', null, '41151714', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3017', '41151708', '����Ȫ', '088717', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3018', '41151729', '������', '088586', '��', null, null, null, null, '123456', '23', '0', null, '41151729', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3019', '41151729', '������', '088614', '��', null, null, null, null, '123456', '23', '0', null, '41151729', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3020', '41151729', '������', '088559', '��', null, null, null, null, '123456', '23', '0', null, '41151729', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3021', '41151713', '�쵤��', '088415', '��', null, null, null, null, '123456', '23', '0', null, '41151713', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3022', '41151713', '��Т��', '088404', '��', null, null, null, null, '123456', '23', '0', null, '41151713', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3023', '41151715', 'Ф����', '088743', '��', null, null, null, null, '123456', '23', '0', null, '41151715', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3024', '41151715', '����ǿ', '088584', '��', null, null, null, null, '123456', '23', '0', null, '41151715', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3025', '41151715', '�ƶ���', '185682', '��', null, null, null, null, '123456', '23', '0', null, '41151715', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3026', '41151715', '�ź���', '185830', '��', null, null, null, null, '123456', '23', '0', null, '41151715', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3027', '41151722', '��  ��', '088444', '��', null, null, null, null, '123456', '23', '0', null, '41151722', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3028', '411517', '��  ��', '088725', '��', null, null, null, null, '123456', '22', '0', null, '411517', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3029', '41151722', '������', '185695', '��', null, null, null, null, '123456', '23', '0', null, '41151722', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3030', '41151722', '������', '185768', '��', null, null, null, null, '123456', '23', '0', null, '41151722', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3031', '41151721', '���', '088701', '��', null, null, null, null, '123456', '23', '0', null, '41151721', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3032', '41151721', '÷����', '185683', '��', null, null, null, null, '123456', '23', '0', null, '41151721', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3033', '41151721', '����ΰ', '185719', '��', null, null, null, null, '123456', '23', '0', null, '41151721', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3034', '41151716', '������', '185825', '��', null, null, null, null, '123456', '23', '0', null, '41151716', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3035', '41151716', '��  ��', '185728', '��', null, null, null, null, '123456', '23', '0', null, '41151716', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3036', '41151716', '�ϻԽ�', '088446', '��', null, null, null, null, '123456', '23', '0', null, '41151716', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3037', '41151716', '�෫', '185828', '��', null, null, null, null, '123456', '23', '0', null, '41151716', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3038', '41151730', '��  ��', '185692', '��', null, null, null, null, '123456', '23', '0', null, '41151730', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3039', '41151703', '���ʳ�', '185765', '��', null, null, null, null, '123456', '23', '0', null, '41151703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3040', '41151703', '��  ��', '185716', '��', null, null, null, null, '123456', '23', '0', null, '41151703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3041', '41151703', '�ɭ', '185690', '��', null, null, null, null, '123456', '23', '0', null, '41151703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3042', '41151703', '����ƽ', '088472', '��', null, null, null, null, '123456', '23', '0', null, '41151703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3043', '41151703', '�ϴ���', '185826', '��', null, null, null, null, '123456', '23', '0', null, '41151703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3044', '41151703', '������', '185783', '��', null, null, null, null, '123456', '23', '0', null, '41151703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3045', '41151703', '�°���', '185687', '��', null, null, null, null, '123456', '23', '0', null, '41151703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3046', '41151703', '������', '088524', '��', null, null, null, null, '123456', '23', '0', null, '41151703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3047', '41151724', '������', '088677', '��', null, null, null, null, '123456', '23', '0', null, '41151724', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3048', '41151724', '�����', '088715', '��', null, null, null, null, '123456', '23', '0', null, '41151724', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3049', '41151724', '�����', '185767', '��', null, null, null, null, '123456', '23', '0', null, '41151724', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3050', '41151724', '�ؽ���', '185786', '��', null, null, null, null, '123456', '23', '0', null, '41151724', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3051', '41151723', '��  ��', '185722', '��', null, null, null, null, '123456', '23', '0', null, '41151723', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3052', '41151727', '��ʱ��', '088678', '��', null, null, null, null, '123456', '23', '0', null, '41151727', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3053', '41151727', '������', '185688', '��', null, null, null, null, '123456', '23', '0', null, '41151727', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3054', '41151702', '��  ��', '185702', '��', null, null, null, null, '123456', '23', '0', null, '41151702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3055', '411517', '÷����', '185693', '��', null, null, null, null, '123456', '22', '0', null, '411517', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3056', '41151732', '����', '185731', '��', null, null, null, null, '123456', '23', '0', null, '41151732', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3057', '41151707', '�ܴ���', '088557', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3058', '41151707', '��  �', '088450', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3059', '41151721', '����', '088711', '��', null, null, null, null, '123456', '23', '0', null, '41151721', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3060', '41151713', 'Ф����', '185773', '��', null, null, null, null, '123456', '23', '0', null, '41151713', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3061', '411512132310', '�⺣��', '085930', '��', null, null, null, null, '123456', '23', '0', null, '411512132310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3062', '41151804', '�־���', 'ZA0062', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3063', '41151507', '����', '084725', '��', null, null, null, null, '123456', '23', '0', null, '41151507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3064', '41151507', '����', '084810', '��', null, null, null, null, '123456', '23', '0', null, '41151507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3065', '41151507', '��ԣ��', '188538', '��', null, null, null, null, '123456', '23', '0', null, '41151507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3066', '41151705', '��  ��', '185776', '��', null, null, null, null, '123456', '23', '0', null, '41151705', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3067', '411511', 'HB', 'HB', '��', null, null, null, null, '123456', '22', '0', null, '411511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3068', '41151101', '�����', '085753', '��', null, null, null, null, '123456', '23', '0', null, '41151101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3069', '41151101', '���', '085947', '��', null, null, null, null, '123456', '23', '0', null, '41151101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3070', '41151112', '�ܺ���', '085827', '��', null, null, null, null, '123456', '23', '0', null, '41151112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3071', '41151112', '���', '085950', '��', null, null, null, null, '123456', '23', '0', null, '41151112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3072', '41151112', '��ͤ', '085872', '��', null, null, null, null, '123456', '23', '0', null, '41151112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3073', '41151112', '����', '085966', '��', null, null, null, null, '123456', '23', '0', null, '41151112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3074', '41151112', '����ǿ', '085952', '��', null, null, null, null, '123456', '23', '0', null, '41151112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3075', '41151112', '����', '085906', '��', null, null, null, null, '123456', '23', '0', null, '41151112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3076', '41151112', '�Ի���', '185014', '��', null, null, null, null, '123456', '23', '0', null, '41151112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3077', '41151112', '���¾�', '185043', '��', null, null, null, null, '123456', '23', '0', null, '41151112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3078', '41151112', '����', '085773', '��', null, null, null, null, '123456', '23', '0', null, '41151112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3079', '41151123', '����', '085859', '��', null, null, null, null, '123456', '23', '0', null, '41151123', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3080', '41151123', '�ι���', '085948', '��', null, null, null, null, '123456', '23', '0', null, '41151123', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3081', '41151123', '��ǿ', '185045', '��', null, null, null, null, '123456', '23', '0', null, '41151123', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3082', '41151110', '����', '185072', '��', null, null, null, null, '123456', '23', '0', null, '41151110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3083', '41151110', '����', '��', '��', null, null, null, null, '123456', '23', '0', null, '41151110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3084', '41151120', '����', '185041', '��', null, null, null, null, '123456', '23', '0', null, '41151120', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3085', '41151120', '���п�', '185067', '��', null, null, null, null, '123456', '23', '0', null, '41151120', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3086', '41151122', '����', '085861', '��', null, null, null, null, '123456', '23', '0', null, '41151122', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3087', '41151122', '�ſ���', '085980', '��', null, null, null, null, '123456', '23', '0', null, '41151122', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3088', '41151122', '����־', '185059', '��', null, null, null, null, '123456', '23', '0', null, '41151122', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3089', '41151121', '÷��ΰ', '085802', '��', null, null, null, null, '123456', '23', '0', null, '41151121', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3090', '41151121', 'ë����', '085911', '��', null, null, null, null, '123456', '23', '0', null, '41151121', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3091', '41151121', '���ΰ', '185015', '��', null, null, null, null, '123456', '23', '0', null, '41151121', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3092', '41151121', '����', '185087', '��', null, null, null, null, '123456', '23', '0', null, '41151121', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3093', '41151118', '���и�', '085891', '��', null, null, null, null, '123456', '23', '0', null, '41151118', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3094', '41151118', '�Ž�', '185029', '��', null, null, null, null, '123456', '23', '0', null, '41151118', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3095', '41151103', '���', '085701', '��', null, null, null, null, '123456', '23', '0', null, '41151103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3096', '41151103', '����', '185089', '��', null, null, null, null, '123456', '23', '0', null, '41151103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3097', '41151104', '����', '085791', '��', null, null, null, null, '123456', '23', '0', null, '41151104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3098', '41151104', '˾Ԫƽ', '185082', '��', null, null, null, null, '123456', '23', '0', null, '41151104', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3099', '41151110', '�����', '085945', '��', null, null, null, null, '123456', '23', '0', null, '41151110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3100', '41151110', '����', '085943', '��', null, null, null, null, '123456', '23', '0', null, '41151110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3101', '41151102', '������', '185033', '��', null, null, null, null, '123456', '23', '0', null, '41151102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3102', '41151102', '��һ', '085932', '��', null, null, null, null, '123456', '23', '0', null, '41151102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3103', '41151102', '֣��', '085780', '��', null, null, null, null, '123456', '23', '0', null, '41151102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3104', '41151102', '������', '185068', '��', null, null, null, null, '123456', '23', '0', null, '41151102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3105', '41151102', '�ѽ���', '085836', '��', null, null, null, null, '123456', '23', '0', null, '41151102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3106', '41151102', '�����', '085967', '��', null, null, null, null, '123456', '23', '0', null, '41151102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3107', '41151124', '����', '185079', '��', null, null, null, null, '123456', '23', '0', null, '41151124', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3108', '41151124', '������', '085918', '��', null, null, null, null, '123456', '23', '0', null, '41151124', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3109', '41151105', '������', '085931', '��', null, null, null, null, '123456', '23', '0', null, '41151105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3110', '41151105', '���廪', '085902', '��', null, null, null, null, '123456', '23', '0', null, '41151105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3111', '41151105', '��ƽ��', '085850', '��', null, null, null, null, '123456', '23', '0', null, '41151105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3112', '41151105', '����', '185057', '��', null, null, null, null, '123456', '23', '0', null, '41151105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3113', '41151107', 'лά', '085897', '��', null, null, null, null, '123456', '23', '0', null, '41151107', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3114', '41151107', 'л�t��', 'δ֪', '��', null, null, null, null, '123456', '23', '0', null, '41151107', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3115', '41151107', '��ѩ��', '185077', '��', null, null, null, null, '123456', '23', '0', null, '41151107', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3116', '41151107', '��ѧ��', '085739', '��', null, null, null, null, '123456', '23', '0', null, '41151107', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3117', '41151108', '����', '085972', '��', null, null, null, null, '123456', '23', '0', null, '41151108', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3118', '41151106', '����', '085907', '��', null, null, null, null, '123456', '23', '0', null, '41151106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3119', '41151106', '�����', '185061', '��', null, null, null, null, '123456', '23', '0', null, '41151106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3120', '41151106', '��ΰ', '185022', '��', null, null, null, null, '123456', '23', '0', null, '41151106', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3121', '41151119', '����', '085833', '��', null, null, null, null, '123456', '23', '0', null, '41151119', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3122', '41151116', '�˿�', '085955', '��', null, null, null, null, '123456', '23', '0', null, '41151116', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3123', '41151116', '��ҫƽ', '185030', '��', null, null, null, null, '123456', '23', '0', null, '41151116', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3124', '41151116', '�', '185047', '��', null, null, null, null, '123456', '23', '0', null, '41151116', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3125', '41151115', '������', '085881', '��', null, null, null, null, '123456', '23', '0', null, '41151115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3126', '41151115', '���ű�', '185095', '��', null, null, null, null, '123456', '23', '0', null, '41151115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3127', '41151115', '����', '185084', '��', null, null, null, null, '123456', '23', '0', null, '41151115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3128', '41151115', '�Ű���', '185065', '��', null, null, null, null, '123456', '23', '0', null, '41151115', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3129', '41151117', '��־', '085888', '��', null, null, null, null, '123456', '23', '0', null, '41151117', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3130', '41151117', '�¾�', '185054', '��', null, null, null, null, '123456', '23', '0', null, '41151117', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3131', '41151117', '������', '085878', '��', null, null, null, null, '123456', '23', '0', null, '41151117', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3132', '41151109', '����', '085775', '��', null, null, null, null, '123456', '23', '0', null, '41151109', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3133', '41151111', '��ΰ', '085757', '��', null, null, null, null, '123456', '23', '0', null, '41151111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3134', '41151111', '����ï', '085732', '��', null, null, null, null, '123456', '23', '0', null, '41151111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3135', '41151111', '��Զ��', '085728', '��', null, null, null, null, '123456', '23', '0', null, '41151111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3136', '41151111', '�»�', '085919', '��', null, null, null, null, '123456', '23', '0', null, '41151111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3137', '41151108', '�ο���', '185040', '��', null, null, null, null, '123456', '23', '0', null, '41151108', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3138', '41151108', '���˷�', '085996', '��', null, null, null, null, '123456', '23', '0', null, '41151108', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3139', '41151124', '����', '185092', '��', null, null, null, null, '123456', '23', '0', null, '41151124', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3140', '41151507', '����', '188523', '��', null, null, null, null, '123456', '23', '0', null, '41151507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3141', '41151507', '������', '188391', '��', null, null, null, null, '123456', '23', '0', null, '41151507', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3142', '41151501', '������', '084561', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3143', '41151501', '�ܱ�', '084557', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3144', '41151501', '������', '084573', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3145', '41151501', '������', '084612', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3146', '41151501', '����', '084599', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3147', '41151501', '����', '188387', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3148', '41151501', '����', '188389', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3149', '41151501', '����ӡ', '084571', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3150', '41151501', '�����', '084518', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3151', '41151501', '�ֺ貨', '188409', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3152', '41151501', '���꽭', '188366', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3153', '41151501', '�ຣ��', '188362', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3154', '41151501', '������', '084565', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3155', '41151501', '���', '084585', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3156', '41151501', '������', '084785', '��', null, null, null, null, '123456', '23', '0', null, '41151501', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3157', '41151113', 'ף����', '185009', '��', null, null, null, null, '123456', '23', '0', null, '41151113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3158', '41151113', '������', '185012', '��', null, null, null, null, '123456', '23', '0', null, '41151113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3159', '41151510', '�·�', '084578', '��', null, null, null, null, '123456', '23', '0', null, '41151510', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3160', '41151506', '�ž�', '084633', '��', null, null, null, null, '123456', '23', '0', null, '41151506', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3161', '41151511', '����', '188583', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3162', '41151511', '����', '084491', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3163', '41151511', '���Ը�', '188588', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3164', '41151511', '��º�', '084512', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3165', '41151511', '��־��', '084741', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3166', '41151511', '���', '188352', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3167', '41151511', '��ΰ', '084753', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3168', '41151511', '������', '188385', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3169', '41151511', '���d', '084784', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3170', '41151511', '�����', '188589', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3171', '41151511', '����ΰ', '188365', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3172', '41151511', '�ܸ�', '188386', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3173', '41151511', '������', '188356', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3174', '41151511', '������', '188590', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3175', '41151511', '���', '084551', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3176', '41151511', '����', '084560', '��', null, null, null, null, '123456', '23', '0', null, '41151511', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3177', '41151503', '������', '188372', '��', null, null, null, null, '123456', '23', '0', null, '41151503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3178', '41151503', '�״�ΰ', '084737', '��', null, null, null, null, '123456', '23', '0', null, '41151503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3179', '41151503', '������', '188367', '��', null, null, null, null, '123456', '23', '0', null, '41151503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3180', '41151503', '������', '084613', '��', null, null, null, null, '123456', '23', '0', null, '41151503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3181', '41151503', '������', '084575', '��', null, null, null, null, '123456', '23', '0', null, '41151503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3182', '41151514', '����', '01084769', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3183', '41151514', '����ɭ', '084766', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3184', '41151514', '����', '084712', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3185', '41151505', '��÷��', '188572', '��', null, null, null, null, '123456', '23', '0', null, '41151505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3186', '41151505', '������', '084488', '��', null, null, null, null, '123456', '23', '0', null, '41151505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3187', '41151505', '������', '087634', '��', null, null, null, null, '123456', '23', '0', null, '41151505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3188', '41151514', '��ʿ��', '084538', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3189', '41151522', '�ŷ�', '084801', '��', null, null, null, null, '123456', '23', '0', null, '41151522', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3190', '41151521', '�����', '084653', '��', null, null, null, null, '123456', '23', '0', null, '41151521', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3191', '41151521', '�˻�', '188533', '��', null, null, null, null, '123456', '23', '0', null, '41151521', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3192', '41151521', '����', '188597', '��', null, null, null, null, '123456', '23', '0', null, '41151521', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3193', '41151508', '�޲�', '188528', '��', null, null, null, null, '123456', '23', '0', null, '41151508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3194', '41151508', '�ܹ���', '084592', '��', null, null, null, null, '123456', '23', '0', null, '41151508', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3195', '41151509', '«��', '188531', '��', null, null, null, null, '123456', '23', '0', null, '41151509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3196', '41151509', '�ſ˸�', '084553', '��', null, null, null, null, '123456', '23', '0', null, '41151509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3197', '41151517', '��ͦ', '084377', '��', null, null, null, null, '123456', '23', '0', null, '41151517', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3198', '41151514', '�ź�', '188416', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3199', '41151509', '���', '188378', '��', null, null, null, null, '123456', '23', '0', null, '41151509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3200', '41151509', 'Ҷɭ', '188530', '��', null, null, null, null, '123456', '23', '0', null, '41151509', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3201', '41151514', '�º��', '01188596', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3202', '411515', '��Խ��', '084441', '��', null, null, null, null, '123456', '22', '0', null, '411515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3203', '41151504', '������', '3113110', '��', null, null, null, null, '123456', '23', '0', null, '41151504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3204', '41151504', '������', '084795', '��', null, null, null, null, '123456', '23', '0', null, '41151504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3205', '41151504', '���', '188581', '��', null, null, null, null, '123456', '23', '0', null, '41151504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3206', '41151504', '�����', '188401', '��', null, null, null, null, '123456', '23', '0', null, '41151504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3207', '41151504', '�Ŀ���', '084799', '��', null, null, null, null, '123456', '23', '0', null, '41151504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3208', '41151503', '����ƽ', '084820', '��', null, null, null, null, '123456', '23', '0', null, '41151503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3209', '41151515', '���̺�', '188566', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3210', '41151515', '��ǿ', '084430', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3211', '41151515', '�ϻԷ�', '084437', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3212', '41151515', '�ܾ�', '084401', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3213', '41151515', '���ı�', '084416', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3214', '41151515', '����', '084428', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3215', '41151515', '������', '084439', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3216', '41151515', '��־ǿ', '084796', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3217', '41151515', '����־', '084520', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3218', '41151515', '�붫', '084777', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3219', '41151515', '�ζ���', '084797', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3220', '41151515', '��ǿ', '084405', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3221', '41151515', '�����', '084739', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3222', '41151515', '�����', '084751', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3223', '41151515', '���', '084764', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3224', '41151515', '����', '084722', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3225', '41151515', 'Ҷ��ǿ', '084763', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3226', '41151515', '��С��', '084807', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3227', '41151515', '��־��', '084748', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3228', '41151515', '������', '084704', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3229', '41151515', '���', '084723', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3230', '41151515', '����', '084719', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3231', '41151515', '����', '084749', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3232', '41151515', 'Ҧ��', '084721', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3233', '41151515', '����ϼ', '084756', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3234', '41151515', '�Ĳ�', '084391', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3235', '41151515', '������', '084407', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3236', '41151515', '����', '084399', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3237', '41151515', '������', '084419', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3238', '41151515', '���±�', '084423', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3239', '41151515', '������', '084410', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3240', '41151515', '����', '084529', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3241', '41151515', '���', '188595', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3242', '41151515', '�����', '188410', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3243', '41151515', '������', '188380', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3244', '41151515', '���', '188381', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3245', '41151515', '��ϣ��', '188355', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3246', '41151515', '������', '188390', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3247', '41151515', '����', '188382', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3248', '41151515', '�ܽ���', '188383', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3249', '41151515', '�', '188399', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3250', '41151515', '����', '188370', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3251', '41151515', '����', '084781', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3252', '41151515', '������', '188525', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3253', '41151515', '����', '188510', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3254', '41151518', '���', '084728', '��', null, null, null, null, '123456', '23', '0', null, '41151518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3255', '41151518', '������', '188398', '��', null, null, null, null, '123456', '23', '0', null, '41151518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3256', '41151518', '���', '188508', '��', null, null, null, null, '123456', '23', '0', null, '41151518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3257', '41151518', '������', '188509', '��', null, null, null, null, '123456', '23', '0', null, '41151518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3258', '41151518', '���궫', '084639', '��', null, null, null, null, '123456', '23', '0', null, '41151518', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3259', '41151527', '����', '084776', '��', null, null, null, null, '123456', '23', '0', null, '41151527', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3260', '41151527', '������', '188368', '��', null, null, null, null, '123456', '23', '0', null, '41151527', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3261', '41151527', '���', '188512', '��', null, null, null, null, '123456', '23', '0', null, '41151527', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3262', '41151527', '����', '188556', '��', null, null, null, null, '123456', '23', '0', null, '41151527', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3263', '41151520', '���Ļ�', '084706', '��', null, null, null, null, '123456', '23', '0', null, '41151520', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3264', '41151503', '֣ʤ��', '084735', '��', null, null, null, null, '123456', '23', '0', null, '41151503', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3265', '41151530', '��ʿ��', '084415', '��', null, null, null, null, '123456', '23', '0', null, '41151530', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3266', '41151528', '���н�', '084605', '��', null, null, null, null, '123456', '23', '0', null, '41151528', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3267', '41151528', '���', '084767', '��', null, null, null, null, '123456', '23', '0', null, '41151528', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3268', '41151528', '����', '188506', '��', null, null, null, null, '123456', '23', '0', null, '41151528', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3269', '41151528', '����ͨ', '188507', '��', null, null, null, null, '123456', '23', '0', null, '41151528', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3270', '41151531', 'Ҷ����', '084431', '��', null, null, null, null, '123456', '23', '0', null, '41151531', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3271', '41151531', '������', '188517', '��', null, null, null, null, '123456', '23', '0', null, '41151531', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3272', '41151531', '����ɭ', '084508', '��', null, null, null, null, '123456', '23', '0', null, '41151531', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3273', '41151525', '����', '084775', '��', null, null, null, null, '123456', '23', '0', null, '41151525', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3274', '41151525', '����', '01084786', '��', null, null, null, null, '123456', '23', '0', null, '41151525', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3275', '41151804', '������', 'ZA0072', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3276', '41151523', '��˼Զ', '084609', '��', null, null, null, null, '123456', '23', '0', null, '41151523', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3277', '41151523', '����', '188521', '��', null, null, null, null, '123456', '23', '0', null, '41151523', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3278', '41151523', '��ά��', '188515', '��', null, null, null, null, '123456', '23', '0', null, '41151523', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3279', '41151523', '���', '188396', '��', null, null, null, null, '123456', '23', '0', null, '41151523', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3280', '41151524', '����ǿ', '084406', '��', null, null, null, null, '123456', '23', '0', null, '41151524', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3281', '41151524', '����', '188353', '��', null, null, null, null, '123456', '23', '0', null, '41151524', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3282', '41151524', '������', '084752', '��', null, null, null, null, '123456', '23', '0', null, '41151524', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3283', '41151526', '������', '084595', '��', null, null, null, null, '123456', '23', '0', null, '41151526', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3284', '41151526', '����', '188582', '��', null, null, null, null, '123456', '23', '0', null, '41151526', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3285', '41151505', '���Ҵ�', '084380', '��', null, null, null, null, '123456', '23', '0', null, '41151505', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3286', '41151502', '������', '084593', '��', null, null, null, null, '123456', '23', '0', null, '41151502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3287', '41151502', '��־��', '188371', '��', null, null, null, null, '123456', '23', '0', null, '41151502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3288', '41151502', '����Ȫ', '188373', '��', null, null, null, null, '123456', '23', '0', null, '41151502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3289', '41151502', '��ʤ��', '084813', '��', null, null, null, null, '123456', '23', '0', null, '41151502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3290', '41151502', '������', '084589', '��', null, null, null, null, '123456', '23', '0', null, '41151502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3291', '41151502', '������', '084731', '��', null, null, null, null, '123456', '23', '0', null, '41151502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3292', '41151502', '����', '188587', '��', null, null, null, null, '123456', '23', '0', null, '41151502', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3293', '41151112', '����', '085741', '��', null, null, null, null, '123456', '23', '0', null, '41151112', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3294', '411515', '��Զ��', '185004', '��', null, null, null, null, '123456', '22', '0', null, '411515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3295', '41151529', '������', '084659', '��', null, null, null, null, '123456', '23', '0', null, '41151529', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3296', '41151529', '������', '188505', '��', null, null, null, null, '123456', '23', '0', null, '41151529', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3297', '41151529', '������', '084782', '��', null, null, null, null, '123456', '23', '0', null, '41151529', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3298', '41151524', '�¿���', '188518', '��', null, null, null, null, '123456', '23', '0', null, '41151524', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3299', '41151524', '������', '188539', '��', null, null, null, null, '123456', '23', '0', null, '41151524', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3300', '41151514', '������', '01084806', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3301', '41151514', '������', '01084675', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3302', '411515', '����', '084732', '��', null, null, null, null, '123456', '22', '0', null, '411515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3303', '41151804', '��˧', 'ZA0301', '��', null, null, null, null, '123456', '23', '0', null, '41151804', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3304', '41151519', '�ش��', '084634', '��', null, null, null, null, '123456', '23', '0', null, '41151519', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3305', '41151519', '���³�', '084649', '��', null, null, null, null, '123456', '23', '0', null, '41151519', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3306', '41151519', '����', '188579', '��', null, null, null, null, '123456', '23', '0', null, '41151519', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3307', '41151519', '�վ���', '188513', '��', null, null, null, null, '123456', '23', '0', null, '41151519', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3308', '41151531', '������', '185511', '��', null, null, null, null, '123456', '23', '0', null, '41151531', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3309', '411514', 'WL', 'WL', '��', null, null, null, null, '123456', '22', '0', null, '411514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3310', '41151405', '�����', '185558', '��', null, null, null, null, '123456', '23', '0', null, '41151405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3311', '41151504', '�⸣��', '084674', '��', null, null, null, null, '123456', '23', '0', null, '41151504', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3312', '41151101', '��ΰ', '085734', '��', null, null, null, null, '123456', '23', '0', null, '41151101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3313', '41151101', '����', '085860', '��', null, null, null, null, '123456', '23', '0', null, '41151101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3314', '41151513', '���', '084656', '��', null, null, null, null, '123456', '23', '0', null, '41151513', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3315', '41151514', '����', '13949180006', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3316', '41151514', '�λ�', '13949187896', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3317', '41151514', '����', '13523891616', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3318', '41151514', '̷��', '13569768006', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3319', '41151514', 'л����', '13937635666', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3320', '41151101', '������', '085938', '��', null, null, null, null, '123456', '23', '0', null, '41151101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3321', '41151110', '������', '085973', '��', null, null, null, null, '123456', '23', '0', null, '41151110', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3322', '41151102', '�⽨��', '085908', '��', null, null, null, null, '123456', '23', '0', null, '41151102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3323', '41151109', '������', '085717', '��', null, null, null, null, '123456', '23', '0', null, '41151109', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3324', '41151109', '����', '085892', '��', null, null, null, null, '123456', '23', '0', null, '41151109', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3325', '41151514', '�μҲ�', '01084705', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3326', '4115120302', '����Ⱥ', '087970', '��', null, null, null, null, '123456', '23', '0', null, '4115120302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3327', '411512132405', '����', '085406', '��', null, null, null, null, '123456', '23', '0', null, '411512132405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3328', '41150214', '������', '187183', '��', null, null, null, null, '123456', '23', '0', null, '41150214', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3329', '41150311', '����', '187889', '��', null, null, null, null, '123456', '23', '0', null, '41150311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3330', '41151514', '�����', '13603977076', '��', null, null, null, null, '123456', '23', '0', null, '41151514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3331', '411513', 'XX', 'XX', '��', null, null, null, null, '123456', '22', '0', null, '411513', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3332', '411513', '����', '189922', '��', null, null, null, null, '123456', '22', '0', null, '411513', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3333', '41151311', '����', '189908', '��', null, null, null, null, '123456', '23', '0', null, '41151311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3334', '41151311', '������', '088797', '��', null, null, null, null, '123456', '23', '0', null, '41151311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3335', '41151311', '��־', '189842', '��', null, null, null, null, '123456', '23', '0', null, '41151311', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3336', '41151315', '����', '189913', '��', null, null, null, null, '123456', '23', '0', null, '41151315', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3337', '41151315', '��ӭʤ', '088963', '��', null, null, null, null, '123456', '23', '0', null, '41151315', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3338', '41151315', '����', '189852', '��', null, null, null, null, '123456', '23', '0', null, '41151315', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3339', '41151306', '����', '189912', '��', null, null, null, null, '123456', '23', '0', null, '41151306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3340', '41151306', '����', '189995', '��', null, null, null, null, '123456', '23', '0', null, '41151306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3341', '41151306', '����', '189965', '��', null, null, null, null, '123456', '23', '0', null, '41151306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3342', '41151306', '����', '189885', '��', null, null, null, null, '123456', '23', '0', null, '41151306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3343', '41151306', '����¥', '189855', '��', null, null, null, null, '123456', '23', '0', null, '41151306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3344', '41151306', '����', '088881', '��', null, null, null, null, '123456', '23', '0', null, '41151306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3345', '41151314', '������', '189963', '��', null, null, null, null, '123456', '23', '0', null, '41151314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3346', '41151314', '��Ⱥ��', '189864', '��', null, null, null, null, '123456', '23', '0', null, '41151314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3347', '41151314', '����', '189822', '��', null, null, null, null, '123456', '23', '0', null, '41151314', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3348', '41151304', '�±���', '189905', '��', null, null, null, null, '123456', '23', '0', null, '41151304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3349', '41151304', '������', '088961', '��', null, null, null, null, '123456', '23', '0', null, '41151304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3350', '41151304', '����', '189836', '��', null, null, null, null, '123456', '23', '0', null, '41151304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3351', '41151304', '���´�', '189879', '��', null, null, null, null, '123456', '23', '0', null, '41151304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3352', '41151304', '�ſ�', '189916', '��', null, null, null, null, '123456', '23', '0', null, '41151304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3353', '41151304', '�����', '189901', '��', null, null, null, null, '123456', '23', '0', null, '41151304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3354', '41151305', '����', '189891', '��', null, null, null, null, '123456', '23', '0', null, '41151305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3355', '41151305', 'Ҧ��', '088397', '��', null, null, null, null, '123456', '23', '0', null, '41151305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3356', '41151305', '�ܹ���', '189988', '��', null, null, null, null, '123456', '23', '0', null, '41151305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3357', '41151305', '��־��', '189860', '��', null, null, null, null, '123456', '23', '0', null, '41151305', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3358', '41151307', '����', '189921', '��', null, null, null, null, '123456', '23', '0', null, '41151307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3359', '41151307', '��ά��', '189975', '��', null, null, null, null, '123456', '23', '0', null, '41151307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3360', '41151307', '�ܳ���', '18921', '��', null, null, null, null, '123456', '23', '0', null, '41151307', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3361', '41151318', '����', '050491', '��', null, null, null, null, '123456', '23', '0', null, '41151318', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3362', '41151308', '������', '189877', '��', null, null, null, null, '123456', '23', '0', null, '41151308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3363', '41151308', '�ź���', '189976', '��', null, null, null, null, '123456', '23', '0', null, '41151308', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3364', '41151320', '������', '189986', '��', null, null, null, null, '123456', '23', '0', null, '41151320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3365', '41151320', '�¾��', '189967', '��', null, null, null, null, '123456', '23', '0', null, '41151320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3366', '41151320', '������', '088886', '��', null, null, null, null, '123456', '23', '0', null, '41151320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3367', '41151318', '������', '189863', '��', null, null, null, null, '123456', '23', '0', null, '41151318', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3368', '41151318', '�Ż�', '640341', '��', null, null, null, null, '123456', '23', '0', null, '41151318', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3369', '41151319', '����', '088925', '��', null, null, null, null, '123456', '23', '0', null, '41151319', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3370', '41151319', '������', '189858', '��', null, null, null, null, '123456', '23', '0', null, '41151319', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3371', '41151317', '����', '189952', '��', null, null, null, null, '123456', '23', '0', null, '41151317', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3372', '41151317', '���', '300011', '��', null, null, null, null, '123456', '23', '0', null, '41151317', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3373', '41151312', '����', '189902', '��', null, null, null, null, '123456', '23', '0', null, '41151312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3374', '41151312', '��ϼ', '189848', '��', null, null, null, null, '123456', '23', '0', null, '41151312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3375', '41151312', '��С��', '088962', '��', null, null, null, null, '123456', '23', '0', null, '41151312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3376', '41151312', '��˧��', '189961', '��', null, null, null, null, '123456', '23', '0', null, '41151312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3377', '41151312', '����', '189962', '��', null, null, null, null, '123456', '23', '0', null, '41151312', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3378', '41151310', '����', '189980', '��', null, null, null, null, '123456', '23', '0', null, '41151310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3379', '41151310', '����ɭ', '189883', '��', null, null, null, null, '123456', '23', '0', null, '41151310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3380', '41151310', '������', '189851', '��', null, null, null, null, '123456', '23', '0', null, '41151310', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3381', '41151313', '����', '189957', '��', null, null, null, null, '123456', '23', '0', null, '41151313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3382', '41151309', '������', '088850', '��', null, null, null, null, '123456', '23', '0', null, '41151309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3383', '41151309', '����', '088892', '��', null, null, null, null, '123456', '23', '0', null, '41151309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3384', '41151309', '������', '189937', '��', null, null, null, null, '123456', '23', '0', null, '41151309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3385', '41151309', '�߽���', '189973', '��', null, null, null, null, '123456', '23', '0', null, '41151309', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3386', '41151316', '������', '088792', '��', null, null, null, null, '123456', '23', '0', null, '41151316', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3387', '41151316', '������', '154894', '��', null, null, null, null, '123456', '23', '0', null, '41151316', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3388', '41151316', '���й�', '191319', '��', null, null, null, null, '123456', '23', '0', null, '41151316', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3389', '41151318', '����', '189950', '��', null, null, null, null, '123456', '23', '0', null, '41151318', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3390', '41151318', '�Ź���', '212414', '��', null, null, null, null, '123456', '23', '0', null, '41151318', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3391', '41151318', '���ڷ�', '090419', '��', null, null, null, null, '123456', '23', '0', null, '41151318', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3392', '41151318', '����', '12041X', '��', null, null, null, null, '123456', '23', '0', null, '41151318', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3393', '41151318', '��Ӣ��', '094832', '��', null, null, null, null, '123456', '23', '0', null, '41151318', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3394', '41151318', '����', '133763', '��', null, null, null, null, '123456', '23', '0', null, '41151318', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3395', '41151318', '����', '189983', '��', null, null, null, null, '123456', '23', '0', null, '41151318', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3396', '41151316', '���', '100910', '��', null, null, null, null, '123456', '23', '0', null, '41151316', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3397', '41151302', '����', '189915', '��', null, null, null, null, '123456', '23', '0', null, '41151302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3398', '41151301', '���溣', '088399', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3399', '41151301', '���', '171350', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3400', '41151301', '������', '100418', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3401', '41151301', '�￡', '090415', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3402', '41151301', '����', '080413', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3403', '41151321', '���ˮ', '189918', '��', null, null, null, null, '123456', '23', '0', null, '41151321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3404', '41151321', '�⻪��', '088979', '��', null, null, null, null, '123456', '23', '0', null, '41151321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3405', '41151321', '����ɽ', '189834', '��', null, null, null, null, '123456', '23', '0', null, '41151321', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3406', '41151301', '�¶���', '030310', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3407', '41151301', '����', '180411', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3408', '41151301', '�ʵ���', '020011', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3409', '41151301', '������', '170413', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3410', '41151301', '����', '171317', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3411', '41151301', '��ʢ', '190428', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3412', '41151301', '����', '172819', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3413', '41151301', '���', '040914', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3414', '41151301', '��ϲ', '080033', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3415', '41151301', '������', '200919', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3416', '41151301', '����', '181336', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3417', '41151301', '������', '020036', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3418', '41151301', '���', '210416', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3419', '41151301', '����', '152812', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3420', '41151301', 'ξ��Դ', '120012', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3421', '41151301', '���', '061315', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3422', '41151301', '����', '221737', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3423', '41151111', '����', '185038', '��', null, null, null, null, '123456', '23', '0', null, '41151111', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3424', '41151301', '�ƻ�', '200932', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3425', '41151301', '�೤��', '100433', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3426', '41151302', '����', '189982', '��', null, null, null, null, '123456', '23', '0', null, '41151302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3427', '41151301', '����', '190410', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3428', '41151301', '����', '090418', '��', null, null, null, null, '123456', '23', '0', null, '41151301', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3429', '41150706', '����', '999999', '��', null, null, null, null, '123456', '23', '0', null, '41150706', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3430', '41151515', '���', '084429', '��', null, null, null, null, '123456', '23', '0', null, '41151515', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3431', '41151103', '������', '185091', '��', null, null, null, null, '123456', '23', '0', null, '41151103', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3432', '41151105', '�¶�', '185046', '��', null, null, null, null, '123456', '23', '0', null, '41151105', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3433', '41151113', '����', '085894', '��', null, null, null, null, '123456', '23', '0', null, '41151113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3434', '41151113', '֣�ַ�', '085804', '��', null, null, null, null, '123456', '23', '0', null, '41151113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3435', '41151113', '�ų���', '185034', '��', null, null, null, null, '123456', '23', '0', null, '41151113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3436', '41151113', 'ף�°�', '185073', '��', null, null, null, null, '123456', '23', '0', null, '41151113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3437', '41151113', '�Է�', '085799', '��', null, null, null, null, '123456', '23', '0', null, '41151113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3438', '41151113', '����', '185020', '��', null, null, null, null, '123456', '23', '0', null, '41151113', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3439', '41151124', '��Ǳ��', '085744', '��', null, null, null, null, '123456', '23', '0', null, '41151124', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3440', '41151101', '����', '185007', '��', null, null, null, null, '123456', '23', '0', null, '41151101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3441', '41151101', '�ƴ�', '085962', '��', null, null, null, null, '123456', '23', '0', null, '41151101', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3442', '41151102', '����', '185070', '��', null, null, null, null, '123456', '23', '0', null, '41151102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3443', '41151102', '����', '185008', '��', null, null, null, null, '123456', '23', '0', null, '41151102', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3444', '41151711', '����¡', '185760', '��', null, null, null, null, '123456', '23', '0', null, '41151711', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3445', '41151711', '������', 'FJ1067', '��', null, null, null, null, '123456', '23', '0', null, '41151711', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3446', '41151822', '����', '189584', '��', null, null, null, null, '123456', '23', '0', null, '41151822', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3447', '41151406', '�����', '088375', '��', null, null, null, null, '123456', '23', '0', null, '41151406', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3448', '41151733', '������', '088448', '��', null, null, null, null, '123456', '23', '0', null, '41151733', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3449', '41151733', '������', '088735', '��', null, null, null, null, '123456', '23', '0', null, '41151733', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3450', '41151733', '����Ӯ', 'FJ1026', '��', null, null, null, null, '123456', '23', '0', null, '41151733', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3451', '41151107', 'Ҧ��', '085686', '��', null, null, null, null, '123456', '23', '0', null, '41151107', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3452', '41151726', '�����', '185806', '��', null, null, null, null, '123456', '23', '0', null, '41151726', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3453', '41151727', '�ƽ��', '185689', '��', null, null, null, null, '123456', '23', '0', null, '41151727', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3454', '41151723', '�µǾ�', '088401', '��', null, null, null, null, '123456', '23', '0', null, '41151723', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3455', '41151703', '��  ��', '088649', '��', null, null, null, null, '123456', '23', '0', null, '41151703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3456', '41151703', '�ſ���', '088518', '��', null, null, null, null, '123456', '23', '0', null, '41151703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3457', '41151730', '��  ��', '088686', '��', null, null, null, null, '123456', '23', '0', null, '41151730', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3458', '41151730', '�¼�', '185698', '��', null, null, null, null, '123456', '23', '0', null, '41151730', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3459', '41151730', '��ǰ��', '088659', '��', null, null, null, null, '123456', '23', '0', null, '41151730', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3460', '41151717', '��ѧ��', '185798', '��', null, null, null, null, '123456', '23', '0', null, '41151717', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3461', '41151730', '������', '185811', '��', null, null, null, null, '123456', '23', '0', null, '41151730', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3462', '41151729', '����', '088419', '��', null, null, null, null, '123456', '23', '0', null, '41151729', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3463', '41151729', '��  ǿ', '088597', '��', null, null, null, null, '123456', '23', '0', null, '41151729', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3464', '41151728', '������', '088596', '��', null, null, null, null, '123456', '23', '0', null, '41151728', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3465', '41151728', '��ұ�', '088628', '��', null, null, null, null, '123456', '23', '0', null, '41151728', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3466', '41151728', '��  ��', '088539', '��', null, null, null, null, '123456', '23', '0', null, '41151728', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3467', '41151703', '��  ��', '185805', '��', null, null, null, null, '123456', '23', '0', null, '41151703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3468', '41151733', '�̹��', '088683', '��', null, null, null, null, '123456', '23', '0', null, '41151733', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3469', '41151704', '�뺣��', '088719', '��', null, null, null, null, '123456', '23', '0', null, '41151704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3470', '41151705', '������', '088741', '��', null, null, null, null, '123456', '23', '0', null, '41151705', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3471', '41151706', '½���', '185775', '��', null, null, null, null, '123456', '23', '0', null, '41151706', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3472', '41151732', '��  ��', '088432', '��', null, null, null, null, '123456', '23', '0', null, '41151732', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3473', '41151732', '������', '088545', '��', null, null, null, null, '123456', '23', '0', null, '41151732', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3474', '41151732', '��  ��', '088658', '��', null, null, null, null, '123456', '23', '0', null, '41151732', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3475', '41151707', '����Ȩ', '088431', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3476', '41151707', '����ΰ', '088606', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3477', '41151707', '��  ��', '088694', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3478', '41151707', '��  ��', '088594', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3479', '41151707', '������', '088475', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3480', '41151707', '������', '088490', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3481', '41151707', '������', '088580', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3482', '41151707', '��  ��', '088710', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3483', '41151728', '�ݷ���', '088537', '��', null, null, null, null, '123456', '23', '0', null, '41151728', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3484', '41151707', '��  ��', '088574', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3485', '41151707', '��  ��', '088541', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3486', '41151707', '��  ΰ', '088605', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3487', '41151707', '����Ȼ', '088722', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3488', '41151707', '������', '088509', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3489', '41151707', '�����', '088453', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3490', '41151707', '�����', '088573', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3491', '41151707', '�ſ���', '088751', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3492', '41151707', '����ǿ', '185727', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3493', '41151707', '������', '088587', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3494', '41151707', '������', '185803', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3495', '41151707', '�طƷ�', '185800', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3496', '41151707', '��  ��', '185816', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3497', '41151707', '����ΰ', '185763', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3498', '41151707', '��ռ��', '185801', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3499', '41151707', '��С��', '185815', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3500', '41151707', '֣  ΰ', '185795', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3501', '41151708', '������', '088684', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3502', '41151708', '÷  ��', '088706', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3503', '41151708', '갿˺�', '088625', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3504', '41151708', '���', '088600', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3505', '41151708', '���Ƿ�', '088727', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3506', '41151708', '�����', '088728', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3507', '41151708', '����', '088505', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3508', '41151708', '���վ�', '088560', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3509', '41151708', '������', '088650', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3510', '41151708', '��  ��', '088551', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3511', '41151708', '��  ��', '088646', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3512', '41151707', '�´Ӿ�', '088593', '��', null, null, null, null, '123456', '23', '0', null, '41151707', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3513', '41151413', '��ѫ��', '088346', '��', null, null, null, null, '123456', '23', '0', null, '41151413', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3514', '41151413', '����', '088239', '��', null, null, null, null, '123456', '23', '0', null, '41151413', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3515', '41151413', '���', '185326', '��', null, null, null, null, '123456', '23', '0', null, '41151413', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3516', '41151413', '��ҫ��', '085865', '��', null, null, null, null, '123456', '23', '0', null, '41151413', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3517', '41151402', '������', '088159', '��', null, null, null, null, '123456', '23', '0', null, '41151402', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3518', '41151402', '����', '185335', '��', null, null, null, null, '123456', '23', '0', null, '41151402', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3519', '41151402', '������', '088288', '��', null, null, null, null, '123456', '23', '0', null, '41151402', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3520', '41151402', '������', '088287', '��', null, null, null, null, '123456', '23', '0', null, '41151402', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3521', '41151405', '������', '185377', '��', null, null, null, null, '123456', '23', '0', null, '41151405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3522', '41151411', '������', '088373', '��', null, null, null, null, '123456', '23', '0', null, '41151411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3523', '41151302', '¬��', '189987', '��', null, null, null, null, '123456', '23', '0', null, '41151302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3524', '41151302', '�޳�', '189909', '��', null, null, null, null, '123456', '23', '0', null, '41151302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3525', '41151302', '������', '189903', '��', null, null, null, null, '123456', '23', '0', null, '41151302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3526', '41151302', '�ջ�', '189862', '��', null, null, null, null, '123456', '23', '0', null, '41151302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3527', '41151302', '��ȫɭ', '189991', '��', null, null, null, null, '123456', '23', '0', null, '41151302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3528', '41151302', '������', '189993', '��', null, null, null, null, '123456', '23', '0', null, '41151302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3529', '41151302', '����', '189859', '��', null, null, null, null, '123456', '23', '0', null, '41151302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3530', '41151302', '������', '189841', '��', null, null, null, null, '123456', '23', '0', null, '41151302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3531', '41151302', '���', '189878', '��', null, null, null, null, '123456', '23', '0', null, '41151302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3532', '411512132607', '�ξ�', '084256', '��', null, null, null, null, '123456', '23', '0', null, '411512132607', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3533', '41151703', '���', '185793', '��', null, null, null, null, '123456', '23', '0', null, '41151703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3534', '41151703', '�����', '185739', '��', null, null, null, null, '123456', '23', '0', null, '41151703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3535', '41151713', '������', '185820', '��', null, null, null, null, '123456', '23', '0', null, '41151713', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3536', '41151704', '������', 'FJ1017', '��', null, null, null, null, '123456', '23', '0', null, '41151704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3537', '41151704', '����ΰ', 'FJ1020', '��', null, null, null, null, '123456', '23', '0', null, '41151704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3538', '41151704', '���', 'FJ1022', '��', null, null, null, null, '123456', '23', '0', null, '41151704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3539', '41151704', '����ǿ', 'FJ1021', '��', null, null, null, null, '123456', '23', '0', null, '41151704', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3540', '41151705', '֣��ΰ', '185758', '��', null, null, null, null, '123456', '23', '0', null, '41151705', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3541', '41151709', '������', 'XF1105', '��', null, null, null, null, '123456', '23', '0', null, '41151709', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3542', '41151709', '�¼�', 'FJ1106', '��', null, null, null, null, '123456', '23', '0', null, '41151709', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3543', '41151725', '������', '185833', '��', null, null, null, null, '123456', '23', '0', null, '41151725', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3544', '41151710', '����', '185823', '��', null, null, null, null, '123456', '23', '0', null, '41151710', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3545', '41151702', '������', '185829', '��', null, null, null, null, '123456', '23', '0', null, '41151702', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3546', '411516', '������', '187996', '��', null, null, null, null, '123456', '22', '0', null, '411516', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3547', '41151609', '�Ʋ�', '084099', '��', null, null, null, null, '123456', '23', '0', null, '41151609', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3548', '411516', 'LS', 'LS', '��', null, null, null, null, '123456', '22', '0', null, '411516', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3549', '41151408', '���Ƕ�', '185538', '��', null, null, null, null, '123456', '23', '0', null, '41151408', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3550', '41151408', 'Ҧ����', '185566', '��', null, null, null, null, '123456', '23', '0', null, '41151408', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3551', '41151408', '������', '088156', '��', null, null, null, null, '123456', '23', '0', null, '41151408', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3552', '41151411', '����˳', '088192', '��', null, null, null, null, '123456', '23', '0', null, '41151411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3553', '41151411', '�콣', '088199', '��', null, null, null, null, '123456', '23', '0', null, '41151411', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3554', '41151604', '��ά��', '084216', '��', null, null, null, null, '123456', '23', '0', null, '41151604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3555', '41151604', '�º�Ȼ', '188007', '��', null, null, null, null, '123456', '23', '0', null, '41151604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3556', '41151604', '���', '084352', '��', null, null, null, null, '123456', '23', '0', null, '41151604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3557', '41151604', '��ˬ', '188168', '��', null, null, null, null, '123456', '23', '0', null, '41151604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3558', '41151604', '��˼��', '188190', '��', null, null, null, null, '123456', '23', '0', null, '41151604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3559', '41151604', '�޳���', '188214', '��', null, null, null, null, '123456', '23', '0', null, '41151604', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3560', '41151602', '������', '188101', '��', null, null, null, null, '123456', '23', '0', null, '41151602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3561', '41151602', '������', '084184', '��', null, null, null, null, '123456', '23', '0', null, '41151602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3562', '41151602', '�ĳ���', '188200', '��', null, null, null, null, '123456', '23', '0', null, '41151602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3563', '41151602', '��һ', '188026', '��', null, null, null, null, '123456', '23', '0', null, '41151602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3564', '41151602', '�ż���', '188072', '��', null, null, null, null, '123456', '23', '0', null, '41151602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3565', '41151602', '������', '084282', '��', null, null, null, null, '123456', '23', '0', null, '41151602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3566', '41151603', 'Ϳ����', '084149', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3567', '41151603', '�����', '188073', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3568', '41151603', '����', '084219', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3569', '41151603', '���', '084046', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3570', '41151603', '������', '084109', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3571', '41151603', '�Ƶ���', '084286', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3572', '41151603', '����', '188193', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3573', '41151603', 'Ҧ��ϲ', '084027', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3574', '41151708', '��Ϊ��', '088665', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3575', '41151708', '������', '088556', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3576', '4115121306', '�ۺ�ִ�����1', 'ZHZFDD1', '��', null, null, null, null, '123456', '22', '0', null, '4115121306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3577', '4115121306', '�ۺ�ִ�����2', 'ZHZFDD2', '��', null, null, null, null, '123456', '22', '0', null, '4115121306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3578', '4115121306', '�ۺ�ִ�����3', 'ZHZFDD3', '��', null, null, null, null, '123456', '22', '0', null, '4115121306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3579', '4115121306', '�ۺ�ִ�����4', 'ZHZFDD4', '��', null, null, null, null, '123456', '22', '0', null, '4115121306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3580', '4115121306', '�ۺ�ִ�����5', 'ZHZFDD5', '��', null, null, null, null, '123456', '22', '0', null, '4115121306', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3581', '41151612', '���ݿ�', '188028', '��', null, null, null, null, '123456', '23', '0', null, '41151612', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3582', '41151612', '����', '188128', '��', null, null, null, null, '123456', '23', '0', null, '41151612', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3583', '41151612', '������', '188194', '��', null, null, null, null, '123456', '23', '0', null, '41151612', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3584', '41151612', '������', '188213', '��', null, null, null, null, '123456', '23', '0', null, '41151612', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3585', '41151612', '����', '188266', '��', null, null, null, null, '123456', '23', '0', null, '41151612', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3586', '41151630', '���', '084308', '��', null, null, null, null, '123456', '23', '0', null, '41151630', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3587', '41151630', '����ΰ', '188037', '��', null, null, null, null, '123456', '23', '0', null, '41151630', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3588', '41151630', 'ţ�ı�', '188120', '��', null, null, null, null, '123456', '23', '0', null, '41151630', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3589', '41151619', '�¿���', '084045', '��', null, null, null, null, '123456', '23', '0', null, '41151619', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3590', '41151728', '���ο�', '185831', '��', null, null, null, null, '123456', '23', '0', null, '41151728', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3591', '41151619', '����', '188015', '��', null, null, null, null, '123456', '23', '0', null, '41151619', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3592', '41151619', '������', '188177', '��', null, null, null, null, '123456', '23', '0', null, '41151619', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3593', '41151619', '����', '188207', '��', null, null, null, null, '123456', '23', '0', null, '41151619', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3594', '41151624', '����', '084132', '��', null, null, null, null, '123456', '23', '0', null, '41151624', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3595', '41151624', '������', '188080', '��', null, null, null, null, '123456', '23', '0', null, '41151624', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3596', '41151624', '֣��', '188052', '��', null, null, null, null, '123456', '23', '0', null, '41151624', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3597', '41151629', '����', '188066', '��', null, null, null, null, '123456', '23', '0', null, '41151629', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3598', '41151629', '��ΰΰ', '188092', '��', null, null, null, null, '123456', '23', '0', null, '41151629', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3599', '41151629', '����', '188163', '��', null, null, null, null, '123456', '23', '0', null, '41151629', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3600', '41151629', '����ǿ', '188209', '��', null, null, null, null, '123456', '23', '0', null, '41151629', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3601', '41151617', '�޻�', '084266', '��', null, null, null, null, '123456', '23', '0', null, '41151617', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3602', '41151617', '����', '188125', '��', null, null, null, null, '123456', '23', '0', null, '41151617', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3603', '41151614', '������', '084053', '��', null, null, null, null, '123456', '23', '0', null, '41151614', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3604', '41151614', '���', '084138', '��', null, null, null, null, '123456', '23', '0', null, '41151614', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3605', '41151614', '�Գɺ�', '188171', '��', null, null, null, null, '123456', '23', '0', null, '41151614', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3606', '41151614', '��ǰ��', '188201', '��', null, null, null, null, '123456', '23', '0', null, '41151614', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3607', '41151628', '����', '084130', '��', null, null, null, null, '123456', '23', '0', null, '41151628', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3608', '41151628', '������', '188138', '��', null, null, null, null, '123456', '23', '0', null, '41151628', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3609', '41151626', '�Լ���', '084108', '��', null, null, null, null, '123456', '23', '0', null, '41151626', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3610', '41151626', '��ҫ��', '187991', '��', null, null, null, null, '123456', '23', '0', null, '41151626', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3611', '41151626', '����', '188167', '��', null, null, null, null, '123456', '23', '0', null, '41151626', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3612', '41151626', '������', '188211', '��', null, null, null, null, '123456', '23', '0', null, '41151626', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3613', '41151625', '�⽣', '084055', '��', null, null, null, null, '123456', '23', '0', null, '41151625', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3614', '41151625', '�²�', '188058', '��', null, null, null, null, '123456', '23', '0', null, '41151625', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3615', '41151625', '����', '187995', '��', null, null, null, null, '123456', '23', '0', null, '41151625', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3616', '41151625', 'κ��', '188212', '��', null, null, null, null, '123456', '23', '0', null, '41151625', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3617', '41151616', '��ǿ', '187978', '��', null, null, null, null, '123456', '23', '0', null, '41151616', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3618', '41151616', '���', '188195', '��', null, null, null, null, '123456', '23', '0', null, '41151616', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3619', '41151616', '����ǿ', '188204', '��', null, null, null, null, '123456', '23', '0', null, '41151616', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3620', '41151620', '÷��˫', '188191', '��', null, null, null, null, '123456', '23', '0', null, '41151620', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3621', '41151708', '������', '412949', '��', null, null, null, null, '123456', '23', '0', null, '41151708', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3622', '41151620', 'Ѧ��', '188078', '��', null, null, null, null, '123456', '23', '0', null, '41151620', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3623', '41151620', '���»�', '188061', '��', null, null, null, null, '123456', '23', '0', null, '41151620', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3624', '41151620', '����', '187973', '��', null, null, null, null, '123456', '23', '0', null, '41151620', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3625', '41151621', '�ż���', '187987', '��', null, null, null, null, '123456', '23', '0', null, '41151621', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3626', '41151621', '�޼���', '187992', '��', null, null, null, null, '123456', '23', '0', null, '41151621', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3627', '41151621', '���ܿ�', '188206', '��', null, null, null, null, '123456', '23', '0', null, '41151621', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3628', '41151621', '����', '188215', '��', null, null, null, null, '123456', '23', '0', null, '41151621', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3629', '41151627', '�ž�', '084128', '��', null, null, null, null, '123456', '23', '0', null, '41151627', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3630', '41151627', '֣տ', '084246', '��', null, null, null, null, '123456', '23', '0', null, '41151627', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3631', '41151627', '��ʤ', '188079', '��', null, null, null, null, '123456', '23', '0', null, '41151627', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3632', '41151627', '��ǿ', '188175', '��', null, null, null, null, '123456', '23', '0', null, '41151627', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3633', '41151627', '������', '188121', '��', null, null, null, null, '123456', '23', '0', null, '41151627', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3634', '41151615', '���', '084084', '��', null, null, null, null, '123456', '23', '0', null, '41151615', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3635', '41151615', '����', '188091', '��', null, null, null, null, '123456', '23', '0', null, '41151615', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3636', '41151615', '��վ��', '188132', '��', null, null, null, null, '123456', '23', '0', null, '41151615', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3637', '41151615', '¬�ӽ�', '188205', '��', null, null, null, null, '123456', '23', '0', null, '41151615', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3638', '41151613', '����Ϊ', '188118', '��', null, null, null, null, '123456', '23', '0', null, '41151613', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3639', '41151613', 'Ԭ����', '188129', '��', null, null, null, null, '123456', '23', '0', null, '41151613', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3640', '41151613', 'ҶԪԪ', '188178', '��', null, null, null, null, '123456', '23', '0', null, '41151613', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3641', '41151613', '�ܾ�', '084345', '��', null, null, null, null, '123456', '23', '0', null, '41151613', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3642', '41151613', '�޵¸�', '084049', '��', null, null, null, null, '123456', '23', '0', null, '41151613', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3643', '41151623', '�Ժ�', '084131', '��', null, null, null, null, '123456', '23', '0', null, '41151623', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3644', '41151623', '����', '188130', '��', null, null, null, null, '123456', '23', '0', null, '41151623', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3645', '41151623', '�ܷ���', '084301', '��', null, null, null, null, '123456', '23', '0', null, '41151623', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3646', '41151631', '����', '084028', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3647', '41151631', '�˷�', '187979', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3648', '41151631', '����', '188065', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3649', '41151631', '����', '187997', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3650', '41151631', '����', '188081', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3651', '41151631', '������', '084129', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3652', '41151631', '����ͯ', '188117', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3653', '41151618', '����', '188107', '��', null, null, null, null, '123456', '23', '0', null, '41151618', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3654', '41151618', '����', '188102', '��', null, null, null, null, '123456', '23', '0', null, '41151618', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3655', '41151618', '��ǿ', '084361', '��', null, null, null, null, '123456', '23', '0', null, '41151618', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3656', '41151618', '����', '084228', '��', null, null, null, null, '123456', '23', '0', null, '41151618', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3657', '41151632', '������', '084217', '��', null, null, null, null, '123456', '23', '0', null, '41151632', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3658', '41151632', '�촫��', '084363', '��', null, null, null, null, '123456', '23', '0', null, '41151632', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3659', '41151632', '�ߺ꺣', '084280', '��', null, null, null, null, '123456', '23', '0', null, '41151632', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3660', '41151608', '��Ʒ��', '084107', '��', null, null, null, null, '123456', '23', '0', null, '41151608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3661', '41151608', '��ǿ', '084307', '��', null, null, null, null, '123456', '23', '0', null, '41151608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3662', '41151608', '�Ž�', '188055', '��', null, null, null, null, '123456', '23', '0', null, '41151608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3663', '41151608', '����ΰ', '084338', '��', null, null, null, null, '123456', '23', '0', null, '41151608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3664', '41151608', '��־ΰ', '084081', '��', null, null, null, null, '123456', '23', '0', null, '41151608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3665', '41151608', '�¿�', '188011', '��', null, null, null, null, '123456', '23', '0', null, '41151608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3666', '41151608', '³˼��', '084355', '��', null, null, null, null, '123456', '23', '0', null, '41151608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3667', '41151608', '����', '084302', '��', null, null, null, null, '123456', '23', '0', null, '41151608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3668', '41151608', '÷ӵ��', '188038', '��', null, null, null, null, '123456', '23', '0', null, '41151608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3669', '41151608', '����', '084349', '��', null, null, null, null, '123456', '23', '0', null, '41151608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3670', '41151608', '������', '188067', '��', null, null, null, null, '123456', '23', '0', null, '41151608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3671', '41151608', '����ʤ', '084251', '��', null, null, null, null, '123456', '23', '0', null, '41151608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3672', '411516', '������', '188192', '��', null, null, null, null, '123456', '22', '0', null, '411516', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3673', '41151608', 'Ф���', '188025', '��', null, null, null, null, '123456', '23', '0', null, '41151608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3674', '41151608', '����', '085379', '��', null, null, null, null, '123456', '23', '0', null, '41151608', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3675', '41151634', 'Ҧ����', '084110', '��', null, null, null, null, '123456', '23', '0', null, '41151634', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3676', '41151634', '�ξ�', '084117', '��', null, null, null, null, '123456', '23', '0', null, '41151634', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3677', '41151634', '����', '084326', '��', null, null, null, null, '123456', '23', '0', null, '41151634', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3678', '41151634', '�����', '084396', '��', null, null, null, null, '123456', '23', '0', null, '41151634', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3679', '41151634', '����', '084172', '��', null, null, null, null, '123456', '23', '0', null, '41151634', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3680', '41151634', '֣���', '084017', '��', null, null, null, null, '123456', '23', '0', null, '41151634', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3681', '41151606', 'Ф��ƽ', '084289', '��', null, null, null, null, '123456', '23', '0', null, '41151606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3682', '41151606', '������', '084134', '��', null, null, null, null, '123456', '23', '0', null, '41151606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3683', '41151606', '����', '187983', '��', null, null, null, null, '123456', '23', '0', null, '41151606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3684', '41151606', '���', '188027', '��', null, null, null, null, '123456', '23', '0', null, '41151606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3685', '41151606', '����', '188216', '��', null, null, null, null, '123456', '23', '0', null, '41151606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3686', '41151606', '�̿�', '188059', '��', null, null, null, null, '123456', '23', '0', null, '41151606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3687', '41151606', '�����', '084244', '��', null, null, null, null, '123456', '23', '0', null, '41151606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3688', '41151606', '�¾���', '187990', '��', null, null, null, null, '123456', '23', '0', null, '41151606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3689', '41151606', '��Զ��', '188035', '��', null, null, null, null, '123456', '23', '0', null, '41151606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3690', '41151606', '��ά˼', '188008', '��', null, null, null, null, '123456', '23', '0', null, '41151606', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3691', '41151603', '�����', '187981', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3692', '41151603', '������', '084137', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3693', '41151603', '����', '084022', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3694', '41151603', '����', '187975', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3695', '41151603', '����', '188082', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3696', '41151603', '����', '188202', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3697', '41151603', '�Ӿ�', '084257', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3698', '41151603', 'ʯ��Դ', '188160', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3699', '41151603', '����', '084102', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3700', '41151633', '��Ԫѧ', '084239', '��', null, null, null, null, '123456', '23', '0', null, '41151633', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3701', '41151633', '��Ȫ', '188170', '��', null, null, null, null, '123456', '23', '0', null, '41151633', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3702', '41151605', '������', '188083', '��', null, null, null, null, '123456', '23', '0', null, '41151605', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3703', '41151605', '��ο', '188165', '��', null, null, null, null, '123456', '23', '0', null, '41151605', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3704', '41151635', '�κ�ϼ', '084021', '��', null, null, null, null, '123456', '23', '0', null, '41151635', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3705', '41151635', '��ʤǿ', '084350', '��', null, null, null, null, '123456', '23', '0', null, '41151635', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3706', '41151635', 'Ԭ��', '187998', '��', null, null, null, null, '123456', '23', '0', null, '41151635', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3707', '41151412', '����', '185568', '��', null, null, null, null, '123456', '23', '0', null, '41151412', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3708', '41151412', '�ﲨ', '088125', '��', null, null, null, null, '123456', '23', '0', null, '41151412', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3709', '41151412', '����', '185553', '��', null, null, null, null, '123456', '23', '0', null, '41151412', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3710', '41151412', '����', '088380', '��', null, null, null, null, '123456', '23', '0', null, '41151412', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3711', '41151409', '����', '088191', '��', null, null, null, null, '123456', '23', '0', null, '41151409', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3712', '41151409', '��³ԥ', '088297', '��', null, null, null, null, '123456', '23', '0', null, '41151409', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3713', '41151409', '����', '185395', '��', null, null, null, null, '123456', '23', '0', null, '41151409', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3714', '41151703', '������', 'FJ1008', '��', null, null, null, null, '123456', '23', '0', null, '41151703', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3715', '41151713', '�Ծ���', 'FJ1031', '��', null, null, null, null, '123456', '23', '0', null, '41151713', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3716', '41151713', '������', 'FJ1033', '��', null, null, null, null, '123456', '23', '0', null, '41151713', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3717', '41151407', '���', '088171', '��', null, null, null, null, '123456', '23', '0', null, '41151407', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3718', '41151407', '���麣', '088149', '��', null, null, null, null, '123456', '23', '0', null, '41151407', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3719', '41151410', '�ܴ���', '088858', '��', null, null, null, null, '123456', '23', '0', null, '41151410', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3720', '41151410', '������', '185567', '��', null, null, null, null, '123456', '23', '0', null, '41151410', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3721', '41151410', '�˷�', '185350', '��', null, null, null, null, '123456', '23', '0', null, '41151410', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3722', '41151410', '����', '189872', '��', null, null, null, null, '123456', '23', '0', null, '41151410', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3723', '41151631', '����', '900001', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3724', '41151631', '����', '900002', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3725', '41151631', '����', '900003', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3726', '41151631', '����', '900004', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3727', '41151631', '������', '900005', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3728', '41151631', '������', '900006', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3729', '41151631', '���ɱ�', '900007', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3730', '41151631', '������', '900008', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3731', '41151631', '��ΰ', '900009', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3732', '41151631', '�޷�', '900010', '��', null, null, null, null, '123456', '23', '0', null, '41151631', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3733', '41151616', '������', '084333', '��', null, null, null, null, '123456', '23', '0', null, '41151616', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3734', '41151603', '���', '188133', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3735', '4115121304', '��·Ѳ�ߴ��1', 'XJ0001', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3736', '4115121304', '��·Ѳ�ߴ��2', 'XJ0002', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3737', '4115121304', '��·Ѳ�ߴ��3', 'XJ0003', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3738', '4115121304', '��·Ѳ�ߴ��4', 'XJ0004', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3739', '41151401', '�೤��', '088148', '��', null, null, null, null, '123456', '23', '0', null, '41151401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3740', '4115121304', '��·Ѳ�ߴ��5', 'XJ0005', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3741', '4115121304', '��·Ѳ�ߴ��6', 'XJ0006', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3742', '4115121304', '��·Ѳ�ߴ��7', 'XJ0007', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3743', '4115121304', '��·Ѳ�ߴ��8', 'XJ0008', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3744', '4115121304', '��·Ѳ�ߴ��9', 'XJ0009', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3745', '4115121304', '��·Ѳ�ߴ��10', 'XJ0010', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3746', '4115121304', '��·Ѳ�ߴ��11', 'XJ0011', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3747', '4115121304', '��·Ѳ�ߴ��12', 'XJ0012', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3748', '4115121304', '��·Ѳ�ߴ��13', 'XJ0013', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3749', '4115121304', '��·Ѳ�ߴ��14', 'XJ0014', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3750', '4115121304', '��·Ѳ�ߴ��15', 'XJ0015', '��', null, null, null, null, '123456', '22', '0', null, '4115121304', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3751', '41151603', '���鳬', '084136', '��', null, null, null, null, '123456', '23', '0', null, '41151603', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3752', '41151401', '�Ž�־', '185333', '��', null, null, null, null, '123456', '23', '0', null, '41151401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3753', '41151401', '����ˮ', '088321', '��', null, null, null, null, '123456', '23', '0', null, '41151401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3754', '41151401', '���ʷ�', '185363', '��', null, null, null, null, '123456', '23', '0', null, '41151401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3755', '41151401', '��˼��', '088303', '��', null, null, null, null, '123456', '23', '0', null, '41151401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3756', '41151401', '�', '088377', '��', null, null, null, null, '123456', '23', '0', null, '41151401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3757', '41151401', 'л��', '185332', '��', null, null, null, null, '123456', '23', '0', null, '41151401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3758', '41151401', '���ǿ', '088366', '��', null, null, null, null, '123456', '23', '0', null, '41151401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3759', '41151401', '�ŷ�', '088291', '��', null, null, null, null, '123456', '23', '0', null, '41151401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3760', '41151401', '���', '088266', '��', null, null, null, null, '123456', '23', '0', null, '41151401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3761', '41151401', '�ź�', '185351', '��', null, null, null, null, '123456', '23', '0', null, '41151401', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3762', '41151405', '֣����', '088315', '��', null, null, null, null, '123456', '23', '0', null, '41151405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3763', '41151405', '������', '088355', '��', null, null, null, null, '123456', '23', '0', null, '41151405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3764', '41151405', '����ȫ', '185331', '��', null, null, null, null, '123456', '23', '0', null, '41151405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3765', '41151405', '����', '185327', '��', null, null, null, null, '123456', '23', '0', null, '41151405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3766', '41151405', '����Դ', '185531', '��', null, null, null, null, '123456', '23', '0', null, '41151405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3767', '41151405', '����', '185533', '��', null, null, null, null, '123456', '23', '0', null, '41151405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3768', '41151405', '���ʱ�', '185369', '��', null, null, null, null, '123456', '23', '0', null, '41151405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3769', '41151403', '��֮��', '088133', '��', null, null, null, null, '123456', '23', '0', null, '41151403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3770', '41151414', '���', '088095', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3771', '41151414', '�����', '088166', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3772', '41151414', 'ţ��', '088165', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3773', '41151414', '������', '088175', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3774', '41151414', '�����', '088076', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3775', '41151414', '������', '088188', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3776', '41151414', '����', '185336', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3777', '41151414', '����', '088276', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3778', '41151414', '������', '088257', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3779', '41151414', '����', '088160', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3780', '41151414', '����ݿ', '185391', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3781', '41151414', 'Ҧ����', '185347', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3782', '41151414', '������', '185397', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3783', '41151414', '���ޱ�', '185527', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3784', '41151414', '�Ľ���', '185532', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3785', '41151414', '���', '185502', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3786', '41151414', '����', '185526', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3787', '41151414', '����', '088194', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3788', '41151414', '������', '088391', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3789', '41151414', 'Ԭ־��', '185392', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3790', '41151414', '������', '185386', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3791', '41151414', '������', '185507', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3792', '41151414', '����', '088267', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3793', '41151414', '������', '185352', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3794', '41151414', '���ں�', '185349', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3795', '41151414', 'Ҷ����', '185519', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3796', '41151414', '���', '185342', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3797', '41151414', '������', '185506', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3798', '41151414', '��ѧ��', '185513', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3799', '41151414', '����', '185523', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3800', '41151414', '�̽�', '185353', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3801', '41151414', '������', '088187', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3802', '41151414', '����', '088189', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3803', '41151414', '�̽���', '088185', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3804', '41151414', '����', '088386', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3805', '41151414', '�ſ�', '185383', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3806', '41151414', '������', '185550', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3807', '41151414', '�����', '185503', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3808', '41151414', '���', '185385', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3809', '41151414', '������', '185382', '��', null, null, null, null, '123456', '23', '0', null, '41151414', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3810', '41151403', '������', '088395', '��', null, null, null, null, '123456', '23', '0', null, '41151403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3811', '41151403', '������', '185323', '��', null, null, null, null, '123456', '23', '0', null, '41151403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3812', '41151403', '�����', '088084', '��', null, null, null, null, '123456', '23', '0', null, '41151403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3813', '41151403', 'Ф����', '185346', '��', null, null, null, null, '123456', '23', '0', null, '41151403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3814', '41151403', '��Զ��', '185522', '��', null, null, null, null, '123456', '23', '0', null, '41151403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3815', '41151403', '�Ż�', '185320', '��', null, null, null, null, '123456', '23', '0', null, '41151403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3816', '41151403', '����', '185510', '��', null, null, null, null, '123456', '23', '0', null, '41151403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3817', '41151403', '���ʤ', '088083', '��', null, null, null, null, '123456', '23', '0', null, '41151403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3818', '41151403', '�Ų�', '088254', '��', null, null, null, null, '123456', '23', '0', null, '41151403', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3819', '41151523', '���Ű�', '188585', '��', null, null, null, null, '123456', '23', '0', null, '41151523', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3820', '41151405', '������', '185525', '��', null, null, null, null, '123456', '23', '0', null, '41151405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3821', '4115121302', 'ƽ���ж�6��', '000031', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3822', '4115121302', '�����ж�1��', '000030', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3823', '4115121302', 'ƽ���ж�7��', '000032', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3824', '4115121302', '��ɽ�ж�6��', '000033', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3825', '4115121302', '�������ж�6��', '000034', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3826', '4115121302', '�������ж�7��', '000035', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3827', '4115121302', '�������ж�8��', '000036', '��', null, null, null, null, '123456', '22', '0', null, '4115121302', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3828', '41151622', '������', '188089', '��', null, null, null, null, '123456', '23', '0', null, '41151622', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3829', '41151622', 'Ф����', '188033', '��', null, null, null, null, '123456', '23', '0', null, '41151622', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3830', '41151622', '�¾���', '084114', '��', null, null, null, null, '123456', '23', '0', null, '41151622', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3831', '41151622', '������', '188197', '��', null, null, null, null, '123456', '23', '0', null, '41151622', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3832', '41151622', '���', '084146', '��', null, null, null, null, '123456', '23', '0', null, '41151622', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3833', '41151613', '��Ϊ��', 'XF0002', '��', null, null, null, null, '123456', '23', '0', null, '41151613', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3834', '41151613', '����', 'XF0001', '��', null, null, null, null, '123456', '23', '0', null, '41151613', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3835', '41151613', '�ų�', 'XF0003', '��', null, null, null, null, '123456', '23', '0', null, '41151613', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3836', '41151611', '���', '188070', '��', null, null, null, null, '123456', '23', '0', null, '41151611', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3837', '41151610', '����', '188131', '��', null, null, null, null, '123456', '23', '0', null, '41151610', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3838', '41151634', 'Ԭ��ΰ', '084043', '��', null, null, null, null, '123456', '23', '0', null, '41151634', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3839', '41151405', '÷ΰ', '088344', '��', null, null, null, null, '123456', '23', '0', null, '41151405', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3840', '41151840', '����', '189567', '��', null, null, null, null, '123456', '23', '0', null, '41151840', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3841', '411512132602', '�޺���', '188185', '��', null, null, null, null, '123456', '23', '0', null, '411512132602', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3842', '41151634', '��Ԫ��', '084098', '��', null, null, null, null, '123456', '23', '0', null, '41151634', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3843', '41151634', '����', '188012', '��', null, null, null, null, '123456', '23', '0', null, '41151634', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3844', '41151407', '�����', '088197', '��', null, null, null, null, '123456', '23', '0', null, '41151407', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3845', '41151616', '����', '084241', '��', null, null, null, null, '123456', '23', '0', null, '41151616', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3846', '4115121320', '½Т��', '088065', '��', null, null, null, null, '123456', '22', '0', null, '4115121320', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3847', '411514', '������', '088268', '��', null, null, null, null, '123456', '22', '0', null, '411514', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3848', '41151417', '�̷�', '088222', '��', null, null, null, null, '123456', '23', '0', null, '41151417', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3849', '41151417', '������', '185390', '��', null, null, null, null, '123456', '23', '0', null, '41151417', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3850', '41151417', '������', '088381', '��', null, null, null, null, '123456', '23', '0', null, '41151417', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3851', '41151313', '������', '189845', '��', null, null, null, null, '123456', '23', '0', null, '41151313', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3852', '4115', 'ceshi', '123123', '��', '', null, '', null, '123456', '20', '0', null, '', '1', '2017-09-05 17:12:11', '0', '0', '');
INSERT INTO `employee` VALUES ('3853', '4115', '����2', '123654', '��', '', null, '', null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '');
INSERT INTO `employee` VALUES ('3854', '41151204', '1111', '112233', '��', '', null, '', null, '123456', '19', '0', null, '41151204', '1', '2017-01-01 00:00:00', '1', '0', '');
INSERT INTO `employee` VALUES ('3855', '4115', 'aa', 'aa', '��', '', null, '', null, '123456', '20', '0', null, '', '1', '2017-01-01 00:00:00', '0', '0', '��������Ա');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '�˵���ID',
  `name` varchar(64) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `ordernum` int(11) DEFAULT '0',
  `iconcls` varchar(64) DEFAULT NULL,
  `enable` int(2) DEFAULT '1' COMMENT '0:����,1:����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=524 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('100', '0', 'ϵͳ����', '', '2', 'icon-wrench', '1');
INSERT INTO `menu` VALUES ('101', '100', '��ɫ����', 'Role/index', '1', 'icon-folder_user', '1');
INSERT INTO `menu` VALUES ('103', '100', '��֯����', 'Area/index', '3', 'icon-world', '1');
INSERT INTO `menu` VALUES ('200', '0', '�豸����', '', '4', 'icon-tux', '1');
INSERT INTO `menu` VALUES ('201', '200', 'ִ����¼�ǹ���', 'Dev/pe_base_show', '1', 'icon-tux', '1');
INSERT INTO `menu` VALUES ('303', '300', '�ɼ�վ��־', 'Log/log_show?logType=wslog', '2', '', '1');
INSERT INTO `menu` VALUES ('302', '300', 'ִ������־', 'Log/log_show?logType=pelog', '1', null, '0');
INSERT INTO `menu` VALUES ('301', '300', 'ϵͳ��־', 'Log/log_show?logType=syslog', '0', null, '1');
INSERT INTO `menu` VALUES ('300', '0', '��־�鿴', '', '1', '', '1');
INSERT INTO `menu` VALUES ('400', '0', 'ͳ�Ʒ���', '', '5', 'icon-group_link', '1');
INSERT INTO `menu` VALUES ('500', '0', '���ݲ�ѯ', '', '7', 'icon-script', '1');
INSERT INTO `menu` VALUES ('203', '200', '�ɼ�վ����', 'WorkStation/ws_base_show', '3', '', '1');
INSERT INTO `menu` VALUES ('503', '500', '���ݲ�ѯ', 'Case/show_case_search', '0', '', '1');
INSERT INTO `menu` VALUES ('504', '0', '�����ƽ�', '', '6', '', '1');
INSERT INTO `menu` VALUES ('506', '504', '��Ƶ�ƽ�����', 'Case/show_apply_case', '2', '', '1');
INSERT INTO `menu` VALUES ('507', '504', '��Ƶ�ƽ����', 'Case/allow_case', '1', '', '1');
INSERT INTO `menu` VALUES ('508', '504', '�༭�ƽ���Ƶ', 'Case/show_applyed', '0', '', '1');
INSERT INTO `menu` VALUES ('509', '200', 'Ӧ�÷���������', 'Server/server_show', '2', '', '1');
INSERT INTO `menu` VALUES ('511', '400', '�������ڷ���', 'Case/sat_case', '3', '', '1');
INSERT INTO `menu` VALUES ('521', '0', '�������', '', '0', '', '1');
INSERT INTO `menu` VALUES ('522', '521', '�������', 'Announce/announce', '0', '', '1');
INSERT INTO `menu` VALUES ('519', '0', '��Ա����', '', '3', '', '1');
INSERT INTO `menu` VALUES ('520', '519', '��Ա����', 'Employee/index', '0', '', '1');
INSERT INTO `menu` VALUES ('516', '0', '���ݱ༭', '', '8', '', '1');
INSERT INTO `menu` VALUES ('517', '516', '���ݱ༭', 'Case/show_case', '0', '', '1');
INSERT INTO `menu` VALUES ('512', '0', '���ݲɼ�', '', '9', '', '1');
INSERT INTO `menu` VALUES ('513', '512', '���ݲɼ�', 'Case/show_case_collect', '0', '', '1');
INSERT INTO `menu` VALUES ('518', '100', '���Ž�ɫ', 'DeptRole/dept_role', '0', '', '1');
INSERT INTO `menu` VALUES ('523', '400', '�༭�������', 'Case/edit_con_sat', '2', '', '1');

-- ----------------------------
-- Table structure for pe_base
-- ----------------------------
DROP TABLE IF EXISTS `pe_base`;
CREATE TABLE `pe_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpxh` varchar(12) NOT NULL COMMENT '��Ʒ(ִ����)��� ',
  `standard` varchar(30) DEFAULT NULL COMMENT '�豸���',
  `product` varchar(100) DEFAULT NULL COMMENT '��������',
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '��λ,ͬarea_dep.areacode',
  `areaname` varchar(128) DEFAULT NULL COMMENT '��λ,ͬarea_dep.areaname',
  `jybh` varchar(32) NOT NULL COMMENT '��Ա���',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '��Ա����',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0:ͣ��,1:ά��,2:����',
  `times` int(2) NOT NULL DEFAULT '0',
  `create_user` varchar(32) DEFAULT NULL COMMENT '������',
  `create_time` datetime DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cpxh` (`cpxh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pe_base
-- ----------------------------
INSERT INTO `pe_base` VALUES ('1', 'T11366', '', '', '411501', '�ϳǷ־�', '085532', '����', '2', '3', null, '2017-01-01 00:00:00');
INSERT INTO `pe_base` VALUES ('2', 'TA00716', null, null, '4115', '�����й�����', '086338', '����', '0', '0', null, '2017-01-01 00:00:00');

-- ----------------------------
-- Table structure for pe_log_list
-- ----------------------------
DROP TABLE IF EXISTS `pe_log_list`;
CREATE TABLE `pe_log_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpxh` varchar(12) NOT NULL DEFAULT '0000000' COMMENT '��Ʒ(ִ����)���',
  `comment` varchar(100) DEFAULT NULL COMMENT '����',
  `rzsj` datetime NOT NULL COMMENT '��־ʱ��',
  `jybh` varchar(32) NOT NULL COMMENT '��Ա���',
  `jyxm` varchar(60) DEFAULT NULL COMMENT '��Ա����',
  `gzz_ip` varchar(64) NOT NULL COMMENT '����վip',
  `auth_key` varchar(32) DEFAULT NULL COMMENT '��֤��Կ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pe_log_list
-- ----------------------------
INSERT INTO `pe_log_list` VALUES ('1', 'T11366', '��������', '2017-08-16 13:52:06', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('2', 'T11366', '����', '2017-08-16 13:52:09', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('3', 'T11366', 'USB�γ�,�ػ�', '2017-08-16 13:52:11', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('4', 'T11366', '����', '2017-08-16 13:52:22', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('5', 'T11366', '�ػ�', '2017-08-16 13:52:35', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('6', 'T11366', '��������', '2017-08-16 16:42:27', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('7', 'T11366', '����', '2017-08-16 16:42:30', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('8', 'T11366', 'USB�γ�,�ػ�', '2017-08-16 16:42:32', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('9', 'T11366', '����', '2017-08-16 16:43:41', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('10', 'T11366', '��������', '2017-08-16 16:45:50', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('11', 'T11366', 'USB�γ�,�ػ�', '2017-08-16 16:45:53', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('12', 'T11366', '��������', '2017-08-16 16:52:55', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('13', 'T11366', '����', '2017-08-16 16:52:58', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('14', 'T11366', 'USB�γ�,�ػ�', '2017-08-16 16:53:00', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('15', 'T11366', '��������', '2017-08-16 17:10:05', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('16', 'T11366', '����', '2017-08-16 17:10:08', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('17', 'T11366', 'USB�γ�,�ػ�', '2017-08-16 17:10:10', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('18', 'T11366', '��������', '2017-08-17 11:08:29', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('19', 'T11366', '����', '2017-08-17 11:08:32', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('20', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 11:08:34', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('21', 'T11366', '��������', '2017-08-17 11:11:02', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('22', 'T11366', '����', '2017-08-17 11:11:06', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('23', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 11:11:07', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('24', 'T11366', '��������', '2017-08-17 11:14:56', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('25', 'T11366', '����', '2017-08-17 11:14:59', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('26', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 11:15:00', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('27', 'T11366', '��������', '2017-08-17 11:15:47', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('28', 'T11366', '����', '2017-08-17 11:15:50', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('29', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 11:15:52', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('30', 'T11366', '��������', '2017-08-17 11:16:45', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('31', 'T11366', '����', '2017-08-17 11:16:48', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('32', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 11:16:49', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('33', 'T11366', '����', '2017-08-17 11:17:03', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('34', 'T11366', '��������', '2017-08-17 11:17:40', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('35', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 11:17:44', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('36', 'T11366', '��������', '2017-08-17 11:19:03', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('37', 'T11366', '����', '2017-08-17 11:19:06', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('38', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 11:19:07', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('39', 'T11366', '��������', '2017-08-17 12:02:17', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('40', 'T11366', '����', '2017-08-17 12:02:20', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('41', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 12:02:22', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('42', 'T11366', '��������', '2017-08-17 12:02:58', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('43', 'T11366', '����', '2017-08-17 12:03:01', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('44', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 12:03:02', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('45', 'T11366', '��������', '2017-08-17 12:09:45', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('46', 'T11366', '����', '2017-08-17 12:09:48', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('47', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 12:09:49', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('48', 'T11366', '����', '2017-08-17 12:10:03', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('49', 'T11366', '��������', '2017-08-17 12:10:39', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('50', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 12:10:43', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('51', 'T11366', '����Ա����', '2017-08-17 13:49:52', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('52', 'T11366', '��������', '2017-08-17 13:56:40', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('53', 'T11366', '����', '2017-08-17 13:56:43', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('54', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 13:56:45', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('55', 'T11366', '����Ա����', '2017-08-17 14:21:33', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('56', 'T11366', '��������', '2017-08-17 14:23:41', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('57', 'T11366', '����', '2017-08-17 14:23:44', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('58', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 14:23:46', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('59', 'T11366', '��������', '2017-08-17 16:16:43', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('60', 'T11366', '����', '2017-08-17 16:16:47', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('61', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 16:16:48', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('62', 'T11366', '����', '2017-08-17 16:18:45', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('63', 'T11366', '����Ա����', '2017-08-17 16:22:12', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('64', 'T11366', '��������', '2017-08-17 16:22:48', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('65', 'T11366', 'USB�γ�,�ػ�', '2017-08-17 16:22:51', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('66', 'T11366', '����', '2017-08-24 17:28:03', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('67', 'T11366', '��������', '2017-08-24 17:32:25', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('68', 'T11366', 'USB�γ�,�ػ�', '2017-08-24 17:32:28', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('69', 'T11366', '��������', '2017-08-24 17:34:46', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('70', 'T11366', '����', '2017-08-24 17:34:49', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('71', 'T11366', 'USB�γ�,�ػ�', '2017-08-24 17:34:50', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('72', 'T11366', '��������', '2017-08-24 17:43:39', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('73', 'T11366', '��������', '2017-08-24 17:44:57', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('74', 'T11366', '����', '2017-08-24 17:45:30', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('75', 'T11366', '��ʼ¼��', '2017-08-24 17:45:37', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('76', 'T11366', '����¼��', '2017-08-24 17:46:52', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('77', 'T11366', '�ػ�', '2017-08-24 17:47:04', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('78', 'T11366', '����Ա����', '2017-08-24 17:56:32', '085532', '����', '192.168.3.110', null);
INSERT INTO `pe_log_list` VALUES ('79', 'T11366', '����', '2017-08-26 11:33:00', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('80', 'T11366', '��ʼ¼��', '2017-08-26 11:33:13', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('81', 'T11366', '����¼��', '2017-08-26 11:33:31', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('82', 'T11366', '��ʼ¼��', '2017-08-26 11:33:37', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('83', 'T11366', '����¼��', '2017-08-26 11:33:47', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('84', 'T11366', '�ػ�', '2017-08-26 11:33:59', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('85', 'T11366', '����', '2017-08-27 19:26:31', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('86', 'T11366', '��ʼ¼��', '2017-08-27 19:26:41', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('87', 'T11366', '����¼��', '2017-08-27 19:26:56', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('88', 'T11366', '��ʼ¼��', '2017-08-27 19:27:02', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('89', 'T11366', '����¼��', '2017-08-27 19:27:19', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('90', 'T11366', '��ʼ¼��', '2017-08-27 19:27:24', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('91', 'T11366', '����¼��', '2017-08-27 19:27:38', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('92', 'T11366', '��ʼ¼��', '2017-08-27 19:27:43', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('93', 'T11366', '����¼��', '2017-08-27 19:27:51', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('94', 'T11366', '����Ա����', '2017-08-27 19:29:21', '085532', '����', '192.168.77.33', null);
INSERT INTO `pe_log_list` VALUES ('95', 'T11366', '����', '2017-09-05 09:10:09', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('96', 'T11366', '��ʼ¼��', '2017-09-05 09:10:15', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('97', 'T11366', '����¼��', '2017-09-05 09:10:25', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('98', 'T11366', '��ʼ¼��', '2017-09-05 09:10:33', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('99', 'T11366', '����¼��', '2017-09-05 09:10:43', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('100', 'T11366', '��ʼ¼��', '2017-09-05 09:10:52', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('101', 'T11366', '����¼��', '2017-09-05 09:11:08', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('102', 'T11366', '��ʼ¼��', '2017-09-05 09:11:16', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('103', 'T11366', '����¼��', '2017-09-05 09:11:27', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('104', 'T11366', '����', '2017-09-05 09:11:32', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('105', 'T11366', '����', '2017-09-05 09:11:36', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('106', 'T11366', '����', '2017-09-05 09:11:44', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('107', 'T11366', '��ʼ¼��', '2017-09-05 09:12:21', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('108', 'T11366', '����¼��', '2017-09-05 09:12:35', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('109', 'T11366', '��ʼ¼��', '2017-09-05 09:12:43', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('110', 'T11366', '����¼��', '2017-09-05 09:12:59', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('111', 'T11366', '����Ա����', '2017-09-05 09:28:55', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('112', 'T11366', '����', '2017-09-05 11:47:49', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('113', 'T11366', '��ʼ¼��', '2017-09-05 11:48:15', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('114', 'T11366', '����¼��', '2017-09-05 11:48:32', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('115', 'T11366', '��ʼ¼��', '2017-09-05 11:48:37', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('116', 'T11366', '����¼��', '2017-09-05 11:48:47', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('117', 'T11366', '��ʼ¼��', '2017-09-05 11:49:00', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('118', 'T11366', '����¼��', '2017-09-05 11:49:17', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('119', 'T11366', '��ʼ¼��', '2017-09-05 11:50:15', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('120', 'T11366', '����¼��', '2017-09-05 11:50:42', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('121', 'T11366', '����', '2017-09-05 11:52:13', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('122', 'T11366', '�ػ�', '2017-09-05 11:52:22', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('123', 'T11366', '����', '2017-09-05 12:28:34', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('124', 'T11366', '��ʼ¼��', '2017-09-05 12:31:33', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('125', 'T11366', '����¼��', '2017-09-05 12:31:47', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('126', 'T11366', '��ʼ¼��', '2017-09-05 12:31:59', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('127', 'T11366', '����¼��', '2017-09-05 12:32:18', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('128', 'T11366', '��ʼ¼��', '2017-09-05 12:32:27', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('129', 'T11366', '����¼��', '2017-09-05 12:32:37', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('130', 'T11366', '��ʼ¼��', '2017-09-05 12:32:42', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('131', 'T11366', '����¼��', '2017-09-05 12:32:51', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('132', 'T11366', '��ʼ¼��', '2017-09-05 12:32:56', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('133', 'T11366', '����¼��', '2017-09-05 12:33:07', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('134', 'T11366', '��ʼ¼��', '2017-09-05 12:33:18', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('135', 'T11366', '����¼��', '2017-09-05 12:33:31', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('136', 'T11366', '��ʼ¼��', '2017-09-05 12:33:37', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('137', 'T11366', '����¼��', '2017-09-05 12:33:47', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('138', 'T11366', '��ʼ¼��', '2017-09-05 12:34:08', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('139', 'T11366', '����¼��', '2017-09-05 12:34:29', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('140', 'T11366', '��ʼ¼��', '2017-09-05 12:34:43', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('141', 'T11366', '����¼��', '2017-09-05 12:34:54', '085532', '����', '192.168.3.113', null);
INSERT INTO `pe_log_list` VALUES ('142', 'T11366', '����Ա����', '2017-09-05 12:37:36', '085532', '����', '192.168.3.113', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleid` bigint(19) NOT NULL DEFAULT '0' COMMENT '��ɫID 13λʱ������',
  `rolename` varchar(64) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `functionlist` varchar(4096) DEFAULT NULL,
  `level` int(2) DEFAULT NULL COMMENT '0-5��',
  PRIMARY KEY (`roleid`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ϵͳ����Ա', 'ӵ�����в���Ȩ��', '100,101,102,103,200,201,203,300,301,302,303,304,400,500,503,504,506,507,508,509,511,521,522,519,520,516,517,512,513,518,523', '0');
INSERT INTO `role` VALUES ('19', '�оֹ���Ա', 'ӵ�����в���Ȩ��', '512,513,516,517,500,503,504,506,507,508,400,511,200,203,509,201,519,520,103,518,300,303,302,301,521,522,523', '1');
INSERT INTO `role` VALUES ('20', '��Ա', 'ӵ�����ݹ�������־��ѯ,���Ĳ�ѯ', '512,513,516,517,500,503,506,508,201,303,302', '4');
INSERT INTO `role` VALUES ('22', '�ؾֹ���Ա', 'û�н�ɫ������������Ȩ��', '512,513,516,517,500,503,504,506,507,508,400,511,200,203,509,201,519,520,103,300,303,302,301,521,522,523', '2');
INSERT INTO `role` VALUES ('23', '�������Ա', 'û�н�ɫ������������Ȩ��', '512,513,516,517,500,503,504,506,507,508,400,511,203,201,519,520,103,300,303,302,301,521,522', '3');

-- ----------------------------
-- Table structure for server_db
-- ----------------------------
DROP TABLE IF EXISTS `server_db`;
CREATE TABLE `server_db` (
  `db_name` varchar(128) DEFAULT NULL,
  `db_ip` varchar(20) NOT NULL DEFAULT 'localhost' COMMENT '������ip',
  `db_port` int(11) NOT NULL DEFAULT '3306',
  `db_user` varchar(20) NOT NULL DEFAULT 'root',
  `db_pwd` varchar(20) NOT NULL DEFAULT '123456',
  `enable` int(1) NOT NULL DEFAULT '0' COMMENT '0:������,1:����',
  PRIMARY KEY (`db_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of server_db
-- ----------------------------
INSERT INTO `server_db` VALUES ('aaa', '192.168.0.22', '3306', 'root', '123456', '0');
INSERT INTO `server_db` VALUES ('�о�', 'localhost', '3306', 'root', '123456', '0');

-- ----------------------------
-- Table structure for server_ftp
-- ----------------------------
DROP TABLE IF EXISTS `server_ftp`;
CREATE TABLE `server_ftp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ftp_ip` varchar(20) NOT NULL DEFAULT '127.0.0.1' COMMENT 'ftp������ip',
  `play_port` int(11) NOT NULL DEFAULT '80' COMMENT 'apache port',
  `ftp_port` int(11) NOT NULL DEFAULT '21',
  `ftp_user` varchar(20) NOT NULL DEFAULT 'dh',
  `ftp_pwd` varchar(20) NOT NULL DEFAULT '123456',
  `web_path` varchar(128) NOT NULL DEFAULT '/pe_file/' COMMENT 'վ��������Ŀ¼,��ʽ:/pe_file<1λ��0λ�̷�>,��/pe_fileD��',
  `ftp_path` varchar(128) NOT NULL COMMENT '����·��.FTP�����ϴ�����Ŀ¼',
  `is_ftp_dir` int(1) NOT NULL DEFAULT '0' COMMENT '0:����;1:��',
  `ftp_lock` int(1) NOT NULL DEFAULT '0' COMMENT '0:���л�Ŀ¼��1������FTP�û���Ŀ¼��',
  `enable` int(1) NOT NULL DEFAULT '0' COMMENT '0:������ftp;1:����ftp',
  `symbol` varchar(20) DEFAULT NULL COMMENT 'ftp·�����ڵ��̷�',
  `total` double(20,0) DEFAULT '0' COMMENT 'ftpĿ¼�Ŀռ��С',
  `free` double(20,0) DEFAULT '0' COMMENT 'ftpĿ¼��ʣ��ռ��С(M)',
  `usage` double(6,2) DEFAULT '0.00' COMMENT 'ftpĿ¼�Ŀռ�ʹ����',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_web_path` (`web_path`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of server_ftp
-- ----------------------------
INSERT INTO `server_ftp` VALUES ('1', 'localhost', '80', '621', 'dh', '123456', '/pe_file/', 'D:\\Workspace\\pe_file\\', '0', '0', '0', 'D:\\', '199999', '187660', '6.00');
INSERT INTO `server_ftp` VALUES ('2', 'localhost', '80', '621', 'dh', '123456', '/pe_fileI/', 'I:\\', '1', '0', '0', 'I:\\', '0', '0', '0.00');
INSERT INTO `server_ftp` VALUES ('3', 'localhost', '80', '621', 'dh', '123456', '/pe_fileJ/', 'J:\\', '1', '0', '0', 'J:\\', '0', '0', '0.00');
INSERT INTO `server_ftp` VALUES ('4', 'localhost', '80', '621', 'dh', '123456', '/pe_fileK/', 'K:\\', '1', '0', '0', 'K:\\', '0', '0', '0.00');
INSERT INTO `server_ftp` VALUES ('5', 'localhost', '80', '621', 'dh', '123456', '/pe_fileG/', 'G:\\', '1', '0', '1', 'G:\\', '199998', '197603', '1.00');
INSERT INTO `server_ftp` VALUES ('6', 'localhost', '80', '21', 'dh', '123456', '/pe_fileH/', 'H:\\', '1', '0', '0', 'H:\\', '0', '0', '0.00');
INSERT INTO `server_ftp` VALUES ('7', 'localhost', '80', '21', 'dh', '123456', '/pe_fileF/', 'F:\\', '1', '0', '0', 'F:\\', '199999', '161122', '19.00');
INSERT INTO `server_ftp` VALUES ('9', 'localhost', '80', '21', 'dh', '123456', '/pe_fileE/', 'E:\\', '1', '0', '0', 'E:\\', '253864', '237861', '6.00');

-- ----------------------------
-- Table structure for server_machine
-- ----------------------------
DROP TABLE IF EXISTS `server_machine`;
CREATE TABLE `server_machine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areacode` varchar(32) NOT NULL DEFAULT '' COMMENT '��λ,ͬarea_dep.areacode',
  `areaname` varchar(128) DEFAULT NULL COMMENT '��λ,ͬarea_dep.areaname',
  `server_ip` varchar(20) NOT NULL COMMENT '������IP',
  `server_port` int(11) DEFAULT NULL,
  `trademark` varchar(32) DEFAULT NULL COMMENT '������Ʒ��',
  `config` varchar(128) DEFAULT NULL COMMENT '����������',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '������״̬��0:����,1:����',
  `account` varchar(32) DEFAULT NULL COMMENT '�˺�',
  `password` varchar(32) DEFAULT NULL COMMENT '����',
  `db_user` varchar(32) DEFAULT NULL COMMENT '���ݿ��û�',
  `db_pwd` varchar(32) DEFAULT NULL COMMENT '���ݿ�����',
  `create_time` datetime DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  `create_user` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_server_ip` (`server_ip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of server_machine
-- ----------------------------
INSERT INTO `server_machine` VALUES ('1', '4115', '�����й�����', '192.168.0.26', '0', '', '1', '0', '', '', '', '', '2017-08-31 17:38:48', '����', '', '');

-- ----------------------------
-- Table structure for sync_area_dep
-- ----------------------------
DROP TABLE IF EXISTS `sync_area_dep`;
CREATE TABLE `sync_area_dep` (
  `areacode` varchar(32) NOT NULL COMMENT '����վIP',
  `status` int(1) NOT NULL COMMENT '1:����;2:ɾ��;3:�޸�',
  `update_time` bigint(19) NOT NULL COMMENT '��ǰ����ʱ��,������',
  `old_areacode` varchar(32) DEFAULT '' COMMENT '�޸�ǰ�Ĳ��Ŵ���',
  PRIMARY KEY (`update_time`,`areacode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_area_dep
-- ----------------------------

-- ----------------------------
-- Table structure for sync_case
-- ----------------------------
DROP TABLE IF EXISTS `sync_case`;
CREATE TABLE `sync_case` (
  `tab_name` varchar(32) NOT NULL COMMENT '��ر�',
  `case_key` varchar(64) NOT NULL COMMENT '������ʶ',
  `status` int(1) NOT NULL COMMENT '1:����;2:ɾ��;3:�޸�',
  `update_time` bigint(19) NOT NULL COMMENT '��ǰ����ʱ��',
  PRIMARY KEY (`update_time`,`case_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_case
-- ----------------------------

-- ----------------------------
-- Table structure for sync_case_video
-- ----------------------------
DROP TABLE IF EXISTS `sync_case_video`;
CREATE TABLE `sync_case_video` (
  `tab_name` varchar(32) NOT NULL COMMENT '��ر�',
  `wjbh` varchar(100) NOT NULL COMMENT '�ļ����',
  `status` int(1) NOT NULL COMMENT '1:����;2:ɾ��;3:�޸�',
  `update_time` bigint(19) NOT NULL COMMENT '��ǰ����ʱ��',
  PRIMARY KEY (`update_time`,`wjbh`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_case_video
-- ----------------------------

-- ----------------------------
-- Table structure for sync_dept_role
-- ----------------------------
DROP TABLE IF EXISTS `sync_dept_role`;
CREATE TABLE `sync_dept_role` (
  `dept_role_id` bigint(19) NOT NULL DEFAULT '0' COMMENT '���Ž�ɫID 13λʱ������',
  `status` int(1) NOT NULL COMMENT '1:����;2:ɾ��;3:�޸�',
  `update_time` bigint(19) NOT NULL COMMENT '��ǰ����ʱ��,������',
  PRIMARY KEY (`update_time`,`dept_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_dept_role
-- ----------------------------

-- ----------------------------
-- Table structure for sync_employee
-- ----------------------------
DROP TABLE IF EXISTS `sync_employee`;
CREATE TABLE `sync_employee` (
  `code` varchar(32) NOT NULL COMMENT '��Ա���',
  `old_code` varchar(32) DEFAULT '' COMMENT '�޸�ǰ�ľ�Ա���',
  `status` int(1) NOT NULL COMMENT '1:����;2:ɾ��;3:�޸�',
  `update_time` bigint(19) NOT NULL COMMENT '��ǰ����ʱ��,������',
  PRIMARY KEY (`code`,`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_employee
-- ----------------------------
INSERT INTO `sync_employee` VALUES ('086338', '', '3', '1504766006510');
INSERT INTO `sync_employee` VALUES ('086338', '', '3', '1504766010580');
INSERT INTO `sync_employee` VALUES ('086338', '', '3', '1504766768552');
INSERT INTO `sync_employee` VALUES ('086338', '', '3', '1504766777583');
INSERT INTO `sync_employee` VALUES ('a', '', '1', '1504765963190');
INSERT INTO `sync_employee` VALUES ('a', '', '2', '1504765976841');
INSERT INTO `sync_employee` VALUES ('a', '', '1', '1504766026799');
INSERT INTO `sync_employee` VALUES ('a', '', '2', '1504766036345');
INSERT INTO `sync_employee` VALUES ('a', '', '1', '1504766045491');
INSERT INTO `sync_employee` VALUES ('a', '', '2', '1504766051592');
INSERT INTO `sync_employee` VALUES ('aa', '', '1', '1504765916076');

-- ----------------------------
-- Table structure for sync_notice
-- ----------------------------
DROP TABLE IF EXISTS `sync_notice`;
CREATE TABLE `sync_notice` (
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '�������',
  `update_time` bigint(19) NOT NULL COMMENT '��ǰ����ʱ��,������',
  `status` int(1) NOT NULL COMMENT '1:����;2:ɾ��;3:�޸�',
  PRIMARY KEY (`update_time`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sync_pe_base
-- ----------------------------
DROP TABLE IF EXISTS `sync_pe_base`;
CREATE TABLE `sync_pe_base` (
  `cpxh` varchar(12) NOT NULL COMMENT '��Ʒ(ִ����)��� ',
  `status` int(1) NOT NULL COMMENT '1:����;2:ɾ��;3:�޸�',
  `update_time` bigint(19) NOT NULL COMMENT '��ǰ����ʱ��,������',
  `old_cpxh` varchar(12) DEFAULT '' COMMENT '�޸�ǰ�Ĳ�Ʒ���',
  PRIMARY KEY (`update_time`,`cpxh`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_pe_base
-- ----------------------------
INSERT INTO `sync_pe_base` VALUES ('aaaa', '1', '1504765828871', '');
INSERT INTO `sync_pe_base` VALUES ('TA00716', '3', '1504766006591', '');
INSERT INTO `sync_pe_base` VALUES ('TA00716', '3', '1504766010658', '');
INSERT INTO `sync_pe_base` VALUES ('TA00716', '3', '1504766768652', '');
INSERT INTO `sync_pe_base` VALUES ('TA00716', '3', '1504766777675', '');
INSERT INTO `sync_pe_base` VALUES ('aa', '1', '1504766839563', '');
INSERT INTO `sync_pe_base` VALUES ('aa', '1', '1504766943902', '');
INSERT INTO `sync_pe_base` VALUES ('aa', '3', '1504766957340', 'aa');
INSERT INTO `sync_pe_base` VALUES ('aa', '1', '1504766974496', '');

-- ----------------------------
-- Table structure for sync_role
-- ----------------------------
DROP TABLE IF EXISTS `sync_role`;
CREATE TABLE `sync_role` (
  `roleid` bigint(19) NOT NULL DEFAULT '0' COMMENT '��ɫID 13λʱ������',
  `status` int(1) NOT NULL COMMENT '1:����;2:ɾ��;3:�޸�',
  `update_time` bigint(19) NOT NULL COMMENT '��ǰ����ʱ��,������',
  PRIMARY KEY (`update_time`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_role
-- ----------------------------

-- ----------------------------
-- Table structure for sync_server_machine
-- ----------------------------
DROP TABLE IF EXISTS `sync_server_machine`;
CREATE TABLE `sync_server_machine` (
  `server_ip` varchar(64) NOT NULL COMMENT '������IP',
  `status` int(1) NOT NULL COMMENT '1:����;2:ɾ��;3:�޸�',
  `update_time` bigint(19) NOT NULL COMMENT '��ǰ����ʱ��,������',
  `old_server_ip` varchar(64) DEFAULT '' COMMENT '�޸�ǰ�ķ�����IP',
  PRIMARY KEY (`update_time`,`server_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_server_machine
-- ----------------------------
INSERT INTO `sync_server_machine` VALUES ('aaa', '1', '1504765855072', '');
INSERT INTO `sync_server_machine` VALUES ('aaa', '3', '1504765863069', '');

-- ----------------------------
-- Table structure for sync_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sync_sys_log`;
CREATE TABLE `sync_sys_log` (
  `key` varchar(64) NOT NULL COMMENT 'ϵͳ��־ID',
  `status` int(1) NOT NULL COMMENT '1:����;2:ɾ��;3:�޸�',
  `update_time` bigint(19) NOT NULL COMMENT '��ǰ����ʱ��,������',
  PRIMARY KEY (`key`,`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_sys_log
-- ----------------------------
INSERT INTO `sync_sys_log` VALUES ('20170905160822_admin_4115', '1', '1504598902960');
INSERT INTO `sync_sys_log` VALUES ('20170905160846_admin_4115', '1', '1504598926469');
INSERT INTO `sync_sys_log` VALUES ('20170905161350_admin_4115', '1', '1504599230284');
INSERT INTO `sync_sys_log` VALUES ('20170905161647_admin_4115', '1', '1504599407519');
INSERT INTO `sync_sys_log` VALUES ('20170905162159_admin_4115', '1', '1504599719833');
INSERT INTO `sync_sys_log` VALUES ('20170905162209_123123_4115', '1', '1504599729474');
INSERT INTO `sync_sys_log` VALUES ('20170905162234_123123_4115', '1', '1504599754422');
INSERT INTO `sync_sys_log` VALUES ('20170905162243_admin_4115', '1', '1504599763220');
INSERT INTO `sync_sys_log` VALUES ('20170905162313_admin_4115', '1', '1504599793158');
INSERT INTO `sync_sys_log` VALUES ('20170905162320__', '1', '1504599800615');
INSERT INTO `sync_sys_log` VALUES ('20170905162327_086422_41150101', '1', '1504599807744');
INSERT INTO `sync_sys_log` VALUES ('20170905162555_086422_41150101', '1', '1504599955900');
INSERT INTO `sync_sys_log` VALUES ('20170905162603_admin_4115', '1', '1504599963841');
INSERT INTO `sync_sys_log` VALUES ('20170905163147_admin_4115', '1', '1504600307187');
INSERT INTO `sync_sys_log` VALUES ('20170905163154_087239_411501', '1', '1504600314301');
INSERT INTO `sync_sys_log` VALUES ('20170905163240_087239_411501', '1', '1504600360189');
INSERT INTO `sync_sys_log` VALUES ('20170905163246_085798_41150101', '1', '1504600366663');
INSERT INTO `sync_sys_log` VALUES ('20170905163449_085798_41150101', '1', '1504600489250');
INSERT INTO `sync_sys_log` VALUES ('20170905163458_admin_4115', '1', '1504600498267');
INSERT INTO `sync_sys_log` VALUES ('20170905163749_admin_4115', '1', '1504600669208');
INSERT INTO `sync_sys_log` VALUES ('20170905163755_admin_4115', '1', '1504600675495');
INSERT INTO `sync_sys_log` VALUES ('20170905163818_admin_4115', '1', '1504600698648');
INSERT INTO `sync_sys_log` VALUES ('20170905163825_085798_41150101', '1', '1504600705871');
INSERT INTO `sync_sys_log` VALUES ('20170905164154_085798_41150101', '1', '1504600914940');
INSERT INTO `sync_sys_log` VALUES ('20170905164202_admin_4115', '1', '1504600922725');
INSERT INTO `sync_sys_log` VALUES ('20170905170801_admin_4115', '1', '1504602481319');
INSERT INTO `sync_sys_log` VALUES ('20170905170810_123123_4115', '1', '1504602490726');
INSERT INTO `sync_sys_log` VALUES ('20170907103725_admin_4115', '1', '1504751845467');
INSERT INTO `sync_sys_log` VALUES ('20170907143028_admin_4115', '1', '1504765829013');
INSERT INTO `sync_sys_log` VALUES ('20170907143055_admin_4115', '1', '1504765855189');
INSERT INTO `sync_sys_log` VALUES ('20170907143103_admin_4115', '1', '1504765863291');
INSERT INTO `sync_sys_log` VALUES ('20170907143109_admin_4115', '1', '1504765869903');
INSERT INTO `sync_sys_log` VALUES ('20170907143130_admin_4115', '1', '1504765890016');
INSERT INTO `sync_sys_log` VALUES ('20170907143139_admin_4115', '1', '1504765899160');
INSERT INTO `sync_sys_log` VALUES ('20170907143156_admin_4115', '1', '1504765916200');
INSERT INTO `sync_sys_log` VALUES ('20170907143243_admin_4115', '1', '1504765963312');
INSERT INTO `sync_sys_log` VALUES ('20170907143256_admin_4115', '1', '1504765976942');
INSERT INTO `sync_sys_log` VALUES ('20170907143346_admin_4115', '1', '1504766026975');
INSERT INTO `sync_sys_log` VALUES ('20170907143356_admin_4115', '1', '1504766036454');
INSERT INTO `sync_sys_log` VALUES ('20170907143405_admin_4115', '1', '1504766045613');
INSERT INTO `sync_sys_log` VALUES ('20170907143411_admin_4115', '1', '1504766051679');
INSERT INTO `sync_sys_log` VALUES ('20170907144357_admin_4115', '1', '1504766638782');
INSERT INTO `sync_sys_log` VALUES ('20170907144429_admin_4115', '1', '1504766669974');
INSERT INTO `sync_sys_log` VALUES ('20170907144555_admin_4115', '1', '1504766755162');
INSERT INTO `sync_sys_log` VALUES ('20170907144719_admin_4115', '1', '1504766839668');
INSERT INTO `sync_sys_log` VALUES ('20170907144727_admin_4115', '1', '1504766847856');
INSERT INTO `sync_sys_log` VALUES ('20170907144903_admin_4115', '1', '1504766943992');
INSERT INTO `sync_sys_log` VALUES ('20170907144923_admin_4115', '1', '1504766963370');
INSERT INTO `sync_sys_log` VALUES ('20170907144934_admin_4115', '1', '1504766974571');
INSERT INTO `sync_sys_log` VALUES ('20170907145012_admin_4115', '1', '1504767012951');
INSERT INTO `sync_sys_log` VALUES ('20170907145059_admin_4115', '1', '1504767060288');
INSERT INTO `sync_sys_log` VALUES ('20170907145319_admin_4115', '1', '1504767199280');
INSERT INTO `sync_sys_log` VALUES ('20170907145756_admin_4115', '1', '1504767476939');
INSERT INTO `sync_sys_log` VALUES ('20170907150804_admin_4115', '1', '1504768085583');
INSERT INTO `sync_sys_log` VALUES ('20170907150812_admin_4115', '1', '1504768092894');
INSERT INTO `sync_sys_log` VALUES ('20170907151601_admin_4115', '1', '1504768562966');
INSERT INTO `sync_sys_log` VALUES ('20170907151627_admin_4115', '1', '1504768587209');

-- ----------------------------
-- Table structure for sync_ws_base
-- ----------------------------
DROP TABLE IF EXISTS `sync_ws_base`;
CREATE TABLE `sync_ws_base` (
  `gzz_ip` varchar(64) NOT NULL COMMENT '����վIP',
  `status` int(1) NOT NULL COMMENT '1:����;2:ɾ��;3:�޸�',
  `update_time` bigint(19) NOT NULL COMMENT '��ǰ����ʱ��,������',
  `old_gzz_ip` varchar(64) DEFAULT '' COMMENT '�޸�ǰ�Ĺ���վIP',
  PRIMARY KEY (`update_time`,`gzz_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_ws_base
-- ----------------------------
INSERT INTO `sync_ws_base` VALUES ('192.168.3.108', '3', '1504600669146', '');
INSERT INTO `sync_ws_base` VALUES ('192.168.3.108', '3', '1504600675433', '');
INSERT INTO `sync_ws_base` VALUES ('aaa', '1', '1504765889930', '');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `key` varchar(64) NOT NULL COMMENT '��ʽ��<yyyymmddHHmiss>_<��½�˺�>_<areacode>;���ܱ༭',
  `code` varchar(32) DEFAULT '' COMMENT '��½�˺�,һ���Ǿ�Ա���',
  `name` varchar(64) DEFAULT '0' COMMENT '��Ա',
  `cmt` varchar(128) NOT NULL DEFAULT '',
  `dte` datetime NOT NULL,
  `module` varchar(32) DEFAULT NULL,
  `ip` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  `areacode` varchar(32) DEFAULT '' COMMENT '��λ,ͬarea_dep.areacode',
  `areaname` varchar(128) DEFAULT NULL COMMENT '��λ,ͬarea_dep.areaname',
  PRIMARY KEY (`key`),
  KEY `idx_dte` (`dte`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4435 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('20170904111131_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-04 11:11:31', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904111944_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-04 11:19:44', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904112159_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-04 11:21:59', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904112926_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-04 11:29:26', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904113214_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-04 11:32:14', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904113643_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-04 11:36:43', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904114820_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-04 11:48:20', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904114832_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-04 11:48:32', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904115137_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-04 11:51:37', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904122408_admin_4115', 'admin', '��������Ա', 'ɾ��20170826113314_085532_411501', '2017-09-04 12:24:08', '��������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904122501_admin_4115', 'admin', '��������Ա', '�ظ�T11366_085532_20170826113314.MP4', '2017-09-04 12:25:01', '���ݹ���/ý������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904122508_admin_4115', 'admin', '��������Ա', '�ظ�T11366_085532_20170826113337.MP4', '2017-09-04 12:25:08', '���ݹ���/ý������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904122644_admin_4115', 'admin', '��������Ա', '�ظ�T11366_085532_20170827192703.MP4', '2017-09-04 12:26:44', '���ݹ���/ý������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904122648_admin_4115', 'admin', '��������Ա', '�ظ�T11366_085532_20170827192641.MP4', '2017-09-04 12:26:48', '���ݹ���/ý������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904124010_admin_4115', 'admin', '��������Ա', '���²���:���ӷ־�', '2017-09-04 12:40:10', 'ϵͳ����/���Ź���', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904124102_admin_4115', 'admin', '��������Ա', '���²���:���ӷ־�-�����ɳ���', '2017-09-04 12:41:02', 'ϵͳ����/���Ź���', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904143904_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-04 14:39:04', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170904143914_086338_4115', '086338', '����', '��¼', '2017-09-04 14:39:14', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905104026_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 10:40:26', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905104210_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 10:42:10', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905105058_admin_4115', 'admin', '��������Ա', '�޸İ���20170905091015_085532_411501', '2017-09-05 10:50:58', '��������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905105110_admin_4115', 'admin', '��������Ա', '�����ƽ���20170905091015_�����ύ����ɹ�', '2017-09-05 10:51:10', '��������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905105114_admin_4115', 'admin', '��������Ա', '20170905091015_085532_411501', '2017-09-05 10:51:14', '��������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905105120_admin_4115', 'admin', '��������Ա', '��ʼ������-20170905091015_085532_411501', '2017-09-05 10:51:20', '��������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905105812_admin_4115', 'admin', '��������Ա', '�޸İ���20170824174539_T11366_411501', '2017-09-05 10:58:12', '��������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905110207_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-05 11:02:07', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905110219_123123_4115', '123123', 'ceshi', '��¼', '2017-09-05 11:02:19', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905110259_123123_4115', '123123', 'ceshi', '�ǳ�', '2017-09-05 11:02:59', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905110307_084790_41151205', '084790', '����', '��¼', '2017-09-05 11:03:07', 'ƽ̨ϵͳ', '127.0.0.1', '41151205', '�����й�����-Ѳ�ؾ�֧��');
INSERT INTO `sys_log` VALUES ('20170905110401_084790_41151205', '084790', '����', '�ǳ�', '2017-09-05 11:04:01', 'ƽ̨ϵͳ', '127.0.0.1', '41151205', '�����й�����-Ѳ�ؾ�֧��');
INSERT INTO `sys_log` VALUES ('20170905110408__', null, '', '��¼', '2017-09-05 11:04:08', 'ƽ̨ϵͳ', '127.0.0.1', null, '');
INSERT INTO `sys_log` VALUES ('20170905110418_085532_411501', '085532', '����', '��¼', '2017-09-05 11:04:18', 'ƽ̨ϵͳ', '127.0.0.1', '411501', '�ϳǷ־�');
INSERT INTO `sys_log` VALUES ('20170905110518_085532_411501', '085532', '����', '�ǳ�', '2017-09-05 11:05:18', 'ƽ̨ϵͳ', '127.0.0.1', '411501', '�ϳǷ־�');
INSERT INTO `sys_log` VALUES ('20170905110528_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 11:05:28', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905110635_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-05 11:06:35', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905110643_123123_4115', '123123', 'ceshi', '��¼', '2017-09-05 11:06:43', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905110728_123123_4115', '123123', 'ceshi', '�ǳ�', '2017-09-05 11:07:28', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905110737_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 11:07:37', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905111416_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 11:14:16', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905112049_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-05 11:20:49', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905112100_123123_4115', '123123', 'ceshi', '��¼', '2017-09-05 11:21:00', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905112125_123123_4115', '123123', 'ceshi', '�����ƽ���20170824174539_�����ύ����ɹ�', '2017-09-05 11:21:25', '��������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905112128_123123_4115', '123123', 'ceshi', '�ǳ�', '2017-09-05 11:21:28', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905112136_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 11:21:36', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905121010_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-05 12:10:10', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905121024_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 12:10:24', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905122531_123123_4115', '123123', 'ceshi', '��¼', '2017-09-05 12:25:31', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905122543_123123_4115', '123123', 'ceshi', '�ǳ�', '2017-09-05 12:25:43', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905122551_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 12:25:51', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905131937_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 13:19:37', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905132117_admin_4115', 'admin', '��������Ա', '20170824174539_T11366_411501', '2017-09-05 13:21:17', '��������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905141021_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 14:10:21', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905143038_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 14:30:38', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905143424_admin_4115', 'admin', '��������Ա', '�޸�:', '2017-09-05 14:34:24', '�豸����/����վ����', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905145603_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 14:56:03', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905144639_admin_4115', 'admin', '��������Ա', '���²���:�ϳǷ־�', '2017-09-05 14:46:39', 'ϵͳ����/���Ź���', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905144832_admin_4115', 'admin', '��������Ա', '���²���:�ϳǷ־�', '2017-09-05 14:48:32', 'ϵͳ����/���Ź���', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905144849_admin_4115', 'admin', '��������Ա', '���²���:���ӷ־�', '2017-09-05 14:48:49', 'ϵͳ����/���Ź���', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905150304_admin_4115', 'admin', '��������Ա', '�޸İ���20170905114815_085532_411501', '2017-09-05 15:03:04', '��������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905154431_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 15:44:31', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905154823_admin_4115', 'admin', '��������Ա', '�޸�:�����й�����', '2017-09-05 15:48:23', '�豸����/����վ����', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905154825_admin_4115', 'admin', '��������Ա', '�޸�192.168.3.110:�����й�����', '2017-09-05 15:48:25', '�豸����/����վ����', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905154832_admin_4115', 'admin', '��������Ա', '�޸�192.168.43.45:ƽ�ŷ־�', '2017-09-05 15:48:32', '�豸����/����վ����', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905155308_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 15:53:08', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905155324_admin_4115', 'admin', '��������Ա', '�޸�192.168.0.26', '2017-09-05 15:53:24', '�豸����/����������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905160038_admin_4115', 'admin', '��������Ա', '����Ϣ��', '2017-09-05 16:00:38', 'ϵͳ����/���Ž�ɫ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905160141_admin_4115', 'admin', '��������Ա', '�༭��Ա-����', '2017-09-05 16:01:41', 'ϵͳ����/��Ա����', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905160822_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-05 16:08:22', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905160846_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 16:08:46', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905161350_admin_4115', 'admin', '��������Ա', '��������', '2017-09-05 16:13:50', '�豸����/����վ����', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905161647_admin_4115', 'admin', '��������Ա', '��������', '2017-09-05 16:16:47', '��������', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905162159_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-05 16:21:59', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905162209_123123_4115', '123123', 'ceshi', '��¼', '2017-09-05 16:22:09', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905162234_123123_4115', '123123', 'ceshi', '�ǳ�', '2017-09-05 16:22:34', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905162243_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 16:22:43', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905162313_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-05 16:23:13', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905162320__', null, '', '��¼', '2017-09-05 16:23:20', 'ƽ̨ϵͳ', '127.0.0.1', null, '');
INSERT INTO `sys_log` VALUES ('20170905162327_086422_41150101', '086422', '��ʥ��', '��¼', '2017-09-05 16:23:27', 'ƽ̨ϵͳ', '127.0.0.1', '41150101', '�ϳǷ־�-�ϳ��ɳ���');
INSERT INTO `sys_log` VALUES ('20170905162555_086422_41150101', '086422', '��ʥ��', '�ǳ�', '2017-09-05 16:25:55', 'ƽ̨ϵͳ', '127.0.0.1', '41150101', '�ϳǷ־�-�ϳ��ɳ���');
INSERT INTO `sys_log` VALUES ('20170905162603_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 16:26:03', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905163147_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-05 16:31:47', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905163154_087239_411501', '087239', '������', '��¼', '2017-09-05 16:31:54', 'ƽ̨ϵͳ', '127.0.0.1', '411501', '�ϳǷ־�');
INSERT INTO `sys_log` VALUES ('20170905163240_087239_411501', '087239', '������', '�ǳ�', '2017-09-05 16:32:40', 'ƽ̨ϵͳ', '127.0.0.1', '411501', '�ϳǷ־�');
INSERT INTO `sys_log` VALUES ('20170905163246_085798_41150101', '085798', '������', '��¼', '2017-09-05 16:32:46', 'ƽ̨ϵͳ', '127.0.0.1', '41150101', '�ϳǷ־�-�ϳ��ɳ���');
INSERT INTO `sys_log` VALUES ('20170905163449_085798_41150101', '085798', '������', '�ǳ�', '2017-09-05 16:34:49', 'ƽ̨ϵͳ', '127.0.0.1', '41150101', '�ϳǷ־�-�ϳ��ɳ���');
INSERT INTO `sys_log` VALUES ('20170905163458_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 16:34:58', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905163749_admin_4115', 'admin', '��������Ա', '�޸�192.168.3.108:', '2017-09-05 16:37:49', '�豸����/����վ����', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905163755_admin_4115', 'admin', '��������Ա', '�޸�192.168.3.108:�ϳǷ־�-�ϳ��ɳ���', '2017-09-05 16:37:55', '�豸����/����վ����', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905163818_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-05 16:38:18', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905163825_085798_41150101', '085798', '������', '��¼', '2017-09-05 16:38:25', 'ƽ̨ϵͳ', '127.0.0.1', '41150101', '�ϳǷ־�-�ϳ��ɳ���');
INSERT INTO `sys_log` VALUES ('20170905164154_085798_41150101', '085798', '������', '�ǳ�', '2017-09-05 16:41:54', 'ƽ̨ϵͳ', '127.0.0.1', '41150101', '�ϳǷ־�-�ϳ��ɳ���');
INSERT INTO `sys_log` VALUES ('20170905164202_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-05 16:42:02', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905170801_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-05 17:08:01', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170905170810_123123_4115', '123123', 'ceshi', '��¼', '2017-09-05 17:08:10', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907103725_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-07 10:37:25', 'ƽ̨ϵͳ', '127.0.0.1', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907143028_admin_4115', 'admin', '��������Ա', '����aaaa:����', '2017-09-07 14:30:28', '�豸����/ִ���ǹ���', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907143055_admin_4115', 'admin', '��������Ա', '����aaa', '2017-09-07 14:30:55', '�豸����/����������', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907143103_admin_4115', 'admin', '��������Ա', '�޸�aaa', '2017-09-07 14:31:03', '�豸����/����������', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907143109_admin_4115', 'admin', '��������Ա', 'ɾ��������:aaa', '2017-09-07 14:31:09', '�豸����/����������', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907143130_admin_4115', 'admin', '��������Ա', '����aaa:�����й�����', '2017-09-07 14:31:30', '�豸����/����վ����', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907143139_admin_4115', 'admin', '��������Ա', 'ɾ������վ:aaa', '2017-09-07 14:31:39', '�豸����/����վ����', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907143156_admin_4115', 'admin', '��������Ա', '����aa(aa)', '2017-09-07 14:31:56', 'ϵͳ����/��Ա����', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907143243_admin_4115', 'admin', '��������Ա', '����a(a)', '2017-09-07 14:32:43', 'ϵͳ����/��Ա����', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907143256_admin_4115', 'admin', '��������Ա', 'ɾ����Ա-a', '2017-09-07 14:32:56', 'ϵͳ����/��Ա����', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907143346_admin_4115', 'admin', '��������Ա', '����a(a)', '2017-09-07 14:33:46', 'ϵͳ����/��Ա����', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907143356_admin_4115', 'admin', '��������Ա', 'ɾ����Ա-a', '2017-09-07 14:33:56', 'ϵͳ����/��Ա����', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907143405_admin_4115', 'admin', '��������Ա', '����a(a)', '2017-09-07 14:34:05', 'ϵͳ����/��Ա����', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907143411_admin_4115', 'admin', '��������Ա', 'ɾ����Ա-a', '2017-09-07 14:34:11', 'ϵͳ����/��Ա����', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907144357_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-07 14:43:57', 'ƽ̨ϵͳ', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907144429_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-07 14:44:29', 'ƽ̨ϵͳ', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907144555_admin_4115', 'admin', '��������Ա', 'ɾ��ִ����¼��', '2017-09-07 14:45:55', '�豸����/ִ���ǹ���', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907144719_admin_4115', 'admin', '��������Ա', '����aa:����', '2017-09-07 14:47:19', '�豸����/ִ���ǹ���', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907144727_admin_4115', 'admin', '��������Ա', 'ɾ��ִ����¼��', '2017-09-07 14:47:27', '�豸����/ִ���ǹ���', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907144903_admin_4115', 'admin', '��������Ա', '����aa:����', '2017-09-07 14:49:03', '�豸����/ִ���ǹ���', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907144923_admin_4115', 'admin', '��������Ա', 'ɾ��ִ����¼��', '2017-09-07 14:49:23', '�豸����/ִ���ǹ���', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907144934_admin_4115', 'admin', '��������Ա', '����aa:���پ�', '2017-09-07 14:49:34', '�豸����/ִ���ǹ���', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907145012_admin_4115', 'admin', '��������Ա', 'ɾ��ִ����¼��', '2017-09-07 14:50:12', '�豸����/ִ���ǹ���', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907145059_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-07 14:50:59', 'ƽ̨ϵͳ', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907145319_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-07 14:53:19', 'ƽ̨ϵͳ', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907145756_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-07 14:57:56', 'ƽ̨ϵͳ', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907150804_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-07 15:08:04', 'ƽ̨ϵͳ', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907150812_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-07 15:08:12', 'ƽ̨ϵͳ', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907151601_admin_4115', 'admin', '��������Ա', '�ǳ�', '2017-09-07 15:16:01', 'ƽ̨ϵͳ', '0.0.0.0', '4115', '�����й�����');
INSERT INTO `sys_log` VALUES ('20170907151627_admin_4115', 'admin', '��������Ա', '��¼', '2017-09-07 15:16:27', 'ƽ̨ϵͳ', '0.0.0.0', '4115', '�����й�����');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '�������',
  `content` varchar(512) DEFAULT NULL COMMENT '��������',
  `areacode` varchar(32) DEFAULT NULL COMMENT '��λ,ͬarea_dep.areacode',
  `areaname` varchar(128) DEFAULT NULL COMMENT '��������',
  `creater_id` varchar(32) DEFAULT NULL COMMENT '�����ˣ���½�û�id',
  `creater_name` varchar(60) DEFAULT NULL COMMENT '�����ˣ���½�û�',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `start_time` datetime NOT NULL COMMENT '������Ч��ʼʱ��',
  `end_time` datetime NOT NULL COMMENT '������Ч����ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_titile` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '����', '����', '4115', '�����й�����', '086338', '����', '2017-08-18 09:49:14', '2017-08-18 00:00:00', '2017-08-22 23:59:59');
INSERT INTO `sys_notice` VALUES ('2', 'ִ�������-T11366', '���ΪT11366��ִ������ϵͳ��δ�Ǽ�ע�ᣬ����ֹ����.����ʱ��:2017-08-25 10:28:25', '4115', '����ʡ������', 'admin', '��������Ա', '2017-08-25 10:28:25', '2017-08-25 10:33:17', '2017-08-26 10:33:17');
INSERT INTO `sys_notice` VALUES ('3', 'ִ�������-TA00718', '���ΪTA00718��ִ������ϵͳ��δ�Ǽ�ע�ᣬ����ֹ����.���빤��վ:(192.168.3.113),����ʱ��:2017-09-05 12:36:04', '4115', '����ʡ������', 'admin', '��������Ա', '2017-08-25 10:28:25', '2017-09-05 12:36:04', '2017-09-06 12:36:04');

-- ----------------------------
-- Table structure for ws_base
-- ----------------------------
DROP TABLE IF EXISTS `ws_base`;
CREATE TABLE `ws_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gzz_ip` varchar(64) NOT NULL COMMENT '����վIP',
  `areacode` varchar(32) DEFAULT '' COMMENT '��λ,ͬarea_dep.areacode',
  `areaname` varchar(128) DEFAULT NULL COMMENT '��λ,ͬarea_dep.areaname',
  `fzr` varchar(64) DEFAULT NULL COMMENT '������',
  `dh` varchar(32) DEFAULT NULL COMMENT '�����˵绰',
  `zxzt` int(2) NOT NULL DEFAULT '1' COMMENT '����״̬,0:�����ߣ�1������',
  `ztsj` datetime NOT NULL COMMENT '״̬ʱ��',
  `qyzt` int(2) NOT NULL DEFAULT '1' COMMENT '����״̬ 0:δ���ã�1������',
  `create_time` datetime DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gzz_ip` (`gzz_ip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ws_base
-- ----------------------------
INSERT INTO `ws_base` VALUES ('1', '10.102.131.121', '411506', 'ƽ�ŷ־�', '', '', '0', '2017-08-31 17:38:45', '1', '2017-01-01 00:00:00');
INSERT INTO `ws_base` VALUES ('2', '192.168.43.45', '411506', 'ƽ�ŷ־�', '', '', '0', '2017-08-31 17:38:46', '1', '2017-01-01 00:00:00');
INSERT INTO `ws_base` VALUES ('3', '192.168.0.26', null, null, null, null, '0', '2017-08-31 17:38:46', '1', '2017-01-01 00:00:00');
INSERT INTO `ws_base` VALUES ('4', '192.168.1.102', null, null, null, null, '0', '2017-08-31 17:38:47', '1', '2017-01-01 00:00:00');
INSERT INTO `ws_base` VALUES ('5', '192.168.3.108', '41150101', '�ϳǷ־�-�ϳ��ɳ���', null, null, '1', '2017-08-31 17:38:47', '1', '2017-01-01 00:00:00');
INSERT INTO `ws_base` VALUES ('6', '192.168.3.110', '4115', '�����й�����', null, null, '1', '2017-08-31 17:38:47', '1', '2017-01-01 00:00:00');
INSERT INTO `ws_base` VALUES ('7', '192.168.77.33', '411503', '��ɽ�־�', null, null, '0', '2017-08-31 17:38:47', '1', '2017-01-01 00:00:00');
INSERT INTO `ws_base` VALUES ('8', '192.168.68.162', '411501', '�ϳǷ־�', null, null, '1', '2017-09-03 09:58:25', '1', '2017-01-01 00:00:00');
INSERT INTO `ws_base` VALUES ('9', '192.168.3.113', '411501', '�ϳǷ־�', null, null, '1', '2017-09-05 09:31:35', '1', '2017-01-01 00:00:00');

-- ----------------------------
-- Table structure for ws_log
-- ----------------------------
DROP TABLE IF EXISTS `ws_log`;
CREATE TABLE `ws_log` (
  `id` bigint(19) NOT NULL,
  `areacode` varchar(32) DEFAULT '' COMMENT '��λ,ͬarea_dep.areacode',
  `areaname` varchar(128) DEFAULT '' COMMENT '��λ,ͬarea_dep.areaname',
  `code` varchar(32) DEFAULT '' COMMENT '����',
  `name` varchar(64) DEFAULT '' COMMENT '��Ա',
  `cpxh` varchar(12) DEFAULT '' COMMENT '�豸(ִ���ǣ�',
  `gzz_ip` varchar(64) DEFAULT NULL COMMENT '����վip',
  `comment` varchar(128) DEFAULT '0' COMMENT '����',
  `type` varchar(30) DEFAULT 'collection' COMMENT '��������',
  `opt_time` datetime DEFAULT '2017-01-01 00:00:00' COMMENT '����ʱ��',
  PRIMARY KEY (`id`),
  KEY `idx_opt_time` (`opt_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ws_log
-- ----------------------------
INSERT INTO `ws_log` VALUES ('1', '4115', '�����й�����', '', '����', '1212', '192.168.3.1', '��˹��', 'collection', '2017-09-03 00:00:00');
INSERT INTO `ws_log` VALUES ('2', '4115', '�����й�����', '', '����', '12123', '192.168.3.1', '����', 'collection', '2017-09-03 00:00:00');
SET FOREIGN_KEY_CHECKS=1;