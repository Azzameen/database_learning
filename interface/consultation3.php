<html>
  <head>
    <title>Consultation 3</title>
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
      <li>
        <strong>Pseudonyme : </strong><?php echo $donnees['PSEUDONYME'];?></br>
        <strong>Prénom : </strong><?php echo $donnees['PRENOM_JOUEUR'];?></br>
        <strong>Nom : </strong><?php echo $donnees['NOM_JOUEUR'];?></br>
      </li></br>

      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
  </body>
</html>
