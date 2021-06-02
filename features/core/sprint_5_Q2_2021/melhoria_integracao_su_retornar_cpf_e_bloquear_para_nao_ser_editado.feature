#Projeto: APP Vitta - The Coders
#Estória: APP-1302 ([Melhoria: Integração SU] Retornar CPF e bloquear para não ser editado)
#data criação: 02-06-2021
#Sprint: 5-Q2/2021
#Tipo de teste:

@APP-1302
Feature: melhoria_integracao_su_retornar_cpf_e_bloquear_para_nao_ser_editado.feature

    Sabendo que a solicitação de reembolso na Seguros Unimed é
    sempre feita em nome do titular e que o CPF do titular é o
    CPF do usuário autenticado no app da Vitta, estamos propondo
    como melhoria que o usuário não precise informar novamente
    o seu CPF quando desejar solicitar um reembolso.

    Background: Navegar até integração da central de reembolso
        Given Dado que esteja logado com um "cpf" e "senha"
        And Tenha acessado a integração disponivel em central de reembolso

    Scenario: retornar cpf previamente logado de forma bloqueada
        Given Tenha selecionado a integração com o Seguro Unimed
        When Tentar inserir os dados do usuario
        Then Deve retornar o cpf que foi utilizado para logar na aplicação
        And O campo "cpf" deve está bloqueado para edição
        And O cpf não pode ser removido
        And Ao complementar com a senha correta, deve ser possivél conectar com sucesso

