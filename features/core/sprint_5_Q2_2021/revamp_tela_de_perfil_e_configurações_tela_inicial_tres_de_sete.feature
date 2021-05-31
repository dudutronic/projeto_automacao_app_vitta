#Projeto: APP Vitta - The Coders
#Estória: APP-1208 (Revamp tela de perfil e configurações - Tela inicial 3 de 7)
#data criação: 31-05-2021
#Sprint: 5-Q2/2021
#Tipo de teste:

@APP-1208

Feature: revamp_tela_de_perfil_e_configurações_tela_inicial_tres_de_sete

    As informações dessa tela já existem,
    iremos somente mudar visualmente como ela é apresentada.

    Background: Fluxo completo de login
        Given Que esteja logado com um cpf "05061097041"
        And Uma senha "Melhor3maior@" de uma conta válida
        And Acesse tela Perfil e configurações


    Scenario: Verificar campos na tela de Dados de login
        Given Que acessar Dados de login
        When Apresentar os campos "E-mail principal" , "CPF" , "Sua senha"
        Then O e-mail deve ser o cadastrado no banco para o usuario atual logado
        And O CPF deve ser o cadastrado no banco para o usuario atual logado
        And Campos de e-mail e senha devem está bloqueados para não serem editados
        And O campo senha deve está com os caracteres da senha ocultos


    Scenario: Validar campo de senha em Dados de Login
        Given Acessar Dados de login
        When  Clicar em Troque sua senha
        Then Deve direcionar para a tela de cadastrar nova senha


    Scenario: Validar Alteração de senha
        Given acessar a troca de senha pelo dados de login
        When Inserir a "senha_atual"
        And Inserir "nova_senha" de forma identica duas vezes
        And Clicar em salvar
        Then Deve persistir a alteração da nova senha
        And Após salvar deve redirecionar a tela de dados do login


    Scenario: Validar Alteração de senha (Senha atual inserida inválida)
        Given acessar a troca de senha pelo dados de login
        When Inserir a "senha_atual" de forma incorreta
        And Inserir "nova_senha" de forma identica duas vezes
        And Clicar em salvar
        Then Não deve efetuar a alteração da nova senha
        And Apresentar mensagem de erro referente a senha digitada de forma incorreta


    Scenario: Validar Alteração de senha (novas senhas não são iguais)
        Given acessar a troca de senha pelo dados de login
        When Inserir a "senha_atual" de forma incorreta
        And Inserir "nova_senha_p" no primeirco campo
        And Inserir "nova_senha_s" no segundo campo diferente da primeira
        And Clicar em salvar
        Then Não deve efetuar a alteração da nova senha
        And Apresentar mensagem de erro referente a senha digitada que não conhecidem


    Scenario: Validar Alteração de senha (Nova senha com caracteres inválidos)
        Given acessar a troca de senha pelo dados de login
        When Inserir a "senha_atual" de forma incorreta
        And Inserir "nova_senha" de forma identica mas com caracteres inválidos
        And Clicar em salvar
        Then Não deve efetuar a alteração da nova senha
        And Apresentar mensagem de erro referente a nova senha com caracteres inválidos


    Scenario: Validar Alteração de senha (Delogar e logar novamente por e-mail)
        Given Que tenha alterado a senha
        And Efetuar o login pelo cpf da senha alterada
        When Inserir a nova senha cadastrada e clicar em fazer login
        Then Deve logar com a senha nova senha com sucesso
        But Relogar com a senha antiga deve apresentar erro de senha inválida


    Scenario: Validar Alteração de senha (Delogar e logar novamente por e-mail)
        Given Que tenha alterado a senha
        And Efetuar o login pelo e-mail da senha alterada
        When Inserir a nova senha cadastrada e clicar em fazer login
        Then Deve logar com a senha nova senha com sucesso
        But Relogar com a senha antiga deve apresentar erro de senha inválida