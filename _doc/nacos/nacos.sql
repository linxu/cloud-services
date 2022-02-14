/*
 Navicat Premium Data Transfer

 Source Server         : localhost-mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 05/07/2019 16:49:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
INSERT INTO `config_info` VALUES (1, 'cloud-test3.yaml', 'DEFAULT_GROUP', 'app:\n config: test3\nserver:\n port: 9010\n#management:\n# endpoints:\n#  web:\n#   exposure:\n#    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging: \n  config: \n    classpath: logback-spring.xml', '834a49c08402e8d43e168db488e6bfca', '2019-06-22 17:53:02', '2019-07-05 16:48:44', NULL, '127.0.0.1', '', '', '', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (3, 'gateway-server.yaml', 'DEFAULT_GROUP', 'server:\n  port: 9001\nspring:\n  cloud:\n    gateway:\n      default-filters:\n      routes:\n      - id: baidu-test\n        uri: http://www.baidu.com\n        predicates:\n        - Path= /baidu\n      - id: cloud-test3\n        uri: lb://cloud-test3\n        predicates:\n        - Path= /test3/**\n        filters:\n        - StripPrefix= 1\n        - Passport\n      - id: cloud-test4\n        uri: lb://cloud-test4\n        predicates:\n        - Path= /test4/**\n        filters:\n        - StripPrefix= 1', '1270e0f33362869b9d9a66b7f38f18ce', '2019-06-23 14:23:19', '2019-07-05 16:41:02', NULL, '127.0.0.1', '', '', '', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (4, 'cloud-test4.yaml', 'DEFAULT_GROUP', 'app:\n  config: test\n\nserver:\n  port: 9011', 'd509a5735609335dc85a9343c00dfeec', '2019-06-23 17:21:36', '2019-06-23 17:23:23', NULL, '127.0.0.1', '', '', '', NULL, NULL, 'yaml', NULL);
COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
BEGIN;
INSERT INTO `his_config_info` VALUES (0, 1, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9090\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"', 'e46c59a368a17613e9e9a325fa7acb96', '2010-05-05 00:00:00', '2019-06-22 17:53:02', NULL, '127.0.0.1', 'I', '');
INSERT INTO `his_config_info` VALUES (1, 2, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9090\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"', 'e46c59a368a17613e9e9a325fa7acb96', '2010-05-05 00:00:00', '2019-06-22 21:19:17', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 3, 'gateway-server.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9002\nspring:\n  cloud:\n    gateway:\n      default-filters:\n      routes:\n      - id: cloud-test1\n        uri: lb://cloud-test1\n        predicates:\n        - Path= /test1/**\n        filters:\n        - StripPrefix= 1\n        - Passport\n      - id: cloud-test1\n        uri: lb://cloud-test2\n        predicates:\n        - Path= /test2/**\n        filters:\n        - StripPrefix= 1', '2ee5eba498f8630803d17182c784e16c', '2010-05-05 00:00:00', '2019-06-23 14:23:19', NULL, '127.0.0.1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 4, 'cloud-test4.yaml', 'DEFAULT_GROUP', '', 'app:\n  config: test\n\nserver:\n  port: 8888', '931cadbeb59041f3d8377b0d7872cb6b', '2010-05-05 00:00:00', '2019-06-23 17:21:36', NULL, '127.0.0.1', 'I', '');
INSERT INTO `his_config_info` VALUES (3, 5, 'gateway-server.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9002\nspring:\n  cloud:\n    gateway:\n      default-filters:\n      routes:\n      - id: cloud-test1\n        uri: lb://cloud-test1\n        predicates:\n        - Path= /test1/**\n        filters:\n        - StripPrefix= 1\n        - Passport\n      - id: cloud-test1\n        uri: lb://cloud-test2\n        predicates:\n        - Path= /test2/**\n        filters:\n        - StripPrefix= 1', '2ee5eba498f8630803d17182c784e16c', '2010-05-05 00:00:00', '2019-06-23 17:22:39', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 6, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9090\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver', 'bdd667418e19038946851d9e8fc290c0', '2010-05-05 00:00:00', '2019-06-23 17:23:08', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (4, 7, 'cloud-test4.yaml', 'DEFAULT_GROUP', '', 'app:\n  config: test\n\nserver:\n  port: 8888', '931cadbeb59041f3d8377b0d7872cb6b', '2010-05-05 00:00:00', '2019-06-23 17:23:23', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (3, 8, 'gateway-server.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\nspring:\n  cloud:\n    gateway:\n      default-filters:\n      routes:\n      - id: cloud-test1\n        uri: lb://cloud-test1\n        predicates:\n        - Path= /test1/**\n        filters:\n        - StripPrefix= 1\n        - Passport\n      - id: cloud-test1\n        uri: lb://cloud-test2\n        predicates:\n        - Path= /test2/**\n        filters:\n        - StripPrefix= 1', '4014ef570787df32e7793b745f4ce560', '2010-05-05 00:00:00', '2019-06-23 17:30:02', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (3, 9, 'gateway-server.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\nspring:\n  cloud:\n    gateway:\n      default-filters:\n      routes:\n      - id: cloud-test1\n        uri: lb://cloud-test1\n        predicates:\n        - Path= /test1/**\n        filters:\n        - StripPrefix= 1\n        - Passport\n      - id: cloud-test2\n        uri: lb://cloud-test2\n        predicates:\n        - Path= /test2/**\n        filters:\n        - StripPrefix= 1', 'cc58b26d1badd2a8c06e7b7789283425', '2010-05-05 00:00:00', '2019-06-23 17:33:44', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 10, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9010\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver', '8c2975629562ec43ae7c30b427a060a3', '2010-05-05 00:00:00', '2019-07-04 16:04:09', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 11, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9010\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging:\n  config: \n    classpath: logback-spring.xml', '1c3da30e94bdd6032a51510a2a24d7d7', '2010-05-05 00:00:00', '2019-07-04 16:04:44', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 12, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9010\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging: \n  config: \n    classpath: logback-spring.xml', '52319afcc93c461d1d61c052b0184f41', '2010-05-05 00:00:00', '2019-07-04 17:04:17', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 13, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9010\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging: \n  level:\n    root: INFO\n  config: \n    classpath: logback-spring.xml', 'cde82dcc06a8f65a2d81230ea160059d', '2010-05-05 00:00:00', '2019-07-04 17:04:50', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 14, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9010\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging: \n  level:\n    root: INFO\n  config: \n    classpath: logback-spring.xml', 'cde82dcc06a8f65a2d81230ea160059d', '2010-05-05 00:00:00', '2019-07-04 17:05:07', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 15, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9010\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging: \n  level: \n    root: INFO\n  config: \n    classpath: logback-spring.xml', 'c097cc63af3b253a472c0be04cae7c3c', '2010-05-05 00:00:00', '2019-07-05 14:37:01', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 16, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test33\nserver:\n port: 9010\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging: \n  level: \n    root: INFO\n  config: \n    classpath: logback-spring.xml', '983a8ea41c36f48f22178f65e5c15d09', '2010-05-05 00:00:00', '2019-07-05 14:37:25', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 17, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test333\nserver:\n port: 9010\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging: \n  level: \n    root: INFO\n  config: \n    classpath: logback-spring.xml', 'e21b882fb4f61b2afb935c9ed173df52', '2010-05-05 00:00:00', '2019-07-05 14:39:23', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 18, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9010\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging: \n  level: \n    root: INFO\n  config: \n    classpath: logback-spring.xml', 'c097cc63af3b253a472c0be04cae7c3c', '2010-05-05 00:00:00', '2019-07-05 14:40:22', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 19, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test\nserver:\n port: 9010\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging: \n  level: \n    root: INFO\n  config: \n    classpath: logback-spring.xml', 'ca9f7ae274952117c288dfff92012ee1', '2010-05-05 00:00:00', '2019-07-05 14:41:37', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 20, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9010\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging: \n  level: \n    root: INFO\n  config: \n    classpath: logback-spring.xml', 'c097cc63af3b253a472c0be04cae7c3c', '2010-05-05 00:00:00', '2019-07-05 14:43:28', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 21, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9010\nmanagement:\n endpoints:\n  web:\n   exposure:\n    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging: \n  config: \n    classpath: logback-spring.xml', '52319afcc93c461d1d61c052b0184f41', '2010-05-05 00:00:00', '2019-07-05 14:45:15', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 22, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9010\n#management:\n# endpoints:\n#  web:\n#   exposure:\n#    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging: \n  config: \n    classpath: logback-spring.xml', '834a49c08402e8d43e168db488e6bfca', '2010-05-05 00:00:00', '2019-07-05 14:54:00', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (3, 23, 'gateway-server.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\nspring:\n  cloud:\n    gateway:\n      default-filters:\n      routes:\n      - id: cloud-test3\n        uri: lb://cloud-test3\n        predicates:\n        - Path= /test3/**\n        filters:\n        - StripPrefix= 1\n        - Passport\n      - id: cloud-test4\n        uri: lb://cloud-test4\n        predicates:\n        - Path= /test4/**\n        filters:\n        - StripPrefix= 1', '8dcf59e44b8f080df4ac2e1fb15aeb11', '2010-05-05 00:00:00', '2019-07-05 16:28:25', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (3, 24, 'gateway-server.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 9000\nspring:\n  cloud:\n    gateway:\n      default-filters:\n      routes:\n      - id: baidu-test\n        uri: http://www.baidu.com\n        predicates:\n        - Path= /baidu\n      - id: cloud-test3\n        uri: lb://cloud-test3\n        predicates:\n        - Path= /test3/**\n        filters:\n        - StripPrefix= 1\n        - Passport\n      - id: cloud-test4\n        uri: lb://cloud-test4\n        predicates:\n        - Path= /test4/**\n        filters:\n        - StripPrefix= 1', '95dd0c5295f1a21851bd597023ce8169', '2010-05-05 00:00:00', '2019-07-05 16:41:02', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 25, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9010\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging: \n  config: \n    classpath: logback-spring.xml', 'bdf96d6952cc284ecdf4fcbfd95092f0', '2010-05-05 00:00:00', '2019-07-05 16:46:39', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 26, 'cloud-test3.yaml', 'DEFAULT_GROUP', '', 'app:\n config: test3\nserver:\n port: 9010\n#management:\n# endpoints:\n#  web:\n#   exposure:\n#    include: \"*\"\nspring:\n  datasource:\n    url: jdbc:h2:mem:test\n    driver-class-name: org.h2.Driver\nlogging: \n  config: \n    classpath: logback-spring.xml', '834a49c08402e8d43e168db488e6bfca', '2010-05-05 00:00:00', '2019-07-05 16:48:44', NULL, '127.0.0.1', 'U', '');
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
