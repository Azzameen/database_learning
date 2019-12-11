<!DOCTYPE html>
<html>
    <head>
        <title>Statistique 4</title>
        <meta charset="utf-8" />
    </head>

    <?php
    include("menu.php");
    include("connect_bdd.php");
    ?>

    <body>
      <h2>Liste des joueurs possédant le plus de cartes rares</h2>
      <h4>Date d'impression inférieure à 2000 ou tirage inférieur à 100</h4>

      <table border=5 cellpadding=3>
        <tr>
          <th><strong>Identifiant</strong></th>
          <th><strong>Prénom</strong></th>
          <th><strong>Nom</strong></th>
          <th><strong>Pseudonyme</strong></th>
          <th><strong>Nombre de cartes rares</strong></th>
        </tr>

      <?php
      $req = $bdd->query('Select JOUEURS.ID_JOUEUR, JOUEURS.NOM_JOUEUR, PRENOM_JOUEUR, PSEUDONYME, coalesce(TMP.NB_RARE, 0) as RARE from JOUEURS
      left join
        (Select JOUEURS.ID_JOUEUR, count(JOUEURS.NOM_JOUEUR) AS NB_RARE from JOUEURS
          left join (POSSESSIONS_EXEMPLAIRES
            inner join EXEMPLAIRES on EXEMPLAIRES.ID_EXEMPLAIRE = POSSESSIONS_EXEMPLAIRES.ID_EXEMPLAIRE
            inner join CARTES on EXEMPLAIRES.ID_CARTE = CARTES.ID_CARTE
            inner join APPARTENANCES on APPARTENANCES.ID_CARTE = CARTES.ID_CARTE)
          on POSSESSIONS_EXEMPLAIRES.ID_JOUEUR = JOUEURS.ID_JOUEUR
          where APPARTENANCES.NB_TIRAGE <= 100 OR EXEMPLAIRES.DATE_IMPRESSION <= \'01-JAN-2000\'
          group by JOUEURS.ID_JOUEUR
          order by NB_RARE DESC) TMP
        on JOUEURS.ID_JOUEUR = TMP.ID_JOUEUR');
      ?>

      <?php
      while($donnees = $req->fetch()){?>
        <tr>
          <td align="center"><?php echo $donnees['ID_JOUEUR'] ?></td>
          <td><?php echo $donnees['PRENOM_JOUEUR'] ?></td>
          <td><?php echo $donnees['NOM_JOUEUR'] ?></td>
          <td><?php echo $donnees['PSEUDONYME'] ?></td>
          <td align="center"><?php echo $donnees['RARE'] ?></td>
        </tr>
      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
    </body>
</html>
