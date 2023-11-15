<?php
// Set environment
require_once('../../../common/php/environment.php');

// Connect to database
try {
    $db = new Database(); // Assuming this class handles database connections

    // Set query
    $query = "SELECT termek_id, 
                     nev, 
                     kategoria, 
                     szavatossagi_ido, 
                     raktaron, 
                     forgalmazo, 
                     gyarto, 
                     ar_forint
                FROM termek
                ORDER BY termek_id";

    // Execute query
    $result = $db->execute($query);

    // Close connection
    $db->close();

    // Output the result as JSON
    echo json_encode($result);

} catch (Exception $e) {
    // Handle exceptions and log errors
    error_log('Error: ' . $e->getMessage());
    echo json_encode(["status" => "error", "message" => $e->getMessage()]);
}
?>
