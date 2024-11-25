<?php
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect form data
    $name = $_POST['name'] ?? '';
    $netID = $_POST['NetID'] ?? '';
    $pronouns = $_POST['Pronouns'] ?? '';
    $classYear = $_POST['Class_Year'] ?? '';
    $instrument = $_POST['Instrument'] ?? '';
    $isPrimaryInstrument = isset($_POST['Is_Primary']) ? 1 : 0;
    $arrangements = isset($_POST['Arrangements']) ? 1 : 0;
    $preferredGenre = $_POST['Preferred_Genre'] ?? '';
    $semester = $_POST['Semester'] ?? '';
    $showType = $_POST['Show_Type'] ?? '';
    $instrumentPlayed = $_POST['Instrument_Played'] ?? '';

    // Split full name into first and last names
    $nameParts = explode(' ', trim($name));
    $fname = $nameParts[0] ?? '';
    $lname = $nameParts[1] ?? '';

    try {
        // Start a transaction
        $conn->begin_transaction();

        // Insert into `member`
        $stmt = $conn->prepare("INSERT INTO member (NetID, Fname, Lname, Pronouns, Class_Year, Arrangements) 
                                VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssii", $netID, $fname, $lname, $pronouns, $classYear, $arrangements);
        $stmt->execute();

        // Insert into `member_preferred_genre` (if provided)
        if (!empty($preferredGenre)) {
            $genres = explode(',', $preferredGenre); // Assume genres are comma-separated
            $stmt = $conn->prepare("INSERT INTO member_preferred_genre (NetID, Preferred_Genre) VALUES (?, ?)");
            foreach ($genres as $genre) {
                $genre = trim($genre);
                $stmt->bind_param("ss", $netID, $genre);
                $stmt->execute();
            }
        }

        // Insert into `instrument` (if provided)
        if (!empty($instrument)) {
            $stmt = $conn->prepare("INSERT INTO instrument (NetID, Instrument_Name, Is_Primary) VALUES (?, ?, ?)");
            $stmt->bind_param("ssi", $netID, $instrument, $isPrimaryInstrument);
            $stmt->execute();
        }

        // Insert into the appropriate event table
        if (!empty($semester) && !empty($showType)) {
            if ($showType == 'ensemble') {
                $stmt = $conn->prepare("INSERT INTO ensemble (NetID, Ensemble_Type, Semester, Instrument_Played) VALUES (?, ?, ?, ?)");
                $stmt->bind_param("ssss", $netID, $showType, $semester, $instrumentPlayed);
            } elseif ($showType == 'house') {
                $stmt = $conn->prepare("INSERT INTO house_show (NetID, Semester, Instrument_Played) VALUES (?, ?, ?)");
                $stmt->bind_param("sss", $netID, $semester, $instrumentPlayed);
            } elseif ($showType == 'big') {
                $stmt = $conn->prepare("INSERT INTO big_show (NetID, Semester, Instrument_Played) VALUES (?, ?, ?)");
                $stmt->bind_param("sss", $netID, $semester, $instrumentPlayed);
            }
            $stmt->execute();
        }

        // Commit the transaction
        $conn->commit();
        echo "Data inserted successfully!";
    } catch (Exception $e) {
        $conn->rollback();
        echo "Error: " . $e->getMessage();
    }

    $conn->close();
}
?>