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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `angsuran_kredit` */

insert  into `angsuran_kredit`(`angsuran_kredit_id`,`member_id`,`transaction_id`,`kredit_id`,`lama_angsuran`,`angsuran_nominal`,`total_kredit`) values (1,31,1,1,2,956000,0),(6,30,2,2,12,221000,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `angsuran_kredit_details` */

insert  into `angsuran_kredit_details`(`angsuran_kredit_details_id`,`angsuran_kredit_details_code`,`angsuran_kredit_id`,`angsuran_date`,`payment_method`,`bank_id`,`bank_account_id`,`bank_id_to`,`bank_account_id_to`,`angsuran_nominal`,`total_payment`,`payment_change`,`denda_nominal`,`denda_persen`,`denda_persen_nominal`,`user_id`,`ket`) values (1,'AK_1490889940',1,'2017-03-30',1,0,'',0,'',956000,1003800,0,0,5,47800,1,1),(2,'AK_1490890511',1,'2017-03-30',1,0,'',0,'',956000,956000,0,0,0,0,1,0),(7,'AK_1490902539',6,'2017-03-30',1,0,'',0,'',221000,464100,0,0,5,11050,1,1),(8,'AK_1490902539',6,'2017-03-30',1,0,'',0,'',221000,464100,0,0,5,11050,1,0),(9,'',0,'0000-00-00',0,0,'',0,'',0,0,0,0,0,0,0,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `angsuran_kredit_details_tmp` */

insert  into `angsuran_kredit_details_tmp`(`angsuran_kredit_details_id`,`angsuran_kredit_id`,`angsuran_date`,`payment_method`,`angsuran_nominal`,`total_payment`,`payment_change`,`denda_nominal`,`denda_persen`,`denda_persen_nominal`,`ket`) values (4,4,'2017-03-30',0,956000,0,0,0,0,0,0),(5,5,'2017-03-30',0,956000,0,0,0,0,0,0),(6,6,'2017-03-30',0,956000,0,0,0,0,0,0),(7,7,'2017-03-30',0,956000,0,0,0,0,0,0),(8,8,'2017-03-30',0,956000,0,0,0,0,0,0),(9,9,'2017-03-30',0,956000,0,0,0,0,0,0),(10,10,'2017-03-30',0,956000,0,0,0,0,0,0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `branches` */

insert  into `branches`(`branch_id`,`branch_name`,`branch_img`,`branch_desc`,`branch_address`,`branch_phone`,`branch_city`) values (3,'Pusat','','','','0989906','SURABAYA'),(7,'CABANG 1','','aaaaaaa','address 1','423423','city');

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
  `denda_persen` int(11) NOT NULL,
  `denda_desc` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`denda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `denda` */

insert  into `denda`(`denda_id`,`denda_name`,`jenis_denda`,`denda_nominal`,`denda_persen`,`denda_desc`,`branch_id`) values (1,'Harian',1,0,0,'1\r\n',3),(2,'Mingguan',2,0,0,'',3),(3,'Bulanan',3,0,5,'',3);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hapus_purchase` */

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `hapus_purchase_details` */

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hapus_transaction_details` */

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hapus_transactions` */

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

/*Data for the table `item_details` */

insert  into `item_details`(`item_detail_id`,`item_id`,`item_merk`,`item_tipe`,`item_berat`,`item_p`,`item_l`,`item_t`,`item_penerbit`,`item_desc`) values (37,13,'','',0,0,0,0,'',''),(55,44,'OPPO','JOY',0,0,0,0,'','');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `item_harga` */

insert  into `item_harga`(`stock_id`,`item_id`,`item_original_price`,`item_hpp_price`,`item_margin_price`,`item_price`) values (1,44,0,0,0,2000000);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `item_keterangan_details` */

insert  into `item_keterangan_details`(`item_keterangan_details_id`,`purchase_id`,`item_id`,`kategori_id`,`kategori_keterangan_id`,`keterangan_details`,`supplier`,`status`) values (1,2,44,6,4,'qweqweqw',5,1),(2,2,44,6,5,'',5,0),(3,2,44,6,13,'',5,0),(4,2,44,6,4,'12qwqwwq',5,1),(5,2,44,6,5,'',5,0),(6,2,44,6,13,'',5,0),(7,2,44,6,4,'34eqeqweq',5,0),(8,2,44,6,5,'',5,0),(9,2,44,6,13,'',5,0),(10,0,44,6,4,'12qwq',0,0),(11,0,44,6,5,'31',0,0),(12,0,44,6,13,'weqwe3ew',0,0),(13,0,44,6,4,'wqeqw',0,0),(14,0,44,6,5,'wqe21312',0,0),(15,0,44,6,13,'2ewqdqd3',0,0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `item_keterangan_details_tmp` */

/*Table structure for table `item_stocks` */

DROP TABLE IF EXISTS `item_stocks`;

CREATE TABLE `item_stocks` (
  `item_stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_type_id` int(11) NOT NULL,
  `item_stock_qty` float NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`item_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `item_stocks` */

insert  into `item_stocks`(`item_stock_id`,`item_id`,`item_type_id`,`item_stock_qty`,`branch_id`) values (1,44,0,168,3);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `item_tmp` */

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
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

/*Data for the table `items` */

insert  into `items`(`item_id`,`item_type`,`kategori_id`,`sub_kategori_id`,`item_name`,`unit_id`,`item_limit`,`stock_img`,`kode_barang`) values (44,0,6,17,'OPPO JOY',0,0,'','dasdasd');

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
  `bank_account` varchar(200) NOT NULL,
  `bank_id_to` int(11) NOT NULL,
  `bank_account_to` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `journals` */

insert  into `journals`(`journal_id`,`journal_type_id`,`data_id`,`data_url`,`journal_debit`,`journal_credit`,`journal_piutang`,`journal_hutang`,`journal_desc`,`journal_date`,`payment_method`,`bank_id`,`bank_account`,`bank_id_to`,`bank_account_to`,`user_id`,`branch_id`) values (1,2,'1490889008','purchases.php?page=save_payment(lunas)',0,3600000,0,0,'','2017-03-30',1,0,'0',0,'0',1,3),(2,1,'1490889248','transaction_new.php?page=save(hutang)',230000,0,1770000,0,'','2017-03-30',5,0,'0',0,'0',1,3),(3,1,'1490901121','transaction_new.php?page=save(hutang)',210000,0,1790000,0,'','2017-03-30',5,0,'0',0,'0',1,3),(9,6,'AK_1490902539','angsuran.php?page=simpan_angsuran_tmp',464100,0,0,0,'','2017-03-30',1,0,'0',0,'0',1,3);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `kategori_keterangan` */

insert  into `kategori_keterangan`(`kategori_keterangan_id`,`kategori_id`,`kategori_keterangan_name`,`keterangan`) values (4,6,'IMEI',''),(5,6,'S/N',''),(13,6,'no. Baterai','');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `kredit` */

insert  into `kredit`(`kredit_id`,`transaction_id`,`kredit_code`,`user_id`,`member_id`,`item_id`,`jenis_item`,`administrasi`,`harga_item`,`uang_muka_barang`,`payment_method_id`,`bank_id_angsuran`,`bank_account_angsuran`,`bank_id_to_angsuran`,`bank_account_to_angsuran`,`nilai_pembiayaan`,`lama_angsuran`,`periode`,`angsuran_per_bulan`,`pembayaran_per_tanggal_1`,`pembayaran_per_tanggal_2`,`kredit_date`,`kredit_total`,`lunas`) values (1,1,'K_149088929',1,31,44,6,20000,2000000,230000,1,0,'',0,'',1770000,2,3,956000,'01 ',' 04','2017-03-30 17:54:08',0,2),(2,2,'K_149090116',1,30,44,6,23000,2000000,210000,1,0,'',0,'',1790000,12,3,221000,'10 ',' 17','2017-03-30 21:12:01',0,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Data for the table `members` */

insert  into `members`(`member_id`,`member_name`,`member_phone`,`member_email`,`member_alamat`,`member_discount`,`member_nik`,`kelurahan`,`kecamatan`,`RT`,`RW`,`kode_pos`,`kota`,`nama_ibu`,`tempat_lahir`,`tanggal_lahir`,`status_perkawinan`,`jumlah_tanggungan`,`telp_rumah`,`status_rumah`,`lama_tinggal`,`pendidikan`,`tipe_pembeli`) values (27,'Putut Wahyudi','081-2428649832','putut@gmail','Dinoyo',0,'2','2','2','2','2','2','2','Putut Wahyuni','Demak','2017-01-05',1,2,'2',4,2,3,0),(30,'Firman Zain','081-2428649832','firman@gmail','Ponorogo',0,'wqdqd','1','1','2','2','2','1','1','1','2017-02-28',3,1,'1',3,1,3,0),(31,'Lintang','2134567','lintang@gmail.com','Lintang Utara 25',0,'43432','Lintang Lontag','Lontang','5','3','61061','Lintang','Ibunya Lintang','Lintang Utara','1970-03-02',2,12,'03100000',3,12,1,0),(32,'Ricad','12','12','12',0,'qweqwe','12','12','12','12','12','12','12','12','2017-14-02',2,12,'12',2,12,3,0),(33,'Risky Febrianto','12','12@qwe','12',0,'12','12','12','12','12','12','12','12','12','2017-22-02',3,12,'12',2,12,2,0),(34,'Agung','48938403','agung@gmail.com','Rungkut',0,'1093481','Industri','Industri','2','2','1','Industri','Mama Agung','Surabaya','1996-21-07',3,0,'02194-0134',2,20,5,0),(35,'DANU ARISKA','082230055553','-','DSN BANJARMLATI',0,'35259873738376','BANJARAGUNG','BALONGPANGGANG','3','1','61173','GRESIK','ROMLAH','BANGKALAN','1991-31-08',3,2,'-',1,20,5,0),(36,'Edi Sucipto','','','',0,'','','','','','','','','','',0,0,'',0,0,0,0),(37,'Muhajir','4948048','','Kalip Kepiting',0,'94039483204','','','','','','','','','',0,0,'',0,0,0,0),(38,'Dioi Surya','490349','','Ponorogo',0,'2340923-049','','','','','','','','','',0,0,'',0,0,0,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

/*Data for the table `members_darurat` */

insert  into `members_darurat`(`id_darurat`,`member_id`,`nama_darurat`,`hubungan`,`alamat`,`no_telp`) values (39,32,'12',4,'12','12'),(40,33,'12',4,'12','12'),(44,30,'1',3,'1','1'),(46,27,'2',2,'2','2'),(47,34,'Muhajir',5,'hkdhfasihp','2173097'),(48,35,'HARGIANTO',5,'DSN. BANJARMLATI, DS BANJARAGUNG, KEC. BALONG PANGGANG-GRESIK','0812334334'),(49,31,'Ayah Lintang',1,'Lintang Selatan','432564');

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
  `penghasilan` varchar(200) NOT NULL,
  `pengeluaran` varchar(200) NOT NULL,
  `penghasilan_lain` varchar(200) NOT NULL,
  `sumber_penghasilan` int(200) NOT NULL,
  PRIMARY KEY (`pekerjaan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

/*Data for the table `members_pekerjaan` */

insert  into `members_pekerjaan`(`pekerjaan_id`,`member_id`,`nama_perusahaan`,`alamat_perusahaan`,`RT`,`RW`,`kode_pos`,`kelurahan`,`kecamatan`,`kota`,`telp_kantor`,`jenis_pekerjaan`,`jabatan`,`lama_bekerja_tahun`,`lama_bekerja_bulan`,`penghasilan`,`pengeluaran`,`penghasilan_lain`,`sumber_penghasilan`) values (39,32,'12','12','12','12','12','12','12','12','12','12','12','12','12','12','12','12',2),(40,33,'12','12','12','12','12','12','12','12','12','12','12','12','12','12','12','12',2),(44,30,'2','2','2','2','2','1','1','1','1','1','Programmer','1','1','1','1','1',2),(46,27,'2','2','2','2','2','2','2','2','2','2','Server Maintenance','2','2','20000000','200000','200000',1),(47,34,'Filma','Rungkut','21','31','12','entah','entah','Surabaya','64919129','0','hwcbcbbo','12','12','2300000','1000000','',2),(48,35,'INTERIOR','BANJARMLAATI','3','1','61173','BANJARAGUNG','BALONGPANGGANG','GRESIK','0812344344','0','PEMILIK','10','5','4000000','3000000','',3),(49,31,'PT Lintang Morat Marit','Lintang Barat 90','5','3','61061','Lintang Lontag','Lontang','Lontang','0832524932','0','Direktur','2','-30','5000000000000000000','120000000000','0',1);

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

insert  into `office`(`office_id`,`office_name`,`office_img`,`office_desc`,`office_address`,`office_phone`,`office_email`,`office_city`,`office_owner`,`office_owner_phone`,`office_owner_address`,`office_owner_email`) values (1,'Two in One','1486196649_twiin.jpg','','JL. RAYA LONTAR 226 SURABAYA','(031)-04408-0-02','twoinone@gmail.com','SURABAYA','Danu Ariska','0856-343-423','Surabaya','danuariksa@gmail.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `partners` */

insert  into `partners`(`partner_id`,`partner_name`,`partner_alamat`,`partner_phone`,`partner_email`,`partner_deskripsi`,`branch_id`) values (6,'SAMSUL','qw@qwewq','qw@qwewq','qw@qwewq','dvdvqvvfvf',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `penyesuaian_stock_cabang` */

insert  into `penyesuaian_stock_cabang`(`penyesuaian_stock_cabang_id`,`user_id`,`branch_id`,`date_penyesuaian`,`item_id`,`item_qty_awal`,`item_qty_new`) values (7,1,3,'2017-04-02 12:04:56',44,170,2);

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
) ENGINE=InnoDB AUTO_INCREMENT=2666 DEFAULT CHARSET=latin1;

/*Data for the table `permits` */

insert  into `permits`(`permit_id`,`user_type_id`,`side_menu_id`,`permit_acces`) values (409,28,1,'0'),(410,28,2,''),(411,28,3,'0'),(412,28,4,'0'),(413,28,5,'0'),(414,28,6,'0'),(415,28,7,'c,d'),(416,28,8,'r,d'),(417,28,9,'r,d'),(418,28,10,'r,d'),(419,28,11,'r,d'),(420,28,12,'r,d'),(421,28,13,'r,d'),(422,28,14,'r,d'),(423,28,15,'r,d'),(424,28,16,'r,d'),(425,28,17,'c,r,d'),(426,28,18,'r'),(427,28,19,'r,d'),(428,28,20,'r,d'),(429,28,21,'r,u'),(430,28,22,'r,d'),(431,28,23,'r,u'),(432,28,24,'c,r'),(481,2,1,'0'),(482,2,2,'c,r,u,d'),(483,2,3,'0'),(484,2,4,'0'),(485,2,5,'0'),(486,2,6,'0'),(487,2,7,'c,r,u,d'),(488,2,8,'c,r,u,d'),(489,2,9,'c,r,u,d'),(490,2,10,'c,r,u,d'),(491,2,11,'c,r,u,d'),(492,2,12,'c,r,u,d'),(493,2,13,'c,r,u,d'),(494,2,14,'c,r,u,d'),(495,2,15,'c,r,u,d'),(496,2,16,'c,r,u,d'),(497,2,17,'c,r,u,d'),(498,2,18,'c,r,u,d'),(499,2,19,'c,r,u,d'),(500,2,20,'c,r,u,d'),(501,2,21,'c,r,u,d'),(502,2,22,'c,r,u,d'),(503,2,23,'c,r,u,d'),(504,2,24,'c,r,u,d'),(505,4,1,'0'),(506,4,2,'c,r,u,d'),(507,4,3,'0'),(508,4,4,'0'),(509,4,5,'0'),(510,4,6,'0'),(511,4,7,''),(512,4,8,''),(513,4,9,''),(514,4,10,''),(515,4,11,''),(516,4,12,''),(517,4,13,''),(518,4,14,''),(519,4,15,'r'),(520,4,16,''),(521,4,17,''),(522,4,18,''),(523,4,19,''),(524,4,20,''),(525,4,21,''),(526,4,22,''),(527,4,23,''),(528,4,24,''),(2622,1,1,'0'),(2623,1,2,'c,r,u,d'),(2624,1,3,'c,r,u,d'),(2625,1,4,'0'),(2626,1,5,'0'),(2627,1,6,'0'),(2628,1,7,'0'),(2629,1,8,'0'),(2630,1,9,'c,r,u,d'),(2631,1,11,'c,r,u,d'),(2632,1,12,'c,r,u,d'),(2633,1,13,'c,r,u,d'),(2634,1,14,'c,r,u,d'),(2635,1,15,'c,r,u,d'),(2636,1,16,'0'),(2637,1,17,'c,r,u,d'),(2638,1,18,'c,r,u,d'),(2639,1,20,'c,r,u,d'),(2640,1,21,'c,r,u,d'),(2641,1,22,'c,r,u,d'),(2642,1,23,'c,r,u,d'),(2643,1,24,'c,r,u,d'),(2644,1,25,'c'),(2645,1,26,'c'),(2646,1,27,'c'),(2647,1,28,'0'),(2648,1,29,'c'),(2649,1,30,'c'),(2650,1,31,'c'),(2651,1,32,'c'),(2652,1,33,'c'),(2653,1,34,'c,r,u,d'),(2654,1,35,'c,r,u,d'),(2655,1,36,'c'),(2656,1,37,'c'),(2657,1,38,'0'),(2658,1,39,'c,r,u,d'),(2659,1,40,'c'),(2660,1,41,'c'),(2661,1,42,'c'),(2662,1,43,'c,r,u,d'),(2663,1,44,'c,r,u,d'),(2664,1,45,'c,r,u,d'),(2665,1,46,'c,r,u,d');

/*Table structure for table `purchases` */

DROP TABLE IF EXISTS `purchases`;

CREATE TABLE `purchases` (
  `purchases_id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`purchases_id`,`bank_account`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `purchases` */

insert  into `purchases`(`purchases_id`,`user_id`,`purchases_date`,`purchases_code`,`supplier_id`,`branch_id`,`bank_id`,`bank_account`,`bank_id_to`,`bank_account_to`,`payment_method`,`purchase_total`,`purchase_payment`,`purchase_change`,`lunas`,`purchase_desc`) values (2,1,'2017-03-30 17:50:05',1490889008,5,3,0,0,0,0,1,3600000,3600000,0,0,'');

/*Table structure for table `purchases_details` */

DROP TABLE IF EXISTS `purchases_details`;

CREATE TABLE `purchases_details` (
  `purchase_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `purchase_qty` float NOT NULL,
  `purchase_price` bigint(11) NOT NULL,
  `purchase_total` bigint(11) NOT NULL,
  `retur` float NOT NULL,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`purchase_detail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `purchases_details` */

insert  into `purchases_details`(`purchase_detail_id`,`purchase_id`,`purchase_date`,`item_id`,`purchase_qty`,`purchase_price`,`purchase_total`,`retur`,`unit_id`) values (1,2,'2017-03-30',44,3,1200000,3600000,0,0);

/*Table structure for table `purchases_details_tmp` */

DROP TABLE IF EXISTS `purchases_details_tmp`;

CREATE TABLE `purchases_details_tmp` (
  `purchase_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `item_type` float NOT NULL,
  `item_id` int(11) NOT NULL,
  `purchase_qty` bigint(11) NOT NULL,
  `purchase_price` bigint(11) NOT NULL,
  `purchase_total` float NOT NULL,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`purchase_detail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `suppliers` */

insert  into `suppliers`(`supplier_id`,`supplier_name`,`supplier_phone`,`supplier_email`,`supplier_addres`) values (1,'Berkah Nusantara','021-4340194','',''),(4,'MASPION','084-9349-34','',''),(5,'PT. PANAROMA','089-987-345','','\r\n\r\n'),(6,'PT. PALAWIJA','031-234875','',''),(7,'WTC','0317908848','','WTC SURABAYA');

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

insert  into `transaction_details`(`transaction_detail_id`,`transaction_id`,`kategori`,`item_id`,`transaction_detail_original_price`,`transaction_detail_margin_price`,`transaction_detail_price`,`transaction_detail_persen_discount`,`transaction_detail_nominal_discount`,`transaction_detail_grand_price`,`transaction_detail_qty_real`,`transaction_detail_qty`,`transaction_detail_unit`,`transaction_detail_total`,`retur`) values (1,1,6,44,2000000,0,2000000,0,0,0,1,1,0,2000000,0),(2,2,6,44,2000000,0,2000000,0,0,0,1,1,0,2000000,0);

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

insert  into `transaction_details_item`(`transaction_details_item`,`transaction_id`,`transaction_detail_id`,`item_id`,`keterangan_item`) values (1,1,1,44,1),(2,2,2,44,4);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

insert  into `transactions`(`transaction_id`,`member_id`,`partner_id`,`transaction_date`,`transaction_total`,`transaction_discount`,`total_discount_persen`,`transaction_discount_nominal`,`transaction_grand_total`,`transaction_payment`,`transaction_change`,`payment_method_id`,`bank_id`,`i_bank_account`,`bank_id_to`,`i_bank_account_to`,`user_id`,`transaction_code`,`tax`,`total_all`,`transaction_desc`,`lunas`,`branch_id`) values (1,31,0,'2017-03-30 17:54:08',2000000,0,0,0,2000000,230000,0,5,0,0,0,0,1,1490889248,0,2000000,'',2,3),(2,30,0,'2017-03-30 21:12:01',2000000,0,0,0,2000000,210000,0,5,0,0,0,0,1,1490901121,0,2000000,'',1,3);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transactions_tmp` */

/*Table structure for table `tutorial` */

DROP TABLE IF EXISTS `tutorial`;

CREATE TABLE `tutorial` (
  `tutorial_id` int(11) NOT NULL AUTO_INCREMENT,
  `tutorial_date` datetime NOT NULL,
  `tutorial_name` varchar(200) NOT NULL,
  `tutorial_video` text NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`tutorial_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tutorial` */

insert  into `tutorial`(`tutorial_id`,`tutorial_date`,`tutorial_name`,`tutorial_video`,`user_id`) values (4,'2017-04-02 13:04:12','CABANG','1491131777_bandicam2017-04-0218-13-26-987.mp4',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `uang_kasir` */

insert  into `uang_kasir`(`uang_kasir_id`,`user_id`,`uang_kasir_date`,`nilai_uang_kasir`,`branch_id`) values (1,11,'2017-04-01 04:04:26',0,3);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `user_types` */

insert  into `user_types`(`user_type_id`,`user_type_name`) values (1,'Administrator'),(2,'Owner'),(3,'Manager'),(4,'Cashier'),(5,'Waitress');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`user_id`,`user_type_id`,`user_login`,`user_password`,`user_name`,`user_code`,`user_phone`,`user_img`,`user_active_status`,`branch_id`,`user_desc`) values (1,1,'admin','fe01ce2a7fbac8fafaed7c982a04e229','admin','','747473773673','',1,3,''),(2,1,'admin2','c84258e9c39059a89ab77d846ddab909','admin2','','1212','',1,3,'');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `widget_tmp` */

insert  into `widget_tmp`(`wt_id`,`user_id`,`stock_id`,`jumlah`,`jumlah_konversi`,`unit_id`,`transaction_id`,`wt_desc`,`zak`,`printed`) values (6,1,44,1,1,0,3,'',0,0);

/*Table structure for table `widget_tmp_details` */

DROP TABLE IF EXISTS `widget_tmp_details`;

CREATE TABLE `widget_tmp_details` (
  `wtd_id` int(11) NOT NULL AUTO_INCREMENT,
  `wt_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `keterangan_item` int(11) NOT NULL,
  PRIMARY KEY (`wtd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `widget_tmp_details` */

insert  into `widget_tmp_details`(`wtd_id`,`wt_id`,`item_id`,`keterangan_item`) values (5,6,44,7);

/*Table structure for table `wr_pembelian_details_tmp` */

DROP TABLE IF EXISTS `wr_pembelian_details_tmp`;

CREATE TABLE `wr_pembelian_details_tmp` (
  `wr_pembelian_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `retur_tmp_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `kategori_keterangan_id` int(11) NOT NULL,
  PRIMARY KEY (`wr_pembelian_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wr_pembelian_details_tmp` */

/*Table structure for table `wr_pembelian_tmp` */

DROP TABLE IF EXISTS `wr_pembelian_tmp`;

CREATE TABLE `wr_pembelian_tmp` (
  `retur_tmp_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `purchase_detail_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_qty` float NOT NULL,
  `unit_id` int(11) NOT NULL,
  `harga_retur` bigint(20) NOT NULL,
  `retur_desc` text NOT NULL,
  PRIMARY KEY (`retur_tmp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wr_pembelian_tmp` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
