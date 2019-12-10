<!DOCTYPE html>
<html>
    <head>
        <title>Statistique 2</title>
        <meta charset="utf-8" />
    </head>

    <?php
    include("menu.php");
    include("connect_bdd.php");
    ?>

    <body>
      <h2>Classement des joueurs en fonction de la valeur de leur collection</h2>
      <?php
      $req = $bdd->query('  Select ID_JOUEUR, NOM_JOUEUR, PRENOM_JOUEUR, PSEUDONYME,
      sum((EXEMPLAIRES.QUALITE/100)*APPARTENANCES.COTE) as VALEUR
      from JOUEURS
      natural join POSSESSIONS_EXEMPLAIRES
      natural join EXEMPLAIRES
      natural join APPARTENANCES
      group by ID_JOUEUR, NOM_JOUEUR, PRENOM_JOUEUR, PSEUDONYME
      order by VALEUR desc');

      while($donnees = $req->fetch()){?>
        Prénom :     <?php echo $donnees['PRENOM_JOUEUR'];?></br>
        Nom :        <?php echo $donnees['NOM_JOUEUR'];?></br>
        Pseudonyme : <?php echo $donnees['PSEUDONYME'];?></br>
        Nombre de cartes : <?php echo $donnees['VALEUR'];?></br></br>
      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
    </body>
</html>
