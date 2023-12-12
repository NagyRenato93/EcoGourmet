<?php
//hibás nem müködik törlés alatt
// Adatbázis kapcsolat
require_once('../../../common/php/environment.php');
$db = new Database();

// Ellenőrizze, hogy van-e bejelentkezett felhasználó
session_start();
if (!isset($_SESSION['user_id'])) {
    $result['error'] = "Nincs bejelentkezve felhasználó.";
    Util::setResponse($result);
    exit();
}

// Bejelentkezett felhasználó adatai
$user_id = $_SESSION['user_id'];
$felhasznalo_nev = $_SESSION['felhasznalo_nev'];
$felhasznalo_cim = $_SESSION['felhasznalo_cim'];

// Kosár tartalmának lekérése
$cart = json_decode($_POST['cart'], true);

// Vásárlás rögzítése
foreach ($cart as $item) {
    $aru_nev = $item['nev'];
    $mennyiseg = $item['quantity'];

    $query = "INSERT INTO vasarlasok (user_id, felhasznalo_nev, felhasznalo_cim, aru_nev, mennyiseg) 
              VALUES (:user_id, :felhasznalo_nev, :felhasznalo_cim, :aru_nev, :mennyiseg)";
    
    $params = array(
        ':user_id' => $user_id,
        ':felhasznalo_nev' => $felhasznalo_nev,
        ':felhasznalo_cim' => $felhasznalo_cim,
        ':aru_nev' => $aru_nev,
        ':mennyiseg' => $mennyiseg
    );

    $result['success'] = $db->execute($query, $params);
}

// Sikeres vásárlás esetén törölje a kosarat
unset($_SESSION['cart']);

// Kapcsolat lezárása
$db = null;

// Válasz elküldése
Util::setResponse($result);
?>
