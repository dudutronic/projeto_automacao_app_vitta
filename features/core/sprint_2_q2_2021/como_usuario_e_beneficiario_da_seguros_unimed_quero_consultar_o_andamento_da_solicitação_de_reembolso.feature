#Projeto: APP Vitta - The Coders
#Estória: APP-1022 (Como usuário e beneficiário da Seguros Unimed quero consultar o andamento da solicitação de reembolso)
#data criaçã: 13-04-2021
#Sprint: 2-Q2/2021
#Execução: Manual/Automatizada

@APP-1022
Feature: como_usuario_e_beneficiario_da_seguros_unimed_quero_consultar_o_andamento_da_solicitação_de_reembolso
    Background: Acessar painel de histórico de reembolso
        Given Que ao abri a tela incial e clicar em -Acessar minha conta-
        And Que esteja logado com um "cpf" e uma "senha" de uma conta válida
        When  Clicar no icone -Central de Reembolso-
        Then Deve ser possível visualiar a aba -Lista de reembolso-
        And Deve ser possível visualizar -Lista de prévias-

        Scenario: Scenario name
