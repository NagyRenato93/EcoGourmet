<?php

// Set arguments
$_GET['data'] = '{"cart":[{"termek_id":3,"ar_forint":2200,"type":"shop","quantity":4},{"termek_id":2,"ar_forint":1800,"type":"shop","quantity":4},{"termek_id":1,"ar_forint":5000,"type":"plan","quantity":1, "duration": 2}],"userId":1}';

// Call php file to debug
require_once('vasarlasok.php');