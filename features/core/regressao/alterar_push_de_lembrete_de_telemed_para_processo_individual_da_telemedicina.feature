#Projeto: APP Vitta - The Coders
#Estória: APP-1033 (Alterar push de lembrete de telemed para processo individual da telemedicina)
#data criação: 17-05-2021
#Sprint: Regressivo
#Tipo de teste: manual

@APP-1033
Feature: alterar_push_de_lembrete_de_telemed_para_processo_individual_da_telemedicina

    Background: Fazer Login na aplicação
        Given Que esteja logado com um cpf com uma conta válida
            | cpf   | 000.000.000-00 |
            | senha | 00000          |

    @APP-1033_1
    Scenario: Receber Push notification quando tenho uma tele consulta, 5 minutos antes
        Given que tenha uma consulta telemed agendada
        Then Com 5 minutos antes, devo receber uma push notification
        And Ao clicar, redirecionar para a tela de espera
        And Em seguida, tela de consulta

    @APP-1033_2
    Scenario: Receber Push notification (Sen aceitar ter aceito os termos)
        Given que tenha uma consulta telemed agendada
        When Com 5 minutos antes, devo receber uma push notification
        Then Deve redirecionar para a tela de aceite de termos
        And Ao aceitar, ir para a tela de espera
        And Em seguida, tela de consulta