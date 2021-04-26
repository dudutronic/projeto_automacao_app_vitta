#Projeto: APP Vitta - The Coders
#Estória: APP-1022 ([The Coders: Reembolso] Histórico de Solicitações.)
#data criaçã: 22-04-2021
#Sprint: 2-Q2/2021
#Execução: Manual/Automatizada


@APP-1022
Feature: Reembolso_historico_de_Solicitacoes

    @APP-1022_01
    Scenario: Efetuar login com CPF elegivél a reembolso (Criação de botões na tela inicial do central de reembolso)
        Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
        And Insere uma senha "senha" válida
        And acessar a central de reembolso e selecionar o beneficio
        Then Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso
        And Na tela de central de reembolso devem constar os botões "Solicitar reembolso", "Solicitar prévia" e "Histórico de solicitações"

    @APP-1022_02
    Scenario: Histórico de solicitações: Devem constar as solicitações de reembolso efetuadas (Reprovado, Aprovado e em andamento)
        Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
        And Insere uma senha "senha" válida
        And acessar a central de reembolso e selecionar o beneficio
        And Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso
        When Na tela de central de reembolso acessar "Histórico de solicitações"
        Then Deve aprensentar cards de solicitaçaõ
        And Nos cards devem constar "Data da solicitação", "status", "procedimento", "beneficiário"
        And Botão de "mais detalhes"

    @APP-1022_03
    Scenario Outline: Histórico de solicitações: Devem constar as solicitações de reembolso efetuadas (Reprovado, Aprovado e em andamento)
        Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
        And Insere uma senha "senha" válida
        And acessar a central de reembolso e selecionar o beneficio
        And Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso
        When Na tela de central de reembolso acessar "Histórico de solicitações"
        Then Em "Histórico de solicitações" deve aprensentar cards de solicitações com os "status"

        Examples:
            | Status               |
            | Aguandando Validação |
            | Am analise           |
            | Aprovado             |
            | Reprovado            |


    @APP-1022_04
    Scenario: Histórico de solicitações (Usuario não realizou solicitações de reembolso)
        Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
        And Insere uma senha "senha" válida
        And acessar a central de reembolso e selecionar o beneficio
        And Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso
        When Na tela de central de reembolso acessar "Histórico de solicitações"
        And Usuario nunca solicitou reembolso
        Then Em "Histórico de solicitações" Não deve aprensentar cards de solicitações


    @APP-1022_05
    Scenario Outline: Verificar card dentro dos historico de reembolso (Validar campos após acessar um card expecifico)

        Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
        And Insere uma senha "senha" válida
        And acessar a central de reembolso e selecionar o beneficio
        And Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso
        When Na tela de central de reembolso acessar "Histórico de solicitações"
        And Clicar no botão "mais detalhes"
        Then Deve constar os "dados" referente o pedido de reembolso
        And E os "Solicitar reanalise" e "Iniciar reembolso a partir deste"

        Examples:
            | dados                            |
            | Status                           |
            | Data da Solicitação              |
            | Paciênte                         |
            | Beneficiarios                    |
            | Nº carteirinha                   |
            | Tipo de serviço                  |
            | protocolo do pedido de reembolso |
            | Valor pago                       |


    @APP-1022_06
    Scenario: Solcicitar reembolso a partir da tela de histórico de reembolso

        Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
        And Insere uma senha "senha" válida
        And acessar a central de reembolso e selecionar o beneficio
        And Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso
        When Na tela de central de reembolso acessar "Histórico de solicitações"
        And Clicar no botão "mais detalhes"
        And Clicar em "Iniciar reembolso a partir deste"
        Then Deve redirecionar a tela de solicitação de reembolso com os dados imputados iguais aos do histórico que foi acessado

    @APP-1022_07
    Scenario: Solcicitar reanalise a partir da tela de histórico de reembolso

        Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
        And Insere uma senha "senha" válida
        And acessar a central de reembolso e selecionar o beneficio
        And Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso
        When Na tela de central de reembolso acessar "Histórico de solicitações"
        And Clicar no botão "mais detalhes"
        And Clicar em "Solicitar reanalise"
        Then Deve redirecionar a tela de solicitação de contato/central de atendimento

    @APP-1022_08
    Scenario: Efetuar login com não CPF elegivél a reembolso
        Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
        And Insere uma senha "senha" válida
        And acessar a central de reembolso e selecionar o beneficio
        Then Deve Não ser possivel Fazer a integração com a central de reembolso


