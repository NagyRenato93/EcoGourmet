-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Jan 09. 01:50
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
(1, 'Tejberizs', '1 bögre rizs, 2 bögre tej, 1 evőkanál cukor, fahéj, vanília kivonat', '1. Moss meg 1 bögre rizst és tedd egy lábasba.\r\n2. Adj hozzá 2 bögre tejet a rizshez.\r\n3. Keverd hozzá a cukrot, majd kezd el főzni közepes lángon.\r\n4. Amikor a rizs felfőtt, tedd hozzá a fahéjat és a vanília kivonatot.\r\n5. Keverd jól össze, majd takard le és hagyd főzni, amíg a rizs megpuhul.\r\n6. Ha elkészült, hagyd kihűlni, majd tálald.', 20),
(2, 'Gyümölcsös joghurt', '1 pohár natúr joghurt, 1 banán, 1 maracuja, méz', '1. Pucolj meg és vágj fel egy banánt.\r\n2. Vágd fel a maracuját és szedd ki a magjait.\r\n3. Pürésítsd össze a banánt és a maracuját egy tálban.\r\n4. Keverd össze a pürét egy pohár natúr joghurttal.\r\n5. Adj hozzá mézet ízlés szerint.\r\n6. Tálald friss gyümölcsökkel.', 5),
(3, 'Szilvás palacsinta', '100 g liszt, 1 tojás, 200 ml tej, 2 evőkanál cukor, 1/2 csomag sütőpor, só, szilva', '1. Keverd össze a lisztet, a tojást, a tejet, a cukrot, a sütőport és a sót egy tálban.\r\n2. Melegíts fel egy serpenyőt közepes lángon.\r\n3. Öntsd a palacsinta tésztát a serpenyőbe és süsd ki mindkét oldalát.\r\n4. Töltsd meg a palacsintákat friss szilvával.\r\n5. Hajtsd össze és tálald.', 25),
(4, 'Tojásrántotta sonkával', '3 tojás, 50 g sonka, 1 evőkanál vaj, só, bors', '1. Vágd fel a sonkát kockákra.\r\n2. Olvaszd fel egy evőkanál vajat egy serpenyőben közepes lángon.\r\n3. Add hozzá a felkockázott sonkát a serpenyőhöz.\r\n4. Verj fel 3 tojást egy tálban és öntsd a sonkára.\r\n5. Főzd meg az tojást, közben sózd és borsozd ízlés szerint.\r\n6. Amikor az tojás kész, tálald.', 15),
(5, 'Mézes müzli', '2 bögre zabpehely, 1/2 bögre méz, 1/4 bögre dió, 1/4 bögre mazsola', '1. Melegítsd meg 1/2 bögre mézet egy serpenyőben.\r\n2. Keverd össze 2 bögre zabpehellyel egy tálban.\r\n3. Öntsd rá a meleg mézet és keverd össze, hogy mindenhova jusson.\r\n4. Szórd el a keveréket egy sütőpapírral bélelt tepsin.\r\n5. Süsd 15 percig 180 fokon, vagy amíg aranybarnára sül.\r\n6. Hűtsd ki, majd keverd hozzá 1/4 bögre diót és 1/4 bögre mazsolát.', 30),
(6, 'Görög joghurt gyümölcssalátával', '1 pohár görög joghurt, 1 alma, 1 banán, 1 narancs, méz, dió', '1. Vágd fel egy almát, egy banánt és egy narancsot kockákra.\r\n2. Tegyél egy pohár görög joghurtot egy tálba.\r\n3. Keverd össze a görög joghurtot mézzel.\r\n4. Szórd meg a gyümölcsökkel és keverd hozzá a diót.\r\n5. Tálald frissen.', 10),
(7, 'Omlett spárgával', '3 tojás, 100 g spárga, 1 evőkanál vaj, só, bors', '1. Moss meg és vágj fel 1 csésze spárgát.\r\n2. Melegíts fel egy evőkanál vajat egy serpenyőben közepes lángon.\r\n3. Add hozzá a spárgát a serpenyőhöz és pirítsd meg.\r\n4. Verj fel 3 tojást egy tálban.\r\n5. Öntsd a tojást a spárgára.\r\n6. Sózd és borsozd meg ízlés szerint.\r\n7. Süsd ki az omlettet és tálald.', 15),
(8, 'Csokis palacsinta', '100 g liszt, 1 tojás, 200 ml tej, 2 evőkanál cukor, 1/2 csomag sütőpor, só, csokoládéforgácsok', '1. Keverd össze a lisztet, a tojást, a tejet, a cukrot, a sütőport, a sót és 1/2 bögre csokoládéforgácsot egy tálban.\r\n2. Melegíts fel egy serpenyőt közepes lángon.\r\n3. Öntsd a palacsinta tésztát a serpenyőbe és süsd ki mindkét oldalát.\r\n4. Szórd meg a csokoládéforgáccsal és tálald.', 20),
(9, 'Bécsi virsli', '2 virsli, 2 tojás, zsemlemorzsa, olaj', '1. Melegíts fel egy lábast olajjal.\r\n2. Pörköld meg a virslit az olajban, majd hagyd lecsepegni.\r\n3. Mártsd meg a virslit felvert tojásban, majd forgasd meg zsemlemorzsában.\r\n4. Süsd ki a virslit aranybarnára.\r\n5. Tálald ketchuppal és mustárral.', 20),
(10, 'Banános palacsinta', '100 g liszt, 1 tojás, 200 ml tej, 2 evőkanál cukor, 1/2 csomag sütőpor, só, 1 banán', '1. Keverd össze a lisztet, a tojást, a tejet, a cukrot, a sütőport, a sót és egy törött banánt egy tálban.\r\n2. Melegíts fel egy serpenyőt közepes lángon.\r\n3. Öntsd a palacsinta tésztát a serpenyőbe és süsd ki mindkét oldalát.\r\n4. Tálald friss szeletelt banánnal és egy kevés mézzel.', 20),
(11, 'Sült sajtos szendvics', '2 szelet kenyér, sajt, vaj', '1. Melegítsd elő a sütőt 180 fokra.\r\n2. Kenj ki muffin formákat vajjal vagy olajjal.\r\n3. Helyezz egy szelet sonkát minden muffin formába.\r\n4. Törj egy tojást mindegyik formába.\r\n5. Szórd meg reszelt sajttal és bacon darabkákkal.\r\n6. Süsd 15-20 percig, vagy amíg a tojások megsülnek.\r\n7. Tálald frissen.', 10),
(12, 'Gyümölcsös turmix', '1 banán, 1/2 bögre eper, 1/2 bögre görög joghurt, méz', '1. Pirítsd meg a kenyérszeleteket.\r\n2. Pucolj meg egy avokádót és törjd össze egy tálban.\r\n3. Adj hozzá citromlevet, sót és borsot az avokádóhoz.\r\n4. Kenj az avokádókrém a pirítósra.\r\n5. Szórd meg őrölt fekete borssal és snidlinggel.\r\n6. Tálald az avokádós pirítóst.', 5),
(13, 'Avokádós pirítós', '2 szelet teljes kiőrlésű pirítós kenyér, avokádó, paradicsom, feta sajt, só, bors', '1. Forralj fel 1 bögre vizet.\r\n2. Keverd össze a forró vízzel 1 bögre zabpelyhet.\r\n3. Adj hozzá fagyasztott vagy friss epret.\r\n4. Keverd össze és hagyd pihenni pár percig.\r\n5. Tálald tejjel vagy mandulatejjel és mézzel.', 10),
(14, 'Csirkemell szendvics', 'Csirkemell, jégsaláta, paradicsom, majonéz, mustár, pirítós kenyér', '1. Melegítsd elő a sütőt 180 fokra.\r\n2. Keverd össze a lisztet, a cukrot, a kakaót, a sütőport és a sót egy tálban.\r\n3. Zúzd össze két érett banánt egy másik tálban.\r\n4. Adj hozzá olvasztott vajat, tojást és vaníliakivonatot a banánhoz.\r\n5. Keverd össze a száraz és nedves hozzávalókat.\r\n6. Öntsd a tésztát kenyérformába és süsd 50-60 percig.\r\n7. Hagyd kihűlni és szeleteld fel.', 15),
(15, 'Túrós palacsinta', '100 g liszt, 1 tojás, 200 ml tej, 200 g túró, 2 evőkanál cukor, 1/2 csomag sütőpor, só, vanília kivonat', '1. Keverd össze a túrót, tojást, cukrot és vaníliát egy tálban.\r\n2. Melegíts fel egy serpenyőt közepes lángon.\r\n3. Öntsd a palacsinta tésztát a serpenyőbe és süsd ki mindkét oldalát.\r\n4. Töltsd meg a palacsintákat túróval és tejszínnel.\r\n5. Hajtsd össze és tálald.', 20),
(16, 'Zabpelyhes joghurt', '200 g natúr joghurt, 50 g zabpehely, méz, dió', '1. Vágj fel zöldségeket (paprika, paradicsom, hagyma) egy tányérra.\r\n2. Melegíts fel egy evőkanál olívaolajat egy serpenyőben közepes lángon.\r\n3. Add hozzá a zöldségeket és párold meg őket.\r\n4. Verj fel 3 tojást egy tálban.\r\n5. Öntsd a tojást a serpenyőbe a zöldségekre.\r\n6. Sózd és borsozd meg ízlés szerint.\r\n7. Süsd ki az omlettet és tálald.', 10),
(17, 'Csokoládés banán palacsinta', '100 g liszt, 1 tojás, 200 ml tej, 1 evőkanál kakaópor, 1 banán', '1. Melegítsd elő a sütőt grill fokozatra.\r\n2. Vágj fel paradicsomokat szeletekre.\r\n3. Helyezd a paradicsomszeleteket sütőpapírral borított tepsire.\r\n4. Szórd meg reszelt sajttal, sóval és borssal.\r\n5. Süsd a sütőben, amíg a sajt aranybarnára pirul.\r\n6. Tálald frissen.', 20),
(18, 'Gyros reggeli wrap', '2 tortillalap, 100 g gyros hús, 1 db paradicsom, 1/4 hagyma, joghurt szósz', '1. Pucolj meg két érett banánt és vágd szeletekre.\r\n2. Tegyél egy bögrébe görög joghurtot és adj hozzá a banánszeleteket.\r\n3. Keverd össze.\r\n4. Adj hozzá tejet és csokoládéfehérjeporot.\r\n5. Turmixold össze az összetevőket.\r\n6. Tálald egy pohárban vagy tálban.', 15),
(19, 'Banános-epres joghurt shake', '1 banán, 1/2 bögre eper, 1 bögre natúr joghurt', '1. Melegíts fel egy serpenyőt közepes lángon.\r\n2. Add hozzá a friss spenótot és párold meg, amíg összeesik.\r\n3. Verj fel két tojást egy tálban.\r\n4. Öntsd a tojást a serpenyőbe a spenótra.\r\n5. Sózd és borsozd meg ízlés szerint.\r\n6. Tekerd fel a wrap-et és tálald.', 5),
(20, 'Sonkás és sajtos tekercs', '4 tojás, 4 szelet sonka, 4 szelet sajt, só, bors', '1. Melegítsd elő a grillezőt közepes lángon.\r\n2. Készítsd elő a csirkemellet, sózd, borsozd és locsold meg olívaolajjal.\r\n3. Grillezd a csirkemellet mindkét oldalon, amíg átsül.\r\n4. Készítsd elő az ananászt szeletekre.\r\n5. Grilleld az ananászt a csirkével együtt.\r\n6. Tálald frissen.', 15),
(21, 'Túróval és mézzel töltött croissant', '1 croissant, túró, méz', '1. Pirítsd meg a kenyérszeleteket.\r\n2. Pucolj meg egy avokádót és törjd össze egy tálban.\r\n3. Kenj az avokádókrém a pirítósra.\r\n4. Melegíts fel egy serpenyőt közepes lángon.\r\n5. Süsd meg a tojásokat a serpenyőben.\r\n6. Helyezd a sült tojásokat az avokádós pirítósra.\r\n7. Sózd és borsozd meg ízlés szerint.\r\n8. Tálald az avokádó toast tojással.', 10),
(22, 'Zöldséges reggeli wrap', '2 tortillalap, 1 paradicsom, 1 uborka, 1 paprika, sajt, joghurt szósz', '1. Vágj fel sonkaszeleteket és reszelt sajtot.\r\n2. Melegíts fel egy serpenyőt közepes lángon.\r\n3. Verj fel három tojást egy tálban.\r\n4. Öntsd a tojást a serpenyőbe.\r\n5. Helyezd a sonkát és sajtot a tojás egyik felére.\r\n6. Hajtsd össze az omlettet és süsd ki mindkét oldalát.\r\n7. Tálald a töltött omlettet.', 15),
(23, 'Tavaszi omlett', '3 tojás, 1 hagyma, 1 paprika, paradicsom, zöldfűszerek, só, bors', '1. Melegítsd elő a sütőt 180 fokra.\r\n2. Keverd össze a zabpelyhet, a banánt, a diót és a mézet egy tálban.\r\n3. Formázz kekszeket a tésztából és helyezd őket sütőpapírral borított tepsire.\r\n4. Süsd a kekszeket 15-20 percig, vagy amíg aranybarnák lesznek.\r\n5. Hagyd hűlni, majd tálald.', 15),
(24, 'Banános-vaníliás palacsinta', '100 g liszt, 1 tojás, 200 ml tej, 1 banán, vanília kivonat', '1. Keverj össze 2 evőkanál chia magot és 1/2 bögre mandulatejet egy pohárban.\r\n2. Tedd a poharat a hűtőszekrénybe és hagyd állni legalább 2 órán át, vagy akár egész éjszakára.\r\n3. Keverd össze a chia pudingot friss gyümölcsökkel (eper, áfonya, banán).\r\n4. Tálald pohárban.', 20),
(25, 'Kakaós zabkása', '50 g zabpehely, 1 evőkanál kakaópor, 1/2 banán, méz', '1. Készíts palacsintatésztát (liszt, tojás, tej).\r\n2. Keverd össze a túrót, cukrot és vaníliát egy tálban.\r\n3. Melegíts fel egy serpenyőt közepes lángon.\r\n4. Öntsd a palacsintatésztát a serpenyőbe és süsd ki mindkét oldalát.\r\n5. Töltsd meg a palacsintákat túróval és szeletekre vágott szilvával.\r\n6. Hajtsd össze és tálald.', 10),
(26, 'Gyümölcsös zabkása', '50 g zabpehely, 1/2 bögre joghurt, 1/2 bögre gyümölcs (pl. málna, szeder)', '1. Tegyél egy bögrébe friss vagy fagyasztott málnát.\r\n2. Adj hozzá egy banánt és egy evőkanál kakaóport.\r\n3. Öntsd fel tejjel vagy mandulatejjel.\r\n4. Turmixold össze az összetevőket.\r\n5. Tálald csokis málna smoothieként.', 10),
(27, 'Sült tojás muffin', '4 tojás, sonka, sajt, paradicsom, só, bors', '1. Vágj fel gyümölcsöket (eper, szőlő, dinnye) egy tálban.\r\n2. Adj hozzá görög joghurtot és keverd össze.\r\n3. Szórd meg mézzel és dióval.\r\n4. Tálald a görög joghurtos gyümölcssalátát.', 20),
(28, 'Grillezett banán palacsinta', '100 g liszt, 1 tojás, 200 ml tej, 2 banán', '1. Melegítsd elő a sütőt 200 fokra.\r\n2. Vágj fel datolyát és távolítsd el a magot.\r\n3. Tekerd bacon szeletekbe a datolyát.\r\n4. Helyezd a baconbe tekert datolyákat sütőpapírral borított tepsire.\r\n5. Süsd 15-20 percig, vagy amíg a bacon ropogós lesz.\r\n6. Tálald melegen.', 20),
(29, 'Epres-joghurtos smoothie', '1 bögre eper, 1 bögre natúr joghurt, méz', '1. Tegyél egy bögrébe friss vagy fagyasztott epret.\r\n2. Adj hozzá görög joghurtot és tejet.\r\n3. Öntsd fel mézzel ízlés szerint.\r\n4. Turmixold össze az összetevőket.\r\n5. Tálald epres joghurt smoothieként.', 5),
(30, 'Zöldséges rántotta', '3 tojás, hagyma, paprika, paradicsom, spenót, só, bors', '1. Melegítsd elő a sütőt 180 fokra.\r\n2. Kenj ki muffin formákat vajjal vagy olajjal.\r\n3. Vágj fel pulykasonkát és zöldségeket kockákra.\r\n4. Üss egy tojást mindegyik muffin formába.\r\n5. Szórd meg pulykasonkával, zöldségekkel és sajttal.\r\n6. Süsd 15-20 percig, vagy amíg a tojások megszilárdulnak.\r\n7. Tálald pulykasonkás tojás muffinnal.', 15);

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
(5, 'prod_nev_5', 'prod_kategoria_5', 'prod_leiras_5', 12000, './media/image/termek/9.jpeg\n'),
(6, 'prod_nev_6', 'prod_kategoria_5', 'prod_leiras_6', 15000, './media/image/termek/10.jpeg\n'),
(7, 'prod_nev_7', 'prod_kategoria_5', 'prod_leiras_7', 13000, './media/image/termek/11.jpeg\n'),
(8, 'prod_nev_8', 'prod_kategoria_5', 'prod_leiras_8', 12000, './media/image/termek/12.jpeg\n'),
(9, 'prod_nev_9', 'prod_kategoria_8', 'prod_leiras_9', 15000, './media/image/termek/13.jpeg\n'),
(10, 'prod_nev_10', 'prod_kategoria_8', 'prod_leiras_10', 13000, './media/image/termek/14.jpeg\n'),
(11, 'prod_nev_11', 'prod_kategoria_8', 'prod_leiras_11', 18000, './media/image/termek/15.jpeg\n'),
(12, 'prod_nev_12', 'prod_kategoria_8', 'prod_leiras_12', 16000, './media/image/termek/18.jpeg\n');

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
(2, 'A', 'Nagy', 'Renátó', '1993-11-01', 'M', 'hungary', '36', 'Tótkomlós', '5940', 'nagy.renato@keri.mako.hu', 'nagy.renato@keri.mako.hu', '$2y$10$ZbYuaGwd4bMwhgD.C2/RT./lcthTxBQQreACH6uAFHSk2GVmI6BJa', '2023-10-30 13:14:48', '66c0b1af9bad395c8531e3550c7927bd', NULL, '2023-10-30 13:17:16', '2024-01-09 01:49:13', 0, 1);

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
(21, 2, '2024-01-09 01:49:29');

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
(31, 21, 3, 3, 12000);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `aboutus_text`
--
ALTER TABLE `aboutus_text`
  ADD PRIMARY KEY (`id`);

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
-- A tábla indexei `lunch_recipes`
--
ALTER TABLE `lunch_recipes`
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
-- AUTO_INCREMENT a táblához `lunch_recipes`
--
ALTER TABLE `lunch_recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT a táblához `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `termek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `termek`
--
ALTER TABLE `termek`
  MODIFY `termek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

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
  MODIFY `vasarlas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT a táblához `vasarlasok_tetel`
--
ALTER TABLE `vasarlasok_tetel`
  MODIFY `tetel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
