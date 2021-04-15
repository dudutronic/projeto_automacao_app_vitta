#Estória: APP-841 (Criar link da teleconsulta que direciona o usuário para o App)
#data criação: 15-04-2021
#Sprint: Regressivo
#manual

@APP-841
Feature: criar_link_da_teleconsulta_que_direciona_o_usuario_para_o_app

    @APP-841_1
    Scenario: Redirecionameto a tela de telemedicina (Quando possui APP Vitta instalado e logado)
        Given Quando receber um link de acesso a sala de tele atendimento
        When Ao clicar no link
        And aceitar termos ao abrir o link
        Then Deve redirecionar a tela de teleconsulta dentro do aplicativo

    @APP-841_2
    Scenario: Redirecionameto a tela de telemedicina (Quando possui APP Vitta instalado e não logado)
        Given Quando receber um link de acesso a sala de tele atendimento
        When Ao clicar no link
        And aceitar termos ao abrir o link
        Then Deve redirecionar a tela de login do aplicativo
        And Que logado com um "cpf" e "senha" de uma conta válida
        And Deve redirecionar a tela de teleconsulta dentro do aplicativo

        Examples:

            | cpf            | senha |
            | 000.000.000-00 | 00000 |

    @APP-841_3
    Scenario: Redirecionameto a tela de telemedicina (Quando Não possui APP Vitta instalado)
        Given Quando receber um link de acesso a sala de tele atendimento
        When Ao clicar no link
        And Deve redirecionar ao aplicativo nativo para a instalação do APP-Vitta
        And aceitar termos ao abrir o link
        Then Ao abri APP vitta depois de instalado, Deve redirecionar a tela de login do aplicativo
        And Que logado com um "cpf" e "senha" de uma conta válida
        And Deve redirecionar a tela de teleconsulta dentro do aplicativo

        Examples:

            | cpf            | senha |
            | 000.000.000-00 | 00000 |