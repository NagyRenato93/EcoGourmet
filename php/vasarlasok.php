<?php
//hibás nem müködik törlés alatt
// Adatbázis kapcsolat
require_once('../../../common/php/environment.php');

// Get arguments
$args = Util::getArgs();

$db = new Database();

$currenDate = date('Y-m-d H:i:s');
$query      = "INSERT INTO `vasarlasok` (`user_id`, `datum`) VALUES";
$result     = $db->execute($query, array($args['userId'], $currenDate));
if (!$result["lastInsertId"]) {

    // Set error
	Util::setError('Nem sikerült a rendelést felvenni', $db);
}

$query = "INSERT INTO `vasarlasok_tetel` (`vasarlas_id`,`termek_id`, `mennyiseg`, `ar_forint`) VALUES";

$params = array();
foreach($args['cart'] as $item) {
    $params = array_merge($params, array(
        $result["lastInsertId"],
        $item['termek_id'],
        $item['quantity'],
        intval($item['ar_forint'])
    )); 
}

$result = $db->execute($query, $params);

// Kapcsolat lezárása
$db = null;

// Válasz elküldése
Util::setResponse($result);
?>
