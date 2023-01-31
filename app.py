#Login com o banco
#A senha pode ser digitada mesmo sem estar a mostra, questão de segurança para não ser exposta.
from getpass import getpass

from db import conn

def initApp():
  user = str(input('Login: '))
  password = str(getpass('Password: '))

  conn.access(user, password)

initApp()