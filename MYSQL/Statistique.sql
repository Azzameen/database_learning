-- =======================================================
-- Nombre de carte possedées par joueurs
-- =======================================================

Create view Nombre_de_cartes_par_joueur as(
  Select JOUEURS.ID_JOUEUR, JOUEURS.NOM_JOUEUR, JOUEURS.PRENOM_JOUEUR, JOUEURS.PSEUDONYME,
  count(POSSESSIONS_EXEMPLAIRES.ID_EXEMPLAIRE) as TOTAL
  from JOUEURS
  left JOIN POSSESSIONS_EXEMPLAIRES on JOUEURS.ID_JOUEUR = POSSESSIONS_EXEMPLAIRES.ID_JOUEUR
  group by JOUEURS.ID_JOUEUR, JOUEURS.NOM_JOUEUR, JOUEURS.PRENOM_JOUEUR, JOUEURS.PSEUDONYME
);

-- =======================================================
-- Classement des joueurs en fonction de la valeur de leur deck
-- =======================================================

Create view Classement_joueurs_qualite_collection as (
  Select JOUEURS.ID_JOUEUR, JOUEURS.NOM_JOUEUR, JOUEURS.PRENOM_JOUEUR, JOUEURS.PSEUDONYME,
  coalesce(sum((EXEMPLAIRES.QUALITE/100)*APPARTENANCES.COTE),0) as VALEUR
  from JOUEURS
  left join (POSSESSIONS_EXEMPLAIRES
  inner join EXEMPLAIRES on EXEMPLAIRES.ID_EXEMPLAIRE = POSSESSIONS_EXEMPLAIRES.ID_EXEMPLAIRE
  inner join APPARTENANCES on APPARTENANCES.ID_CARTE = EXEMPLAIRES.ID_CARTE)
  on JOUEURS.ID_JOUEUR = POSSESSIONS_EXEMPLAIRES.ID_JOUEUR
  group by JOUEURS.ID_JOUEUR
  order by VALEUR desc
);

-- =======================================================
-- Le nombre de fois pour chaque carte qu'elle apparait dans un deck
-- =======================================================

Create view Cartes_par_joueur as(
  Select CARTES.TITRE, coalesce(sum(DECKS.ID_JOUEUR),0) AS NOMBRE_UTILISATIONS from CARTES
  left join (CONTENANCE
  inner join DECKS on CONTENANCE.ID_DECK = DECKS.ID_DECK)
  on CARTES.ID_CARTE = CONTENANCE.ID_CARTE
  group by CARTES.TITRE
);

-- =======================================================
-- Donne le nombre de carte possedées par joueurs
-- =======================================================

Create view Joueur_possession_carte_rare as(
Select JOUEURS.NOM_JOUEUR, coalesce(TMP.NB_RARE, 0) from JOUEURS
left join
(Select JOUEURS.ID_JOUEUR, count(JOUEURS.NOM_JOUEUR) AS NB_RARE from JOUEURS
left join (POSSESSIONS_EXEMPLAIRES
inner join EXEMPLAIRES on EXEMPLAIRES.ID_EXEMPLAIRE = POSSESSIONS_EXEMPLAIRES.ID_EXEMPLAIRE
inner join CARTES on EXEMPLAIRES.ID_CARTE = CARTES.ID_CARTE
inner join APPARTENANCES on APPARTENANCES.ID_CARTE = CARTES.ID_CARTE)
on POSSESSIONS_EXEMPLAIRES.ID_JOUEUR = JOUEURS.ID_JOUEUR
where APPARTENANCES.NB_TIRAGE <= 100 OR EXEMPLAIRES.DATE_IMPRESSION <= '01-JAN-2000'
group by JOUEURS.ID_JOUEUR
order by NB_RARE DESC) TMP
on JOUEURS.ID_JOUEUR = TMP.ID_JOUEUR
);

-- =======================================================
-- Caracteristique dans laquelle chaque famille de classe est la meilleure
-- =======================================================

Create view A as ( -- Trouver comment rename et mettre dans une autre vue obligatoire a faire avant de lancer celle la
  Select CARACTERISTIQUES.DESC_CARACTERISTIQUES, CARTES.TYPE_CARTE, CARACTERISTIQUES.VALEURS, CARTES.TITRE from (CARTES
  left join POSSESSIONS_CARACTERISTIQUES on CARTES.ID_CARTE = POSSESSIONS_CARACTERISTIQUES.ID_CARTE)
  left join CARACTERISTIQUES on CARACTERISTIQUES.ID_CARACTERISTIQUES = POSSESSIONS_CARACTERISTIQUES.ID_CARACTERISTIQUES
);

Create view Meilleur_Caracteristiques as (
  Select distinct A.TYPE_CARTE, A.DESC_CARACTERISTIQUES from A
  inner join (
    Select TYPE_CARTE, max(VALEURS) MAX_VAl from A
    group by TYPE_CARTE) B
  on A.TYPE_CARTE = B.TYPE_CARTE
  where B.MAX_VAL = VALEURS
);
