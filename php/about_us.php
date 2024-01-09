<?php

// Set environment
require_once('../../../common/php/environment.php');

// Connect to database
$db = new Database(); // Assuming this class handles database connections

//Testimonials 

$query = "SELECT id,
                 name,	
                 description,	
                 kep_url
            FROM testimonials
            ORDER BY RAND()
            LIMIT 3";

// Execute query
$result['testimonials'] = $db->execute($query);

// Set query for plans
$query = "SELECT termek_id, 
                 nev,
                 description, 
                 duration, 
                 ar_forint 
            FROM subscription_plans
            ORDER BY termek_id";

// Execute query
$result['subscription_plans'] = $db->execute($query);


// Set query for about us text part
$query = "SELECT id, 
                 title,
                 description,
                 image
            FROM aboutus_text"; 

// Execute query
$result['aboutUsTexts'] = $db->execute($query);


// Close connection
$db = null;

// Set response
Util::setResponse($result);

?>
