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

      <table border=5 cellpadding=3>
        <tr>
          <th><strong>Identifiant</strong></th>
          <th><strong>Prénom</strong></th>
          <th><strong>Nom</strong></th>
          <th><strong>Pseudonyme</strong></th>
          <th><strong>Valeur de la collection</strong></td>
        </tr>

      <?php
      $req = $bdd->query('  Select JOUEURS.ID_JOUEUR, JOUEURS.NOM_JOUEUR, JOUEURS.PRENOM_JOUEUR, JOUEURS.PSEUDONYME,
      coalesce(sum((EXEMPLAIRES.QUALITE/100)*APPARTENANCES.COTE),0) as VALEUR
      from JOUEURS
      left join (POSSESSIONS_EXEMPLAIRES
      inner join EXEMPLAIRES on EXEMPLAIRES.ID_EXEMPLAIRE = POSSESSIONS_EXEMPLAIRES.ID_EXEMPLAIRE
      inner join APPARTENANCES on APPARTENANCES.ID_CARTE = EXEMPLAIRES.ID_CARTE)
      on JOUEURS.ID_JOUEUR = POSSESSIONS_EXEMPLAIRES.ID_JOUEUR
      group by JOUEURS.ID_JOUEUR
      order by VALEUR desc');

      while($donnees = $req->fetch()){?>
        <tr>
          <td align="center"><?php echo $donnees['ID_JOUEUR'] ?></td>
          <td><?php echo $donnees['PRENOM_JOUEUR'] ?></td>
          <td><?php echo $donnees['NOM_JOUEUR'] ?></td>
          <td><?php echo $donnees['PSEUDONYME'] ?></td>
          <td align="center"><?php echo $donnees['VALEUR'] ?> €</td>
        </tr>
      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
    </body>
</html>
