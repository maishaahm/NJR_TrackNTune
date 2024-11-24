<?php
//include 'db_connection.php'; // This is for if we want to connect to betaweb

// Database credidentials 
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'njr_database';

// Establish connection
$connection = new mysqli($host, $user, $password, $database);


$data = json_decode(file_get_contents('php://input'), true);
$rowId = $data['rowId'];

// Delete query
$sql = "DELETE FROM your_table WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $rowId);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false]);
}

$stmt->close();
$conn->close();
?>
