#Estória: APP-1026 (Ajustes de onboarding pré login)
#data criação: -2021
#Sprint: 
#Execução: Automatizada
@APP-1026

Feature: Ajustes_de_onboarding_pre_login


    Background: Tela inicial da plicação antes do login
        Given Given Que ao abri a tela incial e clicar em -Acessar minha conta-
        Then Sou direcionado a tela de boas vindas

    Scenario: Efetuar login com CPF cadastrado
        @APP-1026_01
        Given Que informo um "cpf" que possui uma conta válida
        When Clico em continuar
        Then Sou direcionado a tela de login

    Scenario Outline: Efetuar login com CPF cadastrado
        @APP-1026_02
        Given  Inserir um "cpf" que -NÃO- possui uma conta
        When Clico em continuar
        Then Deve exibir uma "mensagem" de erro

        Examples:
            | cpf | mensagem                                     |
            |     | Seu CPF não foi encontrado em nossa base     |
            |     | Seu CPF já tem um cadastrado na Vitta        |
            |     | CPF iválido, por favor informe um CPF válido |

    @APP-1026_03
    Scenario: Falha no servidor
        Given Inserir um "cpf"
        When Clico em continuar
        Then Retorna a mensagem "Falha no servidor, por favor tente mais tarde"