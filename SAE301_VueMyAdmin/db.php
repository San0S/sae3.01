<?php
$dbh = new PDO('mysql:host=localhost;dbname=sae301', 'root', '');
$stmt = $dbh->query('SHOW DATABASES');
$databases = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($databases);
?>