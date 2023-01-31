#Insert
def atualizar(cnx,cursor,tabela,coluna,valores,condicao, rep_condicao):
  if valores != '':
    # teste = f'update {tabela} set {coluna} = {valores} where {condicao} = {rep_condicao} '
    # print(teste)
    cursor.execute(f'update {tabela} set {coluna} = "{valores}" where {condicao} = {rep_condicao} ')
    cnx.commit()
    print(f'{cursor.rowcount}, Linha atualizada\n')
    print(cursor.fetchall())#fetchal trás tudo
  else:
    print("Tabela esta vazia!\n")


