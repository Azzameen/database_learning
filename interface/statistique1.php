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
      inner join JOUEURS on JOUEURS.ID_JOUEUR = POSSESSIONS_EXEMPLAIRES.ID_JOUEUR
      group by JOUEURS.ID_JOUEUR, JOUEURS.NOM_JOUEUR, JOUEURS.PRENOM_JOUEUR, JOUEURS.PSEUDONYME');

      while($donnees = $req->fetch()){?>
        Prénom :     <?php echo $donnees['PRENOM_JOUEUR'];?></br>
        Nom :        <?php echo $donnees['NOM_JOUEUR'];?></br>
        Pseudonyme : <?php echo $donnees['PSEUDONYME'];?></br>
        Nombre de cartes : <?php echo $donnees['TOTAL'];?></br></br>
      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
    </body>
</html>
