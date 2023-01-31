import os

from datetime import datetime
# criação do log para visualizar conexão com o banco
def logFile(text):
  
  dataEhoraAtual = datetime.now()
  datahora = str(dataEhoraAtual.strftime('%d-%m-%Y %H:%M:%S'))
  data = str(dataEhoraAtual.strftime('%d-%m-%Y'))

  for lengthLog in os.walk('./log/'):
    try:
      if len(lengthLog[2]) == 0 or f'./log/{data}.log' not in lengthLog[2] == True:
        log = open(f'./log/{data}.log', 'x+')
        log.write(f'{datahora} -> {text}\n')
      else:
        log = open(f'./log/{data}.log', 'a')
        log.write(f'{datahora} -> {text}\n')
      log.close()
    except Exception as error:
      if len(lengthLog[2]) == 0 or f'./log/{data}_error.log' not in lengthLog[2] == True:
        log = open(f'./log/{data}_error.log', 'x+')
        log.write(f'{datahora} -> {error}\n')
      else:
        log = open(f'./log/{data}_error.log', 'a')
        log.write(f'{datahora} -> {error}\n')
      log.close()