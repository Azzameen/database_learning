Select count(JEU.ID_JOUEUR1), T1.NOM_JOUEUR from
(Select distinct JOUEURS.NOM_JOUEUR, count(UTILISATIONS.ID_PARTIE) NB_PARTIES_JOUEE from JOUEURS
natural join UTILISATIONS
group by JOUEURS.NOM_JOUEUR) T1 natural join JEU
group by T1.NOM_JOUEUR;
