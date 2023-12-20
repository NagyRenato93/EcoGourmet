<?php
// Adatbázis kapcsolat
require_once('../../../common/php/environment.php');

// Get arguments
$args = Util::getArgs();

// Get current datetime
$currenDateTime = date('Y-m-d H:i:s');

// Create connection
$db = new Database();

// Set query
$query = "INSERT INTO `vasarlasok` (`user_id`, `datum`) VALUES";

// Execute query 
$result = $db->execute($query, array($args['userId'], $currenDateTime));

// Check success
if (!$result["affectedRows"]) {

    // Set error
	Util::setError('Nem sikerült a rendelést felvenni', $db);
}

// Get last inserted identifier
$lastId = $result["lastInsertId"];

// Set params (add to every row identifier)
$params = array_map(function ($item) use ($lastId) { 
	return array('vasarlas_id' => $lastId) + $item;
}, $args['cart']);


// Set query
$query  = "INSERT INTO `vasarlasok_tetel` (`vasarlas_id`,`termek_id`, `ar_forint`,`mennyiseg`) VALUES";

// Execute query
$result = $db->execute($query, $params);

// Kapcsolat lezárása
$db = null;

// Válasz elküldése
Util::setResponse($result);
?>
