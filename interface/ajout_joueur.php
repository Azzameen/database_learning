<!DOCTYPE html>
<html>
    <head>
        <title>Page d'Accueil</title>
        <meta charset="utf-8" />
    </head>



    <body>
      <?php include("menu.php");
      try{
        //Connexion à MySql
        $bdd = new PDO('mysql:host=localhost;dbname=cartes_a_collectionner;charset=utf8', 'root', 'Kaae7vad');
      }catch (Exception $e){
        die('Erreur : ' . $e->getMessage());
      }?>
      <h2>Ajouter un nouveau joueur</h2>

      <p>
        <form method="post">
          Pseudonyme :<input type="text" name="pseudonyme"/><br/>
          Nom :       <input type="text" name="nom"/><br/>
          Prénom :    <input type="text" name="prenom"/><br/></br>
          <input type="submit" name="new_player" value="Ajouter joueur"/>
      </form>
      </p>

      <?php
      $prenom = NULL; $nom = NULL; $pseudo = NULL;
      if(isset($_POST["pseudonyme"])){
        $pseudo = $_POST["pseudonyme"];
      }
      if(isset($_POST["nom"])){
        $nom = $_POST["nom"];
      }
      if(isset($_POST["prenom"])){
        $prenom = $_POST["prenom"];
      }
      if($prenom != NULL && $nom != NULL && $pseudo != NULL){
        print("Bonjour $prenom $nom, aussi connu sous le nom de $pseudo.");
      }else{
        echo "Veuillez remplir tous les champs SVP";
      }?></br></br>
      <?php
      $req = $bdd->query('select max(ID_JOUEUR) from JOUEURS');
      $donnee = $req->fetch();
      echo $donnee['max(ID_JOUEUR)'];
      ?>
    </body>
