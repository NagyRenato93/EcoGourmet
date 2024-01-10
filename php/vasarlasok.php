<?php
declare(strict_types=1);

// Using namespaces aliasing
use \Util\Util as Util;
use \Database\Database as Database;

// Get arguments
$args = Util::getArgs();

// Get current datetime
$currenDate = date('Y-m-d');
$currenDateTime = date('Y-m-d H:i:s');

// Create connection
$db = new Database();

// Each cart data types
foreach(array('shop', 'plan') as $key) {

	// Get cart filtered type
	$cart = array_values(array_filter($args['cart'], function($item) use($key) {
		return $item['type'] === $key;
	}));

	// Check exist
	if (!empty($cart)) {

		// Cart shop type
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
			
			// Set data for insert
			$params = array();
			foreach($cart as $item) {
				$params[] = array(
					"vasarlas_id" => $result[$key]["lastInsertId"],
					"termek_id" 	=> $item['termek_id'],
					"ar_forint" 	=> $item['ar_forint'],
					"mennyiseg" 	=> $item['quantity']
				);
			}

			// Set query
			$query = "INSERT INTO `vasarlasok_tetel` (`vasarlas_id`,`termek_id`, `ar_forint`,`mennyiseg`) VALUES";
		
			// Execute query
			$result[$key] = $db->execute($query, $params);
		}

		// Cart plan type
		if ($key === 'plan') {

			// Set data for insert
			$params = array();
			foreach($cart as $item) {
				$expire = date('Y-m-d', strtotime("+{$item['duration']} months", strtotime($currenDate)));
				$params[] = array(
					"user_id" 	=> $args['userId'],
					"termek_id" => $item['termek_id'],
					"ar_forint" => $item['ar_forint'],
					"expire" 		=> $expire
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