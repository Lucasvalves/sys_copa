#criando funçao metodo (recebendo parametros)
from config import create_log

#Select
def selecionar(cursor,tabela,coluna,condicao):
  if condicao != '':
    try:
      #
      cursor.execute(f'select * from {tabela} where {coluna} = "{condicao}";')

      exibicao = cursor.fetchall()
      create_log.logFile(f'`def selecionar` resultado:\n{exibicao}')
      print(f'O registro é: {exibicao}')
      
    except Exception as error:
      create_log.logFile(f'Erro ao executar `def selecionar`:\n{error}')
      #
      print(f'Erro ao executar `def selecionar`:\n{error}')
  else:
    create_log.logFile('Este campo nao existe.')
    #
    print('Este campo nao existe.')
