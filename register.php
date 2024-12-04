<?php
// Database connection
$dsn = 'mysql:host=localhost;dbname=your_database_name;charset=utf8mb4';
$username = 'your_username';
$password = 'your_password';

try {
    $conn = new PDO($dsn, $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Get and sanitize input
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_STRING);
    $password = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_STRING);

    // Validate id and password
    if (empty($id) || empty($password)) {
        echo "Please fill in all required fields.";
        exit();
    }

    if (strlen($id) < 4) {
        echo "ID must be at least 4 characters long.";
        exit();
    }

    if (strlen($password) < 8) {
        echo "Password must be at least 8 characters long.";
        exit();
    }

    // Check for existing ID
    $stmt = $conn->prepare("SELECT COUNT(*) FROM users WHERE id = :id");
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    if ($stmt->fetchColumn()) {
        echo "This ID is already registered. Please use a different ID.";
        exit();
    }

    // Hash the password and save the user
    $hashed_password = password_hash($password, PASSWORD_BCRYPT);

    try {
        $stmt = $conn->prepare("INSERT INTO users (id, password) VALUES (:id, :password)");
        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':password', $hashed_password);
        $stmt->execute();

        // Redirect on success
        header("Location: login.php");
        exit();
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>