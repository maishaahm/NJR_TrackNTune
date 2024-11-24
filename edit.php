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
$name = $data['name'];
$instrument = $data['instrument'];

// Update query
$sql = "UPDATE your_table SET name = ?, instrument = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssi", $name, $instrument, $rowId);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false]);
}

$stmt->close();
$conn->close();
?>
