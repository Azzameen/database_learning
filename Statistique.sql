Create view JoueursNbCartes as(
  Select IdJoueur,Nom,Prenom,Pseudonyme,count(*) from JOUEUR
  natural join DECK -- a remplacer par des join normaux
  natural join CONTENIR
  natural join CARTE
  group by IdJoueur);

Create view JoueursClassement as(
  Select IdJoueur,Nom,Prenom,Pseudonyme,sum((Qualite/100)*Cote)
  from JOUEUR
  natural join EXEMPLAIRE
  natural join EDITION
  natural join APPARTENIR
  group by IdJoueur
)
