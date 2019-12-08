-- declare
--   typeUtilisateur varchar(100);
--
-- begin
--   set typeUtilisateur = $1;
-- end;
-- /

create view Liste_type_carte as
  (select * from CARTES
  where TYPE_CARTE = 'Monstre normal');

create view Liste_sans_deck as -- NOTE : changé le premier select * en select ID_CARTE (sinon fonctionne pas)
  (select ID_CARTE from CARTES
  where CARTES.ID_CARTE not in
  (select ID_CARTE from CONTENANCE));

create view Liste_collectionneur as -- NOTE : idem
  (select ID_JOUEUR from JOUEURS
  where JOUEURS.ID_JOUEUR not in
  (select ID_JOUEUR from UTILISATIONS));
