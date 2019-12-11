<html>
  <head>
    <title>Consultation 2</title>
    <meta charset="utf-8" />
    <link href="style.css">
  </head>

  <?php
  include("menu.php");
  include("connect_bdd.php");
  ?>

  <body>
    <h2>Liste des cartes qui ne font partie d'aucun deck</h2>

    <table border=5 cellpadding=3>
      <tr>
        <th><strong>Identifiant</strong></th>
        <th><strong>Titre</strong></th>
        <th><strong>Nature</strong></th>
        <th><strong>Type</strong></th>
        <th><strong>Niveau</strong></th>
        <th><strong>Description</strong></th>
      </tr>

    <?php
    $req = $bdd->query('select * from CARTES
    where CARTES.ID_CARTE not in
    (select ID_CARTE from CONTENANCE)');

    while($donnees = $req->fetch()){?>
      <tr>
          <td align="center"><?php echo $donnees['ID_CARTE'] ?></td>
          <td><?php echo $donnees['TITRE'] ?></td>
          <td><?php echo $donnees['NATURE_CARTE'] ?></td>
          <td><?php echo $donnees['TYPE_CARTE'] ?></td>
          <td align="center"><?php echo $donnees['NIVEAU_CARTE'] ?></td>
          <td><?php echo $donnees['DESC_CARTE'] ?></td>
      </tr>

      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
    </table></br>
  </body>
</html>
