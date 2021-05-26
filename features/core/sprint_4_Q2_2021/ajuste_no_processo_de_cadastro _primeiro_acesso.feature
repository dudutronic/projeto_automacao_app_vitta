#Projeto: APP Vitta - The Coders
#Estória: APP-1222 (Ajuste no processo de Cadastro - Primeiro Acesso)
#data criação: 20-05-2021
#Sprint: 4-Q2/2021
#Tipo de teste: Manual

@APP-1222
Feature: ajuste_no_processo_de_cadastro _primeiro_acesso

    Motivation (Start with why)
    Passamos a receber todos os e-mail da vida da base única para o APP,
    dessa forma, a validação do e-mail do usuário ficaria mais fácil se
    o mesmo nos informasse o e-mail correto, assim, haveria a possibilidade
    de comparar com os e-mails da nossa base e retornaria com o fluxo com
    sucesso ou falha.

    Background: Inserção de CPF pré-cadastrado
        Given Que insira um "55722360040" válido pré cadastrado

    @APP-1222_1
    Scenario: Primeiro acesso com um cpf pré-cadastrado (e-mail correto)
        When clicar em continuar
        Then Nova tela deve conter o e-mail pré-cadastrado com partes ocultas
        And Clicar continuar para ir a tela de criação de senha

    @APP-1222_2
    Scenario: Primeiro acesso com um cpf pré-cadastrado (e-mail correto - código incorreto)
        When clicar em continuar
        Then Nova tela deve conter o e-mail pré-cadastrado com partes ocultas
        Then Deve apresentar a mensagem "Código incorreto"


    @APP-1222_3
    Scenario: Solicitar a troca de e-mail incorreto/troca de e-mail (Novo e-mail pré-cadastrado)
        Given Usuario clicar em meu e-mail está incorreto
        When Digitar na nova tela no campo de input o "e-mail" correto
        And Campo para inserção de código de segurança
        And Clicar continuar
        Then Direcionar a tela de criação de senha

    @APP-1222_4
    Scenario: Solicitar a troca de e-mail incorreto/troca de e-mail (Novo e-mail pré-cadastrado - código incorreto)
        Given Usuario clicar em meu e-mail está incorreto
        When Digitar na nova tela no campo de input o "e-mail" correto
        And Campo para inserção de código de segurança
        And Clicar continuar
        Then Deve apresentar a mensagem "Código incorreto"

    @APP-1222_5
    Scenario: Solicitar a troca de e-mail incorreto/troca de e-mail (Novo e-mail não consta no banco)
        Given Usuario clicar em meu e-mail está incorreto
        When Digitar na nova tela no campo de input o e-mail correto, um email que não consta no banco ""
        Then Deve exibir a mensagem "Seu E-mail não encontrado. Solicite seu acesso."
        And O botão de -Enviar- nessa tela, dará lugar ao botão -Solicitar acesso-

    @APP-1222_6
    Scenario: Solicitar acesso para um novo e-mail
        Given Usuario tenha feito o fluxo até clicar em -Solicitar acesso-
        And visualizar os campos de input "Seu nome completo" , "Seu CPF" , "Seu e-mail", "Seu celular" , "Nome da mãe"
        And Campo cpf virá preenchido e bloqueado
        When Inserir os dados "nome" , "email" , "celular" , "nome_mãe"
        And Clicar em -Solicitar acesso-
        Then Deve exibir um alert dialog "Obrigado! Em breve retornaremos contato!" e um botão -Ok-
        And Ao clicar no botão -Ok, o usuario deve ser direcionado a tela Welcome.


#@APP-1222_3
#Scenario: Solicitar a troca de e-mail incorreto/troca de e-mail (Novo e-mail consta no banco com outro cpf vinculado)
#   Given Usuario clicar em meu e-mail está incorreto
#   When Digitar na nova tela no campo de input o e-mail correto, mas vinculado em outro cpf ""
#   Then Deve exibir a mensagem ""
#   And Clicar em -Solicitar acesso-
#   And Deve abrir página do formulário para a solicitação do acesso