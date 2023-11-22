<?php

// Set environment
require_once('../../../common/php/environment.php');

// Connect to database
$db = new Database(); // Assuming this class handles database connections

// Set query
$query = "SELECT termek_id, 
                 nev, 
                 kategoria, 
                 szavatossagi_ido, 
                 raktaron, 
                 forgalmazo, 
                 gyarto, 
                 ar_forint,
                 kep_eleresi_ut
            FROM termek
            ORDER BY termek_id";

// Execute query
$result['products'] = $db->execute($query);

// Close connection
$db = null;

// Set response
Util::setResponse($result);
?>
