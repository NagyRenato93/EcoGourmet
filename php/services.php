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
            ORDER BY RAND()
            LIMIT 6";

// Execute query
$result['breakfastRecipes'] = $db->execute($query);

//lunch recipes

$query = "SELECT id,
                name, 
                ingredients, 
                instructions, 
                cooking_time 
            FROM lunch_recipes
            ORDER BY RAND()
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
                ORDER BY RAND()
                LIMIT 6";

// Execute query
$result['dinnerRecipes'] = $db->execute($query);

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
