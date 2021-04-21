#Projeto: APP Vitta - The Coders
#Estória: APP-1152 (Adicionar botão de voltar "<" na tela de login para a tela de CPF)
#data criação: 13-04-2021
#Sprint: 2-Q2/2021
#Automatizado

@APP-1152
Feature: adicionar_botao_de_voltar_na_tela_de_login_para_a_tela_de_cpf
    Background: Fazer Login na aplicação com um usuário válido
        Given Que esteja logado com um cpf com uma conta válida
            | cpf   | 85216822046   |
            | senha | Melhor3maior@ |

    #Fluxo Principal
    @APP-1152_1
    Scenario: Fazer log-off e utilizar o botão > voltar para retronar a validação por CPF
        Given Que deslogo do sistema
        When Quando passar pela etapa de validação com válido um "cpf" na tela inicial
        And Estiver em tela de login por CPF ou e-mail
        Then Deve ser criado o botão de voltar ">"
        And Deve voltar a tela anterior ao clicar no botão voltar ">"

    #Fluxo de Exceção
    @APP-1152_2
    Scenario: Falha na conexão com o servidor
        Given Que deslogo do sistema
        When Quando passar pela etapa de validação com válido um "cpf" na tela inicial
        And Estiver em tela de login por CPF ou e-mail Clicar em ">"
        Then Deve ser criado o botão de voltar ">"
        And Deve voltar a tela anterior ao clicar no botão voltar ">"

