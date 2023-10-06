/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.5.40 : Database - library_manager_system
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=''NO_AUTO_VALUE_ON_ZERO'' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`library_manager_system` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `library_manager_system`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(20) DEFAULT NULL,
  `admin_pwd` varchar(20) DEFAULT NULL,
  `admin_email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`admin_id`,`admin_name`,`admin_pwd`,`admin_email`) values (1,''admin'',''admin'',''501455447@qq.com'');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(20) NOT NULL,
  `book_author` varchar(20) DEFAULT NULL,
  `book_publish` varchar(20) DEFAULT NULL,
  `book_category` int(11) DEFAULT NULL,
  `book_price` double DEFAULT NULL,
  `book_introduction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `book_category` (`book_category`) USING BTREE,
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`book_category`) REFERENCES `book_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`book_id`,`book_name`,`book_author`,`book_publish`,`book_category`,`book_price`,`book_introduction`) values (1,''巨人的陨落'',''肯.福莱特'',''江苏凤凰文艺出版社'',1,129,''在第一次世界大战中发生的故事''),(2,''三体'',''刘慈欣'',''南京大学出版社'',1,68,''科幻小说''),(3,''复活'',''列夫.托尔斯泰'',''上海译文出版社'',1,19,''俄国小说''),(6,''平凡的世界'',''路遥'',''上海文艺出版社'',1,88,''孙少平和孙少安两兄弟...''),(15,''白鹿原'',''陈忠实'',''南京出版社'',1,36,''当代小说''),(16,''计算机网络'',''谢希仁'',''电子工业出版社'',3,49,''计算机专业书籍''),(17,''霍乱时期的爱情'',''加西亚·马尔克斯'',''译林出版社'',9,39,''外国小说''),(18,''天才在左疯子在右'',''高铭'',''北京联合出版公司'',1,39.8,''心理学''),(19,''废都'',''贾平凹'',''商务印书馆'',8,29,''当代小说''),(20,''jQuery'',''Ryan'',''中国电力出版社'',3,78,''js库''),(21,''python数据爬虫'',''张博文'',''清华大学出版社'',3,52,''带你走进爬虫的世界''),(22,''入门python可视化'',''variation'',''电子大学出版社'',8,61,''探究数据背后的秘密''),(71,''Springboot从入门到实践'',''筱威'',''北京大学出版社'',3,78,''带你走进spirngboot'');

/*Table structure for table `book_category` */

DROP TABLE IF EXISTS `book_category`;

CREATE TABLE `book_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Data for the table `book_category` */

insert  into `book_category`(`category_id`,`category_name`) values (1,''小说''),(2,''历史''),(3,''计算机''),(4,''哲学''),(5,''社会科学''),(6,''政治法律''),(7,''军事科学''),(8,''中国文学''),(9,''外国文学''),(10,''外国传记''),(11,''英语''),(12,''俄国小说''),(13,''心理学''),(14,''言情小说''),(15,''武侠小说''),(16,''环境科学''),(17,''纪实文学'');

/*Table structure for table `borrowingbooks` */

DROP TABLE IF EXISTS `borrowingbooks`;

CREATE TABLE `borrowingbooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `book_id` (`book_id`) USING BTREE,
  CONSTRAINT `borrowingbooks_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `borrowingbooks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

/*Data for the table `borrowingbooks` */

insert  into `borrowingbooks`(`id`,`user_id`,`book_id`,`date`) values (9,5,1,''2020-08-04''),(28,5,19,''2020-08-01''),(31,2,20,''2020-08-02''),(55,1,21,''2020-08-19''),(57,1,17,''2020-08-19''),(61,1,16,''2020-08-21'');

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `dept` */

insert  into `dept`(`dept_id`,`dept_name`) values (1,''信息工程学院''),(2,''体育学院''),(3,''美术学院''),(4,''电子工程学院'');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_pwd` varchar(20) DEFAULT NULL,
  `user_email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_pwd`,`user_email`) values (1,''user1'',''123456'',''501455447@qq.com''),(2,''zbw'',''123456'',''501455447@qq.com''),(5,''user2'',''123456'',''501455447@qq.com''),(6,''LeBronJames'',''123456'',''501455447@qq.com''),(7,''科比'',''123456'',''501455447@qq.com''),(8,''柏拉图'',''123456'',''501455447@qq.com''),(9,''拿破仑'',''123456'',''501455447@qq.com''),(10,''欧文'',''123456'',''501455447@qq.com''),(11,''库兹马'',''123456'',''501455447@qq.com''),(13,''魔术师'',''123456'',''501455447@qq.com''),(16,''周杰伦'',''123456'',''501455447@qq.com''),(23,''Variation'',''123456'',''501455447@qq.com'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
