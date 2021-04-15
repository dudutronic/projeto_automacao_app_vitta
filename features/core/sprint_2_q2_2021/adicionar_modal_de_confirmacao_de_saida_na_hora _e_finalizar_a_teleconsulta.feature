#Projeto: APP Vitta - The Coders
#Estória: APP-1162 (Adicionar modal de confirmação de saída na hora de finalizar a teleconsulta)
#data criação: 15-04-2021
#Sprint: Q2/2021
#automatizado

@APP-1162
Feature: adicionar_modal_de_confirmacao_de_saida_na_hora _e_finalizar_a_teleconsulta

    Background: Fazer Login na aplicação e navegar até a tela de atendimentos
        Given Que esteja logado com um cpf com uma conta válida
            | cpf   | 05061097041   |
            | senha | Melhor3maior@ |
        And Navegar e iniciar a teleconsulta


    @APP-1162_01
    Scenario Outline: Criar modal de finalização de teleconsulta (Botão Sair/Voltar)
        Given Que o usuario clicar no botão de sair "ou" voltar na teleconsulta
        Then Deve mostrar um modal com a mensagem "Tem certeza que deseja sair da consulta?"

        Examples:
            | ou     |
            | sair   |
            | voltar |


    @APP-1162_02
    Scenario Outline: Confirmar o botão modal sair (botão Ok)
        Given Que o usuario clicar no botão de voltar na teleconsulta
        And Que mostrar um modal com a mensagem "Tem certeza que deseja sair da consulta?"
        When O usuario clicar em OK do modal
        Then A teleconsulta é finalizada, redirecionando para a tela inicial do APP Vitta

    @APP-1162_03
    Scenario: Não confirmar o botão modal sair (botão Cancelar)
        Given Que o usuario clicar no botão de voltar na teleconsulta
        And Que mostrar um modal com a mensagem "Tem certeza que deseja sair da consulta?"
        When O usuario clicar em Cancelar do modal
        Then O modal some, continuando a teleconsulta

