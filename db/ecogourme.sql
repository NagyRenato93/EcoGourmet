-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Dec 12. 15:10
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
(1, 'Zöld étrendek...', 'Az étrendek nemcsak az egészséget, hanem az ízletes ételek élvezetét is hangsúlyozzák, így az ügyfelek élvezhetik az egészséges táplálkozás előnyeit. Az EcoGourmet hisz abban, hogy az egészséges életmód és a fenntarthatóság kompatibilis célok, amelyeket minden ügyfél számára elérhetővé tesz. Tevékenységük összehangolja a személyes jólétet és a környezeti felelősséget, így hozzájárulnak a fenntartható jövő kialakításához. Az EcoGourmet az eszményi példája a táplálkozási tanácsadásnak, amely egyszerre ötvözi a közösségi és környezeti felelősségvállalást.', './media/image/ffood1.jpg'),
(2, 'Miért Eco?', 'Mivel minden vásárlásuk után a cég egy fát ültet, hozzájárulva a környezetvédelemhez és a globális klímaváltozás elleni küzdelemhez. A táplálkozási tanácsadás terén az EcoGourmet az egyéni igényeket és célokat szem előtt tartja, és minden étrendet a testsúly ideális szintjéhez optimalizál. A cég munkatársai magas szintű szakértelemmel és elkötelezettséggel dolgoznak az ügyfelekkel, hogy segítsenek nekik az egészséges étkezéshez vezető úton.', './media/image/tree1.jpg'),
(3, 'Együtt elérjük!', 'Az EcoGourmet egy kivételes vállalkozás, amely elkötelezett az egészséges életmód és a környezetvédelem iránt. Cégfilozófiájuk az ökológia és a gasztronómia harmonikus egyesítése, hogy ügyfeleiknek az optimális testsúlyhoz vezető útmutatást nyújtsák, miközben fenntartható módon gondoskodnak a környezetről.', './media/image/enjoy1.jpg');

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
(1, 'Simple', 'A Simple szintű terv lehetővé teszi a választható reggeli, ebéd vagy vacsora rendelését. Ideális rövidebb idejű, kifinomultabb élményekhez nektek, neked!', 2, '5000.00'),
(2, 'Pro', 'A Pro terv két választható étkezést kínál reggeli, ebéd vagy vacsora formájában. A hosszabb időtartam miatt ideális az élelmiszer előfizetés kedvelőinek.', 3, '9000.00'),
(3, 'Enterprise', 'A Enterprise terv a luxus és változatosság jegyében született. Minden nap három étkezés kínál, reggeli, ebéd és vacsora formájában.', 6, '18000.00');

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
  `ar_forint` decimal(10,2) NOT NULL,
  `kep_eleresi_ut` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `termek`
--

INSERT INTO `termek` (`termek_id`, `nev`, `kategoria`, `szavatossagi_ido`, `raktaron`, `forgalmazo`, `gyarto`, `ar_forint`, `kep_eleresi_ut`) VALUES
(1, 'Protein Szelet Csokoládé ízű', 'Protein', 2026, 50, 'FitPro Distributor', 'HealthyBites Inc.', '2000.00', './media/image/food42.jpg'),
(2, 'Protein Szelet Vanília ízű', 'Protein', 2026, 30, 'NutriSupply', 'ProteinPlus Ltd.', '1800.00', NULL),
(3, 'Protein Szelet Eper ízű', 'Protein', 2023, 40, 'BioFuel Nutrition', 'OrganicProtein Co.', '2200.00', NULL),
(4, 'Protein Szelet Mogyoró ízű', 'Protein', 2024, 35, 'FitLife Retail', 'BodyFuel Enterprises', '2100.00', NULL),
(5, 'Protein Szelet Banán ízű', 'Protein', 2024, 48, 'SportNutri', 'ActiveProtein Ltd.', '1900.00', NULL),
(6, 'Protein Szelet Vanília-Cseresznye ízű', 'Protein', 2023, 25, 'VitalChoice', 'NutriBlend Corporation', '2150.00', NULL),
(7, 'Protein Szelet Kókusz ízű', 'Protein', 2025, 42, 'NutriMax', 'NaturePro Foods', '2300.00', NULL),
(8, 'Protein Szelet Meggy ízű', 'Protein', 2023, 38, 'SuperNutrition', 'GreenFit Labs', '1950.00', NULL),
(9, 'Protein Szelet Fehér Csokoládé-Málna ízű', 'Protein', 2024, 31, 'HealthWise', 'FitFoods Inc.', '2400.00', NULL),
(10, 'Protein Szelet Karamell ízű', 'Protein', 2024, 33, 'ProteinElite', 'NutriCore', '2050.00', NULL),
(11, 'Protein Szelet Almás Fűszer ízű', 'Protein', 2023, 28, 'VitaFuel', 'NaturalProtein Co.', '2150.00', NULL),
(12, 'Protein Szelet Eper-Mentol ízű', 'Protein', 2024, 45, 'BioGains', 'PureFit Foods', '2100.00', NULL),
(13, 'Protein Szelet Dió ízű', 'Protein', 2025, 36, 'WellnessFuel', 'EliteProtein Ltd.', '2250.00', NULL),
(14, 'Protein Szelet Őszibarack ízű', 'Protein', 2024, 39, 'ProVitality', 'PowerBites Inc.', '1950.00', NULL),
(15, 'Protein Szelet Kókusz-Kávé ízű', 'Protein', 2024, 32, 'NaturalBoost', 'PureEnergy Foods', '2200.00', NULL),
(16, 'Protein Szelet Fekete Szeder ízű', 'Protein', 2023, 27, 'ProteinWorld', 'FitFuel Co.', '2350.00', NULL),
(17, 'Protein Szelet Narancs-Chia ízű', 'Protein', 2023, 41, 'VivaProtein', 'NaturalHarmony', '2000.00', NULL),
(18, 'Protein Szelet Matcha ízű', 'Protein', 2024, 34, 'BioFit Nutrition', 'PurePower Foods', '2300.00', NULL),
(19, 'Protein Szelet Szamóca ízű', 'Protein', 2025, 29, 'SuperPro', 'GymFuel Inc.', '2050.00', NULL),
(20, 'Protein Szelet Tiramisu ízű', 'Protein', 2025, 37, 'UltimateNutri', 'BodyTech Labs', '2400.00', NULL),
(21, 'Protein Szelet Mangó ízű', 'Protein', 2024, 44, 'FreshNutri', 'TropicalBites Ltd.', '2150.00', NULL),
(22, 'Protein Szelet Málna-Citrom ízű', 'Protein', 2026, 36, 'SuperGains', 'CitrusProtein Co.', '2000.00', NULL),
(23, 'Protein Szelet Keksz-Krém ízű', 'Protein', 2025, 30, 'FitSnack', 'IndulgeFoods', '2250.00', NULL),
(24, 'Protein Szelet Körte ízű', 'Protein', 2025, 48, 'EcoFuel', 'GreenHarvest Ltd.', '1900.00', NULL),
(25, 'Protein Szelet Tejföl-Vanília ízű', 'Protein', 2026, 33, 'VivaLife', 'DairyProtein Inc.', '2100.00', NULL),
(26, 'Protein Szelet Gyömbér-Méz ízű', 'Protein', 2026, 39, 'BioBalance', 'GoldenTaste Foods', '2200.00', NULL),
(28, 'Protein Szelet Citrom-Menta ízű', 'Protein', 2025, 35, 'ZestyPro', 'FreshMint Foods', '2350.00', NULL),
(30, 'Protein Szelet Tropikus Gyümölcs ízű', 'Protein', 2023, 31, 'ExoNutri', 'IslandBites Ltd.', '2400.00', NULL),
(33, 'Protein Szelet Fekete Cseresznye-Banán ízű', 'Protein', 2023, 36, 'CherryBliss', 'BananaFuel Inc.', '2250.00', NULL),
(34, 'Protein Szelet Sós Karamell-Mogyoró ízű', 'Protein', 2025, 29, 'SaltedCrunch', 'NuttyTreats Ltd.', '2100.00', NULL),
(36, 'Protein Szelet Cukrozott Fehér Csokoládé-Kávé ízű', 'Protein', 2023, 41, 'SweetBean', 'CaffeineDelight Ltd.', '1950.00', NULL),
(38, 'Protein Szelet Mandula-Kókusz ízű', 'Protein', 2024, 32, 'NuttyCoconut', 'AlmondJoy Foods', '2300.00', NULL),
(41, 'Smoothie Por Eper-Banán ízű', 'Smoothie Por', 2024, 50, 'FreshBlend Distributor', 'FruitFusion Inc.', '1800.00', NULL),
(42, 'Smoothie Por Mangó-Ananás ízű', 'Smoothie Por', 2025, 40, 'TropicalMix', 'ExoticDrinks Ltd.', '2000.00', NULL),
(43, 'Smoothie Por Zöld Alma-Spenót ízű', 'Smoothie Por', 2023, 35, 'GreenRevive', 'HealthyGreens Co.', '2200.00', NULL),
(44, 'Smoothie Por Kivi-Mentha ízű', 'Smoothie Por', 2023, 45, 'CoolFruit', 'MintyFresh Beverages', '1900.00', NULL),
(45, 'Smoothie Por Málna-Vanília ízű', 'Smoothie Por', 2024, 48, 'BerryJoy', 'VanillaFusion Ltd.', '2100.00', NULL),
(46, 'Smoothie Por Ananász-Kókusz ízű', 'Smoothie Por', 2023, 30, 'TropicalDelight', 'CoconutTreats Inc.', '2400.00', NULL),
(47, 'Smoothie Por Banán-Kakaó ízű', 'Smoothie Por', 2025, 42, 'ChocoBanana', 'CocoaBlend Foods', '1950.00', NULL),
(48, 'Smoothie Por Sárgabarack-Mandula ízű', 'Smoothie Por', 2023, 38, 'ApricotJoy', 'AlmondHarmony Ltd.', '2150.00', NULL),
(49, 'Smoothie Por Avokádó-Málna ízű', 'Smoothie Por', 2023, 33, 'AvocadoMix', 'BerryBlend Inc.', '2300.00', NULL),
(50, 'Smoothie Por Cseresznye-Alma ízű', 'Smoothie Por', 2023, 36, 'CherryApple', 'FruitHarvest Ltd.', '2050.00', NULL),
(51, 'Smoothie Por Citrom-Gyömbér ízű', 'Smoothie Por', 2024, 29, 'ZestyGinger', 'CitrusSpice Co.', '2150.00', NULL),
(52, 'Smoothie Por Eper-Gránátalma ízű', 'Smoothie Por', 2024, 48, 'PomegranateBlend', 'RedFruit Delights', '2250.00', NULL),
(53, 'Smoothie Por Mogyoró-Banán ízű', 'Smoothie Por', 2023, 41, 'NuttyBanana', 'BananaNut Foods', '2100.00', NULL),
(54, 'Smoothie Por Spenót-Ananás ízű', 'Smoothie Por', 2024, 27, 'GreenPine', 'PineappleVeg Ltd.', '2350.00', NULL),
(55, 'Smoothie Por Fekete Szeder-Menta ízű', 'Smoothie Por', 2023, 32, 'BerryMint', 'FreshBreeze Beverages', '2300.00', NULL),
(56, 'Smoothie Por Banán-Cseresznye ízű', 'Smoothie Por', 2025, 45, 'BananaCherry', 'CherryBanana Ltd.', '2400.00', NULL),
(57, 'Smoothie Por Datolya-Mandula ízű', 'Smoothie Por', 2023, 38, 'DateNutBlend', 'AlmondDate Foods', '2050.00', NULL),
(58, 'Smoothie Por Alma-Pókhasz ízű', 'Smoothie Por', 2024, 34, 'SpiderApple', 'WebFruit Ltd.', '2300.00', NULL),
(59, 'Smoothie Por Fehér Szőlő-Körte ízű', 'Smoothie Por', 2025, 29, 'WhiteGrapeBlend', 'PearFusion Inc.', '2050.00', NULL),
(60, 'Smoothie Por Mogyoró-Karamell ízű', 'Smoothie Por', 2026, 37, 'CaramelNut', 'NuttyCaramel Foods', '2400.00', NULL),
(61, 'Fehérje Por Csokoládé ízű', 'Fehérje Por', 2026, 50, 'ChocoProtein Distributor', 'FitChoco Inc.', '2500.00', NULL),
(62, 'Fehérje Por Vanília ízű', 'Fehérje Por', 2024, 40, 'VanillaSupplies', 'PureVanilla Ltd.', '2200.00', NULL),
(63, 'Fehérje Por Eper ízű', 'Fehérje Por', 2024, 35, 'BerryPro', 'OrganicProtein Co.', '2700.00', NULL),
(64, 'Fehérje Por Banán ízű', 'Fehérje Por', 2025, 45, 'BananaFuel', 'PowerFoods Inc.', '2400.00', NULL),
(65, 'Fehérje Por Mogyoróvaj ízű', 'Fehérje Por', 2025, 48, 'NuttyBlend', 'ProteinNuts Ltd.', '2600.00', NULL),
(66, 'Fehérje Por Kókusz ízű', 'Fehérje Por', 2023, 30, 'CoconutFuel', 'TropicalProteins Inc.', '2800.00', NULL),
(67, 'Fehérje Por Meggy ízű', 'Fehérje Por', 2023, 42, 'CherryPro', 'RedFruit Nutrition', '2300.00', NULL),
(68, 'Fehérje Por Dió ízű', 'Fehérje Por', 2023, 38, 'WalnutProtein', 'NuttyLife Foods', '2500.00', NULL),
(69, 'Fehérje Por Szamóca ízű', 'Fehérje Por', 2026, 33, 'StrawberryFuel', 'BerryBoost Inc.', '2600.00', NULL),
(70, 'Fehérje Por Karamell ízű', 'Fehérje Por', 2025, 36, 'CaramelPro', 'SweetFusion Ltd.', '2700.00', NULL),
(71, 'Kollagén Por Csokoládé ízű', 'Kollagén Por', 2023, 50, 'ChocoCollagen Distributor', 'HealthyChoco Inc.', '3000.00', NULL),
(72, 'Kollagén Por Vanília ízű', 'Kollagén Por', 2024, 40, 'VanillaCollagen', 'PureVanilla Ltd.', '2800.00', NULL),
(73, 'Kollagén Por Eper ízű', 'Kollagén Por', 2025, 35, 'BerryCollagen', 'OrganicCollagen Co.', '3200.00', NULL),
(74, 'Kollagén Por Banán ízű', 'Kollagén Por', 2026, 45, 'BananaCollagen', 'PowerCollagen Inc.', '2900.00', NULL),
(75, 'Kollagén Por Mogyoróvaj ízű', 'Kollagén Por', 2023, 48, 'NuttyCollagen', 'CollagenNuts Ltd.', '3100.00', NULL),
(76, 'Kollagén Por Kókusz ízű', 'Kollagén Por', 2023, 30, 'CoconutCollagen', 'TropicalCollagen Inc.', '3300.00', NULL),
(77, 'Kollagén Por Meggy ízű', 'Kollagén Por', 2025, 42, 'CherryCollagen', 'RedFruit Collagen', '2700.00', NULL),
(78, 'Kollagén Por Dió ízű', 'Kollagén Por', 2023, 38, 'WalnutCollagen', 'CollagenLife Foods', '3000.00', NULL),
(79, 'Kollagén Por Szamóca ízű', 'Kollagén Por', 2023, 33, 'StrawberryCollagen', 'BerryCollagen Inc.', '3100.00', NULL),
(80, 'Kollagén Por Karamell ízű', 'Kollagén Por', 2023, 36, 'CaramelCollagen', 'SweetCollagen Ltd.', '3200.00', NULL),
(91, 'Préselt Gyümölcs-Zöldség Ital Szőlő-Kiwi ízű', 'Préselt Ital', 2024, 38, 'GrapeKiwi', 'FreshSqueeze Inc.', '3300.00', NULL),
(92, 'Préselt Gyümölcs-Zöldség Ital Banán-Mangó ízű', 'Préselt Ital', 2026, 41, 'BananaMango', 'TropicalBlend Co.', '3400.00', NULL),
(93, 'Préselt Gyümölcs-Zöldség Ital Cseresznye-Spenót ízű', 'Préselt Ital', 2025, 27, 'CherrySpinach', 'RedLeaf Nutrition', '3500.00', NULL),
(94, 'Préselt Gyümölcs-Zöldség Ital Mangó-Papaya ízű', 'Préselt Ital', 2024, 32, 'MangoPapaya', 'TropicalHarvest Ltd.', '3600.00', NULL),
(95, 'Préselt Gyümölcs-Zöldség Ital Kivi-Brokkoli ízű', 'Préselt Ital', 2025, 45, 'KiwiBroccoli', 'GreenBlend Foods', '3700.00', NULL),
(96, 'Préselt Gyümölcs-Zöldség Ital Citrom-Mángold ízű', 'Préselt Ital', 2024, 29, 'LemonChard', 'CitrusHarvest Inc.', '3800.00', NULL),
(97, 'Préselt Gyümölcs-Zöldség Ital Banán-Spenót ízű', 'Préselt Ital', 2024, 37, 'BananaSpinach', 'PowerGreens Co.', '3200.00', NULL),
(98, 'Préselt Gyümölcs-Zöldség Ital Áfonya-Sárgadinnye ízű', 'Préselt Ital', 2024, 33, 'BlueMelon', 'FreshBerry Ltd.', '3300.00', NULL),
(99, 'Préselt Gyümölcs-Zöldség Ital Eper-Mentha ízű', 'Préselt Ital', 2025, 36, 'BerryMint', 'MintyFruit Inc.', '3400.00', NULL),
(100, 'Préselt Gyümölcs-Zöldség Ital Sárga Szilva-Brokkoli ízű', 'Préselt Ital', 2026, 42, 'YellowPlumBroccoli', 'FreshHarvest Foods', '3500.00', NULL),
(101, 'Immunerősítő Tea C-vitaminnal', 'Tea', 2025, 50, 'HealthTea Distributor', 'NaturalBoost Inc.', '1800.00', NULL),
(102, 'Zsírégető Tea Zöld Teával', 'Tea', 2026, 40, 'SlimTea', 'GreenFit Ltd.', '2000.00', NULL),
(103, 'Nyugtató Kamilla Tea', 'Tea', 2024, 35, 'CalmBrew', 'HerbalHarmony Co.', '2200.00', NULL),
(104, 'Emésztést Segítő Gyömbér Tea', 'Tea', 2024, 45, 'GingerSip', 'DigestiveWellness Inc.', '1900.00', NULL),
(105, 'Édesgyökér Gyökér Tea', 'Tea', 2024, 48, 'SweetRoot', 'HerbBlend Ltd.', '2100.00', NULL),
(106, 'Vitamin Bomba Teakeverék', 'Tea', 2026, 30, 'VitaTea', 'NutriBlend Co.', '1950.00', NULL),
(107, 'Méregtelenítő Zöld Tea Spirulinával', 'Tea', 2026, 42, 'DetoxGreen', 'PureCleanse Foods', '2350.00', NULL),
(108, 'Energizáló Ginseng Tea', 'Tea', 2026, 32, 'GinsengBoost', 'EnergyHerb Inc.', '2300.00', NULL),
(109, 'Fokhagyma-Tea Antibakteriális Hatással', 'Tea', 2026, 45, 'GarlicGuard', 'HerbalHealth Ltd.', '2400.00', NULL),
(110, 'Vidámító Citromfű Tea', 'Tea', 2024, 28, 'LemonJoy', 'HerbalZest Inc.', '2050.00', NULL),
(121, 'Liofilizált Eper Szeletek', 'Liofilizált Gyümölcs', 2025, 50, 'FruitFreeze Distributor', 'BerryDelights Inc.', '2500.00', NULL),
(122, 'Liofilizált Szeder', 'Liofilizált Gyümölcs', 2024, 40, 'BlackberryFreeze', 'NatureBerries Ltd.', '2200.00', NULL),
(123, 'Liofilizált Mangókockák', 'Liofilizált Gyümölcs', 2026, 35, 'MangoCubes', 'TropicalFruits Co.', '2700.00', NULL),
(124, 'Liofilizált Banánszeletek', 'Liofilizált Gyümölcs', 2023, 45, 'BananaChips', 'FruitfulBites Inc.', '2400.00', NULL),
(125, 'Liofilizált Ananászgyöngyök', 'Liofilizált Gyümölcs', 2025, 48, 'PineapplePearls', 'TropicalBurst Ltd.', '2600.00', NULL),
(126, 'Liofilizált Málna', 'Liofilizált Gyümölcs', 2024, 30, 'RaspberryFreeze', 'BerryBlast Inc.', '2800.00', NULL),
(127, 'Liofilizált Kivi Szeletek', 'Liofilizált Gyümölcs', 2026, 42, 'KiwiSlices', 'TropicalKiwi Foods', '3100.00', NULL),
(128, 'Liofilizált Cseresznye', 'Liofilizált Gyümölcs', 2025, 38, 'CherryBites', 'RedBerry Co.', '3000.00', NULL),
(129, 'Liofilizált Alma Szeletek', 'Liofilizált Gyümölcs', 2023, 33, 'AppleSlices', 'FruitHarvest Ltd.', '2900.00', NULL),
(130, 'Liofilizált Narancs Csuporok', 'Liofilizált Gyümölcs', 2026, 36, 'OrangeCrystals', 'CitrusBurst Inc.', '3200.00', NULL);

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
(1, 'Zsófia', 'Az EcoGourmet segítségével sikerült megtalálnom az egészséges életmód és a finom étkezés tökéletes egyensúlyát. Az általuk kínált személyre szabott tanácsok és étrendek segítettek javítani az étkezési szokásaimon, és most jobban érzem magam.', './media/image/zsofia.jpg'),
(2, 'Péter', 'Nagyon hálás vagyok az EcoGourmet szolgáltatásainak. Kiváló minőségű, étrendeket kaptam tőlük, amelyek a környezetbarát szemléletüket is tükrözik. Számomra ez a cég a tudatos és egészséges táplálkozás szinonimája.', './media/image/peter.jpg'),
(3, 'Anna', 'Az étrendjük és a környezettudatos szemléletmódjuk valóban különleges. Rendkívül elégedett vagyok a velük töltött idővel, és mindenkinek ajánlom, aki jobban szeretné megérteni az egészséges étkezést.', './media/image/anna.jpg'),
(4, 'Gábor', 'Az EcoGourmet számomra nemcsak egy szolgáltató, hanem egy életmódváltást segítő partner. Az egészséges és ízletes ételeikkel könnyű volt számomra elérni a kitűzött céljaimat.', './media/image/gabor.jpg'),
(5, 'Klára', 'Nagyon örülök, hogy rátaláltam az EcoGourmetra. Az étrendjeik változatosak és finomak, ráadásul a környezetvédelem is fontos számukra. Mindenkinek ajánlom, aki szeretne egészségesen és tudatosan táplálkozni.', './media/image/klara.jpg'),
(6, 'Tamás', 'Az EcoGourmet nemcsak az étrendek terén nyújt segítséget, hanem inspiráló közösségük is van. A közös eseményeiken részt venni igazi élmény, és mindig tanulok valami újat az egészséges életmódról.', './media/image/tamas.jpg');

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
(1, 'A', 'Attila', 'Ódry', '1964-03-08', 'M', 'hungary', '36', 'Szeged', '6725', 'Futrinka utca 66.', 'odry.attila@keri.mako.hu', '$2y$10$2qBCNjBIDp1kw/agy7fV0.sW3sAJz/YKU.oLUL1.2SfcxroBIQLde', '2023-08-29 09:27:01', NULL, '2023-08-29 12:19:00', '2023-08-29 12:19:15', '2023-10-30 13:08:11', 0, 1),
(2, 'A', 'Nagy', 'Renátó', '1993-11-01', 'M', 'hungary', '36', 'Tótkomlós', '5940', 'nagy.renato@keri.mako.hu', 'nagy.renato@keri.mako.hu', '$2y$10$ZbYuaGwd4bMwhgD.C2/RT./lcthTxBQQreACH6uAFHSk2GVmI6BJa', '2023-10-30 13:14:48', '66c0b1af9bad395c8531e3550c7927bd', NULL, '2023-10-30 13:17:16', '2023-12-12 15:10:26', 0, 1);

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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vasarlasok`
--

CREATE TABLE `vasarlasok` (
  `vasarlas_id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `felhasznalo_nev` varchar(255) NOT NULL,
  `felhasznalo_cim` varchar(255) NOT NULL,
  `aru_nev` varchar(255) NOT NULL,
  `mennyiseg` int(11) NOT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- A tábla indexei `user_subscription`
--
ALTER TABLE `user_subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscription_plan_id` (`subscription_plan_id`);

--
-- A tábla indexei `vasarlasok`
--
ALTER TABLE `vasarlasok`
  ADD PRIMARY KEY (`vasarlas_id`),
  ADD KEY `user_id` (`user_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `aboutus_text`
--
ALTER TABLE `aboutus_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `termek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

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
-- AUTO_INCREMENT a táblához `user_subscription`
--
ALTER TABLE `user_subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `vasarlasok`
--
ALTER TABLE `vasarlasok`
  MODIFY `vasarlas_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `user_subscription`
--
ALTER TABLE `user_subscription`
  ADD CONSTRAINT `user_subscription_ibfk_1` FOREIGN KEY (`subscription_plan_id`) REFERENCES `subscription_plans` (`id`);

--
-- Megkötések a táblához `vasarlasok`
--
ALTER TABLE `vasarlasok`
  ADD CONSTRAINT `vasarlasok_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
