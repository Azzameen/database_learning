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

    <table border=5 cellpadding=3>
      <tr>
        <th><strong>Identifiant</strong></th>
        <th><strong>Prénom</strong></th>
        <th><strong>Nom</strong></th>
        <th><strong>Pseudonyme</strong></th>
      </tr>

    <?php
    $req = $bdd->query('select * from JOUEURS
    where JOUEURS.ID_JOUEUR not in
    (select ID_JOUEUR from UTILISATIONS)');

    while($donnees = $req->fetch()){?>
      <tr>
        <td align="center"><?php echo $donnees['ID_JOUEUR'] ?></td>
        <td><?php echo $donnees['PRENOM_JOUEUR'] ?></td>
        <td><?php echo $donnees['NOM_JOUEUR'] ?></td>
        <td><?php echo $donnees['PSEUDONYME'] ?></td>
      </tr>
      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
      </table></br>
  </body>
</html>
