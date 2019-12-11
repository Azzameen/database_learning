<!DOCTYPE html>
<html>
    <head>
        <title>Statistique 1</title>
        <meta charset="utf-8" />
    </head>

    <?php
    include("menu.php");
    include("connect_bdd.php");
    ?>

    <body>
      <h2>Nombre de cartes par joueur</h2>
      <?php
      $req = $bdd->query('Select JOUEURS.ID_JOUEUR, JOUEURS.NOM_JOUEUR, JOUEURS.PRENOM_JOUEUR, JOUEURS.PSEUDONYME,
      count(POSSESSIONS_EXEMPLAIRES.ID_EXEMPLAIRE) as TOTAL
      from POSSESSIONS_EXEMPLAIRES
      right JOIN JOUEURS on JOUEURS.ID_JOUEUR = POSSESSIONS_EXEMPLAIRES.ID_JOUEUR
      group by JOUEURS.ID_JOUEUR, JOUEURS.NOM_JOUEUR, JOUEURS.PRENOM_JOUEUR, JOUEURS.PSEUDONYME');

      while($donnees = $req->fetch()){?>
        Joueur :<strong> <?php echo $donnees['PRENOM_JOUEUR']; echo ' '.$donnees['NOM_JOUEUR'];?></strong></br>
        Pseudonyme :<strong> <?php echo $donnees['PSEUDONYME'];?></strong></br>
        Nombre de cartes : <strong> <?php echo $donnees['TOTAL'];?></strong></br></br>
      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
    </body>
</html>
