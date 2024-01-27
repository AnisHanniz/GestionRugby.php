# Application de Gestion d'équipes de Rugby

GestionRugbyProjet :
@pre
     sudo apt install postgresql
     sudo systemctl status postgresql
     sudo su - postgres
	psql


Ce projet a été conçu en PHP afin d'avoir une application web capable de modifier/créer et supprimer des enregistrements d'une base de données.


!Attention!
Veuillez suivre les étapes suivantes afin d'utiliser correctement le projet


- Déplacer le dossier 'PHP' dans les fichiers de votre serveur

Dans notre cas, c'est un serveur local (WAMP)
Nous avons déplacé 'proj' dans %wamp64/www/%


- Création des tables dans votre base de donnée

Veuillez executer le contenu du fichier 'P13_POSTGRE.sql'
afin de créer et alimenter les tables p13_joueur,p13_equipe et p13_jouer.



- Environnement de BDD

Veuillez modifier monEnv.php comme suit, 


$host='Le nom du serveur hôte';
$dbName='le nom de votre base de données';
$dbUser='Le nom d'utilisateur';
$dbPassword='Le mot de passe de votre bdd';
