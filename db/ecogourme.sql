-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Jan 09. 14:53
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
(1, 'about_title_1', 'about_text_1', './media/image/ffood1.jpg'),
(2, 'about_title_2', 'about_text_2', './media/image/tree1.jpg'),
(3, 'about_title_3', 'about_text_3', './media/image/enjoy1.jpg');

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
-- Tábla szerkezet ehhez a táblához `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `kategoria` varchar(50) NOT NULL,
  `leiras` text DEFAULT NULL,
  `elkeszites` text DEFAULT NULL,
  `fozesi_ido` int(11) DEFAULT NULL,
  `kep` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `recipes`
--

INSERT INTO `recipes` (`id`, `nev`, `kategoria`, `leiras`, `elkeszites`, `fozesi_ido`, `kep`) VALUES
(1, 'recipe_nev_1', 'recipe_kategoria_1', 'recipe_leiras_1', 'recipe_elkeszites_1', 10, './media/image/recipes/egg.jpg'),
(2, 'recipe_nev_2', 'recipe_kategoria_1', 'recipe_leiras_2', 'recipe_elkeszites_2', 15, './media/image/recipes/oatmeal.jpg'),
(3, 'recipe_nev_3', 'recipe_kategoria_1', 'recipe_leiras_3', 'recipe_elkeszites_3', 5, './media/image/recipes/yoghurt.jpg'),
(4, 'recipe_nev_4', 'recipe_kategoria_2', 'recipe_leiras_4', 'recipe_elkeszites_4', 30, './media/image/recipes/chicken.jpg'),
(5, 'recipe_nev_5', 'recipe_kategoria_2', 'recipe_leiras_5', 'recipe_elkeszites_5', 40, './media/image/recipes/lentil.jpg'),
(6, 'recipe_nev_6', 'recipe_kategoria_2', 'recipe_leiras_6', 'recipe_elkeszites_6', 25, './media/image/recipes/salmon.jpg'),
(7, 'recipe_nev_7', 'recipe_kategoria_3', 'recipe_leiras_7', 'recipe_elkeszites_7', 45, './media/image/recipes/cannelloni.jpg'),
(8, 'recipe_nev_8', 'recipe_kategoria_3', 'recipe_leiras_8', 'recipe_elkeszites_8', 35, './media/image/recipes/eggplant.jpg'),
(9, 'recipe_nev_9', 'recipe_kategoria_3', 'recipe_leiras_9', 'recipe_elkeszites_9', 60, './media/image/recipes/beef.jpg');

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
(1, 'Zsófia', 'testimonial_desc_1', './media/image/zsofia.jpg'),
(2, 'Péter', 'testimonial_desc_2', './media/image/peter.jpg'),
(3, 'Anna', 'testimonial_desc_3', './media/image/anna.jpg'),
(5, 'Klára', 'testimonial_desc_5', './media/image/klara.jpg'),
(6, 'Tamás', 'testimonial_desc_6', './media/image/tamas.jpg');

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

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` char(1) NOT NULL DEFAULT 'G',
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `born` date NOT NULL,
  `gender` char(1) NOT NULL,
  `country` varchar(50) NOT NULL,
  `country_code` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postcode` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `verification_code` varchar(32) DEFAULT NULL,
  `verified` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `wrong_attempts` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `valid` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`id`, `type`, `first_name`, `last_name`, `born`, `gender`, `country`, `country_code`, `city`, `postcode`, `address`, `email`, `password`, `created`, `verification_code`, `verified`, `modified`, `last_login`, `wrong_attempts`, `valid`) VALUES
(1, 'A', 'Attila', 'Ódry', '1964-03-08', 'M', 'hungary', '36', 'Szeged', '6725', 'Futrinka utca 66.', 'odry.attila@keri.mako.hu', '$2y$10$2qBCNjBIDp1kw/agy7fV0.sW3sAJz/YKU.oLUL1.2SfcxroBIQLde', '2023-08-29 09:27:01', NULL, '2023-08-29 12:19:00', '2023-08-29 12:19:15', '2023-12-20 19:29:26', 0, 1),
(2, 'A', 'Nagy', 'Renátó', '1993-11-01', 'M', 'hungary', '36', 'Tótkomlós', '5940', 'nagy.renato@keri.mako.hu', 'nagy.renato@keri.mako.hu', '$2y$10$ZbYuaGwd4bMwhgD.C2/RT./lcthTxBQQreACH6uAFHSk2GVmI6BJa', '2023-10-30 13:14:48', '66c0b1af9bad395c8531e3550c7927bd', NULL, '2023-10-30 13:17:16', '2024-01-09 14:51:55', 0, 1);

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
(7, 2, 1, 5000, '2024-03-01');

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
(22, 2, '2024-01-09 02:02:33');

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
(32, 22, 12, 1, 16000);

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
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING BTREE;

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
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `user_plans`
--
ALTER TABLE `user_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `vasarlasok`
--
ALTER TABLE `vasarlasok`
  MODIFY `vasarlas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT a táblához `vasarlasok_tetel`
--
ALTER TABLE `vasarlasok_tetel`
  MODIFY `tetel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
