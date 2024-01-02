<?php

// Set environment
require_once('../../../common/php/environment.php');

// Connect to database
$db = new Database(); // Assuming this class handles database connections

// Set query for about us text part
$query = "SELECT id, 
                 title,
                 content,
                 date
            FROM eco_gourmet_news"; 

// Execute query
$result['eco_gourmet_news'] = $db->execute($query);

// Close connection
$db = null;

// Set response
Util::setResponse($result);

?>
