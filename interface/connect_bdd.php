<?php
try{
  //Connexion à MySql
  $bdd = new PDO('mysql:host=localhost;dbname=cartes_a_collectionner;charset=utf8', 'root', 'Kaae7vad');
}catch (Exception $e){
  die('Erreur : ' . $e->getMessage());
}
?>
