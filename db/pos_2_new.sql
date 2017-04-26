/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.21-MariaDB : Database - pos_2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pos_2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `pos_2`;

/*Table structure for table `angsuran_kredit` */

DROP TABLE IF EXISTS `angsuran_kredit`;

CREATE TABLE `angsuran_kredit` (
  `angsuran_kredit_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `kredit_id` int(11) NOT NULL,
  `lama_angsuran` bigint(20) NOT NULL,
  `angsuran_nominal` bigint(20) NOT NULL,
  `total_kredit` int(11) NOT NULL,
  PRIMARY KEY (`angsuran_kredit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `angsuran_kredit` */

insert  into `angsuran_kredit`(`angsuran_kredit_id`,`member_id`,`transaction_id`,`kredit_id`,`lama_angsuran`,`angsuran_nominal`,`total_kredit`) values (1,27,2,1,12,198000,0),(2,1,4,3,10,437000,0);

/*Table structure for table `angsuran_kredit_details` */

DROP TABLE IF EXISTS `angsuran_kredit_details`;

CREATE TABLE `angsuran_kredit_details` (
  `angsuran_kredit_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `angsuran_kredit_details_code` varchar(200) NOT NULL,
  `angsuran_kredit_id` int(11) NOT NULL,
  `angsuran_date` date NOT NULL,
  `payment_method` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `bank_account_id` varchar(200) NOT NULL,
  `bank_id_to` int(11) NOT NULL,
  `bank_account_id_to` varchar(200) NOT NULL,
  `angsuran_nominal` bigint(20) NOT NULL,
  `total_payment` bigint(20) NOT NULL,
  `payment_change` bigint(20) NOT NULL,
  `denda_nominal` int(11) NOT NULL,
  `denda_persen` int(11) NOT NULL,
  `denda_persen_nominal` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ket` int(11) NOT NULL,
  PRIMARY KEY (`angsuran_kredit_details_id`,`angsuran_nominal`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `angsuran_kredit_details` */

insert  into `angsuran_kredit_details`(`angsuran_kredit_details_id`,`angsuran_kredit_details_code`,`angsuran_kredit_id`,`angsuran_date`,`payment_method`,`bank_id`,`bank_account_id`,`bank_id_to`,`bank_account_id_to`,`angsuran_nominal`,`total_payment`,`payment_change`,`denda_nominal`,`denda_persen`,`denda_persen_nominal`,`user_id`,`ket`) values (1,'AK_1490855499',1,'2017-03-30',1,0,'',0,'',198000,198990,0,0,1,990,4,1),(2,'AK_1490855656',1,'2017-03-30',1,0,'',0,'',198000,2178000,0,0,0,0,4,0),(3,'AK_1490855656',1,'2017-03-30',1,0,'',0,'',198000,2178000,0,0,0,0,4,0),(4,'AK_1490855656',1,'2017-03-30',1,0,'',0,'',198000,2178000,0,0,0,0,4,0),(5,'AK_1490855656',1,'2017-03-30',1,0,'',0,'',198000,2178000,0,0,0,0,4,0),(6,'AK_1490855656',1,'2017-03-30',1,0,'',0,'',198000,2178000,0,0,0,0,4,0),(7,'AK_1490855656',1,'2017-03-30',1,0,'',0,'',198000,2178000,0,0,0,0,4,0),(8,'AK_1490855656',1,'2017-03-30',1,0,'',0,'',198000,2178000,0,0,0,0,4,0),(9,'AK_1490855656',1,'2017-03-30',1,0,'',0,'',198000,2178000,0,0,0,0,4,0),(10,'AK_1490855656',1,'2017-03-30',1,0,'',0,'',198000,2178000,0,0,0,0,4,0),(11,'AK_1490855656',1,'2017-03-30',1,0,'',0,'',198000,2178000,0,0,0,0,4,0),(12,'AK_1490855656',1,'2017-03-30',1,0,'',0,'',198000,2178000,0,0,0,0,4,0),(13,'AK_1492656681',2,'2017-04-20',1,0,'',0,'',437000,437000,0,0,0,0,4,0),(14,'AK_1492750093',2,'2017-04-21',1,0,'',0,'',437000,437000,0,0,0,0,4,0),(15,'AK_1492860420',2,'2017-04-22',1,0,'',0,'',437000,437000,0,0,0,0,1,0);

/*Table structure for table `angsuran_kredit_details_tmp` */

DROP TABLE IF EXISTS `angsuran_kredit_details_tmp`;

CREATE TABLE `angsuran_kredit_details_tmp` (
  `angsuran_kredit_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `angsuran_kredit_id` int(11) NOT NULL,
  `angsuran_date` date NOT NULL,
  `payment_method` int(11) NOT NULL,
  `angsuran_nominal` bigint(20) NOT NULL,
  `total_payment` bigint(20) NOT NULL,
  `payment_change` bigint(20) NOT NULL,
  `denda_nominal` int(11) NOT NULL,
  `denda_persen` float NOT NULL,
  `denda_persen_nominal` int(11) NOT NULL,
  `ket` int(11) NOT NULL,
  PRIMARY KEY (`angsuran_kredit_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `angsuran_kredit_details_tmp` */

/*Table structure for table `angsuran_kredit_tmp` */

DROP TABLE IF EXISTS `angsuran_kredit_tmp`;

CREATE TABLE `angsuran_kredit_tmp` (
  `angsuran_kredit_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `kredit_id` int(11) NOT NULL,
  `lama_angsuran` bigint(20) NOT NULL,
  `angsuran_nominal` bigint(20) NOT NULL,
  `total_kredit` int(11) NOT NULL,
  PRIMARY KEY (`angsuran_kredit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `angsuran_kredit_tmp` */

/*Table structure for table `banks` */

DROP TABLE IF EXISTS `banks`;

CREATE TABLE `banks` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) NOT NULL,
  `bank_account_number` varchar(100) NOT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `banks` */

insert  into `banks`(`bank_id`,`bank_name`,`bank_account_number`) values (1,'BCA','46624246');

/*Table structure for table `branches` */

DROP TABLE IF EXISTS `branches`;

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(200) NOT NULL,
  `branch_img` text NOT NULL,
  `branch_desc` text NOT NULL,
  `branch_address` text NOT NULL,
  `branch_phone` varchar(100) NOT NULL,
  `branch_city` varchar(100) NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `branches` */

insert  into `branches`(`branch_id`,`branch_name`,`branch_img`,`branch_desc`,`branch_address`,`branch_phone`,`branch_city`) values (3,'PUSAT','1490861137_logoTIGOKEA.png','','Jl. Surojenggolo No. 66-Wates, Kec. Balongpanggang, Kab. Gresik','(031) 792-60972','GRESIK');

/*Table structure for table `bulan` */

DROP TABLE IF EXISTS `bulan`;

CREATE TABLE `bulan` (
  `bulan_id` int(11) NOT NULL AUTO_INCREMENT,
  `bulan_name` varchar(200) NOT NULL,
  PRIMARY KEY (`bulan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `bulan` */

insert  into `bulan`(`bulan_id`,`bulan_name`) values (1,'Januari'),(2,'Februari'),(3,'Maret'),(4,'April'),(5,'Mei'),(6,'Juni'),(7,'Juli'),(8,'Agustus'),(9,'September'),(10,'Oktober'),(11,'November'),(12,'Desember');

/*Table structure for table `denda` */

DROP TABLE IF EXISTS `denda`;

CREATE TABLE `denda` (
  `denda_id` int(11) NOT NULL AUTO_INCREMENT,
  `denda_name` varchar(200) NOT NULL,
  `jenis_denda` int(11) NOT NULL,
  `denda_nominal` bigint(20) NOT NULL,
  `denda_persen` float NOT NULL,
  `denda_desc` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`denda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `denda` */

insert  into `denda`(`denda_id`,`denda_name`,`jenis_denda`,`denda_nominal`,`denda_persen`,`denda_desc`,`branch_id`) values (1,'Harian',1,0,0.5,'1\r\n',3),(2,'Mingguan',2,0,0,'',3),(3,'Bulanan',3,0,0.5,'',3);

/*Table structure for table `gadai` */

DROP TABLE IF EXISTS `gadai`;

CREATE TABLE `gadai` (
  `gadai_id` int(11) NOT NULL AUTO_INCREMENT,
  `gadai_code` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `nama_item` int(11) NOT NULL,
  `jenis_barang` int(11) NOT NULL,
  `merk_item` varchar(200) NOT NULL,
  `tipe_item` varchar(200) NOT NULL,
  `administrasi` bigint(20) NOT NULL,
  `harga_barang` bigint(20) NOT NULL,
  `uang_muka_barang` bigint(20) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `nilai_pembiayaan` bigint(20) NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `angsuran_per_bulan` bigint(20) NOT NULL,
  `pembayaran_per_tanggal_1` varchar(200) NOT NULL,
  `pembayaran_per_tanggal_2` varchar(200) NOT NULL,
  `gadai_date` datetime NOT NULL,
  `gadai_total` bigint(11) NOT NULL,
  PRIMARY KEY (`gadai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gadai` */

/*Table structure for table `gadai_details` */

DROP TABLE IF EXISTS `gadai_details`;

CREATE TABLE `gadai_details` (
  `gadai_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `gadai_id` int(11) NOT NULL,
  `item_image` text NOT NULL,
  PRIMARY KEY (`gadai_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gadai_details` */

/*Table structure for table `gadai_tmp` */

DROP TABLE IF EXISTS `gadai_tmp`;

CREATE TABLE `gadai_tmp` (
  `gadai_id` int(11) NOT NULL AUTO_INCREMENT,
  `gadai_code` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `nama_item` varchar(200) NOT NULL,
  `kategori` int(11) NOT NULL,
  `merk_item` varchar(200) NOT NULL,
  `tipe_item` varchar(200) NOT NULL,
  `administrasi` bigint(20) NOT NULL,
  `harga_barang` bigint(20) NOT NULL,
  `uang_muka_barang` bigint(20) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `nilai_pembiayaan` bigint(20) NOT NULL,
  `periode` int(11) NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `angsuran_per_bulan` bigint(20) NOT NULL,
  `pembayaran_per_tanggal_1` varchar(200) NOT NULL,
  `pembayaran_per_tanggal_2` varchar(200) NOT NULL,
  `gadai_date` datetime NOT NULL,
  `gadai_total` bigint(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`gadai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gadai_tmp` */

/*Table structure for table `gadai_tmp_details` */

DROP TABLE IF EXISTS `gadai_tmp_details`;

CREATE TABLE `gadai_tmp_details` (
  `gadai_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `gadai_id` int(11) NOT NULL,
  `item_image` text NOT NULL,
  PRIMARY KEY (`gadai_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gadai_tmp_details` */

/*Table structure for table `gudang` */

DROP TABLE IF EXISTS `gudang`;

CREATE TABLE `gudang` (
  `item_gudang_id` int(11) NOT NULL AUTO_INCREMENT,
  `gudang_id` int(11) NOT NULL,
  `item_type` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_qty` float NOT NULL,
  PRIMARY KEY (`item_gudang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gudang` */

/*Table structure for table `gudang_identitas` */

DROP TABLE IF EXISTS `gudang_identitas`;

CREATE TABLE `gudang_identitas` (
  `gudang_id` int(11) NOT NULL AUTO_INCREMENT,
  `gudang_name` varchar(300) NOT NULL,
  `gudang_address` varchar(300) NOT NULL,
  `gudang_phone` int(11) NOT NULL,
  PRIMARY KEY (`gudang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gudang_identitas` */

/*Table structure for table `hapus_purchase` */

DROP TABLE IF EXISTS `hapus_purchase`;

CREATE TABLE `hapus_purchase` (
  `hapus_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id_hapus` int(11) NOT NULL,
  `purchases_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchases_date` datetime NOT NULL,
  `purchases_code` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `bank_account` int(11) NOT NULL,
  `bank_id_to` int(11) NOT NULL,
  `bank_account_to` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `purchase_total` bigint(11) NOT NULL,
  `purchase_payment` bigint(11) NOT NULL,
  `purchase_change` bigint(11) NOT NULL,
  `lunas` int(11) NOT NULL,
  `purchase_desc` text NOT NULL,
  PRIMARY KEY (`hapus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `hapus_purchase` */

insert  into `hapus_purchase`(`hapus_id`,`user_id_hapus`,`purchases_id`,`user_id`,`purchases_date`,`purchases_code`,`supplier_id`,`branch_id`,`bank_id`,`bank_account`,`bank_id_to`,`bank_account_to`,`payment_method`,`purchase_total`,`purchase_payment`,`purchase_change`,`lunas`,`purchase_desc`) values (1,4,23,4,'2017-04-22 17:08:12',1492855694,9,3,0,0,0,0,1,25000000,25000000,0,0,''),(2,4,15,4,'2017-04-20 09:44:04',1492656250,8,3,0,0,0,0,1,5220000,5220000,0,0,'');

/*Table structure for table `hapus_purchase_details` */

DROP TABLE IF EXISTS `hapus_purchase_details`;

CREATE TABLE `hapus_purchase_details` (
  `purchase_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `purchase_qty` float NOT NULL,
  `purchase_price` bigint(11) NOT NULL,
  `purchase_total` bigint(11) NOT NULL,
  `retur` float NOT NULL,
  PRIMARY KEY (`purchase_detail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `hapus_purchase_details` */

insert  into `hapus_purchase_details`(`purchase_detail_id`,`purchase_id`,`purchase_date`,`item_id`,`purchase_qty`,`purchase_price`,`purchase_total`,`retur`) values (1,23,'2017-04-22',4,1,1200000,1200000,0),(2,23,'2017-04-22',4,10,2500000,25000000,0),(3,15,'2017-04-20',5,3,1740000,5220000,0);

/*Table structure for table `hapus_transaction_details` */

DROP TABLE IF EXISTS `hapus_transaction_details`;

CREATE TABLE `hapus_transaction_details` (
  `transaction_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `item_type` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `transaction_detail_original_price` bigint(11) NOT NULL,
  `transaction_detail_margin_price` bigint(11) NOT NULL,
  `transaction_detail_price` bigint(11) NOT NULL,
  `transaction_detail_price_discount` bigint(11) NOT NULL,
  `transaction_detail_grand_price` bigint(11) NOT NULL,
  `transaction_detail_qty` float NOT NULL,
  `transaction_detail_unit` int(11) NOT NULL,
  `transaction_detail_total` int(11) NOT NULL,
  `retur` float NOT NULL,
  PRIMARY KEY (`transaction_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `hapus_transaction_details` */

insert  into `hapus_transaction_details`(`transaction_detail_id`,`transaction_id`,`item_type`,`item_id`,`transaction_detail_original_price`,`transaction_detail_margin_price`,`transaction_detail_price`,`transaction_detail_price_discount`,`transaction_detail_grand_price`,`transaction_detail_qty`,`transaction_detail_unit`,`transaction_detail_total`,`retur`) values (1,18,0,10,6500000,0,6500000,0,0,1,0,6500000,0),(2,18,0,4,1800000,0,1800000,0,0,1,0,1800000,0),(3,19,0,5,2000000,0,2000000,0,0,1,0,2000000,0),(4,17,0,4,1800000,0,1800000,0,0,1,0,1800000,0),(5,20,0,5,2000000,0,2000000,0,0,1,0,2000000,0),(6,23,0,4,1800000,0,1800000,0,0,1,0,1800000,0),(7,22,0,4,1800000,0,1800000,0,0,1,0,1800000,0),(8,21,0,4,1800000,0,1800000,0,0,1,0,1800000,0),(9,24,0,4,1800000,0,1800000,0,0,1,0,1800000,0),(10,10,0,10,6500000,0,6500000,0,0,1,0,6500000,0),(11,26,0,4,1800000,0,1800000,0,0,1,0,1800000,0),(12,27,0,4,1800000,0,1800000,0,0,1,0,1800000,0),(13,28,0,4,1800000,0,1800000,0,0,1,0,1800000,0),(14,4,0,8,3900000,0,3900000,0,0,1,0,3900000,0),(15,13,0,5,2000000,0,2000000,0,0,1,0,2000000,0),(16,6,0,5,2000000,0,2000000,0,0,1,0,2000000,0),(17,7,0,20,3450000,0,3450000,0,0,1,0,3450000,0),(18,11,0,5,2000000,0,2000000,0,0,1,0,2000000,0),(19,12,0,5,2000000,0,2000000,0,0,1,0,2000000,0),(20,16,0,5,2000000,0,2000000,0,0,1,0,2000000,0),(21,29,0,4,1800000,0,1800000,0,0,1,0,1800000,0);

/*Table structure for table `hapus_transactions` */

DROP TABLE IF EXISTS `hapus_transactions`;

CREATE TABLE `hapus_transactions` (
  `hapus_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id_hapus` int(11) DEFAULT NULL,
  `transaction_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `transaction_total` bigint(11) NOT NULL,
  `transaction_discount` bigint(11) NOT NULL,
  `transaction_grand_total` bigint(11) NOT NULL,
  `transaction_payment` bigint(11) NOT NULL,
  `transaction_change` bigint(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `i_bank_account` int(11) NOT NULL,
  `bank_id_to` int(11) NOT NULL,
  `i_bank_account_to` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_code` int(11) NOT NULL,
  `tax` bigint(11) NOT NULL,
  `total_all` bigint(11) NOT NULL,
  `transaction_desc` text NOT NULL,
  `lunas` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`hapus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `hapus_transactions` */

insert  into `hapus_transactions`(`hapus_id`,`user_id_hapus`,`transaction_id`,`member_id`,`transaction_date`,`transaction_total`,`transaction_discount`,`transaction_grand_total`,`transaction_payment`,`transaction_change`,`payment_method_id`,`bank_id`,`i_bank_account`,`bank_id_to`,`i_bank_account_to`,`user_id`,`transaction_code`,`tax`,`total_all`,`transaction_desc`,`lunas`,`branch_id`) values (1,4,18,5,'2017-04-22 17:41:37',1800000,0,1800000,1800000,0,1,0,0,0,0,4,1492857697,0,1800000,'',0,3),(2,4,19,5,'2017-04-22 17:48:15',2000000,0,2000000,2000000,0,1,0,0,0,0,4,1492858095,0,2000000,'',0,3),(3,4,17,5,'2017-04-22 17:15:42',1800000,0,1800000,1800000,0,1,0,0,0,0,4,1492856142,0,1800000,'',0,3),(4,4,20,5,'2017-04-22 17:59:34',2000000,0,2000000,2000000,0,1,0,0,0,0,4,1492858774,0,2000000,'',0,3),(5,4,0,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0),(6,4,0,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0),(7,1,23,5,'2017-04-22 18:50:49',1800000,0,1800000,500000,0,5,0,0,0,0,4,1492861849,0,1800000,'',1,3),(8,1,22,5,'2017-04-22 18:19:42',1800000,0,1800000,1800000,0,1,0,0,0,0,4,1492859982,0,1800000,'',0,3),(9,1,21,5,'2017-04-22 18:14:18',1800000,0,1800000,1800000,0,1,0,0,0,0,4,1492859658,0,1800000,'',0,3),(10,1,24,5,'2017-04-22 19:03:44',1800000,0,1800000,1800000,0,1,0,0,0,0,1,1492862624,0,1800000,'',0,3),(11,1,10,2,'2017-04-20 10:05:17',6500000,0,6500000,6500000,0,1,0,0,0,0,4,1492657517,0,6500000,'',0,3),(12,1,26,5,'2017-04-22 19:28:33',1800000,0,1800000,1800000,0,1,0,0,0,0,1,1492864113,0,1800000,'',0,3),(13,1,27,8,'2017-04-22 19:42:12',1800000,0,1800000,1800000,0,1,0,0,0,0,1,1492864932,0,1800000,'',0,3),(14,1,28,5,'2017-04-22 19:43:28',1800000,0,1800000,1800000,0,1,0,0,0,0,1,1492865008,0,1800000,'',0,3),(15,1,4,1,'2017-04-01 10:39:05',3900000,0,3900000,780000,0,5,0,0,0,0,3,1491035945,0,3900000,'',1,3),(16,1,13,3,'2017-04-21 11:42:31',2000000,0,2000000,400000,0,5,0,0,0,0,4,1492749751,0,2000000,'',1,3),(17,1,6,7,'2017-04-06 17:29:46',2000000,0,2000000,400000,0,5,0,0,0,0,3,1491474586,0,2000000,'',1,3),(18,1,7,9,'2017-04-07 18:21:24',3450000,0,3450000,700000,0,5,0,0,0,0,3,1491564084,0,3450000,'',1,3),(19,1,11,10,'2017-04-20 10:13:59',2000000,0,2000000,400000,0,5,0,0,0,0,4,1492658039,0,2000000,'',1,3),(20,1,12,2,'2017-04-21 11:39:45',2000000,0,2000000,400000,0,5,0,0,0,0,4,1492749585,0,2000000,'',1,3),(21,1,16,4,'2017-04-21 13:03:28',2000000,0,2000000,1000000,0,5,0,0,0,0,4,1492754608,0,2000000,'',1,3),(22,1,29,5,'2017-04-22 19:51:23',1800000,0,1800000,250000,0,5,0,0,0,0,1,1492865483,0,1800000,'',1,3);

/*Table structure for table `hutang` */

DROP TABLE IF EXISTS `hutang`;

CREATE TABLE `hutang` (
  `kredit_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `hutang_code` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `jenis_item` int(11) NOT NULL,
  `administrasi` bigint(20) NOT NULL,
  `harga_item` bigint(20) NOT NULL,
  `uang_muka_barang` bigint(20) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `bank_id_angsuran` int(11) NOT NULL,
  `bank_account_angsuran` varchar(200) NOT NULL,
  `bank_id_to_angsuran` int(11) NOT NULL,
  `bank_account_to_angsuran` varchar(200) NOT NULL,
  `nilai_pembiayaan` bigint(20) NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `periode` int(11) NOT NULL,
  `angsuran_per_bulan` bigint(20) NOT NULL,
  `pembayaran_per_tanggal_1` varchar(200) NOT NULL,
  `pembayaran_per_tanggal_2` varchar(200) NOT NULL,
  `hutang_date` datetime NOT NULL,
  `hutang_total` bigint(11) NOT NULL,
  `lunas` int(11) NOT NULL,
  PRIMARY KEY (`kredit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hutang` */

/*Table structure for table `item_details` */

DROP TABLE IF EXISTS `item_details`;

CREATE TABLE `item_details` (
  `item_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_merk` varchar(200) NOT NULL,
  `item_tipe` varchar(200) NOT NULL,
  `item_berat` int(11) NOT NULL,
  `item_p` int(11) NOT NULL,
  `item_l` int(11) NOT NULL,
  `item_t` int(11) NOT NULL,
  `item_penerbit` text NOT NULL,
  `item_desc` text NOT NULL,
  PRIMARY KEY (`item_detail_id`,`item_tipe`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `item_details` */

insert  into `item_details`(`item_detail_id`,`item_id`,`item_merk`,`item_tipe`,`item_berat`,`item_p`,`item_l`,`item_t`,`item_penerbit`,`item_desc`) values (4,4,'OPPO','NEO 7',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2015, October\r\nStatus	Available. Released 2015, October\r\nBODY	Dimensions	142.7 x 71.7 x 7.6 mm (5.62 x 2.82 x 0.30 in)\r\nWeight	141 g (4.97 oz)\r\nSIM	Dual SIM (Nano-SIM/ Micro-SIM)\r\nDISPLAY	Type	IPS LCD capacitive touchscreen, 16M colors\r\nSize	5.0 inches (~67.4% screen-to-body ratio)\r\nResolution	540 x 960 pixels (~220 ppi pixel density)\r\nMultitouch	Yes\r\n 	- Color OS 2.1\r\nPLATFORM	OS	Android OS, v5.1 (Lollipop)\r\nChipset	Mediatek MT6582 - 3G model\r\nQualcomm MSM8916 Snapdragon 410 - 4G model\r\nCPU	Quad-core 1.3 GHz Cortex-A7 - 3G model\r\nQuad-core 1.2 GHz Cortex-A53 - 4G model\r\nGPU	Mali-400MP2\r\nAdreno 306\r\nMEMORY	Card slot	microSD (dedicated slot), up to 256 GB (LTE model), 32 GB (3G model)\r\nInternal	16 GB, 1 GB RAM\r\nCAMERA	Primary	8 MP, f/2.0, autofocus, LED flash\r\nFeatures	1/4\" sensor size, geo-tagging, touch focus, face detection, HDR, panorama\r\nVideo	1080p@30fps\r\nSecondary	5 MP, f/2.4\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\nCOMMS	WLAN	Wi-Fi 802.11 b/g/n, hotspot\r\nBluetooth	v4.0, A2DP\r\nGPS	Yes, with A-GPS\r\nRadio	FM radio\r\nUSB	microUSB v2.0, USB Host\r\nFEATURES	Sensors	Accelerometer, proximity, compass\r\nMessaging	SMS (threaded view), MMS, Email, Push Email\r\nBrowser	HTML5\r\nJava	No\r\n 	- MP4/H.264/FLAC player\r\n- MP3/eAAC+/WAV player\r\n- Document viewer\r\n- Photo viewer/editor\r\nBATTERY	 	Non-removable Li-Po 2420 mAh battery\r\nStand-by	Up to 218 h (3G)\r\nTalk time	Up to 16 h (3G)\r\nMISC	Colors	Blue, White\r\nPrice group	3/10'),(5,5,'OPPO','OPPO A37',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2016, June\r\nStatus	Available. Released 2016, June\r\nBODY	Dimensions	143.1 x 71 x 7.7 mm (5.63 x 2.80 x 0.30 in)\r\nWeight	136 g (4.80 oz)\r\nSIM	Dual SIM (Nano-SIM, dual stand-by)\r\nDISPLAY	Type	IPS LCD capacitive touchscreen, 16M colors\r\nSize	5.0 inches (~67.8% screen-to-body ratio)\r\nResolution	720 x 1280 pixels (~294 ppi pixel density)\r\nMultitouch	Yes\r\nProtection	Corning Gorilla Glass 4\r\n 	- Color OS 3.0\r\nPLATFORM	OS	Android OS, v5.1 (Lollipop)\r\nChipset	Qualcomm MSM8916 Snapdragon 410\r\nCPU	Quad-core 1.2 GHz Cortex-A53\r\nGPU	Adreno 306\r\nMEMORY	Card slot	microSD, up to 256 GB (dedicated slot)\r\nInternal	16 GB, 2 GB RAM\r\nCAMERA	Primary	8 MP, f/2.0, autofocus, LED flash\r\nFeatures	1/3.2\" sensor size, 1.4 Âµm pixel size, geo-tagging, touch focus, face detection, panorama\r\nVideo	1080p@30fps\r\nSecondary	5 MP, f/2.4, 1/4\" sensor size\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\nCOMMS	WLAN	Wi-Fi 802.11 a/b/g/n, hotspot\r\nBluetooth	v4.0, A2DP\r\nGPS	Yes, with A-GPS\r\nRadio	FM radio\r\nUSB	microUSB v2.0\r\nFEATURES	Sensors	Accelerometer, proximity, compass\r\nMessaging	SMS (threaded view), MMS, Email, Push Email\r\nBrowser	HTML5\r\nJava	No\r\n 	- MP4/H.264/FLAC player\r\n- MP3/eAAC+/WAV player\r\n- Document viewer\r\n- Photo viewer/editor\r\nBATTERY	 	Non-removable Li-Ion 2630 mAh battery\r\nMISC	Colors	Gold, Rose Gold\r\nPrice group	5/10'),(6,6,'OPPO','OPPO A39',0,0,0,0,'','Harga	Rp 2.499.000 Jutaan\r\nSPESIFIKASI\r\nJaringan	3G, HSPA, EDGE, 4G LTE\r\n4G LTE Cat 4\r\nSIM	Dual SIM, Nano SIM\r\nDimensi	150 x 72 x 9 mm\r\nBahan	Metal\r\nLED Notifikasi	Ada\r\nLayar	Layar 5.2 IPS LCD capacitive\r\nResolusi 720 x 1280 pixels\r\nKerapatan  ~282 ppi\r\n2.5 D Curved Gorilla Glass 4\r\nSistem Operasi	OS Android v 6.0 Marsmallow\r\nColor OS 3.0\r\nChipset	Chipset Mediatek MT6750\r\nCPU Octa Core 1.5 GHz Cortex A53\r\nGPU Mali T860 MP2\r\nMemori	RAM 3 GB\r\nMemori Internal 32 GB\r\nMemori Eksternal up to 128 GB\r\nKamera	Kamera Utama 13 MP, phase detection autofocus, dual-LED (dual tone) flash\r\nVideo : 1080p@30fps\r\nKamera Depan 5 MP, Screen Flash\r\nKonektifitas	WIFI, 802 .11 a/ b/g/nt\r\nWI-FI hotspot\r\nBluetooth v4.0 ,A2DP\r\nGPS â€“ A GPS\r\nMicro USB v 2.0\r\nUSB OTG\r\nSensor	Acelerometer\r\nproximity\r\nAmbient Light\r\nGyroscope\r\nCompass\r\nBaterai	Li-Ion 2900 mAh\r\nNon-Removable\r\nâ€“\r\nWarna	Gold, Rose Gold'),(7,7,'OPPO','OPPO F1S',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2016, August\r\nStatus	Available. Released 2016, August\r\nBODY	Dimensions	154.5 x 76 x 7.4 mm (6.08 x 2.99 x 0.29 in)\r\nWeight	160 g (5.64 oz)\r\nSIM	Single SIM (Nano-SIM) or Dual SIM (Nano-SIM, dual stand-by)\r\nDISPLAY	Type	IPS LCD capacitive touchscreen, 16M colors\r\nSize	5.5 inches (~71.0% screen-to-body ratio)\r\nResolution	720 x 1280 pixels (~267 ppi pixel density)\r\nMultitouch	Yes\r\nProtection	Corning Gorilla Glass 4\r\n 	- Color OS 3.0\r\nPLATFORM	OS	Android OS, v5.1 (Lollipop)\r\nChipset	Mediatek MT6755 or MTK7650\r\nCPU	Octa-core 1.5 GHz Cortex-A53\r\nGPU	Mali-T860MP2\r\nMEMORY	Card slot	microSD, up to 256 GB (dedicated slot)\r\nInternal	32 GB, 3 RAM or 64 GB, 4 GB RAM\r\nCAMERA	Primary	13 MP, f/2.2, phase detection autofocus, LED flash, check quality\r\nFeatures	1/3\" sensor size, geo-tagging, touch focus, face detection, panorama, HDR\r\nVideo	1080p@30fps, check quality\r\nSecondary	16 MP, f/2.0, 1/3.1\" sensor size, 1080p\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\n 	- Active noise cancellation with dedicated mic\r\nCOMMS	WLAN	Wi-Fi 802.11 a/b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.0\r\nGPS	Yes, with A-GPS\r\nRadio	FM radio\r\nUSB	microUSB v2.0, USB Host\r\nFEATURES	Sensors	Fingerprint (front-mounted), accelerometer, proximity, compass\r\nMessaging	SMS (threaded view), MMS, Email, Push Email\r\nBrowser	HTML5\r\nJava	No\r\n 	- MP4/H.264 player\r\n- MP3/WAV/eAAC+/FLAC player\r\n- Document viewer\r\n- Photo/video editor\r\nBATTERY	 	Non-removable Li-Po 3075 mAh battery\r\nMISC	Colors	Gold, Rose Gold, Gray\r\nSAR US	0.31 W/kg (head)     0.36 W/kg (body)    \r\nSAR EU	1.60 W/kg (head)     1.05 W/kg (body)    \r\nPrice group	6/10\r\nTESTS	Camera	Photo / Video'),(8,8,'OPPO','OPPO F1S NEW',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2016, August\r\nStatus	Available. Released 2016, August\r\nBODY	Dimensions	154.5 x 76 x 7.4 mm (6.08 x 2.99 x 0.29 in)\r\nWeight	160 g (5.64 oz)\r\nSIM	Single SIM (Nano-SIM) or Dual SIM (Nano-SIM, dual stand-by)\r\nDISPLAY	Type	IPS LCD capacitive touchscreen, 16M colors\r\nSize	5.5 inches (~71.0% screen-to-body ratio)\r\nResolution	720 x 1280 pixels (~267 ppi pixel density)\r\nMultitouch	Yes\r\nProtection	Corning Gorilla Glass 4\r\n 	- Color OS 3.0\r\nPLATFORM	OS	Android OS, v5.1 (Lollipop)\r\nChipset	Mediatek MT6755 or MTK7650\r\nCPU	Octa-core 1.5 GHz Cortex-A53\r\nGPU	Mali-T860MP2\r\nMEMORY	Card slot	microSD, up to 256 GB (dedicated slot)\r\nInternal	32 GB, 3 RAM or 64 GB, 4 GB RAM\r\nCAMERA	Primary	13 MP, f/2.2, phase detection autofocus, LED flash, check quality\r\nFeatures	1/3\" sensor size, geo-tagging, touch focus, face detection, panorama, HDR\r\nVideo	1080p@30fps, check quality\r\nSecondary	16 MP, f/2.0, 1/3.1\" sensor size, 1080p\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\n 	- Active noise cancellation with dedicated mic\r\nCOMMS	WLAN	Wi-Fi 802.11 a/b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.0\r\nGPS	Yes, with A-GPS\r\nRadio	FM radio\r\nUSB	microUSB v2.0, USB Host\r\nFEATURES	Sensors	Fingerprint (front-mounted), accelerometer, proximity, compass\r\nMessaging	SMS (threaded view), MMS, Email, Push Email\r\nBrowser	HTML5\r\nJava	No\r\n 	- MP4/H.264 player\r\n- MP3/WAV/eAAC+/FLAC player\r\n- Document viewer\r\n- Photo/video editor\r\nBATTERY	 	Non-removable Li-Po 3075 mAh battery\r\nMISC	Colors	Gold, Rose Gold, Gray\r\nSAR US	0.31 W/kg (head)     0.36 W/kg (body)    \r\nSAR EU	1.60 W/kg (head)     1.05 W/kg (body)    \r\nPrice group	6/10\r\nTESTS	Camera	Photo / Video'),(10,10,'OPPO','OPPO F3 PLUS',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2017, March\r\nStatus	Coming soon. Exp. release 2017, April\r\nBODY	Dimensions	163.6 x 80.8 x 7.4 mm (6.44 x 3.18 x 0.29 in)\r\nWeight	185 g (6.53 oz)\r\nSIM	Dual SIM (Nano-SIM, dual stand-by)\r\nDISPLAY	Type	IPS LCD capacitive touchscreen, 16M colors\r\nSize	6.0 inches (~75.1% screen-to-body ratio)\r\nResolution	1080 x 1920 pixels (~367 ppi pixel density)\r\nMultitouch	Yes\r\nProtection	Corning Gorilla Glass 5\r\n 	- ColorOS 3.0\r\nPLATFORM	OS	Android OS, v6.0 (Marshmallow)\r\nChipset	Qualcomm MSM8976 Pro Snapdragon 653\r\nCPU	Octa-core (4x1.95 GHz Cortex-A72 & 4x1.44 GHz Cortex-A53)\r\nGPU	Adreno 510\r\nMEMORY	Card slot	microSD, up to 256 GB (uses SIM 2 slot)\r\nInternal	64 GB, 4 GB RAM\r\nCAMERA	Primary	16 MP, f/1.7, phase detection autofocus, OIS, dual-LED (dual tone) flash\r\nFeatures	1/2.8\" sensor size, geo-tagging, touch focus, face detection, HDR, panorama\r\nVideo	2160p@30fps, 1080p@30fps\r\nSecondary	Dual 16 MP + 8 MP, f/2.0, 1/3\" sensor size\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\n 	- Active noise cancellation with dedicated mic\r\nCOMMS	WLAN	Wi-Fi 802.11 a/b/g/n/ac, dual-band, WiFi Direct, hotspot\r\nBluetooth	v4.1, A2DP, LE\r\nGPS	Yes, with A-GPS\r\nRadio	No\r\nUSB	microUSB v2.0\r\nFEATURES	Sensors	Fingerprint (front-mounted), accelerometer, gyro, proximity, compass\r\nMessaging	SMS (threaded view), MMS, Email, Push Email\r\nBrowser	HTML5\r\nJava	No\r\n 	- Fast battery charging: (VOOC Flash Charge)\r\n- MP4/H.264 player\r\n- MP3/WAV/eAAC+/FLAC player\r\n- Document viewer\r\n- Photo/video editor\r\nBATTERY	 	Non-removable Li-Ion 4000 mAh battery\r\nMISC	Colors	Black, Gold\r\nPrice group	8/10'),(12,12,'SAMSUNG','GALAXY Z2',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2016, August\r\nStatus	Available. Released 2016, August\r\nBODY	Dimensions	121.5 x 63 x 10.8 mm (4.78 x 2.48 x 0.43 in)\r\nWeight	127 g (4.48 oz)\r\nSIM	Dual SIM (Micro-SIM, dual stand-by)\r\nDISPLAY	Type	TFT capacitive touchscreen, 256K colors\r\nSize	4.0 inches (~59.5% screen-to-body ratio)\r\nResolution	480 x 800 pixels (~233 ppi pixel density)\r\nMultitouch	Yes\r\nPLATFORM	OS	Tizen OS, v2.4\r\nChipset	Spreadtrum SC9830\r\nCPU	Quad-core 1.5 GHz Cortex-A7\r\nGPU	Mali-400MP2\r\nMEMORY	Card slot	microSD, up to 200 GB (dedicated slot)\r\nInternal	8 GB, 1 GB RAM\r\nCAMERA	Primary	5 MP, f/2.2, LED flash\r\nFeatures	Yes\r\nVideo	720p@30fps\r\nSecondary	VGA, f/2.4\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\nCOMMS	WLAN	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.0, A2DP\r\nGPS	Yes, with A-GPS, GLONASS\r\nRadio	FM radio\r\nUSB	microUSB v2.0\r\nFEATURES	Sensors	Accelerometer\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML\r\nJava	No\r\n 	- MP4/H.264 player\r\n- MP3/WAV/AAC/Flac player\r\n- Photo viewer\r\n- Document viewer\r\nBATTERY	 	Removable Li-Ion 1500 mAh battery\r\nTalk time	Up to 8 h (3G)\r\nMusic play	Up to 30 h\r\nMISC	Colors	Gold, Black, Red\r\nSAR US	0.81 W/kg (head)    \r\nSAR EU	0.58 W/kg (head)     1.30 W/kg (body)    \r\nPrice group	2/10'),(13,13,'SAMSUNG','GALAXY J1 MINI',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA\r\nLAUNCH	Announced	2016, February\r\nStatus	Available. Released 2016, February\r\nBODY	Dimensions	126.6 x 63.1 x 10.8 mm (4.98 x 2.48 x 0.43 in)\r\nWeight	123 g (4.34 oz)\r\nSIM	Dual SIM (Micro-SIM, dual stand-by)\r\nDISPLAY	Type	TFT capacitive touchscreen, 256K colors\r\nSize	4.0 inches (~57.0% screen-to-body ratio)\r\nResolution	480 x 800 pixels (~233 ppi pixel density)\r\nMultitouch	Yes\r\nPLATFORM	OS	Android OS, v5.1 (Lollipop)\r\nChipset	Spreadtrum SC9830\r\nCPU	Quad-core 1.2 GHz Cortex-A7\r\nGPU	Mali-400MP2\r\nMEMORY	Card slot	microSD, up to 256 GB (uses SIM 2 slot)\r\nInternal	8 GB, 1 GB RAM - Galaxy J1 Nxt\r\n8 GB, 768 MB RAM - Galaxy J1 mini\r\nCAMERA	Primary	5 MP\r\nFeatures	Yes\r\nVideo	720p@30fps\r\nSecondary	VGA\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\nCOMMS	WLAN	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.0, A2DP\r\nGPS	Yes, with A-GPS, GLONASS\r\nRadio	FM radio\r\nUSB	microUSB v2.0\r\nFEATURES	Sensors	Accelerometer\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML\r\nJava	No\r\n 	- MP4/H.264 player\r\n- MP3/WAV/eAAC+/Flac player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Removable Li-Ion 1500 mAh battery\r\nTalk time	Up to 8 h (3G)\r\nMusic play	Up to 29 h\r\nMISC	Colors	White, Gold, Black\r\nSAR EU	0.76 W/kg (head)     0.47 W/kg (body)    \r\nPrice group	2/10'),(14,14,'SAMSUNG','GALAXY J1 ACE',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2015, September\r\nStatus	Available. Released 2015, October\r\nBODY	Dimensions	130.1 x 67.6 x 9.5 mm (5.12 x 2.66 x 0.37 in)\r\nWeight	131 g (4.62 oz)\r\nSIM	Single SIM (Micro-SIM) or Dual SIM (Micro-SIM, dual stand-by)\r\nDISPLAY	Type	Super AMOLED capacitive touchscreen, 16M colors\r\nSize	4.3 inches (~59.8% screen-to-body ratio)\r\nResolution	480 x 800 pixels (~217 ppi pixel density)\r\nMultitouch	Yes\r\nPLATFORM	OS	Android OS, v4.4.4 (KitKat)\r\nChipset	Spreadtrum SC9830\r\nMarvell PXA1908 - J110L\r\nCPU	Quad-core 1.5 GHz Cortex-A7 - J111F\r\nQuad-core 1.2 GHz Cortex-A7\r\nDual-core 1.3 GHz Cortex-A53- J110L\r\nGPU	Mali-400MP2\r\nVivante GC7000 UL - J110L\r\nMEMORY	Card slot	microSD, up to 256 GB (dedicated slot)\r\nInternal	4 GB, 512 MB RAM - J110L\r\n4 GB, 768 MB RAM - J110F, J110G\r\n8 GB, 1 GB RAM - J110M, J111F\r\nCAMERA	Primary	5 MP, f/2.2, 31mm, autofocus, LED flash\r\nFeatures	Geo-tagging, touch focus, face detection, panorama\r\nVideo	720p@30fps\r\nSecondary	2 MP\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\nCOMMS	WLAN	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.0, A2DP\r\nGPS	Yes, with A-GPS, GLONASS\r\nRadio	FM radio, RDS, recording\r\nUSB	microUSB v2.0\r\nFEATURES	Sensors	Accelerometer, proximity\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML\r\nJava	No\r\n 	- MP4/H.264 player\r\n- MP3/WAV/eAAC+/Flac player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Removable Li-Ion 1900 mAh battery\r\nTalk time	Up to 10 h (3G)\r\nMusic play	Up to 68 h\r\nMISC	Colors	White, Black, Blue\r\nSAR US	1.57 W/kg (head)     1.22 W/kg (body)    \r\nSAR EU	0.69 W/kg (head)     0.53 W/kg (body)    \r\nPrice group	3/10'),(15,15,'SAMSUNG','GALAXY J1 2016',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2016, January\r\nStatus	Available. Released 2016, January\r\nBODY	Dimensions	132.6 x 69.3 x 8.9 mm (5.22 x 2.73 x 0.35 in)\r\nWeight	131 g (4.62 oz)\r\nSIM	Single SIM (Micro-SIM) or Dual SIM (Micro-SIM, dual stand-by)\r\nDISPLAY	Type	Super AMOLED capacitive touchscreen, 16M colors\r\nSize	4.5 inches (~62.7% screen-to-body ratio)\r\nResolution	480 x 800 pixels (~207 ppi pixel density)\r\nMultitouch	Yes\r\nPLATFORM	OS	Android OS, v5.1.1 (Lollipop)\r\nChipset	Spreadtrum SC9830\r\nCPU	Quad-core 1.3 GHz Cortex-A7\r\nGPU	Mali-400\r\nMEMORY	Card slot	microSD, up to 256 GB (dedicated slot)\r\nInternal	8 GB, 1 GB RAM\r\nCAMERA	Primary	5 MP, f/2.2, autofocus, LED flash\r\nFeatures	Geo-tagging, touch focus, face detection\r\nVideo	720p@30fps\r\nSecondary	2 MP, f/2.2\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\nCOMMS	WLAN	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.1, A2DP, LE\r\nGPS	Yes, with A-GPS, GLONASS\r\nRadio	FM radio, RDS, recording\r\nUSB	microUSB v2.0\r\nFEATURES	Sensors	Accelerometer, proximity\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML\r\nJava	No\r\n 	- MP4/H.264 player\r\n- MP3/WAV/eAAC+/Flac player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Removable Li-Ion 2050 mAh battery\r\nTalk time	Up to 12 h (3G)\r\nMusic play	Up to 39 h\r\nMISC	Colors	White, Black, Gold\r\nSAR US	1.58 W/kg (head)     1.18 W/kg (body)    \r\nSAR EU	0.70 W/kg (head)     0.59 W/kg (body)    \r\nPrice group	3/10'),(16,16,'SAMSUNG','GALAXY J2 PRIME',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2016, November\r\nStatus	Available. Released 2016, November\r\nBODY	Dimensions	144.8 x 72.1 x 8.9 mm (5.70 x 2.84 x 0.35 in)\r\nWeight	160 g (5.64 oz)\r\nSIM	Single SIM (Micro-SIM) or Dual SIM (Micro-SIM, dual stand-by)\r\nDISPLAY	Type	PLS TFT capacitive touchscreen, 16M colors\r\nSize	5.0 inches (~66.0% screen-to-body ratio)\r\nResolution	540 x 960 pixels (~220 ppi pixel density)\r\nMultitouch	Yes\r\nPLATFORM	OS	Android OS, v6.0 (Marshmallow)\r\nChipset	Mediatek MT6737T\r\nCPU	Quad-core 1.4 GHz Cortex-A53\r\nGPU	Mali-T720MP2\r\nMEMORY	Card slot	microSD, up to 256 GB (dedicated slot) - single SIM\r\nmicroSD, up to 256 GB (uses SIM 2 slot) - dual SIM\r\nInternal	8 GB, 1.5 GB RAM\r\nCAMERA	Primary	8 MP, f/2.2, autofocus, LED flash\r\nFeatures	Geo-tagging, touch focus, face detection\r\nVideo	720p@30fps\r\nSecondary	5 MP, f/2.2, LED flash\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\nCOMMS	WLAN	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.2, A2DP, LE\r\nGPS	Yes, with A-GPS, GLONASS\r\nRadio	FM radio, RDS, recording\r\nUSB	microUSB v2.0, USB On-The-Go\r\nFEATURES	Sensors	Accelerometer, proximity\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML\r\nJava	No\r\n 	- MP4/H.264 player\r\n- MP3/WAV/eAAC+/Flac player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Removable Li-Ion 2600 mAh battery\r\nTalk time	Up to 12 h (3G)\r\nMusic play	Up to 59 h\r\nMISC	Colors	Black, Gold, Silver, Pink\r\nSAR EU	0.53 W/kg (head)     1.27 W/kg (body)    \r\nPrice group	3/10\r\nTESTS	Performance	Basemark OS II: 360 / Basemark X: 1683\r\nLoudspeaker	Voice 67dB / Noise 64dB / Ring 75dB\r\nBattery life	\r\nEndurance rating 67h'),(17,17,'SAMSUNG','GALAXY J3 2016',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2015, November\r\nStatus	Available. Released 2016, January\r\nBODY	Dimensions	142.3 x 71 x 7.9 mm (5.60 x 2.80 x 0.31 in)\r\nWeight	138 g (4.87 oz)\r\nSIM	Single SIM (Micro-SIM) or Dual SIM (Micro-SIM, dual stand-by)\r\nDISPLAY	Type	Super AMOLED capacitive touchscreen, 16M colors\r\nSize	5.0 inches (~68.2% screen-to-body ratio)\r\nResolution	720 x 1280 pixels (~294 ppi pixel density)\r\nMultitouch	Yes\r\nProtection	Asahi Dragontrail Glass\r\nPLATFORM	OS	Android OS, v5.1.1 (Lollipop)\r\nChipset	Spreadtrum SC9830\r\nExynos 3475 Quad - J320A\r\nCPU	Quad-core 1.5 GHz Cortex-A7\r\nQuad-core 1.3 GHz Cortex-A7 - J320A\r\nGPU	Mali-400\r\nMali-T720 - J320A\r\nMEMORY	Card slot	microSD, up to 256 GB (dedicated slot)\r\nInternal	8/16 GB, 1.5 GB RAM\r\nCAMERA	Primary	8 MP, f/2.2, autofocus, LED flash - J3109, J320F\r\n5 MP, f/2.2, autofocus, LED flash - J320P, J320A, check quality\r\nFeatures	Geo-tagging, touch focus, face detection, HDR\r\nVideo	1080p@30fps (J3109), 720p@30fps (J320P, J320F, J320A), check quality\r\nSecondary	5 MP, f/2.2, 720p@30fps - J3109, J320F\r\n2 MP - J320P, J320A\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\n 	- Active noise cancellation with dedicated mic\r\nCOMMS	WLAN	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.1, A2DP, LE\r\nGPS	Yes, with A-GPS, GLONASS/ BDS (region dependent)\r\nRadio	FM radio, RDS, recording\r\nUSB	microUSB v2.0, USB On-The-Go\r\nFEATURES	Sensors	Accelerometer, proximity\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML5\r\nJava	No\r\n 	- MP4/H.264 player\r\n- MP3/WAV/eAAC+/Flac player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Removable Li-Ion 2600 mAh battery\r\nStand-by	Up to 349 h\r\nTalk time	Up to 22 h\r\nMusic play	Up to 77 h\r\nMISC	Colors	White, Black, Gold\r\nSAR US	1.17 W/kg (head)     1.12 W/kg (body)    \r\nSAR EU	0.48 W/kg (head)     0.42 W/kg (body)    \r\nPrice group	3/10\r\nTESTS	Performance	Basemark OS II: 399 / Basemark OS II 2.0: 326\r\nBasemark X: 1424\r\nDisplay	Contrast ratio: Infinite (nominal), 3.523 (sunlight)\r\nCamera	Photo / Video\r\nLoudspeaker	Voice 64dB / Noise 65dB / Ring 68dB\r\nAudio quality	Noise -92.4dB / Crosstalk -91.3dB\r\nBattery life	\r\nEndurance rating 66h'),(18,18,'SAMSUNG','GALAXY J5 PRIME',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2016, September\r\nStatus	Available. Released 2016, October\r\nBODY	Dimensions	142.8 x 69.5 x 8.1 mm (5.62 x 2.74 x 0.32 in)\r\nWeight	143 g (5.04 oz)\r\nSIM	Dual SIM (Nano-SIM, dual stand-by)\r\nDISPLAY	Type	PLS TFT capacitive touchscreen, 16M colors\r\nSize	5.0 inches (~69.4% screen-to-body ratio)\r\nResolution	720 x 1280 pixels (~294 ppi pixel density)\r\nMultitouch	Yes\r\nProtection	Corning Gorilla Glass (market dependent)\r\nPLATFORM	OS	Android OS, v6.0.1 (Marshmallow)\r\nChipset	Exynos 7570 Quad\r\nCPU	Quad-core 1.4 GHz Cortex-A53\r\nGPU	Mali-T720\r\nMEMORY	Card slot	microSD, up to 256 GB (dedicated slot)\r\nInternal	16 GB, 2 GB RAM\r\nCAMERA	Primary	13 MP, f/1.9, 28mm, autofocus, LED flash\r\nFeatures	Geo-tagging, touch focus, face detection, panorama, HDR\r\nVideo	1080p@30fps\r\nSecondary	5 MP, f/2.2\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\nCOMMS	WLAN	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.2, A2DP, LE\r\nGPS	Yes, with A-GPS, GLONASS/ BDS (region dependent)\r\nRadio	FM radio; recording\r\nUSB	microUSB v2.0, USB On-The-Go\r\nFEATURES	Sensors	Fingerprint (front-mounted), accelerometer, proximity\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML5\r\nJava	No\r\n 	- Xvid/DivX/MP4/H.265 player\r\n- MP3/WAV/eAAC+/FLAC player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Non-removable Li-Ion 2400 mAh battery\r\nTalk time	Up to 16 h (3G)\r\nMusic play	Up to 54 h\r\nMISC	Colors	Black, Gold\r\nSAR US	0.71 W/kg (head)    \r\nSAR EU	0.42 W/kg (head)     0.83 W/kg (body)    \r\nPrice group	5/10'),(20,20,'SAMSUNG','GALAXY J7 PRIME',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2016, August\r\nStatus	Available. Released 2016, September\r\nBODY	Dimensions	151.7 x 75 x 8 mm (5.97 x 2.95 x 0.31 in)\r\nWeight	167 g (5.89 oz)\r\nSIM	Dual SIM (Nano-SIM, dual stand-by)\r\nDISPLAY	Type	PLS TFT capacitive touchscreen, 16M colors\r\nSize	5.5 inches (~73.3% screen-to-body ratio)\r\nResolution	1080 x 1920 pixels (~401 ppi pixel density)\r\nMultitouch	Yes\r\nProtection	Corning Gorilla Glass (market dependent)\r\nPLATFORM	OS	Android OS, v6.0.1 (Marshmallow)\r\nChipset	Exynos 7870 Octa\r\nCPU	Octa-core 1.6 GHz Cortex-A53\r\nGPU	Mali-T830MP2\r\nMEMORY	Card slot	microSD, up to 256 GB (dedicated slot)\r\nInternal	16/32 GB, 3 GB RAM\r\nCAMERA	Primary	13 MP, f/1.9, 28mm, autofocus, LED flash\r\nFeatures	Geo-tagging, touch focus, face detection, panorama, HDR\r\nVideo	1080p@30fps\r\nSecondary	8 MP, f/1.9\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\nCOMMS	WLAN	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.1, A2DP, LE\r\nGPS	Yes, with A-GPS, GLONASS/ BDS (region dependent)\r\nRadio	FM radio\r\nUSB	microUSB v2.0, USB On-The-Go\r\nFEATURES	Sensors	Fingerprint (front-mounted), accelerometer, proximity\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML5\r\nJava	No\r\n 	- ANT+ support\r\n- Xvid/DivX/MP4/H.265 player\r\n- MP3/WAV/eAAC+/FLAC player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Non-removable Li-Ion 3300 mAh battery\r\nTalk time	Up to 21 h (3G)\r\nMusic play	Up to 84 h\r\nMISC	Colors	Black, Gold\r\nSAR US	0.65 W/kg (head)    \r\nSAR EU	0.40 W/kg (head)     1.40 W/kg (body)    \r\nPrice group	6/10'),(21,21,'SAMSUNG','GALAXY A5 2017',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2017, January\r\nStatus	Available. Released 2017, January\r\nBODY	Dimensions	146.1 x 71.4 x 7.9 mm (5.75 x 2.81 x 0.31 in)\r\nWeight	157 g (5.54 oz)\r\nSIM	Single SIM (Nano-SIM) or Dual SIM (Nano-SIM, dual stand-by)\r\n 	- Samsung Pay\r\n- IP68 certified - dust/water proof over 1.5 meter and 30 minutes\r\nDISPLAY	Type	Super AMOLED capacitive touchscreen, 16M colors\r\nSize	5.2 inches (~71.5% screen-to-body ratio)\r\nResolution	1080 x 1920 pixels (~424 ppi pixel density)\r\nMultitouch	Yes\r\nProtection	Corning Gorilla Glass 4\r\n 	- Always-on display\r\nPLATFORM	OS	Android OS, v6.0.1 (Marshmallow)\r\nChipset	Exynos 7880 Octa\r\nCPU	Octa-core 1.9 GHz Cortex-A53\r\nGPU	Mali-T830MP3\r\nMEMORY	Card slot	microSD, up to 256 GB (dedicated slot)\r\nInternal	32 GB, 3 GB RAM\r\nCAMERA	Primary	16 MP, f/1.9, 27mm, autofocus, LED flash, check quality\r\nFeatures	Geo-tagging, touch focus, face detection, panorama, HDR\r\nVideo	1080p@30fps, check quality\r\nSecondary	16 MP, f/1.9, 1080p\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\n 	- Active noise cancellation with dedicated mic\r\nCOMMS	WLAN	Wi-Fi 802.11 a/b/g/n/ac, dual-band, WiFi Direct, hotspot\r\nBluetooth	v4.2, A2DP, EDR, LE\r\nGPS	Yes, with A-GPS, GLONASS, BDS\r\nNFC	Yes\r\nRadio	FM radio\r\nUSB	v2.0, Type-C 1.0 reversible connector\r\nFEATURES	Sensors	Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML5\r\nJava	No\r\n 	- Fast battery charging\r\n- ANT+ support\r\n- MP4/WMV/H.265 player\r\n- MP3/WAV/WMA/eAAC+/FLAC player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Non-removable Li-Ion 3000 mAh battery\r\nTalk time	Up to 16 h (3G)\r\nMusic play	Up to 53 h\r\nMISC	Colors	Black Sky, Gold Sand, Blue Mist, Peach Cloud\r\nSAR EU	0.52 W/kg (head)     1.39 W/kg (body)    \r\nPrice group	8/10\r\nTESTS	Performance	Basemark OS II 2.0: 1417\r\nDisplay	Contrast ratio: Infinite (nominal), 3.804 (sunlight)\r\nCamera	Photo / Video\r\nLoudspeaker	Voice 66dB / Noise 66dB / Ring 78dB\r\nAudio quality	Noise -93.1dB / Crosstalk -90.2dB\r\nBattery life	\r\nEndurance rating 95h'),(22,22,'XIAOMI','REDMI 4A',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2016, November\r\nStatus	Available. Released 2016, November\r\nBODY	Dimensions	139.9 x 70.4 x 8.5 mm (5.51 x 2.77 x 0.33 in)\r\nWeight	131.5 g (4.66 oz)\r\nSIM	Dual SIM (Nano-SIM/ Micro-SIM, dual stand-by)\r\nDISPLAY	Type	IPS LCD capacitive touchscreen, 16M colors\r\nSize	5.0 inches (~69.0% screen-to-body ratio)\r\nResolution	720 x 1280 pixels (~296 ppi pixel density)\r\nMultitouch	Yes\r\n 	- MIUI 8\r\nPLATFORM	OS	Android OS, v6.0.1 (Marshmallow)\r\nChipset	Qualcomm MSM8917 Snapdragon 425\r\nCPU	Quad-core 1.4 GHz Cortex-A53\r\nGPU	Adreno 308\r\nMEMORY	Card slot	microSD, up to 256 GB (uses SIM 2 slot)\r\nInternal	16/32 GB, 2 GB RAM\r\nCAMERA	Primary	13 MP, f/2.2, autofocus, LED flash\r\nFeatures	Geo-tagging, touch focus, face/smile detection, HDR, panorama\r\nVideo	1080p@30fps\r\nSecondary	5 MP, f/2.2\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\n 	- Active noise cancellation with dedicated mic\r\nCOMMS	WLAN	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.1, A2DP, LE\r\nGPS	Yes, with A-GPS, GLONASS, BDS\r\nInfrared port	Yes\r\nRadio	FM radio\r\nUSB	microUSB v2.0\r\nFEATURES	Sensors	Accelerometer, gyro, proximity\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML5\r\nJava	No\r\n 	- Xvid/MP4/H.265 player\r\n- MP3/WAV/eAAC+/FLAC player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Non-removable Li-Ion 3120 mAh battery\r\nMISC	Colors	Gold, Rose Gold, Dark Gray\r\nPrice group	3/10'),(23,23,'XIAOMI','REDMI 3X',0,0,0,0,'','NETWORK	Technology	\r\nGSM / CDMA / HSPA / EVDO / LTE\r\nLAUNCH	Announced	2016, June\r\nStatus	Available. Released 2016, July\r\nBODY	Dimensions	139.3 x 69.6 x 8.5 mm (5.48 x 2.74 x 0.33 in)\r\nWeight	144 g (5.08 oz)\r\nSIM	Dual SIM (Micro-SIM/Nano-SIM, dual stand-by)\r\nDISPLAY	Type	IPS LCD capacitive touchscreen, 16M colors\r\nSize	5.0 inches (~71.1% screen-to-body ratio)\r\nResolution	720 x 1280 pixels (~294 ppi pixel density)\r\nMultitouch	Yes\r\n 	- MIUI 7.3\r\nPLATFORM	OS	Android OS, v6.0.1 (Marshmallow)\r\nChipset	Qualcomm MSM8937 Snapdragon 430\r\nCPU	Octa-core 1.4 GHz Cortex-A53\r\nGPU	Adreno 505\r\nMEMORY	Card slot	microSD, up to 256 GB (uses SIM 2 slot)\r\nInternal	32 GB, 2 GB RAM\r\nCAMERA	Primary	13 MP, f/2.0, phase detection autofocus, LED flash\r\nFeatures	Geo-tagging, touch focus, face/smile detection, HDR, panorama\r\nVideo	1080p@30fps\r\nSecondary	5 MP, f/2.2, 1080p\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\n 	- Active noise cancellation with dedicated mic\r\nCOMMS	WLAN	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.1, A2DP\r\nGPS	Yes, with A-GPS, GLONASS, BDS\r\nInfrared port	Yes\r\nRadio	FM radio\r\nUSB	microUSB v2.0\r\nFEATURES	Sensors	Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML5\r\nJava	No\r\n 	- Fast battery charging\r\n- DivX/Xvid/MP4/H.264 player\r\n- MP3/WAV/eAAC+/FLAC player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Non-removable Li-Ion 4100 mAh battery\r\nMISC	Colors	Gold, Dark Gray, Silver\r\nPrice group	4/10'),(24,24,'XIAOMI','REDMI 4',0,0,0,0,'','NETWORK	Technology	\r\nGSM / CDMA / HSPA / EVDO / LTE\r\nLAUNCH	Announced	2016, November\r\nStatus	Available. Released 2016, November\r\nBODY	Dimensions	141.3 x 69.6 x 8.9 mm (5.56 x 2.74 x 0.35 in)\r\nWeight	156 g (5.50 oz)\r\nSIM	Dual SIM\r\nDISPLAY	Type	IPS LCD capacitive touchscreen, 16M colors\r\nSize	5.0 inches (~69.1% screen-to-body ratio)\r\nResolution	720 x 1280 pixels (~296 ppi pixel density)\r\nMultitouch	Yes\r\n 	- MIUI 8\r\nPLATFORM	OS	Android OS, v6.0.1 (Marshmallow)\r\nChipset	Qualcomm MSM8937 Snapdragon 430\r\nCPU	Octa-core 1.4 GHz Cortex-A53\r\nGPU	Adreno 505\r\nMEMORY	Card slot	microSD, up to 256 GB (uses SIM 2 slot)\r\nInternal	16 GB, 2 GB RAM\r\nCAMERA	Primary	13 MP, f/2.2, phase detection autofocus, LED flash\r\nFeatures	Geo-tagging, touch focus, face/smile detection, HDR, panorama\r\nVideo	1080p@30fps\r\nSecondary	5 MP, f/2.2, 1080p\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\n 	- Active noise cancellation with dedicated mic\r\nCOMMS	WLAN	Wi-Fi 802.11 a/b/g/n, dual-band, WiFi Direct, hotspot\r\nBluetooth	v4.1, A2DP, LE\r\nGPS	Yes, with A-GPS, GLONASS, BDS\r\nInfrared port	Yes\r\nRadio	FM radio\r\nUSB	microUSB v2.0\r\nFEATURES	Sensors	Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML5\r\nJava	No\r\n 	- Fast battery charging\r\n- DivX/Xvid/MP4/H.265 player\r\n- MP3/WAV/eAAC+/FLAC player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Non-removable Li-Po 4100 mAh battery\r\nMISC	Colors	Gold, Dark Gray, Silver\r\nPrice group	3/10'),(25,25,'XIAOMI','REDMI 4 PRIME',0,0,0,0,'','NETWORK	Technology	\r\nGSM / CDMA / HSPA / EVDO / LTE\r\nLAUNCH	Announced	2016, November\r\nStatus	Available. Released 2016, November\r\nBODY	Dimensions	141.3 x 69.6 x 8.9 mm (5.56 x 2.74 x 0.35 in)\r\nWeight	156 g (5.50 oz)\r\nSIM	Dual SIM\r\nDISPLAY	Type	IPS LCD capacitive touchscreen, 16M colors\r\nSize	5.0 inches (~69.1% screen-to-body ratio)\r\nResolution	720 x 1280 pixels (~296 ppi pixel density)\r\nMultitouch	Yes\r\n 	- MIUI 8\r\nPLATFORM	OS	Android OS, v6.0.1 (Marshmallow)\r\nChipset	Qualcomm MSM8937 Snapdragon 430\r\nCPU	Octa-core 1.4 GHz Cortex-A53\r\nGPU	Adreno 505\r\nMEMORY	Card slot	microSD, up to 256 GB (uses SIM 2 slot)\r\nInternal	16 GB, 2 GB RAM\r\nCAMERA	Primary	13 MP, f/2.2, phase detection autofocus, LED flash\r\nFeatures	Geo-tagging, touch focus, face/smile detection, HDR, panorama\r\nVideo	1080p@30fps\r\nSecondary	5 MP, f/2.2, 1080p\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\n 	- Active noise cancellation with dedicated mic\r\nCOMMS	WLAN	Wi-Fi 802.11 a/b/g/n, dual-band, WiFi Direct, hotspot\r\nBluetooth	v4.1, A2DP, LE\r\nGPS	Yes, with A-GPS, GLONASS, BDS\r\nInfrared port	Yes\r\nRadio	FM radio\r\nUSB	microUSB v2.0\r\nFEATURES	Sensors	Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML5\r\nJava	No\r\n 	- Fast battery charging\r\n- DivX/Xvid/MP4/H.265 player\r\n- MP3/WAV/eAAC+/FLAC player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Non-removable Li-Po 4100 mAh battery\r\nMISC	Colors	Gold, Dark Gray, Silver\r\nPrice group	3/10'),(26,26,'XIAOMI','REDMI NOTE 4',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2017, January\r\nStatus	Available. Released 2017, January\r\nBODY	Dimensions	151 x 76 x 8.5 mm (5.94 x 2.99 x 0.33 in)\r\nWeight	165 g (5.82 oz)\r\nSIM	Dual SIM (Micro-SIM/Nano-SIM, dual stand-by)\r\nDISPLAY	Type	IPS LCD capacitive touchscreen, 16M colors\r\nSize	5.5 inches (~72.7% screen-to-body ratio)\r\nResolution	1080 x 1920 pixels (~401 ppi pixel density)\r\nMultitouch	Yes\r\n 	- MIUI 8.0\r\nPLATFORM	OS	Android OS, v6.0 (Marshmallow)\r\nChipset	Qualcomm MSM8953 Snapdragon 625\r\nCPU	Octa-core 2.0 GHz Cortex-A53\r\nGPU	Adreno 506\r\nMEMORY	Card slot	microSD, up to 256 GB (uses SIM 2 slot)\r\nInternal	32 GB, 2/3 GB RAM or 64 GB, 4 GB RAM\r\nCAMERA	Primary	13 MP, f/2.0, phase detection autofocus, dual-LED (dual tone) flash, check quality\r\nFeatures	1.12 Âµm pixel size, geo-tagging, touch focus, face detection, panorama, HDR\r\nVideo	1080p@30fps, 720p@120fps, check quality\r\nSecondary	5 MP, f/2.0, 1080p\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\n 	- 24-bit/192kHz audio\r\n- Active noise cancellation with dedicated mic\r\nCOMMS	WLAN	Wi-Fi 802.11 a/b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.1, A2DP, LE\r\nGPS	Yes, with A-GPS, GLONASS, BDS\r\nInfrared port	Yes\r\nRadio	FM radio\r\nUSB	microUSB v2.0, USB On-The-Go\r\nFEATURES	Sensors	Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML5\r\nJava	No\r\n 	- XviD/MP4/H.265 player\r\n- MP3/WAV/eAAC+/Flac player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Non-removable Li-Po 4100 mAh battery\r\nMISC	Colors	Gray, Gold, Black\r\nPrice group	4/10\r\nTESTS	Performance	Basemark OS II: 1290 / Basemark OS II 2.0: 1050\r\nBasemark X: 10446\r\nDisplay	Contrast ratio: 1503:1 (nominal), 2.714 (sunlight)\r\nCamera	Photo / Video\r\nLoudspeaker	Voice 67dB / Noise 70dB / Ring 81dB\r\nAudio quality	Noise -94.6dB / Crosstalk -94.3dB\r\nBattery life	\r\nEndurance rating 119h'),(27,27,'XIAOMI','REDMI NOTE 4 3/32',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2017, January\r\nStatus	Available. Released 2017, January\r\nBODY	Dimensions	151 x 76 x 8.5 mm (5.94 x 2.99 x 0.33 in)\r\nWeight	165 g (5.82 oz)\r\nSIM	Dual SIM (Micro-SIM/Nano-SIM, dual stand-by)\r\nDISPLAY	Type	IPS LCD capacitive touchscreen, 16M colors\r\nSize	5.5 inches (~72.7% screen-to-body ratio)\r\nResolution	1080 x 1920 pixels (~401 ppi pixel density)\r\nMultitouch	Yes\r\n 	- MIUI 8.0\r\nPLATFORM	OS	Android OS, v6.0 (Marshmallow)\r\nChipset	Qualcomm MSM8953 Snapdragon 625\r\nCPU	Octa-core 2.0 GHz Cortex-A53\r\nGPU	Adreno 506\r\nMEMORY	Card slot	microSD, up to 256 GB (uses SIM 2 slot)\r\nInternal	32 GB, 2/3 GB RAM or 64 GB, 4 GB RAM\r\nCAMERA	Primary	13 MP, f/2.0, phase detection autofocus, dual-LED (dual tone) flash, check quality\r\nFeatures	1.12 Âµm pixel size, geo-tagging, touch focus, face detection, panorama, HDR\r\nVideo	1080p@30fps, 720p@120fps, check quality\r\nSecondary	5 MP, f/2.0, 1080p\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\n 	- 24-bit/192kHz audio\r\n- Active noise cancellation with dedicated mic\r\nCOMMS	WLAN	Wi-Fi 802.11 a/b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.1, A2DP, LE\r\nGPS	Yes, with A-GPS, GLONASS, BDS\r\nInfrared port	Yes\r\nRadio	FM radio\r\nUSB	microUSB v2.0, USB On-The-Go\r\nFEATURES	Sensors	Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML5\r\nJava	No\r\n 	- XviD/MP4/H.265 player\r\n- MP3/WAV/eAAC+/Flac player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Non-removable Li-Po 4100 mAh battery\r\nMISC	Colors	Gray, Gold, Black\r\nPrice group	4/10\r\nTESTS	Performance	Basemark OS II: 1290 / Basemark OS II 2.0: 1050\r\nBasemark X: 10446\r\nDisplay	Contrast ratio: 1503:1 (nominal), 2.714 (sunlight)\r\nCamera	Photo / Video\r\nLoudspeaker	Voice 67dB / Noise 70dB / Ring 81dB\r\nAudio quality	Noise -94.6dB / Crosstalk -94.3dB\r\nBattery life	\r\nEndurance rating 119h'),(28,28,'XIAOMI','REDMI NOTE 4X',0,0,0,0,'','NETWORK	Technology	\r\nGSM / HSPA / LTE\r\nLAUNCH	Announced	2017, February\r\nStatus	Available. Released 2017, February\r\nBODY	Dimensions	151 x 76 x 8.5 mm (5.94 x 2.99 x 0.33 in)\r\nWeight	165 g (5.82 oz)\r\nSIM	Dual SIM (Micro-SIM/Nano-SIM, dual stand-by)\r\nDISPLAY	Type	IPS LCD capacitive touchscreen, 16M colors\r\nSize	5.5 inches (~72.7% screen-to-body ratio)\r\nResolution	1080 x 1920 pixels (~401 ppi pixel density)\r\nMultitouch	Yes\r\n 	- MIUI 8.0\r\nPLATFORM	OS	Android OS, v6.0 (Marshmallow)\r\nChipset	Qualcomm MSM8953 Snapdragon 625\r\nCPU	Octa-core 2.0 GHz Cortex-A53\r\nGPU	Adreno 506\r\nMEMORY	Card slot	microSD, up to 256 GB (uses SIM 2 slot)\r\nInternal	32 GB, 3 RAM or 64 GB, 4 GB RAM\r\nCAMERA	Primary	13 MP, f/2.0, phase detection autofocus, dual-LED (dual tone) flash\r\nFeatures	1.12 Âµm pixel size, geo-tagging, touch focus, face detection, panorama, HDR\r\nVideo	1080p@30fps, 720p@120fps\r\nSecondary	5 MP, f/2.0, 1080p\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\n 	- 24-bit/192kHz audio\r\n- Active noise cancellation with dedicated mic\r\nCOMMS	WLAN	Wi-Fi 802.11 a/b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.2, A2DP, LE\r\nGPS	Yes, with A-GPS, GLONASS, BDS\r\nInfrared port	Yes\r\nRadio	FM radio\r\nUSB	microUSB v2.0, USB On-The-Go\r\nFEATURES	Sensors	Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML5\r\nJava	No\r\n 	- XviD/MP4/H.265 player\r\n- MP3/WAV/eAAC+/Flac player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Non-removable Li-Po 4100 mAh battery\r\nMISC	Colors	Gray, Gold, Black, Pink\r\nPrice group	4/10'),(29,29,'XIAOMI','REDMI PRO',0,0,0,0,'','NETWORK	Technology	\r\nGSM / CDMA / HSPA / EVDO / LTE\r\nLAUNCH	Announced	2016, July\r\nStatus	Available. Released 2016, August\r\nBODY	Dimensions	151.5 x 76.2 x 8.2 mm (5.96 x 3.00 x 0.32 in)\r\nWeight	174 g (6.14 oz)\r\nSIM	Dual SIM (Nano-SIM/ Micro-SIM, dual stand-by)\r\nDISPLAY	Type	LTPS-AMOLED capacitive touchscreen, 16M colors\r\nSize	5.5 inches (~72.2% screen-to-body ratio)\r\nResolution	1080 x 1920 pixels (~401 ppi pixel density)\r\nMultitouch	Yes\r\n 	- MIUI 8.0\r\nPLATFORM	OS	Android OS, v6.0 (Marshmallow)\r\nChipset	Mediatek MT6797T Helio X25 - High & Exclusive editions\r\nMediatek MT6797 Helio X20 - Standard edition\r\nCPU	Deca-core 2.5 GHz - Exclusive edition\r\nDeca-core 2.3 GHz - High edition\r\nDeca-core 2.1 GHz - Standard edition\r\nGPU	Mali-T880 MP4\r\nMEMORY	Card slot	microSD, up to 256 GB (uses SIM 2 slot)\r\nInternal	128 GB, 4 GB RAM - Exclusive edition\r\n32/64 GB, 3 GB RAM - other editions\r\nCAMERA	Primary	Dual 13 MP + 5MP, f/2.0, phase detection autofocus, dual-LED (dual tone) flash, check quality\r\nFeatures	Geo-tagging, touch focus, face detection, HDR, panorama\r\nVideo	1080p@30fps, 720p@120fps, check quality\r\nSecondary	5 MP, f/2.0, 1080p\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\n 	- Active noise cancellation with dedicated mic\r\nCOMMS	WLAN	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot\r\nBluetooth	v4.2, A2DP, LE\r\nGPS	Yes, with A-GPS, GLONASS, BDS\r\nInfrared port	Yes\r\nRadio	FM radio; recording\r\nUSB	Type-C 1.0 reversible connector\r\nFEATURES	Sensors	Fingerprint (front-mounted), accelerometer, gyro, proximity, compass\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML5\r\nJava	No\r\n 	- XviD/MP4/H.265 player\r\n- MP3/WAV/eAAC+/FLAC player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Non-removable Li-Ion 4050 mAh battery\r\nMISC	Colors	Silver, Gold, Gray\r\nPrice group	5/10\r\nTESTS	Performance	Basemark OS II: 1648 / Basemark OS II 2.0: 1696\r\nBasemark X: 23846\r\nCamera	Photo / Video\r\nBattery life	\r\nEndurance rating 80h'),(30,30,'XIAOMI','MI MAX',0,0,0,0,'','NETWORK	Technology	\r\nGSM / CDMA / HSPA / EVDO / LTE\r\nLAUNCH	Announced	2016, May\r\nStatus	Available. Released 2016, May\r\nBODY	Dimensions	173.1 x 88.3 x 7.5 mm (6.81 x 3.48 x 0.30 in)\r\nWeight	203g (7.16 oz)\r\nSIM	Dual SIM (Nano-SIM/ Micro-SIM, dual stand-by)\r\nDISPLAY	Type	IPS LCD capacitive touchscreen, 16M colors\r\nSize	6.44 inches (~74.8% screen-to-body ratio)\r\nResolution	1080 x 1920 pixels (~342 ppi pixel density)\r\nMultitouch	Yes\r\nProtection	Corning Gorilla Glass 4\r\n 	- MIUI v7 or v8.2\r\nPLATFORM	OS	Android OS, v6.0 (Marshmallow)\r\nChipset	Qualcomm MSM8956 Snapdragon 650\r\nQualcomm MSM8976 Snapdragon 652 - Prime model\r\nCPU	Hexa-core (4x1.4 GHz Cortex-A53 & 2x1.8 GHz Cortex-A72)\r\nOcta-core (4x1.8 GHz Cortex-A72 & 4x1.4 GHz Cortex-A53)\r\nGPU	Adreno 510\r\nMEMORY	Card slot	microSD, up to 256 GB (uses SIM 1 slot)\r\nInternal	32/64 GB, 3 GB RAM\r\n128 GB, 4 GB RAM - Prime model\r\nCAMERA	Primary	16 MP, f/2.0, phase detection autofocus, dual-LED (dual tone) flash, check quality\r\nFeatures	Geo-tagging, touch focus, face detection, panorama, HDR\r\nVideo	2160p@30fps, 1080p@30fps, 720p@120fps, check quality\r\nSecondary	5 MP, f/2.0\r\nSOUND	Alert types	Vibration; MP3, WAV ringtones\r\nLoudspeaker	Yes\r\n3.5mm jack	Yes\r\n 	- Active noise cancellation with dedicated mic\r\nCOMMS	WLAN	Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, DLNA, hotspot\r\nBluetooth	v4.2, A2DP, LE\r\nGPS	Yes, with A-GPS, GLONASS, BDS\r\nInfrared port	Yes\r\nRadio	FM radio, recording\r\nUSB	microUSB v2.0, USB Host\r\nFEATURES	Sensors	Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass\r\nMessaging	SMS(threaded view), MMS, Email, Push Mail, IM\r\nBrowser	HTML5\r\nJava	No\r\n 	- MP4/DivX/XviD/WMV/H.265 player\r\n- MP3/WAV/eAAC+/FLAC player\r\n- Photo/video editor\r\n- Document viewer\r\nBATTERY	 	Non-removable Li-Ion 4850 mAh battery\r\nMISC	Colors	Gray, Silver, Gold\r\nSAR US	0.84 W/kg (head)     0.63 W/kg (body)    \r\nPrice group	4/10\r\nTESTS	Performance	Basemark OS II 2.0: 1362 / Basemark X: 15487\r\nDisplay	Contrast ratio: 922 (nominal), 1.996 (sunlight)\r\nCamera	Photo / Video\r\nLoudspeaker	Voice 67dB / Noise 66dB / Ring 68dB\r\nAudio quality	Noise -93.5dB / Crosstalk -93.8dB\r\nBattery life	\r\nEndurance rating 108h');

/*Table structure for table `item_harga` */

DROP TABLE IF EXISTS `item_harga`;

CREATE TABLE `item_harga` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_original_price` bigint(11) NOT NULL,
  `item_hpp_price` bigint(20) NOT NULL,
  `item_margin_price` bigint(11) NOT NULL,
  `item_price` bigint(11) NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `item_harga` */

insert  into `item_harga`(`stock_id`,`item_id`,`item_original_price`,`item_hpp_price`,`item_margin_price`,`item_price`) values (4,4,0,0,0,1800000),(5,5,0,0,0,2000000),(6,6,0,0,0,2600000),(7,7,0,0,0,3500000),(8,8,3400,0,0,3900000),(10,10,0,0,0,6500000),(12,12,0,0,0,890000),(13,13,0,0,0,1100000),(14,14,0,0,0,1280000),(15,15,0,0,0,1550000),(16,16,0,0,0,1750000),(17,17,0,0,0,1965000),(18,18,0,0,0,2800000),(20,20,3300,0,0,3450000),(21,21,0,0,0,4900000),(22,22,0,0,0,1550000),(23,23,0,0,0,1700000),(24,24,0,0,0,1800000),(25,25,0,0,0,2200000),(26,26,0,0,0,2000000),(27,27,0,0,0,2500000),(28,28,0,0,0,2350000),(29,29,0,0,0,2850000),(30,30,0,0,0,3650000);

/*Table structure for table `item_keterangan_details` */

DROP TABLE IF EXISTS `item_keterangan_details`;

CREATE TABLE `item_keterangan_details` (
  `item_keterangan_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `kategori_keterangan_id` int(11) NOT NULL,
  `keterangan_details` varchar(200) NOT NULL,
  `supplier` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  KEY `item_keterangan_details_id` (`item_keterangan_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;

/*Data for the table `item_keterangan_details` */

insert  into `item_keterangan_details`(`item_keterangan_details_id`,`purchase_id`,`item_id`,`kategori_id`,`kategori_keterangan_id`,`keterangan_details`,`supplier`,`status`) values (1,2,1,6,4,'86345903666379',7,1),(2,2,1,6,5,'',7,0),(3,2,1,6,4,'86349036816670',7,0),(4,2,1,6,5,'',7,0),(5,3,3,6,4,'864217037613010',7,1),(6,3,3,6,5,'0',7,0),(7,3,3,6,4,'864217037448839',7,0),(8,3,3,6,5,'0',7,0),(9,3,3,6,4,'8664217037637530',7,0),(10,3,3,6,5,'0',7,0),(11,4,4,6,4,'863459031988912',8,1),(12,4,4,6,5,'863459031988904',8,0),(13,4,4,6,4,'863459031989407',8,1),(14,4,4,6,5,'863459031989407',8,0),(15,4,4,6,4,'863459032777876',8,1),(16,4,4,6,5,'863459032777876',8,0),(17,4,4,6,4,'863459036366379',8,1),(18,4,4,6,5,'863459036366361',8,0),(19,4,4,6,4,'863459036816670',8,1),(20,4,4,6,5,'863459036816662',8,0),(21,5,5,6,4,'864217039790154',8,1),(22,5,5,6,5,'864217039790147',8,0),(23,5,5,6,4,'864217037613010',8,1),(24,5,5,6,5,'864217037613002',8,0),(25,5,5,6,4,'864217039794594',8,1),(26,5,5,6,5,'864217039794586',8,0),(27,5,5,6,4,'864217039852095',8,1),(28,5,5,6,5,'864217039852087',8,0),(29,5,5,6,4,'864217036063076',8,0),(30,5,5,6,5,'864217036063068',8,0),(31,5,5,6,4,'864218036538059',8,0),(32,5,5,6,5,'864218036538042',8,0),(33,6,6,6,4,'863526031294994',8,0),(34,6,6,6,5,'863526031294986',8,0),(35,6,6,6,4,'862049031222932',8,0),(36,6,6,6,5,'862049031222924',8,0),(37,6,6,6,4,'862049031222379',8,0),(38,6,6,6,5,'862049031222381',8,0),(39,6,6,6,4,'862049031875291',8,0),(40,6,6,6,5,'862049031875283',8,0),(41,6,6,6,4,'863526032751471',8,0),(42,6,6,6,5,'863526032751463',8,0),(43,6,6,6,4,'863526031548670',8,0),(44,6,6,6,5,'863526031548662',8,0),(45,6,6,6,4,'863526031655574',8,0),(46,6,6,6,5,'863526031655566',8,0),(47,7,7,6,4,'863525039987914',8,0),(48,7,7,6,5,'863525039987906',8,0),(49,7,7,6,4,'863525034581290',8,0),(50,7,7,6,5,'863525034581282',8,0),(51,7,7,6,4,'863525039990199',8,0),(52,7,7,6,5,'863525039990181',8,0),(53,7,7,6,4,'863525034580177',8,1),(54,7,7,6,5,'863525034580169',8,0),(55,8,8,6,4,'863525039548278',8,0),(56,8,8,6,5,'863525039548260',8,0),(57,8,8,6,4,'863525039170271',8,1),(58,8,8,6,5,'863525039170263',8,0),(59,8,8,6,4,'864209030589115',8,0),(60,8,8,6,5,'864209030589107',8,0),(61,8,8,6,4,'863525039552858',8,0),(62,8,8,6,5,'863525039552841',8,0),(63,8,8,6,4,'863525039536851',8,0),(64,8,8,6,5,'863525039536844',8,0),(65,8,8,6,4,'864209030592952',8,0),(66,8,8,6,5,'864209030592945',8,0),(67,8,8,6,4,'864209030597993',8,0),(68,8,8,6,5,'864209030597985',8,0),(69,8,8,6,4,'863525039546033',8,0),(70,8,8,6,5,'863525039546025',8,0),(71,9,10,6,4,'864880030395255',8,1),(72,9,10,6,5,'-',8,0),(73,10,10,6,4,'86488003049025',8,0),(74,10,10,6,5,'-',8,0),(75,10,10,6,4,'864880030490197',8,0),(76,10,10,6,5,'-',8,0),(77,10,10,6,4,'864880030477590',8,0),(78,10,10,6,5,'-',8,0),(79,10,10,6,4,'864880030488951',8,0),(80,10,10,6,5,'-',8,0),(81,10,10,6,4,'864880030473656',8,0),(82,10,10,6,5,'-',8,0),(83,10,10,6,4,'864880030489215',8,0),(84,10,10,6,5,'-',8,0),(85,10,10,6,4,'864880030484851',8,0),(86,10,10,6,5,'-',8,0),(87,10,10,6,4,'864880030484554',8,0),(88,10,10,6,5,'-',8,0),(89,10,10,6,4,'864880030478630',8,0),(90,10,10,6,5,'-',8,0),(91,10,10,6,4,'864880030490197',8,0),(92,10,10,6,5,'-',8,0),(93,10,10,6,4,'864880030481717',8,0),(94,10,10,6,5,'-',8,0),(95,10,10,6,4,'864880030478515',8,0),(96,10,10,6,5,'-',8,0),(97,11,15,6,4,'354309081614718',9,1),(98,11,15,6,5,'-',9,0),(99,12,5,6,4,'864218037349332',8,0),(100,12,5,6,5,'864218037349324',8,0),(101,13,19,6,4,'354462084046956',9,0),(102,13,19,6,5,'354462084046954',9,0),(103,14,20,6,4,'354462084046956',9,0),(104,14,20,6,5,'354462084046954',9,0),(111,16,5,6,4,'864218038933936',8,0),(112,16,5,6,5,'-',8,0),(113,16,5,6,4,'864217032574753',8,0),(114,16,5,6,5,'-',8,0),(115,17,5,6,4,'-',8,0),(116,17,5,6,5,'-',8,0),(117,17,5,6,4,'-',8,0),(118,17,5,6,5,'-',8,0),(119,17,5,6,4,'-',8,0),(120,17,5,6,5,'-',8,0),(121,17,5,6,4,'-',8,0),(122,17,5,6,5,'-',8,0),(123,17,5,6,4,'-',8,0),(124,17,5,6,5,'-',8,0),(125,17,5,6,4,'-',8,0),(126,17,5,6,5,'-',8,0),(127,17,5,6,4,'-',8,0),(128,17,5,6,5,'-',8,0),(129,17,5,6,4,'-',8,0),(130,17,5,6,5,'-',8,0),(131,17,5,6,4,'-',8,0),(132,17,5,6,5,'-',8,0),(133,17,5,6,4,'-',8,0),(134,17,5,6,5,'-',8,0),(141,19,4,6,4,'12000006546',10,1),(142,19,4,6,5,'6546465',10,0),(143,21,4,6,4,'r33984',8,1),(144,21,4,6,5,'98c4er9c4',8,0);

/*Table structure for table `item_keterangan_details_tmp` */

DROP TABLE IF EXISTS `item_keterangan_details_tmp`;

CREATE TABLE `item_keterangan_details_tmp` (
  `item_keterangan_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `kategori_keterangan_id` int(11) NOT NULL,
  `keterangan_details` varchar(200) NOT NULL,
  `supplier` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`item_keterangan_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;

/*Data for the table `item_keterangan_details_tmp` */

insert  into `item_keterangan_details_tmp`(`item_keterangan_details_id`,`purchase_id`,`item_id`,`kategori_id`,`kategori_keterangan_id`,`keterangan_details`,`supplier`,`status`) values (95,7,8,6,4,'863255039548278',0,0),(96,7,8,6,5,'863525039548260',0,0),(97,7,8,6,4,'863525039170271',0,0),(98,7,8,6,5,'863525039170263',0,0),(99,7,8,6,4,'864209030589115',0,0),(100,7,8,6,5,'',0,0),(101,7,8,6,4,'',0,0),(102,7,8,6,5,'',0,0),(103,7,8,6,4,'',0,0),(104,7,8,6,5,'',0,0),(105,7,8,6,4,'',0,0),(106,7,8,6,5,'',0,0),(107,7,8,6,4,'',0,0),(108,7,8,6,5,'',0,0),(109,7,8,6,4,'',0,0),(110,7,8,6,5,'',0,0);

/*Table structure for table `item_stocks` */

DROP TABLE IF EXISTS `item_stocks`;

CREATE TABLE `item_stocks` (
  `item_stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_type_id` int(11) NOT NULL,
  `item_stock_qty` float NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`item_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `item_stocks` */

insert  into `item_stocks`(`item_stock_id`,`item_id`,`item_type_id`,`item_stock_qty`,`branch_id`) values (1,1,0,1,3),(2,3,0,2,3),(3,4,0,2,3),(4,5,0,20,3),(5,6,0,7,3),(6,7,0,3,3),(7,8,0,7,3),(8,10,0,13,3),(9,15,0,4,3),(10,19,0,1,3),(11,20,0,1,3);

/*Table structure for table `item_tmp` */

DROP TABLE IF EXISTS `item_tmp`;

CREATE TABLE `item_tmp` (
  `id_item_tmp` int(11) NOT NULL AUTO_INCREMENT,
  `item_types` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `harga` bigint(11) NOT NULL,
  `item_stock_qty` float NOT NULL,
  `harga_total` bigint(11) NOT NULL,
  `unit_id` bigint(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `purchases_id` int(11) NOT NULL,
  PRIMARY KEY (`id_item_tmp`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `item_tmp` */

insert  into `item_tmp`(`id_item_tmp`,`item_types`,`item_id`,`harga`,`item_stock_qty`,`harga_total`,`unit_id`,`supplier_id`,`branch_id`,`purchases_id`) values (13,0,8,3900000,8,31200000,0,0,3,7);

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `sub_kategori_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `item_limit` int(11) NOT NULL,
  `stock_img` text NOT NULL,
  `kode_barang` varchar(11) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `items` */

insert  into `items`(`item_id`,`item_type`,`kategori_id`,`sub_kategori_id`,`item_name`,`unit_id`,`item_limit`,`stock_img`,`kode_barang`) values (4,0,6,17,'OPPO NEO 7',0,0,'1490861875_OPPO NEO 7.jpg','NEO 7'),(5,0,6,17,'OPPO A37',0,0,'1490862027_OPPO A37.jpg','A37'),(6,0,6,17,'OPPO A39',0,0,'1490862231_OPPO A39.jpeg','A39'),(7,0,6,17,'OPPO F1S',0,0,'1490862377_OPPO F1S.jpg','F1S'),(8,0,6,17,'OPPO F1S NEW',0,0,'1490862451_OPPO F1S NEW.jpg','F1S NEW'),(10,0,6,17,'OPPO F3 PLUS',0,0,'1490862581_OPPO F3 PLUS.jpg','F3 PLUS'),(13,0,6,17,'SAMSUNG GALAXY J1 MINI',0,0,'1490862882_J1 MINI.jpg','J1 MINI'),(12,0,6,17,'SAMSUNG GALAXY Z2',0,0,'1490862720_GALAXY Z2.jpg','Z2'),(14,0,6,17,'SAMSUNG GALAXY J1 ACE',0,0,'1490862980_J1 ACE.jpg','J1 ACE'),(15,0,6,17,'SAMSUNG GALAXY J1 2016',0,0,'1490863140_J1 2016.jpg','J1 2016'),(16,0,6,17,'SAMSUNG GALAXY J2 PRIME',0,0,'1490863329_J2 PRIME.jpg','J2 PRIME'),(17,0,6,17,'SAMSUNG GALAXY J3 2016',0,0,'1490863438_J3 2016.jpg','J2 2016'),(18,0,6,17,'SAMSUNG GALAXY J5 PRIME',0,0,'1490863578_J5 PRIME.jpg','J5 PRIME'),(20,0,6,17,'SAMSUNG GALAXY J7 PRIME',0,0,'1490863684_J7 PRIME.jpg','J7 PRIME'),(21,0,6,17,'SAMSUNG GALAXY A5 2017',0,0,'1490863820_A5 2017.jpg','A5 2017'),(22,0,6,17,'XIAOMI REDMI 4A 2/16',0,0,'1490864102_REDMI 4A.jpg','REDMI 4A'),(23,0,6,17,'XIAOMI REDMI 3X 2/32',0,0,'1490864250_xiaomi-redmi-3x-1.jpg','REDMI 3X'),(24,0,6,17,'XIAOMI REDMI 4 2/16',0,0,'1490864405_REDMI 4.jpg','REDMI 4'),(25,0,6,17,'XIAOMI REDMI 4 PRIME 3/32',0,0,'1490864481_REDMI 4.jpg','REDMI 4 PRI'),(26,0,6,17,'XIAOMI REDDMI NOTE 4 2/16',0,0,'1490864587_REDMI NOTE 4.jpg','REDMI NOTE '),(27,0,6,17,'XIAOMI REDMI NOTE 4 PRIME 3/64',0,0,'1490864663_REDMI NOTE 4.jpg','REDMI NOTE '),(28,0,6,17,'XIAOMI REDMI NOTE 4X 3/32',0,0,'1490864788_REDMI 4X.jpg','REDMI 4X'),(29,0,6,17,'XIAOMI REDMI  PRO 3/64',0,0,'1490864915_REDDMI PRO.jpg','REDMI PRO'),(30,0,6,17,'XIAOMI MI MAX 4/128',0,0,'1490865033_MI MAX PRIME.jpg','MI MAX PRIM');

/*Table structure for table `items_types` */

DROP TABLE IF EXISTS `items_types`;

CREATE TABLE `items_types` (
  `item_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`item_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `items_types` */

/*Table structure for table `jenis_pembeli` */

DROP TABLE IF EXISTS `jenis_pembeli`;

CREATE TABLE `jenis_pembeli` (
  `jenis_pembeli_id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_pembeli_name` varchar(200) NOT NULL,
  `jumlah_terlambat_bayar` int(20) NOT NULL,
  `jenis_pembeli_color` text NOT NULL,
  PRIMARY KEY (`jenis_pembeli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `jenis_pembeli` */

insert  into `jenis_pembeli`(`jenis_pembeli_id`,`jenis_pembeli_name`,`jumlah_terlambat_bayar`,`jenis_pembeli_color`) values (1,'Sering Terlambat',3,'#ff0000'),(2,'Rajin ',0,'');

/*Table structure for table `journal_types` */

DROP TABLE IF EXISTS `journal_types`;

CREATE TABLE `journal_types` (
  `journal_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_type_name` varchar(200) NOT NULL,
  PRIMARY KEY (`journal_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `journal_types` */

insert  into `journal_types`(`journal_type_id`,`journal_type_name`) values (1,'PEMASUKAN'),(2,'PENGELUARAN'),(3,'PENGELUARAN LAINNYA'),(4,'PEMASUKKAN LAINNYA'),(5,'PENGANGSURAN HUTANG'),(6,'PENGANGSURAN PIUTANG');

/*Table structure for table `journals` */

DROP TABLE IF EXISTS `journals`;

CREATE TABLE `journals` (
  `journal_id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_type_id` int(11) NOT NULL,
  `data_id` varchar(200) NOT NULL,
  `data_url` text NOT NULL,
  `journal_debit` int(11) NOT NULL,
  `journal_credit` int(11) NOT NULL,
  `journal_piutang` int(11) NOT NULL,
  `journal_hutang` int(11) NOT NULL,
  `journal_desc` text NOT NULL,
  `journal_date` date NOT NULL,
  `payment_method` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `bank_account` int(11) NOT NULL,
  `bank_id_to` int(11) NOT NULL,
  `bank_account_to` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

/*Data for the table `journals` */

insert  into `journals`(`journal_id`,`journal_type_id`,`data_id`,`data_url`,`journal_debit`,`journal_credit`,`journal_piutang`,`journal_hutang`,`journal_desc`,`journal_date`,`payment_method`,`bank_id`,`bank_account`,`bank_id_to`,`bank_account_to`,`user_id`,`branch_id`) values (1,2,'1490854765','purchases.php?page=save_payment(lunas)',0,2000000,0,0,'','2017-03-30',1,0,0,0,0,4,3),(2,1,'1490854825','transaction_new.php?page=save(lunas)',1800000,0,0,0,'','2017-03-30',1,0,0,0,0,4,3),(3,2,'1490855241','purchases.php?page=save_payment(lunas)',0,6000000,0,0,'','2017-03-30',1,0,0,0,0,4,3),(4,1,'1490855406','transaction_new.php?page=save(hutang)',400000,0,1600000,0,'','2017-03-30',5,0,0,0,0,4,3),(5,2,'1490865575','purchases.php?page=save_payment(lunas)',0,7750000,0,0,'','2017-03-30',1,0,0,0,0,3,3),(6,2,'1490866003','purchases.php?page=save_payment(lunas)',0,10440000,0,0,'','2017-03-30',1,0,0,0,0,3,3),(7,2,'1490867834','purchases.php?page=save_payment(lunas)',0,16240000,0,0,'','2017-03-30',1,0,0,0,0,3,3),(8,2,'1490868467','purchases.php?page=save_payment(lunas)',0,12320000,0,0,'','2017-03-30',1,0,0,0,0,3,3),(9,2,'1490871012','purchases.php?page=save_payment(lunas)',0,27200000,0,0,'','2017-03-30',1,0,0,0,0,4,3),(10,1,'1490871645','transaction_new.php?page=save(hutang)',400000,0,1600000,0,'','2017-03-30',5,0,0,0,0,4,3),(11,1,'1491036041','transaction_new.php?page=save(hutang)',780000,0,3120000,0,'','2017-04-01',5,0,0,0,0,3,3),(12,2,'1491126641','purchases.php?page=save_payment(lunas)',0,5750000,0,0,'','2017-04-02',1,0,0,0,0,4,3),(13,2,'1491126908','purchases.php?page=save_payment(lunas)',0,69000000,0,0,'','2017-04-02',1,0,0,0,0,4,3),(14,2,'1491127131','purchases.php?page=save_payment(lunas)',0,1400000,0,0,'','2017-04-02',1,0,0,0,0,4,3),(15,1,'1491127245','transaction_new.php?page=save(lunas)',1550000,0,0,0,'','2017-04-02',1,0,0,0,0,4,3),(16,2,'1491474236','purchases.php?page=save_payment(lunas)',0,1740000,0,0,'','2017-04-06',1,0,0,0,0,3,3),(17,1,'1491474681','transaction_new.php?page=save(hutang)',400000,0,1600000,0,'','2017-04-06',5,0,0,0,0,3,3),(18,2,'1491563133','purchases.php?page=save_payment(lunas)',0,3300000,0,0,'','2017-04-07',1,0,0,0,0,3,3),(19,2,'1491563907','purchases.php?page=save_payment(lunas)',0,3300000,0,0,'','2017-04-07',1,0,0,0,0,3,3),(20,1,'1491564121','transaction_new.php?page=save(hutang)',700000,0,2750000,0,'','2017-04-07',5,0,0,0,0,3,3),(21,1,'1491622160','transaction_new.php?page=save(lunas)',3900000,0,0,0,'','2017-04-08',1,0,0,0,0,5,3),(22,1,'1491795842','transaction_new.php?page=save(lunas)',1800000,0,0,0,'','2017-04-10',1,0,0,0,0,3,3),(24,2,'1492656457','purchases.php?page=save_payment(lunas)',0,3480000,0,0,'','2017-04-20',1,0,0,0,0,4,3),(25,6,'AK_1492656681','angsuran.php?page=simpan_angsuran_tmp',437000,0,0,0,'','2017-04-20',1,0,0,0,0,4,3),(27,1,'1492658118','transaction_new.php?page=save(hutang)',400000,0,1600000,0,'','2017-04-20',5,0,0,0,0,4,3),(28,4,'28','jurnal_umum.php?page=form&id=',0,0,437000,0,'ANGUSRAN 1 NIA BUDIARTI','2017-04-20',0,0,0,0,0,4,3),(29,1,'1492749633','transaction_new.php?page=save(hutang)',400000,0,1600000,0,'','2017-04-21',5,0,0,0,0,4,3),(30,1,'1492749828','transaction_new.php?page=save(hutang)',400000,0,1600000,0,'','2017-04-21',5,0,0,0,0,4,3),(31,1,'1492749993','transaction_new.php?page=save(lunas)',6500000,0,0,0,'','2017-04-21',1,0,0,0,0,4,3),(32,6,'AK_1492750093','angsuran.php?page=simpan_angsuran_tmp',437000,0,0,0,'','2017-04-21',1,0,0,0,0,4,3),(33,2,'1492750291','purchases.php?page=save_payment(lunas)',0,15500000,0,0,'','2017-04-21',1,0,0,0,0,4,3),(34,1,'1492750586','transaction_new.php?page=save(lunas)',1550000,0,0,0,'','2017-04-21',3,1,123456,1,46624246,4,3),(35,1,'1492754639','transaction_new.php?page=save(hutang)',1000000,0,1000000,0,'','2017-04-21',5,0,0,0,0,4,3),(36,1,'1492755681','transaction_new.php?page=save(hutang)',15000,0,3885000,0,'','2017-04-21',5,0,0,0,0,4,3),(37,1,'1492755890','transaction_new.php?page=save(hutang)',1000000,0,5500000,0,'','2017-04-21',5,0,0,0,0,4,3),(38,1,'1492756296','transaction_new.php?page=save(hutang)',230000,0,1570000,0,'','2017-04-21',5,0,0,0,0,4,3),(54,6,'AK_1492860420','angsuran.php?page=simpan_angsuran_tmp',437000,0,0,0,'','2017-04-22',1,0,0,0,0,1,3),(57,1,'1492862834','transaction_new.php?page=save(lunas)',1800000,0,0,0,'','2017-04-22',1,0,0,0,0,1,3),(62,1,'1493100637','transaction_new.php?page=save(hutang)',23000,0,3477000,0,'','2017-04-25',5,0,0,0,0,1,3),(63,1,'1493107755','transaction_new.php?page=save(hutang)',230000,0,1570000,0,'','2017-04-25',5,0,0,0,0,1,3),(64,1,'1493110007','transaction_new.php?page=save(hutang)',23000,0,1977000,0,'','2017-04-25',5,0,0,0,0,1,3),(65,1,'1493136018','transaction_new.php?page=save(lunas)',1800000,0,0,0,'','2017-04-25',1,0,0,0,0,1,3),(66,1,'1493172229','transaction_new.php?page=save(hutang)',450000,0,1550000,0,'','2017-04-26',5,0,0,0,0,1,3);

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_name` varchar(255) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `kategori` */

insert  into `kategori`(`kategori_id`,`kategori_name`) values (6,'Handphone'),(7,'Sepeda Motor'),(8,'Mobil'),(9,'Lemari');

/*Table structure for table `kategori_keterangan` */

DROP TABLE IF EXISTS `kategori_keterangan`;

CREATE TABLE `kategori_keterangan` (
  `kategori_keterangan_id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_id` int(11) NOT NULL,
  `kategori_keterangan_name` varchar(200) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`kategori_keterangan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `kategori_keterangan` */

insert  into `kategori_keterangan`(`kategori_keterangan_id`,`kategori_id`,`kategori_keterangan_name`,`keterangan`) values (4,6,'IMEI',''),(5,6,'S/N','');

/*Table structure for table `kategori_utama` */

DROP TABLE IF EXISTS `kategori_utama`;

CREATE TABLE `kategori_utama` (
  `id_kategori_utama` int(11) NOT NULL,
  `kategori_utama_name` varbinary(30) NOT NULL,
  PRIMARY KEY (`id_kategori_utama`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kategori_utama` */

/*Table structure for table `kredit` */

DROP TABLE IF EXISTS `kredit`;

CREATE TABLE `kredit` (
  `kredit_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `kredit_code` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `jenis_item` int(11) NOT NULL,
  `administrasi` bigint(20) NOT NULL,
  `harga_item` bigint(20) NOT NULL,
  `uang_muka_barang` bigint(20) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `bank_id_angsuran` int(11) NOT NULL,
  `bank_account_angsuran` varchar(200) NOT NULL,
  `bank_id_to_angsuran` int(11) NOT NULL,
  `bank_account_to_angsuran` varchar(200) NOT NULL,
  `nilai_pembiayaan` bigint(20) NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `periode` int(11) NOT NULL,
  `angsuran_per_bulan` bigint(20) NOT NULL,
  `pembayaran_per_tanggal_1` varchar(200) NOT NULL,
  `pembayaran_per_tanggal_2` varchar(200) NOT NULL,
  `kredit_date` datetime NOT NULL,
  `kredit_total` bigint(11) NOT NULL,
  `lunas` int(11) NOT NULL,
  PRIMARY KEY (`kredit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `kredit` */

insert  into `kredit`(`kredit_id`,`transaction_id`,`kredit_code`,`user_id`,`member_id`,`item_id`,`jenis_item`,`administrasi`,`harga_item`,`uang_muka_barang`,`payment_method_id`,`bank_id_angsuran`,`bank_account_angsuran`,`bank_id_to_angsuran`,`bank_account_to_angsuran`,`nilai_pembiayaan`,`lama_angsuran`,`periode`,`angsuran_per_bulan`,`pembayaran_per_tanggal_1`,`pembayaran_per_tanggal_2`,`kredit_date`,`kredit_total`,`lunas`) values (1,2,'K_149085540',4,27,3,6,10000,2000000,400000,1,0,'',0,'',1600000,12,3,198000,'01 ',' 07','2017-03-30 08:28:45',0,1),(2,3,'K_149087164',4,36,5,6,10000,2000000,400000,1,0,'',0,'',1600000,12,3,198000,'01 ',' 07','2017-03-30 13:00:05',0,1),(16,30,'K_149310065',1,1,7,6,20000,3500000,23000,1,0,'',0,'',3477000,5,3,835000,'01 ',' 07','2017-04-25 08:10:37',0,1),(17,31,'K_149310780',1,3,4,6,12000,1800000,230000,1,0,'',0,'',1570000,4,3,456000,'01 ',' 07','2017-04-25 10:09:15',0,1),(18,32,'K_149311002',1,5,5,6,12000,2000000,23000,1,0,'',0,'',1977000,5,2,475000,'','','2017-04-25 10:46:47',0,1),(19,2,'K_149317225',1,4,5,6,230000,2000000,450000,1,0,'',0,'',1550000,4,3,450000,'01 ',' 08','2017-04-26 04:03:49',0,1);

/*Table structure for table `kredit_stock_tmp` */

DROP TABLE IF EXISTS `kredit_stock_tmp`;

CREATE TABLE `kredit_stock_tmp` (
  `kredit_stock_tmp_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_name` varchar(255) NOT NULL,
  `stock_tipe` int(11) NOT NULL,
  `stock_berat` int(11) NOT NULL,
  `stock_panjang` int(11) NOT NULL,
  `stock_lebar` int(11) NOT NULL,
  `stock_tinggi` int(11) NOT NULL,
  PRIMARY KEY (`kredit_stock_tmp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kredit_stock_tmp` */

/*Table structure for table `lama_angsuran` */

DROP TABLE IF EXISTS `lama_angsuran`;

CREATE TABLE `lama_angsuran` (
  `lama_angsuran_id` int(11) NOT NULL AUTO_INCREMENT,
  `lama_angsuran_name` varchar(200) NOT NULL,
  `periode` int(11) NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  PRIMARY KEY (`lama_angsuran_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lama_angsuran` */

/*Table structure for table `list_angsuran` */

DROP TABLE IF EXISTS `list_angsuran`;

CREATE TABLE `list_angsuran` (
  `transactioin_id` int(11) NOT NULL,
  `angsuran` int(11) NOT NULL,
  `harga_real` int(11) NOT NULL,
  `uang_muka` int(11) NOT NULL,
  `hasil_angsuran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `list_angsuran` */

/*Table structure for table `member_items` */

DROP TABLE IF EXISTS `member_items`;

CREATE TABLE `member_items` (
  `member_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`member_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `member_items` */

/*Table structure for table `members` */

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(100) NOT NULL,
  `member_phone` varchar(100) NOT NULL,
  `member_email` varchar(200) NOT NULL,
  `member_alamat` varchar(200) NOT NULL,
  `member_discount` int(11) NOT NULL,
  `member_nik` varchar(200) NOT NULL,
  `kelurahan` varchar(200) NOT NULL,
  `kecamatan` varchar(200) NOT NULL,
  `RT` varchar(200) NOT NULL,
  `RW` varchar(200) NOT NULL,
  `kode_pos` varchar(200) NOT NULL,
  `kota` varchar(200) NOT NULL,
  `nama_ibu` varchar(200) NOT NULL,
  `tempat_lahir` varchar(200) NOT NULL,
  `tanggal_lahir` varchar(200) NOT NULL,
  `status_perkawinan` int(11) NOT NULL,
  `jumlah_tanggungan` int(11) NOT NULL,
  `telp_rumah` varchar(200) NOT NULL,
  `status_rumah` int(11) NOT NULL,
  `lama_tinggal` int(11) NOT NULL,
  `pendidikan` int(200) NOT NULL,
  `tipe_pembeli` int(11) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `members` */

insert  into `members`(`member_id`,`member_name`,`member_phone`,`member_email`,`member_alamat`,`member_discount`,`member_nik`,`kelurahan`,`kecamatan`,`RT`,`RW`,`kode_pos`,`kota`,`nama_ibu`,`tempat_lahir`,`tanggal_lahir`,`status_perkawinan`,`jumlah_tanggungan`,`telp_rumah`,`status_rumah`,`lama_tinggal`,`pendidikan`,`tipe_pembeli`) values (1,'NIA BUDIARTI','082257473043','Arisfiater50@gmail.com','KEDUNGPRING',0,'3525026911920003','DAPET','BALONGPANGGANG','01','01','61173','BALONGPANGGANG','MAUDUAH','GRESIK','1992-11-28',1,1,'-',1,25,3,0),(3,'MARINI','0813 3226 2953','-','KUDOH',0,'3524177103640001','MADULEGI','SUKODADI','02','02','-','LAMONGAN','-','LAMONGAN','1984-03-31',1,1,'-',1,20,5,0),(4,'ANIFAH','082332998079','-','MUNGGUSOYI',0,'3525044512870003','MUNGGUGEBANG','BENJENG','06','02','61172','GRESIK','SUPAMI','GRESIK','1987-12-05',1,1,'-',1,15,1,0),(5,'EVI HARDIYANTI','085790970393','-','NGABETAN',0,'3525114609910001','NGABETAN','CERME','02','02','611171','GRESIK','-','GRESIK','1991-09-06',2,2,'-',2,25,3,0),(7,'SUKIR','082372751558','-','KALIPANG',0,'3525020705700022','WAHAS','BALONGPANGGANG','01','01','61173','GRESIK','PAINI','MALANG','1970-05-07',1,4,'-',1,25,0,0),(8,'SUKIR','082372751558','-','KALIPANG',0,'3525020705700022','WAHAS','BALONGPANGGANG','01','01','61173','GRESIK','PAINI','MALANG','1970-05-07',1,4,'-',1,25,0,0),(9,'TAJIB','082139284442','-','PILANGREJO',0,'3525022002590001','KEDUNGPRING','BALONGPANGGANG','02','01','61173','GRESIK','TEMU','JOMBANG','1959-02-20',1,2,'',1,40,2,0),(10,'HALIMAH ','082230827307','-','DSN. BANJARAGUNG ',0,'3525045410950002','BANJARAGUNG','BALONGPANGGANG','03','01','61173','GRESIK','SUWARNI','GRESIK','--14 NOVEMBER 1995',1,1,'-',1,10,2,0),(11,'dsddqwdqwdqwd','dqw','qdqw','dqd',0,'ede','dqd','dq','dq','dqd','qdd','dd','qd','qdq','2017-07-03',1,0,'qd',2,0,1,0);

/*Table structure for table `members_darurat` */

DROP TABLE IF EXISTS `members_darurat`;

CREATE TABLE `members_darurat` (
  `id_darurat` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `nama_darurat` varchar(200) NOT NULL,
  `hubungan` int(11) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `no_telp` varchar(200) NOT NULL,
  PRIMARY KEY (`id_darurat`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `members_darurat` */

insert  into `members_darurat`(`id_darurat`,`member_id`,`nama_darurat`,`hubungan`,`alamat`,`no_telp`) values (2,3,'IWAN',5,'KARANGAN KIDUL','08155555465'),(6,1,'ARIS FIATER EKO WAHYUDI',5,'DSN, DAPET, RT 01, RW 01, DS. DAPET, KEC. BALONGPANGGANG, KAB. GRESIK','081332178709'),(8,5,'ANTON',5,'DS. KEDUNGSARI, KEC. KEMBANGBAU, L;AMONGAN','085607070912'),(10,7,'SUWARNI',5,'KALIPANG','-'),(11,8,'SUWARNI',5,'KALIPANG','-'),(12,4,'TARAM',5,'MUNGGUSOYI - BENJENG','-'),(13,9,'ENI KUSMIATUN',5,'PILANGREJO','-'),(14,10,'DWI APRI HAMSAH ',5,'BANJARAGUNG','085746226801'),(15,11,'dqwd',2,'qdwd','dqwd');

/*Table structure for table `members_pekerjaan` */

DROP TABLE IF EXISTS `members_pekerjaan`;

CREATE TABLE `members_pekerjaan` (
  `pekerjaan_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `nama_perusahaan` varchar(200) NOT NULL,
  `alamat_perusahaan` varchar(200) NOT NULL,
  `RT` varchar(200) NOT NULL,
  `RW` varchar(200) NOT NULL,
  `kode_pos` varchar(200) NOT NULL,
  `kelurahan` varchar(200) NOT NULL,
  `kecamatan` varchar(200) NOT NULL,
  `kota` varchar(200) NOT NULL,
  `telp_kantor` varchar(200) NOT NULL,
  `jenis_pekerjaan` varchar(200) NOT NULL,
  `jabatan` varchar(200) NOT NULL,
  `lama_bekerja_tahun` varchar(200) NOT NULL,
  `lama_bekerja_bulan` varchar(200) NOT NULL,
  `penghasilan` int(200) NOT NULL,
  `pengeluaran` int(200) NOT NULL,
  `penghasilan_lain` int(200) NOT NULL,
  `sumber_penghasilan` int(200) NOT NULL,
  PRIMARY KEY (`pekerjaan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `members_pekerjaan` */

insert  into `members_pekerjaan`(`pekerjaan_id`,`member_id`,`nama_perusahaan`,`alamat_perusahaan`,`RT`,`RW`,`kode_pos`,`kelurahan`,`kecamatan`,`kota`,`telp_kantor`,`jenis_pekerjaan`,`jabatan`,`lama_bekerja_tahun`,`lama_bekerja_bulan`,`penghasilan`,`pengeluaran`,`penghasilan_lain`,`sumber_penghasilan`) values (2,3,'PERAWAT','-','-','-','-','-','-','-','-','0','PERAWAAAT','-','-',3000000,2500000,0,1),(6,1,'1 IBU RUMAH TANGGA','DAPET','01','01','61173','DAPET','BALONGPANGGANG','BALONGPANGGANG','-','2IBU RUMAH TANGGA','3 IBU RUMAH TANGGA','7','-',0,0,0,1),(8,5,'PT. BSA','BRINGKANG','-','-','-','-','-','-','-','SWASTA (PT BSA)','KARYAWAN','1','0',3000000,2000000,0,3),(10,7,'PETANI','-','-','-','-','-','-','-','-','PETANI','-','-','-',2000000,1700000,0,1),(11,8,'PETANI','-','-','-','-','-','-','-','-','PETANI','-','-','-',2000000,1700000,0,1),(12,4,'IBU RUMAH TANGGA','MUNGGUSOYI','06','02','61172','MUNGGUGEBANG','BENJENG','BENJENG','082332998079','IBU RUMAH TANGGA','IBU RUMAH TANGGA','-','-',0,0,0,1),(13,9,'KASI TRANTIP PILANGREJO','PILANGREJO','2','1','611173','KEDUNGPRING','BALONGPANGGANG','GRESIK','-','KASI TRANTIP PILANGREJO','KASI TRANTIP PILANGREJO','25','-',3000000,2000000,3000000,3),(14,10,'-','-','-','-','-','-','-','-','-','-','WIRSWASTA','-','-',3000000,2000000,0,1),(15,11,'dqwd','dqd','qdq','qdq','qdd','qd','dqd','dqwd','qwdqwd','dqd','qwdq','qdqd','qdw',0,0,0,3);

/*Table structure for table `mutasi_barang` */

DROP TABLE IF EXISTS `mutasi_barang`;

CREATE TABLE `mutasi_barang` (
  `mutasi_id` int(11) NOT NULL AUTO_INCREMENT,
  `gadai_id` int(11) NOT NULL,
  `mutasi_code` varchar(11) NOT NULL,
  `mutasi_date` datetime NOT NULL,
  `cabang_asal` int(11) NOT NULL,
  `cabang_tujuan` int(11) NOT NULL,
  PRIMARY KEY (`mutasi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mutasi_barang` */

/*Table structure for table `office` */

DROP TABLE IF EXISTS `office`;

CREATE TABLE `office` (
  `office_id` int(11) NOT NULL,
  `office_name` varchar(200) NOT NULL,
  `office_img` text NOT NULL,
  `office_desc` text NOT NULL,
  `office_address` text NOT NULL,
  `office_phone` varchar(100) NOT NULL,
  `office_email` varchar(300) NOT NULL,
  `office_city` varchar(100) NOT NULL,
  `office_owner` varchar(100) NOT NULL,
  `office_owner_phone` varchar(100) NOT NULL,
  `office_owner_address` varchar(100) NOT NULL,
  `office_owner_email` varchar(100) NOT NULL,
  PRIMARY KEY (`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `office` */

insert  into `office`(`office_id`,`office_name`,`office_img`,`office_desc`,`office_address`,`office_phone`,`office_email`,`office_city`,`office_owner`,`office_owner_phone`,`office_owner_address`,`office_owner_email`) values (1,'Two in One','1490849413_1.jpg','','																		JL. SUROJENGGOLO NO.66 - WATES KEC. BALONGPANGGANG 																																																																													','(031)-792-60972','2in1.adm@gmail.com','SURABAYA','Danu Ariska','08155555465','Jl. Surojenggolo No. 66-Wates, Kec. Balongpanggang, Kab. Gresik','danuariksa31@gmail.com');

/*Table structure for table `partners` */

DROP TABLE IF EXISTS `partners`;

CREATE TABLE `partners` (
  `partner_id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(200) NOT NULL,
  `partner_alamat` text NOT NULL,
  `partner_phone` varchar(200) NOT NULL,
  `partner_email` varchar(200) NOT NULL,
  `partner_deskripsi` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `partners` */

/*Table structure for table `payment_methods` */

DROP TABLE IF EXISTS `payment_methods`;

CREATE TABLE `payment_methods` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_name` varchar(100) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `payment_methods` */

insert  into `payment_methods`(`payment_method_id`,`payment_method_name`) values (1,'CASH'),(2,'DEBIT'),(3,'TRANSFER'),(4,'KREDIT'),(5,'ANGSURAN');

/*Table structure for table `pengangsuran_hut` */

DROP TABLE IF EXISTS `pengangsuran_hut`;

CREATE TABLE `pengangsuran_hut` (
  `id_pengangsuran` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `id_hutang` int(11) NOT NULL,
  `jml_bayar` bigint(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `bank1` int(11) NOT NULL,
  `no_bank_id_1` int(11) NOT NULL,
  `bank2` int(11) NOT NULL,
  `no_bank_id_2` int(11) NOT NULL,
  `angsuran_date` datetime NOT NULL,
  PRIMARY KEY (`id_pengangsuran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pengangsuran_hut` */

/*Table structure for table `pengangsuran_piutang` */

DROP TABLE IF EXISTS `pengangsuran_piutang`;

CREATE TABLE `pengangsuran_piutang` (
  `id_pengangsuran` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `jml_bayar` bigint(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `bank1` int(11) NOT NULL,
  `no_bank_id_1` int(11) NOT NULL,
  `bank2` int(11) NOT NULL,
  `no_bank_id_2` int(11) NOT NULL,
  `angsuran_date` datetime NOT NULL,
  PRIMARY KEY (`id_pengangsuran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pengangsuran_piutang` */

/*Table structure for table `penyesuaian_stock_cabang` */

DROP TABLE IF EXISTS `penyesuaian_stock_cabang`;

CREATE TABLE `penyesuaian_stock_cabang` (
  `penyesuaian_stock_cabang_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `date_penyesuaian` datetime NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_qty_awal` bigint(20) NOT NULL,
  `item_qty_new` bigint(20) NOT NULL,
  PRIMARY KEY (`penyesuaian_stock_cabang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `penyesuaian_stock_cabang` */

/*Table structure for table `periode` */

DROP TABLE IF EXISTS `periode`;

CREATE TABLE `periode` (
  `periode_id` int(11) NOT NULL AUTO_INCREMENT,
  `periode_name` varchar(200) NOT NULL,
  PRIMARY KEY (`periode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `periode` */

insert  into `periode`(`periode_id`,`periode_name`) values (1,'Hari'),(2,'Minggu'),(3,'Bulan'),(4,'Tahun');

/*Table structure for table `permits` */

DROP TABLE IF EXISTS `permits`;

CREATE TABLE `permits` (
  `permit_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
  `side_menu_id` int(11) NOT NULL,
  `permit_acces` varchar(10) NOT NULL,
  PRIMARY KEY (`permit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2969 DEFAULT CHARSET=latin1;

/*Data for the table `permits` */

insert  into `permits`(`permit_id`,`user_type_id`,`side_menu_id`,`permit_acces`) values (409,28,1,'0'),(410,28,2,''),(411,28,3,'0'),(412,28,4,'0'),(413,28,5,'0'),(414,28,6,'0'),(415,28,7,'c,d'),(416,28,8,'r,d'),(417,28,9,'r,d'),(418,28,10,'r,d'),(419,28,11,'r,d'),(420,28,12,'r,d'),(421,28,13,'r,d'),(422,28,14,'r,d'),(423,28,15,'r,d'),(424,28,16,'r,d'),(425,28,17,'c,r,d'),(426,28,18,'r'),(427,28,19,'r,d'),(428,28,20,'r,d'),(429,28,21,'r,u'),(430,28,22,'r,d'),(431,28,23,'r,u'),(432,28,24,'c,r'),(505,4,1,'0'),(506,4,2,'c,r,u,d'),(507,4,3,'0'),(508,4,4,'0'),(509,4,5,'0'),(510,4,6,'0'),(511,4,7,''),(512,4,8,''),(513,4,9,''),(514,4,10,''),(515,4,11,''),(516,4,12,''),(517,4,13,''),(518,4,14,''),(519,4,15,'r'),(520,4,16,''),(521,4,17,''),(522,4,18,''),(523,4,19,''),(524,4,20,''),(525,4,21,''),(526,4,22,''),(527,4,23,''),(528,4,24,'c,r,u,d'),(2577,2,1,'c,r,u,d'),(2578,2,2,'c,r,u,d'),(2579,2,3,'c,r,u,d'),(2580,2,4,'c,r,u,d'),(2581,2,5,'c,r,u,d'),(2582,2,6,'c,r,u,d'),(2583,2,7,'c,r,u,d'),(2584,2,8,'c,r,u,d'),(2585,2,9,'c,r,u,d'),(2586,2,11,'c,r,u,d'),(2587,2,12,'c,r,u,d'),(2588,2,13,'c,r,u,d'),(2589,2,14,'c,r,u,d'),(2590,2,15,'c,r,u,d'),(2591,2,16,'c,r,u,d'),(2592,2,17,'c,r,u,d'),(2593,2,18,'c,r,u,d'),(2594,2,20,'c,r,u,d'),(2595,2,21,'c,r,u,d'),(2596,2,22,'c,r,u,d'),(2597,2,23,'c,r,u,d'),(2598,2,24,'c,r,u,d'),(2599,2,25,'c,r,u,d'),(2600,2,26,'c,r,u,d'),(2601,2,27,'c,r,u,d'),(2602,2,28,'c,r,u,d'),(2603,2,29,'c,r,u,d'),(2604,2,30,'c,r,u,d'),(2605,2,31,'c,r,u,d'),(2606,2,32,'c,r,u,d'),(2607,2,33,'c,r,u,d'),(2608,2,34,'c,r,u,d'),(2609,2,35,'c,r,u,d'),(2610,2,36,'c,r,u,d'),(2611,2,37,'c,r,u,d'),(2612,2,38,'c,r,u,d'),(2613,2,39,'c,r,u,d'),(2614,2,40,'c,r,u,d'),(2615,2,41,'c,r,u,d'),(2616,2,42,'c,r,u,d'),(2617,2,43,'c,r,u,d'),(2618,2,44,'c,r,u,d'),(2619,2,45,'c,r,u,d'),(2925,1,1,'0'),(2926,1,2,'c,r,u,d'),(2927,1,3,'c,r,u,d'),(2928,1,4,'0'),(2929,1,5,'0'),(2930,1,6,'0'),(2931,1,7,'0'),(2932,1,8,'0'),(2933,1,9,''),(2934,1,11,'c,r,u,d'),(2935,1,12,'c,r,u,d'),(2936,1,13,'c,r,u,d'),(2937,1,14,'c,r,u,d'),(2938,1,15,''),(2939,1,16,'0'),(2940,1,17,'c,r,u,d'),(2941,1,18,'c,r,u,d'),(2942,1,20,''),(2943,1,21,''),(2944,1,22,'c,r,u,d'),(2945,1,23,'c,r,u,d'),(2946,1,24,'c,r,u,d'),(2947,1,25,'c,r,u,d'),(2948,1,26,'c,r,u,d'),(2949,1,27,'c,r,u,d'),(2950,1,28,'0'),(2951,1,29,'c,r,u,d'),(2952,1,30,'c,r,u,d'),(2953,1,31,'c,r,u,d'),(2954,1,32,'c,r,u,d'),(2955,1,33,'c,r,u,d'),(2956,1,34,'c,r,u,d'),(2957,1,35,'c,r,u,d'),(2958,1,36,'c,r,u,d'),(2959,1,37,'c,r,u,d'),(2960,1,38,'0'),(2961,1,39,'c,r,u,d'),(2962,1,40,'c,r,u,d'),(2963,1,41,'c,r,u,d'),(2964,1,42,''),(2965,1,43,''),(2966,1,44,''),(2967,1,45,''),(2968,1,46,'c,r,u,d');

/*Table structure for table `purchases` */

DROP TABLE IF EXISTS `purchases`;

CREATE TABLE `purchases` (
  `purchases_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `purchases_date` datetime NOT NULL,
  `purchases_code` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `bank_account` int(11) NOT NULL,
  `bank_id_to` int(11) DEFAULT NULL,
  `bank_account_to` int(11) DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `purchase_total` bigint(11) DEFAULT NULL,
  `purchase_payment` bigint(11) DEFAULT NULL,
  `purchase_change` bigint(11) DEFAULT NULL,
  `lunas` int(11) DEFAULT NULL,
  `purchase_desc` text,
  PRIMARY KEY (`purchases_id`,`bank_account`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `purchases` */

insert  into `purchases`(`purchases_id`,`user_id`,`purchases_date`,`purchases_code`,`supplier_id`,`branch_id`,`bank_id`,`bank_account`,`bank_id_to`,`bank_account_to`,`payment_method`,`purchase_total`,`purchase_payment`,`purchase_change`,`lunas`,`purchase_desc`) values (2,4,'2017-03-30 08:19:20',1490854765,7,3,0,0,0,0,1,2000000,2000000,0,0,''),(3,4,'2017-03-30 08:27:17',1490855241,7,3,0,0,0,0,1,6000000,6000000,0,0,''),(4,3,'2017-03-30 11:19:05',1490865574,8,3,0,0,0,0,1,7750000,7750000,0,0,''),(5,3,'2017-03-30 11:26:36',1490866002,8,3,0,0,0,0,1,10440000,10440000,0,0,''),(6,3,'2017-03-30 11:57:02',1490867833,8,3,0,0,0,0,1,16240000,16240000,0,0,''),(7,3,'2017-03-30 12:07:38',1490868466,8,3,0,0,0,0,1,12320000,12320000,0,0,''),(8,4,'2017-03-30 12:50:05',1490871011,8,3,0,0,0,0,1,27200000,27200000,0,0,''),(9,4,'2017-04-02 11:50:37',1491126641,8,3,0,0,0,0,1,5750000,5750000,0,0,''),(10,4,'2017-04-02 11:55:05',1491126907,8,3,0,0,0,0,1,69000000,69000000,0,0,''),(11,4,'2017-04-02 11:58:42',1491127131,9,3,0,0,0,0,1,1400000,1400000,0,0,''),(12,3,'2017-04-06 17:23:51',1491474236,8,3,0,0,0,0,1,1740000,1740000,0,0,''),(13,3,'2017-04-07 18:05:27',1491563133,9,3,0,0,0,0,1,3300000,3300000,0,0,''),(14,3,'2017-04-07 18:18:24',1491563907,9,3,0,0,0,0,1,3300000,3300000,0,0,''),(16,4,'2017-04-20 09:47:35',1492656457,8,3,0,0,0,0,1,3480000,3480000,0,0,''),(17,4,'2017-04-21 11:51:27',1492750290,8,3,0,0,0,0,1,15500000,15500000,0,0,''),(22,4,'2017-04-22 16:44:39',1492854280,8,3,0,0,0,0,1,4800000,4800000,0,0,'');

/*Table structure for table `purchases_details` */

DROP TABLE IF EXISTS `purchases_details`;

CREATE TABLE `purchases_details` (
  `purchase_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `purchase_qty` float DEFAULT NULL,
  `purchase_price` bigint(11) DEFAULT NULL,
  `purchase_total` bigint(11) DEFAULT NULL,
  `retur` float DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`purchase_detail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `purchases_details` */

insert  into `purchases_details`(`purchase_detail_id`,`purchase_id`,`purchase_date`,`item_id`,`purchase_qty`,`purchase_price`,`purchase_total`,`retur`,`unit_id`) values (1,2,'2017-03-30',1,2,1000000,2000000,0,0),(2,3,'2017-03-30',3,3,2000000,6000000,0,0),(3,4,'2017-03-30',4,5,1550000,7750000,0,0),(4,5,'2017-03-30',5,6,1740000,10440000,0,0),(5,6,'2017-03-30',6,7,2320000,16240000,0,0),(6,7,'2017-03-30',7,4,3080000,12320000,0,0),(7,8,'2017-03-30',8,8,3400000,27200000,0,0),(8,9,'2017-04-02',10,1,5750000,5750000,0,0),(9,10,'2017-04-02',10,12,5750000,69000000,0,0),(10,11,'2017-04-02',15,1,1400000,1400000,0,0),(11,12,'2017-04-06',5,1,1740000,1740000,0,0),(12,13,'2017-04-07',19,1,3300000,3300000,0,0),(13,14,'2017-04-07',20,1,3300000,3300000,0,0);

/*Table structure for table `purchases_details_tmp` */

DROP TABLE IF EXISTS `purchases_details_tmp`;

CREATE TABLE `purchases_details_tmp` (
  `purchase_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `item_type` float DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `purchase_qty` bigint(11) DEFAULT NULL,
  `purchase_price` bigint(11) DEFAULT NULL,
  `purchase_total` float DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`purchase_detail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Data for the table `purchases_details_tmp` */

/*Table structure for table `purchases_tmp` */

DROP TABLE IF EXISTS `purchases_tmp`;

CREATE TABLE `purchases_tmp` (
  `purchases_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchases_date` datetime NOT NULL,
  `purchases_code` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`purchases_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `purchases_tmp` */

/*Table structure for table `retur` */

DROP TABLE IF EXISTS `retur`;

CREATE TABLE `retur` (
  `retur_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `retur_date` date NOT NULL,
  `payment_method` int(11) NOT NULL,
  `bank_id_1` int(11) NOT NULL,
  `bank_account_1` int(11) NOT NULL,
  `bank_id_2` int(11) NOT NULL,
  `bank_account_2` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `retur_total_price` bigint(11) NOT NULL,
  `retur_payment` bigint(20) NOT NULL,
  `retur_change` bigint(20) NOT NULL,
  `lunas` int(11) NOT NULL,
  PRIMARY KEY (`retur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `retur` */

/*Table structure for table `retur_detail_item` */

DROP TABLE IF EXISTS `retur_detail_item`;

CREATE TABLE `retur_detail_item` (
  `retur_detail_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `retur_id` int(11) NOT NULL,
  `retur_detai_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `keterangan_item` int(11) NOT NULL,
  PRIMARY KEY (`retur_detail_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `retur_detail_item` */

/*Table structure for table `retur_details` */

DROP TABLE IF EXISTS `retur_details`;

CREATE TABLE `retur_details` (
  `retur_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `retur_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `transaction_detail_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `item_qty` float NOT NULL,
  `item_price` bigint(11) NOT NULL,
  `item_price_total` bigint(20) NOT NULL,
  `retur_desc` text NOT NULL,
  PRIMARY KEY (`retur_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `retur_details` */

/*Table structure for table `retur_details_pembelian_tmp` */

DROP TABLE IF EXISTS `retur_details_pembelian_tmp`;

CREATE TABLE `retur_details_pembelian_tmp` (
  `retur_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `purchase_detail_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_qty` float NOT NULL,
  `unit_id` int(11) NOT NULL,
  `item_price` bigint(11) NOT NULL,
  `item_price_total` bigint(20) NOT NULL,
  `retur_desc` text NOT NULL,
  PRIMARY KEY (`retur_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `retur_details_pembelian_tmp` */

/*Table structure for table `retur_details_tmp` */

DROP TABLE IF EXISTS `retur_details_tmp`;

CREATE TABLE `retur_details_tmp` (
  `retur_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `transaction_detail_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_qty` float NOT NULL,
  `unit_id` int(11) NOT NULL,
  `item_price` bigint(11) NOT NULL,
  `item_price_total` bigint(20) NOT NULL,
  `retur_desc` text NOT NULL,
  PRIMARY KEY (`retur_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `retur_details_tmp` */

/*Table structure for table `retur_pembelian` */

DROP TABLE IF EXISTS `retur_pembelian`;

CREATE TABLE `retur_pembelian` (
  `retur_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `retur_date` date NOT NULL,
  `payment_method` int(11) NOT NULL,
  `bank_id_1` int(11) NOT NULL,
  `bank_account_1` int(11) NOT NULL,
  `bank_id_2` int(11) NOT NULL,
  `bank_account_2` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `retur_total_price` bigint(11) NOT NULL,
  `lunas` int(11) NOT NULL,
  PRIMARY KEY (`retur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `retur_pembelian` */

/*Table structure for table `retur_pembelian_details` */

DROP TABLE IF EXISTS `retur_pembelian_details`;

CREATE TABLE `retur_pembelian_details` (
  `retur_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `retur_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `purchase_detail_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_qty` float NOT NULL,
  `unit_id` int(11) NOT NULL,
  `item_price` bigint(11) NOT NULL,
  `retur_desc` text NOT NULL,
  PRIMARY KEY (`retur_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `retur_pembelian_details` */

/*Table structure for table `retur_pembelian_details_item` */

DROP TABLE IF EXISTS `retur_pembelian_details_item`;

CREATE TABLE `retur_pembelian_details_item` (
  `retur_pembelian_details_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `retur_pembelian_details_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `kategori_keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`retur_pembelian_details_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `retur_pembelian_details_item` */

/*Table structure for table `retur_pembelian_tmp` */

DROP TABLE IF EXISTS `retur_pembelian_tmp`;

CREATE TABLE `retur_pembelian_tmp` (
  `retur_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `retur_date` date NOT NULL,
  `purchase_date` date NOT NULL,
  `retur_total_price` bigint(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lunas` int(11) NOT NULL,
  PRIMARY KEY (`retur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `retur_pembelian_tmp` */

/*Table structure for table `retur_tmp` */

DROP TABLE IF EXISTS `retur_tmp`;

CREATE TABLE `retur_tmp` (
  `retur_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `retur_date` date NOT NULL,
  `transaction_date` date NOT NULL,
  `retur_total_price` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lunas` int(11) NOT NULL,
  PRIMARY KEY (`retur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `retur_tmp` */

/*Table structure for table `retur_widget_details_tmp` */

DROP TABLE IF EXISTS `retur_widget_details_tmp`;

CREATE TABLE `retur_widget_details_tmp` (
  `retur_widget_details_tmp_id` int(11) NOT NULL AUTO_INCREMENT,
  `retur_tmp_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `kategori_keterangan_id` int(11) NOT NULL,
  PRIMARY KEY (`retur_widget_details_tmp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `retur_widget_details_tmp` */

/*Table structure for table `retur_widget_tmp` */

DROP TABLE IF EXISTS `retur_widget_tmp`;

CREATE TABLE `retur_widget_tmp` (
  `retur_tmp_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `transaction_detail_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_qty` int(11) NOT NULL,
  `unit_id_jual` int(11) NOT NULL,
  `unit_id_retur` int(11) NOT NULL,
  `harga_konversi` bigint(20) NOT NULL,
  `harga_total` bigint(20) NOT NULL,
  `retur_desc` text NOT NULL,
  PRIMARY KEY (`retur_tmp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `retur_widget_tmp` */

/*Table structure for table `side_menus` */

DROP TABLE IF EXISTS `side_menus`;

CREATE TABLE `side_menus` (
  `side_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `side_menu_name` varchar(100) NOT NULL,
  `side_menu_url` varchar(100) NOT NULL,
  `side_menu_parent` int(11) NOT NULL,
  `side_menu_icon` varchar(100) NOT NULL,
  `side_menu_level` int(11) NOT NULL,
  `side_menu_type_parent` int(11) NOT NULL,
  PRIMARY KEY (`side_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

/*Data for the table `side_menus` */

insert  into `side_menus`(`side_menu_id`,`side_menu_name`,`side_menu_url`,`side_menu_parent`,`side_menu_icon`,`side_menu_level`,`side_menu_type_parent`) values (1,'Master','#',0,'fa fa-edit',1,0),(2,'Penjualan','transaction_new.php',0,'fa fa-shopping-cart',1,1),(3,'Gadai','gadai.php',0,'fa fa-briefcase',1,1),(4,'Transaksi','#',0,'fa fa-shopping-cart',1,0),(5,'Accounting','#',0,'fa fa-list-alt',1,0),(6,'Laporan','#',0,'fa fa-book',1,0),(7,'Setting','#',0,'fa fa-cog',1,0),(8,'gudang','gudang.php',0,'',0,0),(9,'Cabang','branch.php',1,'',2,1),(11,'Stock','stock.php',1,'',2,1),(12,'Item Stock Cabang','stock_master.php',1,'',2,1),(13,'Stock Retur','stock_retur.php',1,'',2,1),(14,'Stock Gadai','stock_gadai.php',1,'',2,1),(15,'Satuan','satuan.php',1,'',2,1),(16,'Tipe Pembeli','tipe_pembeli.php',0,'',0,0),(17,'Pembeli','member.php',1,'',2,1),(18,'Kategori Item','kategori.php',1,'',2,1),(20,'Supplier','supplier.php',1,'',2,1),(21,'Bank','bank.php',1,'',2,1),(22,'Pembelian','purchase.php',4,'',2,1),(23,'Angsuran Piutang / Kredit','angsuran.php',4,'',2,1),(24,'Angsuran Hutang','angsuranhut.php',4,'',2,1),(25,'Arus Kas','arus_kas.php',5,'',2,1),(26,'Pemasukan Dan Pengeluaran Lainnya','jurnal_umum.php',5,'',2,1),(27,'Laporan Detail','report_detail.php',6,'',2,1),(28,'Laporan Harian','report_harian.php',0,'',0,0),(29,'Laporan Piutang','piutang.php',6,'',2,1),(30,'Laporan hutang','utang.php',6,'',2,1),(31,'Profil','office.php',7,'',2,1),(32,'User','user.php',7,'',2,1),(33,'Type User','user_type.php',7,'',2,1),(34,'Retur penjualan','retur.php',4,'',2,1),(35,'Retur pembelian','retur_pembelian.php',4,'',2,1),(36,'Laporan retur penjualan','returdetail.php',6,'',2,1),(37,'Laporan retur pembelian','retur_pembelian_detail.php',6,'',2,1),(38,'Tipe Item','tipeitem.php',0,'',0,0),(39,'Penyesuaian Stock','penyesuaian_stock.php',1,'',2,1),(40,'Laporan penyesuaian stock','report_penyesuaian_stock.php',6,'',2,1),(41,'Laporan Uang Kasir','report_uang_kasir.php',6,'',2,1),(42,'Laporan Hapus Transaksi','report_edit_transaksi.php',6,'',2,1),(43,'Partner','partner.php',1,'',2,1),(44,'Denda','denda.php',1,'',2,1),(45,'Jenis Pembeli','jenis_pembeli.php',1,'',2,1),(46,'Tutorial','tutorial.php',0,'fa fa-video-camera',1,1);

/*Table structure for table `stock_cabang` */

DROP TABLE IF EXISTS `stock_cabang`;

CREATE TABLE `stock_cabang` (
  `id_cabang_item` int(10) unsigned NOT NULL,
  `cabang_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_qty` float NOT NULL,
  PRIMARY KEY (`id_cabang_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stock_cabang` */

/*Table structure for table `stock_retur_details_pembelian` */

DROP TABLE IF EXISTS `stock_retur_details_pembelian`;

CREATE TABLE `stock_retur_details_pembelian` (
  `item_stock_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `purchase_detail_id` int(11) NOT NULL,
  `item_stock_real` bigint(20) NOT NULL,
  `item_stock_qty` bigint(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `retur_date` int(11) NOT NULL,
  PRIMARY KEY (`item_stock_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stock_retur_details_pembelian` */

/*Table structure for table `stock_retur_details_penjualan` */

DROP TABLE IF EXISTS `stock_retur_details_penjualan`;

CREATE TABLE `stock_retur_details_penjualan` (
  `item_stock_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `transaction_detail_id` int(11) NOT NULL,
  `item_stock_real` bigint(20) NOT NULL,
  `item_stock_qty` bigint(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `retur_date` int(11) NOT NULL,
  PRIMARY KEY (`item_stock_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stock_retur_details_penjualan` */

/*Table structure for table `stock_retur_pembelian` */

DROP TABLE IF EXISTS `stock_retur_pembelian`;

CREATE TABLE `stock_retur_pembelian` (
  `item_stock_retur_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_stock_qty` float NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`item_stock_retur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stock_retur_pembelian` */

/*Table structure for table `stock_retur_penjualan` */

DROP TABLE IF EXISTS `stock_retur_penjualan`;

CREATE TABLE `stock_retur_penjualan` (
  `item_stock_retur_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_stock_qty` float NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`item_stock_retur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stock_retur_penjualan` */

/*Table structure for table `sub_kategori` */

DROP TABLE IF EXISTS `sub_kategori`;

CREATE TABLE `sub_kategori` (
  `sub_kategori_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_kategori_name` varchar(100) NOT NULL,
  `kategori_utama_id` int(11) NOT NULL,
  PRIMARY KEY (`sub_kategori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `sub_kategori` */

insert  into `sub_kategori`(`sub_kategori_id`,`sub_kategori_name`,`kategori_utama_id`) values (17,'Android',6),(20,'Bebek',7),(21,'Matic',7),(22,'Sport',7),(24,'Sedan',8),(25,'Pick Up',8),(26,'Kayu',9),(27,'i os',6);

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(50) NOT NULL,
  `supplier_phone` varchar(11) NOT NULL,
  `supplier_email` varchar(100) NOT NULL,
  `supplier_addres` varchar(100) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `suppliers` */

insert  into `suppliers`(`supplier_id`,`supplier_name`,`supplier_phone`,`supplier_email`,`supplier_addres`) values (10,'PLATINUM XIAOMI','08564838048','','SURABAYA'),(9,'WTC ','08133450888','','SURABAYA'),(8,'OPPO PT. WIT','08213976251','','GRESIK');

/*Table structure for table `table_edit_kredit` */

DROP TABLE IF EXISTS `table_edit_kredit`;

CREATE TABLE `table_edit_kredit` (
  `table_edit_kredit_id` int(11) NOT NULL AUTO_INCREMENT,
  `kredit` int(11) DEFAULT NULL,
  `kredit_date` datetime DEFAULT NULL,
  `kredit_uang_muka` int(11) DEFAULT NULL,
  `kredit_member_id` int(11) DEFAULT NULL,
  `kredit_item_id` int(11) DEFAULT NULL,
  `kredit_user_input` int(11) DEFAULT NULL,
  `kredit_user_edit` int(11) DEFAULT NULL,
  `kredit_edit_date` datetime DEFAULT NULL,
  PRIMARY KEY (`table_edit_kredit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `table_edit_kredit` */

/*Table structure for table `tipe_diskon` */

DROP TABLE IF EXISTS `tipe_diskon`;

CREATE TABLE `tipe_diskon` (
  `tipe_diskon_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipe_diskon_name` varchar(255) NOT NULL,
  PRIMARY KEY (`tipe_diskon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tipe_diskon` */

insert  into `tipe_diskon`(`tipe_diskon_id`,`tipe_diskon_name`) values (1,'Disk. Memotong / Invoice'),(2,'Disk. Memotong / Item');

/*Table structure for table `tipe_pembeli_diskon` */

DROP TABLE IF EXISTS `tipe_pembeli_diskon`;

CREATE TABLE `tipe_pembeli_diskon` (
  `tipe_pembeli_diskon_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipe_pembeli` int(11) NOT NULL,
  `kategori_item` int(11) NOT NULL,
  `nilai_diskon` int(11) NOT NULL,
  `nominal_diskon` bigint(20) NOT NULL,
  PRIMARY KEY (`tipe_pembeli_diskon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipe_pembeli_diskon` */

/*Table structure for table `transaction_details` */

DROP TABLE IF EXISTS `transaction_details`;

CREATE TABLE `transaction_details` (
  `transaction_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `kategori` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `transaction_detail_original_price` bigint(11) NOT NULL,
  `transaction_detail_margin_price` bigint(11) NOT NULL,
  `transaction_detail_price` bigint(11) NOT NULL,
  `transaction_detail_persen_discount` int(11) NOT NULL,
  `transaction_detail_nominal_discount` bigint(20) NOT NULL,
  `transaction_detail_grand_price` bigint(11) NOT NULL,
  `transaction_detail_qty_real` bigint(11) NOT NULL,
  `transaction_detail_qty` float NOT NULL,
  `transaction_detail_unit` int(11) NOT NULL,
  `transaction_detail_total` int(11) NOT NULL,
  `retur` float NOT NULL,
  PRIMARY KEY (`transaction_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `transaction_details` */

insert  into `transaction_details`(`transaction_detail_id`,`transaction_id`,`kategori`,`item_id`,`transaction_detail_original_price`,`transaction_detail_margin_price`,`transaction_detail_price`,`transaction_detail_persen_discount`,`transaction_detail_nominal_discount`,`transaction_detail_grand_price`,`transaction_detail_qty_real`,`transaction_detail_qty`,`transaction_detail_unit`,`transaction_detail_total`,`retur`) values (1,1,6,4,1800000,0,1800000,0,0,0,1,1,0,1800000,0),(2,2,6,5,2000000,0,2000000,0,0,0,1,1,0,2000000,0);

/*Table structure for table `transaction_details_item` */

DROP TABLE IF EXISTS `transaction_details_item`;

CREATE TABLE `transaction_details_item` (
  `transaction_details_item` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `transaction_detail_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `keterangan_item` int(11) NOT NULL,
  PRIMARY KEY (`transaction_details_item`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `transaction_details_item` */

insert  into `transaction_details_item`(`transaction_details_item`,`transaction_id`,`transaction_detail_id`,`item_id`,`keterangan_item`) values (1,1,1,4,13),(2,2,2,5,21);

/*Table structure for table `transaction_histories` */

DROP TABLE IF EXISTS `transaction_histories`;

CREATE TABLE `transaction_histories` (
  `transaction_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `transaction_total` int(11) NOT NULL,
  `transaction_discount` int(11) NOT NULL,
  `transaction_grand_total` int(11) NOT NULL,
  `transaction_payment` int(11) NOT NULL,
  `transaction_change` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bank_account_number` varchar(100) NOT NULL,
  `transaction_code` int(11) NOT NULL,
  `user_delete` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaction_histories` */

/*Table structure for table `transaction_new_tmp` */

DROP TABLE IF EXISTS `transaction_new_tmp`;

CREATE TABLE `transaction_new_tmp` (
  `tnt_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `tnt_price` int(11) NOT NULL,
  `tnt_discount` int(11) NOT NULL,
  `tnt_grand_price` int(11) NOT NULL,
  `tnt_qty` int(11) NOT NULL,
  `tnt_total` int(11) NOT NULL,
  PRIMARY KEY (`tnt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaction_new_tmp` */

/*Table structure for table `transaction_order_types` */

DROP TABLE IF EXISTS `transaction_order_types`;

CREATE TABLE `transaction_order_types` (
  `tot_id` int(11) NOT NULL AUTO_INCREMENT,
  `tot_name` varchar(100) NOT NULL,
  PRIMARY KEY (`tot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaction_order_types` */

/*Table structure for table `transaction_tmp_details` */

DROP TABLE IF EXISTS `transaction_tmp_details`;

CREATE TABLE `transaction_tmp_details` (
  `transaction_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `kategori` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `transaction_detail_original_price` bigint(11) NOT NULL,
  `transaction_detail_margin_price` bigint(11) NOT NULL,
  `transaction_detail_price` bigint(11) NOT NULL,
  `transaction_detail_price_discount` bigint(11) NOT NULL,
  `transaction_detail_grand_price` bigint(11) NOT NULL,
  `transaction_detail_qty_real` int(11) NOT NULL,
  `transaction_detail_qty` float NOT NULL,
  `transaction_detail_unit` int(11) NOT NULL,
  `transaction_detail_total` bigint(11) NOT NULL,
  `transaction_detail_status` int(11) NOT NULL,
  PRIMARY KEY (`transaction_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `transaction_tmp_details` */

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `transaction_total` bigint(11) NOT NULL,
  `transaction_discount` float NOT NULL,
  `total_discount_persen` bigint(20) NOT NULL,
  `transaction_discount_nominal` bigint(20) NOT NULL,
  `transaction_grand_total` bigint(11) NOT NULL,
  `transaction_payment` bigint(11) NOT NULL,
  `transaction_change` bigint(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `i_bank_account` int(11) NOT NULL,
  `bank_id_to` int(11) NOT NULL,
  `i_bank_account_to` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_code` int(11) NOT NULL,
  `tax` bigint(11) NOT NULL,
  `total_all` bigint(11) NOT NULL,
  `transaction_desc` text NOT NULL,
  `lunas` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`transaction_id`,`transaction_change`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `transactions` */

insert  into `transactions`(`transaction_id`,`member_id`,`partner_id`,`transaction_date`,`transaction_total`,`transaction_discount`,`total_discount_persen`,`transaction_discount_nominal`,`transaction_grand_total`,`transaction_payment`,`transaction_change`,`payment_method_id`,`bank_id`,`i_bank_account`,`bank_id_to`,`i_bank_account_to`,`user_id`,`transaction_code`,`tax`,`total_all`,`transaction_desc`,`lunas`,`branch_id`) values (1,8,0,'2017-04-25 18:00:18',1800000,0,0,0,1800000,1800000,0,1,0,0,0,0,1,1493136018,0,1800000,'',0,3),(2,4,0,'2017-04-26 04:03:49',2000000,0,0,0,2000000,450000,0,5,0,0,0,0,1,1493172229,0,2000000,'',1,3);

/*Table structure for table `transactions_tmp` */

DROP TABLE IF EXISTS `transactions_tmp`;

CREATE TABLE `transactions_tmp` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `transaction_code` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `transactions_tmp` */

/*Table structure for table `tutorial` */

DROP TABLE IF EXISTS `tutorial`;

CREATE TABLE `tutorial` (
  `tutorial_id` int(11) NOT NULL AUTO_INCREMENT,
  `tutorial_date` date NOT NULL,
  `tutorial_name` varchar(200) NOT NULL,
  `tutorial_video` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`tutorial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tutorial` */

/*Table structure for table `type_pembeli` */

DROP TABLE IF EXISTS `type_pembeli`;

CREATE TABLE `type_pembeli` (
  `type_id_pembeli` int(11) NOT NULL AUTO_INCREMENT,
  `type_pembeli_name` varchar(200) NOT NULL,
  `diskon` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `tipe_diskon_berlaku` int(11) NOT NULL,
  PRIMARY KEY (`type_id_pembeli`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `type_pembeli` */

insert  into `type_pembeli`(`type_id_pembeli`,`type_pembeli_name`,`diskon`,`branch_id`,`tipe_diskon_berlaku`) values (14,'GROSIR',0,3,1);

/*Table structure for table `uang_kasir` */

DROP TABLE IF EXISTS `uang_kasir`;

CREATE TABLE `uang_kasir` (
  `uang_kasir_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `uang_kasir_date` datetime NOT NULL,
  `nilai_uang_kasir` bigint(20) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`uang_kasir_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

/*Data for the table `uang_kasir` */

insert  into `uang_kasir`(`uang_kasir_id`,`user_id`,`uang_kasir_date`,`nilai_uang_kasir`,`branch_id`) values (1,4,'2017-03-30 11:03:18',100000,3),(2,3,'2017-03-30 12:03:49',0,3),(3,5,'2017-03-30 12:03:09',0,3),(4,5,'2017-03-30 13:03:51',0,3),(5,3,'2017-03-30 13:03:39',0,3),(6,3,'2017-04-01 07:04:05',0,3),(7,4,'2017-04-01 08:04:41',100000,3),(8,3,'2017-04-01 10:04:59',0,3),(9,4,'2017-04-02 09:04:03',1000000,3),(10,4,'2017-04-02 11:04:28',100000,3),(11,3,'2017-04-03 12:04:09',0,3),(12,5,'2017-04-03 12:04:52',0,3),(13,3,'2017-04-05 06:04:40',0,3),(14,3,'2017-04-05 07:04:06',0,3),(15,3,'2017-04-06 04:04:50',0,3),(16,3,'2017-04-06 04:04:44',0,3),(17,3,'2017-04-06 07:04:45',0,3),(18,3,'2017-04-06 07:04:42',0,3),(19,3,'2017-04-06 10:04:39',0,3),(20,3,'2017-04-06 10:04:52',0,3),(21,3,'2017-04-06 11:04:32',0,3),(22,3,'2017-04-06 17:04:26',0,3),(23,3,'2017-04-06 21:04:05',0,3),(24,3,'2017-04-07 15:04:55',0,3),(25,3,'2017-04-07 15:04:36',0,3),(26,3,'2017-04-07 18:04:17',0,3),(27,3,'2017-04-07 18:04:37',0,3),(28,3,'2017-04-07 18:04:46',0,3),(29,3,'2017-04-07 18:04:10',0,3),(30,3,'2017-04-08 09:04:52',0,3),(31,3,'2017-04-08 09:04:17',0,3),(32,4,'2017-04-09 11:04:07',100000,3),(33,4,'2017-04-15 14:04:09',100000,3),(34,4,'2017-04-20 09:04:56',100000,3),(35,4,'2017-04-21 11:04:54',100000,3),(36,4,'2017-04-21 20:04:08',0,3),(37,4,'2017-04-22 18:04:01',0,3);

/*Table structure for table `unit_konversi` */

DROP TABLE IF EXISTS `unit_konversi`;

CREATE TABLE `unit_konversi` (
  `unit_konversi_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `unit_jml` bigint(20) NOT NULL,
  `unit_konversi` int(255) NOT NULL,
  `unit_konversi_jml` bigint(20) NOT NULL,
  `harga_konversi` bigint(20) NOT NULL,
  PRIMARY KEY (`unit_konversi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `unit_konversi` */

/*Table structure for table `unit_konversi_tmp` */

DROP TABLE IF EXISTS `unit_konversi_tmp`;

CREATE TABLE `unit_konversi_tmp` (
  `unit_konversi_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `unit_jml` bigint(20) NOT NULL,
  `unit_konversi` int(255) NOT NULL,
  `unit_konversi_jml` bigint(20) NOT NULL,
  `harga_konversi` bigint(20) NOT NULL,
  PRIMARY KEY (`unit_konversi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `unit_konversi_tmp` */

/*Table structure for table `units` */

DROP TABLE IF EXISTS `units`;

CREATE TABLE `units` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(20) NOT NULL,
  `satuan` decimal(10,0) NOT NULL,
  `tingkat` int(11) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `units` */

insert  into `units`(`unit_id`,`unit_name`,`satuan`,`tingkat`) values (20,'DOS',0,0),(14,'Unit',0,0),(17,'buah',0,0);

/*Table structure for table `user_types` */

DROP TABLE IF EXISTS `user_types`;

CREATE TABLE `user_types` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_name` varchar(200) NOT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `user_types` */

insert  into `user_types`(`user_type_id`,`user_type_name`) values (1,'Administrator'),(2,'Owner'),(3,'Manager');

/*Table structure for table `user_typesz` */

DROP TABLE IF EXISTS `user_typesz`;

CREATE TABLE `user_typesz` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_name` varchar(200) NOT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_typesz` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
  `user_login` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_code` varchar(100) NOT NULL,
  `user_phone` varchar(100) NOT NULL,
  `user_img` text NOT NULL,
  `user_active_status` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_desc` varchar(200) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`user_id`,`user_type_id`,`user_login`,`user_password`,`user_name`,`user_code`,`user_phone`,`user_img`,`user_active_status`,`branch_id`,`user_desc`) values (1,2,'admin','21232f297a57a5a743894a0e4a801fc3','admin','','','',2,3,''),(3,2,'DANUARISKA','99ded7c21fc65d377fd02b290cd7fb2a','DANU ARISKA','','08155555465','',1,3,''),(4,1,'EVI','e10adc3949ba59abbe56e057f20f883e','EVI TANIA N.A ','','085855397574','',1,3,''),(5,1,'DESI','21232f297a57a5a743894a0e4a801fc3','DESI DWI INDIANSARI','','085704696137','',1,3,'');

/*Table structure for table `widget_tmp` */

DROP TABLE IF EXISTS `widget_tmp`;

CREATE TABLE `widget_tmp` (
  `wt_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `jumlah` float NOT NULL,
  `jumlah_konversi` float NOT NULL,
  `unit_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `wt_desc` text NOT NULL,
  `zak` int(11) NOT NULL,
  `printed` int(11) NOT NULL,
  PRIMARY KEY (`wt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `widget_tmp` */

insert  into `widget_tmp`(`wt_id`,`user_id`,`stock_id`,`jumlah`,`jumlah_konversi`,`unit_id`,`transaction_id`,`wt_desc`,`zak`,`printed`) values (6,1,4,1,1,0,29,'',0,0),(10,1,4,1,1,0,30,'',0,0);

/*Table structure for table `widget_tmp_details` */

DROP TABLE IF EXISTS `widget_tmp_details`;

CREATE TABLE `widget_tmp_details` (
  `wtd_id` int(11) NOT NULL AUTO_INCREMENT,
  `wt_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `keterangan_item` int(11) NOT NULL,
  PRIMARY KEY (`wtd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `widget_tmp_details` */

insert  into `widget_tmp_details`(`wtd_id`,`wt_id`,`item_id`,`keterangan_item`) values (6,6,4,0),(10,10,4,141);

/*Table structure for table `wr_pembelian_details_tmp` */

DROP TABLE IF EXISTS `wr_pembelian_details_tmp`;

CREATE TABLE `wr_pembelian_details_tmp` (
  `wr_pembelian_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `retur_tmp_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `kategori_keterangan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`wr_pembelian_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wr_pembelian_details_tmp` */

/*Table structure for table `wr_pembelian_tmp` */

DROP TABLE IF EXISTS `wr_pembelian_tmp`;

CREATE TABLE `wr_pembelian_tmp` (
  `retur_tmp_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `purchase_detail_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_qty` float DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `harga_retur` bigint(20) DEFAULT NULL,
  `retur_desc` text,
  PRIMARY KEY (`retur_tmp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wr_pembelian_tmp` */

/* Trigger structure for table `transaction_details_item` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_item_keterangan_detail` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_item_keterangan_detail` AFTER DELETE ON `transaction_details_item` FOR EACH ROW BEGIN
	UPDATE item_keterangan_details SET STATUS = 1 WHERE item_keterangan_details = old.keterangan_item;
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
