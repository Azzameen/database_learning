<!DOCTYPE html>
<html>
    <head>
        <title>Modification Joueur</title>
        <link rel="stylesheet" href="styles.css">
        <meta charset="utf-8" />
    </head>

    <?php
    include("menu.php");
    include("connect_bdd.php");
    ?>

    <body>
      <h2>Modifier un joueur existant de la base</h2>

      <?php
      $req_id = $bdd->query('select max(ID_JOUEUR) from JOUEURS');
      $donnee = $req_id->fetch();
      $max_id = $donnee['max(ID_JOUEUR)'];
      ?>

      <form action="" method="post">
        Nouveau prénom : <input type="text" name="prenom"/><br/>
        Nouveau nom : <input type="text" name="nom"/><br/>
        Nouveau pseudonyme : <input type="text" name="pseudonyme"/><br/>
        Identifiant du joueur à modifier :
        <select name="id_a_modif">
          <?php
          $i = 1;
          while($i<=$max_id){
            echo "<option value=$i>$i</option>";
            $i++;
          }
          ?>
        </select><br/></br>
        <input type="submit" name="new_player" value="Modifier joueur"/>
      </form></br>

      <?php
      if(isset($_POST['id_a_modif'])){
        $req_s = $bdd->prepare('select PRENOM_JOUEUR, NOM_JOUEUR, PSEUDONYME from JOUEURS
        where ID_JOUEUR = ?');
        $req_s->execute(array($_POST['id_a_modif']));
        $donnee = $req_s->fetch();

        $old_prenom = $donnee['PRENOM_JOUEUR'];
        $old_nom    = $donnee['NOM_JOUEUR'];
        $old_pseudo = $donnee['PSEUDONYME'];
        ?>
        Vous avez changé le joueur
        <strong><?php echo $old_prenom; echo ' '.$old_nom?></strong>
        de pseudonyme <strong><?php echo $old_pseudo?></strong></br>

        <?php
        $new_prenom = NULL; $new_nom = NULL; $new_pseudo = NULL;
        if(isset($_POST["pseudonyme"])){
          $new_pseudo = strtoupper($_POST["pseudonyme"]);
          if($new_pseudo == '') $new_pseudo = $old_pseudo;
        }
        if(isset($_POST["nom"])){
          $new_nom = strtoupper($_POST["nom"]);
          if($new_nom == '') $new_nom = $old_nom;
        }
        if(isset($_POST["prenom"])){
          $new_prenom = strtoupper($_POST["prenom"]);
          if($new_prenom == '') $new_prenom = $old_prenom;
        }
        ?>
        par le joueur <strong><?php echo $new_prenom; echo ' '.$new_nom?></strong>
        de pseudonyme <strong><?php echo $new_pseudo?></strong>.</br></br>

        <?php
        $modify = $bdd->prepare('update JOUEURS
        set NOM_JOUEUR = :nom, PRENOM_JOUEUR = :prenom, PSEUDONYME = :pseudonyme
        where ID_JOUEUR = :id');
        $modify->execute(array(
          'id' => $_POST['id_a_modif'],
          'prenom' => $new_prenom,
          'nom' => $new_nom,
          'pseudonyme' => $new_pseudo
        ));
        ?>

      <?php
      }else{
        echo "Sélectionnez un ID de joueur à modifier";
      }?>
    </body>
</html>
