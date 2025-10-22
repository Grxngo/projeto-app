import os

""" Essa variavel mostra um dicionario dos restaurantes"""
restaurantes = [{'nome': 'Praça', 'categoria' : 'Japonesa', 'ativo' :False},
                 {'nome' : 'Pizza Suprema', 'categoria' : 'Pizza', 'ativo' :True},
                 {'nome' : 'Cantina', 'categoria' : 'Italiano', 'ativo' : False}
                 ]

def exibir_nome_do_programa():
      """ Essa função exibe o nome do App"""
      print("""
      S̲a̲b̲o̲r̲E̲x̲p̲r̲e̲s̲s̲
      """)

def exibir_opcoes():
      """ Essa função exibe as opções que temos"""
      print("1. Cadastrar restaurante")
      print("2. Listar restaurantes")
      print("3. Ativar restaurante")
      print("4. Sair\n")

def finalizar_app():
  """ Essa função encerra o App"""
  os.system("cls")
  exibir_subtitulo("Finalizar App")

def voltar_ao_menu_principal():
   """ Essa função volta ao menu principal"""
   input("\nDigite um tecla para voltar ao menu: ")
   main()

def opcao_invalida():
   """ Essa função determina se a opção é valida ou invalida"""
   print("Opção Invalida!\n")
   voltar_ao_menu_principal()

def exibir_subtitulo(texto):
   """ Essa função determina o espaçamento entre os subtitulos"""
   os.system('cls')
   linha = ' * ' * (len(texto))
   print(linha)
   print(texto)
   print(linha)
   print()
   

def cadastrar_novo_restaurante():
   """ Essa função é responsavel por cadastrar um novo restaurante"""
   exibir_subtitulo("Cadastro de novos restaurantes")
   nome_do_restaurante = input("Digite o nome do restaurante que deseja cadastrar: ")
   categoria = input(f"Digite o nome da categoria do restaurante {nome_do_restaurante}: ")
   dados_do_restaurante = {'nome' :nome_do_restaurante, 'categoria' :categoria, 'ativo' :False}
   restaurantes.append(dados_do_restaurante)
   print(f"O restaurante {nome_do_restaurante} foi cadastrado com sucesso! ")
   voltar_ao_menu_principal()

def listar_restaurantes():
   """ Essa função lista os restaurantes"""
   os.system('cls')
   exibir_subtitulo("Listando restaurantes")

   print(f'{'Nome do restaurante'.ljust(20)} | {'Categoria'.ljust(20)} | {'Status'}')
   for restaurante in restaurantes:
      nome_restaurante = restaurante['nome']
      categoria = restaurante['categoria']
      ativo = 'ativado' if restaurante['ativo'] else 'desativado'
      print(f"- {nome_restaurante.ljust(20)} | {categoria.ljust(20)} | {ativo}")

   voltar_ao_menu_principal()

def alternar_estado_restaurante():
   """ Essa função serve para alternar o estado dos restaurantes, se eles estão ativos ou desativados"""
   exibir_subtitulo('Alternando estado do restaurante')
   nome_restaurante = input("Digite o nome do restaurante que deseja alterar o estado:  ")
   restaurante_encontrado = False

   for restaurante in restaurantes:
      if nome_restaurante == restaurante['nome']:
         restaurante_encontrado = True
         restaurante['ativo'] = not restaurante['ativo']
         mensagem = f"O restaurante {nome_restaurante} foi ativado com sucesso" if restaurante['ativo'] else f"O restaurante {nome_restaurante} desativado com sucesso"
         print(mensagem)
         if not restaurante_encontrado:
            print("O restaurante não foi encontrado")

   voltar_ao_menu_principal()

def escolher_opcao():
      """ Essa função escolhe as opções que temos"""
      try:
            opcao_escolhida = int(input("Escolha uma opção: "))
            # opcao_escolhida = int(opcao_escolhida)


            if opcao_escolhida == 1:
             cadastrar_novo_restaurante()
            elif opcao_escolhida == 2:
             listar_restaurantes()
            elif opcao_escolhida == 3:
             alternar_estado_restaurante()
            elif opcao_escolhida == 4:
             finalizar_app()
            else:
             opcao_invalida()
      except:
         opcao_invalida()
         
def main():
   """ Essa função é da tela principal"""
   os.system('cls')
   exibir_nome_do_programa()
   exibir_opcoes()
   escolher_opcao()

if __name__ == '__main__':
  main()
