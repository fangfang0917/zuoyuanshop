/*
 Navicat Premium Data Transfer

 Source Server         : 公司
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : 192.168.5.222:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 31/12/2019 17:16:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tp_address
-- ----------------------------
DROP TABLE IF EXISTS `tp_address`;
CREATE TABLE `tp_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区',
  `addressshow` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_address
-- ----------------------------
INSERT INTO `tp_address` VALUES (13, 1, 'Asdasd2222222', '15299999999', '北京 东城区 ', '阿三大叔大叔大叔大', 1);
INSERT INTO `tp_address` VALUES (8, 1, 'Asdasd', '15299999999', '北京 东城区 ', '阿三大叔大叔大叔大', 0);

-- ----------------------------
-- Table structure for tp_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_access`;
CREATE TABLE `tp_admin_access`  (
  `role_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `node_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `pid` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  INDEX `groupId`(`role_id`) USING BTREE,
  INDEX `nodeId`(`node_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tp_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_group`;
CREATE TABLE `tp_admin_group`  (
  `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'icon小图标',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 50,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_admin_group
-- ----------------------------
INSERT INTO `tp_admin_group` VALUES (1, '系统管理', '&#xe61d;', 2, 0, '', 1, 1450752856, 1481180175);
INSERT INTO `tp_admin_group` VALUES (2, '工具', '&#xe616;', 3, 0, '', 1, 1476016712, 1481180175);
INSERT INTO `tp_admin_group` VALUES (3, '用户管理', '&amp;#xe60d;', 4, 1, '', 0, 1576464113, 1576464113);
INSERT INTO `tp_admin_group` VALUES (4, '网站配置', '&amp;#xe62e;', 5, 1, '', 0, 1576483241, 1576483241);
INSERT INTO `tp_admin_group` VALUES (5, '商品管理', '&amp;#xe68c;', 5, 1, '', 0, 1576568185, 1576568185);
INSERT INTO `tp_admin_group` VALUES (6, '订单管理', '&amp;#xe667;', 6, 1, '', 0, 1577692132, 1577692132);
INSERT INTO `tp_admin_group` VALUES (7, '公告管理', '', 50, 1, '', 0, 1577774086, 1577774086);

-- ----------------------------
-- Table structure for tp_admin_node
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_node`;
CREATE TABLE `tp_admin_node`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '节点类型，1-控制器 | 0-方法',
  `sort` smallint(6) UNSIGNED NOT NULL DEFAULT 50,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `level`(`level`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `isdelete`(`isdelete`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_admin_node
-- ----------------------------
INSERT INTO `tp_admin_node` VALUES (1, 0, 1, 'Admin', '后台管理', '后台管理，不可更改', 1, 1, 1, 1, 0);
INSERT INTO `tp_admin_node` VALUES (2, 1, 1, 'AdminGroup', '分组管理', ' ', 2, 1, 1, 1, 0);
INSERT INTO `tp_admin_node` VALUES (3, 1, 1, 'AdminNode', '节点管理', ' ', 2, 1, 2, 1, 0);
INSERT INTO `tp_admin_node` VALUES (4, 1, 1, 'AdminRole', '角色管理', ' ', 2, 1, 3, 1, 0);
INSERT INTO `tp_admin_node` VALUES (5, 1, 1, 'AdminUser', '用户管理', '', 2, 1, 4, 1, 0);
INSERT INTO `tp_admin_node` VALUES (6, 1, 0, 'Index', '首页', '', 2, 1, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (7, 6, 0, 'welcome', '欢迎页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (8, 6, 0, 'index', '未定义', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (9, 1, 2, 'Generate', '代码自动生成', '', 2, 1, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (10, 1, 2, 'Demo/excel', 'Excel一键导出', '', 2, 0, 2, 1, 0);
INSERT INTO `tp_admin_node` VALUES (11, 1, 2, 'Demo/download', '下载', '', 2, 0, 3, 1, 0);
INSERT INTO `tp_admin_node` VALUES (12, 1, 2, 'Demo/downloadImage', '远程图片下载', '', 2, 0, 4, 1, 0);
INSERT INTO `tp_admin_node` VALUES (13, 1, 2, 'Demo/mail', '邮件发送', '', 2, 0, 5, 1, 0);
INSERT INTO `tp_admin_node` VALUES (14, 1, 2, 'Demo/qiniu', '七牛上传', '', 2, 0, 6, 1, 0);
INSERT INTO `tp_admin_node` VALUES (15, 1, 2, 'Demo/hashids', 'ID加密', '', 2, 0, 7, 1, 0);
INSERT INTO `tp_admin_node` VALUES (16, 1, 2, 'Demo/layer', '丰富弹层', '', 2, 0, 8, 1, 0);
INSERT INTO `tp_admin_node` VALUES (17, 1, 2, 'Demo/tableFixed', '表格溢出', '', 2, 0, 9, 1, 0);
INSERT INTO `tp_admin_node` VALUES (18, 1, 2, 'Demo/ueditor', '百度编辑器', '', 2, 0, 10, 1, 0);
INSERT INTO `tp_admin_node` VALUES (19, 1, 2, 'Demo/imageUpload', '图片上传', '', 2, 0, 11, 1, 0);
INSERT INTO `tp_admin_node` VALUES (20, 1, 2, 'Demo/qrcode', '二维码生成', '', 2, 0, 12, 1, 0);
INSERT INTO `tp_admin_node` VALUES (21, 1, 1, 'NodeMap', '节点图', '', 2, 1, 5, 1, 0);
INSERT INTO `tp_admin_node` VALUES (22, 1, 1, 'WebLog', '操作日志', '', 2, 1, 6, 1, 0);
INSERT INTO `tp_admin_node` VALUES (23, 1, 1, 'LoginLog', '登录日志', '', 2, 1, 7, 1, 0);
INSERT INTO `tp_admin_node` VALUES (59, 1, 2, 'one.two.three.Four/index', '多级节点', '', 2, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (24, 23, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (25, 22, 0, 'index', '列表', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (26, 22, 0, 'detail', '详情', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (27, 21, 0, 'load', '自动导入', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (28, 21, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (29, 5, 0, 'add', '添加', '', 3, 0, 51, 1, 0);
INSERT INTO `tp_admin_node` VALUES (30, 21, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (31, 21, 0, 'deleteForever', '永久删除', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (32, 9, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (33, 9, 0, 'generate', '生成方法', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (34, 5, 0, 'password', '修改密码', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (35, 5, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (36, 5, 0, 'add', '添加', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (37, 5, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (38, 4, 0, 'user', '用户列表', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (39, 4, 0, 'access', '授权', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (40, 4, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (41, 4, 0, 'add', '添加', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (42, 4, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (43, 4, 0, 'forbid', '默认禁用操作', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (44, 4, 0, 'resume', '默认恢复操作', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (45, 3, 0, 'load', '节点快速导入测试', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (46, 3, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (47, 3, 0, 'add', '添加', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (48, 3, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (49, 3, 0, 'forbid', '默认禁用操作', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (50, 3, 0, 'resume', '默认恢复操作', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (51, 2, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (52, 2, 0, 'add', '添加', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (53, 2, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (54, 2, 0, 'forbid', '默认禁用操作', '', 3, 0, 51, 1, 0);
INSERT INTO `tp_admin_node` VALUES (55, 2, 0, 'resume', '默认恢复操作', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (56, 1, 2, 'one', '一级菜单', '', 2, 1, 13, 1, 0);
INSERT INTO `tp_admin_node` VALUES (60, 56, 2, 'two', '二级', '', 3, 1, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (61, 60, 2, 'three', '三级菜单', '', 4, 1, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (62, 61, 2, 'Four', '四级菜单', '', 5, 1, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (63, 1, 3, 'User', '用户列表', '', 2, 1, 1, 1, 0);
INSERT INTO `tp_admin_node` VALUES (64, 1, 4, 'Position', '推荐位', '', 2, 1, 1, 1, 0);
INSERT INTO `tp_admin_node` VALUES (65, 1, 4, 'Banner', '轮播图', '', 2, 1, 2, 1, 0);
INSERT INTO `tp_admin_node` VALUES (66, 1, 5, 'Goods', '商品管理', '', 2, 1, 1, 1, 0);
INSERT INTO `tp_admin_node` VALUES (67, 1, 5, 'GoodsClassify', '商品分类', '', 2, 1, 2, 1, 0);
INSERT INTO `tp_admin_node` VALUES (68, 1, 5, 'AttrKey', '规格管理', '', 2, 1, 3, 1, 0);
INSERT INTO `tp_admin_node` VALUES (69, 1, 6, 'Order', '订单列表', '', 2, 1, 1, 1, 0);
INSERT INTO `tp_admin_node` VALUES (70, 1, 7, 'Notice', '公告列表', '', 2, 1, 50, 1, 0);

-- ----------------------------
-- Table structure for tp_admin_node_load
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_node_load`;
CREATE TABLE `tp_admin_node_load`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点快速导入' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_admin_node_load
-- ----------------------------
INSERT INTO `tp_admin_node_load` VALUES (4, '编辑', 'edit', 1);
INSERT INTO `tp_admin_node_load` VALUES (5, '添加', 'add', 1);
INSERT INTO `tp_admin_node_load` VALUES (6, '首页', 'index', 1);
INSERT INTO `tp_admin_node_load` VALUES (7, '删除', 'delete', 1);

-- ----------------------------
-- Table structure for tp_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role`;
CREATE TABLE `tp_admin_role`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId`(`pid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `isdelete`(`isdelete`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_admin_role
-- ----------------------------
INSERT INTO `tp_admin_role` VALUES (1, 0, '领导组', ' ', 1, 0, 1208784792, 1254325558);
INSERT INTO `tp_admin_role` VALUES (2, 0, '网编组', ' ', 0, 0, 1215496283, 1454049929);

-- ----------------------------
-- Table structure for tp_admin_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role_user`;
CREATE TABLE `tp_admin_role_user`  (
  `role_id` mediumint(9) UNSIGNED NULL DEFAULT NULL,
  `user_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `group_id`(`role_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for tp_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_user`;
CREATE TABLE `tp_admin_user`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_login_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `last_login_ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_count` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 50,
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `accountpassword`(`account`, `password`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_admin_user
-- ----------------------------
INSERT INTO `tp_admin_user` VALUES (1, 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', 1577771055, '192.168.5.191', 396, 'tianpian0805@gmail.com', '13121126169', '我是超级管理员', 1, 0, 1222907803, 1451033528);
INSERT INTO `tp_admin_user` VALUES (2, 'demo', '测试', 'e10adc3949ba59abbe56e057f20f883e', 1481206367, '127.0.0.1', 5, '', '', '', 1, 0, 1476777133, 1477399793);

-- ----------------------------
-- Table structure for tp_attr_key
-- ----------------------------
DROP TABLE IF EXISTS `tp_attr_key`;
CREATE TABLE `tp_attr_key`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '所属分类id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格名',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_attr_key
-- ----------------------------
INSERT INTO `tp_attr_key` VALUES (1, 1, '颜色', 1);
INSERT INTO `tp_attr_key` VALUES (2, 1, '尺寸', 1);
INSERT INTO `tp_attr_key` VALUES (3, 2, '内存', 1);
INSERT INTO `tp_attr_key` VALUES (4, 2, '颜色', 1);

-- ----------------------------
-- Table structure for tp_attr_val
-- ----------------------------
DROP TABLE IF EXISTS `tp_attr_val`;
CREATE TABLE `tp_attr_val`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `attr_key_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_attr_val
-- ----------------------------
INSERT INTO `tp_attr_val` VALUES (1, 1, '红色', 1);
INSERT INTO `tp_attr_val` VALUES (2, 1, '白色', 1);
INSERT INTO `tp_attr_val` VALUES (3, 1, '黑色', 1);
INSERT INTO `tp_attr_val` VALUES (4, 1, '蓝色', 1);
INSERT INTO `tp_attr_val` VALUES (5, 2, '16英尺', 1);
INSERT INTO `tp_attr_val` VALUES (6, 2, '18英尺', 1);
INSERT INTO `tp_attr_val` VALUES (7, 2, '12英尺', 1);
INSERT INTO `tp_attr_val` VALUES (8, 3, '16G', 1);
INSERT INTO `tp_attr_val` VALUES (9, 3, '128G', 1);
INSERT INTO `tp_attr_val` VALUES (10, 4, '红', 1);
INSERT INTO `tp_attr_val` VALUES (11, 4, '白', 1);
INSERT INTO `tp_attr_val` VALUES (12, 4, '银白', 1);

-- ----------------------------
-- Table structure for tp_banner
-- ----------------------------
DROP TABLE IF EXISTS `tp_banner`;
CREATE TABLE `tp_banner`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `banner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'banner',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除状态，1-删除 | 0-正常',
  `posid` int(11) NOT NULL DEFAULT 0 COMMENT '推荐位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_banner
-- ----------------------------
INSERT INTO `tp_banner` VALUES (1, '/public/tmp/uploads/20191216\\aabb92d85d6f3686c31b5f32b3483a15.jpg', '', '', 1, 0, 0);
INSERT INTO `tp_banner` VALUES (2, '/public/tmp/uploads/20191216\\56cb3f00332b72dd66e299ca084b2d3a.jpg', '', '', 1, 0, 1);

-- ----------------------------
-- Table structure for tp_cart
-- ----------------------------
DROP TABLE IF EXISTS `tp_cart`;
CREATE TABLE `tp_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL COMMENT '用户id',
  `goodsId` int(11) NOT NULL COMMENT '商品Id',
  `skuId` int(11) NULL DEFAULT NULL COMMENT '商品规格id',
  `num` int(11) NOT NULL COMMENT '购买数量',
  `price` decimal(10, 2) NOT NULL COMMENT '购买的价格',
  `createTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加的时间',
  `totalprice` decimal(10, 2) NOT NULL COMMENT '总额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tp_file
-- ----------------------------
DROP TABLE IF EXISTS `tp_file`;
CREATE TABLE `tp_file`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '文件类型，1-image | 2-file',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原文件名',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_file
-- ----------------------------
INSERT INTO `tp_file` VALUES (1, 3, '/public/index.php/tmp/uploads/20191216\\b2e1f38c8803d13093ce22b0f954ee54.jpg', 'timg (1).jpg', '', 'image/jpeg', 23348, 1576486228);
INSERT INTO `tp_file` VALUES (2, 3, '/public/index.php/tmp/uploads/20191216\\9b04f351b3a841d65601e361a3e4b5a1.jpg', 'timg (1).jpg', '', 'image/jpeg', 23348, 1576486388);
INSERT INTO `tp_file` VALUES (3, 3, '/public/index.php/tmp/uploads/20191216\\d2d6ced85037bb4e4bb9a64a20eff0b0.jpg', 'timg (1).jpg', '', 'image/jpeg', 23348, 1576486415);
INSERT INTO `tp_file` VALUES (4, 3, '/public/index.php/tmp/uploads/20191216\\9b160b7160961472cb897771fffd463f.jpg', 'timg (1).jpg', '', 'image/jpeg', 23348, 1576486569);
INSERT INTO `tp_file` VALUES (5, 3, '/public/index.php/tmp/uploads/20191216\\3d2e4122f586641c499fe4a523f554bd.jpg', 'timg (1).jpg', '', 'image/jpeg', 23348, 1576486583);
INSERT INTO `tp_file` VALUES (6, 3, '/public/index.php/tmp/uploads/20191216\\4a53225b8f9d36de5183d369d4d95a2a.jpg', 'timg (1).jpg', '', 'image/jpeg', 23348, 1576486600);
INSERT INTO `tp_file` VALUES (7, 3, '/public/index.php/tmp/uploads/20191216\\cdb3f66f62d972a5ebabb03ab901eafa.jpg', 'timg (1).jpg', '', 'image/jpeg', 23348, 1576486630);
INSERT INTO `tp_file` VALUES (8, 3, '/public/index.php/tmp/uploads/20191216\\01c98f91c4e827e838295737a3acd11e.jpg', 'timg (1).jpg', '', 'image/jpeg', 23348, 1576486676);
INSERT INTO `tp_file` VALUES (9, 3, 'D:\\phpstudy_pro\\WWW\\shop\\/tmp/uploads/20191216\\077b530213eec4a1caa0a13c5c025434.jpg', 'timg (1).jpg', '', 'image/jpeg', 23348, 1576486766);
INSERT INTO `tp_file` VALUES (10, 3, '/public/tmp/uploads/20191216\\4976deb2b06ee4e008920153cfa44f3e.jpg', 'timg (1).jpg', '', 'image/jpeg', 23348, 1576486877);
INSERT INTO `tp_file` VALUES (11, 3, '/public/tmp/uploads/20191216\\8bead69a5178271ec3e9035ddd9b849e.jpg', 'timg (1).jpg', '', 'image/jpeg', 23348, 1576486894);
INSERT INTO `tp_file` VALUES (12, 3, '/public/tmp/uploads/20191216\\aabb92d85d6f3686c31b5f32b3483a15.jpg', 'timg (1).jpg', '', 'image/jpeg', 23348, 1576487098);
INSERT INTO `tp_file` VALUES (13, 3, '/public/tmp/uploads/20191216\\ec3806accbdf101eed8fc8175d35eee7.jpg', 'timg (1).jpg', '', 'image/jpeg', 23348, 1576488440);
INSERT INTO `tp_file` VALUES (14, 3, '/public/tmp/uploads/20191216\\56cb3f00332b72dd66e299ca084b2d3a.jpg', 'timg (1).jpg', '', 'image/jpeg', 23348, 1576488466);
INSERT INTO `tp_file` VALUES (15, 3, '/public/tmp/uploads/20191217\\dce3ea4197f36c834823366d5966d747.jpg', '4.jpg', '', 'image/jpeg', 24673, 1576570404);
INSERT INTO `tp_file` VALUES (16, 3, '/public/tmp/uploads/20191217\\b87657622b9c6390b147724348eecc75.jpg', '15.jpg', '', 'image/jpeg', 11410, 1576570711);
INSERT INTO `tp_file` VALUES (17, 3, '/public/tmp/uploads/20191217\\2597b425741673e18fe31bf3de3ec501.jpg', '3.jpg', '', 'image/jpeg', 36486, 1576574343);
INSERT INTO `tp_file` VALUES (18, 3, '/public/tmp/uploads/20191217\\224282913e1fe34ccc8675388bc66811.jpg', '18.jpg', '', 'image/jpeg', 22207, 1576574425);
INSERT INTO `tp_file` VALUES (19, 3, '/public/tmp/uploads/20191221\\39a94fd689167c6e748637ccd9380daa.jpg', '3.jpg', '', 'image/jpeg', 36486, 1576895655);
INSERT INTO `tp_file` VALUES (20, 3, '/public/tmp/uploads/20191221\\8c40f18b142c8162b7d818be415ce91b.jpg', '3.jpg', '', 'image/jpeg', 36486, 1576916373);
INSERT INTO `tp_file` VALUES (21, 3, '/public/tmp/uploads/20191221\\8faebc3d3f20a95066963a81fa137c57.jpg', '15.jpg', '', 'image/jpeg', 11410, 1576916554);
INSERT INTO `tp_file` VALUES (22, 3, '/public/tmp/uploads/20191221\\77b98426d186425fd83191fb98c00309.jpg', '10.jpg', '', 'image/jpeg', 7495, 1576916596);
INSERT INTO `tp_file` VALUES (23, 3, '/public/tmp/uploads/20191221\\be283fda011067174cf945e2873e8c4b.jpg', '15.jpg', '', 'image/jpeg', 11410, 1576916741);
INSERT INTO `tp_file` VALUES (24, 3, '/public/tmp/uploads/20191221\\13c48945a12b8a09eeef966a761d03f2.jpg', '10.jpg', '', 'image/jpeg', 7495, 1576916867);
INSERT INTO `tp_file` VALUES (25, 3, '/public/tmp/uploads/20191221\\757f4477ada7bb9036f46adb1e13a3a6.jpg', '9.jpg', '', 'image/jpeg', 60637, 1576916926);
INSERT INTO `tp_file` VALUES (26, 3, '/public/tmp/uploads/20191221\\b1cb0184fe95f78d6162dcdd97f684da.jpg', '19.jpg', '', 'image/jpeg', 10607, 1576916948);

-- ----------------------------
-- Table structure for tp_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods`;
CREATE TABLE `tp_goods`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cid` int(11) NOT NULL DEFAULT 0 COMMENT '所属分类',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缩略图',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情',
  `int` int(11) NOT NULL COMMENT '积分',
  `createtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `stock` int(11) NOT NULL COMMENT '库存',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除状态，1-删除 | 0-正常',
  `posid` int(11) NOT NULL DEFAULT 0 COMMENT '推荐位',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情跳转链接',
  `num` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_goods
-- ----------------------------
INSERT INTO `tp_goods` VALUES (1, 1, '家居家纺', '/public/tmp/uploads/20191221\\be283fda011067174cf945e2873e8c4b.jpg', '家居家纺家居家纺家居家纺家居家纺家居家纺家居家纺', '家居家纺家居家纺家居家纺家居家纺家居家纺家居家纺家居家纺', 12, '1576916724', 11, 1, 0, 1, '/public/index.php/index/goods/detail/id/1.html', 0);
INSERT INTO `tp_goods` VALUES (2, 2, '手机', '/public/tmp/uploads/20191221\\13c48945a12b8a09eeef966a761d03f2.jpg', '手机手机手机手机手机手机手机手机手机手机手机手机手机', '手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机', 13, '1576916857', 11, 1, 0, 1, '/public/index.php/index/goods/detail/id/2.html', 0);
INSERT INTO `tp_goods` VALUES (3, 1, '家居家纺1', '/public/tmp/uploads/20191221\\757f4477ada7bb9036f46adb1e13a3a6.jpg', '家居家纺1家居家纺1家居家纺1家居家纺1家居家纺1家居家纺1家居家纺1', '家居家纺1家居家纺1家居家纺1家居家纺1家居家纺1家居家纺1', 11, '1576916916', 11, 1, 0, 1, '/public/index.php/index/goods/detail/id/3.html', 0);
INSERT INTO `tp_goods` VALUES (4, 2, '手机2', '/public/tmp/uploads/20191221\\b1cb0184fe95f78d6162dcdd97f684da.jpg', '手机2手机2手机2手机2手机2手机2手机2手机2手机2手机2', '手机2手机2手机2手机2手机2手机2手机2手机2', 14, '1576916937', 111, 1, 0, 1, '/public/index.php/index/goods/detail/id/4.html', 0);

-- ----------------------------
-- Table structure for tp_goods_classify
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_classify`;
CREATE TABLE `tp_goods_classify`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除状态，1-删除 | 0-正常',
  `posid` int(11) NOT NULL DEFAULT 0 COMMENT '推荐位',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缩略图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_goods_classify
-- ----------------------------
INSERT INTO `tp_goods_classify` VALUES (1, '家居家纺', 0, 1, 0, 0, '/public/tmp/uploads/20191217\\224282913e1fe34ccc8675388bc66811.jpg');
INSERT INTO `tp_goods_classify` VALUES (2, '3C数码', 0, 1, 0, 0, '/public/tmp/uploads/20191217\\224282913e1fe34ccc8675388bc66811.jpg');
INSERT INTO `tp_goods_classify` VALUES (3, '家用电器', 0, 1, 0, 0, '/public/tmp/uploads/20191217\\224282913e1fe34ccc8675388bc66811.jpg');
INSERT INTO `tp_goods_classify` VALUES (4, '厨房小电', 0, 1, 0, 0, '/public/tmp/uploads/20191217\\224282913e1fe34ccc8675388bc66811.jpg');
INSERT INTO `tp_goods_classify` VALUES (5, '零食小吃', 0, 1, 0, 0, '/public/tmp/uploads/20191217\\224282913e1fe34ccc8675388bc66811.jpg');
INSERT INTO `tp_goods_classify` VALUES (6, '酒水饮料', 0, 1, 0, 0, '/public/tmp/uploads/20191217\\224282913e1fe34ccc8675388bc66811.jpg');
INSERT INTO `tp_goods_classify` VALUES (7, '个护健康', 0, 1, 0, 0, '/public/tmp/uploads/20191217\\224282913e1fe34ccc8675388bc66811.jpg');
INSERT INTO `tp_goods_classify` VALUES (8, '生活电器', 0, 1, 0, 1, '/public/tmp/uploads/20191217\\224282913e1fe34ccc8675388bc66811.jpg');
INSERT INTO `tp_goods_classify` VALUES (9, '服饰', 0, 1, 0, 1, '/public/tmp/uploads/20191217\\224282913e1fe34ccc8675388bc66811.jpg');
INSERT INTO `tp_goods_classify` VALUES (10, '五金家装', 0, 1, 0, 1, '/public/tmp/uploads/20191217\\224282913e1fe34ccc8675388bc66811.jpg');

-- ----------------------------
-- Table structure for tp_goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_comment`;
CREATE TABLE `tp_goods_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) NOT NULL COMMENT '商品id',
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `createtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论时间',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `pic` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论照片',
  `str` int(11) NOT NULL COMMENT '星级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_goods_comment
-- ----------------------------
INSERT INTO `tp_goods_comment` VALUES (6, 1, 1, '1577770957', '你好好', NULL, 0);

-- ----------------------------
-- Table structure for tp_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_sku`;
CREATE TABLE `tp_goods_sku`  (
  `sku_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) UNSIGNED NULL DEFAULT 0,
  `attr_symbol_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double(15, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `freight` double(15, 2) NULL DEFAULT 0.00 COMMENT '运费',
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `original_price` double(15, 2) NULL DEFAULT NULL COMMENT '原始价格',
  PRIMARY KEY (`sku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_goods_sku
-- ----------------------------
INSERT INTO `tp_goods_sku` VALUES (49, 4, '8,10', 1.00, 0.00, 9, NULL);
INSERT INTO `tp_goods_sku` VALUES (50, 4, '8,11', 1.00, 0.00, 10, NULL);
INSERT INTO `tp_goods_sku` VALUES (51, 4, '9,10', 1.00, 0.00, 10, NULL);
INSERT INTO `tp_goods_sku` VALUES (52, 4, '9,11', 1.00, 0.00, 10, NULL);
INSERT INTO `tp_goods_sku` VALUES (56, 3, '1,5', 1.00, 0.00, 1, NULL);
INSERT INTO `tp_goods_sku` VALUES (57, 3, '2,5', 1.00, 0.00, 1, NULL);

-- ----------------------------
-- Table structure for tp_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_login_log`;
CREATE TABLE `tp_login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) NOT NULL,
  `login_ip` char(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `login_browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `login_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_login_log
-- ----------------------------
INSERT INTO `tp_login_log` VALUES (1, 1, '192.168.5.191', '局域网 局域网  ', 'Chrome(77.0.3865.90)', 'Windows 10', '2019-12-31 13:44:15');

-- ----------------------------
-- Table structure for tp_node_map
-- ----------------------------
DROP TABLE IF EXISTS `tp_node_map`;
CREATE TABLE `tp_node_map`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '节点图描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `map`(`method`, `module`, `controller`, `action`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点图' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tp_notice
-- ----------------------------
DROP TABLE IF EXISTS `tp_notice`;
CREATE TABLE `tp_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公共标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `createTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `isdelete` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_notice
-- ----------------------------
INSERT INTO `tp_notice` VALUES (3, '公告标题', '&lt;p&gt;用户您好!!!&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 你好&lt;/p&gt;', '1577775383', 1, 0);
INSERT INTO `tp_notice` VALUES (4, '公告标题111', '&lt;p&gt;&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&lt;/p&gt;', '1577775445', 1, 0);
INSERT INTO `tp_notice` VALUES (5, '公告标题2', '&lt;p&gt;&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&amp;nbsp; &amp;nbsp; 情爱的用户们&lt;/p&gt;', '1577775455', 1, 0);

-- ----------------------------
-- Table structure for tp_one_two_three_four
-- ----------------------------
DROP TABLE IF EXISTS `tp_one_two_three_four`;
CREATE TABLE `tp_one_two_three_four`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '四级控制器主键',
  `field1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段一',
  `option` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选填',
  `select` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下拉框',
  `radio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单选',
  `checkbox` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '复选框',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `textarea` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本域',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日期',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sort` smallint(5) NULL DEFAULT 50 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除状态，1-删除 | 0-正常',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '四级控制器' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_one_two_three_four
-- ----------------------------
INSERT INTO `tp_one_two_three_four` VALUES (1, 'yuan1994', 'tpadmin', '2', '1', NULL, '2222', 'https://github.com/yuan1994/tpadmin', '2016-12-07', '13012345678', 'tianpian0805@gmail.com', 50, 1, 0, 1481947278, 1481947353);

-- ----------------------------
-- Table structure for tp_order
-- ----------------------------
DROP TABLE IF EXISTS `tp_order`;
CREATE TABLE `tp_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单状态 0待发货  1已发货   3待评价 4已完成',
  `orderNo` int(11) NOT NULL COMMENT '订单号',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `totalNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '订单总数量',
  `totalMoney` decimal(11, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总价格',
  `createTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `payType` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付状态 0未支付  1已支付',
  `orderType` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单状态 0待发货  1已发货   2待评价 3已完成',
  `kdNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户备注',
  `kdTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_order
-- ----------------------------
INSERT INTO `tp_order` VALUES (17, 1577688310, 1, '1', 1.00, '1577688310', 1, 3, '612127649527467', '', '1577694553');
INSERT INTO `tp_order` VALUES (16, 1577688299, 1, '1', 12.00, '1577688299', 1, 3, NULL, '', NULL);
INSERT INTO `tp_order` VALUES (15, 1577688019, 1, '2', 13.00, '1577688019', 1, 1, NULL, '', NULL);
INSERT INTO `tp_order` VALUES (14, 1577687950, 1, '1', 12.00, '1577687950', 1, 3, NULL, '', NULL);
INSERT INTO `tp_order` VALUES (13, 1577687937, 1, '2', 13.00, '1577687937', 1, 2, NULL, '', NULL);
INSERT INTO `tp_order` VALUES (12, 1577687921, 1, '1', 12.00, '1577687921', 1, 0, NULL, '', NULL);
INSERT INTO `tp_order` VALUES (11, 1577687908, 1, '3', 14.00, '1577687908', 1, 0, NULL, '', NULL);
INSERT INTO `tp_order` VALUES (18, 1577688319, 1, '1', 1.00, '1577688319', 0, 0, NULL, '', NULL);
INSERT INTO `tp_order` VALUES (19, 1577691545, 1, '1', 1.00, '1577691545', 0, 0, NULL, '', NULL);
INSERT INTO `tp_order` VALUES (20, 1577762389, 1, '2', 13.00, '1577762389', 1, 0, NULL, '', NULL);

-- ----------------------------
-- Table structure for tp_order_info
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_info`;
CREATE TABLE `tp_order_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `orderId` int(11) NOT NULL COMMENT '订单Id',
  `goodsId` int(11) NOT NULL COMMENT '商品id',
  `price` decimal(10, 2) NOT NULL COMMENT '价格',
  `num` int(11) NOT NULL COMMENT '购买数量',
  `skuId` int(11) NOT NULL COMMENT '商品规格Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of tp_order_info
-- ----------------------------
INSERT INTO `tp_order_info` VALUES (10, 12, 1, 12.00, 1, 0);
INSERT INTO `tp_order_info` VALUES (9, 11, 3, 1.00, 1, 56);
INSERT INTO `tp_order_info` VALUES (8, 11, 3, 1.00, 1, 56);
INSERT INTO `tp_order_info` VALUES (7, 11, 1, 12.00, 1, 0);
INSERT INTO `tp_order_info` VALUES (11, 13, 1, 12.00, 1, 0);
INSERT INTO `tp_order_info` VALUES (12, 13, 3, 1.00, 1, 56);
INSERT INTO `tp_order_info` VALUES (13, 14, 1, 12.00, 1, 0);
INSERT INTO `tp_order_info` VALUES (14, 15, 1, 12.00, 1, 0);
INSERT INTO `tp_order_info` VALUES (15, 15, 3, 1.00, 1, 56);
INSERT INTO `tp_order_info` VALUES (16, 16, 1, 12.00, 1, 0);
INSERT INTO `tp_order_info` VALUES (17, 17, 3, 1.00, 1, 56);
INSERT INTO `tp_order_info` VALUES (18, 18, 3, 1.00, 1, 56);
INSERT INTO `tp_order_info` VALUES (19, 19, 3, 1.00, 1, 57);
INSERT INTO `tp_order_info` VALUES (20, 20, 3, 1.00, 1, 56);
INSERT INTO `tp_order_info` VALUES (21, 20, 1, 12.00, 1, 0);

-- ----------------------------
-- Table structure for tp_position
-- ----------------------------
DROP TABLE IF EXISTS `tp_position`;
CREATE TABLE `tp_position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '推荐位的id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐位名称',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `isdelete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_position
-- ----------------------------
INSERT INTO `tp_position` VALUES (1, '首页推荐', 0, 0);

-- ----------------------------
-- Table structure for tp_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_user`;
CREATE TABLE `tp_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名(手机号)',
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码     MD5(md5(pass)+slat)',
  `slat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码  验证',
  `amount` decimal(11, 2) NOT NULL DEFAULT 0.00 COMMENT '用户积分',
  `lastlogintime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后登录时间',
  `createTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `status` tinyint(255) NOT NULL DEFAULT 1,
  `header` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_user
-- ----------------------------
INSERT INTO `tp_user` VALUES (1, '15295488523', 'c33367701511b4f6020ec61ded352059', NULL, 9883.00, '1577773758', '1576481818', 1, '', '你大爷的你看啥');
INSERT INTO `tp_user` VALUES (3, '15295488522', 'e10adc3949ba59abbe56e057f20f883e', NULL, 0.00, NULL, '1576804588', 1, NULL, NULL);

-- ----------------------------
-- Table structure for tp_web_log_001
-- ----------------------------
DROP TABLE IF EXISTS `tp_web_log_001`;
CREATE TABLE `tp_web_log_001`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `ip`(`ip`) USING BTREE,
  INDEX `create_at`(`create_at`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1502 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tp_web_log_all
-- ----------------------------
DROP TABLE IF EXISTS `tp_web_log_all`;
CREATE TABLE `tp_web_log_all`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `ip`(`ip`) USING BTREE,
  INDEX `create_at`(`create_at`) USING BTREE
) ENGINE = MRG_MYISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站日志' INSERT_METHOD = LAST ROW_FORMAT = Dynamic UNION = (`tp_web_log_001`);

SET FOREIGN_KEY_CHECKS = 1;
