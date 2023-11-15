-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Nov 15. 17:20
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
-- Tábla szerkezet ehhez a táblához `breakfast_recipes`
--

CREATE TABLE `breakfast_recipes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ingredients` text NOT NULL,
  `instructions` text NOT NULL,
  `cooking_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `breakfast_recipes`
--

INSERT INTO `breakfast_recipes` (`id`, `name`, `ingredients`, `instructions`, `cooking_time`) VALUES
(1, 'Tejberizs', '1 bögre rizs, 2 bögre tej, 1 evőkanál cukor, fahéj, vanília kivonat', '1. Főzd meg a rizst a tejjel és a cukorral, hozzáadva a fahéjat és vaníliát.\r\n2. Keverd össze és hagyd kihűlni.', 20),
(2, 'Gyümölcsös joghurt', '1 pohár natúr joghurt, 1 banán, 1 maracuja, méz', '1. Pürésítsd a banánt és a maracuját.\r\n2. Keverd össze a joghurttal és mézzel.', 5),
(3, 'Szilvás palacsinta', '100 g liszt, 1 tojás, 200 ml tej, 2 evőkanál cukor, 1/2 csomag sütőpor, só, szilva', '1. Keverd össze a lisztet, tojást, tejet, cukrot, sütőport és egy csipet sót.\r\n2. Süsd ki a palacsintákat és töltsd meg szilvával.', 25),
(4, 'Tojásrántotta sonkával', '3 tojás, 50 g sonka, 1 evőkanál vaj, só, bors', '1. Kockázd fel a sonkát.\r\n2. Olvaszd fel a vajat egy serpenyőben, majd add hozzá a sonkát.\r\n3. Add hozzá a felvert tojásokat, és főzd meg őket, sóval és borssal ízesítve.', 15),
(5, 'Mézes müzli', '2 bögre zabpehely, 1/2 bögre méz, 1/4 bögre dió, 1/4 bögre mazsola', '1. Melegítsd meg a mézet, majd keverd össze a zabpehellyel, dióval és mazsolával.\r\n2. Tedd a sütőbe 15 percre, amíg aranybarnára sül.', 30),
(6, 'Görög joghurt gyümölcssalátával', '1 pohár görög joghurt, 1 alma, 1 banán, 1 narancs, méz, dió', '1. Vágd fel az almát, banánt és narancsot kockákra.\r\n2. Keverd össze a görög joghurtot mézzel.\r\n3. Szórd meg gyümölcsökkel és dióval.', 10),
(7, 'Omlett spárgával', '3 tojás, 100 g spárga, 1 evőkanál vaj, só, bors', '1. Pirítsd meg a spárgát vajon.\r\n2. Verj fel a tojásokat, és öntsd a spárgára.\r\n3. Sózd és borsozd meg, majd süsd ki.', 15),
(8, 'Csokis palacsinta', '100 g liszt, 1 tojás, 200 ml tej, 2 evőkanál cukor, 1/2 csomag sütőpor, só, csokoládéforgácsok', '1. Keverd össze a lisztet, tojást, tejet, cukrot, sütőport, sót és csokoládéforgácsokat.\r\n2. Süsd ki a palacsintákat.', 20),
(9, 'Bécsi virsli', '2 virsli, 2 tojás, zsemlemorzsa, olaj', '1. Melegítsd fel az olajat.\r\n2. Pörköld meg a virslit, majd hagyd lecsepegni.\r\n3. Mártsd meg a tojásban, majd zsemlemorzsában, és süsd ki.', 20),
(10, 'Banános palacsinta', '100 g liszt, 1 tojás, 200 ml tej, 2 evőkanál cukor, 1/2 csomag sütőpor, só, 1 banán', '1. Keverd össze a lisztet, tojást, tejet, cukrot, sütőport, sót és a banánt.\r\n2. Süsd ki a palacsintákat.', 20),
(11, 'Sült sajtos szendvics', '2 szelet kenyér, sajt, vaj', '1. Kenj vajat a kenyérszeletekre.\r\n2. Tegyél sajtot közéjük.\r\n3. Süsd a szendvicset serpenyőben.', 10),
(12, 'Gyümölcsös turmix', '1 banán, 1/2 bögre eper, 1/2 bögre görög joghurt, méz', '1. Pürésítsd össze a banánt, epret, görög joghurtot és mézet.', 5),
(13, 'Avokádós pirítós', '2 szelet teljes kiőrlésű pirítós kenyér, avokádó, paradicsom, feta sajt, só, bors', '1. Kenj avokádót a pirítósokra.\r\n2. Tegyél rá paradicsomot és feta sajtot.\r\n3. Sózd és borsozd meg.', 10),
(14, 'Csirkemell szendvics', 'Csirkemell, jégsaláta, paradicsom, majonéz, mustár, pirítós kenyér', '1. Süsd meg a csirkemellet.\r\n2. Kenj majonézt és mustárt a kenyérre.\r\n3. Tegyél rá csirkemellet, jégsalátát és paradicsomot.', 15),
(15, 'Túrós palacsinta', '100 g liszt, 1 tojás, 200 ml tej, 200 g túró, 2 evőkanál cukor, 1/2 csomag sütőpor, só, vanília kivonat', '1. Keverd össze a lisztet, tojást, tejet, túrót, cukrot, sütőport, sót és vaníliát.\r\n2. Süsd ki a palacsintákat.', 20),
(16, 'Zabpelyhes joghurt', '200 g natúr joghurt, 50 g zabpehely, méz, dió', '1. Keverd össze a zabpelyhet a joghurttal.\r\n2. Öntsd meg mézzel és szórd meg dióval.', 10),
(17, 'Csokoládés banán palacsinta', '100 g liszt, 1 tojás, 200 ml tej, 1 evőkanál kakaópor, 1 banán', '1. Keverd össze a lisztet, tojást, tejet és kakaóport.\r\n2. Adj hozzá szeletekre vágott banánt.\r\n3. Süsd ki a palacsintákat.', 20),
(18, 'Gyros reggeli wrap', '2 tortillalap, 100 g gyros hús, 1 db paradicsom, 1/4 hagyma, joghurt szósz', '1. Süsd meg a gyros húst.\r\n2. Vágd fel a paradicsomot és hagymát.\r\n3. Töltsd meg a tortillalapot a hússal, zöldségekkel és joghurt szósszal.', 15),
(19, 'Banános-epres joghurt shake', '1 banán, 1/2 bögre eper, 1 bögre natúr joghurt', '1. Pürésítsd össze a banánt és epret a joghurttal.', 5),
(20, 'Sonkás és sajtos tekercs', '4 tojás, 4 szelet sonka, 4 szelet sajt, só, bors', '1. Verj fel a tojásokat, majd süsd meg.\r\n2. Tegyél rá sonkát és sajtot, majd tekerd fel.', 15),
(21, 'Túróval és mézzel töltött croissant', '1 croissant, túró, méz', '1. Válaszd ketté a croissantot.\r\n2. Töltsd meg túróval és mézzel.', 10),
(22, 'Zöldséges reggeli wrap', '2 tortillalap, 1 paradicsom, 1 uborka, 1 paprika, sajt, joghurt szósz', '1. Vágd fel a zöldségeket.\r\n2. Töltsd meg a tortillalapot zöldségekkel, sajttal és joghurt szósszal.', 15),
(23, 'Tavaszi omlett', '3 tojás, 1 hagyma, 1 paprika, paradicsom, zöldfűszerek, só, bors', '1. Pirítsd meg a hagymát és paprikát.\r\n2. Verj fel a tojásokat, majd öntsd rájuk a zöldségeket.\r\n3. Fűszerezd sóval, borssal és zöldfűszerekkel.', 15),
(24, 'Banános-vaníliás palacsinta', '100 g liszt, 1 tojás, 200 ml tej, 1 banán, vanília kivonat', '1. Keverd össze a lisztet, tojást, tejet, banánt és vaníliát.\r\n2. Süsd ki a palacsintákat.', 20),
(25, 'Kakaós zabkása', '50 g zabpehely, 1 evőkanál kakaópor, 1/2 banán, méz', '1. Keverd össze a zabpelyhet és kakaóport.\r\n2. Öntsd le forrásban lévő vízzel és hagyd állni.\r\n3. Tálald banánnal és mézzel.', 10),
(26, 'Gyümölcsös zabkása', '50 g zabpehely, 1/2 bögre joghurt, 1/2 bögre gyümölcs (pl. málna, szeder)', '1. Keverd össze a zabpelyhet és a joghurtot.\r\n2. Öntsd hozzá a friss gyümölcsöket.', 10),
(27, 'Sült tojás muffin', '4 tojás, sonka, sajt, paradicsom, só, bors', '1. Vágd fel a sonkát, sajtot és paradicsomot.\r\n2. Verj fel a tojásokat, majd öntsd muffinformákba.\r\n3. Tegyél bele sonkát, sajtot és paradicsomot.\r\n4. Süsd ki.', 20),
(28, 'Grillezett banán palacsinta', '100 g liszt, 1 tojás, 200 ml tej, 2 banán', '1. Keverd össze a lisztet, tojást, tejet és egy banánt.\r\n2. Süsd ki a palacsintákat.\r\n3. Grillezd meg a másik banánt és tálald a palacsintákon.', 20),
(29, 'Epres-joghurtos smoothie', '1 bögre eper, 1 bögre natúr joghurt, méz', '1. Keverd össze az epret és a joghurtot.\r\n2. Öntsd meg mézzel.', 5),
(30, 'Zöldséges rántotta', '3 tojás, hagyma, paprika, paradicsom, spenót, só, bors', '1. Pirítsd meg a hagymát, paprikát és paradicsomot.\r\n2. Adj hozzá spenótot és keverd össze.\r\n3. Verj fel a tojásokat, majd öntsd a zöldségekre.\r\n4. Fűszerezd sóval és borssal.', 15),
(31, 'Banános gofri', '100 g liszt, 1 tojás, 1 banán, 1 teáskanál sütőpor', '1. Keverd össze a lisztet, tojást, banánt és sütőport.\r\n2. Süsd ki a gofrikat.', 15),
(32, 'Mandulás joghurt', '200 g mandulás joghurt, 1 maracuja', '1. Tálald a mandulás joghurtot maracujával.', 5),
(33, 'Csirke reggeli wrap', '2 tortillalap, csirkemell, paradicsom, hagyma, sajt, joghurt szósz', '1. Süsd meg a csirkemellet.\r\n2. Vágd fel a paradicsomot és hagymát.\r\n3. Töltsd meg a tortillalapot a hússal, zöldségekkel, sajttal és joghurt szósszal.', 15),
(34, 'Áfonyás joghurt', '200 g natúr joghurt, 50 g áfonya, méz', '1. Keverd össze a joghurtot és áfonyát.\r\n2. Öntsd meg mézzel.', 10),
(35, 'Túrós palacsinta', '100 g túró, 1 tojás, 1 evőkanál liszt, 1 evőkanál méz', '1. Keverd össze a túrót, tojást, lisztet és mézet.\r\n2. Süsd ki a palacsintákat.', 15),
(36, 'Avokádós pirítós', '2 szelet teljes kiőrlésű kenyér, 1 avokádó, só, bors, fokhagyma', '1. Pirítsd meg a kenyeret.\r\n2. Zúzd össze egy avokádót és kend rá a pirítósra.\r\n3. Fűszerezd sóval, borssal és zúzott fokhagymával.', 10),
(37, 'Borzas reggeli muffin', '4 tojás, hagyma, paprika, kolbász, sajt, só, bors', '1. Vágd fel a hagymát, paprikát és kolbászt.\r\n2. Verj fel a tojásokat, majd öntsd muffinformákba.\r\n3. Tegyél bele hagymát, paprikát, kolbászt és sajtot.\r\n4. Süsd ki.', 20),
(38, 'Tejfölös zabkása', '50 g zabpehely, 1 bögre tej, 1 evőkanál tejföl, méz', '1. Főzd meg a zabpelyhet a tejben.\r\n2. Adj hozzá tejfölt és mézet.', 10),
(39, 'Gyors tejberizs', '100 g rizs, 1 bögre tej, cukor, vanília kivonat', '1. Főzd meg a rizst a tejben.\r\n2. Fűszerezd cukorral és vanília kivonattal.', 15),
(40, 'Banános gofri', '100 g liszt, 1 tojás, 1 banán, 1 teáskanál sütőpor', '1. Keverd össze a lisztet, tojást, banánt és sütőport.\r\n2. Süsd ki a gofrikat.', 15),
(41, 'Mandulás joghurt', '200 g mandulás joghurt, 1 maracuja', '1. Tálald a mandulás joghurtot maracujával.', 5),
(42, 'Csirke reggeli wrap', '2 tortillalap, csirkemell, paradicsom, hagyma, sajt, joghurt szósz', '1. Süsd meg a csirkemellet.\r\n2. Vágd fel a paradicsomot és hagymát.\r\n3. Töltsd meg a tortillalapot a hússal, zöldségekkel, sajttal és joghurt szósszal.', 15),
(43, 'Áfonyás joghurt', '200 g natúr joghurt, 50 g áfonya, méz', '1. Keverd össze a joghurtot és áfonyát.\r\n2. Öntsd meg mézzel.', 10),
(44, 'Túrós palacsinta', '100 g túró, 1 tojás, 1 evőkanál liszt, 1 evőkanál méz', '1. Keverd össze a túrót, tojást, lisztet és mézet.\r\n2. Süsd ki a palacsintákat.', 15),
(45, 'Paradicsomos avokádó pirítós', '2 szelet pirítós kenyér, 1 avokádó, 1 paradicsom, só, bors', '1. Pirítsd meg a kenyér szeleteket.\r\n2. Zúzd össze az avokádót, majd kenj rá a kenyérszeletekre.\r\n3. Vágd fel a paradicsomot és tegyél rá.\r\n4. Fűszerezd sóval és borssal.', 15),
(46, 'Spenótos omlett', '3 tojás, 1 marék spenót, sajt, só, bors', '1. Verj fel a tojásokat.\r\n2. Add hozzá a spenótot és sajtot.\r\n3. Fűszerezd sóval és borssal, majd süsd ki.', 15),
(47, 'Bajor reggeli', '2 kolbász, 2 tojás, mustár', '1. Süsd meg a kolbászokat.\r\n2. Süsd ki a tojásokat.\r\n3. Tálald mustárral.', 15),
(48, 'Avokádó tojás kosár', '2 avokádó, 2 tojás, só, bors', '1. Vágd ketté az avokádót és távolítsd el a magot.\r\n2. Kanalazd ki egy kis lyukat az avokádók közepéből.\r\n3. Üss egy tojást mindegyik avokádóba.\r\n4. Fűszerezd sóval és borssal, majd süsd ki.', 20),
(49, 'Banános sült kenyér', '2 szelet kenyér, 1 banán, tojás, tejszín, fahéj, cukor', '1. Vágd fel a banánt.\r\n2. Keverd össze a tojást, tejszínt, cukrot és fahéjat.\r\n3. Áztasd be a kenyérszeleteket a keverékbe, majd süsd ki őket a banánnal.', 20),
(50, 'Lazacos bagel', '1 bagel, füstölt lazac, krémsajt, uborka, paradicsom, kapor', '1. Vágd félbe a bagelt és pirítsd meg.\r\n2. Kend meg a krémsajttal.\r\n3. Tegyél rá füstölt lazacot, uborkát, paradicsomot és kaprot.', 15),
(51, 'Málnás chia puding', '3 evőkanál chia mag, 200 ml mandulatej, méz, málna', '1. Keverd össze a chia magokat és mandulatejet.\r\n2. Adj hozzá mézet és málnát.\r\n3. Hagyd állni, amíg besűrűsödik.', 10);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `dinner_recipes`
--

CREATE TABLE `dinner_recipes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ingredients` text NOT NULL,
  `instructions` text NOT NULL,
  `cooking_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `dinner_recipes`
--

INSERT INTO `dinner_recipes` (`id`, `name`, `ingredients`, `instructions`, `cooking_time`) VALUES
(8, 'Sült lazac spenótos rizzsel', '2 lazac filé, 1 csésze rizs, 200 g spenót, citromlé, olívaolaj, só és bors ízlés szerint', '1. Főzd meg a rizst sós vízben, majd szűrd le.\r\n2. Süssd meg a lazac filéket olívaolajon, majd locsold meg citromlével.\r\n3. Párold meg a spenótot.\r\n4. Tálald a sült lazacot a spenótos rizzsel.', 30),
(9, 'Vegetáriánus padlizsán parmezán', '2 padlizsán, 1/2 csésze liszt, 2 tojás, 1 csésze paradicsomszósz, 1 csésze reszelt mozzarella sajt, só és bors ízlés szerint', '1. Vágd fel a padlizsánt karikákra.\r\n2. Hempergesd meg a lisztben és tojásban, majd süsd ki olajban.\r\n3. Helyezd a sült padlizsánkarikákat sütőedénybe.\r\n4. Öntsd rájuk a paradicsomszószt és reszelt mozzarella sajtot.\r\n5. Süsd 20 percig 180 °C-on a sütőben.', 45),
(10, 'Tavaszi zöldségleves', '1 hagyma, 2 sárgarépa, 2 burgonya, 200 g zöldborsó, 1 zellerszár, 1 liter zöldségleves, só és bors ízlés szerint', '1. Vágd fel az összes zöldséget és hagymát.\r\n2. Főzd őket zöldséglevesben, majd fűszerezd sóval és borssal.', 30),
(11, 'Thai csirke curry', '2 csirkemell filé, 1 konzerv kókusztej, 2 evőkanál zöld curry paszta, 1 cukkini, 1 piros paprika, 1 csésze rizs, só és bors ízlés szerint', '1. Vágd fel a csirkemellet és zöldségeket.\r\n2. Pirítsd meg a zöldségeket zöld curry pasztával.\r\n3. Add hozzá a csirkemellet és kókusztejet.\r\n4. Főzd meg a rizst sós vízben.\r\n5. Tálald a curryt a főtt rizzsel.', 40),
(12, 'Mexikói babtál', '1 konzerv fekete bab, 1 hagyma, 2 gerezd fokhagyma, 1 csésze kukorica, 1 csésze paradicsom, 1 evőkanál chili por, só és bors ízlés szerint, olaj', '1. Pirítsd meg az aprított hagymát és fokhagymát olajon.\r\n2. Adj hozzá fekete babot, kukoricát és paradicsomot.\r\n3. Fűszerezd chili porral, sóval és borssal.\r\n4. Főzd 15 percig, majd tálald.', 25),
(13, 'Sült csirkemell zöldségágyon', '2 csirkemell filé, 1 cukkini, 1 sárgarépa, 1 padlizsán, olívaolaj, friss kakukkfű, só és bors ízlés szerint', '1. Melegítsd elő a sütőt 200 °C-ra.\r\n2. Vágd fel a zöldségeket és helyezd őket sütőedénybe.\r\n3. Sózd, borsozd és locsold meg olívaolajjal a zöldségeket, majd szórd meg friss kakukkfűvel.\r\n4. Helyezd a csirkemell fillet a zöldségek tetejére.\r\n5. Süsd a sütőben 25-30 percig.', 30),
(14, 'Babgulyás', '1 konzerv fehérbab, 1 hagyma, 2 gerezd fokhagyma, 1 paprika, 2 paradicsom, pirospaprika, só és bors ízlés szerint, olaj', '1. Pirítsd meg az aprított hagymát és fokhagymát olajon.\r\n2. Add hozzá a kockázott paprikát és paradicsomot.\r\n3. Szórd meg pirospaprikával, sóval és borssal.\r\n4. Öntsd hozzá a lecsöpögtetett babot és főzd még 10 percig.', 25),
(15, 'Csirkepörkölt galuskával', '2 csirkemell filé, 1 hagyma, 2 gerezd fokhagyma, 2 paradicsom, 1 evőkanál pirospaprika, só és bors ízlés szerint, 1 csomag galuska', '1. Pirítsd meg az aprított hagymát és fokhagymát olajon.\r\n2. Adj hozzá a kockázott paradicsomot és pirospaprikát.\r\n3. Szeleteld fel a csirkemell filét és tedd a serpenyőbe.\r\n4. Főzzed meg a galuskát a csomagoláson lévő utasítások szerint.', 30),
(16, 'Zöldséges quinoa saláta', '1 csésze quinoa, 2 csészényi víz, 1 cukkini, 1 sárgarépa, 1 piros paprika, olívaolaj, citromlé, só és bors ízlés szerint', '1. Főzd meg a quinoát a vízben, majd hagyd kihűlni.\r\n2. Vágd fel a cukkinit, sárgarépát és paprikát kockákra.\r\n3. Keverd össze a quinoát, zöldségeket és pirított mandulát.\r\n4. Locsold meg olívaolajjal és citromlével, majd fűszerezd sóval és borssal.', 25),
(17, 'Spenótos ricotta lasagne', '8 lasagne lap, 250 g ricotta sajt, 200 g spenót, 1 tojás, 1/2 csésze reszelt parmezán sajt, só és bors ízlés szerint', '1. Főzd meg a lasagne lapokat sós vízben, majd szűrd le.\r\n2. Keverd össze a ricotta sajtot, spenótot és tojást.\r\n3. Rétegezd a lasagne lapokat a ricotta-spenót keverékkel.\r\n4. Szórd meg reszelt parmezán sajttal, és süsd 20 percig 180 °C-on a sütőben.', 40),
(18, 'Görög saláta', '1 uborka, 2 paradicsom, 1 lilahagyma, 200 g feta sajt, 1/4 csésze fekete olívabogyó, 2 evőkanál olívaolaj, só és bors ízlés szerint', '1. Vágd fel az uborkát, paradicsomot és lilahagymát.\r\n2. Kockázd fel a fetát.\r\n3. Keverd össze az összes összetevőt egy tálban.\r\n4. Locsold meg olívaolajjal, majd fűszerezd sóval és borssal.', 15),
(19, 'Csirkés quesadilla', '2 csirkemell filé, 4 liszt tortilla lap, 1 csésze reszelt cheddar sajt, 1 zöld paprika, 1 paradicsom, só és bors ízlés szerint, olaj', '1. Süssd meg a csirkemellet olajon, majd vágd apró darabokra.\r\n2. Tegyél egy tortilla lapot serpenyőbe, majd szórd meg reszelt sajttal, zöld paprikával, paradicsommal és csirkemellel.\r\n3. Fedd le egy másik tortilla lappal.\r\n4. Süsd mindkét oldalát aranybarnára.', 25),
(20, 'Sertéshús édes-savanyú szósszal', '400 g sertéshús, 1 zöld paprika, 1 piros paprika, 1 hagyma, 1/2 csésze ananász konzerv, 1/4 csésze ecet, 1/4 csésze cukor, 1 evőkanál szójaszósz, só és bors ízlés szerint, olaj', '1. Vágd fel a húst, paprikákat és hagymát.\r\n2. Pirítsd meg a húst olajon, majd add hozzá a zöldségeket.\r\n3. Keverd össze az ananászt, ecetet, cukrot, szójaszószt, sót és borsot egy serpenyőben.\r\n4. Öntsd a szószt a sertéshúsra és főzd 10 percig.', 30),
(21, 'Bolognai spagetti', '200 g darált marhahús, 1 hagyma, 2 gerezd fokhagyma, 1 konzerv paradicsom, 1 evőkanál paradicsomlé, só és bors ízlés szerint, fűszerek (oregano, bazsalikom), olaj', '1. Pirítsd meg a darált húst olajon, majd tedd félre.\r\n2. Pirítsd meg az aprított hagymát és fokhagymát ugyanezen olajon.\r\n3. Adj hozzá a konzerv paradicsomot és paradicsomlevet.\r\n4. Visszatéve a húst és fűszereket, főzd további 10 percig.\r\n5. Tálald a bolognai szószt főtt tésztával.', 35),
(22, 'Tárkonyos csirkeragu rizzsel', '2 csirkemell filé, 1 hagyma, 2 gerezd fokhagyma, 2 evőkanál tárkony, 1 csésze rizs, 200 ml tejszín, só és bors ízlés szerint, olaj', '1. Vágd fel a csirkemellet, hagymát és fokhagymát.\r\n2. Pirítsd meg a húst olajon, majd tedd félre.\r\n3. Pirítsd meg az aprított hagymát és fokhagymát ugyanezen olajon.\r\n4. Adj hozzá tárkonyt, majd a tejszínt, sót és borsot.\r\n5. Főzd meg a rizst sós vízben.\r\n6. Tálald a tárkonyos csirkét a rizzsel.', 40),
(23, 'Csirkemell sajtmártással', '2 csirkemell filé, 100 g trappista sajt, 1 csomag fűszerkeverék, só és bors ízlés szerint', '1. Melegítsd elő a sütőt 180 °C-ra.\r\n2. Fűszerezd a csirkemellet a fűszerkeverékkel, sóval és borssal.\r\n3. Süssd meg mindkét oldalát serpenyőben.\r\n4. Szórd meg reszelt sajttal és süsd 10 percig a sütőben.', 35),
(24, 'Zöldséges quinoa', '1 csésze quinoa, 2 csészényi víz, 1 cukkini, 1 sárgarépa, 1 paprika, 1 hagyma, olívaolaj, citromlé, só és bors ízlés szerint', '1. Főzd meg a quinoát a vízben, majd hagyd kihűlni.\r\n2. Vágd fel a zöldségeket és hagymát.\r\n3. Pirítsd meg őket olívaolajon, majd keverd össze a quinoával.\r\n4. Locsold meg citromlével, majd fűszerezd sóval és borssal.', 25),
(25, 'Sajtos zöldségek', '1 cukkini, 1 padlizsán, 2 paradicsom, 200 g reszelt trappista sajt, olívaolaj, só és bors ízlés szerint', '1. Vágd fel a zöldségeket és helyezd őket sütőedénybe.\r\n2. Locsold meg olívaolajjal és fűszerezd sóval és borssal.\r\n3. Szórd meg reszelt sajttal.\r\n4. Süsd 25 percig 180 °C-on a sütőben.', 35),
(26, 'Padlizsán és paradicsom gratin', '2 padlizsán, 4 paradicsom, 200 g mozzarella sajt, 2 gerezd fokhagyma, friss bazsalikom, só és bors ízlés szerint, olívaolaj', '1. Vágd fel a padlizsánt és paradicsomot karikákra.\r\n2. Rendezd rétegekre egy sütőedényben.\r\n3. Szórd meg mozzarella sajttal, zúzd bele fokhagymát, majd tedd rá friss bazsalikomot.\r\n4. Locsold meg olívaolajjal és fűszerezd sóval és borssal.\r\n5. Süsd 25 percig 180 °C-on a sütőben.', 40),
(27, 'Sült gomba steak', '500 g gomba (pl. portobello vagy csiperke), 2 gerezd fokhagyma, friss petrezselyem, olívaolaj, só és bors ízlés szerint', '1. Vágd le a gomba szárát.\r\n2. Keverd össze olívaolajjal, sóval, borssal és apróra vágott fokhagymával.\r\n3. Süssd meg a gombákat 15 percig 180 °C-on a sütőben.\r\n4. Szórd meg friss petrezselyemmel.', 25);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `lunch_recipes`
--

CREATE TABLE `lunch_recipes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ingredients` text NOT NULL,
  `instructions` text NOT NULL,
  `cooking_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `lunch_recipes`
--

INSERT INTO `lunch_recipes` (`id`, `name`, `ingredients`, `instructions`, `cooking_time`) VALUES
(1, 'Csirkebrokkoli rizs', '200 g csirkemell, 150 g brokkoli, 1 csésze rizs, szójaszósz, fokhagyma', '1. Süssd meg a csirkemellet, majd vágd apró darabokra.\r\n2. Főzd meg a rizst.\r\n3. Egy serpenyőben pirítsd meg a fokhagymát, majd add hozzá a brokkolit és a csirkét.\r\n4. Fűszerezd szójaszósszal.\r\n5. Tálald a rizzsel.', 30),
(2, 'Gyümölcsös csirkemell', '2 csirkemell, 1 sárgabarack, 1 narancs, fahéj, méz', '1. Süssd meg a csirkemelleket.\r\n2. Készítsd elő a sárgabarackot és a narancsot, majd szeleteld fel.\r\n3. A sütés végén fűszerezd meg fahéjjal és mézzel.\r\n4. Tálald a gyümölcsökkel.', 25),
(3, 'Lencseleves', '1 csésze lencse, 2 sárgarépa, 1 hagyma, 2 gerezd fokhagyma, 1 zeller', '1. Moss meg és szűrd le a lencsét.\r\n2. Pucold meg és vágd fel a zöldségeket.\r\n3. Egy lábasban pirítsd meg az apróra vágott hagymát és fokhagymát.\r\n4. Adj hozzá zellert, sárgarépát és lencsét.\r\n5. Öntsd fel vízzel, majd főzd addig, amíg a lencse és a zöldségek puha nem lesznek.', 40),
(4, 'Tonhalas quinoa saláta', '1 csésze quinoa, 1 konzerv tonhal, uborka, paradicsom, lilahagyma, olívaolaj', '1. Főzd meg a quinoát.\r\n2. Vágd fel az uborkát, paradicsomot és lilahagymát.\r\n3. Keverd össze a quinoát, tonhalkonzervet és zöldségeket.\r\n4. Locsold meg olívaolajjal.', 20),
(5, 'Padlizsános parmezán', '2 padlizsán, paradicsom, mozzarella, bazsalikom, olívaolaj', '1. Vágd fel a padlizsánt és paradicsomot szeletekre.\r\n2. Süssd meg a padlizsánokat olívaolajon mindkét oldalukon.\r\n3. Tegyél egy szelet mozzarellát és paradicsomot mindegyik padlizsánra.\r\n4. Süssd meg, amíg a sajt megolvad.\r\n5. Tálald friss bazsalikommal.', 25),
(6, 'Zöldséges quiche', '1 pite tészta, cukkini, paprika, paradicsom, tojás, tej, sajt', '1. Béleld ki a piteformát a tésztával.\r\n2. Vágd fel a cukkinit, paprikát és paradicsomot.\r\n3. Keverd össze a tojásokat, tejet és sajtot.\r\n4. Öntsd a keveréket a tésztába.\r\n5. Szórd rá a zöldségeket.\r\n6. Süsd meg, amíg aranybarna lesz.', 35),
(7, 'Sült csirke avokádó mártással', '4 csirkecomb, 2 avokádó, citrom, fokhagyma, petrezselyem', '1. Süssd meg a csirkecombokat.\r\n2. Készítsd el az avokádó mártást: keverd össze az avokádót, citromlevet, fokhagymát és petrezselymet.\r\n3. Tálald a sült csirkét az avokádó mártással.', 30),
(8, 'Mexikói taco saláta', '400 g darált marhahús, saláta, paradicsom, hagyma, cheddar sajt, salsa', '1. Süssd meg a darált marhahúst.\r\n2. Vágd fel a salátát, paradicsomot és hagymát.\r\n3. Tálald a salátát a húsra és szórd rá cheddar sajtot.\r\n4. Öntsd le a salsa szósszal.', 20),
(9, 'Töltött cukkini', '4 cukkini, darált hús, hagyma, paradicsom, sajt', '1. Vágd ketté a cukkinit és kanalazd ki a magokat.\r\n2. Pirítsd meg a húst és hagymát.\r\n3. Töltsd meg a cukkinit a hússal, paradicsommal és sajttal.\r\n4. Süsd meg, amíg a cukkini puha nem lesz.', 30),
(10, 'Grillezett hallal', '2 filé hal, citrom, rozmaring, bazsalikom', '1. Készítsd elő a halat: fűszerezd meg citrommal, rozmaringgal és bazsalikommal.\r\n2. Grillezd meg a halat mindkét oldalról.\r\n3. Tálald friss citromkarikákkal.', 15),
(11, 'Sertéssült', '500 g sertéshús, fokhagyma, rozmaring, burgonya', '1. Szeleteld fel a sertéshúst, és dörzsöld be fokhagymával és rozmaringgal.\r\n2. Süsd meg a sertéshúst.\r\n3. Készítsd el a sült krumplit mellé.', 40),
(12, 'Túrós tészta', '250 g tészta, túró, tejföl, cukor', '1. Főzd meg a tésztát.\r\n2. Keverd össze a túrót, tejfölt és cukrot.\r\n3. Öntsd a tészta tetejére.', 20),
(13, 'Gulyásleves', '500 g marhahús, paprika, hagyma, krumpli, paradicsom, zöldpaprika', '1. Vágd fel a hagymát és süssd meg.\r\n2. Add hozzá a húst, és pirítsd meg.\r\n3. Fűszerezd meg paprikával.\r\n4. Öntsd fel vízzel, majd add hozzá a krumplit, paradicsomot és zöldpaprikát.\r\n5. Főzd addig, amíg a krumpli puha nem lesz.', 45),
(14, 'Sült csirkemell', '2 csirkemell, olívaolaj, bazsalikom, kakukkfű', '1. Süssd meg a csirkemellet olívaolajon.\r\n2. Fűszerezd bazsalikommal és kakukkfűvel.\r\n3. Tálald körettel.', 30),
(15, 'Sajtos burgonya', '4 burgonya, sajt, tejföl, szalonna', '1. Süssd meg a burgonyát sütőben.\r\n2. Szórd meg reszelt sajttal és tejföllel.\r\n3. Tegyél rá sült szalonnát.', 35),
(16, 'Mexikói babgulyás', '400 g fekete bab, hagyma, zöldpaprika, kukorica, paradicsom, cheddar sajt', '1. Vágd fel a hagymát és zöldpaprikát.\r\n2. Főzd meg a babot.\r\n3. Pirítsd meg a hagymát, majd add hozzá a zöldpaprikát, kukoricát és paradicsomot.\r\n4. Keverd össze a babbal és sajttal.', 40),
(17, 'Mediterrán lazac', '2 lazacfalat, citrom, olívaolaj, bazsalikom, paradicsom', '1. Fűszerezd meg a lazacot citrommal, olívaolajjal és bazsalikommal.\r\n2. Süssd meg a lazacot.\r\n3. Tálald paradicsommal.', 25),
(18, 'Padlizsán parmezán', '2 padlizsán, paradicsom, mozzarella, olívaolaj, bazsalikom', '1. Vágd fel a padlizsánt szeletekre, majd süssd meg olívaolajon.\r\n2. Tegyél egy szelet mozzarellát és paradicsomot mindegyik padlizsánra.\r\n3. Fűszerezd bazsalikommal.\r\n4. Süssd meg, amíg a sajt megolvad.', 25),
(19, 'Töltött paprika', '4 paprika, darált hús, rizs, hagyma, paradicsom, fűszerek', '1. Mosd meg a paprikákat, majd vágd le a tetejüket és távolítsd el a magokat.\r\n2. Főzd meg a rizst.\r\n3. Pirítsd meg a húst és hagymát.\r\n4. Keverd össze a rizst, húst és fűszereket.\r\n5. Töltsd meg a paprikákat, majd süsd meg.', 35),
(20, 'Csirke saláta', '200 g sült csirke, saláta, paradicsom, uborka, olívaolaj, citrom', '1. Vágd fel a sült csirkét szeletekre.\r\n2. Készítsd el a salátát paradicsommal és uborkával.\r\n3. Locsold meg olívaolajjal és citromlével.', 20),
(51, 'Csirkemell saláta', '2 csirkemell filé, 1 fej jégsaláta, 1 paradicsom, 1 uborka, Olívaolaj, Só és bors ízlés szerint', '1. Sütés előtt sózd és borsozd meg a csirkemell filéket, majd süsd meg őket olívaolajon.\r\n2. Vágd fel a zöldségeket.\r\n3. Tálalás előtt szórd meg a salátát és zöldségeket a sült csirkemell darabokkal. Locsold meg olívaolajjal.', 20),
(52, 'Paradicsomos penne tészta', '250 g penne tészta, 2 evőkanál olívaolaj, 4 paradicsom, 2 gerezd fokhagyma, Friss bazsalikom levelek, Só és bors ízlés szerint, Reszelt parmezán sajt', '1. Főzd meg a penne tésztát sós vízben, majd szűrd le.\r\n2. Olívaolajon párold meg a fokhagymát, majd add hozzá a kockázott paradicsomot.\r\n3. Keverd hozzá a friss bazsalikomot és fűszerezd ízlés szerint.\r\n4. Keverd össze a tésztát a paradicsomszósszal, majd szórd meg reszelt parmezán sajttal.', 15),
(53, 'Gyümölcsös csirkeragu', '2 csirkemell filé, 1 alma, 1 körte, 1 hagyma, 200 ml tejszín, Só és bors ízlés szerint, Olívaolaj', '1. Süssd meg a csirkemell filéket olívaolajon, majd tedd félre.\r\n2. A serpenyőben párold meg a hagymát, majd add hozzá az almát és körtét.\r\n3. Öntsd hozzá a tejszínt, majd fűszerezd sóval és borssal.\r\n4. Visszahelyezheted a sütött csirkemellet a mártásba, majd addig főzd, amíg a hús átsül és a mártás besűrűsödik.', 30),
(54, 'Brokkolis quinoa tál', '1 csésze quinoa, 2 csészényi víz, 1 kisebb brokkoli, 1 sárgarépa, 1/4 csésze pirított mandula, Olívaolaj, Só és bors ízlés szerint', '1. Főzd meg a quinoát a vízben, majd hagyd kihűlni.\r\n2. Gőzöljed meg a brokkolit és sárgarépát.\r\n3. Keverd össze a quinoát, brokkolit, sárgarépát és pirított mandulát.\r\n4. Locsold meg olívaolajjal, majd fűszerezd sóval és borssal.', 25),
(55, 'Vegetáriánus mexikói tojásrántotta', '4 tojás, 1 zöld paprika, 1 paradicsom, 1/2 hagyma, 1/2 csésze reszelt sajt, Só és bors ízlés szerint, Olívaolaj', '1. Melegítsd elő az olívaolajat egy serpenyőben közepes lángon.\r\n2. Párold meg a hagymát, majd add hozzá a zöld paprikát és paradicsomot.\r\n3. Üsd fel a tojásokat egy tálban, majd öntsd a zöldségekre a serpenyőben.\r\n4. Szórd meg reszelt sajttal, és süsd, amíg a tojás megkeményedik.', 15),
(56, 'Sült csirkemell zöldségágyon', '2 csirkemell filé, 1 cukkini, 1 sárgarépa, 1 padlizsán, olívaolaj, friss kakukkfű, só és bors ízlés szerint', '1. Melegítsd elő a sütőt 200 °C-ra.\r\n2. Vágd fel a zöldségeket és helyezd őket sütőedénybe.\r\n3. Sózd, borsozd és locsold meg olívaolajjal a zöldségeket, majd szórd meg friss kakukkfűvel.\r\n4. Helyezd a csirkemellet a zöldségek tetejére.\r\n5. Süsd a sütőben 25-30 percig.', 30),
(57, 'Babgulyás', '1 konzerv fehérbab, 1 hagyma, 2 gerezd fokhagyma, 1 paprika, 2 paradicsom, pirospaprika, só és bors ízlés szerint, olaj', '1. Pirítsd meg az aprított hagymát és fokhagymát olajon.\r\n2. Add hozzá a kockázott paprikát és paradicsomot.\r\n3. Szórd meg pirospaprikával, sóval és borssal.\r\n4. Öntsd hozzá a lecsöpögtetett babot és főzd még 10 percig.', 25),
(58, 'Csirkepörkölt galuskával', '2 csirkemell filé, 1 hagyma, 2 gerezd fokhagyma, 2 paradicsom, 1 evőkanál pirospaprika, só és bors ízlés szerint, 1 csomag galuska', '1. Pirítsd meg az aprított hagymát és fokhagymát olajon.\r\n2. Adj hozzá a kockázott paradicsomot és pirospaprikát.\r\n3. Szeleteld fel a csirkemell filét és tedd a serpenyőbe.\r\n4. Főzzed meg a galuskát a csomagoláson lévő utasítások szerint.', 30),
(59, 'Zöldséges quinoa saláta', '1 csésze quinoa, 2 csészényi víz, 1 cukkini, 1 sárgarépa, 1 piros paprika, olívaolaj, citromlé, só és bors ízlés szerint', '1. Főzd meg a quinoát a vízben, majd hagyd kihűlni.\r\n2. Vágd fel a cukkinit, sárgarépát és paprikát kockákra.\r\n3. Keverd össze a quinoával és zöldségekkel.\r\n4. Locsold meg olívaolajjal és citromlével, majd fűszerezd sóval és borssal.', 20),
(60, 'Spenótos ricotta lasagne', '8 lasagne lap, 250 g ricotta sajt, 200 g spenót, 1 tojás, 1/2 csésze reszelt parmezán sajt, só és bors ízlés szerint', '1. Főzd meg a lasagne lapokat sós vízben, majd szűrd le.\r\n2. Keverd össze a ricotta sajtot, spenótot és tojást.\r\n3. Rétegezd a lasagne lapokat a ricotta-spenót keverékkel.\r\n4. Szórd meg reszelt parmezán sajttal, és süsd 20 percig 180 °C-on a sütőben.', 40),
(61, 'Sült lazac spenótos rizzsel', '2 lazac filé, 1 csésze rizs, 200 g spenót, citromlé, olívaolaj, só és bors ízlés szerint', '1. Főzd meg a rizst sós vízben, majd szűrd le.\r\n2. Süssd meg a lazac filéket olívaolajon, majd locsold meg citromlével.\r\n3. Párold meg a spenótot.\r\n4. Tálald a sült lazacot a spenótos rizzsel.', 30),
(62, 'Vegetáriánus padlizsán parmezán', '2 padlizsán, 1/2 csésze liszt, 2 tojás, 1 csésze paradicsomszósz, 1 csésze reszelt mozzarella sajt, só és bors ízlés szerint', '1. Vágd fel a padlizsánt karikákra.\r\n2. Hempergesd meg a lisztben és tojásban, majd süsd ki olajban.\r\n3. Helyezd a sült padlizsánkarikákat sütőedénybe.\r\n4. Öntsd rájuk a paradicsomszószt és reszelt mozzarella sajtot.\r\n5. Süsd 20 percig 180 °C-on a sütőben.', 45),
(63, 'Tavaszi zöldségleves', '1 hagyma, 2 sárgarépa, 2 burgonya, 200 g zöldborsó, 1 zellerszár, 1 liter zöldségleves, só és bors ízlés szerint', '1. Vágd fel az összes zöldséget és hagymát.\r\n2. Főzd őket zöldséglevesben, majd fűszerezd sóval és borssal.', 30),
(64, 'Thai csirke curry', '2 csirkemell filé, 1 konzerv kókusztej, 2 evőkanál zöld curry paszta, 1 cukkini, 1 piros paprika, 1 csésze rizs, só és bors ízlés szerint', '1. Vágd fel a csirkemellet és zöldségeket.\r\n2. Pirítsd meg a zöldségeket zöld curry pasztával.\r\n3. Add hozzá a csirkemellet és kókusztejet.\r\n4. Főzd meg a rizst sós vízben.\r\n5. Tálald a curryt a főtt rizzsel.', 40),
(65, 'Mexikói babtál', '1 konzerv fekete bab, 1 hagyma, 2 gerezd fokhagyma, 1 csésze kukorica, 1 csésze paradicsom, 1 evőkanál chili por, só és bors ízlés szerint, olaj', '1. Pirítsd meg az aprított hagymát és fokhagymát olajon.\r\n2. Adj hozzá fekete babot, kukoricát és paradicsomot.\r\n3. Fűszerezd chili porral, sóval és borssal.\r\n4. Főzd 15 percig, majd tálald.', 25),
(66, 'Görög saláta', '1 uborka, 2 paradicsom, 1 lilahagyma, 200 g feta sajt, 1/4 csésze fekete olívabogyó, 2 evőkanál olívaolaj, só és bors ízlés szerint', '1. Vágd fel az uborkát, paradicsomot és lilahagymát.\r\n2. Kockázd fel a fetát.\r\n3. Keverd össze az összes összetevőt egy tálban.\r\n4. Locsold meg olívaolajjal, majd fűszerezd sóval és borssal.', 15),
(67, 'Csirkés quesadilla', '2 csirkemell filé, 4 liszt tortilla lap, 1 csésze reszelt cheddar sajt, 1 zöld paprika, 1 paradicsom, só és bors ízlés szerint, olaj', '1. Süssd meg a csirkemellet olajon, majd vágd apró darabokra.\r\n2. Tegyél egy tortilla lapot serpenyőbe, majd szórd meg reszelt sajttal, zöld paprikával, paradicsommal és csirkemellel.\r\n3. Fedd le egy másik tortilla lappal.\r\n4. Süsd mindkét oldalát aranybarnára.', 25),
(68, 'Sertéshús édes-savanyú szósszal', '400 g sertéshús, 1 zöld paprika, 1 piros paprika, 1 hagyma, 1/2 csésze ananász konzerv, 1/4 csésze ecet, 1/4 csésze cukor, 1 evőkanál szójaszósz, só és bors ízlés szerint, olaj', '1. Vágd fel a húst, paprikákat és hagymát.\r\n2. Pirítsd meg a húst olajon, majd add hozzá a zöldségeket.\r\n3. Keverd össze az ananászt, ecetet, cukrot, szójaszószt, sót és borsot egy serpenyőben.\r\n4. Öntsd a szószt a sertéshúsra és főzd 10 percig.', 30),
(69, 'Bolognai spagetti', '200 g darált marhahús, 1 hagyma, 2 gerezd fokhagyma, 1 konzerv paradicsom, 1 evőkanál paradicsomlé, só és bors ízlés szerint, fűszerek (oregano, bazsalikom), olaj', '1. Pirítsd meg a darált húst olajon, majd tedd félre.\r\n2. Pirítsd meg az aprított hagymát és fokhagymát ugyanezen olajon.\r\n3. Adj hozzá a konzerv paradicsomot és paradicsomlevet.\r\n4. Visszatéve a húst és fűszereket, főzd további 10 percig.\r\n5. Tálald a bolognai szószt főtt tésztával.', 35),
(70, 'Tárkonyos csirkeragu rizzsel', '2 csirkemell filé, 1 hagyma, 2 gerezd fokhagyma, 2 evőkanál tárkony, 1 csésze rizs, 200 ml tejszín, só és bors ízlés szerint, olaj', '1. Vágd fel a csirkemellet, hagymát és fokhagymát.\r\n2. Pirítsd meg a húst olajon, majd tedd félre.\r\n3. Pirítsd meg az aprított hagymát és fokhagymát ugyanezen olajon.\r\n4. Adj hozzá tárkonyt, majd a tejszínt, sót és borsot.\r\n5. Főzd meg a rizst sós vízben.\r\n6. Tálald a tárkonyos csirkét a rizzsel.', 40);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `name`, `description`, `duration`, `price`) VALUES
(1, 'Basic', 'Egyszerű terv, amely lehetővé teszi az egy választható reggeli, ebéd vagy vacsora rendelését 1 hónapig. Ideális a kezdeti kóstoláshoz.', 1, '3500.00'),
(2, 'Basic A+', 'Az A+ szintű terv 2 hónapra szól, és lehetővé teszi a választható reggeli, ebéd vagy vacsora rendelését. Ideális rövidebb idejű, kifinomultabb élményekhez.', 2, '5000.00'),
(3, 'Simple', 'Az egyszerű terv 3 hónapig tart, és két választható étkezést kínál reggeli, ebéd vagy vacsora formájában. A hosszabb időtartam miatt ideális az élelmiszer előfizetés kedvelőinek.', 3, '9000.00'),
(4, 'Legend', 'A Legend terv a luxus és változatosság jegyében született. Fél évig tart, és minden nap három étkezés kínál, reggeli, ebéd és vacsora formájában.', 6, '18000.00'),
(5, 'Legend Star', 'A Legend Star terv a csúcsot képviseli. Egy évig tart, és három étkezés választható, reggeli, ebéd vagy vacsora, valamint heti egy desszert is jár mellé.', 12, '30000.00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termek`
--

CREATE TABLE `termek` (
  `termek_id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `kategoria` varchar(50) NOT NULL,
  `szavatossagi_ido` int(11) DEFAULT NULL,
  `raktaron` tinyint(1) NOT NULL,
  `forgalmazo` varchar(255) DEFAULT NULL,
  `gyarto` varchar(255) DEFAULT NULL,
  `ar_forint` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `termek`
--

INSERT INTO `termek` (`termek_id`, `nev`, `kategoria`, `szavatossagi_ido`, `raktaron`, `forgalmazo`, `gyarto`, `ar_forint`) VALUES
(1, 'Bio zabpehely', 'Egeszseges elelmiszer', 365, 1, 'BioFood Kft.', 'Organic Foods Inc.', '1490.99'),
(2, 'Vanilia feherje por', 'Protein', NULL, 1, 'ProteinWorld', 'NutriCorp', '5990.50'),
(3, 'Laktózmentes mandulatej', 'Egeszseges elelmiszer', 30, 1, 'DairyFree Ltd.', 'Healthy Drinks Co.', '899.95'),
(4, 'Gluténmentes quinoa', 'Egeszseges elelmiszer', NULL, 0, 'GrainGoodness', 'SuperGrains Inc.', '3290.00'),
(5, 'Vegetáriánus szendvics', 'Szendvics', 7, 1, 'HealthyBites', 'SandwichMaster', '1290.25'),
(6, 'Organikus chia mag', 'Egeszseges elelmiszer', 180, 1, 'BioSeeds Ltd.', 'NatureHarvest', '3490.75'),
(7, 'Csokoládés feherje szelet', 'Protein', 90, 1, 'FitTreats', 'ProteinDelights Inc.', '1990.00'),
(8, 'Mandula vajas energia szelet', 'Egeszseges elelmiszer', 120, 1, 'NutriSnacks', 'EnergyBites Co.', '1590.50'),
(9, 'Gluténmentes rizs tészta', 'Egeszseges elelmiszer', 365, 1, 'FreeFromFoods', 'GrainCrafters', '1290.25'),
(10, 'Vegán quinoa saláta', 'Szendvics', 5, 1, 'GreenEats', 'VeggieDelight', '2490.00'),
(11, 'Zöld tea kivonat kapszula', 'Egeszseges elelmiszer', NULL, 1, 'HerbalLife', 'NaturalCapsules', '4990.99'),
(12, 'Bio sárgarépalé', 'Ital', 30, 1, 'OrganicDrinks', 'JuiceMasters', '1290.25'),
(13, 'Chia magos müzli', 'Egeszseges elelmiszer', 120, 1, 'SuperCereals', 'HealthyGrains', '1890.50'),
(14, 'Vanília ízű növényi tejszín', 'Egeszseges elelmiszer', 14, 1, 'VeggieDairy', 'PlantCreamery', '899.95'),
(15, 'Szójatej fehérje ital', 'Ital', 60, 1, 'SoyGood', 'ProteinSip', '1290.25'),
(16, 'Gluténmentes rizsliszt', 'Egeszseges elelmiszer', 365, 1, 'FreeFlour', 'GrainMills', '1290.25'),
(17, 'Bab fehérje konzerv', 'Konnyen elokeszitheto', 365, 1, 'ProteinCans', 'LegumeFarms', '1890.50'),
(18, 'Zöld smoothie mix', 'Ital', NULL, 1, 'GreenBlends', 'SmoothieMagic', '2290.00'),
(19, 'Bio zabkenyér', 'Szendvics', 7, 1, 'OrganicBakery', 'HealthyBread Co.', '1290.25'),
(20, 'Mandula granola', 'Egeszseges elelmiszer', 180, 1, 'NutriCrunch', 'GranolaMasters', '1690.75'),
(21, 'Protein rizs golyók', 'Protein', 90, 1, 'RiceProtein', 'SnackCraft', '2190.00'),
(22, 'Cukormentes eperdzsem', 'Egeszseges elelmiszer', 180, 1, 'BerryDelights', 'JamMakers', '1290.25'),
(23, 'Zöld saláta mix', 'Szendvics', 5, 1, 'FreshGreens', 'SaladHarvest', '1590.50'),
(24, 'Omega-3 tojás', 'Egeszseges elelmiszer', 30, 1, 'HealthyEggs', 'EggFarms', '499.95'),
(25, 'Vegetáriánus quinoa burger', 'Szendvics', 30, 1, 'VeggieBurgers', 'QuinoaFoods', '2290.00'),
(26, 'Cukormentes diókrém', 'Egeszseges elelmiszer', 180, 1, 'NutButters', 'SpreadJoy Inc.', '1390.25'),
(27, 'Matcha tea por', 'Ital', NULL, 1, 'MatchaMagic', 'TeaCrafters', '3290.00'),
(28, 'Bio paradicsom konzerv', 'Konnyen elokeszitheto', 365, 1, 'OrganicCans', 'TomatoHarvest', '1490.99'),
(29, 'Citromos chia ital', 'Ital', 30, 1, 'LemonChia', 'DrinkFusion', '1890.50'),
(30, 'Laktózmentes mandulajoghurt', 'Ital', 14, 1, 'DairyFreeYogurt', 'AlmondDairy', '1290.25'),
(31, 'Protein granola szelet', 'Protein', 90, 1, 'ProteinBars', 'GranolaBites Co.', '2490.00'),
(32, 'Vegetáriánus tofuburger', 'Szendvics', 30, 1, 'TofuBurgers', 'VeggieDelight', '1890.50'),
(33, 'Cukormentes szederdzsem', 'Egeszseges elelmiszer', 180, 1, 'BlackberryJoy', 'JamMakers', '1290.25'),
(34, 'Alacsony kalóriájú paradicsomleves', 'Konnyen elokeszitheto', 90, 1, 'LightSoups', 'SoupMasters', '1590.50'),
(35, 'Gyömbéres kurkuma tea', 'Ital', NULL, 1, 'SpiceTeas', 'HerbalInfusions', '899.95'),
(36, 'Quinoa sült rizs snack', 'Snack', 120, 1, 'QuinoaSnacks', 'HealthyCrunch', '1290.25'),
(37, 'Protein smoothie mix', 'Ital', 30, 1, 'ProteinShakes', 'SmoothieFusion', '2590.00'),
(38, 'Laktózmentes koktélparadicsom', 'Konnyen elokeszitheto', 365, 1, 'DairyFreeTomatoes', 'TomatoHarvest', '1190.99'),
(39, 'Avokádós szendvicskrém', 'Szendvics', 14, 1, 'AvocadoSpreads', 'SpreadJoy Inc.', '1390.25'),
(40, 'Omega-3 lazac filé', 'Egeszseges elelmiszer', 30, 1, 'SalmonDelights', 'FishHarvest', '4990.95'),
(41, 'Gluténmentes kókuszliszt', 'Egeszseges elelmiszer', 365, 1, 'FreeCoconut', 'FlourCrafters', '1290.25'),
(42, 'Chia puding', 'Egeszseges elelmiszer', 60, 1, 'ChiaPuds', 'HealthyTreats', '1890.50'),
(43, 'Vegetáriánus padlizsánburger', 'Szendvics', 30, 1, 'EggplantBurgers', 'VeggieDelight', '1990.00'),
(44, 'Cukormentes málnadzsem', 'Egeszseges elelmiszer', 180, 1, 'RaspberryJoy', 'JamMakers', '1290.25'),
(45, 'Bio paradicsomlé', 'Ital', 30, 1, 'OrganicJuices', 'TomatoHarvest', '1790.50'),
(46, 'Mandula-cashew keverék', 'Egeszseges elelmiszer', 120, 1, 'NutMix', 'HealthyBlends', '1490.75'),
(47, 'Protein rizs sütemény', 'Protein', 90, 1, 'RiceCakes', 'ProteinTreats Co.', '2390.00'),
(48, 'Laktózmentes mandula tejpor', 'Ital', NULL, 1, 'DairyFreePowder', 'AlmondDairy', '1890.50'),
(49, 'Gluténmentes quinoa tészta', 'Egeszseges elelmiszer', 365, 1, 'FreePasta', 'GrainCrafters', '1690.25'),
(50, 'Vegán tofuszendvics', 'Szendvics', 7, 1, 'VeganSandwiches', 'TofuTreats', '1490.50'),
(51, 'Édesítőszerrel készült fagylalt', 'Fagylalt', 90, 1, 'SugarFreeScoops', 'IceCreamDelights', '1190.00');

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
  `prefix_name` varchar(20) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT 'NULL',
  `last_name` varchar(50) NOT NULL,
  `suffix_name` varchar(20) DEFAULT NULL,
  `nick_name` varchar(50) DEFAULT NULL,
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

INSERT INTO `user` (`id`, `type`, `prefix_name`, `first_name`, `middle_name`, `last_name`, `suffix_name`, `nick_name`, `born`, `gender`, `country`, `country_code`, `city`, `postcode`, `address`, `email`, `password`, `created`, `verification_code`, `verified`, `modified`, `last_login`, `wrong_attempts`, `valid`) VALUES
(1, 'A', NULL, 'Attila', NULL, 'Ódry', NULL, NULL, '1964-03-08', 'M', 'hungary', '36', 'Szeged', '6725', 'Futrinka utca 66.', 'odry.attila@keri.mako.hu', '$2y$10$2qBCNjBIDp1kw/agy7fV0.sW3sAJz/YKU.oLUL1.2SfcxroBIQLde', '2023-08-29 09:27:01', NULL, '2023-08-29 12:19:00', '2023-08-29 12:19:15', '2023-10-30 13:08:11', 0, 1),
(2, 'A', NULL, 'Nagy', NULL, 'Renátó', NULL, NULL, '1993-11-01', 'M', 'hungary', '36', 'Tótkomlós', '5940', 'nagy.renato@keri.mako.hu', 'nagy.renato@keri.mako.hu', '$2y$10$ZbYuaGwd4bMwhgD.C2/RT./lcthTxBQQreACH6uAFHSk2GVmI6BJa', '2023-10-30 13:14:48', '66c0b1af9bad395c8531e3550c7927bd', NULL, '2023-10-30 13:17:16', '2023-11-14 15:58:26', 0, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_subscription`
--

CREATE TABLE `user_subscription` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subscription_plan_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `breakfast_recipes`
--
ALTER TABLE `breakfast_recipes`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `dinner_recipes`
--
ALTER TABLE `dinner_recipes`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `lunch_recipes`
--
ALTER TABLE `lunch_recipes`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `termek`
--
ALTER TABLE `termek`
  ADD PRIMARY KEY (`termek_id`);

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
-- A tábla indexei `user_subscription`
--
ALTER TABLE `user_subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscription_plan_id` (`subscription_plan_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `breakfast_recipes`
--
ALTER TABLE `breakfast_recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT a táblához `dinner_recipes`
--
ALTER TABLE `dinner_recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT a táblához `lunch_recipes`
--
ALTER TABLE `lunch_recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT a táblához `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `termek`
--
ALTER TABLE `termek`
  MODIFY `termek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `user_subscription`
--
ALTER TABLE `user_subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `user_subscription`
--
ALTER TABLE `user_subscription`
  ADD CONSTRAINT `user_subscription_ibfk_1` FOREIGN KEY (`subscription_plan_id`) REFERENCES `subscription_plans` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
