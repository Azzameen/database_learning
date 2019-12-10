<!DOCTYPE html>
<html>
    <head>
        <title>Ajout Joueur</title>
        <meta charset="utf-8" />
    </head>

    <?php
    include("menu.php");
    include("connect_bdd.php");
    ?>

    <body>
      <h2>Ajouter un nouveau joueur</h2>

      <p>
        <form method="post">
          Prénom : <input type="text" name="prenom"/><br/>
          Nom : <input type="text" name="nom"/><br/>
          Pseudonyme : <input type="text" name="pseudonyme"/><br/></br>
          <input type="submit" name="new_player" value="Ajouter joueur"/>
      </form>
      </p>

      <?php
      $prenom = NULL; $nom = NULL; $pseudo = NULL;
      if(isset($_POST["pseudonyme"])){
        $pseudo = strtoupper($_POST["pseudonyme"]);
      }
      if(isset($_POST["nom"])){
        $nom = strtoupper($_POST["nom"]);
      }
      if(isset($_POST["prenom"])){
        $prenom = strtoupper($_POST["prenom"]);
      }
      if($prenom != NULL && $nom != NULL && $pseudo != NULL){
        print("Bonjour $prenom $nom, aussi connu sous le nom de $pseudo.");
        $req = $bdd->query('select max(ID_JOUEUR) from JOUEURS');
        $donnee = $req->fetch();
        $new_id = $donnee['max(ID_JOUEUR)']+1;
        $insert = $bdd->prepare('insert into JOUEURS values (:id, :nom, :prenom, :pseudonyme)');
        $insert->execute(array(
          'id' => $new_id,
          'prenom' => $prenom,
          'nom' => $nom,
          'pseudonyme' => $pseudo
        ));
        echo ' Vous avez été ajouté à la BDD.';
      }else{
        echo "Veuillez remplir tous les champs SVP";
      }?></br></br>
      <?php
      ?>
    </body>
</html>
