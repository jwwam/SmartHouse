/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : houses

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-26 14:27:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_sex` varchar(255) DEFAULT NULL,
  `admin_age` int(11) DEFAULT NULL,
  `admin_tel` varchar(255) DEFAULT NULL,
  `admin_phone` varchar(255) DEFAULT NULL,
  `admin_addr` varchar(255) DEFAULT NULL,
  `admin_memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminID`),
  KEY `FK3C3132FC5A52E05` (`adminID`),
  CONSTRAINT `FK3C3132FC5A52E05` FOREIGN KEY (`adminID`) REFERENCES `admin_account` (`admin_accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'aaa', '男', '23', '027-88888888', '1311111111', 'XXXXXXX', '系统管理员系统管理员系统管理员系统管理员系统管理员系统管理员系统管理员系统管理员系统管理员');

-- ----------------------------
-- Table structure for admin_account
-- ----------------------------
DROP TABLE IF EXISTS `admin_account`;
CREATE TABLE `admin_account` (
  `admin_accountID` int(11) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(255) DEFAULT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_accountID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_account
-- ----------------------------
INSERT INTO `admin_account` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for cars
-- ----------------------------
DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `carowner` varchar(255) DEFAULT NULL,
  `carspace` varchar(255) DEFAULT NULL,
  `housenumber` varchar(255) DEFAULT NULL,
  `licensenumber` varchar(255) DEFAULT NULL,
  `contactway` varchar(255) DEFAULT NULL,
  `carmsg` varchar(255) DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cars
-- ----------------------------
INSERT INTO `cars` VALUES ('2', '貂蝉', '001', 'A001', 'DC120', '13012345678', '上海大众', '2011-08-01 00:00:00');
INSERT INTO `cars` VALUES ('3', '张达明', '002', 'B001', 'ZDM121', '13112345678', '奥迪A6', '2012-08-01 00:00:00');
INSERT INTO `cars` VALUES ('4', '康乐', '003', 'F001', 'KL122', '13212345678', '比亚迪', '2013-08-02 00:00:00');
INSERT INTO `cars` VALUES ('5', '曹操', '004', 'A003', 'CC123', '35112345678', '奔驰', '2011-08-02 00:00:00');
INSERT INTO `cars` VALUES ('6', '刘备', '005', 'A004', 'LB124', '15212345678', '宝马', '2012-08-03 00:00:00');
INSERT INTO `cars` VALUES ('7', '张飞', '006', 'C004', 'ZF125', '15512345678', '大众', '2013-08-02 00:00:00');
INSERT INTO `cars` VALUES ('8', '张辽', '007', 'A007', 'ZL126', '13612345678', '奥迪', '2012-08-05 00:00:00');
INSERT INTO `cars` VALUES ('9', '王朝', '008', 'B005', 'WC127', '13712345678', '奥迪', '2012-08-01 00:00:00');
INSERT INTO `cars` VALUES ('10', '许褚', '009', 'A006', 'DC128', '13812345678', '上海大众', '2012-08-02 00:00:00');
INSERT INTO `cars` VALUES ('11', '罗天乐', '010', 'C002', 'ZDM129', '15812345678', '奥迪A6', '2013-08-06 00:00:00');
INSERT INTO `cars` VALUES ('12', '赵云', '013', 'F002', 'KL132', '15212343235', '比亚迪', '2014-08-03 00:00:00');
INSERT INTO `cars` VALUES ('13', '和东', '014', 'A035', 'CC133', '15012345678', '奔驰', '2012-08-08 00:00:00');

-- ----------------------------
-- Table structure for custom_account
-- ----------------------------
DROP TABLE IF EXISTS `custom_account`;
CREATE TABLE `custom_account` (
  `custom_accountID` int(11) NOT NULL AUTO_INCREMENT,
  `custom_username` varchar(255) DEFAULT NULL,
  `custom_password` varchar(255) DEFAULT NULL,
  `custom_yezhuID` int(11) DEFAULT NULL,
  PRIMARY KEY (`custom_accountID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_account
-- ----------------------------
INSERT INTO `custom_account` VALUES ('2', 'diaoc', 'abc123', '1');
INSERT INTO `custom_account` VALUES ('3', 'zhangdaming', 'aaa111', '2');
INSERT INTO `custom_account` VALUES ('4', 'diaochan', 'aaa111', '3');
INSERT INTO `custom_account` VALUES ('5', 'zhangliao', 'aaa111', '11');
INSERT INTO `custom_account` VALUES ('6', 'luotianle', 'aaa111', '12');
INSERT INTO `custom_account` VALUES ('7', 'zhaoyun', 'aaa111', '13');
INSERT INTO `custom_account` VALUES ('8', 'admin', 'admin', '14');
INSERT INTO `custom_account` VALUES ('9', 'hedong', 'aaa111', '15');

-- ----------------------------
-- Table structure for homes
-- ----------------------------
DROP TABLE IF EXISTS `homes`;
CREATE TABLE `homes` (
  `homesID` int(11) NOT NULL AUTO_INCREMENT,
  `homes_number` varchar(255) DEFAULT NULL,
  `homes_lou` varchar(255) DEFAULT NULL,
  `homes_type` varchar(255) DEFAULT NULL,
  `homes_area` int(11) DEFAULT NULL,
  `homes_sell` varchar(255) DEFAULT NULL,
  `homes_danyuan` varchar(255) DEFAULT NULL,
  `homes_louceng` varchar(255) DEFAULT NULL,
  `homes_chaoxiang` varchar(255) DEFAULT NULL,
  `homes_memo` varchar(255) DEFAULT NULL,
  `homes_yezhu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`homesID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homes
-- ----------------------------
INSERT INTO `homes` VALUES ('1', 'A001', 'A栋楼', '一套二', '120', '已入住', '一单元', '一楼', '朝东', '阳光充足，环境优美', '貂蝉');
INSERT INTO `homes` VALUES ('2', 'B001', 'B栋楼', '一套三', '85', '已入住', '二单元', '二楼', '朝西', '房产面积适中，风景优美', '张达明');
INSERT INTO `homes` VALUES ('3', 'C001', 'C栋楼', '一套三', '110', '未入住', '二单元', '二楼', '朝南', '环境优美，适宜居家', '无');
INSERT INTO `homes` VALUES ('4', 'A002', 'A栋楼', '一套二', '95', '未入住', '一单元', '四楼', '朝西', '环境优美，适宜居家', '无');
INSERT INTO `homes` VALUES ('5', 'A003', 'A栋楼', '一套二', '86', '已入住', '一单元', '一楼', '朝东', '环境优美，适宜居家', '曹操');
INSERT INTO `homes` VALUES ('6', 'A004', 'A栋楼', '一套二', '78', '已入住', '三单元', '三楼', '朝南', '环境优美，适宜居家', '刘备');
INSERT INTO `homes` VALUES ('7', 'B002', 'B栋楼', '一套三', '87', '未入住', '二单元', '二楼', '朝西', '环境优美，适宜居家', '无');
INSERT INTO `homes` VALUES ('8', 'C004', 'C栋楼', '一套二', '67', '已入住', '一单元', '一楼', '朝东', '环境优美，适宜居家', '张飞');
INSERT INTO `homes` VALUES ('9', 'F001', 'F栋楼', '一套二', '90', '未入住', '一单元', '二楼', '朝东', '环境优美，适宜居家', '无');
INSERT INTO `homes` VALUES ('11', 'A009', 'A栋楼', '一套二', '102', '未入住', '二单元', '二楼', '朝南', '阳光充足', '无');
INSERT INTO `homes` VALUES ('13', 'A006', 'A栋楼', '一套二', '112', '已入住', '一单元', '一楼', '朝东', '大苏打', '许褚');
INSERT INTO `homes` VALUES ('14', 'A007', 'A栋楼', '一套二', '112', '已入住', '一单元', '一楼', '朝东', '是大事的', '张辽');
INSERT INTO `homes` VALUES ('16', 'C002', 'C栋楼', '一套三', '103', '已入住', '三单元', '二楼', '朝南', '风景优美', '罗天乐');
INSERT INTO `homes` VALUES ('17', 'F002', 'F栋楼', '一套二', '112', '已入住', '一单元', '一楼', '朝东', '好房子', '赵云');
INSERT INTO `homes` VALUES ('18', 'A034', 'A栋楼', '一套二', '120', '已入住', '二单元', '五楼', '朝南', '最好的套房', 'admin');
INSERT INTO `homes` VALUES ('19', 'A035', 'A栋楼', '一套三', '110', '已入住', '二单元', '五楼', '朝西', '标准套房', '和东');

-- ----------------------------
-- Table structure for lvhua
-- ----------------------------
DROP TABLE IF EXISTS `lvhua`;
CREATE TABLE `lvhua` (
  `lvhuaID` int(11) NOT NULL AUTO_INCREMENT,
  `lvhua_area` varchar(255) DEFAULT NULL,
  `lvhua_style` varchar(255) DEFAULT NULL,
  `lvhua_fuzheren` varchar(255) DEFAULT NULL,
  `lvhua_date` datetime DEFAULT NULL,
  `lvhua_status` varchar(255) DEFAULT NULL,
  `lvhua_yanshouren` varchar(255) DEFAULT NULL,
  `lvhua_memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lvhuaID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lvhua
-- ----------------------------
INSERT INTO `lvhua` VALUES ('1', '前花园', '种花', '张大爷', '2010-06-02 00:00:00', '已验收', '小李', '好');
INSERT INTO `lvhua` VALUES ('2', '前花园', '种花', '花工1', '2010-06-02 00:00:00', '已验收', '老王', '合格');

-- ----------------------------
-- Table structure for maintain
-- ----------------------------
DROP TABLE IF EXISTS `maintain`;
CREATE TABLE `maintain` (
  `maintainID` int(11) NOT NULL AUTO_INCREMENT,
  `maintain_thing` varchar(255) DEFAULT NULL,
  `maintain_status` varchar(255) DEFAULT NULL,
  `maintain_homesnumber` varchar(255) DEFAULT NULL,
  `maintain_sdate` datetime DEFAULT NULL,
  `maintain_rdate` datetime DEFAULT NULL,
  `maintain_tcost` int(11) DEFAULT NULL,
  `maintain_scost` int(11) DEFAULT NULL,
  `maintainer` varchar(255) DEFAULT NULL,
  `maintain_smemo` varchar(255) DEFAULT NULL,
  `maintain_rmemo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`maintainID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maintain
-- ----------------------------
INSERT INTO `maintain` VALUES ('1', '门锁', '已修好', 'A001', '2010-06-05 13:09:24', '2010-06-09 23:45:06', '30', '30', '小李', '门锁坏了', '修好了');
INSERT INTO `maintain` VALUES ('2', 'A栋一单元2楼的楼梯扶手', '已修好', 'A021', '2010-06-05 14:07:39', '2010-06-09 23:29:57', '10', '10', '李明', '楼梯扶手坏了，情况紧急，比较危险', '修好了');
INSERT INTO `maintain` VALUES ('3', '窗户', '已修好', 'B002', '2010-06-05 14:53:07', '2010-06-05 15:19:31', '10', '20', '老王', '门窗窗户被小孩踢足球踢破了，需要更换', '重新安装窗户');
INSERT INTO `maintain` VALUES ('4', '桌子', '已安排', 'A002', '2010-06-09 22:46:20', null, '0', '0', '小李', '桌子坏了', null);
INSERT INTO `maintain` VALUES ('5', '门锁', '已修好', 'B003', '2010-06-09 22:46:48', '2010-06-09 23:10:50', '10', '10', '小李', '门锁坏了', '维修好了');
INSERT INTO `maintain` VALUES ('6', '门框', '已修好', 'C001', '2010-06-09 22:47:09', '2010-06-09 23:03:33', '10', '20', '小李', '门框坏了', '更换门框');
INSERT INTO `maintain` VALUES ('7', '椅子', '已安排', 'A001', '2010-06-09 23:44:21', null, '0', '0', '小李', '椅子坏了', null);
INSERT INTO `maintain` VALUES ('8', '桌子', '已安排', 'F002', '2010-06-09 23:48:28', null, '0', '0', '老王', '桌子坏了', null);
INSERT INTO `maintain` VALUES ('9', '电风扇', '已安排', 'A002', '2010-06-18 15:35:30', null, '0', '0', '小李', '电风扇坏了', null);
INSERT INTO `maintain` VALUES ('10', '门窗', '已安排', 'B002', '2010-06-18 15:35:47', null, '0', '0', '小李', '门窗坏了', null);
INSERT INTO `maintain` VALUES ('11', '楼梯扶手', '已安排', 'A003', '2010-06-18 15:38:54', null, '0', '0', '老王', '坏了', null);
INSERT INTO `maintain` VALUES ('12', '门窗', '已安排', 'C001', '2010-06-18 16:17:29', null, '0', '0', '小李', '门窗坏了', null);
INSERT INTO `maintain` VALUES ('13', '吊扇', '已修好', 'A001', '2010-06-18 19:39:44', '2010-06-18 19:40:35', '30', '30', '李明', '吊扇不转了', '更换吊扇');
INSERT INTO `maintain` VALUES ('14', '吊扇', '已修好', 'A008', '2010-06-18 19:54:51', '2010-06-18 19:55:34', '30', '3', '小李', '吊扇坏了', '已经修好');

-- ----------------------------
-- Table structure for notify
-- ----------------------------
DROP TABLE IF EXISTS `notify`;
CREATE TABLE `notify` (
  `notifyID` int(11) NOT NULL AUTO_INCREMENT,
  `notify_content` varchar(2000) DEFAULT NULL,
  `notify_date` datetime DEFAULT NULL,
  `notify_title` varchar(255) DEFAULT NULL,
  `notify_uper` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`notifyID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notify
-- ----------------------------
INSERT INTO `notify` VALUES ('1', '近期防盗知识讲座', '2011-05-21 10:47:40', '防盗通知', '管理员');
INSERT INTO `notify` VALUES ('2', '最新入住通知', '2011-05-17 00:59:32', '入住通知', '管理员');
INSERT INTO `notify` VALUES ('3', '防火通知', '2011-05-22 01:00:04', '防火通知', '管理员');
INSERT INTO `notify` VALUES ('5', '做人道德手册', '2010-05-27 01:01:31', '道德手册', '管理员');
INSERT INTO `notify` VALUES ('6', '水电费未缴纳名单', '2010-05-27 02:23:12', '按时缴纳水费通知', '管理员');
INSERT INTO `notify` VALUES ('7', '为了防鼠患，近期小区准备在小区周围放置老鼠药，请各个业主不要让小孩、宠物接触老鼠药', '2010-06-05 13:47:38', '防鼠患通知', '管理员');
INSERT INTO `notify` VALUES ('10', '水电费涨价通知', '2010-06-09 23:38:34', '水电费涨价通知', '管理员');
INSERT INTO `notify` VALUES ('13', '亲爱的各位小区业主：\r\n四年一个轮回，又是一届世界杯。每届世界杯都是全世界狂欢的日子，它凝聚了无数梦想，更代表着拼搏进取的竞技精神，绿茵场上不断上演的传奇，总能吸引无数球迷炽热的目光。我们热爱足球，热爱世界杯，2010年的夏天，将随着6月11日南非世界杯的正式开赛而变得格外火热！\r\n1．以学业为主，适度看球，不影响正常的上课、考试、科研等学习任务；端正学习态度，继续营造良好的学习环境和学术氛围；\r\n2．严格遵守校纪校规，做文明球迷，不影响学校正常的教学秩序；夜间不大声喧哗，不影响他人休息；积极配合宿舍管理站的管理工作；\r\n3．文明观球，文明评球，做到输赢一颗平常心，不以物喜，不以己悲；以文明、平和的方式抒发自己的感情，抵制过激的言语和行动；\r\n4．爱护环境，不采用丢弃物品、大声喧哗等不文明的行为方式发泄自己的情绪；\r\n5．严格自律，互相监督，研究生党员和研究生干部充分发挥表率作用。', '2010-06-18 19:49:23', '世界杯文明看球公告', '管理员');

-- ----------------------------
-- Table structure for personnel
-- ----------------------------
DROP TABLE IF EXISTS `personnel`;
CREATE TABLE `personnel` (
  `personnelID` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_name` varchar(255) DEFAULT NULL,
  `personnel_age` int(11) DEFAULT NULL,
  `personnel_sex` varchar(255) DEFAULT NULL,
  `personnel_idcard` varchar(255) DEFAULT NULL,
  `personnel_jiguan` varchar(255) DEFAULT NULL,
  `personnel_phone` varchar(255) DEFAULT NULL,
  `personnel_addr` varchar(255) DEFAULT NULL,
  `personnel_xueli` varchar(255) DEFAULT NULL,
  `personnel_gongling` varchar(255) DEFAULT NULL,
  `personnel_oldwork` varchar(255) DEFAULT NULL,
  `personnel_daozhidate` datetime DEFAULT NULL,
  `personnel_lizhidate` datetime DEFAULT NULL,
  `personnel_worktype` varchar(255) DEFAULT NULL,
  `personnel_daozhimemo` varchar(255) DEFAULT NULL,
  `personnel_lizhimemo` varchar(255) DEFAULT NULL,
  `personnel_status` varchar(255) DEFAULT NULL,
  `personnel_update` datetime DEFAULT NULL,
  PRIMARY KEY (`personnelID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personnel
-- ----------------------------
INSERT INTO `personnel` VALUES ('1', '李东', '23', '男', '231221312312312312', '四川', '13232321323', '四川省成都市', '高中', '2', '保安', '2010-06-05 13:13:28', '2010-06-09 23:10:10', '保安', '新入职的保安人员', '待遇不好', '已离职', '2010-06-09 23:10:10');
INSERT INTO `personnel` VALUES ('2', '张大爷', '56', '男', '423432423423423423', '四川', '13545232432', '四川省成都市', '初中', '34', '环卫工人', '2010-06-09 21:40:54', null, '环卫/绿化工', '2010年6月9日，正式入职', null, '在职', '2010-06-09 21:40:54');
INSERT INTO `personnel` VALUES ('3', '张大', '24', '男', '521213213213123123', '四川省', '13232321231', '四川省成都市', '高中', '1', '保安', '2010-06-09 23:08:59', null, '保安', '张大保安', null, '在职', '2010-06-09 23:08:59');
INSERT INTO `personnel` VALUES ('4', '陆逊', '34', '男', '510218432312313123', '四川省成都市', '13241312312', '江东', '高中', '2', '保安', '2010-06-09 23:43:38', '2010-06-18 19:37:27', '保安', '陆逊', '待遇不好', '已离职', '2010-06-18 19:37:27');
INSERT INTO `personnel` VALUES ('5', '张小东', '23', '男', '432142343242342342', '四川', '13354332434', '四川省成都市', '专科', '1', '保安', '2010-06-18 19:37:03', null, '保安', '保安人员', null, '在职', '2010-06-18 19:37:03');
INSERT INTO `personnel` VALUES ('6', '任强', '34', '男', '521231312313212321', '四川成都', '13431223423', '四川省成都市', '初中', '10', '保安', '2010-06-18 19:54:17', null, '保安', '新入职的保安', null, '在职', '2010-06-18 19:54:17');

-- ----------------------------
-- Table structure for wuyefei
-- ----------------------------
DROP TABLE IF EXISTS `wuyefei`;
CREATE TABLE `wuyefei` (
  `wuyefeiID` int(11) NOT NULL AUTO_INCREMENT,
  `wuyefei_yezhu` varchar(255) DEFAULT NULL,
  `wuyefei_homes_number` varchar(255) DEFAULT NULL,
  `wuyefei_danjia` double DEFAULT NULL,
  `wuyefei_status` varchar(255) DEFAULT NULL,
  `wuyefei_year` varchar(255) DEFAULT NULL,
  `wuyefei_month` varchar(255) DEFAULT NULL,
  `wuyefei_money` double DEFAULT NULL,
  `wuyefei_date` datetime DEFAULT NULL,
  `wuyefei_uper` varchar(255) DEFAULT NULL,
  `wuyefei_memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`wuyefeiID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wuyefei
-- ----------------------------
INSERT INTO `wuyefei` VALUES ('1', '貂蝉', 'A001', '2.5', '未缴纳', '2011年', '一月', '300', '2011-04-21 10:58:44', 'admin', '一月物业费');
INSERT INTO `wuyefei` VALUES ('2', '貂蝉', 'A001', '1.3', '未缴纳', '2011年', '二月', '156', '2011-04-27 01:10:41', 'admin', '二月物业费');
INSERT INTO `wuyefei` VALUES ('3', '张达明', 'B001', '1.3', '未缴纳', '2011年', '二月', '110.5', '2011-04-27 01:10:41', 'admin', '二月物业费');
INSERT INTO `wuyefei` VALUES ('4', '貂蝉', 'A001', '2', '未缴纳', '2011年', '三月', '240', '2011-05-09 22:05:44', '罗建', '三月物业费');
INSERT INTO `wuyefei` VALUES ('5', '张达明', 'B001', '2', '未缴纳', '2011年', '三月', '170', '2011-05-09 22:05:44', 'admin', '三月物业费');
INSERT INTO `wuyefei` VALUES ('6', '康乐', 'F001', '2', '未缴纳', '2011年', '三月', '180', '2011-05-09 22:05:44', '罗建', '三月物业费');
INSERT INTO `wuyefei` VALUES ('7', '貂蝉', 'A001', '1.8', '已缴纳', '2011年', '四月', '216', '2011-05-09 23:11:41', 'admin', '四月物业费');
INSERT INTO `wuyefei` VALUES ('8', '张达明', 'B001', '1.8', '已缴纳', '2011年', '四月', '153', '2011-05-09 23:11:41', 'admin', '四月物业费');
INSERT INTO `wuyefei` VALUES ('9', '曹操', 'A003', '1.8', '未缴纳', '2011年', '四月', '154.8', '2011-05-09 23:11:41', 'admin', '四月物业费');
INSERT INTO `wuyefei` VALUES ('10', '刘备', 'A004', '1.8', '未缴纳', '2011年', '四月', '140.4', '2011-05-09 23:11:41', 'admin', '四月物业费');
INSERT INTO `wuyefei` VALUES ('11', '张飞', 'C004', '1.8', '未缴纳', '2011年', '四月', '120.6', '2011-05-09 23:11:41', 'admin', '四月物业费');
INSERT INTO `wuyefei` VALUES ('12', '许褚', 'A006', '1.8', '未缴纳', '2011年', '四月', '201.6', '2011-05-09 23:11:41', 'admin', '四月物业费');
INSERT INTO `wuyefei` VALUES ('13', '张辽', 'A007', '1.8', '未缴纳', '2011年', '四月', '201.6', '2011-05-09 23:11:41', 'admin', '四月物业费');
INSERT INTO `wuyefei` VALUES ('14', '王朝', 'B005', '1.8', '未缴纳', '2011年', '四月', '203.4', '2011-05-09 23:11:41', 'admin', '四月物业费');
INSERT INTO `wuyefei` VALUES ('15', '貂蝉', 'A001', '1.8', '未缴纳', '2010年', '十一月', '216', '2010-06-09 23:46:22', 'admin', '低洼地');
INSERT INTO `wuyefei` VALUES ('16', '张达明', 'B001', '1.8', '已缴纳', '2010年', '十一月', '153', '2010-06-09 23:46:22', 'admin', '低洼地');
INSERT INTO `wuyefei` VALUES ('17', '曹操', 'A003', '1.8', '已缴纳', '2010年', '十一月', '154.8', '2010-06-09 23:46:22', 'admin', '低洼地');
INSERT INTO `wuyefei` VALUES ('18', '刘备', 'A004', '1.8', '已缴纳', '2010年', '十一月', '140.4', '2010-06-09 23:46:22', 'admin', '低洼地');
INSERT INTO `wuyefei` VALUES ('19', '张飞', 'C004', '1.8', '未缴纳', '2010年', '十一月', '120.6', '2010-06-09 23:46:22', 'admin', '低洼地');
INSERT INTO `wuyefei` VALUES ('20', '许褚', 'A006', '1.8', '未缴纳', '2010年', '十一月', '201.6', '2010-06-09 23:46:22', 'admin', '低洼地');
INSERT INTO `wuyefei` VALUES ('21', '张辽', 'A007', '1.8', '未缴纳', '2010年', '十一月', '201.6', '2010-06-09 23:46:22', 'admin', '低洼地');
INSERT INTO `wuyefei` VALUES ('22', '王朝', 'B005', '1.8', '未缴纳', '2010年', '十一月', '203.4', '2010-06-09 23:46:22', 'admin', '低洼地');
INSERT INTO `wuyefei` VALUES ('23', '罗天乐', 'C002', '1.8', '未缴纳', '2010年', '十一月', '185.4', '2010-06-09 23:46:22', 'admin', '低洼地');
INSERT INTO `wuyefei` VALUES ('24', '赵云', 'F002', '1.8', '未缴纳', '2010年', '十一月', '201.6', '2010-06-09 23:46:22', 'admin', '低洼地');
INSERT INTO `wuyefei` VALUES ('25', '貂蝉', 'A001', '1.5', '未缴纳', '2010年', '十二月', '180', '2010-06-18 19:25:41', 'admin', '2010年十二月物业费');
INSERT INTO `wuyefei` VALUES ('26', '张达明', 'B001', '1.5', '未缴纳', '2010年', '十二月', '127.5', '2010-06-18 19:25:41', 'admin', '2010年十二月物业费');
INSERT INTO `wuyefei` VALUES ('27', '曹操', 'A003', '1.5', '未缴纳', '2010年', '十二月', '129', '2010-06-18 19:25:41', 'admin', '2010年十二月物业费');
INSERT INTO `wuyefei` VALUES ('28', '刘备', 'A004', '1.5', '未缴纳', '2010年', '十二月', '117', '2010-06-18 19:25:41', 'admin', '2010年十二月物业费');
INSERT INTO `wuyefei` VALUES ('29', '张飞', 'C004', '1.5', '未缴纳', '2010年', '十二月', '100.5', '2010-06-18 19:25:41', 'admin', '2010年十二月物业费');
INSERT INTO `wuyefei` VALUES ('30', '许褚', 'A006', '1.5', '未缴纳', '2010年', '十二月', '168', '2010-06-18 19:25:41', 'admin', '2010年十二月物业费');
INSERT INTO `wuyefei` VALUES ('31', '张辽', 'A007', '1.5', '未缴纳', '2010年', '十二月', '168', '2010-06-18 19:25:41', 'admin', '2010年十二月物业费');
INSERT INTO `wuyefei` VALUES ('32', '王朝', 'B005', '1.5', '未缴纳', '2010年', '十二月', '169.5', '2010-06-18 19:25:41', 'admin', '2010年十二月物业费');
INSERT INTO `wuyefei` VALUES ('33', '罗天乐', 'C002', '1.5', '未缴纳', '2010年', '十二月', '154.5', '2010-06-18 19:25:41', 'admin', '2010年十二月物业费');
INSERT INTO `wuyefei` VALUES ('34', '赵云', 'F002', '1.5', '未缴纳', '2010年', '十二月', '168', '2010-06-18 19:25:41', 'admin', '2010年十二月物业费');
INSERT INTO `wuyefei` VALUES ('35', '貂蝉', 'A001', '1.8', '未缴纳', '2010年', '五月', '216', '2010-06-18 19:58:21', 'admin', '2010年五月物业费');
INSERT INTO `wuyefei` VALUES ('36', '张达明', 'B001', '1.8', '未缴纳', '2010年', '五月', '153', '2010-06-18 19:58:21', 'admin', '2010年五月物业费');
INSERT INTO `wuyefei` VALUES ('37', '曹操', 'A003', '1.8', '未缴纳', '2010年', '五月', '154.8', '2010-06-18 19:58:21', 'admin', '2010年五月物业费');
INSERT INTO `wuyefei` VALUES ('38', '刘备', 'A004', '1.8', '未缴纳', '2010年', '五月', '140.4', '2010-06-18 19:58:21', 'admin', '2010年五月物业费');
INSERT INTO `wuyefei` VALUES ('39', '张飞', 'C004', '1.8', '未缴纳', '2010年', '五月', '120.6', '2010-06-18 19:58:21', 'admin', '2010年五月物业费');
INSERT INTO `wuyefei` VALUES ('40', '许褚', 'A006', '1.8', '未缴纳', '2010年', '五月', '201.6', '2010-06-18 19:58:21', 'admin', '2010年五月物业费');
INSERT INTO `wuyefei` VALUES ('41', '张辽', 'A007', '1.8', '未缴纳', '2010年', '五月', '201.6', '2010-06-18 19:58:21', 'admin', '2010年五月物业费');
INSERT INTO `wuyefei` VALUES ('42', '罗天乐', 'C002', '1.8', '未缴纳', '2010年', '五月', '185.4', '2010-06-18 19:58:21', 'admin', '2010年五月物业费');
INSERT INTO `wuyefei` VALUES ('43', '赵云', 'F002', '1.8', '未缴纳', '2010年', '五月', '201.6', '2010-06-18 19:58:21', 'admin', '2010年五月物业费');
INSERT INTO `wuyefei` VALUES ('44', '王朝', 'A034', '1.8', '未缴纳', '2010年', '五月', '216', '2010-06-18 19:58:21', 'admin', '2010年五月物业费');
INSERT INTO `wuyefei` VALUES ('45', '和东', 'A035', '1.8', '未缴纳', '2010年', '五月', '198', '2010-06-18 19:58:21', 'admin', '2010年五月物业费');

-- ----------------------------
-- Table structure for xuncha
-- ----------------------------
DROP TABLE IF EXISTS `xuncha`;
CREATE TABLE `xuncha` (
  `xunchaID` int(11) NOT NULL AUTO_INCREMENT,
  `xuncha_person` varchar(255) DEFAULT NULL,
  `xuncha_type` varchar(255) DEFAULT NULL,
  `xuncha_time` datetime DEFAULT NULL,
  `xuncha_chuliren` varchar(255) DEFAULT NULL,
  `xuncha_dangshiren` varchar(255) DEFAULT NULL,
  `xuncha_result` varchar(255) DEFAULT NULL,
  `xuncha_memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`xunchaID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xuncha
-- ----------------------------
INSERT INTO `xuncha` VALUES ('1', '李东', '打架斗殴', '2010-06-09 00:00:00', '李东', '张达明、刘一多', '送派出所', '因为碰撞，产生摩擦，引起冲突，张达明先打了刘一多，随后两人互相殴打。');
INSERT INTO `xuncha` VALUES ('2', '李东', '无', '2010-06-01 00:00:00', '李东', '张飞，曹操', '送派出所', '张飞吓曹操');
INSERT INTO `xuncha` VALUES ('3', '张大', '打架斗殴', '2010-06-02 00:00:00', '张大', '张飞，关羽', '送派出所', '吵架');
INSERT INTO `xuncha` VALUES ('4', '陆逊', '物品遗失', '2010-06-02 00:00:00', '陆逊', '曹操，刘备', '两败俱伤', '刘备打曹操');
INSERT INTO `xuncha` VALUES ('5', '任强', '打架斗殴', '2010-06-02 00:00:00', '任强', '张东和李明', '送派出所', '吵架打架');

-- ----------------------------
-- Table structure for yezhu
-- ----------------------------
DROP TABLE IF EXISTS `yezhu`;
CREATE TABLE `yezhu` (
  `yezhuID` int(11) NOT NULL AUTO_INCREMENT,
  `yezhu_homesnumber` varchar(255) DEFAULT NULL,
  `yezhu_name` varchar(255) DEFAULT NULL,
  `yezhu_sex` varchar(255) DEFAULT NULL,
  `yezhu_age` int(11) DEFAULT NULL,
  `yezhu_tel` varchar(255) DEFAULT NULL,
  `yezhu_phone` varchar(255) DEFAULT NULL,
  `yezhu_IDC` varchar(255) DEFAULT NULL,
  `yezhu_member` varchar(255) DEFAULT NULL,
  `yezhu_date` datetime DEFAULT NULL,
  `yezhu_memo` varchar(255) DEFAULT NULL,
  `yezhu_custom_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`yezhuID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yezhu
-- ----------------------------
INSERT INTO `yezhu` VALUES ('2', 'B001', '张达明', '男', '23', '028-82252019', '13683411940', '523123121121312312', '妻子，儿子', '2010-05-11 00:00:00', '最近入住的新业主', '0');
INSERT INTO `yezhu` VALUES ('3', 'A001', '貂蝉', '女', '18', '028-82252019', '13683411940', '510184198702258671', '吕布', '2010-05-12 00:00:00', '貂蝉与吕布', '0');
INSERT INTO `yezhu` VALUES ('5', 'C004', '张飞', '男', '34', '028-83232323', '13632232324', '521312312313213123', '刘备，关羽', '2010-06-03 00:00:00', '张飞入住', '0');
INSERT INTO `yezhu` VALUES ('7', 'A004', '刘备', '男', '36', '028-83223123', '13621312312', '513123123123123131', '张飞，关羽', '2010-06-11 00:00:00', '刘备入住', '0');
INSERT INTO `yezhu` VALUES ('8', 'A003', '曹操', '男', '35', '028-32323232', '13623131231', '623232323232323232', '许褚，司马懿', '2010-06-10 00:00:00', '曹操入住', '0');
INSERT INTO `yezhu` VALUES ('9', 'A006', '许褚', '男', '36', '028-23232323', '13523232323', '521312312312312312', '曹操', '2010-06-15 00:00:00', '大师大师的是大多数', '0');
INSERT INTO `yezhu` VALUES ('11', 'A007', '张辽', '男', '24', '028-82252019', '13683411940', '510232323232323232', '无', '2010-06-03 00:00:00', '张辽', '0');
INSERT INTO `yezhu` VALUES ('12', 'C002', '罗天乐', '男', '24', '028-82252019', '13621321312', '512121212121212121', '父亲，母亲', '2010-06-09 00:00:00', '描述信息', '0');
INSERT INTO `yezhu` VALUES ('13', 'F002', '赵云', '男', '34', '028-23232323', '13434323232', '424123132123131312', '赵云', '2010-06-09 00:00:00', '赵云', '0');
INSERT INTO `yezhu` VALUES ('14', 'A034', 'admin', '男', '23', '028-32323232', '13213123123', '512313123123123123', '父亲，母亲', '2010-06-01 00:00:00', '新入住的小区业主', '0');
INSERT INTO `yezhu` VALUES ('15', 'A035', '和东', '男', '24', '028-23213123', '13521323131', '521321321321312313', '无', '2010-06-01 00:00:00', '新入住的业主', '0');
