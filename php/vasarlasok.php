<?php

// Környezet beállításe
require_once('../../../common/php/environment.php');

// Get arguments
$args = Util::getArgs();


$cart['shop'] = array_filter($args['cart'], function($item) {
	return $item['type'] === 'shop';
});
$cart['plan'] = array_filter($args['cart'], function($item) {
	return $item['type'] === 'plan';
});

// Get current datetime
$currenDate = date('Y-m-d');
$currenDateTime = date('Y-m-d H:i:s');

// Create connection
$db = new Database();

// Kulcsok
foreach(array('shop', 'plan') as $key) {

	if (!empty($cart[$key])) {

		if ($key === 'shop') {

			// Set query
			$query = "INSERT INTO `vasarlasok` (`user_id`, `datum`) VALUES";

			// Execute query 
			$result[$key] = $db->execute($query, array($args['userId'], $currenDateTime));

			// Check success
			if (!$result[$key]["affectedRows"]) {
			
			    // Set error
				Util::setError('Nem sikerült a rendelést felvenni', $db);
			}
		
			// Get last inserted identifier
			$lastId = $result[$key]["lastInsertId"];
			
			$params = array();
			foreach($cart['shop'] as $item) {
				$params[] = array(
					"vasarlas_id" => $result[$key]["lastInsertId"],
					"termek_id" => $item['termek_id'],
					"ar_forint" => $item['ar_forint'],
					"mennyiseg" => $item['quantity']
				);
			}

			// Set query
			$query  = "INSERT INTO `vasarlasok_tetel` (`vasarlas_id`,`termek_id`, `ar_forint`,`mennyiseg`) VALUES";
		
			// Execute query
			$result[$key] = $db->execute($query, $params);

		}


		if ($key === 'plan') {

			// Set params (add to every row identifier)
			$params = array();
			foreach($cart['plan'] as $item) {
				$expire = date('Y-m-d', strtotime("+{$item['duration']} months", strtotime($currenDate)));
				$params[] = array(
					"user_id" => $args['userId'],
					"termek_id" => $item['termek_id'],
					"ar_forint" => $item['ar_forint'],
					"expire" => $expire
				);
			}
			
			// Set query
			$query  = "INSERT INTO `user_plans` (`user_id`, `termek_id`, `ar_forint`, `expire`) VALUES";
		
			// Execute query
			$result[$key] = $db->execute($query, $params);

		}
	}
}

// Kapcsolat lezárása
$db = null;

// Válasz elküldése
Util::setResponse($result);
?>
