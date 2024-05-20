/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : xm-foods

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 08/01/2024 13:01:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/1697438073596-avatar.png', 'ADMIN', '13677889922', 'admin@xm.com');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '大类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜谱分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '红烧肉', '家常菜');
INSERT INTO `category` VALUES (2, '糖醋排骨', '家常菜');
INSERT INTO `category` VALUES (3, '青椒肉丝', '家常菜');
INSERT INTO `category` VALUES (4, '蘑菇炒肉', '家常菜');
INSERT INTO `category` VALUES (5, '红烧鸡块', '家常菜');
INSERT INTO `category` VALUES (6, '土豆烧牛腩', '家常菜');
INSERT INTO `category` VALUES (7, '麻辣鸡翅', '下饭菜');
INSERT INTO `category` VALUES (8, '麻婆豆腐', '下饭菜');
INSERT INTO `category` VALUES (9, '麻辣小龙虾', '下饭菜');
INSERT INTO `category` VALUES (10, '酸菜鱼', '下饭菜');
INSERT INTO `category` VALUES (11, '沙拉', '减肥轻食');
INSERT INTO `category` VALUES (12, '芹菜', '减肥轻食');
INSERT INTO `category` VALUES (13, '红烧排骨', '家常菜');
INSERT INTO `category` VALUES (14, '面食', '主食');
INSERT INTO `category` VALUES (15, '粥面', '主食');
INSERT INTO `category` VALUES (16, '炒饭', '主食');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `fid` int(11) NULL DEFAULT NULL COMMENT '关联ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '收藏人ID',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模块',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收藏' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (7, 10, 2, '笔记');
INSERT INTO `collect` VALUES (8, 12, 2, '笔记');
INSERT INTO `collect` VALUES (11, 7, 2, '菜谱');
INSERT INTO `collect` VALUES (13, 14, 3, '笔记');
INSERT INTO `collect` VALUES (14, 1, 7, '菜谱');
INSERT INTO `collect` VALUES (15, 14, 7, '笔记');
INSERT INTO `collect` VALUES (16, 8, 7, '笔记');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '评论人',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论时间',
  `fid` int(11) NULL DEFAULT NULL COMMENT '关联ID',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模块',
  `root_id` int(11) NULL DEFAULT NULL COMMENT '根节点ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (34, '1111', 2, NULL, '2024-01-04 10:13:12', 10, '笔记', 34);
INSERT INTO `comment` VALUES (35, '33333', 2, 34, '2024-01-04 10:13:15', 10, '笔记', 34);
INSERT INTO `comment` VALUES (36, '4444', 2, 35, '2024-01-04 10:13:19', 10, '笔记', 34);
INSERT INTO `comment` VALUES (37, '1111111', 2, NULL, '2024-01-04 10:15:11', 8, '菜谱', 37);
INSERT INTO `comment` VALUES (38, '22222', 2, 37, '2024-01-04 10:15:13', 8, '菜谱', 37);
INSERT INTO `comment` VALUES (39, '33333', 2, 38, '2024-01-04 10:15:16', 8, '菜谱', 37);
INSERT INTO `comment` VALUES (40, '44444', 2, 38, '2024-01-04 10:15:19', 8, '菜谱', 37);
INSERT INTO `comment` VALUES (41, '6666', 3, 39, '2024-01-04 10:15:33', 8, '菜谱', 37);
INSERT INTO `comment` VALUES (42, '77777', 3, 40, '2024-01-04 10:15:36', 8, '菜谱', 37);
INSERT INTO `comment` VALUES (43, '9999999', 2, 41, '2024-01-04 10:16:38', 8, '菜谱', 37);
INSERT INTO `comment` VALUES (44, '9999000000000', 2, 42, '2024-01-04 10:16:48', 8, '菜谱', 37);
INSERT INTO `comment` VALUES (45, '77777', 2, 36, '2024-01-04 10:17:18', 10, '笔记', 34);
INSERT INTO `comment` VALUES (46, '1111', 2, NULL, '2024-01-08 11:12:30', 10, '菜谱', 46);
INSERT INTO `comment` VALUES (47, '这是我新来的评论', 7, NULL, '2024-01-08 12:49:05', 10, '菜谱', 47);
INSERT INTO `comment` VALUES (50, '222222', 7, NULL, '2024-01-08 12:49:28', 14, '笔记', 50);

-- ----------------------------
-- Table structure for foods
-- ----------------------------
DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简介',
  `skills` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '技巧',
  `material` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '用料',
  `steps` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '做法',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '作者ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上传时间',
  `count` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '待审核' COMMENT '发布状态',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜谱信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES (1, '红烧排骨1', 'https://cp1.douguo.com/upload/caiku/c/7/1/690x390_c771e79cf28e205344fa426383a7c311.jpg', '生命里最大的修行/就是饥来餐饭倦来眠/因为食物/知道灵魂的去处—山亭夜宴《唯爱与美食不可辜负》', '红烧排骨需要大火烹制', '[{\"name\": \"猪肋排\", \"value\": \"400克\"}, {\"name\": \"姜\", \"value\": \"三片\"}, {\"name\": \"八角\", \"value\": \"2-3个\"}]', '[{\"img\": \"https://cp1.douguo.com/upload/caiku/6/c/c/200_6c1bad0fc9c3cb2187f5ebe6f4b60e6c.jpg\", \"text\": \"捞起肋排用温水冲洗干净，沥干水分，备用。\"}, {\"img\": \"https://cp1.douguo.com/upload/caiku/3/8/1/200_384b7dc35c593b6a73574b2509e1fa71.jpg\", \"text\": \"将肋排倒入锅中，翻炒至每块排骨都均匀裹上糖色。\"}]', 2, '2024-01-01 10:30:00', 23, '审核通过', '红烧排骨');
INSERT INTO `foods` VALUES (4, '红烧排骨2', 'https://cp1.douguo.com/upload/caiku/c/7/1/690x390_c771e79cf28e205344fa426383a7c311.jpg', '生命里最大的修行/就是饥来餐饭倦来眠/因为食物/知道灵魂的去处—山亭夜宴《唯爱与美食不可辜负》', '红烧排骨需要大火烹制', '[{\"name\": \"猪肋排\", \"value\": \"400克\"}, {\"name\": \"姜\", \"value\": \"三片\"}, {\"name\": \"八角\", \"value\": \"2-3个\"}]', '[{\"img\": \"https://cp1.douguo.com/upload/caiku/6/c/c/200_6c1bad0fc9c3cb2187f5ebe6f4b60e6c.jpg\", \"text\": \"捞起肋排用温水冲洗干净，沥干水分，备用。\"}, {\"img\": \"https://cp1.douguo.com/upload/caiku/3/8/1/200_384b7dc35c593b6a73574b2509e1fa71.jpg\", \"text\": \"将肋排倒入锅中，翻炒至每块排骨都均匀裹上糖色。\"}]', 2, '2024-01-02 10:30:00', 14, '审核通过', '红烧排骨');
INSERT INTO `foods` VALUES (6, '红烧排骨4', 'https://cp1.douguo.com/upload/caiku/c/7/1/690x390_c771e79cf28e205344fa426383a7c311.jpg', '生命里最大的修行/就是饥来餐饭倦来眠/因为食物/知道灵魂的去处—山亭夜宴《唯爱与美食不可辜负》', '红烧排骨需要大火烹制', '[{\"name\": \"猪肋排\", \"value\": \"400克\"}, {\"name\": \"姜\", \"value\": \"三片\"}, {\"name\": \"八角\", \"value\": \"2-3个\"}]', '[{\"img\": \"https://cp1.douguo.com/upload/caiku/6/c/c/200_6c1bad0fc9c3cb2187f5ebe6f4b60e6c.jpg\", \"text\": \"捞起肋排用温水冲洗干净，沥干水分，备用。\"}, {\"img\": \"https://cp1.douguo.com/upload/caiku/3/8/1/200_384b7dc35c593b6a73574b2509e1fa71.jpg\", \"text\": \"将肋排倒入锅中，翻炒至每块排骨都均匀裹上糖色。\"}]', 3, '2024-01-03 10:30:00', 130, '审核通过', '红烧排骨');
INSERT INTO `foods` VALUES (7, '红烧排骨5', 'https://cp1.douguo.com/upload/caiku/c/7/1/690x390_c771e79cf28e205344fa426383a7c311.jpg', '生命里最大的修行/就是饥来餐饭倦来眠/因为食物/知道灵魂的去处—山亭夜宴《唯爱与美食不可辜负》', '红烧排骨需要大火烹制', '[{\"name\": \"猪肋排\", \"value\": \"400克\"}, {\"name\": \"姜\", \"value\": \"三片\"}, {\"name\": \"八角\", \"value\": \"2-3个\"}]', '[{\"img\": \"https://cp1.douguo.com/upload/caiku/6/c/c/200_6c1bad0fc9c3cb2187f5ebe6f4b60e6c.jpg\", \"text\": \"捞起肋排用温水冲洗干净，沥干水分，备用。\"}, {\"img\": \"https://cp1.douguo.com/upload/caiku/3/8/1/200_384b7dc35c593b6a73574b2509e1fa71.jpg\", \"text\": \"将肋排倒入锅中，翻炒至每块排骨都均匀裹上糖色。\"}]', 3, '2024-01-04 10:30:00', 11, '审核通过', '红烧肉');
INSERT INTO `foods` VALUES (8, '红烧排骨6', 'https://cp1.douguo.com/upload/caiku/c/7/1/690x390_c771e79cf28e205344fa426383a7c311.jpg', '我爱吃竹笋，表妹爱吃百叶结，小时候因为我跟着爸妈在西北生活，难得放假回江南，外婆恨不得把江南所有好吃的都让我尝遍，为了同时满足我和表妹的喜好，我们家的红烧肉永远都有笋干和百叶结', '红烧排骨需要大火烹制', '[{\"name\": \"猪肋排\", \"value\": \"400克\"}, {\"name\": \"姜\", \"value\": \"三片\"}, {\"name\": \"八角\", \"value\": \"2-3个\"}, {\"name\": \"八角\", \"value\": \"2-3个\"}, {\"name\": \"八角\", \"value\": \"2-3个\"}]', '[{\"img\": \"https://cp1.douguo.com/upload/caiku/6/c/c/200_6c1bad0fc9c3cb2187f5ebe6f4b60e6c.jpg\", \"text\": \"捞起肋排用温水冲洗干净，沥干水分，备用。\"}, {\"img\": \"https://cp1.douguo.com/upload/caiku/3/8/1/200_384b7dc35c593b6a73574b2509e1fa71.jpg\", \"text\": \"将肋排倒入锅中，翻炒至每块排骨都均匀裹上糖色。\"}]', 3, '2024-01-04 10:30:00', 220, '审核通过', '红烧排骨');
INSERT INTO `foods` VALUES (10, '香蕉芝士派', 'http://localhost:9090/files/1704681391594-3.jpeg', '好吃好吃好吃，还超级简单，赶紧做起来！安佳马苏里拉是原制干酪，无添加，安全健康又美味！', '没有技巧，全是感情', '[{\"name\":\"白芝麻\",\"value\":\"适量\"},{\"name\":\"香蕉\",\"value\":\"适量\"},{\"name\":\"鸡蛋液\",\"value\":\"适量\"}]', '[{\"img\":\"http://localhost:9090/files/1704681429849-1.jpeg\",\"text\":\"\",\"value\":\"拿一块手抓饼，把香蕉捣烂铺平\"},{\"img\":\"http://localhost:9090/files/1704681437319-2.jpeg\",\"text\":\"\",\"value\":\"涂上鸡蛋液，撒上白芝麻\"},{\"img\":\"http://localhost:9090/files/1704681949016-3.jpeg\",\"text\":\"\",\"value\":\"看这个拉丝，好吃！\"}]', 2, '2024-01-06 10:30:00', 3, '审核通过', '面食');
INSERT INTO `foods` VALUES (11, '11', 'http://localhost:9090/files/1704682188205-微信截图_20240108103846.png', '11', '111', '[{\"name\":\"11\",\"value\":\"11\"}]', '[{\"img\":\"http://localhost:9090/files/1704682183879-微信截图_20240108103846.png\",\"text\":\"\",\"value\":\"22\"}]', 2, '2024-01-08 10:49:54', 0, '待审核', '炒饭');
INSERT INTO `foods` VALUES (12, '222', 'http://localhost:9090/files/1704682291229-微信截图_20240108103846.png', '222', '22', '[{\"name\":\"333\",\"value\":\"333\"}]', '[{\"img\":\"http://localhost:9090/files/1704682297925-3.jpeg\",\"text\":\"\",\"value\":\"455555\"}]', 2, '2024-01-08 10:51:55', 0, '待审核', '炒饭');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简介',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位',
  `store` int(11) NULL DEFAULT NULL COMMENT '库存',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发货地址',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '详情',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上架日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '青源禾谷 养生杂粮吉林吉安圆糯米', '粗粮膳食，农家优选！', 'http://localhost:9090/files/1703822490130-448_4761ff99ed6a34a5c190566282384048.jpg', 39.00, '袋', 2000, '安徽合肥', '<p><img src=\"https://i1.douguo.com/upload/tuan/c/f/a/650e172fc2bc18860ef33a3d2c47dbf6.jpg\"/><img src=\"http://localhost:9090/files/1703822538653-image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><br/>', NULL);
INSERT INTO `goods` VALUES (2, '农夫日记黑龙江长粒香大米', '农夫日记黑龙江长粒香大米5斤装', 'http://localhost:9090/files/1703822677800-448_fa4c3e6f39a0763045a1780f16aa3b38.jpg', 29.90, '袋', 1000, '安徽合肥', '<p><img src=\"https://i1.douguo.com//upload/tuan/c/f/a/aaed9d5a027938db7caadb950dd33246.jpg\"/><img src=\"http://localhost:9090/files/1703822704863-image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><br/>', '2023-12-29');
INSERT INTO `goods` VALUES (5, '青源禾谷 养生杂粮吉林吉安圆糯米', '粗粮膳食，农家优选！', 'http://localhost:9090/files/1703822490130-448_4761ff99ed6a34a5c190566282384048.jpg', 39.00, '袋', 2000, '安徽合肥', '<p><img src=\"https://i1.douguo.com/upload/tuan/c/f/a/650e172fc2bc18860ef33a3d2c47dbf6.jpg\"/><img src=\"http://localhost:9090/files/1703822538653-image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><br/>', NULL);
INSERT INTO `goods` VALUES (6, '农夫日记黑龙江长粒香大米', '农夫日记黑龙江长粒香大米5斤装', 'http://localhost:9090/files/1703822677800-448_fa4c3e6f39a0763045a1780f16aa3b38.jpg', 29.90, '袋', 1000, '安徽合肥', '<p><img src=\"https://i1.douguo.com//upload/tuan/c/f/a/aaed9d5a027938db7caadb950dd33246.jpg\"/><img src=\"http://localhost:9090/files/1703822704863-image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><br/>', '2023-12-29');
INSERT INTO `goods` VALUES (7, '青源禾谷 养生杂粮吉林吉安圆糯米', '粗粮膳食，农家优选！', 'http://localhost:9090/files/1703822490130-448_4761ff99ed6a34a5c190566282384048.jpg', 39.00, '袋', 2000, '安徽合肥', '<p><img src=\"https://i1.douguo.com/upload/tuan/c/f/a/650e172fc2bc18860ef33a3d2c47dbf6.jpg\"/><img src=\"http://localhost:9090/files/1703822538653-image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><br/>', NULL);
INSERT INTO `goods` VALUES (8, '农夫日记黑龙江长粒香大米', '农夫日记黑龙江长粒香大米5斤装', 'http://localhost:9090/files/1703822677800-448_fa4c3e6f39a0763045a1780f16aa3b38.jpg', 29.90, '袋', 999, '安徽合肥', '<p><img src=\"https://i1.douguo.com//upload/tuan/c/f/a/aaed9d5a027938db7caadb950dd33246.jpg\"/><img src=\"http://localhost:9090/files/1703822704863-image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><br/>', '2023-12-29');
INSERT INTO `goods` VALUES (9, '青源禾谷 养生杂粮吉林吉安圆糯米', '粗粮膳食，农家优选！', 'http://localhost:9090/files/1703822490130-448_4761ff99ed6a34a5c190566282384048.jpg', 39.00, '袋', 2000, '安徽合肥', '<p><img src=\"https://i1.douguo.com/upload/tuan/c/f/a/650e172fc2bc18860ef33a3d2c47dbf6.jpg\"/><img src=\"http://localhost:9090/files/1703822538653-image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><br/>', NULL);
INSERT INTO `goods` VALUES (10, '农夫日记黑龙江长粒香大米', '农夫日记黑龙江长粒香大米5斤装', 'http://localhost:9090/files/1703822677800-448_fa4c3e6f39a0763045a1780f16aa3b38.jpg', 29.90, '袋', 1000, '安徽合肥', '<p><img src=\"https://i1.douguo.com//upload/tuan/c/f/a/aaed9d5a027938db7caadb950dd33246.jpg\"/><img src=\"http://localhost:9090/files/1703822704863-image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><br/>', '2023-12-29');
INSERT INTO `goods` VALUES (11, '青源禾谷 养生杂粮吉林吉安圆糯米', '粗粮膳食，农家优选！', 'http://localhost:9090/files/1703822490130-448_4761ff99ed6a34a5c190566282384048.jpg', 39.00, '袋', 1999, '安徽合肥', '<p><img src=\"https://i1.douguo.com/upload/tuan/c/f/a/650e172fc2bc18860ef33a3d2c47dbf6.jpg\"/><img src=\"http://localhost:9090/files/1703822538653-image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><br/>', NULL);
INSERT INTO `goods` VALUES (12, '农夫日记黑龙江长粒香大米', '农夫日记黑龙江长粒香大米5斤装', 'http://localhost:9090/files/1703822677800-448_fa4c3e6f39a0763045a1780f16aa3b38.jpg', 29.90, '袋', 999, '安徽合肥', '<p><img src=\"https://i1.douguo.com//upload/tuan/c/f/a/aaed9d5a027938db7caadb950dd33246.jpg\"/><img src=\"http://localhost:9090/files/1703822704863-image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><br/>', '2023-12-29');
INSERT INTO `goods` VALUES (13, '青源禾谷 养生杂粮吉林吉安圆糯米', '粗粮膳食，农家优选！', 'http://localhost:9090/files/1703822490130-448_4761ff99ed6a34a5c190566282384048.jpg', 39.00, '袋', 1999, '安徽合肥', '<p><img src=\"https://i1.douguo.com/upload/tuan/c/f/a/650e172fc2bc18860ef33a3d2c47dbf6.jpg\"/><img src=\"http://localhost:9090/files/1703822538653-image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><br/>', NULL);
INSERT INTO `goods` VALUES (14, '农夫日记黑龙江长粒香大米', '农夫日记黑龙江长粒香大米5斤装', 'http://localhost:9090/files/1703822677800-448_fa4c3e6f39a0763045a1780f16aa3b38.jpg', 29.90, '袋', 996, '安徽合肥', '<p style=\"text-align:center;\"><img src=\"https://i1.douguo.com//upload/tuan/c/f/a/aaed9d5a027938db7caadb950dd33246.jpg\"/><img src=\"http://localhost:9090/files/1703822704863-image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><br/>', '2023-12-29');

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `fid` int(11) NULL DEFAULT NULL COMMENT '关联ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '点赞人ID',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模块',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '点赞' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES (6, 10, 2, '笔记');
INSERT INTO `likes` VALUES (7, 12, 2, '笔记');
INSERT INTO `likes` VALUES (10, 14, 7, '笔记');
INSERT INTO `likes` VALUES (11, 10, 7, '笔记');
INSERT INTO `likes` VALUES (12, 8, 7, '笔记');

-- ----------------------------
-- Table structure for notebook
-- ----------------------------
DROP TABLE IF EXISTS `notebook`;
CREATE TABLE `notebook`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `count` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布日期',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '待审核' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '美食笔记' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notebook
-- ----------------------------
INSERT INTO `notebook` VALUES (1, '非常Nice的一天1', 'https://cp1.douguo.com/upload/note/d/8/1/750_d8020377707b3d9ebb38df0d92a835e1.jpeg', '车厘子可可松饼塔是一道将新鲜车厘子的酸甜与奶油的丝滑相结合的美食。精选的车厘子鲜红如血，充满了浓郁的果香，而雀巢淡奶油的香气和口感为味蕾带来了绝佳的享受。松软的饼底融合了黄油的香气还加入了可可粉，不甜不腻，车厘子作为点缀更加诱人动人。咬下一口，外脆内软的口感和浓烈的车厘子汁液交织在一起，仿佛置身于甜蜜果园。无论是与亲友分享还是独自享用，车厘子可可松饼塔都能带给你满满的幸福感。雀巢淡奶油的加入为其平添了细腻与柔美。在这个车厘子盛产的季节，让我们尽情享受丝滑和甜蜜的美好，沉浸在这场味觉盛宴中，用舌尖感受雀巢淡奶油和车厘子的完美契合吧！', 2, 0, '2024-01-01', '待审核');
INSERT INTO `notebook` VALUES (4, '非常Nice的一天4', 'https://cp1.douguo.com/upload/note/d/8/1/750_d8020377707b3d9ebb38df0d92a835e1.jpeg', '车厘子可可松饼塔是一道将新鲜车厘子的酸甜与奶油的丝滑相结合的美食。精选的车厘子鲜红如血，充满了浓郁的果香，而雀巢淡奶油的香气和口感为味蕾带来了绝佳的享受。松软的饼底融合了黄油的香气还加入了可可粉，不甜不腻，车厘子作为点缀更加诱人动人。咬下一口，外脆内软的口感和浓烈的车厘子汁液交织在一起，仿佛置身于甜蜜果园。无论是与亲友分享还是独自享用，车厘子可可松饼塔都能带给你满满的幸福感。雀巢淡奶油的加入为其平添了细腻与柔美。在这个车厘子盛产的季节，让我们尽情享受丝滑和甜蜜的美好，沉浸在这场味觉盛宴中，用舌尖感受雀巢淡奶油和车厘子的完美契合吧！', 2, 0, '2024-01-01', '审核通过');
INSERT INTO `notebook` VALUES (5, '非常Nice的一天3', 'https://cp1.douguo.com/upload/note/d/8/1/750_d8020377707b3d9ebb38df0d92a835e1.jpeg', '车厘子可可松饼塔是一道将新鲜车厘子的酸甜与奶油的丝滑相结合的美食。精选的车厘子鲜红如血，充满了浓郁的果香，而雀巢淡奶油的香气和口感为味蕾带来了绝佳的享受。松软的饼底融合了黄油的香气还加入了可可粉，不甜不腻，车厘子作为点缀更加诱人动人。咬下一口，外脆内软的口感和浓烈的车厘子汁液交织在一起，仿佛置身于甜蜜果园。无论是与亲友分享还是独自享用，车厘子可可松饼塔都能带给你满满的幸福感。雀巢淡奶油的加入为其平添了细腻与柔美。在这个车厘子盛产的季节，让我们尽情享受丝滑和甜蜜的美好，沉浸在这场味觉盛宴中，用舌尖感受雀巢淡奶油和车厘子的完美契合吧！', 2, 0, '2024-01-02', '审核通过');
INSERT INTO `notebook` VALUES (6, '非常Nice的一天5', 'https://cp1.douguo.com/upload/note/d/8/1/750_d8020377707b3d9ebb38df0d92a835e1.jpeg', '车厘子可可松饼塔是一道将新鲜车厘子的酸甜与奶油的丝滑相结合的美食。精选的车厘子鲜红如血，充满了浓郁的果香，而雀巢淡奶油的香气和口感为味蕾带来了绝佳的享受。松软的饼底融合了黄油的香气还加入了可可粉，不甜不腻，车厘子作为点缀更加诱人动人。咬下一口，外脆内软的口感和浓烈的车厘子汁液交织在一起，仿佛置身于甜蜜果园。无论是与亲友分享还是独自享用，车厘子可可松饼塔都能带给你满满的幸福感。雀巢淡奶油的加入为其平添了细腻与柔美。在这个车厘子盛产的季节，让我们尽情享受丝滑和甜蜜的美好，沉浸在这场味觉盛宴中，用舌尖感受雀巢淡奶油和车厘子的完美契合吧！', 2, 1, '2024-01-03', '审核通过');
INSERT INTO `notebook` VALUES (7, '非常Nice的一天6', 'https://cp1.douguo.com/upload/note/d/8/1/750_d8020377707b3d9ebb38df0d92a835e1.jpeg', '车厘子可可松饼塔是一道将新鲜车厘子的酸甜与奶油的丝滑相结合的美食。精选的车厘子鲜红如血，充满了浓郁的果香，而雀巢淡奶油的香气和口感为味蕾带来了绝佳的享受。松软的饼底融合了黄油的香气还加入了可可粉，不甜不腻，车厘子作为点缀更加诱人动人。咬下一口，外脆内软的口感和浓烈的车厘子汁液交织在一起，仿佛置身于甜蜜果园。无论是与亲友分享还是独自享用，车厘子可可松饼塔都能带给你满满的幸福感。雀巢淡奶油的加入为其平添了细腻与柔美。在这个车厘子盛产的季节，让我们尽情享受丝滑和甜蜜的美好，沉浸在这场味觉盛宴中，用舌尖感受雀巢淡奶油和车厘子的完美契合吧！', 2, 0, '2024-01-03', '审核通过');
INSERT INTO `notebook` VALUES (8, '非常Nice的一天7', 'https://cp1.douguo.com/upload/note/d/8/1/750_d8020377707b3d9ebb38df0d92a835e1.jpeg', '车厘子可可松饼塔是一道将新鲜车厘子的酸甜与奶油的丝滑相结合的美食。精选的车厘子鲜红如血，充满了浓郁的果香，而雀巢淡奶油的香气和口感为味蕾带来了绝佳的享受。松软的饼底融合了黄油的香气还加入了可可粉，不甜不腻，车厘子作为点缀更加诱人动人。咬下一口，外脆内软的口感和浓烈的车厘子汁液交织在一起，仿佛置身于甜蜜果园。无论是与亲友分享还是独自享用，车厘子可可松饼塔都能带给你满满的幸福感。雀巢淡奶油的加入为其平添了细腻与柔美。在这个车厘子盛产的季节，让我们尽情享受丝滑和甜蜜的美好，沉浸在这场味觉盛宴中，用舌尖感受雀巢淡奶油和车厘子的完美契合吧！', 2, 2, '2024-01-04', '审核通过');
INSERT INTO `notebook` VALUES (9, '非常Nice的一天8', 'https://cp1.douguo.com/upload/note/d/8/1/750_d8020377707b3d9ebb38df0d92a835e1.jpeg', '车厘子可可松饼塔是一道将新鲜车厘子的酸甜与奶油的丝滑相结合的美食。精选的车厘子鲜红如血，充满了浓郁的果香，而雀巢淡奶油的香气和口感为味蕾带来了绝佳的享受。松软的饼底融合了黄油的香气还加入了可可粉，不甜不腻，车厘子作为点缀更加诱人动人。咬下一口，外脆内软的口感和浓烈的车厘子汁液交织在一起，仿佛置身于甜蜜果园。无论是与亲友分享还是独自享用，车厘子可可松饼塔都能带给你满满的幸福感。雀巢淡奶油的加入为其平添了细腻与柔美。在这个车厘子盛产的季节，让我们尽情享受丝滑和甜蜜的美好，沉浸在这场味觉盛宴中，用舌尖感受雀巢淡奶油和车厘子的完美契合吧！', 2, 1, '2024-01-04', '审核通过');
INSERT INTO `notebook` VALUES (10, '非常Nice的一天9', 'https://cp1.douguo.com/upload/note/d/8/1/750_d8020377707b3d9ebb38df0d92a835e1.jpeg', '车厘子可可松饼塔是一道将新鲜车厘子的酸甜与奶油的丝滑相结合的美食。精选的车厘子鲜红如血，充满了浓郁的果香，而雀巢淡奶油的香气和口感为味蕾带来了绝佳的享受。松软的饼底融合了黄油的香气还加入了可可粉，不甜不腻，车厘子作为点缀更加诱人动人。咬下一口，外脆内软的口感和浓烈的车厘子汁液交织在一起，仿佛置身于甜蜜果园。无论是与亲友分享还是独自享用，车厘子可可松饼塔都能带给你满满的幸福感。雀巢淡奶油的加入为其平添了细腻与柔美。在这个车厘子盛产的季节，让我们尽情享受丝滑和甜蜜的美好，沉浸在这场味觉盛宴中，用舌尖感受雀巢淡奶油和车厘子的完美契合吧！', 2, 62, '2024-01-04', '审核通过');
INSERT INTO `notebook` VALUES (11, '非常Nice的一天10', 'https://cp1.douguo.com/upload/note/d/8/1/750_d8020377707b3d9ebb38df0d92a835e1.jpeg', '车厘子可可松饼塔是一道将新鲜车厘子的酸甜与奶油的丝滑相结合的美食。精选的车厘子鲜红如血，充满了浓郁的果香，而雀巢淡奶油的香气和口感为味蕾带来了绝佳的享受。松软的饼底融合了黄油的香气还加入了可可粉，不甜不腻，车厘子作为点缀更加诱人动人。咬下一口，外脆内软的口感和浓烈的车厘子汁液交织在一起，仿佛置身于甜蜜果园。无论是与亲友分享还是独自享用，车厘子可可松饼塔都能带给你满满的幸福感。雀巢淡奶油的加入为其平添了细腻与柔美。在这个车厘子盛产的季节，让我们尽情享受丝滑和甜蜜的美好，沉浸在这场味觉盛宴中，用舌尖感受雀巢淡奶油和车厘子的完美契合吧！', 2, 3, '2024-01-05', '审核通过');
INSERT INTO `notebook` VALUES (14, '玛格丽特小饼干1', 'http://localhost:9090/files/1704685162520-微信截图_20240108102735.png', '<p># 原制原味，聚会笔记</p><p>一口酥脆，满口醇香——玛格丽特小饼干的魅力，你无法抵挡！✨ 详细做法在菜谱中～ 在每一个午后的小憩时光，或是静谧的夜晚，有一款小饼干总能恰到好处地抚慰你的味蕾与心灵，那就是玛格丽特小饼干。 这款经典的玛格丽特小饼干，宛如盛开的雏菊，清新脱俗。选用优质的安佳动物黄油，揉合新鲜鸡蛋和细腻糖粉，每一口都饱含丰富的层次感，让人回味无穷。 ✨它的外表金黄诱人，口感酥脆无比，轻咬一口，黄油的馥郁、蛋香的醇厚与杏仁的清香瞬间在口中交织绽放，仿佛带你步入一个甜蜜而宁静的世界。 无论是搭配一杯热腾腾的红茶享受惬意下午茶，还是作为深夜加班的能量补给，玛格丽特小饼干都能给你带来满满的幸福感与满足感。</p><p><a href=\"javascript:;\"></a><a href=\"javascript:;\"></a></p><p># 一餐一饭，都是“想你”的滋味</p>', 2, 5, '2024-01-06', '审核通过');
INSERT INTO `notebook` VALUES (15, '我是小武，我发了一个笔记', 'http://localhost:9090/files/1704685601082-750_5db1f4519bee8728ba73c7f7c5ba4691.jpeg', '<p>香喷喷的笔记</p>', 3, 1, '2024-01-07', '审核通过');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '今天系统正式上线，开始内测', '今天系统正式上线，开始内测', '2023-09-05', 'admin');
INSERT INTO `notice` VALUES (2, '所有功能都已完成，可以正常使用', '所有功能都已完成，可以正常使用', '2023-09-05', 'admin');
INSERT INTO `notice` VALUES (3, '今天天气很不错，可以出去一起玩了', '今天天气很不错，可以出去一起玩了', '2023-09-05', 'admin');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品图片',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `num` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `total` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下单时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (2, '1743104051520118784', '农夫日记黑龙江长粒香大米', 'http://localhost:9090/files/1703822677800-448_fa4c3e6f39a0763045a1780f16aa3b38.jpg', 29.90, 1, 29.90, '已取消', '2024-01-05 10:56:05', 2, '1', '1398897788', 14);
INSERT INTO `orders` VALUES (3, '1743104628614393856', '农夫日记黑龙江长粒香大米', 'http://localhost:9090/files/1703822677800-448_fa4c3e6f39a0763045a1780f16aa3b38.jpg', 29.90, 1, 29.90, '已完成', '2024-01-05 10:58:23', 2, '合肥', '13988997766', 14);
INSERT INTO `orders` VALUES (4, '1743110210490642432', '青源禾谷 养生杂粮吉林吉安圆糯米', 'http://localhost:9090/files/1703822490130-448_4761ff99ed6a34a5c190566282384048.jpg', 39.00, 1, 39.00, '已取消', '2024-01-05 11:20:34', 2, '1111', '13877886677', 11);
INSERT INTO `orders` VALUES (5, '1743111137654124544', '农夫日记黑龙江长粒香大米', 'http://localhost:9090/files/1703822677800-448_fa4c3e6f39a0763045a1780f16aa3b38.jpg', 29.90, 1, 29.90, '已取消', '2024-01-05 11:24:15', 2, '1111', '13988997788', 12);
INSERT INTO `orders` VALUES (6, '1743111460514869248', '农夫日记黑龙江长粒香大米', 'http://localhost:9090/files/1703822677800-448_fa4c3e6f39a0763045a1780f16aa3b38.jpg', 29.90, 1, 29.90, '待发货', '2024-01-05 11:25:32', 3, '北京东路110号', '13877886677', 8);
INSERT INTO `orders` VALUES (7, '1744219282908553216', '农夫日记黑龙江长粒香大米', 'http://localhost:9090/files/1703822677800-448_fa4c3e6f39a0763045a1780f16aa3b38.jpg', 29.90, 2, 59.80, '已完成', '2024-01-08 12:47:37', 7, '南溪大街110号', '13988997788', 14);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `account` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '普通用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'aaa', '123', '青哥哥', 'http://localhost:9090/files/1703733588522-微信截图_20231114162404.png', 'USER', '13877889988', 'aaa@xm.com', 201.00);
INSERT INTO `user` VALUES (3, 'ccc', '123', '小武哥哥', 'http://localhost:9090/files/1703733525915-微信截图_20231114162539.png', 'USER', '13899887766', 'ccc@xm.com', 970.10);
INSERT INTO `user` VALUES (6, 'acc', '123', 'acc', NULL, 'USER', NULL, NULL, 0.00);
INSERT INTO `user` VALUES (7, 'bcc', '123', 'bcc', 'http://localhost:9090/files/1704689138847-微信截图_20231018172251.png', 'USER', NULL, NULL, 940.20);

SET FOREIGN_KEY_CHECKS = 1;
