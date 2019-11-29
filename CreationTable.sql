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
  foreign key (ID_PARTIE)  references PARTIE(ID_PARTIE),
  foreign key (ID_JOUEUR1) references JOUEUR(ID_JOUEUR),
  foreign key (ID_JOUEUR2) references JOUEUR(ID_JOUEUR),
  ID_VICTOIRE Int
);

-- alter table JEU
--   add constraint fk1_partie foreign key (ID_PARTIE)
--     references PARTIE(ID_PARTIE);
--
-- alter table JEU
--   add constraint fk2_partie foreign key (ID_JOUEUR1)
--     references JOUEURS(ID_JOUEUR);
--
-- alter table JEU
--   add constraint fk3_partie foreign key (ID_JOUEUR2)
--     references JOUEURS(ID_JOUEUR);

-- ====================================================================
-- Table : UTILISATIONS
-- ====================================================================
create table UTILISATIONS
( -- A verifier
  foreign key (ID_PARTIE) references PARTIE(ID_PARTIE),
  foreign key (ID_JOUEUR) references JOUEUR(ID_JOUEUR),
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
  foreign key (ID_JOUEUR) references JOUEUR(ID_JOUEUR),
  foreign key (ID_EXEMPLAIRE) references EXEMPLAIRE(ID_EXEMPLAIRE),
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
  foreign key (ID_EDITION) references EDITION(ID_EDITION),
  foreign key (ID_CARTE) references CARTE(ID_CARTE),
  constraint pk_exemplaires primary key (ID_EXEMPLAIRE)
);

-- ====================================================================
-- Table : EDITIONS
-- ====================================================================
create table EDITIONS
(
  ID_EDITION INT not null,
  NomEdition VARCHAR(100),
  constraint pk_editions primary key (ID_EDITION)
);

-- ====================================================================
-- Table : APPARTENANCES
-- ====================================================================
create table APPARTENANCES
(
  foreign key (ID_EDITION) references EDITION(ID_EDITION),
  foreign key (ID_CARTE) references CARTE(ID_CARTE)
  NbTirages INT,
  Cote INT
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
  foreign key (ID_JOUEUR) references JOUEUR(ID_JOUEUR),
  NOM_DECK VARCHAR(100);
  constraint pk_decks primary key (ID_DECK)
);

-- ====================================================================
-- Table : PARTIE
-- ====================================================================
create table CONTENANCE
(
  foreign key (ID_DECK) references DECK(ID_DECK),
  foreign key (ID_CARTE) references CARTE(ID_CARTE),
  NOMBRE_CARTES INT
);

-- ====================================================================
-- Table : PARTIE
-- ====================================================================
create table POSSESSIONS_CARACTERISTIQUES
( -- On en a besoin ?
  foreign key ( ID_CARTE) references CARTE(ID_CARTE),
  foreign key ( ID_CARACTERISTIQUES) references CARACTERISTIQUES(ID_CARACTERISTIQUES)
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
