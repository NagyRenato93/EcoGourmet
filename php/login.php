<?php

// Set environment
require_once('../../../common/php/environment.php');

// Get arguments
$args = Util::getArgs();

// Connect to database
$db = new Database();

// Set query
$query = "SELECT 	`id`,
									`type`,
									`first_name`,
									`last_name`,
									`gender`,
									`password`,
									`valid`,
									`wrong_attempts` 
					FROM 	`user` 
					WHERE `email` = ?
					LIMIT 1;";

// Execute query with argument
$result = $db->execute($query, array($args['email']));

// Check user exist
if (is_null($result)) {

	// Set error
	Util::setError('the user does not exist', $db);
}

// Simplify result
$result = $result[0];

// Check user valid
if (!$result['valid']) {

	// Set error
	Util::setError('the user is disabled', $db);
}

// Check the number of attempts
if ($result['wrong_attempts'] > 5) {

	// Set error
	Util::setError('the user is disabled, because the number of attempts has exceeded the limit', $db);
}

// Verify the password
if (!password_verify($args['password'], $result['password'])) {

	// Set query
	$query = 	"UPDATE `user` 
								SET `wrong_attempts` = `wrong_attempts` + 1
							WHERE `id` = ?;";

	// Execute query with arguments
	$success = $db->execute($query, array($result['id']));

	// Set error
	if ($success['affectedRows'])
				Util::setError('incorrect password', $db);
	else	Util::setError('failed to increase retries', $db);
}

// Unset not necessary key(s)
unset(
	$result['password'], 
	$result['valid'], 
	$result['wrong_attempts']
);

// Set query
$query = 	"UPDATE `user` 
							SET `last_login` = :dateNow,
									`wrong_attempts` = 0
						WHERE `id` = :id;";

// Execute query with arguments
$success = $db->execute($query, array(
	"dateNow" => date("Y-m-d H:i:s"), 
	"id" 			=> $result['id']
));

// Close connection
$db = null;

// Check not success
if (!$success['affectedRows']) {

	// Set error
	Util::setError('failed to administer login');
}

// Set response
Util::setResponse($result);