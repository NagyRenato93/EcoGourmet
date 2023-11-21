<?php

// Set environment
require_once('../../../common/php/environment.php');

// Connect to database
$db = new Database(); // Assuming this class handles database connections

//breakfast recipes
$query = "SELECT id,
                name, 
                ingredients, 
                instructions, 
                cooking_time 
            FROM breakfast_recipes  
            LIMIT 6";

// Execute query
$result['breakfastRecipes'] = $db->execute($query);

//lunch recipes

$query = "SELECT id,
                name, 
                ingredients, 
                instructions, 
                cooking_time 
            FROM dinner_recipes
            LIMIT 6";

// Execute query
$result['lunchRecipes'] = $db->execute($query);

//dinner reicpes

$query = "SELECT id,
                    name, 
                    ingredients, 
                    instructions, 
                    cooking_time 
                FROM dinner_recipes
                LIMIT 6";

// Execute query
$result['dinnerRecipes'] = $db->execute($query);


// Close connection
$db = null;

// Set response
Util::setResponse($result);

?>
