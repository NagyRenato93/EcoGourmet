-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Dec 12. 19:35
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Tábla szerkezet ehhez a táblához `vasarlasok_tetel`
--

CREATE TABLE `vasarlasok_tetel` (
  `tetel_id` int(11) NOT NULL,
  `vasarlas_id` int(11) NOT NULL,
  `termek_id` int(11) NOT NULL,
  `mennyiseg` int(11) NOT NULL,
  `ar_forint` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `vasarlasok_tetel`
--

INSERT INTO `vasarlasok_tetel` (`tetel_id`, `vasarlas_id`, `termek_id`, `mennyiseg`, `ar_forint`) VALUES
(1, 1, 1, 3, 2000),
(2, 1, 2, 22, 1800),
(3, 2, 1, 3, 2000),
(4, 2, 4, 2, 2100),
(5, 2, 6, 2, 2150);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `vasarlasok_tetel`
--
ALTER TABLE `vasarlasok_tetel`
  ADD PRIMARY KEY (`tetel_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `vasarlasok_tetel`
--
ALTER TABLE `vasarlasok_tetel`
  MODIFY `tetel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
