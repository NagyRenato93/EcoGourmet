<?php

// Set environment
require_once('../../common/php/environment.php');

// Get arguments
$args = Util::getArgs();

// Connect to database
$db = new Database();

// Set query (Check user already exist)
$query = "SELECT `id` 
					FROM 	`user` 
					WHERE `email` = :email
					LIMIT 1;";

// Execute query with arguments
$result = $db->execute($query, array(
						'email' => $args['email']
					));

// Check result
if (!is_null($result)) {

	// Set error
	Util::setError('There is already a user with this email address!', $db);
}

// Set query
$query = "INSERT INTO `user`
					(`type`, `prefix_name`, `first_name`, `middle_name`, `last_name`, `suffix_name`, `nick_name`, `born`, `gender`, `country`, `country_code`, `city`, `postcode`, `address`, `email`, `password`, `created`, `verification_code`) 
					 VALUES 
					(:type, :prefix_name, :first_name, :middle_name, :last_name, :suffix_name, :nick_name, :born, :gender, :country, :country_code, :city, :postcode, :address, :email, :password,  :created, :verification_code)";

// Set user default type (not yet authenticated)
$args['type'] = 'N';

// Creates a new password hash
$args['password'] = password_hash($args['password'], PASSWORD_DEFAULT);

// Set random verification code
$args['verification_code'] = bin2hex(random_bytes(16));

// Set created datetime
$args['created'] = date("Y-m-d H:i:s");

// Execute query with arguments
$result = $db->execute($query, $args);

// Close connection
$db = null;

// Set response user type
$result['type'] = $args['type'];

/*
$email = new Email();
$email->set_subject('Confirm email address');
$body = <<<EOT
<h1>Kedves Felhasználónk!</h1>
<p>Az alábbi linkre kattintva tudod megerősíteni felhasználói fiókod létrehozását.</p>
<a href="http://localhost/projects/2023_2024/E_2_14_1/user-language/php/atika.php?x=100&y=200">Megerősítés</a>
<p>Ha nem Te hoztad létre ezt a fiókot, kérjük, levelünket hagyd figyelmen kívül. Előfordulhat, hogy valaki más tévedésből a Te e-mail címeddel próbált regisztrálni az oldalunkra.</p>
<p>Üdv: a KERI Informatics csapata.</p>
EOT;
$email->set_body($body);
$email->set_addressees($args['email']);
*/

// Set response
Util::setResponse($result);