/*
 Navicat Premium Data Transfer

 Source Server         : localDB
 Source Server Type    : MySQL
 Source Server Version : 50743
 Source Host           : localhost:3306
 Source Schema         : property_db_cloud

 Target Server Type    : MySQL
 Target Server Version : 50743
 File Encoding         : 65001

 Date: 12/12/2024 21:15:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `login_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录后显示的名字',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统管理员表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (000001, 'admin', '超级管理员', 'ca9c045633b97ad28affb6ba09b2062e');
INSERT INTO `admin` VALUES (000002, '', '', '');

-- ----------------------------
-- Table structure for car_park
-- ----------------------------
DROP TABLE IF EXISTS `car_park`;
CREATE TABLE `car_park`  (
  `id` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `owner_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业主名（如果售出则不可为空）',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业主联系电话',
  `park_state` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车位状态（0未售出，1已售出）',
  `car_park_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车位类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '停车场表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car_park
-- ----------------------------
INSERT INTO `car_park` VALUES (000001, '张三', '15599886655', '1', '地下停车位');
INSERT INTO `car_park` VALUES (000002, '李四', '15566889966', '1', '地下停车位');
INSERT INTO `car_park` VALUES (000003, '', '', '0', '地下停车位');
INSERT INTO `car_park` VALUES (000004, '', '', '0', '地下停车位');
INSERT INTO `car_park` VALUES (000005, '', '', '0', '地下停车位');
INSERT INTO `car_park` VALUES (000006, '', '', '0', '地下停车位');
INSERT INTO `car_park` VALUES (000007, '', '', '0', '地面停车位');

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `id` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `parent_building` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属楼宇',
  `parent_unit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属单元',
  `parent_floor` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属楼层',
  `house_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间号',
  `house_size` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间大小',
  `house_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间户型',
  `is_sold` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否售出：0未售出1已售出',
  `owner_id` int(6) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '业主ID（如果售出则不可为空）',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业主联系电话（如果售出则不可为空）',
  `user_id` int(6) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '绑定的住户ID（已绑定也代表已售出）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '住房详细信息 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES (000001, '1', '1', '1', '101', '110', '三室一厅一厨两卫', '1', 000001, '15599886655', NULL);
INSERT INTO `house` VALUES (000002, '1', '1', '1', '102', '110', '三室一厅一厨两卫', '1', 000002, '15566889966', 000002);
INSERT INTO `house` VALUES (000003, '1', '1', '2', '201', '110', '三室一厅一厨两卫', '1', 000003, '19988774455', 000004);
INSERT INTO `house` VALUES (000004, '1', '1', '2', '202', '110', '三室一厅一厨两卫', '1', 000004, '19988774455', 000004);
INSERT INTO `house` VALUES (000005, '1', '1', '3', '301', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000006, '1', '1', '3', '302', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000007, '1', '1', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000008, '1', '1', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000009, '1', '1', '5', '501', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000010, '1', '1', '5', '502', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000011, '1', '1', '6', '601', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000012, '1', '1', '6', '602', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000013, '1', '1', '7', '701', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000014, '1', '1', '7', '702', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000015, '1', '2', '1', '101', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000016, '1', '2', '1', '102', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000017, '1', '2', '2', '201', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000018, '1', '2', '2', '202', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000019, '1', '2', '3', '301', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000020, '1', '2', '3', '302', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000021, '1', '2', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000022, '1', '2', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000023, '1', '2', '5', '501', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000024, '1', '2', '5', '502', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000025, '1', '2', '6', '601', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000026, '1', '2', '6', '602', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000027, '1', '2', '7', '701', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000028, '1', '2', '7', '702', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000029, '1', '3', '1', '101', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000030, '1', '3', '1', '102', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000031, '1', '3', '2', '201', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000032, '1', '3', '2', '202', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000033, '1', '3', '3', '301', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000034, '1', '3', '3', '302', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000035, '1', '3', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000036, '1', '3', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000037, '1', '3', '5', '501', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000038, '1', '3', '5', '502', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000039, '1', '3', '6', '601', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000040, '1', '3', '6', '602', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000041, '1', '3', '7', '701', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000042, '1', '3', '7', '702', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000043, '2', '1', '1', '101', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000044, '2', '1', '1', '102', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000045, '2', '1', '2', '201', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000046, '2', '1', '2', '202', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000047, '2', '1', '3', '301', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000048, '2', '1', '3', '302', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000049, '2', '1', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000050, '2', '1', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000051, '2', '1', '5', '501', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000052, '2', '1', '5', '502', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000053, '2', '1', '6', '601', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000054, '2', '1', '6', '602', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000055, '2', '1', '7', '701', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000056, '2', '1', '7', '702', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000057, '2', '2', '1', '101', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000058, '2', '2', '1', '102', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000059, '2', '2', '2', '201', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000060, '2', '2', '2', '202', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000061, '2', '2', '3', '301', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000062, '2', '2', '3', '302', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000063, '2', '2', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000064, '2', '2', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000065, '2', '2', '5', '501', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000066, '2', '2', '5', '502', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000067, '2', '2', '6', '601', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000068, '2', '2', '6', '602', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000069, '2', '2', '7', '701', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000070, '2', '2', '7', '702', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000071, '2', '3', '1', '101', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000072, '2', '3', '1', '102', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000073, '2', '3', '2', '201', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000074, '2', '3', '2', '202', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000075, '2', '3', '3', '301', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000076, '2', '3', '3', '302', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000077, '2', '3', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000078, '2', '3', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000079, '2', '3', '5', '501', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000080, '2', '3', '5', '502', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000081, '2', '3', '6', '601', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000082, '2', '3', '6', '602', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000083, '2', '3', '7', '701', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000084, '2', '3', '7', '702', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000085, '3', '1', '1', '101', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000086, '3', '1', '1', '102', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000087, '3', '1', '2', '201', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000088, '3', '1', '2', '202', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000089, '3', '1', '3', '301', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000090, '3', '1', '3', '302', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000091, '3', '1', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000092, '3', '1', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000093, '3', '1', '5', '501', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000094, '3', '1', '5', '502', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000095, '3', '1', '6', '601', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000096, '3', '1', '6', '602', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000097, '3', '1', '7', '701', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000098, '3', '1', '7', '702', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000099, '3', '2', '1', '101', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000100, '3', '2', '1', '102', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000101, '3', '2', '2', '201', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000102, '3', '2', '2', '202', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000103, '3', '2', '3', '301', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000104, '3', '2', '3', '302', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000105, '3', '2', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000106, '3', '2', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000107, '3', '2', '5', '501', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000108, '3', '2', '5', '502', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000109, '3', '2', '6', '601', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000110, '3', '2', '6', '602', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000111, '3', '2', '7', '701', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000112, '3', '2', '7', '702', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000113, '3', '3', '1', '101', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000114, '3', '3', '1', '102', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000115, '3', '3', '2', '201', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000116, '3', '3', '2', '202', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000117, '3', '3', '3', '301', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000118, '3', '3', '3', '302', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000119, '3', '3', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000120, '3', '3', '4', '401', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000121, '3', '3', '5', '501', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000122, '3', '3', '5', '502', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000123, '3', '3', '6', '601', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000124, '3', '3', '6', '602', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000125, '3', '3', '7', '701', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);
INSERT INTO `house` VALUES (000126, '3', '3', '7', '702', '110', '三室一厅一厨两卫', '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for property_charge_item
-- ----------------------------
DROP TABLE IF EXISTS `property_charge_item`;
CREATE TABLE `property_charge_item`  (
  `id` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `charge_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费项目名',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `item_price` int(11) NULL DEFAULT NULL COMMENT '项目单价',
  `price_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '价格描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物业收费项目信息表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of property_charge_item
-- ----------------------------
INSERT INTO `property_charge_item` VALUES (000001, '物业费', '2021-04-18 16:45:45', 500, '每平米0.5元');
INSERT INTO `property_charge_item` VALUES (000002, '水费', '2021-04-18 16:47:29', 280, '每立方米2.8元');
INSERT INTO `property_charge_item` VALUES (000003, '电费', '2021-04-18 16:47:46', 55, '每度电0.55元，无梯度增长');
INSERT INTO `property_charge_item` VALUES (000004, '测试收费项1', '2021-04-18 16:54:05', 0, '测试数据');
INSERT INTO `property_charge_item` VALUES (000005, '测试收费项2', '2021-04-18 16:54:09', 0, '测试数据');
INSERT INTO `property_charge_item` VALUES (000006, '测试收费项3', '2021-04-18 16:54:14', 0, '测试数据');

-- ----------------------------
-- Table structure for property_charge_visit
-- ----------------------------
DROP TABLE IF EXISTS `property_charge_visit`;
CREATE TABLE `property_charge_visit`  (
  `id` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `item_id` int(11) NULL DEFAULT NULL COMMENT '收费项目ID',
  `item_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费项名称',
  `house_id` int(11) NULL DEFAULT NULL COMMENT '住房ID',
  `building_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '楼宇号',
  `unit_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单元号',
  `house_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间号',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `price` int(11) NULL DEFAULT NULL COMMENT '费用',
  `prev_month_count` int(11) NULL DEFAULT NULL COMMENT '上月读数',
  `curr_month_count` int(11) NULL DEFAULT NULL COMMENT '本月读数',
  `use_count` int(11) NULL DEFAULT NULL COMMENT '本次用量',
  `visit_date` datetime(0) NULL DEFAULT NULL COMMENT '录入时间',
  `read_date` datetime(0) NULL DEFAULT NULL COMMENT '抄表时间',
  `read_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '抄表人',
  `visit_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录状态（0已缴费  1未交费）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物业收费记录信息表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of property_charge_visit
-- ----------------------------
INSERT INTO `property_charge_visit` VALUES (000001, 1, '物业费', 1, '1', '1', '101', '张三', '15599886655', 5500, NULL, NULL, NULL, NULL, '2021-04-18 00:00:00', '测试', '0');
INSERT INTO `property_charge_visit` VALUES (000002, 3, '电费', 1, '1', '1', '101', '张三', '15599886655', 8250, 0, 150, 150, NULL, '2021-04-18 00:00:00', '测试', '0');
INSERT INTO `property_charge_visit` VALUES (000004, 2, '水费', 1, '1', '1', '101', '张三', '15599886655', 4200, 0, 15, 15, NULL, '2021-04-18 00:00:00', '测试', '0');
INSERT INTO `property_charge_visit` VALUES (000005, 1, '物业费', 1, '1', '1', '101', '张三', '15599886655', 4545, NULL, 62, 15, NULL, '2021-05-01 00:00:00', 'admin', '0');
INSERT INTO `property_charge_visit` VALUES (000006, 2, '水费', 3, '1', '1', '201', '牛头', '19988774455', 4200, 0, 15, 15, NULL, '2021-05-01 00:00:00', '测试', '1');
INSERT INTO `property_charge_visit` VALUES (000007, 3, '电费', 3, '1', '1', '201', '牛头', '19988774455', 11000, 0, 200, 200, NULL, '2021-05-01 00:00:00', '测试', '0');
INSERT INTO `property_charge_visit` VALUES (000008, 3, '电费', 4, '1', '1', '202', '牛头', '19988774455', 25025, 0, 455, 455, NULL, '2021-05-01 00:00:00', '1', '1');

-- ----------------------------
-- Table structure for property_pay_visit
-- ----------------------------
DROP TABLE IF EXISTS `property_pay_visit`;
CREATE TABLE `property_pay_visit`  (
  `id` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `charge_id` int(11) NOT NULL COMMENT '对应物业收费记录表的ID',
  `building_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '楼宇号',
  `unit_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单元号',
  `house_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间号',
  `client_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `item_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费项目',
  `pay_money` int(11) NULL DEFAULT NULL COMMENT '缴费金额（单位：分）',
  `pay_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费方式',
  `charge_person` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费人员',
  `pay_date` datetime(0) NULL DEFAULT NULL COMMENT '缴费时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物业缴费记录信息表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of property_pay_visit
-- ----------------------------
INSERT INTO `property_pay_visit` VALUES (000001, 1, '1', '1', '101', '张三', '物业费', 5500, '支付宝', '测试', '2021-04-18 23:08:03');
INSERT INTO `property_pay_visit` VALUES (000002, 7, '1', '1', '201', '牛头', '电费', 11000, '现金', '测试', '2021-05-11 14:04:00');
INSERT INTO `property_pay_visit` VALUES (000003, 4, '1', '1', '101', '张三', '水费', 4200, '现金', '1', '2021-05-11 15:11:03');
INSERT INTO `property_pay_visit` VALUES (000004, 5, '1', '1', '101', '张三', '物业费', 4545, '现金', '1', '2021-05-11 15:22:26');
INSERT INTO `property_pay_visit` VALUES (000005, 2, '1', '1', '101', '张三', '电费', 8250, '现金', '1', '2021-05-11 15:25:21');

-- ----------------------------
-- Table structure for unit_building
-- ----------------------------
DROP TABLE IF EXISTS `unit_building`;
CREATE TABLE `unit_building`  (
  `id` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `building_num` int(11) NULL DEFAULT NULL COMMENT '楼宇号',
  `unit_count` int(11) NULL DEFAULT NULL COMMENT '单元数量',
  `floor_count` int(11) NULL DEFAULT NULL COMMENT '楼层',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '楼宇信息表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unit_building
-- ----------------------------
INSERT INTO `unit_building` VALUES (000001, 1, 3, 7);
INSERT INTO `unit_building` VALUES (000002, 2, 3, 7);
INSERT INTO `unit_building` VALUES (000003, 3, 3, 7);
INSERT INTO `unit_building` VALUES (000004, 5, 2, 21);
INSERT INTO `unit_building` VALUES (000005, 6, 2, 21);
INSERT INTO `unit_building` VALUES (000007, 7, 3, 21);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `card_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `sex` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `nation` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族',
  `register_address` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户籍地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '住户信息表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (000001, '张三', '15555555555', '11010519491231001X', '男', NULL, '北京');
INSERT INTO `user` VALUES (000002, '李四', '17777777777', '11010519491231004X', '女', NULL, '北京');
INSERT INTO `user` VALUES (000003, '张四', '16666666666', '11010519791231003X', '男', NULL, '北京');
INSERT INTO `user` VALUES (000004, '牛头', '19988774455', '14010519491231005X', '男', NULL, '山西');
INSERT INTO `user` VALUES (000005, '马面', '18877556633', '15010519491231004X', '女', NULL, '内蒙古');
INSERT INTO `user` VALUES (000007, '刘9347', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000008, '刘6444', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000009, '刘9348', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000010, '刘231', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000011, '刘5973', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000012, '刘9165', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000013, '刘7508', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000014, '刘4346', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000015, '刘3038', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000016, '刘5182', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000017, '刘6875', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000018, '刘2490', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000019, '刘9285', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000020, '刘6420', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000021, '刘1008', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000022, '刘4864', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000023, '刘1187', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000024, '刘4664', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000025, '刘4139', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000026, '刘8733', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000027, '刘3988', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000028, '刘5180', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000029, '刘8082', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000030, '刘9879', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000031, '刘562', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000032, '刘8708', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000033, '刘9958', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000034, '刘9250', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000035, '刘4827', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000036, '刘6237', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000037, '刘79', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000038, '刘5471', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000039, '刘3223', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000040, '刘700', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000041, '刘6202', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000042, '刘874', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000043, '刘2291', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000044, '刘4790', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000045, '刘4332', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000046, '刘8260', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000047, '刘7977', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000048, '刘7204', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000049, '刘7451', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000050, '刘4965', '15845678745', NULL, '男', '江西省', '江西省');
INSERT INTO `user` VALUES (000051, '刘7312', '15845678745', NULL, '男', '江西省', '江西省');

-- ----------------------------
-- Table structure for user_complaint
-- ----------------------------
DROP TABLE IF EXISTS `user_complaint`;
CREATE TABLE `user_complaint`  (
  `id` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户电话',
  `complaint_info` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投诉信息',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_solve` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否处理 0未处理 1已处理',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '对应的用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户投诉信息表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_complaint
-- ----------------------------
INSERT INTO `user_complaint` VALUES (000001, '张三', '15599886655', '楼下半夜总是很吵', '2021-04-18 03:30:32', '1', 1);
INSERT INTO `user_complaint` VALUES (000002, '张三', '15599886655', '卫生太差', '2021-04-18 14:11:37', '1', 1);
INSERT INTO `user_complaint` VALUES (000003, '张三', '15599886655', '我要投诉卫生太差', '2021-04-18 18:08:41', '0', 1);
INSERT INTO `user_complaint` VALUES (000004, '张三', '15599886655', 'asdasdasda', '2021-04-29 16:54:10', '0', 1);

-- ----------------------------
-- Table structure for user_repair
-- ----------------------------
DROP TABLE IF EXISTS `user_repair`;
CREATE TABLE `user_repair`  (
  `id` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户电话',
  `repair_info` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报修信息',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_solve` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否处理 0未处理 1已处理',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '对应的用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户报修信息表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_repair
-- ----------------------------
INSERT INTO `user_repair` VALUES (000003, '张三', '15599886655', '水管有点堵塞', '2021-04-18 03:53:50', '1', 1);
INSERT INTO `user_repair` VALUES (000004, '张三', '15599886655', '暖气不热', '2021-04-18 14:12:13', '1', 1);
INSERT INTO `user_repair` VALUES (000005, '张三', '15599886655', '下水管坏了', '2021-04-18 18:08:21', '1', 1);
INSERT INTO `user_repair` VALUES (000006, '张三', '15599886655', '123', '2021-04-21 12:28:01', '1', 1);
INSERT INTO `user_repair` VALUES (000007, '张三', '15599886655', 'aaaaaaaaaaaaaaaaa', '2021-04-29 16:54:00', '1', 1);
INSERT INTO `user_repair` VALUES (000008, '张三', '15599886655', '楼塌了', '2021-05-11 13:47:48', '1', 1);

-- ----------------------------
-- Table structure for user_unit_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_unit_relation`;
CREATE TABLE `user_unit_relation`  (
  `id` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `unit_id` int(11) NULL DEFAULT NULL COMMENT '住房ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_house_holder` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否是户主 1是  0否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与住房关系对应表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_unit_relation
-- ----------------------------
INSERT INTO `user_unit_relation` VALUES (000001, 1, 1, '2021-04-18 22:58:51', '1');
INSERT INTO `user_unit_relation` VALUES (000002, 2, 2, '2021-04-18 21:30:19', '1');
INSERT INTO `user_unit_relation` VALUES (000008, 3, 1, '2021-04-18 00:51:47', '0');
INSERT INTO `user_unit_relation` VALUES (000009, 4, 3, '2021-04-29 16:14:20', '1');
INSERT INTO `user_unit_relation` VALUES (000010, 4, 4, '2021-04-29 16:56:17', '1');

SET FOREIGN_KEY_CHECKS = 1;
