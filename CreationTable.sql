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

-- ====================================================================
-- Table : PARTIES
-- ====================================================================
create table PARTIES
(
  ID_PARTIE INT not null,
  LIEU VARCHAR(100),
  DATE_PARTIE DATE,
  TYPE_TOURNOI VARCHAR(100),
  constraint pk_parties primary key (ID_PARTIE)
);

-- ====================================================================
-- Table : JEU
-- ====================================================================
create table JEU
( -- A verifier
  ID_PARTIE INT not null,
  ID_JOUEUR1 INT not null,
  ID_JOUEUR2 INT not null,
  ID_VICTOIRE Int
);

-- ====================================================================
-- Table : UTILISATIONS
-- ====================================================================
create table UTILISATIONS
( -- A verifier
  ID_PARTIE INT not null,
  ID_JOUEUR INT not null
);

-- ====================================================================
-- Table : JOUEURS
-- ====================================================================
create table JOUEURS
(
  ID_JOUEUR INT not null,
  NOM_JOUEUR VARCHAR(100),
  PRENOM_JOUEUR VARCHAR(100),
  PSEUDONYME VARCHAR(100),
  constraint pk_joueurs primary key (ID_JOUEUR)
);

-- ====================================================================
-- Table : POSSESSIONS_EXEMPLAIRES
-- ====================================================================
create table POSSESSIONS_EXEMPLAIRES
( -- A vérifier
  ID_JOUEUR INT not null,
  ID_EXEMPLAIRE INT not null
);

-- ====================================================================
-- Table : EXEMPLAIRES
-- ====================================================================
create table EXEMPLAIRES
(
  ID_EXEMPLAIRE    INT     not null,
  DATE_ACQUISITION DATE,
  DATE_PERTE       DATE,
  MODE_ACQUISITION VARCHAR(100),
  QUALITE          INT,
  EFFET VARCHAR(100),
  ID_EDITION INT not null,
  ID_CARTE INT not null,
  constraint pk_exemplaires primary key (ID_EXEMPLAIRE)
);

-- ====================================================================
-- Table : EDITIONS
-- ====================================================================
create table EDITIONS
(
  ID_EDITION INT not null,
  NOM_EDITION VARCHAR(100),
  constraint pk_editions primary key (ID_EDITION)
);

-- ====================================================================
-- Table : APPARTENANCES
-- ====================================================================
create table APPARTENANCES
(
  ID_EDITION INT not null,
  ID_CARTE INT not null,
  NB_TIRAGE INT,
  COTE INT
);

-- ====================================================================
-- Table : CARTES
-- ====================================================================
create table CARTES
(
  ID_CARTE INT not null,
  TITRE VARCHAR(100),
  DESC_CARTE VARCHAR(1000),
  TYPE_CARTE VARCHAR(20),
  NATURE_CARTE VARCHAR(20),
  NIVEAU_CARTE INT,
  constraint pk_cartes primary key (ID_CARTE)
);

-- ====================================================================
-- Table : DECKS
-- ====================================================================
create table DECKS
(
  ID_DECK INT not null,
  ID_JOUEUR INT not null,
  NOM_DECK VARCHAR(100),
  constraint pk_decks primary key (ID_DECK)
);

-- ====================================================================
-- Table : PARTIE
-- ====================================================================
create table CONTENANCE
(
  ID_DECK INT not null,
  ID_CARTE INT not null,
  NB_CARTES INT
);

-- ====================================================================
-- Table : PARTIE
-- ====================================================================
create table POSSESSIONS_CARACTERISTIQUES
( -- On en a besoin ?
  ID_CARTE INT not null,
  ID_CARACTERISTIQUES INT not null
);

-- ====================================================================
-- Table : PARTIE
-- ====================================================================
create table CARACTERISTIQUES
(
  ID_CARACTERISTIQUES INT not null,
  DESC_CARACTERISTIQUES VARCHAR(1000),
  VALEURS INT,
  constraint pk_carateristique primary key (ID_CARACTERISTIQUES)
);

-- ===================================================================
-- Alteration des tables
-- ===================================================================

alter table JEU
  add constraint fk1_partie foreign key (ID_PARTIE)
    references PARTIES(ID_PARTIE);

alter table JEU
  add constraint fk2_partie foreign key (ID_JOUEUR1)
    references JOUEURS(ID_JOUEUR);

alter table JEU
  add constraint fk3_partie foreign key (ID_JOUEUR2)
    references JOUEURS(ID_JOUEUR);

alter table UTILISATIONS
  add constraint fk1_utilisations foreign key (ID_PARTIE)
    references PARTIES(ID_PARTIE);

alter table UTILISATIONS
  add constraint fk2_utilisations foreign key (ID_JOUEUR)
    references JOUEURS(ID_JOUEUR);

alter table EXEMPLAIRES
  add constraint fk1_exemplaires foreign key (ID_EDITION)
    references EDITIONS(ID_EDITION);

alter table APPARTENANCES
  add constraint fk1_appartenances foreign key (ID_EDITION)
    references EDITIONS(ID_EDITION);

alter table APPARTENANCES
  add constraint fk2_appartenances foreign key (ID_CARTE)
    references CARTES(ID_CARTE);

alter table DECKS
  add constraint fk1_decks foreign key (ID_JOUEUR)
    references JOUEURS(ID_JOUEUR);

alter table CONTENANCE
  add constraint fk1_contenances foreign key (ID_DECK)
    references DECKS(ID_DECK);

alter table CONTENANCE
  add constraint fk2_contenances foreign key (ID_CARTE)
    references CARTES(ID_CARTE);

alter table POSSESSIONS_CARACTERISTIQUES
  add constraint fk1_possessions_cara foreign key (ID_CARTE)
    references CARTES(ID_CARTE);

alter table POSSESSIONS_CARACTERISTIQUES
  add constraint fk2_possessions_cara foreign key (ID_CARACTERISTIQUES)
    references CARACTERISTIQUES(ID_CARACTERISTIQUES);

alter table POSSESSIONS_EXEMPLAIRES
  add constraint fk1_possessions_exemplaires foreign key (ID_JOUEUR)
    references JOUEURS(ID_JOUEUR);

alter table POSSESSIONS_EXEMPLAIRES
  add constraint fk2_possessions_exemplaires foreign key (ID_EXEMPLAIRE)
    references EXEMPLAIRES(ID_EXEMPLAIRE);
