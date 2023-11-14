<?php

// Set environment
require_once('../../../common/php/environment.php');

// Get arguments
$args = Util::getArgs();

// Connect to database
$db = new Database();

// Set query
$query 	= "UPDATE `user` 
							SET `type` 					= :type,
						 			`prefix_name` 	= :prefix_name,
						 			`first_name` 		= :first_name,
						 			`middle_name` 	= :middle_name,
						 			`last_name` 		= :last_name,
						 			`suffix_name` 	= :suffix_name,
						 			`nick_name` 		= :nick_name,
						 			`gender` 				= :gender,
						 			`born` 					= :born,
						 			`country` 			= :country,
						 			`country_code`	= :country_code,
						 			`city` 					= :city,
						 			`postcode` 			= :postcode,
						 			`address` 			= :address,
						 			`modified`			= :modified
						WHERE `id` = :id";

// Set modified datetime
$args['modified'] = date("Y-m-d H:i:s");

// Execute query with arguments
$result = $db->execute($query, $args);

// Close connection
$db = null;

// Set response
Util::setResponse($result);