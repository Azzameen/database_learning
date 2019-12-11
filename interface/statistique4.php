<!DOCTYPE html>
<html>
    <head>
        <title>Statistique 4</title>
        <link rel="stylesheet" href="styles.css">
        <meta charset="utf-8" />
    </head>

    <?php
    include("menu.php");
    include("connect_bdd.php");
    ?>

    <body>
      <h2>Liste des joueurs possédant le plus de cartes rares</h2>
      <h4>Date d'impression inférieure à 2000 ou tirage inférieur à 100</h4>
      <?php
      $req = $bdd->query('Select JOUEURS.NOM_JOUEUR, PRENOM_JOUEUR, PSEUDONYME, TMP.NB_RARE from JOUEURS
      left join
      (Select JOUEURS.ID_JOUEUR, count(JOUEURS.NOM_JOUEUR) AS NB_RARE from JOUEURS
      left join POSSESSIONS_EXEMPLAIRES on POSSESSIONS_EXEMPLAIRES.ID_JOUEUR = JOUEURS.ID_JOUEUR
      left join EXEMPLAIRES on EXEMPLAIRES.ID_EXEMPLAIRE = POSSESSIONS_EXEMPLAIRES.ID_EXEMPLAIRE
      left join CARTES on EXEMPLAIRES.ID_CARTE = CARTES.ID_CARTE
      left join APPARTENANCES on APPARTENANCES.ID_CARTE = CARTES.ID_CARTE
      where APPARTENANCES.NB_TIRAGE <= 100 OR EXEMPLAIRES.DATE_IMPRESSION <= \'01-JAN-2000\'
      group by JOUEURS.ID_JOUEUR
      order by NB_RARE DESC) TMP
      on JOUEURS.ID_JOUEUR = TMP.ID_JOUEUR');
      ?>

      <?php
      while($donnees = $req->fetch()){?>
        Joueur : <strong><?php echo $donnees['PRENOM_JOUEUR']; echo ' '.$donnees['NOM_JOUEUR'];?></strong></br>
        Pseudonyme :   <strong><?php echo $donnees['PSEUDONYME'];?></strong></br>
        Nombre de cartes rares : <strong><?php echo $donnees['NB_RARE'];?></strong></br></br>
      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
    </body>
</html>
