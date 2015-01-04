# Host: 127.0.0.1  (Version: 5.7.3-m13)
# Date: 2015-01-04 22:16:37
# Generator: MySQL-Front 5.3  (Build 4.13)

/*!40101 SET NAMES utf8 */;

#
# Source for table "tbl_taskboard"
#

DROP TABLE IF EXISTS `tbl_taskboard`;
CREATE TABLE `tbl_taskboard` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `taskset_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='任务表';

#
# Data for table "tbl_taskboard"
#

INSERT INTO `tbl_taskboard` VALUES (2,'阿萨德',0,NULL,'2015-01-03 00:46:28','2015-01-03 00:46:28'),(3,'阿斯达',0,NULL,'2015-01-03 00:47:48','2015-01-03 00:47:48'),(4,'阿萨德在',0,NULL,'2015-01-03 01:21:52','2015-01-03 01:21:52'),(5,'啊实打实的',0,NULL,'2015-01-03 01:22:13','2015-01-03 01:22:13'),(6,'自行车在成',0,NULL,'2015-01-03 01:24:01','2015-01-03 01:24:01'),(7,'不不不',1,NULL,'2015-01-03 16:03:41','2015-01-03 16:03:41'),(8,'自行车啊',2,NULL,'2015-01-03 16:07:00','2015-01-03 16:07:00'),(9,'啧啧',2,NULL,'2015-01-03 16:07:18','2015-01-03 16:07:18'),(10,'长城长',3,NULL,'2015-01-03 16:07:44','2015-01-03 16:07:44'),(11,'阿斯顿发放',3,NULL,'2015-01-03 16:34:21','2015-01-03 16:34:21'),(12,'啊实打实的',3,NULL,'2015-01-03 20:41:37','2015-01-03 20:41:37'),(13,'啊啊啊',1,NULL,'2015-01-03 21:12:20','2015-01-03 21:12:20'),(14,'啊啊啊试试',1,NULL,'2015-01-03 21:12:41','2015-01-03 21:12:41'),(15,'啊实打实的',3,NULL,'2015-01-03 21:13:59','2015-01-03 21:13:59'),(16,'擐甲挥戈将',3,NULL,'2015-01-03 21:15:14','2015-01-03 21:15:14');

#
# Source for table "tbl_taskset"
#

DROP TABLE IF EXISTS `tbl_taskset`;
CREATE TABLE `tbl_taskset` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_name` varchar(30) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL COMMENT '任务集描述',
  `user_id` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='任务集';

#
# Data for table "tbl_taskset"
#

INSERT INTO `tbl_taskset` VALUES (1,'JAVA学习','test',NULL,'2015-01-03 14:45:25','2015-01-03 14:45:25'),(2,'阿斯顿','阿斯顿',NULL,'2015-01-03 15:53:04','2015-01-03 15:53:04'),(3,'测试','~~~~',NULL,'2015-01-03 16:07:33','2015-01-03 16:07:33');

#
# Source for table "tbl_user"
#

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(30) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_uname_pwd` (`username`,`password`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "tbl_user"
#

INSERT INTO `tbl_user` VALUES (1,'shaoling','e10adc3949ba59abbe56e057f20f883e','bj_ling@sina.com','2015-01-01 21:24:43','2015-01-01 21:24:43');
