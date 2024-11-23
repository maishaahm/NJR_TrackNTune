<?php
// search.php
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $relation = $_POST['relation'] ?? '';
    $nameNetID = $_POST['name-netid'] ?? '';

    // Start query construction
    $query = "SELECT * FROM $relation WHERE 1 = 1";
    
    // Add filters
    if (!empty($nameNetID)) {
        $query .= " AND (name LIKE ? OR netID LIKE ?)";
    }

    $stmt = $conn->prepare($query);
    
    if (!empty($nameNetID)) {
        $search = "%" . $nameNetID . "%";
        $stmt->bind_param("ss", $search, $search);
    }

    $stmt->execute();
    $result = $stmt->get_result();

    // Display results
    if ($result->num_rows > 0) {
        echo "<table>";
        echo "<tr>";
        while ($fieldInfo = $result->fetch_field()) {
            echo "<th>" . $fieldInfo->name . "</th>";
        }
        echo "</tr>";

        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            foreach ($row as $value) {
                echo "<td>" . htmlspecialchars($value) . "</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "No results found.";
    }

    $stmt->close();
    $conn->close();
}
?>