/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 16/12/2019 17:52:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_admin_group
-- ----------------------------
INSERT INTO `tp_admin_group` VALUES (1, '系统管理', '&#xe61d;', 2, 1, '', 0, 1450752856, 1481180175);
INSERT INTO `tp_admin_group` VALUES (2, '工具', '&#xe616;', 3, 1, '', 0, 1476016712, 1481180175);
INSERT INTO `tp_admin_group` VALUES (3, '用户管理', '&amp;#xe60d;', 4, 1, '', 0, 1576464113, 1576464113);
INSERT INTO `tp_admin_group` VALUES (4, '网站配置', '&amp;#xe62e;', 5, 1, '', 0, 1576483241, 1576483241);

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
) ENGINE = MyISAM AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点快速导入' ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

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
INSERT INTO `tp_admin_user` VALUES (1, 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', 1576483167, '127.0.0.1', 387, 'tianpian0805@gmail.com', '13121126169', '我是超级管理员', 1, 0, 1222907803, 1451033528);
INSERT INTO `tp_admin_user` VALUES (2, 'demo', '测试', 'e10adc3949ba59abbe56e057f20f883e', 1481206367, '127.0.0.1', 5, '', '', '', 1, 0, 1476777133, 1477399793);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_banner
-- ----------------------------
INSERT INTO `tp_banner` VALUES (1, '/public/tmp/uploads/20191216\\aabb92d85d6f3686c31b5f32b3483a15.jpg', '', '', 1, 0, 0);
INSERT INTO `tp_banner` VALUES (2, '/public/tmp/uploads/20191216\\56cb3f00332b72dd66e299ca084b2d3a.jpg', '', '', 1, 0, 1);

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for tp_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_login_log`;
CREATE TABLE `tp_login_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `login_ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_login_log
-- ----------------------------
INSERT INTO `tp_login_log` VALUES (1, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(77.0.3865.90)', 'Windows 10', '2019-12-16 10:41:10');
INSERT INTO `tp_login_log` VALUES (2, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(77.0.3865.90)', 'Windows 10', '2019-12-16 15:59:27');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点图' ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '四级控制器' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_one_two_three_four
-- ----------------------------
INSERT INTO `tp_one_two_three_four` VALUES (1, 'yuan1994', 'tpadmin', '2', '1', NULL, '2222', 'https://github.com/yuan1994/tpadmin', '2016-12-07', '13012345678', 'tianpian0805@gmail.com', 50, 1, 0, 1481947278, 1481947353);

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_user
-- ----------------------------
INSERT INTO `tp_user` VALUES (1, '15295488523', 'e10adc3949ba59abbe56e057f20f883e', NULL, 0.00, NULL, '1576481818');

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_web_log_001
-- ----------------------------
INSERT INTO `tp_web_log_001` VALUES (1, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576462655);
INSERT INTO `tp_web_log_001` VALUES (2, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576462655);
INSERT INTO `tp_web_log_001` VALUES (3, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576462970);
INSERT INTO `tp_web_log_001` VALUES (4, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576462970);
INSERT INTO `tp_web_log_001` VALUES (5, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463052);
INSERT INTO `tp_web_log_001` VALUES (6, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463072);
INSERT INTO `tp_web_log_001` VALUES (7, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463096);
INSERT INTO `tp_web_log_001` VALUES (8, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463426);
INSERT INTO `tp_web_log_001` VALUES (9, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463454);
INSERT INTO `tp_web_log_001` VALUES (10, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463457);
INSERT INTO `tp_web_log_001` VALUES (11, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463497);
INSERT INTO `tp_web_log_001` VALUES (12, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463744);
INSERT INTO `tp_web_log_001` VALUES (13, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463761);
INSERT INTO `tp_web_log_001` VALUES (14, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463820);
INSERT INTO `tp_web_log_001` VALUES (15, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576463838);
INSERT INTO `tp_web_log_001` VALUES (16, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463838);
INSERT INTO `tp_web_log_001` VALUES (17, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/index/index', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576463864);
INSERT INTO `tp_web_log_001` VALUES (18, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463864);
INSERT INTO `tp_web_log_001` VALUES (19, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576464056);
INSERT INTO `tp_web_log_001` VALUES (20, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576464056);
INSERT INTO `tp_web_log_001` VALUES (21, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"bcwh\";}', 1576464070);
INSERT INTO `tp_web_log_001` VALUES (22, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576464070);
INSERT INTO `tp_web_log_001` VALUES (23, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576464070);
INSERT INTO `tp_web_log_001` VALUES (24, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1576464079);
INSERT INTO `tp_web_log_001` VALUES (25, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', 1576464080);
INSERT INTO `tp_web_log_001` VALUES (26, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"用户管理\";s:4:\"icon\";s:12:\"&amp;#xe60d;\";s:4:\"sort\";s:1:\"3\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', 1576464113);
INSERT INTO `tp_web_log_001` VALUES (27, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1576464113);
INSERT INTO `tp_web_log_001` VALUES (28, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/saveOrder', 'admin', 'AdminGroup', 'saveorder', 'POST', 'a:1:{s:4:\"sort\";a:3:{i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}}', 1576464121);
INSERT INTO `tp_web_log_001` VALUES (29, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576464129);
INSERT INTO `tp_web_log_001` VALUES (30, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576464129);
INSERT INTO `tp_web_log_001` VALUES (31, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1576464129);
INSERT INTO `tp_web_log_001` VALUES (32, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1576464131);
INSERT INTO `tp_web_log_001` VALUES (33, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"3\";s:5:\"title\";s:12:\"用户列表\";s:4:\"name\";s:4:\"User\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1576464150);
INSERT INTO `tp_web_log_001` VALUES (34, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576464150);
INSERT INTO `tp_web_log_001` VALUES (35, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576464151);
INSERT INTO `tp_web_log_001` VALUES (36, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1576464151);
INSERT INTO `tp_web_log_001` VALUES (37, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576464178);
INSERT INTO `tp_web_log_001` VALUES (38, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576464178);
INSERT INTO `tp_web_log_001` VALUES (39, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', 1576464180);
INSERT INTO `tp_web_log_001` VALUES (40, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/index.html?table=tp_user', 'admin', 'Generate', 'index', 'GET', 'a:1:{s:5:\"table\";s:7:\"tp_user\";}', 1576464185);
INSERT INTO `tp_web_log_001` VALUES (41, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', 1576464245);
INSERT INTO `tp_web_log_001` VALUES (42, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/index.html?table=tp_user', 'admin', 'Generate', 'index', 'GET', 'a:1:{s:5:\"table\";s:7:\"tp_user\";}', 1576464249);
INSERT INTO `tp_web_log_001` VALUES (43, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:7:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:4:\"User\";s:5:\"title\";s:0:\"\";s:4:\"form\";a:5:{i:1;a:9:{s:5:\"title\";s:2:\"ID\";s:4:\"name\";s:2:\"id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:8:{s:5:\"title\";s:9:\"用户名\";s:4:\"name\";s:8:\"username\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:5;a:9:{s:5:\"title\";s:6:\"积分\";s:4:\"name\";s:6:\"amount\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:6;a:8:{s:5:\"title\";s:18:\"最后登陆时间\";s:4:\"name\";s:13:\"lastlogintime\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"date\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:7;a:9:{s:5:\"title\";s:12:\"注册时间\";s:4:\"name\";s:10:\"createTime\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"date\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:4:\"menu\";a:6:{i:0;s:3:\"add\";i:1;s:6:\"forbid\";i:2;s:6:\"resume\";i:3;s:6:\"delete\";i:4;s:10:\"recycleBin\";i:5;s:9:\"saveOrder\";}s:5:\"model\";s:1:\"1\";}', 1576464408);
INSERT INTO `tp_web_log_001` VALUES (44, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1576464410);
INSERT INTO `tp_web_log_001` VALUES (45, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576464415);
INSERT INTO `tp_web_log_001` VALUES (46, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576464415);
INSERT INTO `tp_web_log_001` VALUES (47, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1576464417);
INSERT INTO `tp_web_log_001` VALUES (48, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1576464447);
INSERT INTO `tp_web_log_001` VALUES (49, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1576464448);
INSERT INTO `tp_web_log_001` VALUES (50, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576464449);
INSERT INTO `tp_web_log_001` VALUES (51, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576464449);
INSERT INTO `tp_web_log_001` VALUES (52, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576465202);
INSERT INTO `tp_web_log_001` VALUES (53, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576465202);
INSERT INTO `tp_web_log_001` VALUES (54, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576465214);
INSERT INTO `tp_web_log_001` VALUES (55, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576465214);
INSERT INTO `tp_web_log_001` VALUES (56, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576465221);
INSERT INTO `tp_web_log_001` VALUES (57, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576465221);
INSERT INTO `tp_web_log_001` VALUES (58, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576465259);
INSERT INTO `tp_web_log_001` VALUES (59, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576465259);
INSERT INTO `tp_web_log_001` VALUES (60, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576465372);
INSERT INTO `tp_web_log_001` VALUES (61, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576465372);
INSERT INTO `tp_web_log_001` VALUES (62, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576465380);
INSERT INTO `tp_web_log_001` VALUES (63, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576465380);
INSERT INTO `tp_web_log_001` VALUES (64, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576465576);
INSERT INTO `tp_web_log_001` VALUES (65, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576465576);
INSERT INTO `tp_web_log_001` VALUES (66, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576483159);
INSERT INTO `tp_web_log_001` VALUES (67, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576483159);
INSERT INTO `tp_web_log_001` VALUES (68, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576483159);
INSERT INTO `tp_web_log_001` VALUES (69, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"fmcx\";}', 1576483167);
INSERT INTO `tp_web_log_001` VALUES (70, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576483167);
INSERT INTO `tp_web_log_001` VALUES (71, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576483167);
INSERT INTO `tp_web_log_001` VALUES (72, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1576483175);
INSERT INTO `tp_web_log_001` VALUES (73, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', 1576483196);
INSERT INTO `tp_web_log_001` VALUES (74, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"网站配置\";s:4:\"icon\";s:12:\"&amp;#xe62e;\";s:4:\"sort\";s:1:\"4\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', 1576483241);
INSERT INTO `tp_web_log_001` VALUES (75, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1576483241);
INSERT INTO `tp_web_log_001` VALUES (76, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/saveOrder', 'admin', 'AdminGroup', 'saveorder', 'POST', 'a:1:{s:4:\"sort\";a:4:{i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";}}', 1576483247);
INSERT INTO `tp_web_log_001` VALUES (77, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', 1576484157);
INSERT INTO `tp_web_log_001` VALUES (78, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/index.html?table=tp_position', 'admin', 'Generate', 'index', 'GET', 'a:1:{s:5:\"table\";s:11:\"tp_position\";}', 1576484160);
INSERT INTO `tp_web_log_001` VALUES (79, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:6:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:8:\"Position\";s:5:\"title\";s:0:\"\";s:4:\"form\";a:2:{i:1;a:7:{s:5:\"title\";s:2:\"ID\";s:4:\"name\";s:2:\"id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:7:{s:5:\"title\";s:4:\"name\";s:4:\"name\";s:4:\"name\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:4:\"menu\";a:6:{i:0;s:3:\"add\";i:1;s:6:\"forbid\";i:2;s:6:\"resume\";i:3;s:6:\"delete\";i:4;s:10:\"recycleBin\";i:5;s:9:\"saveOrder\";}}', 1576484183);
INSERT INTO `tp_web_log_001` VALUES (80, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484184);
INSERT INTO `tp_web_log_001` VALUES (81, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576484191);
INSERT INTO `tp_web_log_001` VALUES (82, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576484191);
INSERT INTO `tp_web_log_001` VALUES (83, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1576484194);
INSERT INTO `tp_web_log_001` VALUES (84, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576484198);
INSERT INTO `tp_web_log_001` VALUES (85, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576484198);
INSERT INTO `tp_web_log_001` VALUES (86, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1576484198);
INSERT INTO `tp_web_log_001` VALUES (87, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1576484200);
INSERT INTO `tp_web_log_001` VALUES (88, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:9:\"推荐位\";s:4:\"name\";s:7:\"Postion\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', 1576484226);
INSERT INTO `tp_web_log_001` VALUES (89, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576484226);
INSERT INTO `tp_web_log_001` VALUES (90, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576484226);
INSERT INTO `tp_web_log_001` VALUES (91, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1576484226);
INSERT INTO `tp_web_log_001` VALUES (92, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576484229);
INSERT INTO `tp_web_log_001` VALUES (93, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576484229);
INSERT INTO `tp_web_log_001` VALUES (94, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576484241);
INSERT INTO `tp_web_log_001` VALUES (95, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576484241);
INSERT INTO `tp_web_log_001` VALUES (96, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1576484241);
INSERT INTO `tp_web_log_001` VALUES (97, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1576484244);
INSERT INTO `tp_web_log_001` VALUES (98, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/edit?id=64', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"64\";}', 1576484247);
INSERT INTO `tp_web_log_001` VALUES (99, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/edit', 'admin', 'AdminNode', 'edit', 'POST', 'a:9:{s:2:\"id\";s:2:\"64\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:9:\"推荐位\";s:4:\"name\";s:8:\"Position\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1576484255);
INSERT INTO `tp_web_log_001` VALUES (100, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576484255);
INSERT INTO `tp_web_log_001` VALUES (101, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576484255);
INSERT INTO `tp_web_log_001` VALUES (102, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1576484255);
INSERT INTO `tp_web_log_001` VALUES (103, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576484258);
INSERT INTO `tp_web_log_001` VALUES (104, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576484258);
INSERT INTO `tp_web_log_001` VALUES (105, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484259);
INSERT INTO `tp_web_log_001` VALUES (106, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'GET', 'a:0:{}', 1576484261);
INSERT INTO `tp_web_log_001` VALUES (107, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'POST', 'a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"精品任选\";}', 1576484295);
INSERT INTO `tp_web_log_001` VALUES (108, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484414);
INSERT INTO `tp_web_log_001` VALUES (109, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'GET', 'a:0:{}', 1576484429);
INSERT INTO `tp_web_log_001` VALUES (110, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'POST', 'a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"热卖推荐\";}', 1576484435);
INSERT INTO `tp_web_log_001` VALUES (111, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484435);
INSERT INTO `tp_web_log_001` VALUES (112, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'GET', 'a:0:{}', 1576484441);
INSERT INTO `tp_web_log_001` VALUES (113, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'POST', 'a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"每周上新\";}', 1576484445);
INSERT INTO `tp_web_log_001` VALUES (114, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484445);
INSERT INTO `tp_web_log_001` VALUES (115, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'GET', 'a:0:{}', 1576484461);
INSERT INTO `tp_web_log_001` VALUES (116, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'POST', 'a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"主题馆\";}', 1576484466);
INSERT INTO `tp_web_log_001` VALUES (117, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484466);
INSERT INTO `tp_web_log_001` VALUES (118, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'GET', 'a:0:{}', 1576484478);
INSERT INTO `tp_web_log_001` VALUES (119, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'POST', 'a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"猜你喜欢\";}', 1576484484);
INSERT INTO `tp_web_log_001` VALUES (120, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484484);
INSERT INTO `tp_web_log_001` VALUES (121, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484532);
INSERT INTO `tp_web_log_001` VALUES (122, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484532);
INSERT INTO `tp_web_log_001` VALUES (123, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484532);
INSERT INTO `tp_web_log_001` VALUES (124, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484532);
INSERT INTO `tp_web_log_001` VALUES (125, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1576484593);
INSERT INTO `tp_web_log_001` VALUES (126, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576484595);
INSERT INTO `tp_web_log_001` VALUES (127, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576484595);
INSERT INTO `tp_web_log_001` VALUES (128, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1576484595);
INSERT INTO `tp_web_log_001` VALUES (129, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1576484596);
INSERT INTO `tp_web_log_001` VALUES (130, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:9:\"轮播图\";s:4:\"name\";s:6:\"Banner\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"1\";}', 1576484610);
INSERT INTO `tp_web_log_001` VALUES (131, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576484610);
INSERT INTO `tp_web_log_001` VALUES (132, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576484610);
INSERT INTO `tp_web_log_001` VALUES (133, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1576484610);
INSERT INTO `tp_web_log_001` VALUES (134, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', 1576484612);
INSERT INTO `tp_web_log_001` VALUES (135, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:10:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:6:\"Banner\";s:5:\"title\";s:0:\"\";s:4:\"form\";a:4:{i:0;a:7:{s:5:\"title\";s:2:\"id\";s:4:\"name\";s:2:\"id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:1;a:7:{s:5:\"title\";s:6:\"banner\";s:4:\"name\";s:6:\"banner\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:7:{s:5:\"title\";s:6:\"位置\";s:4:\"name\";s:8:\"position\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:3;a:7:{s:5:\"title\";s:6:\"地址\";s:4:\"name\";s:3:\"url\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:12:\"create_table\";s:1:\"1\";s:12:\"table_engine\";s:6:\"InnoDB\";s:10:\"table_name\";s:0:\"\";s:5:\"field\";a:4:{i:1;a:7:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:7:\"default\";s:4:\"NULL\";s:8:\"not_null\";s:1:\"1\";s:3:\"key\";s:1:\"1\";s:7:\"comment\";s:2:\"id\";s:5:\"extra\";s:0:\"\";}i:2;a:6:{s:4:\"name\";s:6:\"banner\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:8:\"not_null\";s:1:\"1\";s:7:\"comment\";s:6:\"banner\";s:5:\"extra\";s:0:\"\";}i:3;a:5:{s:4:\"name\";s:8:\"position\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:7:\"comment\";s:6:\"位置\";s:5:\"extra\";s:0:\"\";}i:4;a:5:{s:4:\"name\";s:3:\"url\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:7:\"comment\";s:6:\"地址\";s:5:\"extra\";s:0:\"\";}}s:4:\"menu\";a:6:{i:0;s:3:\"add\";i:1;s:6:\"forbid\";i:2;s:6:\"resume\";i:3;s:6:\"delete\";i:4;s:10:\"recycleBin\";i:5;s:9:\"saveOrder\";}}', 1576484716);
INSERT INTO `tp_web_log_001` VALUES (136, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576484717);
INSERT INTO `tp_web_log_001` VALUES (137, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:10:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:6:\"Banner\";s:5:\"title\";s:0:\"\";s:4:\"form\";a:4:{i:0;a:7:{s:5:\"title\";s:2:\"id\";s:4:\"name\";s:2:\"id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:1;a:7:{s:5:\"title\";s:6:\"banner\";s:4:\"name\";s:6:\"banner\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:7:{s:5:\"title\";s:6:\"位置\";s:4:\"name\";s:8:\"position\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:3;a:7:{s:5:\"title\";s:6:\"地址\";s:4:\"name\";s:3:\"url\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:12:\"create_table\";s:1:\"1\";s:12:\"table_engine\";s:6:\"InnoDB\";s:10:\"table_name\";s:0:\"\";s:5:\"field\";a:4:{i:1;a:7:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:7:\"default\";s:4:\"NULL\";s:8:\"not_null\";s:1:\"1\";s:3:\"key\";s:1:\"1\";s:7:\"comment\";s:2:\"id\";s:5:\"extra\";s:0:\"\";}i:2;a:6:{s:4:\"name\";s:6:\"banner\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:8:\"not_null\";s:1:\"1\";s:7:\"comment\";s:6:\"banner\";s:5:\"extra\";s:0:\"\";}i:3;a:5:{s:4:\"name\";s:8:\"position\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:7:\"comment\";s:6:\"位置\";s:5:\"extra\";s:0:\"\";}i:4;a:5:{s:4:\"name\";s:3:\"url\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:7:\"comment\";s:6:\"地址\";s:5:\"extra\";s:0:\"\";}}s:4:\"menu\";a:6:{i:0;s:3:\"add\";i:1;s:6:\"forbid\";i:2;s:6:\"resume\";i:3;s:6:\"delete\";i:4;s:10:\"recycleBin\";i:5;s:9:\"saveOrder\";}}', 1576484754);
INSERT INTO `tp_web_log_001` VALUES (138, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576484756);
INSERT INTO `tp_web_log_001` VALUES (139, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576484761);
INSERT INTO `tp_web_log_001` VALUES (140, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576484761);
INSERT INTO `tp_web_log_001` VALUES (141, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576484763);
INSERT INTO `tp_web_log_001` VALUES (142, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576484776);
INSERT INTO `tp_web_log_001` VALUES (143, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576484777);
INSERT INTO `tp_web_log_001` VALUES (144, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576484777);
INSERT INTO `tp_web_log_001` VALUES (145, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576484777);
INSERT INTO `tp_web_log_001` VALUES (146, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/demo/imageupload.html', 'admin', 'Demo', 'imageupload', 'GET', 'a:0:{}', 1576486214);
INSERT INTO `tp_web_log_001` VALUES (147, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486216);
INSERT INTO `tp_web_log_001` VALUES (148, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486228);
INSERT INTO `tp_web_log_001` VALUES (149, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/demo/imageupload.html', 'admin', 'Demo', 'imageupload', 'GET', 'a:0:{}', 1576486261);
INSERT INTO `tp_web_log_001` VALUES (150, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486264);
INSERT INTO `tp_web_log_001` VALUES (151, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/listimage.html', 'admin', 'Upload', 'listimage', 'POST', 'a:2:{s:1:\"p\";s:1:\"1\";s:5:\"count\";s:1:\"1\";}', 1576486267);
INSERT INTO `tp_web_log_001` VALUES (152, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/demo/imageupload.html', 'admin', 'Demo', 'imageupload', 'GET', 'a:0:{}', 1576486277);
INSERT INTO `tp_web_log_001` VALUES (153, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576486375);
INSERT INTO `tp_web_log_001` VALUES (154, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576486375);
INSERT INTO `tp_web_log_001` VALUES (155, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576486377);
INSERT INTO `tp_web_log_001` VALUES (156, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576486377);
INSERT INTO `tp_web_log_001` VALUES (157, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486384);
INSERT INTO `tp_web_log_001` VALUES (158, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486388);
INSERT INTO `tp_web_log_001` VALUES (159, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576486410);
INSERT INTO `tp_web_log_001` VALUES (160, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486412);
INSERT INTO `tp_web_log_001` VALUES (161, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486415);
INSERT INTO `tp_web_log_001` VALUES (162, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576486561);
INSERT INTO `tp_web_log_001` VALUES (163, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576486564);
INSERT INTO `tp_web_log_001` VALUES (164, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486565);
INSERT INTO `tp_web_log_001` VALUES (165, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486569);
INSERT INTO `tp_web_log_001` VALUES (166, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486579);
INSERT INTO `tp_web_log_001` VALUES (167, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486580);
INSERT INTO `tp_web_log_001` VALUES (168, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486583);
INSERT INTO `tp_web_log_001` VALUES (169, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486597);
INSERT INTO `tp_web_log_001` VALUES (170, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486600);
INSERT INTO `tp_web_log_001` VALUES (171, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486620);
INSERT INTO `tp_web_log_001` VALUES (172, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486624);
INSERT INTO `tp_web_log_001` VALUES (173, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486630);
INSERT INTO `tp_web_log_001` VALUES (174, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486673);
INSERT INTO `tp_web_log_001` VALUES (175, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486676);
INSERT INTO `tp_web_log_001` VALUES (176, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486761);
INSERT INTO `tp_web_log_001` VALUES (177, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486766);
INSERT INTO `tp_web_log_001` VALUES (178, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486865);
INSERT INTO `tp_web_log_001` VALUES (179, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486866);
INSERT INTO `tp_web_log_001` VALUES (180, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486866);
INSERT INTO `tp_web_log_001` VALUES (181, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576486868);
INSERT INTO `tp_web_log_001` VALUES (182, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486870);
INSERT INTO `tp_web_log_001` VALUES (183, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486877);
INSERT INTO `tp_web_log_001` VALUES (184, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486889);
INSERT INTO `tp_web_log_001` VALUES (185, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486894);
INSERT INTO `tp_web_log_001` VALUES (186, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576487089);
INSERT INTO `tp_web_log_001` VALUES (187, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576487095);
INSERT INTO `tp_web_log_001` VALUES (188, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576487098);
INSERT INTO `tp_web_log_001` VALUES (189, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'POST', 'a:4:{s:2:\"id\";s:0:\"\";s:6:\"banner\";s:65:\"/public/tmp/uploads/20191216\\aabb92d85d6f3686c31b5f32b3483a15.jpg\";s:8:\"position\";s:0:\"\";s:3:\"url\";s:0:\"\";}', 1576487110);
INSERT INTO `tp_web_log_001` VALUES (190, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487110);
INSERT INTO `tp_web_log_001` VALUES (191, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487156);
INSERT INTO `tp_web_log_001` VALUES (192, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487179);
INSERT INTO `tp_web_log_001` VALUES (193, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487180);
INSERT INTO `tp_web_log_001` VALUES (194, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487180);
INSERT INTO `tp_web_log_001` VALUES (195, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487180);
INSERT INTO `tp_web_log_001` VALUES (196, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487180);
INSERT INTO `tp_web_log_001` VALUES (197, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487180);
INSERT INTO `tp_web_log_001` VALUES (198, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487296);
INSERT INTO `tp_web_log_001` VALUES (199, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487311);
INSERT INTO `tp_web_log_001` VALUES (200, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487658);
INSERT INTO `tp_web_log_001` VALUES (201, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576487886);
INSERT INTO `tp_web_log_001` VALUES (202, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488013);
INSERT INTO `tp_web_log_001` VALUES (203, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488014);
INSERT INTO `tp_web_log_001` VALUES (204, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488014);
INSERT INTO `tp_web_log_001` VALUES (205, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488015);
INSERT INTO `tp_web_log_001` VALUES (206, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488059);
INSERT INTO `tp_web_log_001` VALUES (207, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488060);
INSERT INTO `tp_web_log_001` VALUES (208, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488060);
INSERT INTO `tp_web_log_001` VALUES (209, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488171);
INSERT INTO `tp_web_log_001` VALUES (210, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488172);
INSERT INTO `tp_web_log_001` VALUES (211, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488176);
INSERT INTO `tp_web_log_001` VALUES (212, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488292);
INSERT INTO `tp_web_log_001` VALUES (213, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488293);
INSERT INTO `tp_web_log_001` VALUES (214, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488293);
INSERT INTO `tp_web_log_001` VALUES (215, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488401);
INSERT INTO `tp_web_log_001` VALUES (216, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488428);
INSERT INTO `tp_web_log_001` VALUES (217, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488429);
INSERT INTO `tp_web_log_001` VALUES (218, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488429);
INSERT INTO `tp_web_log_001` VALUES (219, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488430);
INSERT INTO `tp_web_log_001` VALUES (220, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488433);
INSERT INTO `tp_web_log_001` VALUES (221, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576488436);
INSERT INTO `tp_web_log_001` VALUES (222, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576488440);
INSERT INTO `tp_web_log_001` VALUES (223, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488450);
INSERT INTO `tp_web_log_001` VALUES (224, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488461);
INSERT INTO `tp_web_log_001` VALUES (225, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488462);
INSERT INTO `tp_web_log_001` VALUES (226, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576488463);
INSERT INTO `tp_web_log_001` VALUES (227, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576488466);
INSERT INTO `tp_web_log_001` VALUES (228, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:6:\"banner\";s:65:\"/public/tmp/uploads/20191216\\56cb3f00332b72dd66e299ca084b2d3a.jpg\";s:5:\"posid\";s:1:\"1\";s:8:\"position\";s:0:\"\";s:3:\"url\";s:0:\"\";}', 1576488470);
INSERT INTO `tp_web_log_001` VALUES (229, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488471);
INSERT INTO `tp_web_log_001` VALUES (230, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/2.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"2\";}', 1576488474);
INSERT INTO `tp_web_log_001` VALUES (231, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488505);
INSERT INTO `tp_web_log_001` VALUES (232, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/delete.html', 'admin', 'Position', 'delete', 'POST', 'a:1:{s:2:\"id\";s:7:\"5,4,3,2\";}', 1576488516);
INSERT INTO `tp_web_log_001` VALUES (233, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488516);
INSERT INTO `tp_web_log_001` VALUES (234, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/recyclebin.html', 'admin', 'Position', 'recyclebin', 'GET', 'a:0:{}', 1576488517);
INSERT INTO `tp_web_log_001` VALUES (235, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/recyclebin.html', 'admin', 'Position', 'recyclebin', 'GET', 'a:0:{}', 1576488517);
INSERT INTO `tp_web_log_001` VALUES (236, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/deleteforever.html', 'admin', 'Position', 'deleteforever', 'POST', 'a:1:{s:2:\"id\";s:7:\"5,4,3,2\";}', 1576488521);
INSERT INTO `tp_web_log_001` VALUES (237, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/recyclebin.html', 'admin', 'Position', 'recyclebin', 'GET', 'a:0:{}', 1576488521);
INSERT INTO `tp_web_log_001` VALUES (238, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488523);
INSERT INTO `tp_web_log_001` VALUES (239, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/edit/id/1.html', 'admin', 'Position', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488525);
INSERT INTO `tp_web_log_001` VALUES (240, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/edit/id/1.html', 'admin', 'Position', 'edit', 'POST', 'a:2:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"首页\";}', 1576488539);
INSERT INTO `tp_web_log_001` VALUES (241, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488539);
INSERT INTO `tp_web_log_001` VALUES (242, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/edit/id/1.html', 'admin', 'Position', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488548);
INSERT INTO `tp_web_log_001` VALUES (243, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/edit/id/1.html', 'admin', 'Position', 'edit', 'POST', 'a:2:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:12:\"首页推荐\";}', 1576488551);
INSERT INTO `tp_web_log_001` VALUES (244, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488551);
INSERT INTO `tp_web_log_001` VALUES (245, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488553);
INSERT INTO `tp_web_log_001` VALUES (246, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488553);
INSERT INTO `tp_web_log_001` VALUES (247, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488553);
INSERT INTO `tp_web_log_001` VALUES (248, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488555);
INSERT INTO `tp_web_log_001` VALUES (249, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488555);
INSERT INTO `tp_web_log_001` VALUES (250, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/2.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"2\";}', 1576488557);
INSERT INTO `tp_web_log_001` VALUES (251, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488560);
INSERT INTO `tp_web_log_001` VALUES (252, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488563);
INSERT INTO `tp_web_log_001` VALUES (253, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488563);
INSERT INTO `tp_web_log_001` VALUES (254, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488563);
INSERT INTO `tp_web_log_001` VALUES (255, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488564);
INSERT INTO `tp_web_log_001` VALUES (256, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488567);
INSERT INTO `tp_web_log_001` VALUES (257, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488568);
INSERT INTO `tp_web_log_001` VALUES (258, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488568);
INSERT INTO `tp_web_log_001` VALUES (259, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488568);
INSERT INTO `tp_web_log_001` VALUES (260, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488568);
INSERT INTO `tp_web_log_001` VALUES (261, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488569);
INSERT INTO `tp_web_log_001` VALUES (262, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488569);
INSERT INTO `tp_web_log_001` VALUES (263, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488569);
INSERT INTO `tp_web_log_001` VALUES (264, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488570);
INSERT INTO `tp_web_log_001` VALUES (265, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488570);
INSERT INTO `tp_web_log_001` VALUES (266, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488571);
INSERT INTO `tp_web_log_001` VALUES (267, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488571);
INSERT INTO `tp_web_log_001` VALUES (268, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488572);

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

-- ----------------------------
-- Records of tp_web_log_all
-- ----------------------------
INSERT INTO `tp_web_log_all` VALUES (1, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576462655);
INSERT INTO `tp_web_log_all` VALUES (2, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576462655);
INSERT INTO `tp_web_log_all` VALUES (3, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576462970);
INSERT INTO `tp_web_log_all` VALUES (4, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576462970);
INSERT INTO `tp_web_log_all` VALUES (5, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463052);
INSERT INTO `tp_web_log_all` VALUES (6, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463072);
INSERT INTO `tp_web_log_all` VALUES (7, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463096);
INSERT INTO `tp_web_log_all` VALUES (8, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463426);
INSERT INTO `tp_web_log_all` VALUES (9, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463454);
INSERT INTO `tp_web_log_all` VALUES (10, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463457);
INSERT INTO `tp_web_log_all` VALUES (11, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463497);
INSERT INTO `tp_web_log_all` VALUES (12, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463744);
INSERT INTO `tp_web_log_all` VALUES (13, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463761);
INSERT INTO `tp_web_log_all` VALUES (14, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463820);
INSERT INTO `tp_web_log_all` VALUES (15, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576463838);
INSERT INTO `tp_web_log_all` VALUES (16, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463838);
INSERT INTO `tp_web_log_all` VALUES (17, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/index/index', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576463864);
INSERT INTO `tp_web_log_all` VALUES (18, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576463864);
INSERT INTO `tp_web_log_all` VALUES (19, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576464056);
INSERT INTO `tp_web_log_all` VALUES (20, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576464056);
INSERT INTO `tp_web_log_all` VALUES (21, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"bcwh\";}', 1576464070);
INSERT INTO `tp_web_log_all` VALUES (22, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576464070);
INSERT INTO `tp_web_log_all` VALUES (23, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576464070);
INSERT INTO `tp_web_log_all` VALUES (24, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1576464079);
INSERT INTO `tp_web_log_all` VALUES (25, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', 1576464080);
INSERT INTO `tp_web_log_all` VALUES (26, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"用户管理\";s:4:\"icon\";s:12:\"&amp;#xe60d;\";s:4:\"sort\";s:1:\"3\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', 1576464113);
INSERT INTO `tp_web_log_all` VALUES (27, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1576464113);
INSERT INTO `tp_web_log_all` VALUES (28, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/saveOrder', 'admin', 'AdminGroup', 'saveorder', 'POST', 'a:1:{s:4:\"sort\";a:3:{i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}}', 1576464121);
INSERT INTO `tp_web_log_all` VALUES (29, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576464129);
INSERT INTO `tp_web_log_all` VALUES (30, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576464129);
INSERT INTO `tp_web_log_all` VALUES (31, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1576464129);
INSERT INTO `tp_web_log_all` VALUES (32, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1576464131);
INSERT INTO `tp_web_log_all` VALUES (33, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"3\";s:5:\"title\";s:12:\"用户列表\";s:4:\"name\";s:4:\"User\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1576464150);
INSERT INTO `tp_web_log_all` VALUES (34, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576464150);
INSERT INTO `tp_web_log_all` VALUES (35, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576464151);
INSERT INTO `tp_web_log_all` VALUES (36, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1576464151);
INSERT INTO `tp_web_log_all` VALUES (37, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576464178);
INSERT INTO `tp_web_log_all` VALUES (38, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576464178);
INSERT INTO `tp_web_log_all` VALUES (39, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', 1576464180);
INSERT INTO `tp_web_log_all` VALUES (40, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/index.html?table=tp_user', 'admin', 'Generate', 'index', 'GET', 'a:1:{s:5:\"table\";s:7:\"tp_user\";}', 1576464185);
INSERT INTO `tp_web_log_all` VALUES (41, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', 1576464245);
INSERT INTO `tp_web_log_all` VALUES (42, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/index.html?table=tp_user', 'admin', 'Generate', 'index', 'GET', 'a:1:{s:5:\"table\";s:7:\"tp_user\";}', 1576464249);
INSERT INTO `tp_web_log_all` VALUES (43, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:7:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:4:\"User\";s:5:\"title\";s:0:\"\";s:4:\"form\";a:5:{i:1;a:9:{s:5:\"title\";s:2:\"ID\";s:4:\"name\";s:2:\"id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:8:{s:5:\"title\";s:9:\"用户名\";s:4:\"name\";s:8:\"username\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:5;a:9:{s:5:\"title\";s:6:\"积分\";s:4:\"name\";s:6:\"amount\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:6;a:8:{s:5:\"title\";s:18:\"最后登陆时间\";s:4:\"name\";s:13:\"lastlogintime\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"date\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:7;a:9:{s:5:\"title\";s:12:\"注册时间\";s:4:\"name\";s:10:\"createTime\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"date\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:4:\"menu\";a:6:{i:0;s:3:\"add\";i:1;s:6:\"forbid\";i:2;s:6:\"resume\";i:3;s:6:\"delete\";i:4;s:10:\"recycleBin\";i:5;s:9:\"saveOrder\";}s:5:\"model\";s:1:\"1\";}', 1576464408);
INSERT INTO `tp_web_log_all` VALUES (44, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1576464410);
INSERT INTO `tp_web_log_all` VALUES (45, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576464415);
INSERT INTO `tp_web_log_all` VALUES (46, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576464415);
INSERT INTO `tp_web_log_all` VALUES (47, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1576464417);
INSERT INTO `tp_web_log_all` VALUES (48, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1576464447);
INSERT INTO `tp_web_log_all` VALUES (49, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', 1576464448);
INSERT INTO `tp_web_log_all` VALUES (50, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576464449);
INSERT INTO `tp_web_log_all` VALUES (51, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576464449);
INSERT INTO `tp_web_log_all` VALUES (52, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576465202);
INSERT INTO `tp_web_log_all` VALUES (53, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576465202);
INSERT INTO `tp_web_log_all` VALUES (54, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576465214);
INSERT INTO `tp_web_log_all` VALUES (55, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576465214);
INSERT INTO `tp_web_log_all` VALUES (56, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576465221);
INSERT INTO `tp_web_log_all` VALUES (57, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576465221);
INSERT INTO `tp_web_log_all` VALUES (58, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576465259);
INSERT INTO `tp_web_log_all` VALUES (59, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576465259);
INSERT INTO `tp_web_log_all` VALUES (60, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576465372);
INSERT INTO `tp_web_log_all` VALUES (61, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576465372);
INSERT INTO `tp_web_log_all` VALUES (62, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576465380);
INSERT INTO `tp_web_log_all` VALUES (63, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576465380);
INSERT INTO `tp_web_log_all` VALUES (64, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576465576);
INSERT INTO `tp_web_log_all` VALUES (65, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576465576);
INSERT INTO `tp_web_log_all` VALUES (66, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576483159);
INSERT INTO `tp_web_log_all` VALUES (67, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576483159);
INSERT INTO `tp_web_log_all` VALUES (68, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1576483159);
INSERT INTO `tp_web_log_all` VALUES (69, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"fmcx\";}', 1576483167);
INSERT INTO `tp_web_log_all` VALUES (70, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576483167);
INSERT INTO `tp_web_log_all` VALUES (71, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576483167);
INSERT INTO `tp_web_log_all` VALUES (72, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1576483175);
INSERT INTO `tp_web_log_all` VALUES (73, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', 1576483196);
INSERT INTO `tp_web_log_all` VALUES (74, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"网站配置\";s:4:\"icon\";s:12:\"&amp;#xe62e;\";s:4:\"sort\";s:1:\"4\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', 1576483241);
INSERT INTO `tp_web_log_all` VALUES (75, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1576483241);
INSERT INTO `tp_web_log_all` VALUES (76, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/saveOrder', 'admin', 'AdminGroup', 'saveorder', 'POST', 'a:1:{s:4:\"sort\";a:4:{i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";}}', 1576483247);
INSERT INTO `tp_web_log_all` VALUES (77, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', 1576484157);
INSERT INTO `tp_web_log_all` VALUES (78, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/index.html?table=tp_position', 'admin', 'Generate', 'index', 'GET', 'a:1:{s:5:\"table\";s:11:\"tp_position\";}', 1576484160);
INSERT INTO `tp_web_log_all` VALUES (79, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:6:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:8:\"Position\";s:5:\"title\";s:0:\"\";s:4:\"form\";a:2:{i:1;a:7:{s:5:\"title\";s:2:\"ID\";s:4:\"name\";s:2:\"id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:7:{s:5:\"title\";s:4:\"name\";s:4:\"name\";s:4:\"name\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:4:\"menu\";a:6:{i:0;s:3:\"add\";i:1;s:6:\"forbid\";i:2;s:6:\"resume\";i:3;s:6:\"delete\";i:4;s:10:\"recycleBin\";i:5;s:9:\"saveOrder\";}}', 1576484183);
INSERT INTO `tp_web_log_all` VALUES (80, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484184);
INSERT INTO `tp_web_log_all` VALUES (81, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576484191);
INSERT INTO `tp_web_log_all` VALUES (82, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576484191);
INSERT INTO `tp_web_log_all` VALUES (83, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1576484194);
INSERT INTO `tp_web_log_all` VALUES (84, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576484198);
INSERT INTO `tp_web_log_all` VALUES (85, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576484198);
INSERT INTO `tp_web_log_all` VALUES (86, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1576484198);
INSERT INTO `tp_web_log_all` VALUES (87, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1576484200);
INSERT INTO `tp_web_log_all` VALUES (88, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:9:\"推荐位\";s:4:\"name\";s:7:\"Postion\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', 1576484226);
INSERT INTO `tp_web_log_all` VALUES (89, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576484226);
INSERT INTO `tp_web_log_all` VALUES (90, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576484226);
INSERT INTO `tp_web_log_all` VALUES (91, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1576484226);
INSERT INTO `tp_web_log_all` VALUES (92, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576484229);
INSERT INTO `tp_web_log_all` VALUES (93, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576484229);
INSERT INTO `tp_web_log_all` VALUES (94, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576484241);
INSERT INTO `tp_web_log_all` VALUES (95, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576484241);
INSERT INTO `tp_web_log_all` VALUES (96, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1576484241);
INSERT INTO `tp_web_log_all` VALUES (97, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1576484244);
INSERT INTO `tp_web_log_all` VALUES (98, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/edit?id=64', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"64\";}', 1576484247);
INSERT INTO `tp_web_log_all` VALUES (99, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/edit', 'admin', 'AdminNode', 'edit', 'POST', 'a:9:{s:2:\"id\";s:2:\"64\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:9:\"推荐位\";s:4:\"name\";s:8:\"Position\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1576484255);
INSERT INTO `tp_web_log_all` VALUES (100, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576484255);
INSERT INTO `tp_web_log_all` VALUES (101, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576484255);
INSERT INTO `tp_web_log_all` VALUES (102, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', 1576484255);
INSERT INTO `tp_web_log_all` VALUES (103, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576484258);
INSERT INTO `tp_web_log_all` VALUES (104, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576484258);
INSERT INTO `tp_web_log_all` VALUES (105, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484259);
INSERT INTO `tp_web_log_all` VALUES (106, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'GET', 'a:0:{}', 1576484261);
INSERT INTO `tp_web_log_all` VALUES (107, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'POST', 'a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"精品任选\";}', 1576484295);
INSERT INTO `tp_web_log_all` VALUES (108, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484414);
INSERT INTO `tp_web_log_all` VALUES (109, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'GET', 'a:0:{}', 1576484429);
INSERT INTO `tp_web_log_all` VALUES (110, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'POST', 'a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"热卖推荐\";}', 1576484435);
INSERT INTO `tp_web_log_all` VALUES (111, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484435);
INSERT INTO `tp_web_log_all` VALUES (112, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'GET', 'a:0:{}', 1576484441);
INSERT INTO `tp_web_log_all` VALUES (113, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'POST', 'a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"每周上新\";}', 1576484445);
INSERT INTO `tp_web_log_all` VALUES (114, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484445);
INSERT INTO `tp_web_log_all` VALUES (115, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'GET', 'a:0:{}', 1576484461);
INSERT INTO `tp_web_log_all` VALUES (116, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'POST', 'a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"主题馆\";}', 1576484466);
INSERT INTO `tp_web_log_all` VALUES (117, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484466);
INSERT INTO `tp_web_log_all` VALUES (118, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'GET', 'a:0:{}', 1576484478);
INSERT INTO `tp_web_log_all` VALUES (119, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/add.html', 'admin', 'Position', 'add', 'POST', 'a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"猜你喜欢\";}', 1576484484);
INSERT INTO `tp_web_log_all` VALUES (120, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484484);
INSERT INTO `tp_web_log_all` VALUES (121, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484532);
INSERT INTO `tp_web_log_all` VALUES (122, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484532);
INSERT INTO `tp_web_log_all` VALUES (123, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484532);
INSERT INTO `tp_web_log_all` VALUES (124, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576484532);
INSERT INTO `tp_web_log_all` VALUES (125, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1576484593);
INSERT INTO `tp_web_log_all` VALUES (126, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576484595);
INSERT INTO `tp_web_log_all` VALUES (127, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576484595);
INSERT INTO `tp_web_log_all` VALUES (128, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1576484595);
INSERT INTO `tp_web_log_all` VALUES (129, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1576484596);
INSERT INTO `tp_web_log_all` VALUES (130, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:9:\"轮播图\";s:4:\"name\";s:6:\"Banner\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"1\";}', 1576484610);
INSERT INTO `tp_web_log_all` VALUES (131, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1576484610);
INSERT INTO `tp_web_log_all` VALUES (132, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1576484610);
INSERT INTO `tp_web_log_all` VALUES (133, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1576484610);
INSERT INTO `tp_web_log_all` VALUES (134, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', 1576484612);
INSERT INTO `tp_web_log_all` VALUES (135, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:10:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:6:\"Banner\";s:5:\"title\";s:0:\"\";s:4:\"form\";a:4:{i:0;a:7:{s:5:\"title\";s:2:\"id\";s:4:\"name\";s:2:\"id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:1;a:7:{s:5:\"title\";s:6:\"banner\";s:4:\"name\";s:6:\"banner\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:7:{s:5:\"title\";s:6:\"位置\";s:4:\"name\";s:8:\"position\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:3;a:7:{s:5:\"title\";s:6:\"地址\";s:4:\"name\";s:3:\"url\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:12:\"create_table\";s:1:\"1\";s:12:\"table_engine\";s:6:\"InnoDB\";s:10:\"table_name\";s:0:\"\";s:5:\"field\";a:4:{i:1;a:7:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:7:\"default\";s:4:\"NULL\";s:8:\"not_null\";s:1:\"1\";s:3:\"key\";s:1:\"1\";s:7:\"comment\";s:2:\"id\";s:5:\"extra\";s:0:\"\";}i:2;a:6:{s:4:\"name\";s:6:\"banner\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:8:\"not_null\";s:1:\"1\";s:7:\"comment\";s:6:\"banner\";s:5:\"extra\";s:0:\"\";}i:3;a:5:{s:4:\"name\";s:8:\"position\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:7:\"comment\";s:6:\"位置\";s:5:\"extra\";s:0:\"\";}i:4;a:5:{s:4:\"name\";s:3:\"url\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:7:\"comment\";s:6:\"地址\";s:5:\"extra\";s:0:\"\";}}s:4:\"menu\";a:6:{i:0;s:3:\"add\";i:1;s:6:\"forbid\";i:2;s:6:\"resume\";i:3;s:6:\"delete\";i:4;s:10:\"recycleBin\";i:5;s:9:\"saveOrder\";}}', 1576484716);
INSERT INTO `tp_web_log_all` VALUES (136, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576484717);
INSERT INTO `tp_web_log_all` VALUES (137, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:10:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:6:\"Banner\";s:5:\"title\";s:0:\"\";s:4:\"form\";a:4:{i:0;a:7:{s:5:\"title\";s:2:\"id\";s:4:\"name\";s:2:\"id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:1;a:7:{s:5:\"title\";s:6:\"banner\";s:4:\"name\";s:6:\"banner\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:7:{s:5:\"title\";s:6:\"位置\";s:4:\"name\";s:8:\"position\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:3;a:7:{s:5:\"title\";s:6:\"地址\";s:4:\"name\";s:3:\"url\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:12:\"create_table\";s:1:\"1\";s:12:\"table_engine\";s:6:\"InnoDB\";s:10:\"table_name\";s:0:\"\";s:5:\"field\";a:4:{i:1;a:7:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:7:\"default\";s:4:\"NULL\";s:8:\"not_null\";s:1:\"1\";s:3:\"key\";s:1:\"1\";s:7:\"comment\";s:2:\"id\";s:5:\"extra\";s:0:\"\";}i:2;a:6:{s:4:\"name\";s:6:\"banner\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:8:\"not_null\";s:1:\"1\";s:7:\"comment\";s:6:\"banner\";s:5:\"extra\";s:0:\"\";}i:3;a:5:{s:4:\"name\";s:8:\"position\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:7:\"comment\";s:6:\"位置\";s:5:\"extra\";s:0:\"\";}i:4;a:5:{s:4:\"name\";s:3:\"url\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:7:\"comment\";s:6:\"地址\";s:5:\"extra\";s:0:\"\";}}s:4:\"menu\";a:6:{i:0;s:3:\"add\";i:1;s:6:\"forbid\";i:2;s:6:\"resume\";i:3;s:6:\"delete\";i:4;s:10:\"recycleBin\";i:5;s:9:\"saveOrder\";}}', 1576484754);
INSERT INTO `tp_web_log_all` VALUES (138, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576484756);
INSERT INTO `tp_web_log_all` VALUES (139, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576484761);
INSERT INTO `tp_web_log_all` VALUES (140, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576484761);
INSERT INTO `tp_web_log_all` VALUES (141, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576484763);
INSERT INTO `tp_web_log_all` VALUES (142, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576484776);
INSERT INTO `tp_web_log_all` VALUES (143, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576484777);
INSERT INTO `tp_web_log_all` VALUES (144, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576484777);
INSERT INTO `tp_web_log_all` VALUES (145, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576484777);
INSERT INTO `tp_web_log_all` VALUES (146, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/demo/imageupload.html', 'admin', 'Demo', 'imageupload', 'GET', 'a:0:{}', 1576486214);
INSERT INTO `tp_web_log_all` VALUES (147, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486216);
INSERT INTO `tp_web_log_all` VALUES (148, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486228);
INSERT INTO `tp_web_log_all` VALUES (149, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/demo/imageupload.html', 'admin', 'Demo', 'imageupload', 'GET', 'a:0:{}', 1576486261);
INSERT INTO `tp_web_log_all` VALUES (150, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486264);
INSERT INTO `tp_web_log_all` VALUES (151, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/listimage.html', 'admin', 'Upload', 'listimage', 'POST', 'a:2:{s:1:\"p\";s:1:\"1\";s:5:\"count\";s:1:\"1\";}', 1576486267);
INSERT INTO `tp_web_log_all` VALUES (152, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/demo/imageupload.html', 'admin', 'Demo', 'imageupload', 'GET', 'a:0:{}', 1576486277);
INSERT INTO `tp_web_log_all` VALUES (153, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1576486375);
INSERT INTO `tp_web_log_all` VALUES (154, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1576486375);
INSERT INTO `tp_web_log_all` VALUES (155, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576486377);
INSERT INTO `tp_web_log_all` VALUES (156, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576486377);
INSERT INTO `tp_web_log_all` VALUES (157, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486384);
INSERT INTO `tp_web_log_all` VALUES (158, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486388);
INSERT INTO `tp_web_log_all` VALUES (159, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576486410);
INSERT INTO `tp_web_log_all` VALUES (160, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486412);
INSERT INTO `tp_web_log_all` VALUES (161, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486415);
INSERT INTO `tp_web_log_all` VALUES (162, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576486561);
INSERT INTO `tp_web_log_all` VALUES (163, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576486564);
INSERT INTO `tp_web_log_all` VALUES (164, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486565);
INSERT INTO `tp_web_log_all` VALUES (165, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486569);
INSERT INTO `tp_web_log_all` VALUES (166, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486579);
INSERT INTO `tp_web_log_all` VALUES (167, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486580);
INSERT INTO `tp_web_log_all` VALUES (168, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486583);
INSERT INTO `tp_web_log_all` VALUES (169, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486597);
INSERT INTO `tp_web_log_all` VALUES (170, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486600);
INSERT INTO `tp_web_log_all` VALUES (171, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486620);
INSERT INTO `tp_web_log_all` VALUES (172, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486624);
INSERT INTO `tp_web_log_all` VALUES (173, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486630);
INSERT INTO `tp_web_log_all` VALUES (174, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486673);
INSERT INTO `tp_web_log_all` VALUES (175, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486676);
INSERT INTO `tp_web_log_all` VALUES (176, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486761);
INSERT INTO `tp_web_log_all` VALUES (177, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486766);
INSERT INTO `tp_web_log_all` VALUES (178, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486865);
INSERT INTO `tp_web_log_all` VALUES (179, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486866);
INSERT INTO `tp_web_log_all` VALUES (180, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486866);
INSERT INTO `tp_web_log_all` VALUES (181, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576486868);
INSERT INTO `tp_web_log_all` VALUES (182, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486870);
INSERT INTO `tp_web_log_all` VALUES (183, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486877);
INSERT INTO `tp_web_log_all` VALUES (184, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576486889);
INSERT INTO `tp_web_log_all` VALUES (185, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576486894);
INSERT INTO `tp_web_log_all` VALUES (186, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576487089);
INSERT INTO `tp_web_log_all` VALUES (187, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576487095);
INSERT INTO `tp_web_log_all` VALUES (188, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576487098);
INSERT INTO `tp_web_log_all` VALUES (189, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'POST', 'a:4:{s:2:\"id\";s:0:\"\";s:6:\"banner\";s:65:\"/public/tmp/uploads/20191216\\aabb92d85d6f3686c31b5f32b3483a15.jpg\";s:8:\"position\";s:0:\"\";s:3:\"url\";s:0:\"\";}', 1576487110);
INSERT INTO `tp_web_log_all` VALUES (190, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487110);
INSERT INTO `tp_web_log_all` VALUES (191, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487156);
INSERT INTO `tp_web_log_all` VALUES (192, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487179);
INSERT INTO `tp_web_log_all` VALUES (193, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487180);
INSERT INTO `tp_web_log_all` VALUES (194, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487180);
INSERT INTO `tp_web_log_all` VALUES (195, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487180);
INSERT INTO `tp_web_log_all` VALUES (196, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487180);
INSERT INTO `tp_web_log_all` VALUES (197, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487180);
INSERT INTO `tp_web_log_all` VALUES (198, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487296);
INSERT INTO `tp_web_log_all` VALUES (199, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487311);
INSERT INTO `tp_web_log_all` VALUES (200, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576487658);
INSERT INTO `tp_web_log_all` VALUES (201, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576487886);
INSERT INTO `tp_web_log_all` VALUES (202, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488013);
INSERT INTO `tp_web_log_all` VALUES (203, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488014);
INSERT INTO `tp_web_log_all` VALUES (204, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488014);
INSERT INTO `tp_web_log_all` VALUES (205, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488015);
INSERT INTO `tp_web_log_all` VALUES (206, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488059);
INSERT INTO `tp_web_log_all` VALUES (207, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488060);
INSERT INTO `tp_web_log_all` VALUES (208, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488060);
INSERT INTO `tp_web_log_all` VALUES (209, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488171);
INSERT INTO `tp_web_log_all` VALUES (210, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488172);
INSERT INTO `tp_web_log_all` VALUES (211, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488176);
INSERT INTO `tp_web_log_all` VALUES (212, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488292);
INSERT INTO `tp_web_log_all` VALUES (213, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488293);
INSERT INTO `tp_web_log_all` VALUES (214, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488293);
INSERT INTO `tp_web_log_all` VALUES (215, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488401);
INSERT INTO `tp_web_log_all` VALUES (216, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488428);
INSERT INTO `tp_web_log_all` VALUES (217, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488429);
INSERT INTO `tp_web_log_all` VALUES (218, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488429);
INSERT INTO `tp_web_log_all` VALUES (219, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488430);
INSERT INTO `tp_web_log_all` VALUES (220, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488433);
INSERT INTO `tp_web_log_all` VALUES (221, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576488436);
INSERT INTO `tp_web_log_all` VALUES (222, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576488440);
INSERT INTO `tp_web_log_all` VALUES (223, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488450);
INSERT INTO `tp_web_log_all` VALUES (224, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488461);
INSERT INTO `tp_web_log_all` VALUES (225, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', 1576488462);
INSERT INTO `tp_web_log_all` VALUES (226, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1576488463);
INSERT INTO `tp_web_log_all` VALUES (227, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', 1576488466);
INSERT INTO `tp_web_log_all` VALUES (228, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/add.html', 'admin', 'Banner', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:6:\"banner\";s:65:\"/public/tmp/uploads/20191216\\56cb3f00332b72dd66e299ca084b2d3a.jpg\";s:5:\"posid\";s:1:\"1\";s:8:\"position\";s:0:\"\";s:3:\"url\";s:0:\"\";}', 1576488470);
INSERT INTO `tp_web_log_all` VALUES (229, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488471);
INSERT INTO `tp_web_log_all` VALUES (230, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/2.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"2\";}', 1576488474);
INSERT INTO `tp_web_log_all` VALUES (231, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488505);
INSERT INTO `tp_web_log_all` VALUES (232, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/delete.html', 'admin', 'Position', 'delete', 'POST', 'a:1:{s:2:\"id\";s:7:\"5,4,3,2\";}', 1576488516);
INSERT INTO `tp_web_log_all` VALUES (233, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488516);
INSERT INTO `tp_web_log_all` VALUES (234, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/recyclebin.html', 'admin', 'Position', 'recyclebin', 'GET', 'a:0:{}', 1576488517);
INSERT INTO `tp_web_log_all` VALUES (235, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/recyclebin.html', 'admin', 'Position', 'recyclebin', 'GET', 'a:0:{}', 1576488517);
INSERT INTO `tp_web_log_all` VALUES (236, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/deleteforever.html', 'admin', 'Position', 'deleteforever', 'POST', 'a:1:{s:2:\"id\";s:7:\"5,4,3,2\";}', 1576488521);
INSERT INTO `tp_web_log_all` VALUES (237, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/recyclebin.html', 'admin', 'Position', 'recyclebin', 'GET', 'a:0:{}', 1576488521);
INSERT INTO `tp_web_log_all` VALUES (238, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488523);
INSERT INTO `tp_web_log_all` VALUES (239, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/edit/id/1.html', 'admin', 'Position', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488525);
INSERT INTO `tp_web_log_all` VALUES (240, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/edit/id/1.html', 'admin', 'Position', 'edit', 'POST', 'a:2:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"首页\";}', 1576488539);
INSERT INTO `tp_web_log_all` VALUES (241, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488539);
INSERT INTO `tp_web_log_all` VALUES (242, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/edit/id/1.html', 'admin', 'Position', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488548);
INSERT INTO `tp_web_log_all` VALUES (243, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/edit/id/1.html', 'admin', 'Position', 'edit', 'POST', 'a:2:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:12:\"首页推荐\";}', 1576488551);
INSERT INTO `tp_web_log_all` VALUES (244, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488551);
INSERT INTO `tp_web_log_all` VALUES (245, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488553);
INSERT INTO `tp_web_log_all` VALUES (246, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488553);
INSERT INTO `tp_web_log_all` VALUES (247, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488553);
INSERT INTO `tp_web_log_all` VALUES (248, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488555);
INSERT INTO `tp_web_log_all` VALUES (249, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488555);
INSERT INTO `tp_web_log_all` VALUES (250, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/2.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"2\";}', 1576488557);
INSERT INTO `tp_web_log_all` VALUES (251, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/edit/id/1.html', 'admin', 'Banner', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1576488560);
INSERT INTO `tp_web_log_all` VALUES (252, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488563);
INSERT INTO `tp_web_log_all` VALUES (253, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488563);
INSERT INTO `tp_web_log_all` VALUES (254, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488563);
INSERT INTO `tp_web_log_all` VALUES (255, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488564);
INSERT INTO `tp_web_log_all` VALUES (256, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488567);
INSERT INTO `tp_web_log_all` VALUES (257, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488568);
INSERT INTO `tp_web_log_all` VALUES (258, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488568);
INSERT INTO `tp_web_log_all` VALUES (259, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488568);
INSERT INTO `tp_web_log_all` VALUES (260, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488568);
INSERT INTO `tp_web_log_all` VALUES (261, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488569);
INSERT INTO `tp_web_log_all` VALUES (262, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488569);
INSERT INTO `tp_web_log_all` VALUES (263, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488569);
INSERT INTO `tp_web_log_all` VALUES (264, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488570);
INSERT INTO `tp_web_log_all` VALUES (265, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488570);
INSERT INTO `tp_web_log_all` VALUES (266, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/position/index.html', 'admin', 'Position', 'index', 'GET', 'a:0:{}', 1576488571);
INSERT INTO `tp_web_log_all` VALUES (267, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488571);
INSERT INTO `tp_web_log_all` VALUES (268, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(77.0.3865.90)', 'http://shop.vip/public/index.php/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', 1576488572);

SET FOREIGN_KEY_CHECKS = 1;
