# Construire la base de données avec MYSQL :
## installer mysql (linux)
lancer :
```bash
sudo apt-get install mysql-server mysql-client
```
```bash
sudo mysqladmin -u root -h localhost password <password>
```
```bash
sudo mysql -u root
```
## construire la BDD
```SQL
create database <Nom_BDD>;
```
```SQL
use <Nom_BDD>;
```
## Créer les tables, nettoyer, ajouter des données :
se placer dans le dossier contenant les différents scripts, puis :

### Créer les tables
```SQL
source CreationTable.sql;
```
### Nettoyer les tables
```SQL
source Clean.sql;
```

### Ajouter les données/vues (exemples)
```SQL
source Donnees.sql;
```

```SQL
source Statistique.sql;
```

```SQL
source Consultation.sql;
```
