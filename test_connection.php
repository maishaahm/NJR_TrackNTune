<?php
// Include the database connection file
include 'db_connect.php';

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Successfully connected to the database!";
}

// Close the connection
$conn->close();
?>