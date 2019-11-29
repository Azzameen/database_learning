-- -- ============================================================
-- --   Nom de la base   :  Cartes
-- --   Nom de SGBD      :  ORACLE Version 7.0
-- --   Date de creation :  30/10/96  12:09
-- -- ============================================================
--
-- drop table ROLE cascade constraints;
--
-- drop table FILM cascade constraints;
--
-- drop table REALISATEUR cascade constraints;
--
-- drop table ACTEUR cascade constraints;

-- NOTE : j'ai pas fait comme sur les exemples de TP, nottament sur les foreign keys

create table PARTIE(
  IdPartie INT PRIMARY KEY NOT NULL,
  Lieu varchar(100),
  Date DATE,
  TypeTournoi varchar(100)
);

create table JEU( -- A verifier
  foreign key (#IdPartie) references PARTIE(IdPartie),
  foreign key (#IdJoueur1) references JOUEUR(IdJoueur),
  foreign key (#IdJoueur2) references JOUEUR(IdJoueur),
  IdVictoire Int
);

create table UTILISATIONS( -- A verifier
  foreign key (#IdPartie) references PARTIE(IdPartie),
  foreign key (#IdJoueur) references JOUEUR(IdJoueur),
);

create table JOUEURS(
  IdJoueur INT PRIMARY KEY,
  Nom varchar(100),
  Prenom varchar(100),
  Pseudonyme varchar(100)
);

create table POSSESSIONS_EXEMPLAIRES( -- A vérifier
  foreign key (#IdJoueur) references JOUEUR(IdJoueur),
  foreign key (#IdExemplaire) references EXEMPLAIRE(IdExemplaire),
);

create table EXEMPLAIRES(
  IdExemplaire INT PRIMARY KEY,
  DateAcquisition DATE,
  DatePerte DATE,
  ModeAcquisition varchar(100),
  Qualite INT,
  Effet varchar(100),
  foreign key (#IdEdition) references EDITION(IdEdition),
  foreign key (#IdCarte) references CARTE(IdCarte)
);

create table EDITIONS(
  IdEdition INT PRIMARY KEY,
  NomEdition varchar(100)
);

create table APPARTENANCES(
  foreign key (#IdEdition) references EDITION(IdEdition),
  foreign key (#IdCarte) references CARTE(IdCarte)
  NbTirages INT,
  Carte varchar(100)
);

create table CARTES(
  IdCarte PRIMARY KEY,
  Titre varchar(100),
  DescCarte varchar(1000),
  Type varchar(20),
  Nature varchar(20),
  Niveau INT
);

create table DECKS(
  IdDeck INT PRIMARY KEY,
  foreign key (#IdJoueur) references JOUEUR(IdJoueur),
  NomDeck varchar(100)
);

create table CONTENANCE(
  foreign key (#IdDeck) references DECK(IdDeck),
  foreign key (#IdCarte) references CARTE(IdCarte),
  NbCartes INT
);

create table POSSESSIONS_CARACTERISTIQUES( -- On en a besoin ?
  foreign key (#IdCarte) references CARTE(IdCarte),
  foreign key (#IdCaracteristique) references CARACTERISTIQUE(IdCaracteristique)
);

create table CARACTERISTIQUE(
  IdCaracteristique INT PRIMARY KEY,
  DescCaracteristique varchar(1000),
  Valeurs INT
);
