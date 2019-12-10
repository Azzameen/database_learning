<!DOCTYPE html>
<html>
    <head>
        <title>Statistique 5</title>
        <meta charset="utf-8" />
    </head>

    <?php
    include("menu.php");
    include("connect_bdd.php");
    ?>

    <body>
      <h2>Liste des types de cartes avec pour chacune la meilleure caractéristique</h2>
      <?php
      $req = $bdd->query('Select distinct A.TYPE_CARTE, A.DESC_CARACTERISTIQUES from (
        Select CARACTERISTIQUES.DESC_CARACTERISTIQUES, CARTES.TYPE_CARTE, CARACTERISTIQUES.VALEURS, CARTES.TITRE from (CARTES
        left join POSSESSIONS_CARACTERISTIQUES on CARTES.ID_CARTE = POSSESSIONS_CARACTERISTIQUES.ID_CARTE)
        left join CARACTERISTIQUES on CARACTERISTIQUES.ID_CARACTERISTIQUES = POSSESSIONS_CARACTERISTIQUES.ID_CARACTERISTIQUES
        ) A
      inner join (
        Select TYPE_CARTE, max(VALEURS) MAX_VAl from (
          Select CARACTERISTIQUES.DESC_CARACTERISTIQUES, CARTES.TYPE_CARTE, CARACTERISTIQUES.VALEURS, CARTES.TITRE from (CARTES
          left join POSSESSIONS_CARACTERISTIQUES on CARTES.ID_CARTE = POSSESSIONS_CARACTERISTIQUES.ID_CARTE)
          left join CARACTERISTIQUES on CARACTERISTIQUES.ID_CARACTERISTIQUES = POSSESSIONS_CARACTERISTIQUES.ID_CARACTERISTIQUES
          ) ABIS
      group by TYPE_CARTE) B
      on A.TYPE_CARTE = B.TYPE_CARTE
      where B.MAX_VAL = VALEURS');
      ?>

      <?php
      while($donnees = $req->fetch()){?>
        Type de carte : <strong><?php echo $donnees['TYPE_CARTE'];?></strong></br>
        Caractéristique la plus haute : <strong><?php echo $donnees['DESC_CARACTERISTIQUES'];?></strong></br></br>
      <?php
      }
      $req->closeCursor(); //Fin de traitement
      ?>
    </body>
</html>
