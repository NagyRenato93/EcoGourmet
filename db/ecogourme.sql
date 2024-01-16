-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Jan 16. 07:21
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `ecogourme`
--

DELIMITER $$
--
-- Függvények
--
CREATE DEFINER=`root`@`localhost` FUNCTION `BASE64_ENCODE` (`textIn` LONGBLOB) RETURNS LONGTEXT CHARSET utf8mb4 COLLATE utf8mb4_general_ci NO SQL BEGIN
/*
	Convert blob to base64 text, remove start, end spaces,
	newline, carriage return, and tab characters from text 
*/
DECLARE textOut LONGTEXT CHARSET utf8mb4 DEFAULT '';
IF (textIn IS NOT NULL) THEN
	SET textOut = TO_BASE64(textIn);
    SET textOut = TRIM(textOut);
    IF (LENGTH(textOut) > 0) THEN
    	SET textOut = REPLACE(textOut,"\n","");
    	SET textOut = REPLACE(textOut,"\r","");
    	SET textOut = REPLACE(textOut,"\t","");
    END IF;
END IF;
RETURN textOut;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aboutus_text`
--

CREATE TABLE `aboutus_text` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `aboutus_text`
--

INSERT INTO `aboutus_text` (`id`, `title`, `description`, `image`) VALUES
(1, 'about_title_1', 'about_text_1', './media/image/ffood1.jpeg'),
(2, 'about_title_2', 'about_text_2', './media/image/tree1.jpeg'),
(3, 'about_title_3', 'about_text_3', './media/image/enjoy1.jpeg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ecogourmet_services`
--

CREATE TABLE `ecogourmet_services` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `ecogourmet_services`
--

INSERT INTO `ecogourmet_services` (`id`, `title`, `description`) VALUES
(1, 'Innovatív Ételtervezés, Gondtalan Konyhai Élmény', 'Felejtse el a konyhai aggodalmakat és hagyja, hogy az EcoGourmet innovatív ételtervezése megkönnyítse az egészséges és kiegyensúlyozott étkezést. Szakácsaink minden nap friss és ízletes ételeket készítenek, így Önnek csupán az étel élvezetére kell összpontosítania.'),
(2, 'Napi Menük: Egyszerű Döntések, Kiemelkedő Ízek', 'Válassza napi menüinket, ahol minden ételhez részletes leírás társul, hogy egyszerű döntésekkel és garantáltan ízletes fogásokkal tegyük teljessé mindennapi étkezéseit. Az EcoGourmetnél az ételválasztás egyszerű és élvezetes élmény.'),
(3, 'Kulináris Élmények Kalóriák Nélkül', 'Az EcoGourmet konyhájában minden receptet úgy alkottunk meg, hogy garantálja az ízletes kulináris élményt anélkül, hogy aggódna a fölösleges kalóriák miatt. Egészséges és finom ételeinkkel biztos lehet benne, hogy élvezetes étkezésekkel díszítjük mindennapjait.'),
(4, 'EcoGourmet: Tudatos Konyha, Fenntartható Ízek', 'Az EcoGourmet nem pusztán ételszolgáltató, hanem egy tudatos konyha, ahol az ízek mellett a fenntarthatóság is főszerepet kap. Környezetbarát alapanyagaink és a fenntartható étkezési megoldásaink révén arra törekszünk, hogy az ételeink ne csak finomak, hanem környezetbarátok is legyenek, mert hisszük, hogy a jó ízeknek és a felelős étkezésnek nem kell ellentmondaniuk.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eco_gourmet_awards_achievements`
--

CREATE TABLE `eco_gourmet_awards_achievements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `eco_gourmet_awards_achievements`
--

INSERT INTO `eco_gourmet_awards_achievements` (`id`, `title`, `description`, `date`) VALUES
(1, 'award_title_1', 'award_text_1', '2022-01-15'),
(2, 'award_title_2', 'award_text_2', '2022-03-10'),
(3, 'award_title_3', 'award_text_3', '2022-06-20'),
(4, 'award_title_4', 'award_text_4', '2022-08-05'),
(5, 'award_title_5', 'award_text_5', '2022-10-15');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`) VALUES
(2, 'faq_q2', 'faq_a2'),
(3, 'faq_q3', 'faq_a3'),
(4, 'faq_q4', 'faq_a4'),
(5, 'faq_q5', 'faq_a5'),
(6, 'faq_q6', 'faq_a6');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `kategoria` varchar(50) NOT NULL,
  `leiras` text DEFAULT NULL,
  `hozzavalok` varchar(250) NOT NULL,
  `elkeszites` text DEFAULT NULL,
  `fozesi_ido` int(11) DEFAULT NULL,
  `kep` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `recipes`
--

INSERT INTO `recipes` (`id`, `nev`, `kategoria`, `leiras`, `hozzavalok`, `elkeszites`, `fozesi_ido`, `kep`) VALUES
(1, 'recipe_nev_1', 'recipe_kategoria_1', 'recipe_leiras_1', 'recipe_hozza_1', 'recipe_elkeszites_1', 10, './media/image/recipes/egg.jpg'),
(2, 'recipe_nev_2', 'recipe_kategoria_1', 'recipe_leiras_2', 'recipe_hozza_2', 'recipe_elkeszites_2', 15, './media/image/recipes/oatmeal.jpg'),
(3, 'recipe_nev_3', 'recipe_kategoria_1', 'recipe_leiras_3', 'recipe_hozza_3', 'recipe_elkeszites_3', 5, './media/image/recipes/yoghurt.jpg'),
(4, 'recipe_nev_4', 'recipe_kategoria_2', 'recipe_leiras_4', 'recipe_hozza_4', 'recipe_elkeszites_4', 30, './media/image/recipes/chicken.jpg'),
(5, 'recipe_nev_5', 'recipe_kategoria_2', 'recipe_leiras_5', 'recipe_hozza_5', 'recipe_elkeszites_5', 40, './media/image/recipes/lentil.jpg'),
(6, 'recipe_nev_6', 'recipe_kategoria_2', 'recipe_leiras_6', 'recipe_hozza_6', 'recipe_elkeszites_6', 25, './media/image/recipes/salmon.jpg'),
(7, 'recipe_nev_7', 'recipe_kategoria_3', 'recipe_leiras_7', 'recipe_hozza_7', 'recipe_elkeszites_7', 45, './media/image/recipes/cannelloni.jpeg'),
(8, 'recipe_nev_8', 'recipe_kategoria_3', 'recipe_leiras_8', 'recipe_hozza_8', 'recipe_elkeszites_8', 35, './media/image/recipes/eggplant.jpg'),
(9, 'recipe_nev_9', 'recipe_kategoria_3', 'recipe_leiras_9', 'recipe_hozza_9', 'recipe_elkeszites_9', 60, './media/image/recipes/beef.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `termek_id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `ar_forint` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `subscription_plans`
--

INSERT INTO `subscription_plans` (`termek_id`, `nev`, `description`, `duration`, `ar_forint`) VALUES
(1, 'Simple', 'plan_desc_1', 2, 5000),
(2, 'Pro', 'plan_desc_2', 3, 9000),
(3, 'Enterprise', 'plan_desc_3', 6, 18000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termek`
--

CREATE TABLE `termek` (
  `termek_id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `kategoria` varchar(50) NOT NULL,
  `leiras` text NOT NULL,
  `ar_forint` int(11) NOT NULL,
  `kep_eleresi_ut` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `termek`
--

INSERT INTO `termek` (`termek_id`, `nev`, `kategoria`, `leiras`, `ar_forint`, `kep_eleresi_ut`) VALUES
(1, 'prod_nev_1', 'prod_kategoria_1', 'prod_leiras_1', 8000, './media/image/termek/0.jpeg\n'),
(2, 'prod_nev_2', 'prod_kategoria_1', 'prod_leiras_2', 10000, './media/image/termek/1.jpeg\n'),
(3, 'prod_nev_3', 'prod_kategoria_1', 'prod_leiras_3', 12000, './media/image/termek/2.jpeg\n'),
(4, 'prod_nev_4', 'prod_kategoria_1', 'prod_leiras_4', 15000, './media/image/termek/3.jpeg\n'),
(5, 'prod_nev_5', 'prod_kategoria_2', 'prod_leiras_5', 12000, './media/image/termek/9.jpeg\n'),
(6, 'prod_nev_6', 'prod_kategoria_2', 'prod_leiras_6', 15000, './media/image/termek/10.jpeg\n'),
(7, 'prod_nev_7', 'prod_kategoria_2', 'prod_leiras_7', 13000, './media/image/termek/11.jpeg\n'),
(8, 'prod_nev_8', 'prod_kategoria_2', 'prod_leiras_8', 12000, './media/image/termek/12.jpeg\n'),
(9, 'prod_nev_9', 'prod_kategoria_3', 'prod_leiras_9', 15000, './media/image/termek/13.jpeg\n'),
(10, 'prod_nev_10', 'prod_kategoria_3', 'prod_leiras_10', 13000, './media/image/termek/14.jpeg\n'),
(11, 'prod_nev_11', 'prod_kategoria_3', 'prod_leiras_11', 18000, './media/image/termek/15.jpeg\n'),
(12, 'prod_nev_12', 'prod_kategoria_3', 'prod_leiras_12', 16000, './media/image/termek/18.jpeg\n');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `kep_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `description`, `kep_url`) VALUES
(1, 'Zsófia', 'testimonial_desc_1', './media/image/zsofia.jpeg'),
(2, 'Péter', 'testimonial_desc_2', './media/image/peter.jpeg'),
(3, 'Anna', 'testimonial_desc_3', './media/image/anna.jpeg'),
(5, 'Klára', 'testimonial_desc_5', './media/image/klara.jpeg'),
(6, 'Tamás', 'testimonial_desc_6', './media/image/tamas.jpeg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `type`
--

CREATE TABLE `type` (
  `id` char(1) NOT NULL,
  `type` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `type`
--

INSERT INTO `type` (`id`, `type`, `name`) VALUES
('F', 'GENDER', 'female'),
('M', 'GENDER', 'male'),
('A', 'USER', 'administrator'),
('G', 'USER', 'guest'),
('N', 'USER', 'not_verified'),
('U', 'USER', 'user');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_plans`
--

CREATE TABLE `user_plans` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `termek_id` int(11) NOT NULL,
  `ar_forint` int(11) NOT NULL,
  `expire` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `user_plans`
--

INSERT INTO `user_plans` (`id`, `user_id`, `termek_id`, `ar_forint`, `expire`) VALUES
(1, 1, 3, 18000, '2024-06-20'),
(2, 1, 1, 5000, '2024-02-20'),
(3, 1, 2, 9000, '2024-03-20'),
(4, 1, 3, 18000, '2024-06-20'),
(5, 1, 1, 5000, '2024-02-20'),
(6, 2, 2, 9000, '2024-03-30'),
(7, 2, 1, 5000, '2024-03-01'),
(8, 2, 3, 18000, '2024-07-14'),
(9, 2, 3, 18000, '2024-07-14'),
(10, 2, 1, 5000, '2024-03-14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vasarlasok`
--

CREATE TABLE `vasarlasok` (
  `vasarlas_id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `datum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `vasarlasok`
--

INSERT INTO `vasarlasok` (`vasarlas_id`, `user_id`, `datum`) VALUES
(1, 1, '2023-12-12 19:03:21'),
(2, 1, '2023-12-12 19:31:20'),
(3, 2, '2023-12-19 16:36:50'),
(4, 2, '2023-12-19 16:37:19'),
(5, 2, '2023-12-19 16:54:49'),
(6, 2, '2023-12-19 17:36:11'),
(7, 2, '2023-12-19 17:36:42'),
(8, 2, '2023-12-19 17:47:30'),
(9, 1, '2023-12-20 16:50:37'),
(10, 1, '2023-12-20 19:15:58'),
(11, 1, '2023-12-20 19:19:17'),
(12, 1, '2023-12-20 19:23:14'),
(13, 1, '2023-12-20 19:24:52'),
(14, 1, '2023-12-20 19:25:58'),
(15, 1, '2023-12-20 19:27:20'),
(16, 1, '2023-12-20 19:30:27'),
(17, 1, '2023-12-20 19:32:38'),
(18, 2, '2023-12-30 23:08:27'),
(19, 2, '2024-01-02 22:32:24'),
(20, 2, '2024-01-03 01:02:33'),
(21, 2, '2024-01-09 01:49:29'),
(22, 2, '2024-01-09 02:02:33'),
(23, 2, '2024-01-13 18:33:24'),
(24, 2, '2024-01-13 18:33:52'),
(25, 2, '2024-01-13 18:34:18'),
(26, 2, '2024-01-13 18:34:24'),
(27, 2, '2024-01-13 18:43:48'),
(28, 2, '2024-01-13 18:45:21'),
(29, 2, '2024-01-14 02:18:33'),
(30, 2, '2024-01-14 10:48:16'),
(31, 2, '2024-01-14 10:52:45'),
(32, 2, '2024-01-14 10:53:32'),
(33, 2, '2024-01-14 10:53:55'),
(34, 2, '2024-01-14 10:54:25'),
(35, 2, '2024-01-14 10:55:31'),
(36, 2, '2024-01-14 10:58:18'),
(37, 2, '2024-01-14 11:00:13'),
(38, 2, '2024-01-14 11:01:14'),
(39, 2, '2024-01-14 11:04:23'),
(40, 2, '2024-01-14 11:05:33'),
(41, 2, '2024-01-14 11:06:32'),
(42, 2, '2024-01-14 11:07:26'),
(43, 2, '2024-01-14 11:08:44'),
(44, 2, '2024-01-14 11:09:25'),
(45, 2, '2024-01-14 11:11:37'),
(46, 2, '2024-01-14 11:12:50'),
(47, 2, '2024-01-14 11:13:45'),
(48, 2, '2024-01-14 11:14:12'),
(49, 2, '2024-01-14 11:15:58'),
(50, 2, '2024-01-14 11:16:25'),
(51, 2, '2024-01-14 11:16:55'),
(52, 2, '2024-01-14 11:17:02'),
(53, 2, '2024-01-14 11:17:10'),
(54, 2, '2024-01-14 11:17:16'),
(55, 2, '2024-01-14 11:18:31'),
(56, 2, '2024-01-14 11:19:13'),
(57, 2, '2024-01-14 11:20:29'),
(58, 2, '2024-01-14 11:20:53'),
(59, 2, '2024-01-14 11:21:09'),
(60, 2, '2024-01-14 11:21:18'),
(61, 2, '2024-01-14 11:22:08'),
(62, 2, '2024-01-14 11:23:24'),
(63, 2, '2024-01-14 11:23:30'),
(64, 2, '2024-01-14 11:24:59'),
(65, 2, '2024-01-14 11:26:36'),
(66, 2, '2024-01-14 11:28:48'),
(67, 2, '2024-01-14 11:28:58'),
(68, 2, '2024-01-14 11:29:22'),
(69, 2, '2024-01-14 11:29:59'),
(70, 2, '2024-01-14 11:30:07'),
(71, 2, '2024-01-14 11:30:18'),
(72, 2, '2024-01-14 11:31:09'),
(73, 2, '2024-01-14 11:32:31'),
(74, 2, '2024-01-14 11:32:36'),
(75, 2, '2024-01-14 11:32:41'),
(76, 2, '2024-01-14 11:32:46'),
(77, 2, '2024-01-14 11:32:52'),
(78, 2, '2024-01-14 11:33:00'),
(79, 2, '2024-01-14 11:34:14'),
(80, 2, '2024-01-14 11:34:29'),
(81, 2, '2024-01-14 11:35:40'),
(82, 2, '2024-01-14 11:36:54'),
(83, 2, '2024-01-14 11:41:21'),
(84, 2, '2024-01-14 11:42:21'),
(85, 2, '2024-01-14 11:43:59'),
(86, 2, '2024-01-14 11:44:17'),
(87, 2, '2024-01-14 11:48:12'),
(88, 2, '2024-01-15 14:31:42'),
(89, 2, '2024-01-15 17:40:14'),
(90, 2, '2024-01-16 05:09:36');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vasarlasok_tetel`
--

CREATE TABLE `vasarlasok_tetel` (
  `tetel_id` int(11) NOT NULL,
  `vasarlas_id` int(11) NOT NULL,
  `termek_id` int(11) NOT NULL,
  `mennyiseg` int(11) NOT NULL,
  `ar_forint` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `vasarlasok_tetel`
--

INSERT INTO `vasarlasok_tetel` (`tetel_id`, `vasarlas_id`, `termek_id`, `mennyiseg`, `ar_forint`) VALUES
(1, 1, 1, 3, 2000),
(2, 1, 2, 22, 1800),
(3, 2, 1, 3, 2000),
(4, 2, 4, 2, 2100),
(5, 2, 6, 2, 2150),
(6, 3, 1, 5, 2000),
(7, 4, 1, 4, 2000),
(8, 5, 1, 5, 2000),
(9, 5, 2, 2, 1800),
(10, 6, 2, 7, 1800),
(11, 7, 2, 1, 1800),
(12, 8, 2, 3, 1800),
(13, 8, 1, 5, 2000),
(14, 9, 3, 1, 18000),
(15, 12, 3, 4, 2200),
(16, 12, 2, 4, 1800),
(17, 13, 3, 4, 2200),
(18, 13, 2, 4, 1800),
(19, 14, 3, 4, 2200),
(20, 14, 2, 4, 1800),
(21, 15, 3, 4, 2200),
(22, 15, 2, 4, 1800),
(23, 16, 1, 1, 2000),
(24, 16, 2, 3, 1800),
(25, 16, 6, 1, 2150),
(26, 16, 4, 3, 2100),
(27, 17, 5, 1, 1900),
(28, 18, 3, 11, 2200),
(29, 19, 4, 5, 15000),
(30, 20, 4, 1, 15000),
(31, 21, 3, 3, 12000),
(32, 22, 12, 1, 16000),
(33, 23, 2, 2, 10000),
(34, 24, 2, 4, 10000),
(35, 25, 2, 4, 10000),
(36, 26, 3, 4, 12000),
(37, 27, 3, 3, 12000),
(38, 28, 3, 3, 12000),
(39, 28, 12, 1, 16000),
(40, 29, 3, 1, 12000),
(41, 30, 2, 1, 10000),
(42, 31, 2, 2, 10000),
(43, 32, 2, 1, 10000),
(44, 33, 2, 6, 10000),
(45, 34, 2, 2, 10000),
(46, 35, 2, 4, 10000),
(47, 36, 3, 2, 12000),
(48, 37, 2, 1, 10000),
(49, 37, 3, 1, 12000),
(50, 38, 2, 1, 10000),
(51, 38, 3, 1, 12000),
(52, 39, 3, 1, 12000),
(53, 40, 2, 1, 10000),
(54, 41, 2, 1, 10000),
(55, 41, 1, 1, 8000),
(56, 42, 2, 1, 10000),
(57, 43, 2, 1, 10000),
(58, 44, 3, 1, 12000),
(59, 45, 2, 1, 10000),
(60, 45, 3, 1, 12000),
(61, 46, 2, 1, 10000),
(62, 46, 3, 1, 12000),
(63, 47, 2, 1, 10000),
(64, 47, 3, 1, 12000),
(65, 48, 2, 1, 10000),
(66, 48, 3, 1, 12000),
(67, 49, 2, 1, 10000),
(68, 50, 3, 1, 12000),
(69, 50, 2, 1, 10000),
(70, 51, 2, 1, 10000),
(71, 51, 3, 1, 12000),
(72, 52, 3, 1, 12000),
(73, 53, 3, 1, 12000),
(74, 53, 4, 1, 15000),
(75, 54, 4, 1, 15000),
(76, 54, 3, 1, 12000),
(77, 54, 2, 1, 10000),
(78, 55, 2, 1, 10000),
(79, 55, 3, 1, 12000),
(80, 56, 3, 1, 12000),
(81, 56, 2, 1, 10000),
(82, 57, 3, 1, 12000),
(83, 58, 4, 1, 15000),
(84, 58, 3, 1, 12000),
(85, 59, 4, 1, 15000),
(86, 59, 3, 1, 12000),
(87, 60, 4, 1, 15000),
(88, 60, 3, 1, 12000),
(89, 61, 2, 1, 10000),
(90, 62, 2, 1, 10000),
(91, 63, 3, 1, 12000),
(92, 64, 3, 1, 12000),
(93, 65, 3, 1, 12000),
(94, 66, 3, 1, 12000),
(95, 67, 3, 1, 12000),
(96, 68, 3, 1, 12000),
(97, 69, 2, 1, 10000),
(98, 70, 3, 1, 12000),
(99, 70, 2, 1, 10000),
(100, 71, 4, 1, 15000),
(101, 71, 3, 1, 12000),
(102, 71, 2, 1, 10000),
(103, 72, 3, 1, 12000),
(104, 72, 2, 1, 10000),
(105, 73, 2, 1, 10000),
(106, 73, 3, 1, 12000),
(107, 74, 4, 1, 15000),
(108, 74, 3, 1, 12000),
(109, 75, 4, 1, 15000),
(110, 75, 3, 1, 12000),
(111, 76, 3, 1, 12000),
(112, 77, 4, 2, 15000),
(113, 77, 3, 1, 12000),
(114, 78, 3, 3, 12000),
(115, 78, 4, 1, 15000),
(116, 79, 2, 1, 10000),
(117, 79, 3, 1, 12000),
(118, 80, 2, 1, 10000),
(119, 80, 3, 1, 12000),
(120, 81, 3, 1, 12000),
(121, 81, 2, 1, 10000),
(122, 82, 2, 1, 10000),
(123, 82, 3, 1, 12000),
(124, 83, 3, 3, 12000),
(125, 84, 3, 1, 12000),
(126, 84, 2, 1, 10000),
(127, 85, 2, 1, 10000),
(128, 86, 2, 1, 10000),
(129, 86, 3, 1, 12000),
(130, 87, 2, 1, 10000),
(131, 87, 3, 1, 12000),
(132, 88, 2, 2, 10000),
(133, 88, 3, 2, 12000),
(134, 88, 12, 1, 16000),
(135, 89, 2, 1, 10000),
(136, 90, 3, 1, 12000),
(137, 90, 2, 1, 10000);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `aboutus_text`
--
ALTER TABLE `aboutus_text`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `ecogourmet_services`
--
ALTER TABLE `ecogourmet_services`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `eco_gourmet_awards_achievements`
--
ALTER TABLE `eco_gourmet_awards_achievements`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`termek_id`);

--
-- A tábla indexei `termek`
--
ALTER TABLE `termek`
  ADD PRIMARY KEY (`termek_id`);

--
-- A tábla indexei `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type`,`id`) USING BTREE;

--
-- A tábla indexei `user`
--

--
-- A tábla indexei `user_plans`
--
ALTER TABLE `user_plans`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `vasarlasok`
--
ALTER TABLE `vasarlasok`
  ADD PRIMARY KEY (`vasarlas_id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `vasarlasok_tetel`
--
ALTER TABLE `vasarlasok_tetel`
  ADD PRIMARY KEY (`tetel_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `aboutus_text`
--
ALTER TABLE `aboutus_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `ecogourmet_services`
--
ALTER TABLE `ecogourmet_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `eco_gourmet_awards_achievements`
--
ALTER TABLE `eco_gourmet_awards_achievements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `termek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `termek`
--
ALTER TABLE `termek`
  MODIFY `termek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT a táblához `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `user`
--


--
-- AUTO_INCREMENT a táblához `user_plans`
--
ALTER TABLE `user_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `vasarlasok`
--
ALTER TABLE `vasarlasok`
  MODIFY `vasarlas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT a táblához `vasarlasok_tetel`
--
ALTER TABLE `vasarlasok_tetel`
  MODIFY `tetel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `vasarlasok`
--
ALTER TABLE `vasarlasok`
  ADD CONSTRAINT `vasarlasok_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
