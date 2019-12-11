<!DOCTYPE html>
<html>
    <head>
        <title>Statistique 3</title>
        <meta charset="utf-8" />
    </head>

    <?php
    include("menu.php");
    include("connect_bdd.php");
    ?>

    <body>
      <h2>Liste des cartes avec le nombre de joueurs qui les utilisent dans leurs decks</h2>

      <table border=5 cellpadding=3>
        <tr>
          <th><strong>Identifiant</strong></th>
          <th><strong>Titre</strong></th>
          <th><strong>Nature</strong></th>
          <th><strong>Nombre d'utilisations</strong></th>
        </tr>

      <?php
      $req = $bdd->query('select CARTES.TITRE, CARTES.ID_CARTE, CARTES.NATURE_CARTE, coalesce(count(DECKS.ID_JOUEUR),0) AS NOMBRE_UTILISATIONS from CARTES
      left join (CONTENANCE
      inner join DECKS on CONTENANCE.ID_DECK = DECKS.ID_DECK)
      on CARTES.ID_CARTE = CONTENANCE.ID_CARTE
      group by CARTES.TITRE, CARTES.ID_CARTE, CARTES.NATURE_CARTE
      order by CARTES.ID_CARTE');?>

      <?php
      while($donnees = $req->fetch()){?>
        <tr>
          <td align="center"><?php echo $donnees['ID_CARTE'] ?></td>
          <td><?php echo $donnees['TITRE'] ?></td>
          <td><?php echo $donnees['NATURE_CARTE'] ?></td>
          <td align="center"><?php echo $donnees['NOMBRE_UTILISATIONS'] ?></td>
        </tr>
      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
    </body>
</html>
