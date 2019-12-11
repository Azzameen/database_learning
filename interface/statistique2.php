<!DOCTYPE html>
<html>
    <head>
        <title>Statistique 2</title>
        <link rel="stylesheet" href="styles.css">
        <meta charset="utf-8" />
    </head>

    <?php
    include("menu.php");
    include("connect_bdd.php");
    ?>

    <body>
      <h2>Classement des joueurs en fonction de la valeur de leur collection</h2>
      <?php
      $req = $bdd->query('  Select JOUEURS.ID_JOUEUR, JOUEURS.NOM_JOUEUR, JOUEURS.PRENOM_JOUEUR, JOUEURS.PSEUDONYME,
  sum((EXEMPLAIRES.QUALITE/100)*APPARTENANCES.COTE) as VALEUR
  from JOUEURS
  left join POSSESSIONS_EXEMPLAIRES on JOUEURS.ID_JOUEUR = POSSESSIONS_EXEMPLAIRES.ID_JOUEUR
  inner join EXEMPLAIRES on EXEMPLAIRES.ID_EXEMPLAIRE = POSSESSIONS_EXEMPLAIRES.ID_EXEMPLAIRE
  inner join APPARTENANCES on APPARTENANCES.ID_CARTE = EXEMPLAIRES.ID_CARTE
  group by JOUEURS.ID_JOUEUR, JOUEURS.NOM_JOUEUR, JOUEURS.PRENOM_JOUEUR, JOUEURS.PSEUDONYME
  order by VALEUR desc');

      while($donnees = $req->fetch()){?>
        Joueur :<strong> <?php echo $donnees['PRENOM_JOUEUR']; echo ' '.$donnees['NOM_JOUEUR'];?></strong></br>
        Pseudonyme : <strong> <?php echo $donnees['PSEUDONYME'];?></strong></br>
        Valeur de la collection : <strong> <?php echo $donnees['VALEUR'];?> €</strong></br></br>
      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
    </body>
</html>
