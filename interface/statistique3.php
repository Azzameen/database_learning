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
      <?php
      $req = $bdd->query('select CARTES.TITRE, coalesce(count(DECKS.ID_JOUEUR),0) AS NOMBRE_UTILISATIONS from CARTES
      left join (CONTENANCE
      inner join DECKS on CONTENANCE.ID_DECK = DECKS.ID_DECK)
      on CARTES.ID_CARTE = CONTENANCE.ID_CARTE
      group by CARTES.TITRE');?>

      <?php
      while($donnees = $req->fetch()){?>
        Carte : <strong> <?php echo $donnees['TITRE'];?></strong></br>
        Nombre d'utilisations : <strong> <?php echo $donnees['NOMBRE_UTILISATIONS'];?></strong></br></br>
      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
    </body>
</html>
