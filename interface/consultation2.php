<html>
  <head>
    <title>Consultation 2</title>
    <link rel="stylesheet" href="styles.css">
    <meta charset="utf-8" />
  </head>

  <?php
  include("menu.php");
  include("connect_bdd.php");
  ?>

  <body>
    <h2>Liste des cartes qui ne font partie d'aucun deck</h2>

    <?php
    $req = $bdd->query('select * from CARTES
    where CARTES.ID_CARTE not in
    (select ID_CARTE from CONTENANCE)');

    while($donnees = $req->fetch()){?>
      <li><strong><?php echo $donnees['TITRE'];?></strong>
      , de nature <strong><?php echo $donnees['NATURE_CARTE']?></strong></br>
      <?php echo $donnees['DESC_CARTE']; ?></br></br></li>

      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
  </body>
</html>
