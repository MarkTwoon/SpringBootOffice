/*
 Navicat Premium Data Transfer

 Source Server         : mysqlDemo
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : 65001

 Date: 27/02/2020 23:12:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `age` int(255) NOT NULL,
  `birthday` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '易绍轩', '男', 20, '2019-06-18 11:45:06.000000');
INSERT INTO `admin` VALUES (2, '熊大', '男', 23, '1996-06-06 00:00:00.000000');
INSERT INTO `admin` VALUES (4, '熊二', '男', 25, '1996-06-06 00:00:00.000000');

-- ----------------------------
-- Table structure for chenji
-- ----------------------------
DROP TABLE IF EXISTS `chenji`;
CREATE TABLE `chenji`  (
  `CID` int(11) NOT NULL AUTO_INCREMENT,
  `YUWEN` int(11) NOT NULL,
  `SHUXUE` int(11) NOT NULL,
  `YINGYU` int(11) NOT NULL,
  `ZONGFEN` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`CID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of chenji
-- ----------------------------
INSERT INTO `chenji` VALUES (1, 110, 115, 120, 355);
INSERT INTO `chenji` VALUES (2, 115, 110, 120, 345);
INSERT INTO `chenji` VALUES (3, 90, 78, 88, 256);

-- ----------------------------
-- Table structure for dep
-- ----------------------------
DROP TABLE IF EXISTS `dep`;
CREATE TABLE `dep`  (
  `depto` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`depto`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dep
-- ----------------------------
INSERT INTO `dep` VALUES (1, '销售部');
INSERT INTO `dep` VALUES (2, '产品部');
INSERT INTO `dep` VALUES (3, '人事部');

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `depto` int(255) NOT NULL,
  `sal` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES (1, '张三', 1, 2000);
INSERT INTO `emp` VALUES (2, '李四', 1, 3200);
INSERT INTO `emp` VALUES (3, '王五', 1, 4100);
INSERT INTO `emp` VALUES (4, '赵六', 3, 3800);
INSERT INTO `emp` VALUES (5, '魏七', 2, 5230);
INSERT INTO `emp` VALUES (6, '周八', 2, 2320);
INSERT INTO `emp` VALUES (7, '胡九', 3, 4320);
INSERT INTO `emp` VALUES (8, '钱大', 1, 3610);
INSERT INTO `emp` VALUES (9, '宋二', 2, 3400);

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(3) NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男',
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11116 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES (11112, '张三', -30, '2018-02-13 00:00:00', '男');
INSERT INTO `person` VALUES (11113, '李四', -30, '2018-02-13 00:00:00', '男');
INSERT INTO `person` VALUES (11114, '张三', 30, '2018-02-13 00:00:00', '男');
INSERT INTO `person` VALUES (11115, '李四', 23, '2018-02-18 00:00:00', '男');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `AGE` int(11) NULL DEFAULT NULL COMMENT '密码',
  `SEX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NUMBER` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES (1, '香蕉', 200, 1);
INSERT INTO `tb_goods` VALUES (2, '苹果', 20, 3);

-- ----------------------------
-- Table structure for tb_singer
-- ----------------------------
DROP TABLE IF EXISTS `tb_singer`;
CREATE TABLE `tb_singer`  (
  `SINGER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SINGER_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SINGER_SEX` int(11) NOT NULL,
  `SINGER_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SINGER_NATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SINGER_MONEY` int(255) NOT NULL,
  PRIMARY KEY (`SINGER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_singer
-- ----------------------------
INSERT INTO `tb_singer` VALUES (1, '刘德华', 1, '1967-01-05', '中国-香港', 2000);
INSERT INTO `tb_singer` VALUES (2, '苏有朋', 1, '1973-05-17', '中国-香港', 800);
INSERT INTO `tb_singer` VALUES (3, '赵四', 1, '1965-04-22', '中国-东北', 200);
INSERT INTO `tb_singer` VALUES (4, '林志炫', 1, '1977-05-24', '中国-台湾', 400);
INSERT INTO `tb_singer` VALUES (5, '韩红', 0, '1988-05-06', '中国-大陆', 500);
INSERT INTO `tb_singer` VALUES (6, '王源', 1, '1977-05-24', '中国-大陆', 100);

-- ----------------------------
-- Table structure for tb_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SEX` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AGE` int(11) NOT NULL,
  `BIRTHDAY` datetime(6) NOT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TEACHER_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `A`(`TEACHER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_student
-- ----------------------------
INSERT INTO `tb_student` VALUES (1, '王一明', '男', 21, '2019-10-15 18:59:57.000000', '本科生', 1);
INSERT INTO `tb_student` VALUES (2, '李老八', '男', 25, '0000-00-00 00:00:00.000000', '硕士', 1);
INSERT INTO `tb_student` VALUES (3, '李三', '男', 67, '0000-00-00 00:00:00.000000', '博士', 1);
INSERT INTO `tb_student` VALUES (4, '王小军', '男', 32, '0000-00-00 00:00:00.000000', '硕士', 1);
INSERT INTO `tb_student` VALUES (5, '王小华', '男', 46, '0000-00-00 00:00:00.000000', '本科生', 1);
INSERT INTO `tb_student` VALUES (6, '王小虎', '男', 37, '0000-00-00 00:00:00.000000', '硕士', 1);
INSERT INTO `tb_student` VALUES (7, '张花花', '女', 70, '2019-10-08 19:03:48.000000', '博士', 3);
INSERT INTO `tb_student` VALUES (8, '朱小红', '女', 19, '2019-10-27 20:02:16.000000', '本科生', 2);

-- ----------------------------
-- Table structure for tb_studentmoney
-- ----------------------------
DROP TABLE IF EXISTS `tb_studentmoney`;
CREATE TABLE `tb_studentmoney`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `MONEY` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_studentmoney
-- ----------------------------
INSERT INTO `tb_studentmoney` VALUES (1, '本科生', 5000);
INSERT INTO `tb_studentmoney` VALUES (2, '硕士', 9000);
INSERT INTO `tb_studentmoney` VALUES (3, '博士', 16000);

-- ----------------------------
-- Table structure for tb_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SEX` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_teacher
-- ----------------------------
INSERT INTO `tb_teacher` VALUES (1, '易绍轩', '男');
INSERT INTO `tb_teacher` VALUES (2, '李鹏', '男');

-- ----------------------------
-- Table structure for tb_test
-- ----------------------------
DROP TABLE IF EXISTS `tb_test`;
CREATE TABLE `tb_test`  (
  `TEST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TEST_AGE` int(255) NOT NULL,
  `TEST_TIME` datetime(0) NOT NULL,
  `TEST_PID` int(11) NOT NULL,
  PRIMARY KEY (`TEST_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_test
-- ----------------------------
INSERT INTO `tb_test` VALUES (1, 'AAA', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `tb_test` VALUES (2, 'bbb', 0, '0000-00-00 00:00:00', 1);
INSERT INTO `tb_test` VALUES (3, '熊大', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `tb_test` VALUES (4, '熊二', 25, '2019-11-02 02:37:33', 3);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AGE` int(11) NOT NULL,
  `SEX` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, '水手--郑智化', '123', 20, '男');
INSERT INTO `tb_user` VALUES (3, '胖胖哥', '456', 20, '男');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '李雷');
INSERT INTO `teacher` VALUES (2, '钱电');
INSERT INTO `teacher` VALUES (3, '孙风');
INSERT INTO `teacher` VALUES (4, '李云');
INSERT INTO `teacher` VALUES (5, '王梅');
INSERT INTO `teacher` VALUES (6, '李兰');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `age` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'user0', '20');
INSERT INTO `user` VALUES (3, 'user1', '20');
INSERT INTO `user` VALUES (25, 'lzj5', '35');
INSERT INTO `user` VALUES (26, 'lzj5', '35');
INSERT INTO `user` VALUES (27, 'lzj5', '35');
INSERT INTO `user` VALUES (28, 'ABD666', '35');
INSERT INTO `user` VALUES (29, 'lzj5', '35');
INSERT INTO `user` VALUES (30, '胖胖哥', '35');
INSERT INTO `user` VALUES (31, '胖胖哥', '35');

-- ----------------------------
-- Triggers structure for table admin
-- ----------------------------
DROP TRIGGER IF EXISTS `ins_admin`;
delimiter ;;
CREATE TRIGGER `ins_admin` AFTER INSERT ON `admin` FOR EACH ROW begin  
      insert into tb_test ( TEST_NAME, TEST_PID,TEST_AGE,TEST_TIME)  
        values( new.name, 0,NEW.age,NOW());  
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
