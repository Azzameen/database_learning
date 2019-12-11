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

      <table border=5 cellpadding=3>
        <tr>
          <th><strong>Identifiant</strong></th>
          <th><strong>Prénom</strong></th>
          <th><strong>Nom</strong></th>
          <th><strong>Pseudonyme</strong></th>
          <th><strong>Nombre de cartes</strong></th>
        </tr>

      <?php
      $req = $bdd->query('Select JOUEURS.ID_JOUEUR, JOUEURS.NOM_JOUEUR, JOUEURS.PRENOM_JOUEUR, JOUEURS.PSEUDONYME,
      count(POSSESSIONS_EXEMPLAIRES.ID_EXEMPLAIRE) as TOTAL
      from POSSESSIONS_EXEMPLAIRES
      right JOIN JOUEURS on JOUEURS.ID_JOUEUR = POSSESSIONS_EXEMPLAIRES.ID_JOUEUR
      group by JOUEURS.ID_JOUEUR, JOUEURS.NOM_JOUEUR, JOUEURS.PRENOM_JOUEUR, JOUEURS.PSEUDONYME');

      while($donnees = $req->fetch()){?>
        <tr>
          <td align="center"><?php echo $donnees['ID_JOUEUR'] ?></td>
          <td><?php echo $donnees['PRENOM_JOUEUR'] ?></td>
          <td><?php echo $donnees['NOM_JOUEUR'] ?></td>
          <td><?php echo $donnees['PSEUDONYME'] ?></td>
          <td align="center"><?php echo $donnees['TOTAL'] ?></td>
        </tr>
      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
    </body>
</html>
