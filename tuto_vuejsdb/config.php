<?php

$host = "localhost"; // là où se trouve l'app phpmyadmin
$username = "projetsae";
$password = "";
$dbname = "";

$connexion = mysqli_connect($host, $username, $password, $dbname);

if (!$connexion) {
    die("Connexion échouée : " . mysqli_connect_error());
}


?>