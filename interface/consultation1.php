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
    $req = $bdd->prepare('select * from CARTES
    where NATURE_CARTE = ?');
    if(isset($_POST["nature"])){
      $req->execute(array($_POST['nature']));
    }

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
