<?php

// Set environment
require_once('../../../common/php/environment.php');

// Get arguments
$args = Util::getArgs();

// Connect to database
$db = new Database();

// Set query
$query 	= "SELECT `type`.`name` AS `typeName`,
									`user`.`born`, 
                	`user`.`country`,
									`user`.`country_code`,
									`user`.,
									`user`.`city`,
									`user`.`postcode`,
                	`user`.`address`
						 FROM `user`
				LEFT JOIN `type`
							 ON `type`.`id` = `user`.`type` 
						WHERE `user`.`id` = :id
						LIMIT 1;";

// Execute query with argument
$result = $db->execute($query, $args);

// Close connection
$db = null;

// Check user exist
if (is_null($result)) {

	// Set error
	Util::setError('the user does not exist');
}

// Simplify result
$result = $result[0];

// Set response
Util::setResponse($result);