#Projeto: APP Vitta - The Coders
#Estória: APP-1084 (Ampliar o tempo de duração da consulta na agenda de registro do App)
#data criação: 08-04-2021
#Sprint: 1-Q2/2021
#Manual

@APP-1046
Feature: ampliar_o_tempo_de_duracao_da_consulta_na_agenda_de_registro_do_app
    Background: Fazer Login na aplicação e navegar até a tela de avaliação
        Given Que esteja logado com um cpf com uma conta válida
            | cpf   | 000.000.000-00 |
            | senha | 00000          |

    #Fluxos de sucesso
    @APP-1046_01
    Scenario: Aceitar permições ao Adicionar consulta ao calendário com sucesso
        Given Que tenha acessado o menu agendamento
        And Esteja na aba de próximos
        When Clicar no icone da agenda de uma consuta ativa
        Then Deve Solicitar a permissão para abrir agenda
        And Ao aceitar liberar para ir para agenda

    @APP-1046_02
    Scenario: Exibir bottom-sheet com as contas que podem ser adicionados os calendarios
        Given Que tenha acessado o menu agendamento
        And Esteja na aba de próximos
        When Clicar no icone da agenda de uma consuta ativa
        Then Deve ser abrir um pop up com bottom-sheet exibindo as contas da agenda-calendário do aparelho

    @APP-1046_03
    Scenario: Adicionar consulta ao calendário com sucesso
        Given Que tenha acessado o menu agendamento
        And Esteja na aba de próximos
        When Clicar no icone da agenda de uma consuta ativa
        And Escolher a conta para adicionar a agenda-calendarios
        Then Deve ser exibir a "mensagem" informando que a consulta foi adicionada ao caledário
        And Ao consultar calendário, o deve está marcado na agenda

    @APP-1046_04
    Scenario: Verificar duração da consulta adicionada ao calendário
        Given Que tenha acessado o menu agendamento
        And Esteja na aba de próximos
        When Clicar no icone da agenda de uma consuta ativa
        And Escolher a conta para adicionar a agenda-calendarios
        Then Deve ser exibir a "mensagem" informando que a consulta foi adicionada ao caledário
        And Ao consultar calendário, o deve está marcado na agenda com a consulta marcando meia hora de limite

    #Fluxos de exceção

    @APP-1046_05
    Scenario: Não Aceitar permições ao Adicionar consulta ao calendário com sucesso
        Given Que tenha acessado o menu agendamento
        And Esteja na aba de próximos
        When Clicar no icone da agenda de uma consuta ativa
        Then Deve Solicitar a permissão para abrir agenda
        And Ao NÃO aceitar, NÃO liberar para ir para agenda

    @APP-1046_06
    Scenario: Falha na comunicação com o servidor
        Given Que tenha acessado o menu agendamento
        And Esteja na aba de próximos
        When Clicar no icone da agenda de uma consuta ativa
        And Ao acontecer uma falha na comunicação com o servidor
        Then O sistema deve retornar a mensagem "Não foi possivel completar a Solicitação"

    @APP-1046_07
    Scenario: Não possui e-mail vinculado ao aparelho
        Given Que tenha acessado o menu agendamento
        And Esteja na aba de próximos
        And Não possua contas de e-mail vinculadas no aparelho
        When Clicar no icone da agenda de uma consulta ativa
        Then Deve ser possivel selecionar agenda nativa ou opção para adicionar uma conta para o vinculo da agenda

    @APP-1046_08
    Scenario: Não agendar quando agenda desabilitada e internet desligada/falha na comunicão
        Given Que tenha acessado o menu agendamento
        And Esteja na aba de próximos
        And Agenda nativa do aparelho desabilitada
        And Internet desabilitada
        When Clicar no icone da agenda de uma consuta ativa
        Then O sistema não deve informar que o agendamento foi efetuado