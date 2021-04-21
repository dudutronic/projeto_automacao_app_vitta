#Projeto: APP Vitta - The Coders
#Estória: APP-1022 ([The Coders: Reembolso] Histórico de Solicitações.)
#data criaçã: 13-04-2021
#Sprint: 2-Q2/2021
#Execução: Manual/Automatizada


@APP-1022
Feature: Reembolso_historico_de_Solicitacoes

    @APP-1020_01
    Scenario Outline: Efetuar login com CPF elegivél a reembolso (Criação de campos na tela inicial do central de reembolso)
        Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
        And Insere uma senha "senha" válida
        And acessar a central de reembolso e selecionar o beneficio
        Then Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso
        And Na tela de central de reembolso devem constar os campos "Solicitar reembolso", "Solicitar prévia" e "Histórico de solicitações"

    @APP-1020_01
    Scenario Outline: Histórico de solicitações: Devem constar as solicitações de reembolso efetuadas (Reprovado, Aprovado e em andamento)
        Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
        And Insere uma senha "senha" válida
        And acessar a central de reembolso e selecionar o beneficio
        And Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso
        When Na tela de central de reembolso acessar "Histórico de solicitações"
        Then 




