/*
Navicat MySQL Data Transfer

Source Server         : fyt
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : fyt_ims

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-06-18 23:57:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for erpbackgoods
-- ----------------------------
DROP TABLE IF EXISTS `erpbackgoods`;
CREATE TABLE `erpbackgoods` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一编号',
  `Number` varchar(30) NOT NULL COMMENT '订单号',
  `ShopGuid` varchar(50) NOT NULL COMMENT '退货涉及的店铺',
  `OrderGuid` varchar(50) DEFAULT NULL COMMENT '退货涉及的订单号',
  `AdminGuid` varchar(50) NOT NULL COMMENT '谁提交的退货',
  `GoodsSku` varchar(50) NOT NULL COMMENT '退货的商品',
  `BackCount` int(11) NOT NULL DEFAULT '1' COMMENT '退货数量',
  `BackMoney` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退货的金额',
  `Status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '退货的状态 1=提交退货 2=受理 3=完成 4=其他',
  `Summary` varchar(500) DEFAULT NULL COMMENT '退货原因',
  `AddDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '提交退货的时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erpbackgoods
-- ----------------------------

-- ----------------------------
-- Table structure for erpgoods
-- ----------------------------
DROP TABLE IF EXISTS `erpgoods`;
CREATE TABLE `erpgoods` (
  `Guid` varchar(50) NOT NULL,
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erpgoods
-- ----------------------------

-- ----------------------------
-- Table structure for erpgoodssku
-- ----------------------------
DROP TABLE IF EXISTS `erpgoodssku`;
CREATE TABLE `erpgoodssku` (
  `Guid` varchar(50) NOT NULL,
  `GoodsGuid` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `Code` varchar(50) DEFAULT NULL COMMENT '条形码',
  `SalePrice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售价格',
  `DisPrice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折扣价格',
  `StockSum` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `SaleSum` int(11) NOT NULL DEFAULT '0' COMMENT '销售数量',
  `Status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=正常 2=异常',
  `BrankGuid` varchar(50) DEFAULT NULL COMMENT '品牌编号',
  `SeasonGuid` varchar(50) DEFAULT NULL COMMENT '季节编号',
  `StyleGuid` varchar(50) DEFAULT NULL COMMENT '款式编号',
  `BatchGuid` varchar(50) DEFAULT NULL COMMENT '批次编号',
  `SizeGuid` varchar(50) DEFAULT NULL COMMENT '尺码编号',
  `AddDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erpgoodssku
-- ----------------------------

-- ----------------------------
-- Table structure for erpinoutlog
-- ----------------------------
DROP TABLE IF EXISTS `erpinoutlog`;
CREATE TABLE `erpinoutlog` (
  `Guid` varchar(50) NOT NULL,
  `Types` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型 1=入库 2=出库',
  `PackGuid` varchar(50) NOT NULL COMMENT '出入库打包日志的编号',
  `ShopGuid` varchar(50) DEFAULT NULL COMMENT '出库商品到店铺的编号',
  `GoodsSku` varchar(50) NOT NULL COMMENT '出入库商品的编号',
  `GoodsSum` int(11) NOT NULL DEFAULT '0' COMMENT '出入库商品的数量',
  `AdminGuid` varchar(50) NOT NULL COMMENT '后台管理人员的编号',
  `AddDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '出入库的时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erpinoutlog
-- ----------------------------

-- ----------------------------
-- Table structure for erppacklog
-- ----------------------------
DROP TABLE IF EXISTS `erppacklog`;
CREATE TABLE `erppacklog` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一编号',
  `Types` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型：1=出库打包日志  2=入库打包日志',
  `Number` varchar(30) NOT NULL COMMENT '打包订单号',
  `PackName` varchar(50) NOT NULL COMMENT '打包名称（可以是时间）',
  `GoodsSum` int(11) NOT NULL DEFAULT '0' COMMENT '当前打包商品总数量',
  `ShopGuid` varchar(50) NOT NULL COMMENT '打包的商品归属商铺编号',
  `AddDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '打包时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erppacklog
-- ----------------------------

-- ----------------------------
-- Table structure for erpreturngoods
-- ----------------------------
DROP TABLE IF EXISTS `erpreturngoods`;
CREATE TABLE `erpreturngoods` (
  `Guid` varchar(50) NOT NULL,
  `Number` varchar(30) NOT NULL COMMENT '订单号',
  `ShopGuid` varchar(50) NOT NULL COMMENT '哪个店铺提出的返货',
  `AdminGuid` varchar(50) NOT NULL COMMENT '哪个人操作的',
  `GoodsSku` varchar(50) NOT NULL COMMENT '返货的是哪件衣服',
  `ReturnCount` int(11) NOT NULL DEFAULT '1' COMMENT '返货的数量',
  `BatchGuid` varchar(50) DEFAULT NULL COMMENT '属于哪个批次',
  `BatchName` varchar(50) DEFAULT NULL COMMENT '批次名称',
  `Status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '返货的状态 1=提交返货 2=受理 3=完成 4=其他',
  `Summary` varchar(500) DEFAULT NULL COMMENT '返货描述',
  `AddDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '提交返货的时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erpreturngoods
-- ----------------------------

-- ----------------------------
-- Table structure for erpshopactivity
-- ----------------------------
DROP TABLE IF EXISTS `erpshopactivity`;
CREATE TABLE `erpshopactivity` (
  `Guid` varchar(50) NOT NULL,
  `ShopGuid` varchar(50) NOT NULL COMMENT '店铺编号',
  `Types` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型(1=按商铺/2=按商品/3=按地区)',
  `Method` tinyint(4) NOT NULL DEFAULT '1' COMMENT '方式(1=打折/2=满减)',
  `CountNum` int(11) DEFAULT NULL COMMENT '折扣数',
  `FullBack` text COMMENT '满减Json',
  `BeginDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `EndDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  `AddDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '活动添加时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erpshopactivity
-- ----------------------------

-- ----------------------------
-- Table structure for erpshops
-- ----------------------------
DROP TABLE IF EXISTS `erpshops`;
CREATE TABLE `erpshops` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一编号',
  `LoginName` varchar(20) NOT NULL COMMENT '店铺登录账号',
  `LoginPwd` varchar(100) NOT NULL COMMENT '店铺登录密码',
  `AdminName` varchar(10) DEFAULT NULL COMMENT '负责人姓名',
  `Sex` varchar(10) DEFAULT '' COMMENT '性别',
  `ShopCover` varchar(100) DEFAULT NULL COMMENT '店铺封面图',
  `Status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核状态 0=正常 1=账号冻结  2=停业',
  `ShopName` varchar(50) NOT NULL COMMENT '店铺名称',
  `Mobile` varchar(50) DEFAULT NULL COMMENT '负责人联系电话',
  `Tel` varchar(50) DEFAULT NULL COMMENT '座机号码',
  `ShopCity` varchar(50) DEFAULT NULL COMMENT '店铺所在区域',
  `ShopAddress` varchar(100) DEFAULT NULL COMMENT '店铺详细地址',
  `ShopLogo` varchar(255) DEFAULT NULL COMMENT '店铺Logo',
  `Summary` varchar(500) DEFAULT NULL COMMENT '备注',
  `RegDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `LoginCount` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `LastLoginDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `UpLoginDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erpshops
-- ----------------------------

-- ----------------------------
-- Table structure for erpshopuser
-- ----------------------------
DROP TABLE IF EXISTS `erpshopuser`;
CREATE TABLE `erpshopuser` (
  `Guid` varchar(50) NOT NULL,
  `ShopGuid` varchar(50) NOT NULL COMMENT '归属于某个店铺',
  `UserName` varchar(20) NOT NULL COMMENT '会员姓名',
  `Mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `LoginPwd` varchar(50) NOT NULL COMMENT '登录密码',
  `Points` int(11) NOT NULL DEFAULT '0' COMMENT '积分数',
  `Sex` varchar(5) DEFAULT NULL COMMENT '性别',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0=正常 1=账号冻结',
  `RegDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `LoginCount` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `LastLoginDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录日期',
  `UpLoginDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录日期',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erpshopuser
-- ----------------------------

-- ----------------------------
-- Table structure for erpstaff
-- ----------------------------
DROP TABLE IF EXISTS `erpstaff`;
CREATE TABLE `erpstaff` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一编号',
  `ShopGuid` varchar(50) DEFAULT NULL COMMENT '所属店铺（可以是总店）',
  `LoginName` varchar(20) NOT NULL COMMENT '员工登录账号',
  `LoginPwd` varchar(50) NOT NULL COMMENT '登录密码',
  `TrueName` varchar(10) NOT NULL COMMENT '真实姓名',
  `Mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `Sex` varchar(5) DEFAULT NULL COMMENT '性别',
  `Status` tinyint(4) NOT NULL COMMENT '状态 0=正常 1=账号冻结 2=离职',
  `AddDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `LoginCount` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `LastLoginDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次登录时间',
  `UpLoginDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erpstaff
-- ----------------------------

-- ----------------------------
-- Table structure for sysadmin
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin`;
CREATE TABLE `sysadmin` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一标识',
  `RoleGuid` varchar(50) DEFAULT NULL COMMENT '角色标识',
  `DepartmentName` varchar(50) NOT NULL COMMENT '部门名称',
  `DepartmentGuid` varchar(50) NOT NULL COMMENT '部门标识',
  `DepartmentGuidList` varchar(500) DEFAULT NULL,
  `LoginName` varchar(30) NOT NULL COMMENT '登录账号',
  `LoginPwd` varchar(50) NOT NULL COMMENT '登录密码',
  `TrueName` varchar(20) DEFAULT NULL COMMENT '真是姓名',
  `Number` varchar(10) NOT NULL COMMENT '编号',
  `HeadPic` varchar(100) NOT NULL COMMENT '头像',
  `Sex` varchar(10) NOT NULL DEFAULT '' COMMENT '性别',
  `Mobile` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `Status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态',
  `Email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `Summary` varchar(500) DEFAULT NULL COMMENT '描述',
  `AddDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `LoginDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  `UpLoginDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysadmin
-- ----------------------------
INSERT INTO `sysadmin` VALUES ('12cc96cf-7ccf-430b-a54a-e1c6f04690cb', null, '商务中心', '52523a76-52b3-4c25-a1bd-9123a011f2a8', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,5533b6c5-ba2e-4659-be29-c860bb41e04d,52523a76-52b3-4c25-a1bd-9123a011f2a8,', 'admins', 'pPo9vFeTWOCF0oLKKdX9Jw==', '张三', '1101', '/themes/img/avatar.jpg', '男', '13888888888', '', null, null, '2018-06-13 21:43:43', '2018-06-18 06:30:01', '2018-06-18 06:30:01');
INSERT INTO `sysadmin` VALUES ('30d3da88-bb72-4ace-a303-b3aae0ecb732', null, '事业发展部', '4b6ab27f-c0fa-483d-9b5a-55891ee8d727', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,388b72d3-e10a-4183-8ef7-6be44eb99b1a,4b6ab27f-c0fa-483d-9b5a-55891ee8d727,', 'testadmin', 'pPo9vFeTWOCF0oLKKdX9Jw==', '李四', '1002', '/themes/img/avatar.jpg', '男', null, '\0', null, null, '2018-06-16 23:35:36', null, null);

-- ----------------------------
-- Table structure for sysbtnfun
-- ----------------------------
DROP TABLE IF EXISTS `sysbtnfun`;
CREATE TABLE `sysbtnfun` (
  `Guid` varchar(50) NOT NULL,
  `MenuGuid` varchar(50) NOT NULL,
  `Name` varchar(20) NOT NULL COMMENT '功能名称',
  `FunType` varchar(20) NOT NULL COMMENT '功能标识名称',
  `Summary` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysbtnfun
-- ----------------------------
INSERT INTO `sysbtnfun` VALUES ('6b8d6513-5da7-4f68-a2c4-f0c7cfaf7f61', '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '新增', 'Add', null);
INSERT INTO `sysbtnfun` VALUES ('931bd729-f160-4fe3-bb7c-7828a2da047a', '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '修改', 'Edit', null);
INSERT INTO `sysbtnfun` VALUES ('c4261103-dfc7-46e5-ab20-4ca5fc7729f6', '5ce13ead-971b-4ed4-ad5f-acacccd82381', '删除', 'Delete', null);

-- ----------------------------
-- Table structure for syscode
-- ----------------------------
DROP TABLE IF EXISTS `syscode`;
CREATE TABLE `syscode` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一标号Guid',
  `ParentGuid` varchar(50) NOT NULL COMMENT '字典类型标识',
  `CodeType` varchar(50) DEFAULT NULL COMMENT '字典值——类型',
  `Name` varchar(255) NOT NULL COMMENT '字典值——名称',
  `EnName` varchar(255) DEFAULT NULL COMMENT '字典值——英文名称',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '字典值——排序',
  `Status` bit(1) NOT NULL DEFAULT b'1' COMMENT '字典值——状态',
  `Summary` varchar(1000) DEFAULT NULL COMMENT '字典值——描述',
  `AddTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '字典值——添加时间',
  `EditTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '字典值——修改时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syscode
-- ----------------------------
INSERT INTO `syscode` VALUES ('00fca0bf-e26c-4a17-b0bb-29fd3c2ad701', '21576fef-1a5b-4af8-a394-ec5166b4a8e4', '1011', '台盟盟员', null, '24', '', null, '2018-03-29 12:30:43', '2018-03-29 12:30:43');
INSERT INTO `syscode` VALUES ('042e6708-3303-4fa0-8cf1-2958d5144cd0', '1f1db281-ce59-42ca-9647-26f7fb882b2e', '1002', '经济与贸易', null, '46', '', null, '2018-03-30 14:24:04', '2018-03-30 14:24:04');
INSERT INTO `syscode` VALUES ('0975c3e9-c1e5-4864-bc9c-80de58c37c9d', 'e9b04253-49a3-47bc-82e2-53d506fda641', '1003', '满族', null, '29', '', null, '2018-03-29 12:39:19', '2018-03-29 12:39:19');
INSERT INTO `syscode` VALUES ('0d8bbb2b-dc2d-4744-ac95-6a45ca6a1963', 'e9b04253-49a3-47bc-82e2-53d506fda641', '1002', '蒙古族', null, '28', '', null, '2018-03-29 12:39:12', '2018-03-29 12:39:12');
INSERT INTO `syscode` VALUES ('1537252f-88cd-4189-a7e8-bd646c602f5c', 'b3767d9d-2ecc-48c5-b56d-d9af628c0c63', '1008', '博士', null, '10', '', null, '2018-05-06 10:25:24', '2018-05-06 10:25:25');
INSERT INTO `syscode` VALUES ('18d55180-c690-4f82-bf81-0e6b5e61dada', '6ceddac9-c24a-4e36-bcc3-33d31a2d737e', '1001', '国立', null, '42', '', null, '2018-03-30 14:23:07', '2018-03-30 14:23:07');
INSERT INTO `syscode` VALUES ('1a0b73f2-3ed6-4818-9bc0-5f4960f58703', 'b3767d9d-2ecc-48c5-b56d-d9af628c0c63', '1002', '初中', null, '4', '', null, '2018-03-29 12:26:54', '2018-03-29 12:26:54');
INSERT INTO `syscode` VALUES ('1f722c76-cc36-416e-855f-7a2c4ecac12f', 'd14fb7c9-e867-467e-94fa-9f1a94692b88', '1003', '日语', null, '13', '', null, '2018-03-29 13:51:50', '2018-03-29 13:51:51');
INSERT INTO `syscode` VALUES ('21ba8e52-3336-41d7-9567-dc376f7e44ec', '21576fef-1a5b-4af8-a394-ec5166b4a8e4', '1001', '中共党员', null, '14', '', null, '2018-03-29 12:29:38', '2018-03-29 12:29:39');
INSERT INTO `syscode` VALUES ('27a399ca-9415-4a39-84c7-88cae944ca25', 'e9b04253-49a3-47bc-82e2-53d506fda641', '1001', '汉族', null, '27', '', null, '2018-03-29 12:38:36', '2018-03-29 12:38:36');
INSERT INTO `syscode` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', '2128dd06-6414-44e4-ae83-502f58d886d2', '1001', '已婚', null, '37', '', null, '2018-03-29 12:41:10', '2018-03-29 12:41:10');
INSERT INTO `syscode` VALUES ('2999af31-6d30-4c9e-a8e2-9331c537b361', 'b3767d9d-2ecc-48c5-b56d-d9af628c0c63', '1004', '高中', null, '6', '', null, '2018-03-29 12:27:07', '2018-03-29 12:27:07');
INSERT INTO `syscode` VALUES ('29ee3b9c-b426-4e11-a3a9-f8ba2cfa1a19', '21576fef-1a5b-4af8-a394-ec5166b4a8e4', '1003', '共青团员', null, '16', '', null, '2018-03-29 12:29:53', '2018-03-29 12:29:53');
INSERT INTO `syscode` VALUES ('2d42a5cc-9911-4807-9b1e-b29595dacb9b', 'b3767d9d-2ecc-48c5-b56d-d9af628c0c63', '1007', '硕士', null, '9', '', null, '2018-03-29 12:27:24', '2018-03-29 12:27:24');
INSERT INTO `syscode` VALUES ('2f3fcc5e-737b-4ae8-8e8d-4a9b0032453c', '1f1db281-ce59-42ca-9647-26f7fb882b2e', '1001', '计算机专业', null, '45', '', null, '2018-03-30 14:23:33', '2018-03-30 14:23:33');
INSERT INTO `syscode` VALUES ('331dcdc9-a57a-42a3-9f5e-49fb156fd030', '21576fef-1a5b-4af8-a394-ec5166b4a8e4', '1012', '无党派人士', null, '25', '', null, '2018-03-29 12:30:58', '2018-03-29 12:30:58');
INSERT INTO `syscode` VALUES ('3c9cae16-42dd-482b-804a-da75b3d7a160', '21576fef-1a5b-4af8-a394-ec5166b4a8e4', '1006', '民建会员', null, '19', '', null, '2018-03-29 12:30:09', '2018-03-29 12:30:09');
INSERT INTO `syscode` VALUES ('439083c4-c62d-459f-9564-c9ae85fd5320', 'b3767d9d-2ecc-48c5-b56d-d9af628c0c63', '1001', '小学', null, '3', '', null, '2018-05-06 00:52:41', '2018-05-06 00:52:42');
INSERT INTO `syscode` VALUES ('484a55b2-410b-428a-bdaa-54f6f48d4219', '21576fef-1a5b-4af8-a394-ec5166b4a8e4', '1009', '致公党党员', null, '22', '', null, '2018-03-29 12:30:27', '2018-03-29 12:30:27');
INSERT INTO `syscode` VALUES ('4c8cbfd1-5aad-4019-98cd-3c9dfd667257', '21576fef-1a5b-4af8-a394-ec5166b4a8e4', '1008', '农工党党员', null, '21', '', null, '2018-03-29 12:30:21', '2018-03-29 12:30:21');
INSERT INTO `syscode` VALUES ('515ba6ca-4f37-48ad-b88c-0a444ab13d49', '36eefb08-1a44-4989-b4dc-e7be65e32349', '1005', '价值观信仰', null, '34', '', '道德主义、律法主义、自由主义、功利主义、拜金主义', '2018-03-29 12:40:38', '2018-03-29 12:40:38');
INSERT INTO `syscode` VALUES ('72fd052f-15e7-499b-9bc1-7eee1b5d6f8c', '59dd330c-13a5-4ef8-9e86-918e95b5b1e2', '1001', '男', null, '1', '', null, '2018-05-06 10:25:15', '2018-05-06 10:25:16');
INSERT INTO `syscode` VALUES ('74a40e09-36bf-4311-808d-f8fb7142374a', '36eefb08-1a44-4989-b4dc-e7be65e32349', '1002', '政治信仰', null, '31', '', '三民主义、共产主义、自由民主、天赋人权', '2018-03-29 12:40:16', '2018-03-29 12:40:17');
INSERT INTO `syscode` VALUES ('74d07de9-2ba5-4bf0-b9a4-5061321d6b48', 'd14fb7c9-e867-467e-94fa-9f1a94692b88', '1005', '葡萄言语', null, '41', '', null, '2018-05-06 22:07:49', '2018-05-06 22:07:50');
INSERT INTO `syscode` VALUES ('800bd8d9-eccd-4e14-8642-e30046e835b2', '2128dd06-6414-44e4-ae83-502f58d886d2', '1003', '保密', null, '39', '', null, '2018-03-29 12:41:28', '2018-03-29 12:41:28');
INSERT INTO `syscode` VALUES ('8df42099-7001-41ee-9e28-736b1ab6d71f', 'b3767d9d-2ecc-48c5-b56d-d9af628c0c63', '1003', '中专', null, '5', '', null, '2018-03-29 12:27:02', '2018-03-29 12:27:02');
INSERT INTO `syscode` VALUES ('8e37481c-db25-4b7a-929b-0f0a5bd05e5d', 'b3767d9d-2ecc-48c5-b56d-d9af628c0c63', '1006', '本科', null, '8', '', null, '2018-03-29 12:27:19', '2018-03-29 12:27:19');
INSERT INTO `syscode` VALUES ('9593506f-193a-4503-8929-e88cb13be728', '6ceddac9-c24a-4e36-bcc3-33d31a2d737e', '1002', '私立', null, '43', '', null, '2018-03-30 14:23:16', '2018-03-30 14:23:16');
INSERT INTO `syscode` VALUES ('9b5b8286-3021-4809-addd-18a334076518', '59dd330c-13a5-4ef8-9e86-918e95b5b1e2', '1002', '女', null, '2', '', null, '2018-05-07 21:58:21', '2018-05-07 21:58:22');
INSERT INTO `syscode` VALUES ('9d484458-5dad-4233-b18e-c5d37f185f13', 'd14fb7c9-e867-467e-94fa-9f1a94692b88', '1002', '英语', null, '12', '', null, '2018-03-29 13:51:45', '2018-03-29 13:51:46');
INSERT INTO `syscode` VALUES ('a773fdd3-952c-4b15-bff5-19e92462863a', '36eefb08-1a44-4989-b4dc-e7be65e32349', '1001', '神学信仰', null, '30', '', '一神信仰、多神信仰、泛神信仰、无神信仰', '2018-03-29 12:40:20', '2018-03-29 12:40:20');
INSERT INTO `syscode` VALUES ('ad01ceee-5394-444c-9a0a-00dfbb7c6d0a', 'b3767d9d-2ecc-48c5-b56d-d9af628c0c63', '1005', '大专', null, '7', '', null, '2018-03-29 12:27:14', '2018-03-29 12:27:14');
INSERT INTO `syscode` VALUES ('b6ec418c-738e-4fbd-92a3-1805fc14bb72', '36eefb08-1a44-4989-b4dc-e7be65e32349', '1004', '科学信仰', null, '33', '', '进化论、设计论、年前地球论、年老地球论、无限膨胀论', '2018-03-29 12:40:29', '2018-03-29 12:40:29');
INSERT INTO `syscode` VALUES ('ba317503-58fe-42fc-ba6e-1bda17cbb2d7', '21576fef-1a5b-4af8-a394-ec5166b4a8e4', '1007', '民进会员', null, '20', '', null, '2018-03-29 12:30:16', '2018-03-29 12:30:16');
INSERT INTO `syscode` VALUES ('bdf398e0-cd54-49a4-8623-4262309fa7d6', '36eefb08-1a44-4989-b4dc-e7be65e32349', '1006', '社会观信仰', null, '35', '', '自我主义、社群主义、爱国主义、民族主义、国际主义', '2018-03-29 12:40:49', '2018-03-29 12:40:49');
INSERT INTO `syscode` VALUES ('bf69cf81-d484-4fc8-bd2e-da88c737c799', '21576fef-1a5b-4af8-a394-ec5166b4a8e4', '1013', '群众', null, '26', '', null, '2018-03-29 12:31:08', '2018-03-29 12:31:08');
INSERT INTO `syscode` VALUES ('c485c665-8997-4105-9ecb-dc997bff9c73', '21576fef-1a5b-4af8-a394-ec5166b4a8e4', '1002', '中共预备党员', null, '15', '', null, '2018-03-29 12:29:47', '2018-03-29 12:29:47');
INSERT INTO `syscode` VALUES ('ca3a1e29-1864-4747-8a29-39bdedc466d3', '21576fef-1a5b-4af8-a394-ec5166b4a8e4', '1004', '民革党员', null, '17', '', null, '2018-03-29 12:29:58', '2018-03-29 12:29:58');
INSERT INTO `syscode` VALUES ('cb4c0674-7646-4c4e-8404-35bdd50e2fb6', 'd14fb7c9-e867-467e-94fa-9f1a94692b88', '1001', '汉语', null, '11', '', null, '2018-03-29 13:51:40', '2018-03-29 13:51:41');
INSERT INTO `syscode` VALUES ('d79c9866-de4a-4a5c-a243-4ab79783a860', '2128dd06-6414-44e4-ae83-502f58d886d2', '1002', '未婚', null, '38', '', null, '2018-03-29 12:41:17', '2018-03-29 12:41:17');
INSERT INTO `syscode` VALUES ('d90d8b10-b4a4-459b-a976-1ae911996cd7', '6ceddac9-c24a-4e36-bcc3-33d31a2d737e', '1003', '职业培训', null, '44', '', null, '2018-03-30 14:23:24', '2018-03-30 14:23:24');
INSERT INTO `syscode` VALUES ('e02c378f-9ca4-409c-9d44-c340944560b6', '36eefb08-1a44-4989-b4dc-e7be65e32349', '1007', '财富观信仰', null, '36', '', '按劳分配、按需分配、平均分配、计效分配', '2018-03-29 12:40:59', '2018-03-29 12:40:59');
INSERT INTO `syscode` VALUES ('e4d0d874-126c-4ac4-aa99-f5c7eebbd2b5', 'd14fb7c9-e867-467e-94fa-9f1a94692b88', '1004', '法语', null, '40', '', null, '2018-03-29 13:52:00', '2018-03-29 13:52:00');
INSERT INTO `syscode` VALUES ('ea8b94e5-4bf9-4e7d-b861-83e8385a53c7', '21576fef-1a5b-4af8-a394-ec5166b4a8e4', '1005', '民盟盟员', null, '18', '', null, '2018-03-29 12:30:03', '2018-03-29 12:30:03');
INSERT INTO `syscode` VALUES ('ef24276c-173c-4912-8d85-62d89956b79d', '36eefb08-1a44-4989-b4dc-e7be65e32349', '1003', '哲学信仰', null, '32', '', '唯物主义、唯心主义、虚空主义', '2018-03-29 12:40:11', '2018-03-29 12:40:11');
INSERT INTO `syscode` VALUES ('f51ad49a-fcd3-48ee-b2b8-ac789b732dd4', '1f1db281-ce59-42ca-9647-26f7fb882b2e', '1003', '政治学', null, '47', '', null, '2018-03-30 14:24:17', '2018-03-30 14:24:17');
INSERT INTO `syscode` VALUES ('f57a726d-dd3e-4f65-af19-73ba9a71d483', '21576fef-1a5b-4af8-a394-ec5166b4a8e4', '1010', '九三学社社员', null, '23', '', null, '2018-03-29 12:30:33', '2018-03-29 12:30:33');

-- ----------------------------
-- Table structure for syscodetype
-- ----------------------------
DROP TABLE IF EXISTS `syscodetype`;
CREATE TABLE `syscodetype` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一标号Guid',
  `ParentGuid` varchar(50) DEFAULT NULL COMMENT '字典类型父级',
  `Layer` int(11) NOT NULL DEFAULT '0' COMMENT '深度',
  `Name` varchar(50) NOT NULL COMMENT '字典类型名称',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '字典类型排序',
  `AddTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `EditTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `SiteGuid` varchar(50) DEFAULT NULL COMMENT '归属公司或站点',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syscodetype
-- ----------------------------
INSERT INTO `syscodetype` VALUES ('1f1db281-ce59-42ca-9647-26f7fb882b2e', '2bbdd992-862e-476c-b54f-00c9e50dab61', '1', '专业', '11', '2018-03-30 14:22:39', '2018-03-30 14:22:39', null);
INSERT INTO `syscodetype` VALUES ('2128dd06-6414-44e4-ae83-502f58d886d2', '2bbdd992-862e-476c-b54f-00c9e50dab61', '1', '婚姻', '10', '2018-03-29 12:28:33', '2018-03-29 12:28:33', null);
INSERT INTO `syscodetype` VALUES ('21576fef-1a5b-4af8-a394-ec5166b4a8e4', '2bbdd992-862e-476c-b54f-00c9e50dab61', '1', '政治面貌', '7', '2018-03-29 12:28:14', '2018-03-29 12:28:14', null);
INSERT INTO `syscodetype` VALUES ('2bbdd992-862e-476c-b54f-00c9e50dab61', null, '0', '员工字典', '1', '2018-03-26 12:37:03', '2018-03-26 12:37:03', null);
INSERT INTO `syscodetype` VALUES ('2e0393f9-e6d6-4c15-98cf-96072f0d3d70', '8d3158d6-e179-4046-99e9-53eb8c04ddb1', '1', '批次', '15', '2018-06-18 06:38:03', '2018-06-18 06:38:03', null);
INSERT INTO `syscodetype` VALUES ('36eefb08-1a44-4989-b4dc-e7be65e32349', '2bbdd992-862e-476c-b54f-00c9e50dab61', '1', '信仰', '9', '2018-03-29 12:28:27', '2018-03-29 12:28:27', null);
INSERT INTO `syscodetype` VALUES ('48458681-48b0-490a-a840-0ffcbe49f5d4', '8d3158d6-e179-4046-99e9-53eb8c04ddb1', '1', '款式', '14', '2018-06-18 06:37:55', '2018-06-18 06:37:55', null);
INSERT INTO `syscodetype` VALUES ('59dd330c-13a5-4ef8-9e86-918e95b5b1e2', '2bbdd992-862e-476c-b54f-00c9e50dab61', '1', '性别', '2', '2018-03-26 12:37:05', '2018-03-26 12:37:05', null);
INSERT INTO `syscodetype` VALUES ('6ceddac9-c24a-4e36-bcc3-33d31a2d737e', '2bbdd992-862e-476c-b54f-00c9e50dab61', '1', '院校类型', '12', '2018-03-30 14:22:54', '2018-03-30 14:22:54', null);
INSERT INTO `syscodetype` VALUES ('7b664e3e-f58a-4e66-8c0f-be1458541d14', '8d3158d6-e179-4046-99e9-53eb8c04ddb1', '1', '品牌', '5', '2018-06-18 06:21:54', '2018-06-18 06:21:54', null);
INSERT INTO `syscodetype` VALUES ('8cb134d5-979b-40e2-b453-aeee265f4ab2', '8d3158d6-e179-4046-99e9-53eb8c04ddb1', '1', '季节', '13', '2018-06-18 06:35:32', '2018-06-18 06:35:32', null);
INSERT INTO `syscodetype` VALUES ('8d3158d6-e179-4046-99e9-53eb8c04ddb1', null, '0', '服装SKU', '4', '2018-06-18 06:21:45', '2018-06-18 06:21:46', null);
INSERT INTO `syscodetype` VALUES ('b3767d9d-2ecc-48c5-b56d-d9af628c0c63', '2bbdd992-862e-476c-b54f-00c9e50dab61', '1', '学历', '3', '2018-03-26 21:08:13', '2018-03-26 21:08:13', null);
INSERT INTO `syscodetype` VALUES ('d14fb7c9-e867-467e-94fa-9f1a94692b88', '2bbdd992-862e-476c-b54f-00c9e50dab61', '1', '语言能力', '6', '2018-03-29 12:27:58', '2018-03-29 12:27:58', null);
INSERT INTO `syscodetype` VALUES ('e86cf108-dc4d-4532-8cce-fdb041363902', '8d3158d6-e179-4046-99e9-53eb8c04ddb1', '1', '尺码', '16', '2018-06-18 06:38:09', '2018-06-18 06:38:09', null);
INSERT INTO `syscodetype` VALUES ('e9b04253-49a3-47bc-82e2-53d506fda641', '2bbdd992-862e-476c-b54f-00c9e50dab61', '1', '民族', '8', '2018-03-29 12:28:20', '2018-03-29 12:28:20', null);

-- ----------------------------
-- Table structure for sysimage
-- ----------------------------
DROP TABLE IF EXISTS `sysimage`;
CREATE TABLE `sysimage` (
  `Guid` varchar(50) NOT NULL,
  `TheGuid` varchar(50) DEFAULT NULL COMMENT '所属栏目Guid',
  `Types` int(11) NOT NULL DEFAULT '0' COMMENT '图片类型，一个栏目可有多个图片类型',
  `Title` varchar(50) DEFAULT NULL COMMENT '图片名称',
  `ImgBig` varchar(255) NOT NULL COMMENT '图片原图',
  `ImgSmall` varchar(255) DEFAULT NULL COMMENT '图片缩略图',
  `IsCover` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否为封面',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysimage
-- ----------------------------

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一标识——Guid',
  `LoginName` varchar(50) NOT NULL COMMENT '日志操作ID',
  `DepartName` varchar(50) DEFAULT NULL COMMENT '日志操作人所属部门Guid',
  `OptionTable` varchar(50) DEFAULT NULL COMMENT '操作表名',
  `Summary` varchar(255) NOT NULL COMMENT '日志操作内容',
  `IP` varchar(20) NOT NULL COMMENT '日志操作IP地址',
  `MacUrl` varchar(50) DEFAULT NULL COMMENT '日志操作Mac地址',
  `LogType` int(11) NOT NULL DEFAULT '0' COMMENT '日志操作类型',
  `Urls` varchar(255) NOT NULL COMMENT '日志操作Url',
  `AddTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '日志添加时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('109ab36a-e462-4b4e-a941-005f40683676', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-17 10:28:52');
INSERT INTO `syslog` VALUES ('2094e8bb-9bd4-40a6-aaa3-a972114e1528', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-17 15:20:03');
INSERT INTO `syslog` VALUES ('3491bb1b-5279-49a6-adec-f1f0dc4bb4bb', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-16 17:31:48');
INSERT INTO `syslog` VALUES ('36986ff6-96d7-4f5a-90d7-79e9017e3697', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-17 17:27:40');
INSERT INTO `syslog` VALUES ('41cc908d-1db0-4638-a8ca-6da59ac88de8', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '', '2018-06-13 23:24:13');
INSERT INTO `syslog` VALUES ('504cd3e2-0b6b-455d-9532-2f6f7b19e618', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-17 11:38:26');
INSERT INTO `syslog` VALUES ('5ca915b8-5a74-46c5-8bb4-fa436d8b9cf6', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-15 22:40:17');
INSERT INTO `syslog` VALUES ('7157442c-45f8-49be-921f-ac1f16cf9c46', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-17 09:23:36');
INSERT INTO `syslog` VALUES ('735275c1-f72a-4242-8701-c4fe5c3f5cf6', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-16 15:46:00');
INSERT INTO `syslog` VALUES ('761487e4-5f18-498a-afc1-4d239462e1c7', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-16 09:52:36');
INSERT INTO `syslog` VALUES ('8b776e1d-8e04-41a5-a7a6-d2b4e147ab8c', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-16 11:18:04');
INSERT INTO `syslog` VALUES ('8bec1f9f-dbde-4fec-9c52-20225c0b0824', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-16 22:52:52');
INSERT INTO `syslog` VALUES ('96ad7900-0c3a-429d-9427-f84d68be8b27', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-18 06:10:02');
INSERT INTO `syslog` VALUES ('9ec2c692-7935-4591-bdc1-425155fe99a6', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-17 13:10:51');
INSERT INTO `syslog` VALUES ('ba4c5061-bc8e-4efa-93ee-82d935813bdd', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-16 18:33:02');
INSERT INTO `syslog` VALUES ('c1ac92d1-4026-4e5e-9a1c-3c8a23529be5', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '', '2018-06-14 00:29:27');
INSERT INTO `syslog` VALUES ('ceb69199-c8d6-4c0a-8f2c-4964196d32f0', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-15 23:41:25');
INSERT INTO `syslog` VALUES ('d28db11a-24f0-4330-925f-85201f7b64d0', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-18 06:30:01');
INSERT INTO `syslog` VALUES ('da210a5c-a04a-4d98-ba3b-f963409fd879', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-17 16:29:42');
INSERT INTO `syslog` VALUES ('daaf69df-3079-4571-ac7e-046c0f20ee88', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-17 17:27:48');
INSERT INTO `syslog` VALUES ('fd1f1412-9fbc-4da0-a1de-f9b9ba5163b2', 'admins', '商务中心', 'SysAdmin', '登录操作', '127.0.0.1', null, '1', '/fytadmin/login', '2018-06-17 17:26:13');

-- ----------------------------
-- Table structure for sysmenu
-- ----------------------------
DROP TABLE IF EXISTS `sysmenu`;
CREATE TABLE `sysmenu` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一标识Guid',
  `SiteGuid` varchar(50) DEFAULT NULL COMMENT '所属站点或公司菜单',
  `ParentGuid` varchar(50) DEFAULT NULL COMMENT '菜单父级Guid',
  `ParentName` varchar(50) NOT NULL COMMENT '父级菜单名称',
  `Name` varchar(50) NOT NULL COMMENT '菜单名称',
  `NameCode` varchar(50) NOT NULL COMMENT '菜单名称标识',
  `ParentGuidList` varchar(500) DEFAULT NULL COMMENT '所属父级的集合',
  `Layer` int(10) NOT NULL COMMENT '菜单深度',
  `Urls` varchar(255) DEFAULT NULL COMMENT '菜单Url',
  `Icon` varchar(50) DEFAULT NULL COMMENT '菜单图标Class',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '菜单排序',
  `Status` bit(1) NOT NULL DEFAULT b'1' COMMENT '菜单状态 true=正常 false=不显示',
  `EditTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `AddTIme` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysmenu
-- ----------------------------
INSERT INTO `sysmenu` VALUES ('1fc3d8e8-e3f2-49cf-a652-2341082643df', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', '系统管理', '菜单管理', '1012', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,1fc3d8e8-e3f2-49cf-a652-2341082643df,', '2', '/fytadmin/sys/menu/', null, '6', '', '2018-05-17 22:08:48', '2018-05-17 22:08:48');
INSERT INTO `sysmenu` VALUES ('404d4b8b-8e3c-42ee-aee5-f29df31308fa', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', '系统管理', '管理员管理', '1013', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,404d4b8b-8e3c-42ee-aee5-f29df31308fa,', '2', '/fytadmin/sys/admin/', null, '7', '', '2018-05-17 22:09:12', '2018-05-17 22:09:12');
INSERT INTO `sysmenu` VALUES ('40823e8a-bc10-4e38-a45f-a6dd7dd0ef78', null, null, '根目录', '库存管理', '1002', ',40823e8a-bc10-4e38-a45f-a6dd7dd0ef78,', '1', null, null, '3', '', '2018-05-17 21:45:45', '2018-05-17 21:45:45');
INSERT INTO `sysmenu` VALUES ('51216bb3-d0c7-474a-b565-71cf96db19f4', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', '系统管理', '信息推送', '1016', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,51216bb3-d0c7-474a-b565-71cf96db19f4,', '2', '/fytadmin/sys/push/', null, '10', '', '2018-05-17 22:10:25', '0001-01-01 00:00:00');
INSERT INTO `sysmenu` VALUES ('5ce13ead-971b-4ed4-ad5f-acacccd82381', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', '系统管理', '角色管理', '1011', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,5ce13ead-971b-4ed4-ad5f-acacccd82381,', '2', '/fytadmin/sys/role/', null, '5', '', '2018-05-17 22:08:23', '2018-05-17 22:08:23');
INSERT INTO `sysmenu` VALUES ('5ed17c74-0fff-4f88-8581-3b4f26d005a8', null, null, '跟目录', '系统管理', '1001', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,', '1', null, null, '2', '', '2018-05-17 21:39:41', '2018-05-17 21:39:41');
INSERT INTO `sysmenu` VALUES ('6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', '系统管理', '部门管理', '1010', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,6d4cfcf7-ff1c-4537-aa3f-75cc9df27583,', '2', '/fytadmin/sys/organize/', null, '4', '', '2018-05-17 22:08:02', '0001-01-01 00:00:00');
INSERT INTO `sysmenu` VALUES ('a280f6e2-3100-445f-871d-77ea443356a9', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', '系统管理', '字段管理', '1015', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,a280f6e2-3100-445f-871d-77ea443356a9,', '2', '/fytadmin/sys/codes/', null, '9', '', '2018-05-17 22:09:52', '2018-05-17 22:09:52');
INSERT INTO `sysmenu` VALUES ('b354ea64-88b6-4032-a26a-fee198e24d9d', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', '系统管理', '系统日志', '1014', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,b354ea64-88b6-4032-a26a-fee198e24d9d,', '2', '/fytadmin/sys/log/', null, '8', '', '2018-05-17 22:09:29', '2018-05-17 22:09:29');

-- ----------------------------
-- Table structure for sysorganize
-- ----------------------------
DROP TABLE IF EXISTS `sysorganize`;
CREATE TABLE `sysorganize` (
  `Guid` varchar(50) NOT NULL,
  `SiteGuid` varchar(50) DEFAULT NULL COMMENT '归属站点',
  `ParentGuid` varchar(50) DEFAULT NULL COMMENT '父节点',
  `Name` varchar(20) NOT NULL COMMENT '组织名称',
  `ParentName` varchar(20) DEFAULT NULL,
  `ParentGuidList` varchar(500) DEFAULT NULL COMMENT '父节点集合',
  `Layer` int(11) NOT NULL DEFAULT '1' COMMENT '层级',
  `Sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `Status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态',
  `EditTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysorganize
-- ----------------------------
INSERT INTO `sysorganize` VALUES ('24febdc4-655f-4492-ac8a-4adab18c22c8', null, '388b72d3-e10a-4183-8ef7-6be44eb99b1a', '融媒体中心', '包头分公司', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,388b72d3-e10a-4183-8ef7-6be44eb99b1a,24febdc4-655f-4492-ac8a-4adab18c22c8,', '2', '7', '', '2018-05-16 22:09:35');
INSERT INTO `sysorganize` VALUES ('388b72d3-e10a-4183-8ef7-6be44eb99b1a', null, '883deb1c-ddd7-484e-92c1-b3ad3b32e655', '包头分公司', '飞易腾集团', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,388b72d3-e10a-4183-8ef7-6be44eb99b1a,', '1', '3', '', '2018-05-16 22:06:20');
INSERT INTO `sysorganize` VALUES ('4b6ab27f-c0fa-483d-9b5a-55891ee8d727', null, '388b72d3-e10a-4183-8ef7-6be44eb99b1a', '事业发展部', '包头分公司', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,388b72d3-e10a-4183-8ef7-6be44eb99b1a,4b6ab27f-c0fa-483d-9b5a-55891ee8d727,', '2', '6', '', '2018-05-16 22:09:30');
INSERT INTO `sysorganize` VALUES ('52523a76-52b3-4c25-a1bd-9123a011f2a8', null, '5533b6c5-ba2e-4659-be29-c860bb41e04d', '商务中心', '北京总公司', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,5533b6c5-ba2e-4659-be29-c860bb41e04d,52523a76-52b3-4c25-a1bd-9123a011f2a8,', '2', '4', '', '2018-05-16 22:09:27');
INSERT INTO `sysorganize` VALUES ('5533b6c5-ba2e-4659-be29-c860bb41e04d', null, '883deb1c-ddd7-484e-92c1-b3ad3b32e655', '北京总公司', '飞易腾集团', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,5533b6c5-ba2e-4659-be29-c860bb41e04d,', '1', '2', '', '2018-05-16 22:06:02');
INSERT INTO `sysorganize` VALUES ('883deb1c-ddd7-484e-92c1-b3ad3b32e655', null, null, '飞易腾集团', '根目录', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,', '0', '1', '', '2018-05-15 00:11:55');
INSERT INTO `sysorganize` VALUES ('dcf99638-5db6-4dd7-a485-31df1160d45a', null, '5533b6c5-ba2e-4659-be29-c860bb41e04d', '互联网中心', '北京总公司', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,5533b6c5-ba2e-4659-be29-c860bb41e04d,dcf99638-5db6-4dd7-a485-31df1160d45a,', '2', '5', '', '2018-05-16 22:09:36');

-- ----------------------------
-- Table structure for syspermissions
-- ----------------------------
DROP TABLE IF EXISTS `syspermissions`;
CREATE TABLE `syspermissions` (
  `RoleGuid` varchar(50) NOT NULL COMMENT '角色Guid',
  `AdminGuid` varchar(50) DEFAULT NULL,
  `MenuGuid` varchar(50) DEFAULT NULL COMMENT '菜单Guid',
  `BtnFunGuid` varchar(50) DEFAULT NULL,
  `Types` tinyint(1) NOT NULL DEFAULT '1' COMMENT '授权类型1=角色-菜单 2=用户-角色 3=角色-菜单-按钮功能'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syspermissions
-- ----------------------------
INSERT INTO `syspermissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', '12cc96cf-7ccf-430b-a54a-e1c6f04690cb', null, null, '2');
INSERT INTO `syspermissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '6b8d6513-5da7-4f68-a2c4-f0c7cfaf7f61', '3');
INSERT INTO `syspermissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '5ce13ead-971b-4ed4-ad5f-acacccd82381', 'c4261103-dfc7-46e5-ab20-4ca5fc7729f6', '3');
INSERT INTO `syspermissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '931bd729-f160-4fe3-bb7c-7828a2da047a', '3');
INSERT INTO `syspermissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', null, '1');
INSERT INTO `syspermissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', null, '1');
INSERT INTO `syspermissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '5ce13ead-971b-4ed4-ad5f-acacccd82381', null, '1');
INSERT INTO `syspermissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '1fc3d8e8-e3f2-49cf-a652-2341082643df', null, '1');
INSERT INTO `syspermissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '404d4b8b-8e3c-42ee-aee5-f29df31308fa', null, '1');
INSERT INTO `syspermissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'b354ea64-88b6-4032-a26a-fee198e24d9d', null, '1');
INSERT INTO `syspermissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'a280f6e2-3100-445f-871d-77ea443356a9', null, '1');
INSERT INTO `syspermissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '51216bb3-d0c7-474a-b565-71cf96db19f4', null, '1');
INSERT INTO `syspermissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '6b8d6513-5da7-4f68-a2c4-f0c7cfaf7f61', '3');
INSERT INTO `syspermissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '5ce13ead-971b-4ed4-ad5f-acacccd82381', 'c4261103-dfc7-46e5-ab20-4ca5fc7729f6', '3');
INSERT INTO `syspermissions` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', null, '1');
INSERT INTO `syspermissions` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', null, '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', null, '1');
INSERT INTO `syspermissions` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', null, '5ce13ead-971b-4ed4-ad5f-acacccd82381', null, '1');
INSERT INTO `syspermissions` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', null, '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '6b8d6513-5da7-4f68-a2c4-f0c7cfaf7f61', '3');
INSERT INTO `syspermissions` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', null, '5ce13ead-971b-4ed4-ad5f-acacccd82381', 'c4261103-dfc7-46e5-ab20-4ca5fc7729f6', '3');
INSERT INTO `syspermissions` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', '30d3da88-bb72-4ace-a303-b3aae0ecb732', null, null, '2');
INSERT INTO `syspermissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', '12cc96cf-7ccf-430b-a54a-e1c6f04690cb', null, null, '2');
INSERT INTO `syspermissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', '12cc96cf-7ccf-430b-a54a-e1c6f04690cb', null, null, '2');
INSERT INTO `syspermissions` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', '12cc96cf-7ccf-430b-a54a-e1c6f04690cb', null, null, '2');
INSERT INTO `syspermissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', '30d3da88-bb72-4ace-a303-b3aae0ecb732', null, null, '2');

-- ----------------------------
-- Table structure for sysrole
-- ----------------------------
DROP TABLE IF EXISTS `sysrole`;
CREATE TABLE `sysrole` (
  `Guid` varchar(50) NOT NULL,
  `DepartmentGuid` varchar(50) NOT NULL COMMENT '部门Guid',
  `DepartmentName` varchar(50) NOT NULL COMMENT '部门名称',
  `DepartmentGroup` varchar(500) NOT NULL COMMENT '归属于角色组',
  `Name` varchar(50) NOT NULL COMMENT '部门名称',
  `Codes` varchar(50) NOT NULL COMMENT '部门编号',
  `IsSystem` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否为超级管理员',
  `Summary` varchar(500) DEFAULT NULL COMMENT '部门描述',
  `AddTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `EditTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysrole
-- ----------------------------
INSERT INTO `sysrole` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', 'dcf99638-5db6-4dd7-a485-31df1160d45a', '互联网中心', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,5533b6c5-ba2e-4659-be29-c860bb41e04d,dcf99638-5db6-4dd7-a485-31df1160d45a,', '超级管理员', '1001', '', '超级管理员', '2018-03-29 00:00:00', '2018-05-17 23:36:28');
INSERT INTO `sysrole` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', '52523a76-52b3-4c25-a1bd-9123a011f2a8', '商务中心', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,5533b6c5-ba2e-4659-be29-c860bb41e04d,52523a76-52b3-4c25-a1bd-9123a011f2a8,', '客服管理员', '1002', '', '只能查看会员相关功能', '2018-05-17 23:37:56', '2018-05-17 23:37:56');
INSERT INTO `sysrole` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', 'dcf99638-5db6-4dd7-a485-31df1160d45a', '互联网中心', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,5533b6c5-ba2e-4659-be29-c860bb41e04d,dcf99638-5db6-4dd7-a485-31df1160d45a,', '财务管理员', '1003', '', '只能查看财务相关功能', '2018-05-17 23:39:01', '2018-05-17 23:39:01');