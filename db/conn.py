from config import create_log
from .crud import select,delete,update,insert
import tkinter as tk
from tkinter import *
#Ttk treeview não vem com Tkinter padrão
from tkinter import ttk
from tkinter import messagebox


##conexão com banco
import mysql.connector as conn

#criando conexão com o banco
def access(dbuser, dbpass):
  cnx = conn.connect(
    user = dbuser, 
    password = dbpass 
  )

  create_log.logFile('Conectando...')
  try:
    cursor = cnx.cursor()
    create_log.logFile('Verificando conexao com o banco...')
    createDb = ('create database if not exists syscopa;')
    cursor.execute(createDb)
    useDb = ('use syscopa;')
    cursor.execute(useDb)
    create_log.logFile('Banco selecionado!')
    print('\nBanco conectado com sucesso!\n')

 #Select por tabela escolhida
    try:
     print('Veja dados ')
     print('Orientações: arbitro, equipe, tecnico , grupos, partidas,ou tecle enter para pular.') 
     tabela = str(input('Escolha onde voce quer buscar: '))  
     print('Orientações: nome_arbitro, nome_tecnico, nome_equipe, desc_grupo, local_partida, data_partida, hora_inicio, num_gol_equipe1, num_gol_equipe2  ')
     coluna = str(input('Escolha onde voce quer buscar ')) 
     condicao = str(input('Qual o campo?: '))
     select.selecionar(cursor,tabela,coluna,condicao)
     print()
    except Exception as error:
      create_log.logFile(f'Erro ao chamar select.selecionar:\n{error}')
      print('Erro ao executar comando.')


  #Delete tabela por tabela escolhida
    try:
      print('Delete dados')
      print('Tecle enter para pular')
      print('Orientações: arbitro, equipe, tecnico , grupos, partidas,ou tecle enter para pular.') 
      tabela = str(input('Escolha onde voce quer deletar: '))
      print('Orientações: nome_arbitro, nome_tecnico, nome_equipe, desc_grupo, local_partida, data_partida, hora_inicio, num_gol_equipe1, num_gol_equipe2  ')
      coluna = str(input('Escolha onde voce quer buscar '))
      condicao = str(input('Digite o identificador referente ao dado que deseja excluir: '))
      delete.deletar(cnx,cursor,tabela,coluna,condicao)
    except Exception as error:
      create_log.logFile(f'Erro ao chamar funcao da crud.\n{error}')
      print('Erro ao executar comando.\n\n')

  #Insert tabela por tabela escolhida
    try:
      print('Insira dados')
      print('tecle enter para pular')
      print('Orientações: arbitro, equipe, tecnico , grupos, partidas,ou tecle enter para pular.')
      tabela = str(input('Escolha onde voce quer buscar '))
      print('Orientações: nome_arbitro, nome_tecnico, nome_equipe, desc_grupo, local_partida, data_partida, hora_inicio, num_gol_equipe1, num_gol_equipe2  ')
      coluna = str(input('Escolha onde voce quer buscar '))
      valores = str(input('Digite um dado a ser inserido: '))
      insert.inserir(cnx,cursor,tabela,coluna,valores)
    except Exception as error:
      create_log.logFile(f'Erro ao chamar funcao da crud.\n{error}')
      print('Erro ao executar comando.')

  #Update tabela por tabela escolhida
    try:
     print('Atualize dados')
     print('tecle enter para pular')
     print('Orientações: arbitro, equipe, tecnico , grupos, partidas,ou tecle enter para pular.')
     tabela = str(input('Digite o item a ser atualizado: '))
     print('Orientações: nome_arbitro, nome_tecnico, nome_equipe, desc_grupo, local_partida, data_partida, hora_inicio, num_gol_equipe1, num_gol_equipe2  ')
     coluna = str(input('Digite o campo a ser atualizado: '))
     valores = str(input('Digite o valor a será atualizado: '))
     print('Orientações: insira o nome do identificador: ')
     condicao = str(input('id_arbitro, id_tecnico, id_equipe, id_grupo, Id_partida: '))
     rep_condicao = int(input('Digite o valor do identificador a ser atualizado: '))
     update.atualizar(cnx,cursor,tabela,coluna,valores,condicao,rep_condicao)
    except Exception as error:
      create_log.logFile(f'Erro ao chamar funcao da crud.\n{error}')
      print('Erro ao executar comando.')

  except Exception as error:
    create_log.logFile('Erro de conexao.')
    print('\nFalha na conexao com o banco.\n')
def closeAccess():
  conn.connect().close()
