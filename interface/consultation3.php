<html>
  <head>
    <title>Consultation 3</title>
    <link rel="stylesheet" href="styles.css">
    <meta charset="utf-8" />
  </head>

  <?php
  include("menu.php");
  include("connect_bdd.php");
  ?>

  <body>
    <h2>Liste des joueurs collectionneurs (qui n'ont fait aucun partie)</h2>

    <?php
    $req = $bdd->query('select * from JOUEURS
    where JOUEURS.ID_JOUEUR not in
    (select ID_JOUEUR from UTILISATIONS)');

    while($donnees = $req->fetch()){?>
      Prénom :     <strong><?php echo $donnees['PRENOM_JOUEUR'];?></strong></br>
      Nom :        <strong><?php echo $donnees['NOM_JOUEUR'];?></strong></br>
      Pseudonyme : <strong><?php echo $donnees['PSEUDONYME'];?></strong></br></br>

      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
  </body>
</html>
