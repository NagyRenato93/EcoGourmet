<?php

// Set environment
require_once('../../../common/php/environment.php');

// Connect to database
$db = new Database(); // Assuming this class handles database connections

// Set query
$query = "SELECT title,
                 description
            FROM ecogourmet_services
            ORDER BY id";

// Execute query
$result['services'] = $db->execute($query);

// Close connection
$db = null;

// Set response
Util::setResponse($result);
?>
