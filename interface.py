#Il vous faut développer une interface graphique, même rudimentaire.
#Il vous faut faire un formulaire qui permet d'ajouter des bus en base et de les assigner à une ligne
#(un bus ne peut avoir qu'une seule ligne, mais une ligne peut avoir plusieurs bus).
#Il faut aussi pouvoir les modifier et les supprimer; Enfin, lorsque vous affichez les arrêts par ligne, affichez aussi les bus par ligne.

#root.configure(bg="#41B77F") # bg = background

# On importe Tkinter
# import tkinter as tk
from tkinter import *
import random
from gestionBus import *

def affiche_resultatsql(resultas,fenetre):
    for arrets in resultas:
        nom,adresse=arrets
        affiche=nom+" "+adresse
        ligne_label= Label(fenetre,text=affiche)
        ligne_label.pack()
       
     

# Création d'un widget Canvas (zone graphique)




#on traite la donnee
data=getArrets()
arrets=[]
for i in data:
    arrets.append(i[0])
mots=""  
for i in arrets:
    mots+=i+"\n"

print(mots)
# On crée une fenêtre, racine de notre interface
fenetre = Tk() 
fenetre['bg']='bisque' # couleur de fond
# Création d'un widget Canvas (zone graphique)
Largeur = 355
Hauteur = 55
Canevas = Canvas(fenetre,width = Largeur, height =Hauteur)
Canevas.pack()



# On crée un label (ligne de texte) souhaitant la bienvenue
# Note : le premier paramètre passé au constructeur de Label est notre
# interface racine
# On affiche le label dans la fenêtre
champ_label = Label(fenetre,width=30, text="Bienvenue chez Breizhibus!")
champ_label.pack()
button=Button(fenetre,width=30,text="rouge",command=lambda:affiche_resultatsql(getArretByLigne(1),fenetre))
button.pack()
button2=Button(fenetre,width=30,text="vert",command=lambda:affiche_resultatsql(getArretByLigne(2),fenetre))
button2.pack()
button3=Button(fenetre,width=30,text="bleu",command=lambda:affiche_resultatsql(getArretByLigne(3),fenetre))
button3.pack()


#lignes=getLignes()


# for ligne in lignes:
   


# On démarre la boucle Tkinter qui s'interompt quand on ferme la fenêtre
Bouton1 = Button(fenetre, text = 'Quitter', command = fenetre.destroy)
Bouton1.pack()



