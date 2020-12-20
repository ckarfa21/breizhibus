import mysql.connector

class BDD:
      #connection a la base sql
    def connect(self):
        self.mydb=mysql.connector.connect(
        host="localhost",
        port="8082",
        user="root",
        password="root",
        database="breizhibus")
        self.cursor = self.mydb.cursor()
    #fermeture de connection 
    def fermer_connexion(self):
        self.cursor.close()


    # Recuperation de donnees
    def getData(self, query):
        self.connect()
        self.cursor.execute(query)
        resultat=self.cursor.fetchall()
        return resultat

connection = BDD()