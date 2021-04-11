-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2021 at 04:48 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add address', 7, 'add_address'),
(26, 'Can change address', 7, 'change_address'),
(27, 'Can delete address', 7, 'delete_address'),
(28, 'Can view address', 7, 'view_address'),
(29, 'Can add car', 8, 'add_car'),
(30, 'Can change car', 8, 'change_car'),
(31, 'Can delete car', 8, 'delete_car'),
(32, 'Can view car', 8, 'view_car'),
(33, 'Can add client', 9, 'add_client'),
(34, 'Can change client', 9, 'change_client'),
(35, 'Can delete client', 9, 'delete_client'),
(36, 'Can view client', 9, 'view_client'),
(37, 'Can add employee', 10, 'add_employee'),
(38, 'Can change employee', 10, 'change_employee'),
(39, 'Can delete employee', 10, 'delete_employee'),
(40, 'Can view employee', 10, 'view_employee'),
(41, 'Can add rent', 11, 'add_rent'),
(42, 'Can change rent', 11, 'change_rent'),
(43, 'Can delete rent', 11, 'delete_rent'),
(44, 'Can view rent', 11, 'view_rent'),
(45, 'Can add Token', 12, 'add_token'),
(46, 'Can change Token', 12, 'change_token'),
(47, 'Can delete Token', 12, 'delete_token'),
(48, 'Can view Token', 12, 'view_token'),
(49, 'Can add token', 13, 'add_tokenproxy'),
(50, 'Can change token', 13, 'change_tokenproxy'),
(51, 'Can delete token', 13, 'delete_tokenproxy'),
(52, 'Can view token', 13, 'view_tokenproxy');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$4iTUD0fccgkc$poePpetCbYS4TM9qib6alr5RWsqDD9uPOdMkx9GRH4s=', '2021-01-24 15:27:53.513353', 1, 'admin', '', '', 'admin@carrental.pl', 1, 1, '2021-01-24 11:48:02.226955'),
(2, 'pbkdf2_sha256$216000$fL9XYDKnpNG5$4I/zUQfsMdPHSgza8ZCz6TtoHQz2BhsZ9n7X3/8t5mE=', '2021-01-24 15:41:37.392954', 0, 'pracownik1', '', '', 'rutkowski@carrental.pl', 0, 1, '2021-01-24 13:42:49.053453'),
(3, 'pbkdf2_sha256$216000$ykjvsquQfj7b$PZKvO/I8VO+0wU3QA0N2ShPBgkpV/zmqlzB4ccUjTWg=', NULL, 0, 'pracownik2', '', '', 'olszewski@carrental.pl', 0, 1, '2021-01-24 13:43:47.680591'),
(4, 'pbkdf2_sha256$216000$edLdCgsjjIO9$EYWtgugqiiWe7HbvBCEQy3j9Xim2W83EymBwsI8KQL8=', NULL, 0, 'pracownik3', '', '', 'ostrowska@carrental.pl', 0, 1, '2021-01-24 13:45:14.377402'),
(5, 'pbkdf2_sha256$216000$cUe17FFahD4L$pYv7Zk7fyDXy6PNoMPzeE8iSbg43dJxRAmKrxFkDPPI=', NULL, 0, 'pracownik4', '', '', 'pawlak@carrental.pl', 0, 1, '2021-01-24 13:46:15.670285'),
(6, 'pbkdf2_sha256$216000$AsPVOgvfj683$WFHA+ryoggMTsS/S293uYNSG71LI7KCCrGV0Noftyzw=', NULL, 0, 'pracownik5', '', '', 'jaworowski@carrental.pl', 0, 1, '2021-01-24 13:48:00.304267'),
(7, 'pbkdf2_sha256$216000$jjyoVLOKsFTj$YbeHWjcg6x5iYBpzsFKkbgd7q+q1PmAOGj2IWl+UNXs=', NULL, 0, 'pracownik6', '', '', 'wieczorek@carrental.pl', 0, 1, '2021-01-24 13:49:44.872587'),
(8, 'pbkdf2_sha256$216000$nguhJk24kzMw$QhNiDDBTAenKWdeM+v5aytAe3MakBdSJ+1zV45CDp6I=', NULL, 0, 'pracownik7', '', '', 'kowalczyk@carrental.pl', 0, 1, '2021-01-24 13:51:01.207256'),
(9, 'pbkdf2_sha256$216000$WKdJb9eYRjnH$6Iv//CGcMRF8LffZvyfiDShnenp1gOpKOv2QgLJy36Q=', NULL, 0, 'pracownik8', '', '', 'duda@carrental.pl', 0, 1, '2021-01-24 13:51:52.414358'),
(10, 'pbkdf2_sha256$216000$S6doEa5j8BbF$/I8sj6t/zw09RW+09JDZSqwjKWJlj496pOWkSQaJot4=', NULL, 0, 'pracownik9', '', '', 'kucharska@carrental.pl', 0, 1, '2021-01-24 13:53:01.238480'),
(15, 'pbkdf2_sha256$216000$zTtWAxYVB8CW$bBan7s/suuNHMC3VYHt/Gx47oQD9EzvYbbIGolnF0o0=', '2021-01-24 15:41:25.047959', 0, 'pracownik10', '', '', 'grabkowski@carrental.pl', 0, 1, '2021-01-24 15:36:41.541981');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `car_rental_address`
--

CREATE TABLE `car_rental_address` (
  `id` int(11) NOT NULL,
  `street` varchar(60) NOT NULL,
  `postal_code` varchar(6) NOT NULL,
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_rental_address`
--

INSERT INTO `car_rental_address` (`id`, `street`, `postal_code`, `city`) VALUES
(1, 'Baczyńskiego 19', '42-500', 'Będzin'),
(2, 'Lublańska 27', '31-476', 'Kraków'),
(3, 'Roślinna 150', '20-516', 'Lublin'),
(6, 'Ciepła 105', '15-471', 'Białystok'),
(7, 'Powojowa 150', '31-985', 'Kraków'),
(8, 'Odolańska 145', '02-560', 'Warszawa'),
(9, 'Szwajcarska 146', '61-285', 'Poznań'),
(10, 'Bazyliowa 72 City', '81-589', 'Gdynia'),
(11, 'Lisia 128', '42-400', 'Zawiercie'),
(12, 'Świeża 2', '03-440', 'Warszawa'),
(13, 'Urzędnicza 63', '25-729', 'Kielce'),
(14, 'Czarnieckiego 78', '25-136', 'Kielce'),
(15, 'Budowlana 98', '93-356', 'Łódź'),
(16, 'Poprzeczna 63', '80-432', 'Gdańsk'),
(17, 'Jeziorko 74', '25-803', 'Kielce'),
(18, 'Zwycięstwa 29', '75-027', 'Koszalin'),
(19, 'Jodłowa 15', '80-633', 'Gdańsk'),
(20, 'Piskląt 123', '03-001', 'Warszawa'),
(21, 'Cieszyńska 113', '43-303', 'Bielsko-Biała'),
(22, 'Świętojańska 140', '45-427', 'Opole'),
(23, 'Pocztowa 59', '05-070', 'Sulejówek'),
(24, 'Zbożowa 14', '40-657', 'Katowice'),
(25, 'Wydawnicza 140', '04-601', 'Warszawa'),
(26, 'Kalinowa 22', '91-348', 'Łódź'),
(27, 'Gołębia 63', '26-610', 'Radom'),
(29, 'Makowa 137', '10-849', 'Olsztyn'),
(30, 'Energetyczna 119', '53-330', 'Wrocław'),
(31, 'Jałowcowa 39', '61-472', 'Poznań'),
(32, 'Wejherowska 127', '81-051', 'Gdynia'),
(33, 'Czwartków 107', '81-115', 'Gdynia');

-- --------------------------------------------------------

--
-- Table structure for table `car_rental_car`
--

CREATE TABLE `car_rental_car` (
  `id` int(11) NOT NULL,
  `registration_number` varchar(8) NOT NULL,
  `vin` varchar(17) NOT NULL,
  `brand` varchar(15) NOT NULL,
  `model` varchar(45) NOT NULL,
  `production_year` int(11) NOT NULL,
  `color` varchar(15) NOT NULL,
  `car_status` varchar(15) NOT NULL,
  `daily_cost_of_rent` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_rental_car`
--

INSERT INTO `car_rental_car` (`id`, `registration_number`, `vin`, `brand`, `model`, `production_year`, `color`, `car_status`, `daily_cost_of_rent`) VALUES
(1, 'CCH1019', 'PN8AVBX17RN0F1119', 'Hyundai', 'i30', 2018, 'czarny', 'available', 480),
(2, 'ONY0248', '1NUBRK2605HA72796', 'Fiat', '500', 2017, 'czerwony', 'available', 450),
(3, 'NKE2825', 'VF8BNYMH2GL0Y4954', 'Nissan', 'Qashqai', 2014, 'biały', 'available', 750),
(4, 'BKL3847', '8AD9L2242CWEX9084', 'Volkswagen', 'Passat', 2020, 'niebieski', 'available', 1000),
(5, 'GKW4041', 'LBEN05311GXSK4349', 'Suzuki', 'Vitara', 2020, 'szary', 'available', 650),
(6, 'POT0615', 'XTB50FF88SSRM7757', 'Toyota', 'Corolla', 2021, 'srebrny', 'available', 1000),
(7, 'LOP0494', '1ZVPAPR06Z02M5435', 'Opel', 'Insignia', 2017, 'czarny', 'available', 1100),
(8, 'ZSD8528', '8ATXL0RM5SMWZ9249', 'Mazda', '6', 2018, 'czerwony', 'available', 1150),
(9, 'GBY6992', '4S6N675H3DZVR0498', 'Volvo', 'XC60', 2021, 'brązowy', 'available', 1500),
(10, 'PKN5218', 'WP0F0KLT2UPZ37599', 'Audi', 'A6 Avant', 2019, 'srebrny', 'available', 1650),
(11, 'FSD6490', 'YV1011U89KGY66528', 'Audi', 'A6', 2019, 'czarny', 'available', 2000),
(12, 'CZN8507', 'VSSMRXR22LS2H6073', 'Merceders-Benz', 'E-class', 2020, 'srebrny', 'available', 2450),
(13, 'ELC9646', 'PMHV69W10BEWT9015', 'Fiat', '126p', 1980, 'czerwony', 'available', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `car_rental_client`
--

CREATE TABLE `car_rental_client` (
  `id` int(11) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_number` varchar(9) NOT NULL,
  `address_id_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_rental_client`
--

INSERT INTO `car_rental_client` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `address_id_address_id`) VALUES
(1, 'Janek', 'Kowalski', 'jkowalski@email.pl', '692481175', 1),
(2, 'Ryszard', 'Piotrowski', 'rpiotrowski@email.pl', '512380063', 2),
(3, 'Alojzy', 'Jaworski', 'ajaworski@email.pl', '603003143', 3),
(4, 'Ksenia', 'Nowakowska', 'knowakowska@email.pl', '655443187', 6),
(5, 'Józef', 'Wiśniewski', 'jwisniewski@email.pl', '721327701', 7),
(6, 'Jarek', 'Adamski', 'jadamski@email.pl', '695990419', 8),
(7, 'Anastazja', 'Walczak', 'awalczak@email.pl', '725785861', 9),
(8, 'Patryk', 'Szymański', 'pszymanski@email.pl', '785204631', 10),
(9, 'Klaudia', 'Piotrowska', 'kpiotrowska@email.pl', '887726587', 11),
(10, 'Emilia', 'Sokołowska', 'esokolowska@email.pl', '665109921', 12),
(11, 'Dagmara', 'Rutkowska', 'drutkowska@email.pl', '538316449', 13),
(12, 'Darek', 'Dudek', 'ddudek@email.pl', '664658047', 14),
(13, 'Marlena', 'Czerwińska', 'mczerwinska@email.pl', '535308674', 15),
(14, 'Judyta', 'Pawłowska', 'jpawlowska@email.pl', '724442469', 16),
(15, 'Maria', 'Pawłowska', 'mpawlowska@email.pl', '737389955', 17),
(16, 'Ewa', 'Nowak', 'enowak@email.pl', '789459360', 18),
(17, 'Radochna', 'Woźniak', 'rwozniak@email.pl', '782732956', 19),
(18, 'Kaja', 'Kowalska', 'kkowalska@email.pl', '664547564', 20),
(19, 'Jowita', 'Nowakowska', 'jnowakowska@email.pl', '799723353', 21),
(20, 'Błażej', 'Kozłowski', 'bkozlowski@email.pl', '616737999', 22);

-- --------------------------------------------------------

--
-- Table structure for table `car_rental_employee`
--

CREATE TABLE `car_rental_employee` (
  `id` int(11) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `phone_number` varchar(9) NOT NULL,
  `title` varchar(20) NOT NULL,
  `address_id_address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_rental_employee`
--

INSERT INTO `car_rental_employee` (`id`, `first_name`, `last_name`, `phone_number`, `title`, `address_id_address_id`, `user_id`) VALUES
(1, 'Mirosław', 'Rutkowski', '724576151', 'manager', 23, 2),
(2, 'Miron', 'Olszewski', '791868637', 'consultant', 24, 3),
(3, 'Gabrysia', 'Ostrowska', '881579560', 'consultant', 25, 4),
(4, 'Marcin', 'Pawlak', '736374429', 'consultant', 26, 5),
(5, 'Krystian', 'Jaworowski', '679163291', 'consultant', 29, 6),
(6, 'Gabriela', 'Wieczorek', '609962045', 'consultant', 30, 7),
(7, 'Krystian', 'Kowalczyk', '886304806', 'service technician', 31, 8),
(8, 'Walery', 'Duda', '796665218', 'service technician', 32, 9),
(9, 'Elżbieta', 'Kucharska', '975831573', 'service technician', 33, 10),
(14, 'Krystyn', 'Grabowski', '615748885', 'manager', 21, 15);

-- --------------------------------------------------------

--
-- Table structure for table `car_rental_rent`
--

CREATE TABLE `car_rental_rent` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_cost_of_rent` double NOT NULL,
  `car_id_car_id` int(11) NOT NULL,
  `client_id_client_id` int(11) NOT NULL,
  `employee_id_employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_rental_rent`
--

INSERT INTO `car_rental_rent` (`id`, `start_date`, `end_date`, `total_cost_of_rent`, `car_id_car_id`, `client_id_client_id`, `employee_id_employee_id`) VALUES
(1, '2021-01-25', '2021-01-27', 960, 1, 1, 2),
(2, '2021-01-27', '2021-01-31', 12000, 13, 1, 5),
(3, '2021-01-22', '2021-01-27', 6000, 11, 16, 6),
(4, '2021-01-28', '2021-01-30', 4900, 12, 18, 5),
(5, '2021-02-03', '2021-02-06', 4500, 9, 20, 2),
(6, '2021-01-21', '2021-01-22', 1000, 6, 16, 5),
(7, '2021-01-21', '2021-01-22', 1000, 6, 16, 5),
(8, '2021-02-18', '2021-02-24', 9900, 10, 17, 5),
(9, '2021-02-02', '2021-02-06', 2600, 5, 12, 6),
(10, '2021-03-03', '2021-03-07', 4400, 7, 10, 5),
(11, '2021-03-10', '2021-03-19', 4050, 2, 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-01-24 15:28:08.482501', '13', 'jakis_random2', 3, '', 4, 1),
(2, '2021-01-24 15:28:12.874538', '14', 'jakis_random3', 3, '', 4, 1),
(3, '2021-01-24 15:28:19.893420', '12', 'pracownik_pierwszy', 3, '', 4, 1),
(4, '2021-01-24 15:33:11.971392', '2', 'pracownik1', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(5, '2021-01-24 15:33:35.715841', '3', 'pracownik2', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(6, '2021-01-24 15:33:46.097853', '4', 'pracownik3', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(7, '2021-01-24 15:33:56.464396', '5', 'pracownik4', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(8, '2021-01-24 15:34:04.704451', '6', 'pracownik5', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(9, '2021-01-24 15:34:14.853436', '7', 'pracownik6', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(10, '2021-01-24 15:34:27.358619', '8', 'pracownik7', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(11, '2021-01-24 15:34:35.847692', '9', 'pracownik8', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(12, '2021-01-24 15:34:44.547498', '10', 'pracownik9', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(12, 'authtoken', 'token'),
(13, 'authtoken', 'tokenproxy'),
(7, 'car_rental', 'address'),
(8, 'car_rental', 'car'),
(9, 'car_rental', 'client'),
(10, 'car_rental', 'employee'),
(11, 'car_rental', 'rent'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-01-24 11:46:43.798750'),
(2, 'auth', '0001_initial', '2021-01-24 11:46:44.081704'),
(3, 'admin', '0001_initial', '2021-01-24 11:46:44.670564'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-01-24 11:46:44.817622'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-01-24 11:46:44.825622'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-01-24 11:46:44.904700'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-01-24 11:46:44.978291'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-01-24 11:46:44.997295'),
(9, 'auth', '0004_alter_user_username_opts', '2021-01-24 11:46:45.004297'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-01-24 11:46:45.069505'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-01-24 11:46:45.072506'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-01-24 11:46:45.079511'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-01-24 11:46:45.097286'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-01-24 11:46:45.113956'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-01-24 11:46:45.131969'),
(16, 'auth', '0011_update_proxy_permissions', '2021-01-24 11:46:45.139964'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-01-24 11:46:45.160963'),
(18, 'authtoken', '0001_initial', '2021-01-24 11:46:45.200972'),
(19, 'authtoken', '0002_auto_20160226_1747', '2021-01-24 11:46:45.384032'),
(20, 'authtoken', '0003_tokenproxy', '2021-01-24 11:46:45.388020'),
(21, 'car_rental', '0001_initial', '2021-01-24 11:46:45.549280'),
(22, 'car_rental', '0002_auto_20210118_1310', '2021-01-24 11:46:45.993984'),
(23, 'car_rental', '0003_auto_20210123_1305', '2021-01-24 11:46:46.128854'),
(24, 'car_rental', '0004_auto_20210123_1314', '2021-01-24 11:46:46.219912'),
(25, 'car_rental', '0005_auto_20210123_1442', '2021-01-24 11:46:46.376270'),
(26, 'sessions', '0001_initial', '2021-01-24 11:46:46.422281'),
(27, 'car_rental', '0006_auto_20210124_1253', '2021-01-24 11:53:14.723815');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('w1uynxq6e8dsnwle4l99juasndzgwjt8', '.eJxVjEEOwiAQRe_C2hBGygx16b5nIDCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrcHMVFgDj9bsHzI9UdxLuvtya51XWZg9wVedAupxbT83q4fwfF9_KttdZGh8FQHj3ngMAElJgBwoiJrNI-DYQKA9pzRrYxA6ElNBYwKiveH9VTNyw:1l3dtL:es8nzA5AlT6iup8TLNcLFpifbNX4NS_xfiFom-WqrlA', '2021-02-07 11:49:15.733419');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `car_rental_address`
--
ALTER TABLE `car_rental_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_rental_car`
--
ALTER TABLE `car_rental_car`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_rental_client`
--
ALTER TABLE `car_rental_client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_rental_client_address_id_address_i_f387b031_fk_car_renta` (`address_id_address_id`);

--
-- Indexes for table `car_rental_employee`
--
ALTER TABLE `car_rental_employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `car_rental_employee_address_id_address_i_d0541fbd_fk_car_renta` (`address_id_address_id`);

--
-- Indexes for table `car_rental_rent`
--
ALTER TABLE `car_rental_rent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_rental_rent_car_id_car_id_2fc78289_fk_car_rental_car_id` (`car_id_car_id`),
  ADD KEY `car_rental_rent_client_id_client_id_956d124a_fk_car_renta` (`client_id_client_id`),
  ADD KEY `car_rental_rent_employee_id_employee_ca58ee5e_fk_car_renta` (`employee_id_employee_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car_rental_address`
--
ALTER TABLE `car_rental_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `car_rental_car`
--
ALTER TABLE `car_rental_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `car_rental_client`
--
ALTER TABLE `car_rental_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `car_rental_employee`
--
ALTER TABLE `car_rental_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `car_rental_rent`
--
ALTER TABLE `car_rental_rent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `car_rental_client`
--
ALTER TABLE `car_rental_client`
  ADD CONSTRAINT `car_rental_client_address_id_address_i_f387b031_fk_car_renta` FOREIGN KEY (`address_id_address_id`) REFERENCES `car_rental_address` (`id`);

--
-- Constraints for table `car_rental_employee`
--
ALTER TABLE `car_rental_employee`
  ADD CONSTRAINT `car_rental_employee_address_id_address_i_d0541fbd_fk_car_renta` FOREIGN KEY (`address_id_address_id`) REFERENCES `car_rental_address` (`id`),
  ADD CONSTRAINT `car_rental_employee_user_id_0eb18670_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `car_rental_rent`
--
ALTER TABLE `car_rental_rent`
  ADD CONSTRAINT `car_rental_rent_car_id_car_id_2fc78289_fk_car_rental_car_id` FOREIGN KEY (`car_id_car_id`) REFERENCES `car_rental_car` (`id`),
  ADD CONSTRAINT `car_rental_rent_client_id_client_id_956d124a_fk_car_renta` FOREIGN KEY (`client_id_client_id`) REFERENCES `car_rental_client` (`id`),
  ADD CONSTRAINT `car_rental_rent_employee_id_employee_ca58ee5e_fk_car_renta` FOREIGN KEY (`employee_id_employee_id`) REFERENCES `car_rental_employee` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
