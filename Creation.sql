-- -- ============================================================
-- --   Nom de la base   :  CINEMA
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
  Lieu varchar(100), -- Taille max lieu ?
  Date DATE,
  TypeTournoi INT -- Est-ce un int ?
);

create table AVOIR_JOUE(
  #IdPartie INT PRIMARY KEY,
  #IdJoueur INT PRIMARY KEY,
  foreign key (#IdPartie) references PARTIE(IdPartie),
  foreign key (#IdJoueur) references JOUEUR(IdJoueur),
  Adversaire varchar(100), -- Taille max nom ?
  Resultat Int -- Pas certain que ça soit un int
);

create table ETRE_UTILISE(
  #IdPartie INT PRIMARY KEY,
  #IdJoueur INT PRIMARY KEY,
  foreign key (#IdPartie) references PARTIE(IdPartie),
  foreign key (#IdJoueur) references JOUEUR(IdJoueur),
);

create table JOUEUR(
  IdJoueur INT PRIMARY KEY,
  Nom varchar(100), -- Taille max nom ?
  Prenom varchar(100), -- Taille max nom ?
  Pseudonyme(100), -- Taille max nom ?
);

create table J_POSSEDER_E( -- Nom Ok ?
  #IdJoueur INT PRIMARY KEY,
  #IdExemplaire INT PRIMARY KEY,
  foreign key (#IdJoueur) references JOUEUR(IdJoueur),
  foreign key (#IdExemplaire) references EXEMPLAIRE(IdExemplaire),
);

create table EXEMPLAIRE( -- NOTE : J'ai enlevé le Nom Edition car est déjà dans edition
  IdExemplaire INT PRIMARY KEY,
  DateAcquisition DATE,
  ModeAcquisition INT, -- Pas certain que ça soit un int
  DatePerte DATE,
  Qualite INT,
  Effet varchar(20), -- Taille max effet ?
  #IdEdition INT,
  #IdCarte INT,
  foreign key (#IdEdition) references EDITION(IdEdition),
  foreign key (#IdCarte) references CARTE(IdCarte)
);

create table EDITION(
  IdEdition INT PRIMARY KEY,
  NomEdition varchar(100) -- Taille max nom ?
);

create table APPARTENIR(
  #IdEdition INT PRIMARY KEY,
  #IdCarte INT PRIMARY KEY,
  foreign key (#IdEdition) references EDITION(IdEdition),
  foreign key (#IdCarte) references CARTE(IdCarte)
  NbTirages INT,
  Carte varchar(100) -- Taille max carte ?
);

create table CARTE(
  IdCarte PRIMARY KEY,
  Titre varchar(100), -- Taille max titre ?
  DescCarte varchar(1000), -- Taille max desc ? + pas le même nom
  Type varchar(20), -- Taille max type ?
  Nature varchar(20), -- Taille max nature ?
  Niveau INT
);

create table DECK(
  IdDeck INT PRIMARY KEY,
  #IdJoueur INT,
  foreign key (#IdJoueur) references JOUEUR(IdJoueur),
  NomDeck varchar(100) -- Taille max nom ?
);

create table CONTENIR(
  #IdDeck INT PRIMARY KEY,
  #IdCarte INT PRIMARY KEY,
  foreign key (#IdDeck) references DECK(IdDeck),
  foreign key (#IdCarte) references CARTE(IdCarte),
  NbCartes INT
);

create table C_POSSEDER_C( -- nom ?
  #IdCarte INT PRIMARY KEY,
  #IdCaracteristique INT PRIMARY KEY,
  foreign key (#IdCarte) references CARTE(IdCarte),
  foreign key (#IdCaracteristique) references CARACTERISTIQUE(IdCaracteristique)
);

create table CARACTERISTIQUE(
  IdCaracteristique INT PRIMARY KEY,
  DescCara varchar(1000), -- Taille max desc ? + pas le même nom
  Valeurs INT
);
