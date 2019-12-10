<?php
try{
  //Connexion à MySql
  $bdd = new PDO('mysql:host=localhost;dbname=pchevalli001;charset=utf8', 'pchevalli001', '50nu68ku');
}catch (Exception $e){
  die('Erreur : ' . $e->getMessage());
}
?>
