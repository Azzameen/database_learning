-- ======================================================================
--     Nettoyage des donnees dans les tables
-- ======================================================================

delete from PARTIES ;
delete from JEU ;
delete from UTILISATIONS ;
delete from JOUEURS ;
delete from POSSESSIONS_EXEMPLAIRES ;
delete from EXEMPLAIRES ;
delete from EDITIONS ;
delete from APPARTENANCES ;
delete from CARTES ;
delete from DECKS ;
delete from CONTENANCE ;
delete from POSSESSIONS_CARACTERISTIQUES ;
delete from CARACTERISTIQUES ;

commit ;

-- ======================================================================
--     Creation des donnees
-- ======================================================================

-- PARTIES
insert into PARTIES values (  1 , 'TALENCE', '01/01/01', 'LOCAL'  ) ;
insert into PARTIES values (  2 , 'PESSAC','02/02/02' ,'LOCAL'  ) ;
insert into PARTIES values (  3 , 'BORDEAUX', '03/03/03', 'REGIONAL'  ) ;
insert into PARTIES values (  4 , 'MOUAIS', '04/04/04', 'REGIONAL'  ) ;
insert into PARTIES values (  5 , 'BIDON', '05/05/05', 'NATIONAL'  ) ;
insert into PARTIES values (  6 , 'BATTLE_CITY', '06/06/06', 'NATIONAL'  ) ;
insert into PARTIES values (  7 , 'BORDEAUX', '07/07/07', 'LOCAL'  ) ;

commit;

-- JEU
insert into JEU values ( 1, 1, 2, 1 ) ;
insert into JEU values ( 2, 3, 4, 3 ) ;
insert into JEU values ( 3, 5, 6, 4 ) ;
insert into JEU values ( 4, 1, 3, 3 ) ;
insert into JEU values ( 5, 4, 2, 2 ) ;
insert into JEU values ( 6, 3, 4, 3 ) ;
insert into JEU values ( 7, 2, 3, 3 ) ;

commit;

-- UTILISATIONS
insert into UTILISATIONS values ( 1, 1 ) ;
insert into UTILISATIONS values ( 1, 2 ) ;
insert into UTILISATIONS values ( 2, 3 ) ;
insert into UTILISATIONS values ( 2, 4 ) ;
insert into UTILISATIONS values ( 3, 5 ) ;
insert into UTILISATIONS values ( 3, 6 ) ;
insert into UTILISATIONS values ( 4, 1 ) ;
insert into UTILISATIONS values ( 4, 3 ) ;
insert into UTILISATIONS values ( 5, 4 ) ;
insert into UTILISATIONS values ( 5, 2 ) ;
insert into UTILISATIONS values ( 6, 3 ) ;
insert into UTILISATIONS values ( 6, 4 ) ;
insert into UTILISATIONS values ( 7, 2 ) ;
insert into UTILISATIONS values ( 7, 3 ) ;

commit;

-- JOUEURS
insert into JOUEURS values ( 1, 'JOSEPH', 'JOESTAR', 'JOJO1') ;
insert into JOUEURS values ( 2, 'JONATHAN', 'JOESTAR', 'JOJO2') ;
insert into JOUEURS values ( 3, 'JOTARO', 'KUJO', 'JOJO3') ;
insert into JOUEURS values ( 4, 'JOSUKE', 'HIGASHIKATA', 'JOJO4') ;
insert into JOUEURS values ( 5, 'GIORNO', 'GIOVANNA', 'GIOGIO') ;
insert into JOUEURS values ( 6, 'JOLYNE', 'CUJOH', 'JOJO5') ;
insert into JOUEURS values ( 7, 'JOHNNY ', 'JOESTAR', 'JOJO6') ;

commit;

-- POSSESSIONS_EXEMPLAIRES
insert into POSSESSIONS_EXEMPLAIRES values ( 1, 1 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 1, 2 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 1, 3 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 2, 4 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 2, 5 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 2, 6 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 3, 7 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 3, 8 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 3, 9 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 4, 10 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 4, 11 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 4, 12 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 5, 13 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 5, 14 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 5, 15 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 6, 16 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 6, 17 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 6, 18 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 7, 19 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 7, 20 ) ;
insert into POSSESSIONS_EXEMPLAIRES values ( 7, 21 ) ;

commit

-- EXEMPLAIRES
insert into EXEMPLAIRES values ( 1, '03/02/01', '01/02/03', 'ECHANGE', 90, 'AUCUN', 1, 1 ) ;
insert into EXEMPLAIRES values ( 2, '03/02/01', '01/02/03', 'ACHAT', 100, 'AUCUN', 1, 1 ) ;
insert into EXEMPLAIRES values ( 3, '05/04/03', '03/04/05', 'ACHAT', 100, 'BRILLANT', 1, 1 ) ;
insert into EXEMPLAIRES values ( 4, '08/07/06', '06/07/08', 'TROUVE', 50, 'BRILLANT', 2, 3 ) ;
insert into EXEMPLAIRES values ( 5, '08/07/06', '06/07/08', 'ACHAT', 100, 'AUCUN', 2, 4 ) ;
insert into EXEMPLAIRES values ( 6, '08/07/06', '06/07/08', 'ECHANGE', 60, 'SOMBRE', 3, 5 ) ;
insert into EXEMPLAIRES values ( 7, '11/10/09', '09/10/11', 'TROUVE', 90, 'SOMBRE', 3, 5 ) ;
insert into EXEMPLAIRES values ( 8, '11/10/09', '09/10/11', 'ECHANGE', 90, 'AUCUN', 1, 5 ) ;
insert into EXEMPLAIRES values ( 9, '11/10/09', '09/10/11', 'ECHANGE', 1, 'AUCUN', 2, 6 ) ;
insert into EXEMPLAIRES values ( 10, '01/01/01', '02/02/02', 'ACHAT', 95, 'BRILLANT', 2, 7 ) ;
insert into EXEMPLAIRES values ( 11, '01/01/01', '02/02/02', 'ECHANGE', 100, 'AUCUN', 1, 8 ) ;
insert into EXEMPLAIRES values ( 12, '01/01/01', '02/02/02', 'ECHANGE', 50, 'COLLECTOR', 3, 9 ) ;
insert into EXEMPLAIRES values ( 13, '03/03/03', '04/04/04', 'ACHAT', 90, 'AUCUN', 1, 1 ) ;
insert into EXEMPLAIRES values ( 14, '03/03/03', '04/04/04', 'ECHANGE', 100, 'AUCUN', 1, 1 ) ;
insert into EXEMPLAIRES values ( 15, '03/03/03', '04/04/04', 'ECHANGE', 90, 'BRILLANT', 2, 2 ) ;
insert into EXEMPLAIRES values ( 16, '01/02/03', '04/04/04', 'ECHANGE', 80, 'SOMBRE', 3, 3 ) ;
insert into EXEMPLAIRES values ( 14, '04/04/04', '05/05/05', 'ECHANGE', 100, 'AUCUN', 1, 1 ) ;
insert into EXEMPLAIRES values ( 15, '04/04/04', '05/05/05', 'ECHANGE', 90, 'BRILLANT', 2, 2 ) ;
insert into EXEMPLAIRES values ( 16, '04/04/04', '05/05/05', 'ECHANGE', 80, 'SOMBRE', 3, 3 ) ;
insert into EXEMPLAIRES values ( 20, '01/12/19', '', 'ACHAT', 90, 'AUCUN', 1, 10 ) ;
insert into EXEMPLAIRES values ( 21, '01/02/03', '', 'ECHANGE', 90, 'SOMBRE', 2, 11 ) ;
