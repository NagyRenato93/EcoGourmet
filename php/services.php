<?php

// Set environment
require_once('../../../common/php/environment.php');

// Connect to database
$db = new Database(); // Assuming this class handles database connections

//Recipes
$query = "SELECT id,
                 nev, 
                 kategoria, 
                 leiras, 
                 elkeszites,
                 fozesi_ido,
                 kep
            FROM recipes";

// Execute query
$result['recipes'] = $db->execute($query);

 // Set query for awards and achievements
$query = "SELECT id, 
                 title,
                 description,
                 date
                 FROM eco_gourmet_awards_achievements"; 

// Execute query
$result['awards_achievements'] = $db->execute($query);

// Close connection
$db = null;

// Set response
Util::setResponse($result);

?>
