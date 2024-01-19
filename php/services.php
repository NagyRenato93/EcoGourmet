<?php
declare(strict_types=1);

// Using namespaces aliasing
use \Util\Util as Util;
use \Database\Database as Database;

// Connect to database
$db = new Database(); // Assuming this class handles database connections

//Recipes
$query = "SELECT id,
                 nev, 
                 kategoria, 
                 leiras, 
                 hozzavalok,
                 elkeszites,
                 fozesi_ido,
                 kep
            FROM recipes";

// Execute query
$result['recipes'] = $db->execute($query);


// Close connection
$db = null;

// Set response
Util::setResponse($result);