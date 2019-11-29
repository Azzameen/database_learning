declare
  tyepUtilisateur = varchar(100);

begin
  typeUtilisateur = $1;
end;
/

create view List_type as
  (select * from CARTES
  where CARTES.type = typeUtilisateur); -- A chenger en fonctiond de ce que veut recherché l'utilisateur

create view List_no_deck as
  (select * from Cartes
  minus
  (select CONTENANCE.IdCarte from Contenance));

create view list_collectionneur as
  (select * from JOUEURS
  minus
  (select UTILISATIONS.IdJoeur from UTILISATION));
