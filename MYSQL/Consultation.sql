-- Liste des cartes de type 'Machine'
create view Liste_type_carte as
  (select * from CARTES
  where TYPE_CARTE = 'Machine');

-- Liste des cartes contenues dans aucun deck
create view Liste_sans_deck as
  (select ID_CARTE from CARTES
  where CARTES.ID_CARTE not in
  (select ID_CARTE from CONTENANCE));

-- Liste des joueurs collectionneurs (qui n'ont joué aucune partie)
create view Liste_collectionneur as
  (select ID_JOUEUR from JOUEURS
  where JOUEURS.ID_JOUEUR not in
  (select ID_JOUEUR from UTILISATIONS));
