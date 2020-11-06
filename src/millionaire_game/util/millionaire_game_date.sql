/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306____
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : millionaire_game_date

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 23/07/2020 14:12:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for character
-- ----------------------------
DROP TABLE IF EXISTS `character`;
CREATE TABLE `character`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `health` int(11) NULL DEFAULT NULL,
  `gold` int(11) NULL DEFAULT NULL,
  `map_id` int(11) NULL DEFAULT NULL,
  `map_x` int(11) NULL DEFAULT NULL,
  `map_y` int(11) NULL DEFAULT NULL,
  `record` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_craete` datetime(0) NULL DEFAULT NULL,
  `date_loaded` datetime(0) NULL DEFAULT NULL,
  `map_my` int(11) NULL DEFAULT NULL,
  `map_mx` int(11) NULL DEFAULT NULL,
  `kind` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `name`) USING BTREE,
  INDEX `ide`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character
-- ----------------------------

-- ----------------------------
-- Table structure for character_record
-- ----------------------------
DROP TABLE IF EXISTS `character_record`;
CREATE TABLE `character_record`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `record` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_win` bigint(1) NULL DEFAULT NULL,
  `max_gold` int(11) NULL DEFAULT NULL,
  `sum_gold` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_record
-- ----------------------------

-- ----------------------------
-- Table structure for expend_record
-- ----------------------------
DROP TABLE IF EXISTS `expend_record`;
CREATE TABLE `expend_record`  (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expend_money` double NULL DEFAULT NULL,
  `get_gold` int(11) NULL DEFAULT NULL,
  `datetime` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expend_record
-- ----------------------------

-- ----------------------------
-- Table structure for map_buy
-- ----------------------------
DROP TABLE IF EXISTS `map_buy`;
CREATE TABLE `map_buy`  (
  `id` int(11) NOT NULL,
  `character_id` bigint(20) NOT NULL,
  `map_x` int(11) NULL DEFAULT NULL,
  `max_y` int(11) NULL DEFAULT NULL,
  `map_grade` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `character_id`(`character_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of map_buy
-- ----------------------------

-- ----------------------------
-- Table structure for receipt
-- ----------------------------
DROP TABLE IF EXISTS `receipt`;
CREATE TABLE `receipt`  (
  `receipt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` bigint(20) NULL DEFAULT NULL,
  `record_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kind` int(11) NULL DEFAULT NULL,
  `have_sum` int(11) NULL DEFAULT NULL,
  `date_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`receipt_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receipt
-- ----------------------------

-- ----------------------------
-- Table structure for register
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_admin` tinyint(1) NULL DEFAULT NULL,
  `user_gold` bigint(255) NULL DEFAULT NULL,
  `experience` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `user_login`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of register
-- ----------------------------
INSERT INTO `register` VALUES (1, 'admin', '123', '老王', 1, 100, 100);
INSERT INTO `register` VALUES (10, '123', '123', '123', 0, 1000, 0);

-- ----------------------------
-- Table structure for register_object
-- ----------------------------
DROP TABLE IF EXISTS `register_object`;
CREATE TABLE `register_object`  (
  `object_id` int(11) NOT NULL,
  `object_have_id` bigint(20) NULL DEFAULT NULL,
  `kind` int(11) NULL DEFAULT NULL,
  `sum` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`object_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of register_object
-- ----------------------------

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `id` bigint(20) NOT NULL,
  `kind` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `one_buy_sum` int(11) NULL DEFAULT NULL,
  `one_buy_gold` int(11) NULL DEFAULT NULL,
  `have_sum` int(11) NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment_for_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
