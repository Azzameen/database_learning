<!DOCTYPE html>
<html>
    <head>
        <title>Suppression Joueur</title>
        <meta charset="utf-8" />
    </head>

    <?php
    include("menu.php");
    include("connect_bdd.php");
    ?>

    <body>
      <h2>Supprimer un joueur existant de la base</h2>

      <?php
      $req_id = $bdd->query('select ID_JOUEUR, PRENOM_JOUEUR, NOM_JOUEUR, PSEUDONYME from JOUEURS');
      ?>
      <form action="" method="post">
         Joueur à supprimer :
        <select name="id_a_suppr">
          <?php
          while($donnee = $req_id->fetch()){
            $id = $donnee['ID_JOUEUR'];
            $prenom = $donnee['PRENOM_JOUEUR'];
            $nom = $donnee['NOM_JOUEUR'];
            $pseudo = $donnee['PSEUDONYME'];
            echo "<option value=$id>$prenom, $nom, $pseudo</option>";
          }
          ?>
        </select>
        <input type="submit" name="new_player" value="Supprimer joueur"/>
      </form></br>

      <?php
      if(isset($_POST['id_a_suppr'])){
        $id_suppr = $_POST['id_a_suppr'];
        $req = $bdd->prepare('select PRENOM_JOUEUR, NOM_JOUEUR, PSEUDONYME from
        JOUEURS where ID_JOUEUR = :id');
        $req->execute(array(
          'id' => $id_suppr
        ));
        $donnee = $req->fetch();
        $prenom = $donnee['PRENOM_JOUEUR'];
        $nom = $donnee['NOM_JOUEUR'];
        $pseudo = $donnee['PSEUDONYME'];

        $req = $bdd->prepare('delete from POSSESSIONS_EXEMPLAIRES where ID_JOUEUR = :id');
        $req->execute(array(
          'id' => $id_suppr
        ));

        $req = $bdd->prepare('delete from UTILISATIONS where ID_JOUEUR = :id');
        $req->execute(array(
          'id' => $id_suppr
        ));

        $req_annexe = $bdd->prepare('select ID_DECK from DECKS where ID_JOUEUR = :id');
        $req_annexe->execute(array(
          'id' => $id_suppr
        ));
        while($donnee_annexe = $req_annexe->fetch()){
          $req = $bdd->prepare('delete from CONTENANCE where ID_DECK = :id_deck');
          $req->execute(array(
            'id_deck' => $donnee_annexe['ID_DECK']
          ));
        }

        $req = $bdd->prepare('delete from DECK where ID_JOUEUR = :id');
        $req->execute(array(
          'id' => $id_suppr
        ));

        $req = $bdd->prepare('delete from JEU where ID_JOUEUR1 = :id1 or ID_JOUEUR2 = :id2');
        $req->execute(array(
          'id1' => $id_suppr,
          'id2' => $id_suppr,
        ));

        $req = $bdd->prepare('delete from JOUEURS where ID_JOUEUR = :id');
        $req->execute(array(
          'id' => $id_suppr
        ));
        ?>
        Joueur <strong><?php echo $prenom.' '.$nom?></strong>
        de pseudonyme <strong><?php echo $pseudo?></strong> supprimé de la base.

        <?php
      }else {
        echo "Sélectionnez un joueur à supprimer";
      }
      ?>

    </body>
