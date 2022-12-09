<?php
// On inclut la connexion à la base de données pour pouvoir envoyer les requêtes et récupérer les données
include 'config.php';

// On récupère les données envoyées par la requête AJAX

$condition = '1';
// On vérifie si l'ID est envoyé, si c'est le cas, on associe la valeur de condition à l'ID, suivi par la valeur de l'ID (id = 1, id = 2, etc. qui correspond à l'ID de l'utilisateur)
if (isset($_GET['id'])) {
    $condition = 'id = ' . $_GET['idUtilisateur'];
}


$donneesUser = mysqli_query($db, 'SELECT * FROM utilisateurs WHERE ' . $condition);
$reqQuery = array(); // On crée un tableau vide pour stocker les données

// On parcourt les données récupérées et on initialise le tableau avec les données récupérées

while($donnees = mysqli_fetch_assoc($donneesUser)) {
    $reqQuery[] = $donnees; // On ajoute les données dans le tableau
}


echo json_encode($reqQuery); // On envoie en JSON car le résultat retourné est un tableau associatif

// exemple :

// $reqQuery = array(
//     0 => array(
//         'id' => 1,
//         'username' => 'lucas1',
//         'nom' => 'arnu',
//         'email' => 'lucas.arnu@gmail.com'
//     ),
//     1 => array(
//         'id' => 2,
//          'username' => 'matteo2',
//          etc... 


exit; 
?>