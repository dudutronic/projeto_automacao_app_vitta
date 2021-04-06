#Estória: APP-1046 (Possibilidade de incluir um logo nos benefícios de saúde)
#data criação: 06-04-2021
#Sprint: 1-Q2/2021
#Manual

@APP-1046
Feature: possibilidade_de_incluir_um_logo_nos_beneficios_de_saude
    Background: Fazer Login na aplicação e navegar até a tela de avaliação
        Given Que esteja logado com um cpf com uma conta válida
            | cpf   | 000.000.000-00 |
            | senha | 00000          |
        When Quando acesso um benefício

    @APP-1046_01
    Scenario Outline: Logo de acordo com o benefício selecionado
        When Esteja logado com um usuario com benefício
        Then Seleciona um "beneficio"
        Then Deve ser exibida uma logo de acordo com o "beneficio" selecionado

        Examples:
            | beneficio |
            | GYMPASS   |
            | Diamond   |