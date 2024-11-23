<?php
// db_connect.php
$servername = "localhost";
$username = "esalomo2"; // Replace with your database username
$password = "zF6-y##W";     // Replace with your database password
$dbname = "njr_track_tune"; // Replace with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>