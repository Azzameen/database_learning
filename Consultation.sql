declare
  tyepUtilisateur = varchar(100);

begin
  typeUtilisateur = $1;
end;
/

create view List_type as
  (select * from CARTES
  where CARTES.TYPE_CARTE = typeUtilisateur); -- A chenger en fonctiond de ce que veut recherché l'utilisateur

create view List_no_deck as
  (select * from Cartes
  minus
  (select CONTENANCE.ID_CARTE from Contenance));

create view list_collectionneur as
  (select * from JOUEURS
  minus
  (select UTILISATIONS.ID_JOUEUR from UTILISATION));
