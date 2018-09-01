import config
import mysql.connector
from mysql.connector import errorcode

class MysqlPython(object):
    __instance = None
    __host = None
    __user = None
    __password = None
    __database = None
    __session = None
    __connection = None

    def __new__(cls, *args, **kwargs):
        if  not cls.__instance or not cls.__database:
            cls.__instance = super(MysqlPython, cls).__new__(cls, *args, **kwargs)
        return cls.__instance
    #end def __new__

    def __init__(self,host = config.hostDef, user = config.userDef, password = config.passDef, database = config.dbDef ):
        self.__host = host
        self.__user = user
        self.__password = password
        self.__database = database
    #end def __init__

    def __open(self):
        try:
            cnx = mysql.connector.connect(host = self.__host, user = self.__user, password = self.__password, database = self.__database)
            self.__connection = cnx
            self.__session = cnx.cursor()
        except mysql.connector.Error as err:
            print(err)
    #end def __open

    def __close(self):
        self.__session.close()
        self.__connection.close()
    #end def __close

    def select(self, table, where=None, *args, **kwargs):
        result = None
        query = 'SELECT '
        keys = args
        values = tuple(kwargs.values())
        l = len(keys) - 1

        for i, key in enumerate(keys):
            query += "`"+key+"`"
            if i < l:
                query += ","
        ## End for keys

        query += 'FROM %s' % table

        if where:
            query += " WHERE %s" % where
        ## End if where

        self.__open()
        self.__session.execute(query, values)
        number_rows = self.__session.rowcount
        number_columns = len(self.__session.description)

        if number_rows >= 1 and number_columns > 1:
            result = [item for item in self.__session.fetchall()]
        else:
            result = [item[0] for item in self.__session.fetchall()]
        self.__close()

        return result
    ## End def select