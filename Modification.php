<?php include "Header.php"; ?>
<div class="content">
  <h1> Modifications</h1>
  <h2> Ajout d'une carte </h2>
  <p> Titre :
    <input type="text" name="Titre"/>
    <br/> Description :
    <input type="text" name="Description"/> <br/>
    Edition : <input type="text" name="Edition"/> <br/>
    Date : <input type="date" name="Date"/> <br/>
    Type de carte :
    <form action="#" method="post">
      <select name="type">
        <option value="Monstre"> Monstre </option>
        <option value="Magie"> Magie </option>
        <option value="Piège"> Piège </option>
        <option value="Terrain"> Terrain </option>
      </select>
      <br/>
      <input type="submit" name="submit" value="Get Selected Values" />
    </form>
    <?php if($_POST["type"] == "Monstre"){
      echo "Attaque :";
      echo "<input type='number' name='Attaque'/>";
      echo "</br>";
      echo "Défense :";
    } ?>
  </p>
</div>
