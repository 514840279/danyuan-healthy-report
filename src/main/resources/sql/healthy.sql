/*
Navicat MySQL Data Transfer

Source Server         : 39.99.129.121
Source Server Version : 80017
Source Host           : 39.99.129.121:3306
Source Database       : healthy

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2019-10-10 10:09:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token` (
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `token_id` varchar(255) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(255) DEFAULT NULL,
  KEY `token_id_index` (`token_id`),
  KEY `authentication_id_index` (`authentication_id`),
  KEY `user_name_index` (`user_name`),
  KEY `client_id_index` (`client_id`),
  KEY `refresh_token_index` (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_access_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(48) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('wth', 'wth', '{bcrypt}$2a$10$cVSGA2DJHIriCBZR9x0WTOF4QiORuQlrFNEAU/Of4jmqOLAf8AHNu', 'all', 'password,refresh_token,authorization_code', 'http://localhost:82/login,http://localhost:82/,http://192.168.31.87:82/index,http://192.168.31.87:82/,http://175.163.77.229:82/index,http://113.234.169.51:82/index,http://192.168.31.41:82/index,http://192.168.0.16:82/index ', 'ROLE_ADMIN', '3600', '3600', '{\"data\":1}', 'true');

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code` (
  `code` varchar(255) DEFAULT NULL,
  `authentication` varbinary(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_code
-- ----------------------------
INSERT INTO `oauth_code` VALUES ('rPJNoH', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001F40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B7870740004746573747871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740003777468737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000474000D726573706F6E73655F74797065740004636F646574000C72656469726563745F757269740019687474703A2F2F6C6F63616C686F73743A38322F696E6465787400057374617465740006714B6E694857740009636C69656E745F696471007E001778737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000001740003616C6C78017371007E0026770C000000103F400000000000017371007E000D74000A524F4C455F41444D494E787371007E001A3F40000000000000770800000010000000007871007E001F707371007E0026770C000000103F40000000000001740003777468787371007E0026770C000000103F4000000000000171007E001D787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001F40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0033737200486F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E57656241757468656E7469636174696F6E44657461696C7300000000000001F40200024C000D72656D6F74654164647265737371007E000E4C000973657373696F6E496471007E000E787074000F303A303A303A303A303A303A303A31740020374241363142323335443942323541363030383641444141443932323832394670737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001F40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0023737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001F4020000787077040000000171007E000F787074000474657374);

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token` (
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `token_id` varchar(255) DEFAULT NULL,
  `token` blob,
  `authentication` blob,
  KEY `token_id_index` (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_refresh_token
-- ----------------------------

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------
INSERT INTO `persistent_logins` VALUES ('healthy', 'CZ+YFQdchlPrO53TjDnz/g==', 'VwAAajdGGi4ixJl7gJxsog==', '2019-10-09 08:54:45');
INSERT INTO `persistent_logins` VALUES ('healthy', 'ePu2X4GRjD1I9/ztacFEYQ==', 'GPoSpWx+cfR06diGREclHg==', '2019-10-10 02:00:07');
INSERT INTO `persistent_logins` VALUES ('wth', 'fYE6VUMioYVLFJkn/7h5zg==', 'lRF2opwRfOryoRjOIyP7uQ==', '2019-08-26 03:46:03');
INSERT INTO `persistent_logins` VALUES ('healthy', 'H/WQyAsMd4yxYSQhaS32nw==', 'cFs7Or1iZxUoUox5U/N5BA==', '2019-10-09 14:19:16');
INSERT INTO `persistent_logins` VALUES ('wth', 'j0gLXFxqfQB3dmLoV9fEow==', 'fhYtfeGxx4LYU0Woel66UQ==', '2019-08-26 02:54:52');
INSERT INTO `persistent_logins` VALUES ('healthy', 'm3ryKT9BRfgJi4GIW6WFEw==', 'u2l/NpTAQ+UQge4E5IuSPw==', '2019-10-09 04:01:25');
INSERT INTO `persistent_logins` VALUES ('healthy', 'Mh/zTb7MLZoyPIhjNpii7A==', 'Uh2vkGVX2eUPUhRrYkdq5g==', '2019-10-09 03:56:35');
INSERT INTO `persistent_logins` VALUES ('healthy', 'P8e9BdPO787+7ELlVhE/Ng==', 'COwIzTLWp41HIoNm0rNs4g==', '2019-10-09 03:57:21');
INSERT INTO `persistent_logins` VALUES ('wth', 'ujf7shOC00DJf5+XBPyPhw==', '69yINF3g+GFrCS++wogbSQ==', '2019-08-26 02:55:34');
INSERT INTO `persistent_logins` VALUES ('healthy', 'zGx2DOZVxFqAoj/7OFVYfw==', '9BsgwKJv7PQGPlGMDkG0/Q==', '2019-10-10 02:02:13');

-- ----------------------------
-- Table structure for sys_assess_adl_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_assess_adl_info`;
CREATE TABLE `sys_assess_adl_info` (
  `uuid` varchar(36) NOT NULL,
  `assess_uuid` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `discription` varchar(255) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新人员',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ADL评分';

-- ----------------------------
-- Records of sys_assess_adl_info
-- ----------------------------
INSERT INTO `sys_assess_adl_info` VALUES ('0328a5f4-f406-489f-b90c-1be638160445', '5ce99bf9-c944-4668-a440-a39b040761de', '使用轮椅', '1', null, null, '2019-09-29 12:55:08', 'system', '0', '2019-09-29 20:55:08', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('096cd570-e7a5-4cc2-a77c-2befc690fca9', '5ce99bf9-c944-4668-a440-a39b040761de', '小便控制', '5', null, null, '2019-09-29 12:55:08', 'system', '0', '2019-09-29 20:55:08', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('140f1c27-5f29-4b22-9c9b-dd57d09b8dc2', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', '洗澡', '4', null, null, '2019-09-29 10:39:00', 'system', '0', '2019-09-29 18:38:59', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('15997d56-c7e2-418c-946e-7d6d32b206fb', '5ce99bf9-c944-4668-a440-a39b040761de', '上下楼梯', '2', null, null, '2019-09-29 12:55:08', 'system', '0', '2019-09-29 20:55:08', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('183a77c4-aebc-492c-bab4-76054c9408d5', '6f151c29-ae38-40db-9d62-413dd45860ea', '使用轮椅', '3', null, null, '2019-10-08 10:53:06', 'system', '0', '2019-10-08 18:53:05', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('1b79c192-7202-4c5f-958a-33d63cad9e7a', '5ce99bf9-c944-4668-a440-a39b040761de', '入厕', '8', null, null, '2019-09-29 12:55:08', 'system', '0', '2019-09-29 20:55:08', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('1e8137d9-b515-4cd6-bfa2-3f2ba82f4ac5', '6f151c29-ae38-40db-9d62-413dd45860ea', '上下楼梯', '5', null, null, '2019-10-08 10:53:06', 'system', '0', '2019-10-08 18:53:05', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('255d5eb0-453f-4745-9227-21b5d4ad55dc', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', '小便控制', '8', null, null, '2019-09-29 10:39:00', 'system', '0', '2019-09-29 18:38:59', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('266c65f6-0d1b-49ed-912f-1513ef36211b', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', '穿衣', '5', null, null, '2019-09-29 10:39:00', 'system', '0', '2019-09-29 18:38:59', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('338b9302-ecd3-4a45-b3e7-496c6629fede', '6f151c29-ae38-40db-9d62-413dd45860ea', '平地步行', '8', null, null, '2019-10-08 10:53:06', 'system', '0', '2019-10-08 18:53:05', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('39500a3d-a5f6-4911-8a76-5eb0bfdd104d', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '床椅转移', '12', null, null, '2019-09-29 10:41:50', 'system', '0', '2019-09-29 18:41:50', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('3b87a3d9-0a8a-46b0-8774-17b04af8455b', '6f151c29-ae38-40db-9d62-413dd45860ea', '修饰', '3', null, null, '2019-10-08 10:53:06', 'system', '0', '2019-10-08 18:53:05', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('41beb14c-4bf2-47ff-bb92-6dae3cef4fdf', '5ce99bf9-c944-4668-a440-a39b040761de', '平地步行', '8', null, null, '2019-09-29 12:55:08', 'system', '0', '2019-09-29 20:55:08', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('4675b222-7b52-42fc-9f22-dd6732ee666d', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', '上下楼梯', '8', null, null, '2019-09-29 10:39:00', 'system', '0', '2019-09-29 18:38:59', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('4adac13d-a812-4d91-9389-1f6ae37d7aa4', '6f151c29-ae38-40db-9d62-413dd45860ea', '进食', '5', null, null, '2019-10-08 10:53:06', 'system', '0', '2019-10-08 18:53:05', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('51665af9-3f71-4f4a-869e-228f4d75aeeb', '5ce99bf9-c944-4668-a440-a39b040761de', '洗澡', '3', null, null, '2019-09-29 12:55:08', 'system', '0', '2019-09-29 20:55:08', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('63697a45-0cae-4547-a5c9-8b9d1180621f', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', '大便控制', '5', null, null, '2019-09-29 10:39:00', 'system', '0', '2019-09-29 18:38:59', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('6515dd30-e4d2-4b14-862c-56d97c894b39', '5ce99bf9-c944-4668-a440-a39b040761de', '进食', '8', null, null, '2019-09-29 12:55:08', 'system', '0', '2019-09-29 20:55:08', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('6a5aebb3-41ef-4b14-aefb-9025d1a593ca', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '洗澡', '3', null, null, '2019-09-29 10:41:50', 'system', '0', '2019-09-29 18:41:50', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('73b03024-f6db-421e-afc8-1f9caddd8f76', '5ce99bf9-c944-4668-a440-a39b040761de', '床椅转移', '8', null, null, '2019-09-29 12:55:08', 'system', '0', '2019-09-29 20:55:08', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('77b749ab-232a-450e-915e-f5656b710d39', '6f151c29-ae38-40db-9d62-413dd45860ea', '洗澡', '3', null, null, '2019-10-08 10:53:06', 'system', '0', '2019-10-08 18:53:05', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('77ba84fd-5829-48d4-a722-387f0b06798f', '6f151c29-ae38-40db-9d62-413dd45860ea', '入厕', '5', null, null, '2019-10-08 10:53:06', 'system', '0', '2019-10-08 18:53:05', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('7d4019ef-251f-4af0-9986-d1b8ad4f2d48', '5ce99bf9-c944-4668-a440-a39b040761de', '大便控制', '10', null, null, '2019-09-29 12:55:08', 'system', '0', '2019-09-29 20:55:08', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('82ecf6ee-8518-42fa-b109-8bc33ad47692', '5ce99bf9-c944-4668-a440-a39b040761de', '修饰', '3', null, null, '2019-09-29 12:55:08', 'system', '0', '2019-09-29 20:55:08', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('8468460f-9d9f-4c54-9089-d2c8b6fefaab', '5ce99bf9-c944-4668-a440-a39b040761de', '穿衣', '2', null, null, '2019-09-29 12:55:08', 'system', '0', '2019-09-29 20:55:08', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('90bddb02-436c-4371-a89c-df76042379eb', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '大便控制', '10', null, null, '2019-09-29 10:41:50', 'system', '0', '2019-09-29 18:41:50', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('91168c50-24ab-465b-b120-a80f391b2c0f', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '使用轮椅', '4', null, null, '2019-09-29 10:41:50', 'system', '0', '2019-09-29 18:41:50', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('97ebb681-7145-4c16-8be6-d95718a4ada5', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '修饰', '5', null, null, '2019-09-29 10:41:50', 'system', '0', '2019-09-29 18:41:50', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('9c886549-77da-449b-b429-85816d021f9c', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', '修饰', '4', null, null, '2019-09-29 10:39:00', 'system', '0', '2019-09-29 18:38:59', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('a4b27861-6034-4f23-ad80-1083659df3f0', '6f151c29-ae38-40db-9d62-413dd45860ea', '小便控制', '5', null, null, '2019-10-08 10:53:06', 'system', '0', '2019-10-08 18:53:05', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('a69a8445-f46a-4c30-ad19-d2fc375f1c9c', '6f151c29-ae38-40db-9d62-413dd45860ea', '大便控制', '5', null, null, '2019-10-08 10:53:06', 'system', '0', '2019-10-08 18:53:05', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('a7293268-1f3a-4011-9a22-5e436e8c42a9', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '平地步行', '8', null, null, '2019-09-29 10:41:50', 'system', '0', '2019-09-29 18:41:50', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('afab8859-0db1-4e69-9920-4af67e7c6089', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', '入厕', '8', null, null, '2019-09-29 10:39:00', 'system', '0', '2019-09-29 18:38:59', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('b53bd891-cfc8-4aab-bd99-75178cc20dc8', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', '平地步行', '8', null, null, '2019-09-29 10:39:00', 'system', '0', '2019-09-29 18:38:59', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('b8d77042-3836-484b-9751-ddbdba11999f', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', '进食', '8', null, null, '2019-09-29 10:39:00', 'system', '0', '2019-09-29 18:38:59', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('db3a12b1-c119-4ae1-8a08-5560b26ed07f', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '穿衣', '5', null, null, '2019-09-29 10:41:50', 'system', '0', '2019-09-29 18:41:50', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('e1394ebe-ff77-4443-ba82-6bb8b7a8f79a', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '进食', '2', null, null, '2019-09-29 10:41:50', 'system', '0', '2019-09-29 18:41:50', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('e3367993-4311-4478-ad95-920cf93f8146', '6f151c29-ae38-40db-9d62-413dd45860ea', '床椅转移', '12', null, null, '2019-10-08 10:53:06', 'system', '0', '2019-10-08 18:53:05', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('ef0d75c6-41d6-4d6c-aca9-76adb4856475', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '上下楼梯', '5', null, null, '2019-09-29 10:41:50', 'system', '0', '2019-09-29 18:41:50', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('f5ca3fd8-c95e-4f2d-aa4c-d4c433466812', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', '使用轮椅', '4', null, null, '2019-09-29 10:39:00', 'system', '0', '2019-09-29 18:38:59', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('f96c06e5-ecdc-4e98-93b6-fc1696d831d5', '6f151c29-ae38-40db-9d62-413dd45860ea', '穿衣', '5', null, null, '2019-10-08 10:53:06', 'system', '0', '2019-10-08 18:53:05', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('face8512-366d-4a16-91cb-0f56a0dda639', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '入厕', '8', null, null, '2019-09-29 10:41:50', 'system', '0', '2019-09-29 18:41:50', 'system');
INSERT INTO `sys_assess_adl_info` VALUES ('fe9a2c4d-45b3-4a59-8e05-96dfa21c4030', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '小便控制', '10', null, null, '2019-09-29 10:41:50', 'system', '0', '2019-09-29 18:41:50', 'system');

-- ----------------------------
-- Table structure for sys_assess_ashworth_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_assess_ashworth_info`;
CREATE TABLE `sys_assess_ashworth_info` (
  `uuid` varchar(36) NOT NULL,
  `assess_uuid` varchar(36) DEFAULT NULL,
  `jibie` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新人员',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_assess_ashworth_info
-- ----------------------------
INSERT INTO `sys_assess_ashworth_info` VALUES ('38a2b658-3023-4f9a-9fd6-dcdacbe0cd5f', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '1级', '2019-09-29 10:41:54', 'system', '0', '', '2019-09-29 18:41:54', 'healthy');
INSERT INTO `sys_assess_ashworth_info` VALUES ('71787328-dc6e-41ca-8013-5aece2fb801b', '5ce99bf9-c944-4668-a440-a39b040761de', '3级', '2019-09-29 12:54:24', 'system', '0', '', '2019-09-29 20:54:24', 'healthy');
INSERT INTO `sys_assess_ashworth_info` VALUES ('76bd0244-c239-446c-939e-edc7bd14ff17', '6f151c29-ae38-40db-9d62-413dd45860ea', '1＋级', '2019-10-08 10:53:17', 'system', '0', '', '2019-10-08 18:53:17', 'healthy');
INSERT INTO `sys_assess_ashworth_info` VALUES ('ad6477b2-f349-42f2-ac2b-d311b8548455', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', '3级', '2019-09-29 10:38:25', 'system', '0', '', '2019-09-29 18:38:24', 'healthy');

-- ----------------------------
-- Table structure for sys_assess_asia_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_assess_asia_info`;
CREATE TABLE `sys_assess_asia_info` (
  `uuid` varchar(36) NOT NULL,
  `assess_uuid` varchar(36) DEFAULT NULL,
  `jibie` varchar(255) DEFAULT NULL,
  `biaoxian` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新人员',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_assess_asia_info
-- ----------------------------
INSERT INTO `sys_assess_asia_info` VALUES ('19faad5e-c9cf-458a-9476-a6f4c9142e92', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', 'D.不完全损伤', null, '2019-09-29 10:42:05', 'system', '0', '', '2019-09-29 18:42:05', 'healthy');
INSERT INTO `sys_assess_asia_info` VALUES ('2af4c81b-0490-4b2e-bc51-c98589afcebd', '5ce99bf9-c944-4668-a440-a39b040761de', 'C.不完全损伤', null, '2019-09-29 12:55:45', 'system', '0', '', '2019-09-29 20:55:44', 'healthy');
INSERT INTO `sys_assess_asia_info` VALUES ('7ac0929f-db69-4a5a-bf35-5d31cbf498a2', '6f151c29-ae38-40db-9d62-413dd45860ea', null, null, '2019-10-08 10:54:58', 'system', '0', null, '2019-10-08 18:54:58', 'system');
INSERT INTO `sys_assess_asia_info` VALUES ('fe393486-1534-4131-b70d-d2181ee0ba16', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', 'D.不完全损伤', null, '2019-09-29 10:39:05', 'system', '0', '', '2019-09-29 18:39:05', 'healthy');

-- ----------------------------
-- Table structure for sys_assess_brunnstrom
-- ----------------------------
DROP TABLE IF EXISTS `sys_assess_brunnstrom`;
CREATE TABLE `sys_assess_brunnstrom` (
  `uuid` varchar(36) NOT NULL,
  `assess_uuid` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `score` varchar(10) DEFAULT NULL,
  `discription` varchar(255) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新人员',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_assess_brunnstrom
-- ----------------------------
INSERT INTO `sys_assess_brunnstrom` VALUES ('138ad006-1ea9-4f92-a89b-b7905475953c', '5ce99bf9-c944-4668-a440-a39b040761de', '手', '6', null, null, '2019-09-29 12:56:00', 'system', '0', '2019-09-29 20:55:59', 'system');
INSERT INTO `sys_assess_brunnstrom` VALUES ('3aa79e8c-39ce-4040-85b9-fab8c2316a00', '5ce99bf9-c944-4668-a440-a39b040761de', '下肢', '5', null, null, '2019-09-29 12:56:00', 'system', '0', '2019-09-29 20:55:59', 'system');
INSERT INTO `sys_assess_brunnstrom` VALUES ('490b2da7-09d7-4e62-8a1b-129fcb421643', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', '上肢', '4', null, null, '2019-09-29 10:40:01', 'healthy', '0', '2019-09-29 18:40:01', 'healthy');
INSERT INTO `sys_assess_brunnstrom` VALUES ('5b7c3520-bfef-4932-acdf-ed90fe53bf1a', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '下肢', '6', null, null, '2019-09-29 10:42:04', 'system', '0', '2019-09-29 18:42:03', 'system');
INSERT INTO `sys_assess_brunnstrom` VALUES ('6f433593-f3a4-47d6-ae07-95a80826be42', '6f151c29-ae38-40db-9d62-413dd45860ea', '下肢', '1', null, null, '2019-10-08 10:54:54', 'system', '0', '2019-10-08 18:54:53', 'system');
INSERT INTO `sys_assess_brunnstrom` VALUES ('b4fe4b8c-be29-4932-9b9e-e88a3c07c01c', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', '手', '5', null, null, '2019-09-29 10:40:01', 'healthy', '0', '2019-09-29 18:40:01', 'healthy');
INSERT INTO `sys_assess_brunnstrom` VALUES ('cded006d-f9b5-44be-a582-9ffa3c5166e4', '3746c4ed-ff80-4a4b-bdd3-5a36d6b229b3', '下肢', '6', null, null, '2019-09-29 10:40:01', 'healthy', '0', '2019-09-29 18:40:01', 'healthy');
INSERT INTO `sys_assess_brunnstrom` VALUES ('cf7b982f-365c-42b4-8a3e-e4ceb801451a', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '手', '6', null, null, '2019-09-29 10:42:04', 'system', '0', '2019-09-29 18:42:03', 'system');
INSERT INTO `sys_assess_brunnstrom` VALUES ('d7e93cdf-ccbb-4183-875f-691e06d66208', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '上肢', '6', null, null, '2019-09-29 10:42:04', 'system', '0', '2019-09-29 18:42:03', 'system');

-- ----------------------------
-- Table structure for sys_assess_fim_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_assess_fim_info`;
CREATE TABLE `sys_assess_fim_info` (
  `uuid` varchar(36) NOT NULL,
  `assess_uuid` varchar(36) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `discription` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新人员',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_assess_fim_info
-- ----------------------------
INSERT INTO `sys_assess_fim_info` VALUES ('077a4b5a-7033-4832-8d0b-1159e0a5f2a2', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '穿裤子', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('0a5bcbb4-ee3d-43ae-b81b-ee3ceebb7323', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '床、椅、轮椅间', '6', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');
INSERT INTO `sys_assess_fim_info` VALUES ('0e9cb7c3-dfbc-4d90-976f-25be80d30fb5', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '记忆', '7', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');
INSERT INTO `sys_assess_fim_info` VALUES ('172706e9-f352-4674-8ba3-8859ff69470c', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '盆浴或淋浴', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('19c3682c-2c67-496f-a760-83c144ca5289', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '进食', '6', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');
INSERT INTO `sys_assess_fim_info` VALUES ('24a0f302-bc45-4ba5-bba9-80d9eb2dd8e2', '5ce99bf9-c944-4668-a440-a39b040761de', null, '入厕', '3', null, '2019-09-29 12:55:36', 'system', '0', '2019-09-29 20:55:36', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('27c1251f-d977-42ac-bac1-12ac4a815978', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '步行、轮椅', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('2d0db209-33df-4b20-aa6a-cb53f44359b1', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '床、椅、轮椅间', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('349023a0-c8fb-4387-955f-96d984dcd6a8', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '社会交往', '6', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');
INSERT INTO `sys_assess_fim_info` VALUES ('35e62310-1497-4f49-a4b4-da30146759e2', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '进食', '4', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('47b53d9e-3318-4c2f-b188-e82ba91ddb23', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '上下楼梯', '4', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');
INSERT INTO `sys_assess_fim_info` VALUES ('483237cb-de74-43d4-a49b-368602814fcc', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '洗澡', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('4ab87f2d-e3ed-478e-a30c-369da4cf78a3', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '上下楼梯', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('4b7164aa-a54f-4d8a-b2df-7247e206a7e2', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '理解', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('4ff3c43e-4a91-462a-be4a-e215b8c8dfb0', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '理解', '7', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');
INSERT INTO `sys_assess_fim_info` VALUES ('6240086c-9a29-4a4a-b863-0de2b8703df1', '5ce99bf9-c944-4668-a440-a39b040761de', null, '步行、轮椅', '2', null, '2019-09-29 12:55:36', 'system', '0', '2019-09-29 20:55:36', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('636c1d60-d00d-4592-9e91-643b21525804', '5ce99bf9-c944-4668-a440-a39b040761de', null, '直肠管理', '2', null, '2019-09-29 12:55:36', 'system', '0', '2019-09-29 20:55:36', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('67e33d18-1950-4c55-a006-ac72aca664c1', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '上厕所', '6', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');
INSERT INTO `sys_assess_fim_info` VALUES ('9e143c33-9eb1-4406-b9c0-3b810457b36a', '5ce99bf9-c944-4668-a440-a39b040761de', null, '穿裤子', '3', null, '2019-09-29 12:55:36', 'system', '0', '2019-09-29 20:55:36', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('a21dc898-3e0a-4177-91c8-0127916bd8b0', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '步行、轮椅', '7', null, '2019-10-08 02:19:44', 'system', '0', '2019-10-08 10:19:43', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('ab936490-0e11-4aa5-9529-cac78b42cb99', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '社会交往', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('abe31559-d1e2-404d-955a-5bc5a6e2a179', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '梳洗修饰', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('b37c48c4-bfbc-4fe6-aac1-5b745a9a3fd3', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '直肠管理', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('bfd94693-8e04-4af8-b719-e0d4d940d871', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '入厕', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('c0f744a0-57f4-4f2f-9339-c510a3291cc4', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '表达', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('c5d42702-c365-4b74-aad6-db20480ae65c', '5ce99bf9-c944-4668-a440-a39b040761de', null, '盆浴或淋浴', '2', null, '2019-09-29 12:55:36', 'system', '0', '2019-09-29 20:55:36', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('d6d30227-1933-4de9-a06c-8082d72f3e41', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '解决问题', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('d6fe680a-ca11-4bbf-8e67-6cd96975ca79', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '上厕所', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('d93bd435-db07-40a3-8628-cd1b17d172ec', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '直肠管理', '7', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');
INSERT INTO `sys_assess_fim_info` VALUES ('d9df60ba-e03e-4351-9978-f93ae711fdcf', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '入厕', '4', null, '2019-10-08 02:19:44', 'system', '0', '2019-10-08 10:19:43', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('e08aa14a-293f-41cb-9576-0fdd14589c39', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '穿上衣', '6', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');
INSERT INTO `sys_assess_fim_info` VALUES ('e2743cc8-bac4-4ad8-9a16-4560ed831499', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '梳洗修饰', '7', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');
INSERT INTO `sys_assess_fim_info` VALUES ('e4ef0c8f-ac42-473a-afe3-12f3032a5544', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '膀胱管理', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('e5542c46-36e6-42c4-b834-d34a21367cdd', '5ce99bf9-c944-4668-a440-a39b040761de', null, '上厕所', '4', null, '2019-09-29 12:55:36', 'system', '0', '2019-09-29 20:55:36', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('e68afd5c-f566-4460-9bdb-c3e89eae6f01', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '膀胱管理', '6', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');
INSERT INTO `sys_assess_fim_info` VALUES ('e87f7912-02a7-435b-87eb-26a35bdf9dd6', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '解决问题', '7', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');
INSERT INTO `sys_assess_fim_info` VALUES ('eafc3e79-a984-4080-aed1-49d1169a6b09', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '表达', '4', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');
INSERT INTO `sys_assess_fim_info` VALUES ('eec3d480-dac2-4b56-827d-d16b29eea403', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '穿上衣', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('f3e98582-9c90-4614-8d71-2d8f6fd49380', '6f151c29-ae38-40db-9d62-413dd45860ea', null, '记忆', '3', null, '2019-10-08 10:54:11', 'system', '0', '2019-10-08 18:54:10', 'system');
INSERT INTO `sys_assess_fim_info` VALUES ('f4bc3ddf-dfbb-4bed-a0ab-2b4360251ff3', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '穿裤子', '6', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');
INSERT INTO `sys_assess_fim_info` VALUES ('f5592648-3bf8-4b1e-b61d-a16325ee30c4', '0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', null, '盆浴或淋浴', '4', null, '2019-10-08 02:19:44', 'healthy', '0', '2019-10-08 10:19:43', 'healthy');

-- ----------------------------
-- Table structure for sys_assess_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_assess_info`;
CREATE TABLE `sys_assess_info` (
  `uuid` varchar(36) NOT NULL,
  `base_uuid` varchar(36) DEFAULT NULL,
  `guomin` varchar(10) DEFAULT NULL,
  `waishang` varchar(10) DEFAULT NULL,
  `yichuan` varchar(10) DEFAULT NULL,
  `daxiaobian` varchar(10) DEFAULT NULL,
  `yisizhuangtai` varchar(10) DEFAULT NULL,
  `zizhunengli` varchar(10) DEFAULT NULL,
  `tizheng` varchar(10) DEFAULT NULL,
  `adl` int(11) DEFAULT NULL,
  `ashworth` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fim` int(11) DEFAULT NULL,
  `burnnstrom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `asia` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新人员',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_assess_info
-- ----------------------------
INSERT INTO `sys_assess_info` VALUES ('0bd6c9d4-49ce-4c8e-a1ba-fdbfaf04cf41', '2', '有', '无', '有', '正常', '嗜睡', '正常', '否', '72', '1级', '100', '上肢:6;手:6;下肢:6;', 'D.不完全损伤', '2019-09-29 10:41:27', 'system', '0', '', '2019-09-29 18:41:26', 'healthy');
INSERT INTO `sys_assess_info` VALUES ('1abee5c3-11e4-47ea-a76c-7effda7428a6', '586a808f-0fd0-4841-bee3-de1268152ed2', null, null, null, null, null, null, null, null, null, null, null, null, '2019-10-09 14:22:47', 'system', '0', null, '2019-10-09 22:22:47', 'system');
INSERT INTO `sys_assess_info` VALUES ('5ce99bf9-c944-4668-a440-a39b040761de', 'a35fc200-e2c2-4c0b-af84-bd8c350dc447', '有', '有', '有', '正常', '正常', '正常', '否', '58', '3级', '16', '上肢: /6;手:6;下肢:5;', 'C.不完全损伤', '2019-09-29 12:54:11', 'system', '0', '', '2019-09-29 20:54:11', 'healthy');
INSERT INTO `sys_assess_info` VALUES ('6688a55f-bbf1-4bc4-9bcf-c2fe7764dc6b', '60fc131a-80f7-48d6-b420-6e323d45a871', null, null, null, null, null, null, null, null, null, null, null, null, '2019-10-09 14:20:52', 'system', '0', null, '2019-10-09 22:20:52', 'system');
INSERT INTO `sys_assess_info` VALUES ('6f151c29-ae38-40db-9d62-413dd45860ea', '8eebeb87-4bf4-4ada-83ea-ce805ae57e55', null, null, null, null, null, null, null, '59', '1＋级', '55', '下肢:1;', null, '2019-10-08 10:50:17', 'system', '0', null, '2019-10-08 18:50:17', 'system');
INSERT INTO `sys_assess_info` VALUES ('f3c283b5-9e69-42d3-bcd4-e2a20549c247', '085fad18-88ec-493b-a8fa-0ffc9cfba379', null, null, null, null, null, null, null, null, null, null, null, null, '2019-10-09 14:20:37', 'system', '0', null, '2019-10-09 22:20:36', 'system');

-- ----------------------------
-- Table structure for sys_assess_risk_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_assess_risk_info`;
CREATE TABLE `sys_assess_risk_info` (
  `uuid` varchar(36) NOT NULL,
  `base_uuid` varchar(36) DEFAULT NULL,
  `xueshuan` varchar(10) DEFAULT NULL,
  `xueguanbingshi` varchar(10) DEFAULT NULL,
  `yongguokangneng` varchar(10) DEFAULT NULL,
  `huxi` varchar(10) DEFAULT NULL,
  `xiaohua` varchar(10) DEFAULT NULL,
  `shenjing` varchar(10) DEFAULT NULL,
  `zuzhiji` varchar(10) DEFAULT NULL,
  `qita` varchar(10) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新人员',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_assess_risk_info
-- ----------------------------
INSERT INTO `sys_assess_risk_info` VALUES ('559f33f6-d306-4e45-bc14-4db34c765b72', '2', '有', '无', '无', '无', '有', '极危低', '有', '无', '2019-09-29 10:42:12', 'system', '0', '', '2019-09-29 18:42:11', 'healthy');
INSERT INTO `sys_assess_risk_info` VALUES ('85b986f1-ed33-41e1-81bf-ebbf99c9d334', 'a35fc200-e2c2-4c0b-af84-bd8c350dc447', null, null, null, null, null, null, null, null, '2019-09-29 12:56:36', 'system', '0', null, '2019-09-29 20:56:35', 'system');
INSERT INTO `sys_assess_risk_info` VALUES ('b51157e4-786d-44ae-8330-39447000a8b8', '8eebeb87-4bf4-4ada-83ea-ce805ae57e55', null, null, null, null, null, null, null, null, '2019-10-08 10:50:55', 'system', '0', null, '2019-10-08 18:50:54', 'system');
INSERT INTO `sys_assess_risk_info` VALUES ('f3d31621-d794-42f6-a35a-01458d0984e1', '586a808f-0fd0-4841-bee3-de1268152ed2', null, null, null, null, null, null, null, null, '2019-10-09 14:32:56', 'system', '0', null, '2019-10-09 22:32:55', 'system');

-- ----------------------------
-- Table structure for sys_comn_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_comn_logs`;
CREATE TABLE `sys_comn_logs` (
  `uuid` varchar(36) NOT NULL COMMENT '主键',
  `args` text COMMENT '请求参数',
  `class_method` varchar(200) DEFAULT NULL COMMENT '方法名',
  `class_name` varchar(500) DEFAULT NULL COMMENT '类名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `ip` varchar(200) DEFAULT NULL COMMENT 'ip',
  `method` varchar(200) DEFAULT NULL COMMENT '请求method',
  `request_long` int(11) DEFAULT NULL COMMENT '请求响应时间',
  `url` varchar(200) DEFAULT NULL COMMENT '地址',
  `browser` varchar(1000) DEFAULT NULL COMMENT '浏览器',
  `browser_type` varchar(50) DEFAULT NULL COMMENT '浏览器名称',
  `message` varchar(2000) DEFAULT NULL COMMENT '请求参数',
  `model` varchar(50) DEFAULT NULL COMMENT '手机型号',
  `os` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `param_list` varchar(2000) DEFAULT NULL COMMENT '请求参数',
  `table_name` varchar(100) DEFAULT NULL COMMENT '请求参数',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_comn_logs
-- ----------------------------

-- ----------------------------
-- Table structure for sys_department_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_department_info`;
CREATE TABLE `sys_department_info` (
  `uuid` varchar(32) NOT NULL,
  `department_name` varchar(50) NOT NULL,
  `organization_id` varchar(32) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新人员',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department_info
-- ----------------------------
INSERT INTO `sys_department_info` VALUES ('214F6F1048626F0C6792E19BF57C1F07', 'user', '3CE6C80F33B624C1BB1B016A79083694', '2018-02-23 11:47:11', null, null, 'user', '2018-02-23 11:47:11', null);
INSERT INTO `sys_department_info` VALUES ('2476DC8ED9FE9483FB956C2EFEB8E39E', 'test', '3CE6C80F33B624C1BB1B016A79083694', '2018-02-22 10:59:21', null, null, 'test', '2018-02-22 10:59:21', 'system');
INSERT INTO `sys_department_info` VALUES ('BD174B512EB1A0B87FF6E6CE6B171393', 'admin', '3CE6C80F33B624C1BB1B016A79083694', '2018-02-12 16:23:00', null, null, 'admin', '2018-02-12 16:23:00', 'system');

-- ----------------------------
-- Table structure for sys_file_img_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_img_info`;
CREATE TABLE `sys_file_img_info` (
  `uuid` varchar(36) NOT NULL COMMENT '主键',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新人员',
  `base_uuid` varchar(255) DEFAULT NULL,
  `file_local_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_name_small` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_file_img_info
-- ----------------------------
INSERT INTO `sys_file_img_info` VALUES ('478a2d97-9858-4f1d-b1dc-9582be1a90ad', '2019-10-09 04:04:09', 'healthy', '0', null, '2019-10-09 12:04:09', null, '2', '/20191009/1570583707212.jpg', '1570583707212.jpg', '193592', '/20191009/1570583707212.jpg');
INSERT INTO `sys_file_img_info` VALUES ('055c9c08-d4dd-484e-bd50-56aa4ddc65af', '2019-10-09 04:04:25', 'healthy', '0', null, '2019-10-09 12:04:24', null, '2', '/20191009/Screenshot_2019-10-08-02-36-43-438_com.tencent.tmgp.mrjj.png', 'Screenshot_2019-10-08-02-36-43-438_com.tencent.tmgp.mrjj.png', '1237403', '/20191009/Screenshot_2019-10-08-02-36-43-438_com.tencent.tmgp.mrjj.small.jpg');
INSERT INTO `sys_file_img_info` VALUES ('a5f70e51-88e1-458e-8876-9fcf3b419caf', '2019-10-09 04:07:04', 'healthy', '0', null, '2019-10-09 12:07:04', null, '2', '/20191009/1570593998040.jpg', '1570593998040.jpg', '5079924', '/20191009/1570593998040.jpg');
INSERT INTO `sys_file_img_info` VALUES ('661bdef4-44ae-4e76-aa01-583f74219b59', '2019-10-09 04:33:42', 'healthy', '0', null, '2019-10-09 12:33:42', null, '8eebeb87-4bf4-4ada-83ea-ce805ae57e55', '/20191009/61269986-758D-44B0-80EC-E5E89CE2FD2E.jpeg', '61269986-758D-44B0-80EC-E5E89CE2FD2E.jpeg', '62861', '/20191009/61269986-758D-44B0-80EC-E5E89CE2FD2E.jpeg');
INSERT INTO `sys_file_img_info` VALUES ('7a02457a-ee59-4f62-980d-5f032f3ed236', '2019-10-09 14:36:15', 'healthy', '0', null, '2019-10-09 22:36:14', null, '586a808f-0fd0-4841-bee3-de1268152ed2', '/20191009/P9210187.JPG', 'P9210187.JPG', '1228407', '/20191009/P9210187.JPG');

-- ----------------------------
-- Table structure for sys_healthy_base_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_healthy_base_info`;
CREATE TABLE `sys_healthy_base_info` (
  `uuid` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `disable_card` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `home_address` varchar(500) DEFAULT NULL,
  `disable_type` varchar(255) DEFAULT NULL,
  `disable_type_name` varchar(255) DEFAULT NULL,
  `path_assess` varchar(1000) DEFAULT NULL,
  `body_assess` varchar(1000) DEFAULT NULL,
  `main_assess_person` varchar(100) DEFAULT NULL,
  `second_assess_person` varchar(100) DEFAULT NULL,
  `full_time_member` varchar(100) DEFAULT NULL,
  `assess_time` date DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新人员',
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_telphone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_healthy_base_info
-- ----------------------------
INSERT INTO `sys_healthy_base_info` VALUES ('085fad18-88ec-493b-a8fa-0ffc9cfba379', '', '', '', null, null, null, null, null, null, null, null, null, null, '2019-10-09 14:20:36', null, null, null, '2019-10-09 22:20:36', null, null, null);
INSERT INTO `sys_healthy_base_info` VALUES ('1', '张三1', '2201684955553554', '3221546', '男', '金方块都聊啥记录', '截瘫', '截瘫', '反对萨芬大范德萨发大厦', '范德萨发大厦发的啥范德萨发大厦', '李金铭', '赵大夫', '刘丽', '2019-09-24', '2019-09-25 11:14:26', 'system', null, null, '2019-09-25 11:14:26', 'healthy', 'zhangl ', '123156456');
INSERT INTO `sys_healthy_base_info` VALUES ('2', '李四', '2201684955552554', '55647778', '女', '和放假哒师傅多少', '脑瘫', '麻痹', '范德萨发大厦范德萨发大厦发的啥范德萨发大厦', '范德萨发大厦范德萨发大厦发的啥范德萨发大厦', '赵铁柱', '王二丫', '萧柱子', '2019-09-19', '2019-09-25 13:37:17', 'system', null, '', '2019-09-25 13:37:17', 'healthy', '铁通', '5446546466');
INSERT INTO `sys_healthy_base_info` VALUES ('586a808f-0fd0-4841-bee3-de1268152ed2', '', '', '', null, null, null, null, null, null, null, null, null, null, '2019-10-09 14:22:47', null, null, null, '2019-10-09 22:22:46', null, null, null);
INSERT INTO `sys_healthy_base_info` VALUES ('60fc131a-80f7-48d6-b420-6e323d45a871', '', '', '', null, null, null, null, null, null, null, null, null, null, '2019-10-09 14:20:52', null, null, null, '2019-10-09 22:20:51', null, null, null);
INSERT INTO `sys_healthy_base_info` VALUES ('8eebeb87-4bf4-4ada-83ea-ce805ae57e55', '丛铀', '210203196210205028', '21020319621020502842', '女', '街道；202号', '偏瘫', '', '', '', '', '', '', '2019-10-07', '2019-10-08 10:50:17', null, null, '', '2019-10-08 18:50:16', 'healthy', '张*', '135000000');
INSERT INTO `sys_healthy_base_info` VALUES ('a35fc200-e2c2-4c0b-af84-bd8c350dc447', '', '', '', null, null, null, null, null, null, null, null, null, null, '2019-09-28 14:14:26', null, null, null, '2019-09-28 22:14:26', null, null, null);

-- ----------------------------
-- Table structure for sys_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_info`;
CREATE TABLE `sys_menu_info` (
  `uuid` varchar(50) NOT NULL COMMENT '主键',
  `system_id` varchar(36) DEFAULT '99c74ada3a1411e6bdcb10bf48e1d36a' COMMENT '系统id',
  `parents_id` varchar(36) DEFAULT NULL COMMENT '父id',
  `name` varchar(50) DEFAULT NULL COMMENT '地址名称',
  `icon` varchar(40) DEFAULT NULL COMMENT '显示图标样式',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `uri` varchar(2000) DEFAULT NULL COMMENT '地址资源',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_user` varchar(100) DEFAULT 'system' COMMENT '更新人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `type` varchar(50) DEFAULT '菜单' COMMENT '菜单还是方法',
  `icon_skin` varchar(50) DEFAULT NULL COMMENT '显示图标样式',
  `checked` tinyint(1) DEFAULT NULL COMMENT '显示图标样式',
  `home_page` tinyint(1) DEFAULT NULL COMMENT '首页',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu_info
-- ----------------------------
INSERT INTO `sys_menu_info` VALUES ('2146130099979805B1DE119DCB3BA551', null, '4c8820df-6447-11e7-a272-0025d3a93601', '用户管理', 'fa  fa-sitemap', '5', 'pages/softm/userbase/index.html', '项目权限', null, null, 'system', null, '0', null, null, null, '0');
INSERT INTO `sys_menu_info` VALUES ('2DE3EC6E220377A7630BB7F31D18097C', null, '0', '辅具适配', 'fa fa-check-circle', null, '/', '辅具适配', 'system', '2019-09-23 16:27:07', 'healthy', null, '0', null, null, null, '0');
INSERT INTO `sys_menu_info` VALUES ('31B5F7CFB6C226C5D59C5B3E714F49C4', null, '4c8820df-6447-11e7-a272-0025d3a93601', '日志', 'fa fa-hourglass', '5', '/pages/logs/base/index.html', 'log', 'system', '2019-09-25 10:05:13', 'healthy', null, '0', null, null, null, '0');
INSERT INTO `sys_menu_info` VALUES ('47b47eabc8e340ea9d2e758506da1ccd', null, '2DE3EC6E220377A7630BB7F31D18097C', '辅助器具评估', 'fa fa-gear', '2', '/pages/healthy/report/syshealthybaseinfo.html', '辅助器具评估', 'healthy', '2019-09-25 10:17:03', 'system', '2019-09-25 10:17:03', '0', null, null, null, '1');
INSERT INTO `sys_menu_info` VALUES ('4c87fb94-6447-11e7-a272-0025d3a93601', null, '4c8820df-6447-11e7-a272-0025d3a93601', '系统配置', 'fa  fa-navicon', '1', 'pages/softm/sysmenu/system_function_ztree.html', '系统导航功能1', 'test', null, null, null, '0', null, null, null, '0');
INSERT INTO `sys_menu_info` VALUES ('4c87fe75-6447-11e7-a272-0025d3a93601', '99c74ada3a1411e6bdcb10bf48e1d36a', '2c90838f57c6e02e0157c729a86b000b', '数据库备份', 'glyphicon glyphicon-paste', '0', 'pages/error/404.html', '数据备份、数据还原', null, null, '超级管理员', null, '0', '菜单', 'glyphicon glyphicon-paste', null, '0');
INSERT INTO `sys_menu_info` VALUES ('4c8820df-6447-11e7-a272-0025d3a93601', null, '0', '系统管理', 'fa fa-cog', '6', 'pages/error/404.html', '', null, null, '', null, '0', '菜单', 'fa fa-cog', null, '0');
INSERT INTO `sys_menu_info` VALUES ('6066CE0BC69A1F05636BA0871C5D9AC5', null, '2DE3EC6E220377A7630BB7F31D18097C', '数据统计', 'fa fa-bar-chart-o', '2', '/pages/healthy/echarts/index.html', '数据统计', 'healthy', '2019-09-23 16:16:44', 'healthy', null, '0', null, null, null, '0');
INSERT INTO `sys_menu_info` VALUES ('9419DC15C84351C8F038B2B0E5302FEC', null, '4c8820df-6447-11e7-a272-0025d3a93601', '角色与权限管理', 'fa fa-map-marker', '3', 'pages/softm/department/index.html', '单位部门', null, null, 'system', null, '0', null, null, null, '0');

-- ----------------------------
-- Table structure for sys_organization_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization_info`;
CREATE TABLE `sys_organization_info` (
  `uuid` varchar(32) NOT NULL,
  `organization_code` varchar(50) NOT NULL,
  `organization_name` varchar(32) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新人员',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_organization_info
-- ----------------------------
INSERT INTO `sys_organization_info` VALUES ('3CE6C80F33B624C1BB1B016A79083694', 'admin', 'admin', '2018-02-12 16:22:42', null, '1', 'admin', '2018-02-12 16:22:42', 'system');

-- ----------------------------
-- Table structure for sys_roles_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_info`;
CREATE TABLE `sys_roles_info` (
  `uuid` varchar(32) NOT NULL,
  `department_id` varchar(50) NOT NULL,
  `role_name` varchar(32) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新人员',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新时间',
  `checked` tinyint(1) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_info
-- ----------------------------
INSERT INTO `sys_roles_info` VALUES ('1A5693C0C9E05009D474899A0CF5F19F', 'BD174B512EB1A0B87FF6E6CE6B171393', 'admin', '2018-02-12 16:23:06', null, '1', 'admin', '2019-06-13 10:09:19', 'system', '0');
INSERT INTO `sys_roles_info` VALUES ('402789157809DB4B937A6DC792C89045', '2476DC8ED9FE9483FB956C2EFEB8E39E', 'healthy', '2019-09-23 05:47:11', null, null, 'healthy', '2019-09-23 13:47:11', null, '0');
INSERT INTO `sys_roles_info` VALUES ('7EC06172A9CCD45EBF0952A463F4CF95', '214F6F1048626F0C6792E19BF57C1F07', 'user', '2018-02-23 11:47:25', null, '1', 'user', '2019-06-13 10:09:19', null, '1');
INSERT INTO `sys_roles_info` VALUES ('BEB0D81B918DD968D24D6F95AC15A753', '2476DC8ED9FE9483FB956C2EFEB8E39E', 'test', '2018-02-22 10:59:31', null, '1', 'test', '2019-06-13 10:45:34', 'system', '0');

-- ----------------------------
-- Table structure for sys_roles_jurisdiction_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_jurisdiction_info`;
CREATE TABLE `sys_roles_jurisdiction_info` (
  `menu_id` varchar(36) NOT NULL COMMENT '菜单id',
  `role_id` varchar(36) NOT NULL COMMENT '角色id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新人员',
  `checked` int(11) DEFAULT '0' COMMENT '资源功能描述',
  PRIMARY KEY (`menu_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_jurisdiction_info
-- ----------------------------
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('2146130099979805B1DE119DCB3BA551', '1A5693C0C9E05009D474899A0CF5F19F', '2019-09-23 08:32:02', null, null, null, '2019-09-23 16:32:01', null, '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('2146130099979805B1DE119DCB3BA551', '402789157809DB4B937A6DC792C89045', '2019-09-23 08:31:56', null, null, null, '2019-09-23 16:31:56', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('2146130099979805B1DE119DCB3BA551', 'BEB0D81B918DD968D24D6F95AC15A753', '2019-09-23 08:31:53', null, null, null, '2019-09-23 16:31:53', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('2DE3EC6E220377A7630BB7F31D18097C', '1A5693C0C9E05009D474899A0CF5F19F', '2019-09-25 06:35:57', null, null, null, '2019-09-25 14:35:56', null, '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('2DE3EC6E220377A7630BB7F31D18097C', '402789157809DB4B937A6DC792C89045', '2019-09-23 08:32:06', null, null, null, '2019-09-23 16:32:05', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('2DE3EC6E220377A7630BB7F31D18097C', '7EC06172A9CCD45EBF0952A463F4CF95', '2019-09-23 08:31:48', null, null, null, '2019-09-23 16:31:48', null, '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('2DE3EC6E220377A7630BB7F31D18097C', 'BEB0D81B918DD968D24D6F95AC15A753', '2019-09-25 06:37:00', null, null, null, '2019-09-25 14:37:00', null, '0');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('31B5F7CFB6C226C5D59C5B3E714F49C4', '1A5693C0C9E05009D474899A0CF5F19F', '2019-09-25 06:36:00', null, null, null, '2019-09-25 14:36:00', null, '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('31B5F7CFB6C226C5D59C5B3E714F49C4', '402789157809DB4B937A6DC792C89045', '2019-09-25 02:05:26', null, null, null, '2019-09-25 10:05:26', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('31B5F7CFB6C226C5D59C5B3E714F49C4', 'BEB0D81B918DD968D24D6F95AC15A753', '2019-09-25 06:36:51', null, null, null, '2019-09-25 14:36:51', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('47b47eabc8e340ea9d2e758506da1ccd', '1A5693C0C9E05009D474899A0CF5F19F', '2019-09-25 06:35:57', null, null, null, '2019-09-25 14:35:56', null, '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('47b47eabc8e340ea9d2e758506da1ccd', '402789157809DB4B937A6DC792C89045', '2019-09-25 02:17:37', null, null, null, '2019-09-25 10:17:36', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('47b47eabc8e340ea9d2e758506da1ccd', '7EC06172A9CCD45EBF0952A463F4CF95', '2019-09-25 06:35:49', null, null, null, '2019-09-25 14:35:49', null, '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('47b47eabc8e340ea9d2e758506da1ccd', 'BEB0D81B918DD968D24D6F95AC15A753', '2019-09-25 10:17:03', 'system', null, null, '2019-09-25 10:17:03', null, '0');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('4c87fb94-6447-11e7-a272-0025d3a93601', '1A5693C0C9E05009D474899A0CF5F19F', '2019-09-23 08:32:02', null, null, null, '2019-09-23 16:32:01', null, '0');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('4c87fb94-6447-11e7-a272-0025d3a93601', '402789157809DB4B937A6DC792C89045', '2019-09-23 08:31:56', null, null, null, '2019-09-23 16:31:56', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('4c87fb94-6447-11e7-a272-0025d3a93601', 'BEB0D81B918DD968D24D6F95AC15A753', '2019-09-23 08:31:53', null, null, null, '2019-09-23 16:31:53', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('4c8820df-6447-11e7-a272-0025d3a93601', '1A5693C0C9E05009D474899A0CF5F19F', '2019-09-23 08:32:02', null, null, null, '2019-09-23 16:32:01', null, '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('4c8820df-6447-11e7-a272-0025d3a93601', '402789157809DB4B937A6DC792C89045', '2019-09-23 08:31:56', null, null, null, '2019-09-23 16:31:56', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('4c8820df-6447-11e7-a272-0025d3a93601', 'BEB0D81B918DD968D24D6F95AC15A753', '2019-09-23 08:31:53', null, null, null, '2019-09-23 16:31:53', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('4CFFBA0F0D2EC27A927B49186D2B928B', '1A5693C0C9E05009D474899A0CF5F19F', '2019-09-23 08:32:13', null, null, null, '2019-09-23 16:32:12', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('4CFFBA0F0D2EC27A927B49186D2B928B', '402789157809DB4B937A6DC792C89045', '2019-09-23 08:31:57', null, null, null, '2019-09-23 16:31:56', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('6066CE0BC69A1F05636BA0871C5D9AC5', '1A5693C0C9E05009D474899A0CF5F19F', '2019-09-23 08:32:13', null, null, null, '2019-09-23 16:32:12', null, '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('6066CE0BC69A1F05636BA0871C5D9AC5', '402789157809DB4B937A6DC792C89045', '2019-09-23 08:31:57', null, null, null, '2019-09-23 16:31:56', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('6066CE0BC69A1F05636BA0871C5D9AC5', '7EC06172A9CCD45EBF0952A463F4CF95', '2019-09-25 06:35:49', null, null, null, '2019-09-25 14:35:49', null, '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('6066CE0BC69A1F05636BA0871C5D9AC5', 'BEB0D81B918DD968D24D6F95AC15A753', '2019-09-25 06:37:00', null, null, null, '2019-09-25 14:37:00', null, '0');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('9419DC15C84351C8F038B2B0E5302FEC', '1A5693C0C9E05009D474899A0CF5F19F', '2019-09-23 08:32:02', null, null, null, '2019-09-23 16:32:01', null, '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('9419DC15C84351C8F038B2B0E5302FEC', '402789157809DB4B937A6DC792C89045', '2019-09-23 08:31:56', null, null, null, '2019-09-23 16:31:56', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('9419DC15C84351C8F038B2B0E5302FEC', 'BEB0D81B918DD968D24D6F95AC15A753', '2019-09-23 08:31:53', null, null, null, '2019-09-23 16:31:53', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('A554CF49625FE55DA199AAA271F957AD', '1A5693C0C9E05009D474899A0CF5F19F', '2019-09-23 08:32:02', null, null, null, '2019-09-23 16:32:01', null, '0');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('A554CF49625FE55DA199AAA271F957AD', '402789157809DB4B937A6DC792C89045', '2019-09-23 08:31:56', null, null, null, '2019-09-23 16:31:56', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('A554CF49625FE55DA199AAA271F957AD', 'BEB0D81B918DD968D24D6F95AC15A753', '2019-09-23 08:31:53', null, null, null, '2019-09-23 16:31:53', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('A92F8AA1F163F26BFF5AF38593A48954', '402789157809DB4B937A6DC792C89045', '2019-09-23 08:32:06', null, null, null, '2019-09-23 16:32:05', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('A92F8AA1F163F26BFF5AF38593A48954', '7EC06172A9CCD45EBF0952A463F4CF95', '2019-09-23 08:31:48', null, null, null, '2019-09-23 16:31:48', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('AADC0A50FAB21A8C7DCD2CEE9EF4953C', '402789157809DB4B937A6DC792C89045', '2019-09-23 08:32:06', null, null, null, '2019-09-23 16:32:05', 'system', '1');
INSERT INTO `sys_roles_jurisdiction_info` VALUES ('AADC0A50FAB21A8C7DCD2CEE9EF4953C', '7EC06172A9CCD45EBF0952A463F4CF95', '2019-09-23 08:31:48', null, null, null, '2019-09-23 16:31:48', 'system', '1');

-- ----------------------------
-- Table structure for sys_system_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_system_info`;
CREATE TABLE `sys_system_info` (
  `uuid` varchar(32) NOT NULL,
  `discription` varchar(1024) NOT NULL,
  `system_name` varchar(100) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新人员',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_system_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_use_assess_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_use_assess_info`;
CREATE TABLE `sys_use_assess_info` (
  `uuid` varchar(36) NOT NULL,
  `base_uuid` varchar(36) DEFAULT NULL,
  `assistive_devices_name` varchar(255) DEFAULT NULL,
  `grant_time` date DEFAULT NULL,
  `use_state` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新人员',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_use_assess_info
-- ----------------------------
INSERT INTO `sys_use_assess_info` VALUES ('643561bc-e8b6-4f5f-a887-59fac938eae4', '586a808f-0fd0-4841-bee3-de1268152ed2', '轮椅', '2019-10-08', '', '2019-10-09 14:25:10', 'healthy', '0', '', '2019-10-09 22:25:09', 'healthy');
INSERT INTO `sys_use_assess_info` VALUES ('7640411b-b770-4b76-b90b-a1a31f20c3ab', '2', 'qwewq', '2018-12-31', 'qwe', '2019-09-29 10:43:01', 'healthy', '0', '', '2019-09-29 18:43:00', 'healthy');
INSERT INTO `sys_use_assess_info` VALUES ('7cb73dc1-1898-4b52-b3dd-e47ab5146144', '2', 'ewq', '2018-12-31', 'ewqe', '2019-09-29 11:35:03', 'healthy', '0', '', '2019-09-29 19:35:03', 'healthy');
INSERT INTO `sys_use_assess_info` VALUES ('a57b3736-c0f7-4925-924e-2fb0b5a4aef3', '8eebeb87-4bf4-4ada-83ea-ce805ae57e55', '轮椅', '2019-06-03', '正常', '2019-10-08 11:01:36', 'healthy', '0', '', '2019-10-08 19:01:35', 'healthy');

-- ----------------------------
-- Table structure for sys_use_assess_suggestion
-- ----------------------------
DROP TABLE IF EXISTS `sys_use_assess_suggestion`;
CREATE TABLE `sys_use_assess_suggestion` (
  `uuid` varchar(36) NOT NULL,
  `base_uuid` varchar(36) DEFAULT NULL,
  `assistive_devices_name` varchar(255) DEFAULT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新人员',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_use_assess_suggestion
-- ----------------------------
INSERT INTO `sys_use_assess_suggestion` VALUES ('a3dbc588-8220-41a0-bdeb-f106d7846102', '586a808f-0fd0-4841-bee3-de1268152ed2', '轮椅', '', '2019-10-09 14:28:53', 'healthy', '0', '', '2019-10-09 22:28:52', 'healthy');
INSERT INTO `sys_use_assess_suggestion` VALUES ('e273cb9e-e960-4e4f-8af5-22584a2bfed7', '2', '3qer', 'ewq', '2019-09-29 10:42:51', 'healthy', '0', '', '2019-09-29 18:42:50', 'healthy');
INSERT INTO `sys_use_assess_suggestion` VALUES ('ffb3dfb3-d29d-48ea-ba7a-3b1fd9a38a1a', '2', 'qwe', 'qwe', '2019-09-29 11:35:09', 'healthy', '0', '', '2019-09-29 19:35:08', 'healthy');

-- ----------------------------
-- Table structure for sys_user_base_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_base_info`;
CREATE TABLE `sys_user_base_info` (
  `uuid` varchar(36) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `password` varchar(68) NOT NULL,
  `persion_name` varchar(50) NOT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `user_name` varchar(50) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新人员',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新时间',
  `head_pic` varchar(1024) DEFAULT NULL COMMENT '头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(18) DEFAULT NULL COMMENT '电话',
  `addr` varchar(255) DEFAULT NULL,
  `ancestral_address` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `work_nature` varchar(50) DEFAULT NULL,
  `expected_salary` varchar(60) DEFAULT NULL,
  `expected_place` varchar(120) DEFAULT NULL,
  `statue` varchar(20) DEFAULT NULL,
  `resume_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `UK_filjsx4kbabuqh2fkxgd72dx5` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_base_info
-- ----------------------------
INSERT INTO `sys_user_base_info` VALUES ('0ff36f5ed8f34bd49d1d41b71c49f256', '27', '{bcrypt}$2a$10$6xJuDAoI4.rYPiK8YeN8Du223.cAaPGZaHlmXoH65e9QdDn2EROUe', 'user', '男', 'user', '2018-02-23 11:48:35', null, null, 'user', '2018-06-04 13:36:10', 'system', null, '111#@11', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_base_info` VALUES ('661ec573f3754815b5d2fe88a604d956', '22', '{bcrypt}$2a$10$nXIyXRAV0ny03yBFqjrjw.mH/lII8vuIEREVkA4rRpfOK70mlZC1S', '健康检查', '男', 'healthy', '2019-09-23 04:07:21', null, null, 'healthy 健康检查 用户', '2019-09-23 12:07:21', null, null, '514840279@qq.com', '13578787262', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_base_info` VALUES ('9988e4e2469e428ab117a1804c5a7b96', null, '{bcrypt}$2a$10$ROXROqTPFa/j9JFulB6EP.RJR4A5F9nA46w54rbFj/lAoJMZ./7g.', 'test', '男', 'test', '2018-02-22 10:59:53', null, null, '', '2018-06-04 13:36:25', 'system', null, '4322f21!@EWQ', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_base_info` VALUES ('fb48fff75ae24e40b975a9c6ce1a124d', '0', '{bcrypt}$2a$10$9xZWWAWcr7YThl2c0A/hSOWrjQvxGd0Tt5.Fh28/uZlzoqec/hWmC', 'admin', '1', 'admin', '2018-02-12 16:27:07', null, null, 'admin', '2018-02-12 16:27:07', 'system', null, 'admin', 'admin', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_user_roles_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_roles_info`;
CREATE TABLE `sys_user_roles_info` (
  `roles_id` varchar(36) NOT NULL COMMENT '角色id',
  `user_id` varchar(36) NOT NULL COMMENT '用户id',
  `checked` tinyint(1) DEFAULT NULL COMMENT '选中',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `create_user` varchar(50) DEFAULT 'system' COMMENT '录入人员',
  `delete_flag` int(11) DEFAULT '0' COMMENT '停用标记',
  `discription` varchar(200) DEFAULT NULL COMMENT '资源功能描述',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT 'system' COMMENT '更新人员',
  PRIMARY KEY (`roles_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_roles_info
-- ----------------------------
INSERT INTO `sys_user_roles_info` VALUES ('1A5693C0C9E05009D474899A0CF5F19F', '52b70459-d01c-404c-ad2e-b47f2c568aa2', '1', '2019-08-26 03:13:10', null, null, null, '2019-08-26 11:13:09', 'system');
INSERT INTO `sys_user_roles_info` VALUES ('1A5693C0C9E05009D474899A0CF5F19F', '661ec573f3754815b5d2fe88a604d956', '0', '2019-09-23 04:07:21', 'healthy', null, null, '2019-09-23 14:17:57', null);
INSERT INTO `sys_user_roles_info` VALUES ('1A5693C0C9E05009D474899A0CF5F19F', 'fb48fff75ae24e40b975a9c6ce1a124d', '1', '2019-08-26 03:12:39', null, null, null, '2019-08-26 11:12:38', 'system');
INSERT INTO `sys_user_roles_info` VALUES ('402789157809DB4B937A6DC792C89045', '661ec573f3754815b5d2fe88a604d956', '1', '2019-09-23 05:48:25', null, null, null, '2019-09-23 13:48:24', 'system');
INSERT INTO `sys_user_roles_info` VALUES ('7EC06172A9CCD45EBF0952A463F4CF95', '0ff36f5ed8f34bd49d1d41b71c49f256', '1', '2019-08-26 03:12:27', null, null, null, '2019-08-26 11:12:26', 'system');
INSERT INTO `sys_user_roles_info` VALUES ('7EC06172A9CCD45EBF0952A463F4CF95', '52b70459-d01c-404c-ad2e-b47f2c568aa2', '0', '2019-08-26 03:12:36', null, null, null, '2019-08-26 11:13:07', null);
INSERT INTO `sys_user_roles_info` VALUES ('7EC06172A9CCD45EBF0952A463F4CF95', '661ec573f3754815b5d2fe88a604d956', '0', '2019-09-23 04:07:21', 'healthy', null, null, '2019-09-23 13:48:24', null);
INSERT INTO `sys_user_roles_info` VALUES ('BEB0D81B918DD968D24D6F95AC15A753', '661ec573f3754815b5d2fe88a604d956', '0', '2019-09-23 04:07:21', 'healthy', '0', null, '2019-09-23 12:07:21', 'system');
INSERT INTO `sys_user_roles_info` VALUES ('BEB0D81B918DD968D24D6F95AC15A753', '9988e4e2469e428ab117a1804c5a7b96', '1', '2019-08-26 03:12:41', null, null, null, '2019-08-26 11:12:41', 'system');
