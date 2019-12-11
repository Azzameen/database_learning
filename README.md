# Présentation du sujet

Le sujet du projet est l'implémentation d'une base de données de cartes à jouer (ici, pour des carte).

# Organisation du dossier

Toutes les sources des requêtes SQL pour la création, le peuplement ou la suppression de la table, ainsi que les requêtes de consultation, de classement et de statistiques se trouve dans le dossier MYSQL.
Les  documents de spécifications et le rapport se situent dans le dossier Specification.
Les fichiers du site se situent dans le dossier interface.

# Construction de la base de données avec MYSQL :
## installation de mysql (linux)

```bash
sudo apt-get install mysql-server mysql-client
```
```bash
sudo mysqladmin -u root -h localhost password <password>
```
```bash
sudo mysql -u root
```

## Construction de la base de données

```SQL
create database <Nom_BDD>;
```
```SQL
use <Nom_BDD>;
```

### Création des tables
```SQL
source MYSQL/CreationTable.sql;
```
### Suppression des tables
```SQL
source MYSQL/Clean.sql;
```

### Ajout des données/vues (exemples)
```SQL
source MYSQL/Donnees.sql;
```

```SQL
source MYSQL/Statistique.sql;
```

```SQL
source MSQL/Consultation.sql;
```
