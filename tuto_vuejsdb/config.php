<?php

$host = "http://100.74.7.84/phpMyAdmin/"; // là où se trouve l'app phpmyadmin
$username = "projetsae";
$password = "saebut2projet!";
$dbname = "test-vuejsDB";

$connexion = mysqli_connect($host, $username, $password, $dbname);

if (!$connexion) {
    die("Connexion échouée : " . mysqli_connect_error());
}


?>