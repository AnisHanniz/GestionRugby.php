/*  Création et Alimentation des tables en POSTGRESQL */
/*  Création de la table P13_equipe  */

CREATE TABLE IF NOT EXISTS P13_equipe (
eq_id SERIAL NOT NULL PRIMARY KEY,
eq_nom VARCHAR(30) NOT NULL,
eq_dateCrea DATE,
eq_budgetAn FLOAT NOT NULL
);

/*  Alimentation de P13_equipe  */


INSERT INTO P13_equipe (eq_nom,eq_dateCrea,eq_budgetAn)
VALUES ('FRANCE','1906/01/01',134.6), 
        ('IRLANDE', '1886/01/01',141.2);


/*

P = Pillier
T = Taloneur
L3 = Troisieme ligne
L2 = Deuxieme ligne
C = Centre
AI = Ailier
AR = Arriere
O = Ouverture
M = Mêlee

*/

/*  Création de la table P13_joueur */

CREATE TABLE IF NOT EXISTS P13_joueur (
j_id SERIAL NOT NULL,
j_nom VARCHAR(30) NOT NULL,
j_prenom VARCHAR(30) NOT NULL,
j_dateN DATE,
j_poste INTEGER NOT NULL CHECK (j_poste BETWEEN 1 and 22),
j_role VARCHAR(3) NOT NULL CHECK (j_role in('P',
                                            'M',
                                            'L2',
                                            'L3',
                                            'T',
                                            'O',
                                            'M',
                                            'AI',
                                            'AR',
                                            'C')),
PRIMARY KEY (j_id)
);


/*  Alimentation de P13_Joueur */

/*  Equipe de France:  */


INSERT INTO P13_joueur (j_nom,j_prenom,j_dateN,j_poste,j_role)
VALUES ('BAILLE','Cyril','1993/09/15',1,'P'), 
        ('PRISO','Dany','1994/01/02',3,'P'),
        ('FALATEA','Sipili','1997/06/06',9,'P'),
        ('ATONIO','Uini','1990/03/26',17,'P'),
        ('MARCHAND','Julien','1995/05/10',2,'T'),
        ('MAUVAKA','Péato','1997/01/10',14,'T'),
        ('OLLIVON','Charles','1993/05/11',7,'L3'),
        ('MACALOU','Sekou','1995/04/20',6,'L3'),
        ('JELONCH','Anthony','1996/07/28',15,'L3'),
        ('FICKOU','Gaël','1994/03/26',13,'C'),
        ('DANTY','Jonathan','1994/10/07',8,'C'),
        ('PENAUD','Damian','1996/09/25',14,'AI'),
        ('LEBEL','Matthis','1999/03/25',11,'AI'),
        ('RAMOS','Thomas','1995/07/23',12,'AR'),
        ('FLAMENT','Thibaud','1997/04/29',4,'L2'),
        ('GÉRACI','Killian','1999/03/25',5,'L2'),
        ('WOKI','Cameron','1998/11/07',19,'L2'),
        ('CHALUREAU','Bastien','1992/02/13',18,'L2'),
        ('VERHAEGHE','Florian','1997/04/27',21,'L2'),
        ('JALIBERT','Matthieu','1998/11/06',16,'O'),
        ('NTAMACK','Romain','1999/05/01',10,'O'),
        ('COUILLOUD','Baptiste','1997/07/22',22,'M')
        ;


/*  Equipe d'Irlande:  */

INSERT INTO P13_joueur (j_nom,j_prenom,j_dateN,j_poste,j_role)
VALUES ('PORTER','Andrew','1996/01/16',1,'P'), 
        ('HEALY','Cian','1987/10/07',3,'P'),
        ('LOUGHMAN','Jeremy','1995/07/22',20,'P'),
        ('SHEEHAN','Dan','1998/09/17',2,'T'),
        ('HERRING','Rob','1990/04/27',16,'T'),
        ('MCCARTHY','Joe','2001/03/26',4,'L2'),
        ('RYAN','James','1996/07/24',5,'L2'),
        ('DORIS','Caelan','1998/04/02',6,'L3'),
        ('CONAN','Jack','1992/07/29',7,'L3'),
        ('DEEGAN','Max','1996/10/01',8,'L3'),
        ('TIMONEY','Nick','1995/08/01',21,'L3'),
        ('MURRAY','Conor','1989/04/20',9,'M'),
        ('CASEY','Craig','1999/04/19',17,'M'),
        ('CROWLEY','Jack','2000/01/13',10,'O'),
        ('CARBERY','Joey','1995/11/01',18,'O'),
        ('BALOUCOUNE','Robert','1997/08/19',11,'AI'),
        ('CONROY','Jordan','1994/03/10',14,'AI'),
        ('RINGROSE','Garry','1995/01/26',12,'C'),
        ('HENSHAW','Robbie','1993/06/12',13,'C'),
        ('MCCLOSKEY','Stuart','1992/08/06',22,'C'),
        ('HANSEN','Mack','1998/03/27',15,'AR'),
        ('KEENAN','Hugo','1996/06/18',19,'AR')
        ;
        

/*  Création de P13_Jouer */


CREATE TABLE IF NOT EXISTS P13_jouer (
eq_id INT ,
j_id INT ,
debutContrat DATE DEFAULT '2020/01/01',
finContrat DATE DEFAULT '2025/01/01',
FOREIGN KEY (eq_id) references P13_equipe (eq_id),
FOREIGN KEY (j_id) references P13_joueur(j_id),
PRIMARY KEY (eq_id,j_id)
);

/*  Alimentation de P13_Jouer */

INSERT INTO P13_jouer(j_id,eq_id)
	SELECT j_id, eq_id
	FROM P13_joueur,P13_equipe
	WHERE (P13_joueur.j_id between 1 and 22) and P13_equipe.eq_id = 1 ; 
	
INSERT INTO P13_jouer(j_id,eq_id)
	SELECT j_id, eq_id
	FROM P13_joueur,P13_equipe
	WHERE (P13_joueur.j_id between 23 and 44) and P13_equipe.eq_id = 2 ; 

