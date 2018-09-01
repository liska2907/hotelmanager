from Mysql_Python import MysqlPython

a = MysqlPython()

conditional_query = 'account = %s'
result = a.select('tb_user_boss', conditional_query, 'account', account='thudq')
print(result)