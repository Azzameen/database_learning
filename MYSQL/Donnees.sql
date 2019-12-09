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

-- JOUEURS
insert into JOUEURS values ( 1, 'JOSEPH', 'JOESTAR', 'JOJO1') ;
insert into JOUEURS values ( 2, 'JONATHAN', 'JOESTAR', 'JOJO2') ;
insert into JOUEURS values ( 3, 'JOTARO', 'KUJO', 'JOJO3') ;
insert into JOUEURS values ( 4, 'JOSUKE', 'HIGASHIKATA', 'JOJO4') ;
insert into JOUEURS values ( 5, 'GIORNO', 'GIOVANNA', 'GIOGIO') ;
insert into JOUEURS values ( 6, 'JOLYNE', 'CUJOH', 'JOJO5') ;
insert into JOUEURS values ( 7, 'JOHNNY ', 'JOESTAR', 'JOJO6') ;

commit;

-- PARTIES
insert into PARTIES values (  1 , 'TALENCE', '2001-01-01', 'LOCAL'  ) ;
insert into PARTIES values (  2 , 'PESSAC', '2002-02-02','LOCAL'  ) ;
insert into PARTIES values (  3 , 'BORDEAUX', '2003-03-03', 'REGIONAL'  ) ;
insert into PARTIES values (  4 , 'MOUAIS', '2004-04-04', 'REGIONAL'  ) ;
insert into PARTIES values (  5 , 'BIDON', '2005-05-05', 'NATIONAL'  ) ;
insert into PARTIES values (  6 , 'BATTLE_CITY', '2006-06-06', 'NATIONAL'  ) ;
insert into PARTIES values (  7 , 'BORDEAUX', '2007-07-07', 'LOCAL'  ) ;

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
SET FOREIGN_KEY_CHECKS = 0; -- Sinon MYSQL génère une erreur

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

SET FOREIGN_KEY_CHECKS = 1;

commit;

-- EDITIONS
insert into EDITIONS values (1, 'LDD');
insert into EDITIONS values (2, 'LOB');
insert into EDITIONS values (3, 'MRD');

commit;

-- EXEMPLAIRES
insert into EXEMPLAIRES values ( 1, '2001-02-01', '2003-02-01', 'ECHANGE', 90, 'AUCUN', 1, 1, '2001-01-02') ;
insert into EXEMPLAIRES values ( 2, '2001-02-03', '2003-02-01', 'ACHAT', 100, 'AUCUN', 1, 1, '2001-01-02') ;
insert into EXEMPLAIRES values ( 3, '2003-04-05', '2005-04-03', 'ACHAT', 100, 'BRILLANT', 1, 1 , '2004-03-17') ;
insert into EXEMPLAIRES values ( 4, '2006-07-08', '2008-07-06', 'TROUVE', 50, 'BRILLANT', 2, 3, '2004-03-17') ;
insert into EXEMPLAIRES values ( 5, '2006-07-08', '2008-07-06', 'ACHAT', 100, 'AUCUN', 2, 4, '2004-03-17') ;
insert into EXEMPLAIRES values ( 6, '2006-07-08', '2008-07-06', 'ECHANGE', 60, 'SOMBRE', 3, 5, '2004-03-17') ;
insert into EXEMPLAIRES values ( 7, '2009-10-11', '2011-10-09', 'TROUVE', 90, 'SOMBRE', 3, 5, '2008-10-25') ;
insert into EXEMPLAIRES values ( 8, '2009-10-11', '2011-10-09', 'ECHANGE', 90, 'AUCUN', 1, 5, '2008-10-25') ;
insert into EXEMPLAIRES values ( 9, '2009-10-11', '2011-10-09', 'ECHANGE', 1, 'AUCUN', 2, 6, '2008-10-25') ;
insert into EXEMPLAIRES values ( 10, '2001-01-01', '2002-02-02', 'ACHAT', 95, 'BRILLANT', 2, 7, '2000-01-01') ;
insert into EXEMPLAIRES values ( 11, '2001-01-01', '2002-02-02', 'ECHANGE', 100, 'AUCUN', 1, 8, '2000-01-01') ;
insert into EXEMPLAIRES values ( 12, '2001-01-01', '2002-02-02', 'ECHANGE', 50, 'COLLECTOR', 3, 9, '2000-01-01') ;
insert into EXEMPLAIRES values ( 13, '2003-03-03', '2004-04-04', 'ACHAT', 90, 'AUCUN', 1, 1, '2002-03-03') ;
insert into EXEMPLAIRES values ( 14, '2003-03-03', '2004-04-04', 'ECHANGE', 100, 'AUCUN', 1, 1, '2002-03-03') ;
insert into EXEMPLAIRES values ( 15, '2003-03-03', '2004-04-04', 'ECHANGE', 90, 'BRILLANT', 2, 2, '2002-03-03') ;
insert into EXEMPLAIRES values ( 16, '2003-02-01', '2004-04-04', 'ECHANGE', 80, 'SOMBRE', 3, 3, '2002-03-03') ;
insert into EXEMPLAIRES values ( 17, '2004-04-04', '2005-05-05', 'ECHANGE', 100, 'AUCUN', 1, 1, '2003-05-05') ;
insert into EXEMPLAIRES values ( 18, '2004-04-04', '2005-05-05', 'ECHANGE', 90, 'BRILLANT', 2, 2, '2003-05-05') ;
insert into EXEMPLAIRES values ( 19, '2004-04-04', '2005-05-05', 'ECHANGE', 80, 'SOMBRE', 3, 3, '2003-05-05') ;
insert into EXEMPLAIRES values ( 20, '2019-12-01', NULL, 'ACHAT', 90, 'AUCUN', 1, 10, '2008-12-01') ;
insert into EXEMPLAIRES values ( 21, '2003-02-01', NULL, 'ECHANGE', 90, 'SOMBRE', 2, 11, '2002-02-01') ;

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

commit;

-- CARTES
insert into CARTES values (1,'DRAGON BLANC AUX YEUX BLEUS', 'Ce dragon légendaire est un puissant moteur de destruction. Rares sont ceux qui ont survécu à cette terrifiante créature quasiment invincible pour en parler.', 'Dragon', 'Monstre Normal',  8);
insert into CARTES values (2,'SOLDAT GALACTIQUE', 'Vous pouvez envoyer 1 autre monstre LUMIÈRE depuis votre main au Cimetière ; Invoquez Spécialement cette carte depuis votre main en Position de Défense. Lorsque cette carte est Invoquée Spécialement : vous pouvez ajouter 1 monstre "Galactique" depuis votre Deck à votre main. Vous ne pouvez utiliser cet effet de "Soldat Galactique" qu une fois par tour.', 'Machine', 'Monstre Effet', 5);
insert into CARTES values (3,'PLANEUR DU KAISER', 'Non destructible au combat avec un monstre qui a la même ATK. Si cette carte est détruite et envoyée au Cimetière : ciblez 1 monstre sur le Terrain ; renvoyez la cible à la main.', 'Dragon', 'Monstre Effet', 6);
insert into CARTES values (4,'BOEUF DE COMBAT ENRAGE', 'Si un monstre de Type Bête/Bête-Guerrier/Bête Ailée que vous contrôlez attaque un monstre en Position de Défense, infligez des dommages de combat perçants à votre adversaire.', 'Bête-Guerrier', 'Monstre Effet',  4);
insert into CARTES values (5,'CYBER DRAGON', 'Si uniquement votre adversaire contrôle un monstre, vous pouvez Invoquer Spécialement cette carte (depuis votre main).', 'Machine', 'Monstre Effet',  5);
insert into CARTES values (6,'CYBER DRAGON JUMELE', '"Cyber Dragon" + "Cyber Dragon" L Invocation Fusion de cette carte ne peut être faite qu avec les Matériels Fusion ci-dessus. Cette carte peut faire une seconde attaque durant chaque Battle Phase.', 'Machine', 'Monstre Fusion',  8);
insert into CARTES values (7,'DRAGON CYBER ULTIME', '"Cyber Dragon" + "Cyber Dragon" + "Cyber Dragon" L Invocation Fusion de cette carte ne peut être faite qu avec les Matériels Fusion ci-dessus. Si cette carte attaque un monstre en Position de Défense, infligez des dommages de combat perçants.', 'Machine', 'Monstre Fusion',  10);
insert into CARTES values (8,'CHAT SAUVETEUR', 'Vous pouvez envoyer cette carte au Cimetière ; Invoquez Spécialement 2 monstres de Type Bête de max. Niveau 3 depuis votre Deck, mais ils ont leurs effets annulés, et aussi, ils sont détruits durant la End Phase. Vous ne pouvez utiliser cet effet de "Chat Sauveteur" qu une fois par tour.', 'Bête', 'Monstre Normal',  4);
insert into CARTES values (9,'LAPIN SAUVETEUR', 'Non Invocable Spécialement depuis le Deck. Vous pouvez bannir cette carte face recto que vous contrôlez ; Invoquez Spécialement 2 Monstres Normaux de max. Niveau 4 de même nom depuis votre Deck, mais détruisez-les durant la End Phase. Vous ne pouvez utiliser cet effet de "Lapin Sauveteur" qu une fois par tour.', 'Bête', 'Monstre Normal',  4);
insert into CARTES values (10,'OJAMA JAUNE', 'Un membre du trio Ojama, qui a la réputation de se mêler de tout et par tous les moyens. Il est dit également que lorsque les trois sont réunis, il se passe toujours quelque chose.', 'Bête', 'Monstre Normal',  2);
insert into CARTES values (11,'OJAMA NOIR', 'Un membre du trio Ojama, qui a la réputation de se mêler de tout et par tous les moyens. Il est dit également que lorsque les trois sont réunis, il se passe toujours quelque chose.', 'Bête', 'Monstre Normal',  2);
insert into CARTES values (12,'MONSTER REBORN', 'Ciblez 1 monstre dans l\'un des Cimetières ; Invoquez-le Spécialement.', NULL,'Magie', NULL);
insert into CARTES values (13,'FORCE MIROIR', 'Quand un monstre adverse attaque, annulez l\'attaque et détruisez tous les monstres adverses se trouvant en Position d\'Attaque.', NULL, 'Piège', NULL);

commit;

-- APPARTENANCES
insert into APPARTENANCES values (1,1,1000,50);
insert into APPARTENANCES values (2,3,10000,2);
insert into APPARTENANCES values (2,4,1000,50);
insert into APPARTENANCES values (3,5,100,500);
insert into APPARTENANCES values (1,5,99999,1);
insert into APPARTENANCES values (2,6,1,99999);
insert into APPARTENANCES values (2,7,1000,50);
insert into APPARTENANCES values (1,8,10000,5);
insert into APPARTENANCES values (3,9,1000,50);
insert into APPARTENANCES values (2,3,1000,50);
insert into APPARTENANCES values (2,2,1000,50);
insert into APPARTENANCES values (3,3,5,10000);
insert into APPARTENANCES values (1,10,100,50);
insert into APPARTENANCES values (2,11,1000,5);

commit;

-- DECKS
insert into DECKS values (1,1,'KAYBA');
insert into DECKS values (2,2,'KAYBA');
insert into DECKS values (3,3,'OJAMA');
insert into DECKS values (4,4,'OJAMA');
insert into DECKS values (5,5,'CYBER DRAGON');
insert into DECKS values (6,6,'CYBER DRAGON');
insert into DECKS values (7,7,'CYBER DRAGON');

commit;

-- CONTENANCE
insert into CONTENANCE values (1,1,3);
insert into CONTENANCE values (1,2,1);
insert into CONTENANCE values (1,3,1);
insert into CONTENANCE values (3,2,2);
insert into CONTENANCE values (3,5,2);
insert into CONTENANCE values (3,6,1);
insert into CONTENANCE values (3,7,1);
insert into CONTENANCE values (2,8,1);
insert into CONTENANCE values (2,9,1);
insert into CONTENANCE values (2,10,3);
insert into CONTENANCE values (2,11,3);

commit;

-- CARACTERISTIQUES
insert into CARACTERISTIQUES values (1,'ATTAQUE', 2000);
insert into CARACTERISTIQUES values (2,'ATTAQUE', 1000);
insert into CARACTERISTIQUES values (3,'ATTAQUE', 500);
insert into CARACTERISTIQUES values (4,'DEFENSE', 2000);
insert into CARACTERISTIQUES values (5,'DEFENSE', 1000);
insert into CARACTERISTIQUES values (6,'DEFENSE', 500);
insert into CARACTERISTIQUES values (7,'LINK', 2);
insert into CARACTERISTIQUES values (8,'LINK', 4);

commit;

-- POSSESSIONS_CARACTERISTIQUES
insert into POSSESSIONS_CARACTERISTIQUES values (1,1);
insert into POSSESSIONS_CARACTERISTIQUES values (1,6);
insert into POSSESSIONS_CARACTERISTIQUES values (2,3);
insert into POSSESSIONS_CARACTERISTIQUES values (2,6);
insert into POSSESSIONS_CARACTERISTIQUES values (3,1);
insert into POSSESSIONS_CARACTERISTIQUES values (3,4);
insert into POSSESSIONS_CARACTERISTIQUES values (4,2);
insert into POSSESSIONS_CARACTERISTIQUES values (4,4);
insert into POSSESSIONS_CARACTERISTIQUES values (5,2);
insert into POSSESSIONS_CARACTERISTIQUES values (5,5);
insert into POSSESSIONS_CARACTERISTIQUES values (6,1);
insert into POSSESSIONS_CARACTERISTIQUES values (6,4);
insert into POSSESSIONS_CARACTERISTIQUES values (6,7);
insert into POSSESSIONS_CARACTERISTIQUES values (7,1);
insert into POSSESSIONS_CARACTERISTIQUES values (7,4);
insert into POSSESSIONS_CARACTERISTIQUES values (7,8);
insert into POSSESSIONS_CARACTERISTIQUES values (8,3);
insert into POSSESSIONS_CARACTERISTIQUES values (8,6);
insert into POSSESSIONS_CARACTERISTIQUES values (9,3);
insert into POSSESSIONS_CARACTERISTIQUES values (9,6);
insert into POSSESSIONS_CARACTERISTIQUES values (10,3);
insert into POSSESSIONS_CARACTERISTIQUES values (10,6);
insert into POSSESSIONS_CARACTERISTIQUES values (11,3);
insert into POSSESSIONS_CARACTERISTIQUES values (11,6);

commit;
