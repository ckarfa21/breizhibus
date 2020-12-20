from DB import connection

def getLignes():
    return connection.getData('SELECT * FROM breizhibus_lignes')

def getArrets():
    return connection.getData('SELECT * FROM breizhibus_arrets')


def getArretByLigne(id):
    query='SELECT a.nom,a.adresse FROM breizhibus_arrets a , breizhibus_arrets_lignes al '\
          'WHERE a.id_arret=al.id_arret '\
          'AND al.id_ligne='+str(id)
    return connection.getData(query)

