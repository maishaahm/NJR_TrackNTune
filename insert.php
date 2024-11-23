<?php
// insert.php
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect form data
    $name = $_POST['generalName'] ?? '';
    $netID = $_POST['generalNetID'] ?? '';
    $pronouns = $_POST['generalPronouns'] ?? '';
    $classYear = $_POST['generalClassYear'] ?? '';
    $instrument = $_POST['instrument'] ?? '';
    $isPrimaryInstrument = $_POST['isPrimaryInstrument'] ?? '';
    $arrangements = $_POST['arrangements'] ?? '';
    $preferredGenre = $_POST['preferredGenre'] ?? '';
    $semester = $_POST['semester'] ?? '';
    $showType = $_POST['showType'] ?? '';
    $ensembleType = $_POST['ensembleType'] ?? '';
    $instrumentPlayed = $_POST['instrumentPlayed'] ?? '';

    // Insert into database
    $sql = "INSERT INTO Member (name, netID, pronouns, class_year, instrument, is_primary_instrument, arrangements, preferred_genre, semester, show_type, ensemble_type, instrument_played) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssssssssss", $name, $netID, $pronouns, $classYear, $instrument, $isPrimaryInstrument, $arrangements, $preferredGenre, $semester, $showType, $ensembleType, $instrumentPlayed);

    if ($stmt->execute()) {
        echo "Data inserted successfully!";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>