-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2019. Dec 31. 14:22
-- Kiszolgáló verziója: 10.1.36-MariaDB
-- PHP verzió: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `tagdij`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `befiz`
--

CREATE TABLE `befiz` (
  `azon` int(10) UNSIGNED NOT NULL,
  `datum` datetime NOT NULL,
  `osszeg` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `befiz`
--

INSERT INTO `befiz` (`azon`, `datum`, `osszeg`) VALUES
(1001, '2010-01-11 16:25:03', 60000),
(1002, '2010-01-17 11:01:19', 5000),
(1004, '2010-01-21 15:40:25', 18000),
(1005, '2010-02-02 09:26:54', 24000),
(1004, '2010-02-04 11:47:08', 30000),
(1006, '2010-02-20 16:36:12', 9000),
(1007, '2010-02-21 13:44:02', 12000),
(1005, '2010-03-01 10:49:41', 8000),
(1007, '2010-03-06 14:52:44', 15000),
(1009, '2010-04-12 20:21:57', 20000),
(1004, '2010-05-10 12:00:29', 8000),
(1006, '2010-06-08 11:10:26', 4000),
(1010, '2010-06-22 17:22:43', 7000),
(1010, '2010-07-14 03:35:02', 8500),
(1012, '2010-07-19 12:48:51', 41000),
(1004, '2010-09-02 16:51:25', 11000),
(1006, '2010-09-05 14:34:48', 15000),
(1007, '2010-09-25 21:16:38', 4000),
(1012, '2010-10-01 13:13:34', 10000),
(1010, '2010-10-01 14:29:37', 5000),
(1012, '2010-10-12 16:54:15', 6000),
(1007, '2010-11-24 11:02:52', 14000),
(1009, '2010-11-25 10:48:31', 19000),
(1007, '2010-11-25 16:01:24', 17000),
(1002, '2010-11-29 13:34:08', 10000),
(1010, '2010-11-30 08:27:50', 12000),
(1004, '2010-12-12 22:02:20', 20000),
(1009, '2010-12-15 12:28:44', 25000),
(1002, '2010-12-23 19:42:20', 3000),
(1005, '2010-12-23 20:33:28', 7500),
(1002, '2010-12-29 10:00:47', 18000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ugyfel`
--

CREATE TABLE `ugyfel` (
  `azon` int(10) UNSIGNED NOT NULL,
  `nev` varchar(30) NOT NULL,
  `szulev` smallint(4) UNSIGNED NOT NULL,
  `irszam` smallint(4) UNSIGNED NOT NULL,
  `orsz` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `ugyfel`
--

INSERT INTO `ugyfel` (`azon`, `nev`, `szulev`, `irszam`, `orsz`) VALUES
(1001, 'Buda Jenõ', 1982, 1026, 'H'),
(1002, 'Makkos Mária', 1970, 1128, 'H'),
(1003, 'Pilis Csaba', 1992, 2442, 'H'),
(1004, 'Török Bálint', 1988, 2128, 'H'),
(1005, 'Szent Endre', 1962, 2000, 'H'),
(1006, 'Kis Marton', 1991, 9999, 'A'),
(1007, 'Békés Csaba', 1989, 4400, 'H'),
(1009, 'Dráva Szabolcs', 1985, 7520, 'H'),
(1010, 'Nagy Károly', 1975, 9999, 'RO'),
(1012, 'Boros Jenõ', 1982, 9999, 'RO'),
(1013, 'Száva Magdolna', 1987, 9999, 'HR');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `ugyfel`
--
ALTER TABLE `ugyfel`
  ADD PRIMARY KEY (`azon`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `ugyfel`
--
ALTER TABLE `ugyfel`
  MODIFY `azon` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1014;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
