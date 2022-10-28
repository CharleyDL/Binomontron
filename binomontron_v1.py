import mysql.connector as mysqlc
import svrconfig as svr
from random import sample

db = mysqlc.connect(user=svr.USER, password=svr.PASSWORD, 
                     host=svr.HOST, port=svr.PORT, database=svr.DATABASE)
cursor = db.cursor()

# Récupére la taille de la liste
query = 'SELECT * FROM Eleves;'
cursor.execute(query)
result = cursor.fetchall()
sizeList = len(result)

# Demande taille groupe et vérifie si in_range
nbrPers = 0
print("Il y a " + str(sizeList) + " apprenants dans votre classe.\n")
nbrPers = int(input("Combien de personnes souhaitez-vous par groupe ? "))

while not (nbrPers >= 2 and nbrPers <= sizeList):
    nbrPers = int(input("Attention, il vous faut au minimum 2 personnnes par groupe."))

# Récupère la liste des apprenants et sélectionne aléatoirement les apprenants 
# pour les inscrire dans groupe
query = 'SELECT nom, prenom FROM Eleves;'
cursor.execute(query)
liste_eleves = sorted([eleve for eleve in cursor])

liste_groupe = []
while sizeList > nbrPers:
    grpGen = sample(liste_eleves, nbrPers) # tire aléatoirement nbrPers dans liste
    
    liste_groupe.append(grpGen) # ajoute le groupe dans la liste des groupes
    
    for eleve in grpGen: # supprime les personnes tirées de la liste
        liste_eleves.remove(eleve)
    
    sizeList = len(liste_eleves)

if sizeList > 0:
    liste_groupe.append(liste_eleves)

# Création d'une nouvelle table + Date ; envoie vers la BDD 


# Afficher la liste des groupes
for groupe in liste_groupe:
    print(groupe)

'''cursor.execute(""" 
               INSERT INTO Eleves_Groupes (id_eleve, id_groupe, date_crea)
               VALUES (%s, %s, NOW())
               """, list_groupe
              )
'''

#cursor.close()
#db.close()