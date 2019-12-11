<html>
  <head>
    <title>Consultation 1</title>
    <meta charset="utf-8" />
  </head>

  <?php
  include("menu.php");
  include("connect_bdd.php");
  ?>

  <body>
    <h2>Liste des cartes d'une certaine nature</h2>

    <form action="" method="post">
      <select name="nature">
        <option value="Monstre Normal"> Monstre Normal</option>
        <option value="Monstre Effet"> Monstre Effet</option>
        <option value="Monstre Fusion"> Monstre Fusion</option>
        <option value="Magie"> Magie </option>
        <option value="Piège"> Piège </option>
      </select>
      <input type="submit" name="submit" value="Afficher" />
    </form>

    <h4>Liste des cartes de nature "
      <?php
      if(isset($_POST["nature"])){
        echo $_POST['nature'];
      }else{
        echo "Choisir ci-dessus";
      }
      ?>" :</h4>

    <ul>
    <?php
    $req = $bdd->prepare('select * from CARTES
    where NATURE_CARTE = ?');
    if(isset($_POST["nature"])){
      $req->execute(array($_POST['nature']));
    }

    while($donnees = $req->fetch())
    {
    ?>
    <li><strong><?php echo $donnees['TITRE'];?></strong> de niveau <strong><?php echo $donnees['NIVEAU_CARTE'];?></strong>
    , de nature <strong><?php echo $donnees['NATURE_CARTE']?></strong> et de type <strong><?php echo $donnees['TYPE_CARTE']?></strong></br>
    <?php echo $donnees['DESC_CARTE']; ?></br></br></li>

    <?php
    }
    $req->closeCursor(); //Fin de traitement
    ?>

    </ul>
  </body>
</html>
