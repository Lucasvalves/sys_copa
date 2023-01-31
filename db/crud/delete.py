#Delete tabela arbitro
def deletar(cnx,cursor,tabela,coluna,condicao):
  if condicao != '':
    cursor.execute(f'delete from {tabela} where {coluna} = {condicao};')
    cnx.commit()
    print(f'{cursor.rowcount}, Linhas deletadas')#fetchal trás tudo
  else:
    print("Para deletar é necessario uma condição\n")
