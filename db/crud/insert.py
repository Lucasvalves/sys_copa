import datetime
#Insert
def inserir(cnx,cursor,tabela,coluna,valores):
  if valores != '':
    cursor.execute(f'insert into {tabela} ({coluna}) values "({valores})" ;')
    cnx.commit()
    print(f'{cursor.rowcount}, Linhas inseridas')
    print(cursor.fetchall())#fetchal trás tudo
  else:
    print("Tabela esta vazia!")