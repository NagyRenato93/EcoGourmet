<?php

// Set environment
require_once('../../../common/php/environment.php');


// Connect to database
$db = new Database(); // Assuming this class handles database connections

// Set query
$query = "SELECT id, 
                 name,
                 description, 
                 duration, 
                 price 
            FROM subscription_plans"; 

// Execute query
$result['subscription_plans'] = $db->execute($query);

// Close connection
$db = null;

// Set response
Util::setResponse($result);

?>