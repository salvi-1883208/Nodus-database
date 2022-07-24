import mysql.connector

def app():
    cnx = mysql.connector.connect(host='localhost',
                                database='nodus',
                                user='root',
                                password='12345')
    cursor = cnx.cursor()
    db_Info = cnx.get_server_info()
    print("Connected to MySQL Server version ", db_Info)

    while(True):

        print("\n----------------------------------------------------------------------------------------\n")
        print("Inserisci una query in SQP da eseguire sul database o una query in linguaggio naturale tra le implementate.\nPer terminare l'esecuzione del programma inserire 'q'\n")

        query = input()

        if(query == "q"):
            break
        
        try:
            query = querySelector(query, cursor)

            if(query != ""):
                print("\nExecuting query:      %s\n" % query)

                cursor.execute(query)

                print("Results:")

                for a in cursor:
                    print(a)
        except mysql.connector.Error as err:
            print("\nSomething went wrong: {}".format(err))

        cnx.commit()

    cursor.close()
    cnx.close()
    print("\nMySQL connection is closed")



def querySelector(queryLn, cursor):
    s = ""
    if(queryLn == "Ricerca di un particolare brano"):
        s = "SELECT * FROM brano AS b WHERE b.Nome = '{0}'".format(brano())

    elif(queryLn == "Ricerca di un particolare artista e tutti i suoi brani"):
        s = "SELECT  * FROM brano AS b, artista AS a WHERE b.Artista = a.Username AND b.Artista = '{0}'".format(artista())
        
    elif(queryLn == "Ricerca di un particolare album e del suo numero di brani"):
        s = "SELECT * FROM album AS a WHERE a.Nome = '{0}'".format(album())

    elif(queryLn == "Creazione di una nuova playlist da parte di un utente"):
        cursor.execute("INSERT into playlist" "(Utente, Nome)" " values (%s, %s)", (utente(), playlist()))

    elif(queryLn == "Aggiunta di un brano ad una playlist"):
        cursor.execute("insert into inclusioneplaylist" "(Brano, Artista, Genere, Utente, Playlist)" "values (%s, %s, %s, %s, %s)", (brano(), artista(), genere(), utente(), playlist()))	

    elif(queryLn == "Aggiunta di un brano ad i propri brani preferiti"):
        cursor.execute("insert into inclusionebranipreferiti" "(Brano, Artista, Genere, Utente)" "values (%s, %s, %s, %s)", (brano(), artista(), genere(), utente()))

    elif(queryLn == "Aggiunta di un nuovo utente"):
        cursor.execute("insert into utente " "(Username) " "values (%s)", (utente(),))
    
    else:
        return queryLn
    return s


def brano():
    return input("Inserisci il nome del Brano: ")

def artista():
    return input("Inserisci il nome dell'Artista: ")

def genere():
    return input("Inserisci il nome del Genere: ")

def utente():
    return input("Inserisci il nome dell'Utente: ")

def playlist():
    return input("Inserisci il nome della Playlist: ")

def album():
    return input("Inserisci il nome dell'Album': ")


app()