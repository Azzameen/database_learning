create view Liste_type_carte as
  (select * from CARTES
  where TYPE_CARTE = 'Machine');

create view Liste_sans_deck as
  (select ID_CARTE from CARTES
  where CARTES.ID_CARTE not in
  (select ID_CARTE from CONTENANCE));

create view Liste_collectionneur as
  (select ID_JOUEUR from JOUEURS
  where JOUEURS.ID_JOUEUR not in
  (select ID_JOUEUR from UTILISATIONS));
