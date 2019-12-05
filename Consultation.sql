declare
  typeUtilisateur varchar(100);

begin
  set typeUtilisateur = $1;
end;
/

create view Liste_type as
  (select * from CARTES
  where CARTES.TYPE_CARTE = typeUtilisateur);

create view Liste_sans_deck as
  (select * from Cartes
  minus
  (select CONTENANCE.ID_CARTE from Contenance));

create view liste_collectionneur as
  (select * from JOUEURS
  minus
  (select UTILISATIONS.ID_JOUEUR from UTILISATIONS));
