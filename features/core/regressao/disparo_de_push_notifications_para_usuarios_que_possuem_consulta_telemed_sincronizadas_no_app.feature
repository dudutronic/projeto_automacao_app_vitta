#Projeto: APP Vitta - The Coders
#Estória: APP-925 (Disparo de push notifications para usuários que possuem consulta de telemed sincronizada no App)
#data criação: 17-05-2021
#Sprint: Regressivo
#Tipo de teste: manual

@APP-925
Feature: disparo_de_push_notifications_para_usuarios_que_possuem_consulta_telemed_sincronizadas_no_app

    Background: Fazer Login na aplicação
        Given Que esteja logado com um cpf com uma conta válida
            | cpf   | 000.000.000-00 |
            | senha | 00000          |

    @APP-955_1
    Scenario: Receber Push notification quando tenho uma tele consulta, 5 minutos antes
        Given que tenha uma consulta telemed agendada
        Then Com 5 minutos antes, devo receber uma push notification
        And Ao clicar, redirecionar para a tela de espera
        And Em seguida, tela de consulta

    @APP-925_2
    Scenario: Receber Push notification (Sen aceitar ter aceito os termos)
        Given que tenha uma consulta telemed agendada
        When Com 5 minutos antes, devo receber uma push notification
        Then Deve redirecionar para a tela de aceite de termos
        And Ao aceitar, ir para a tela de espera
        And Em seguida, tela de consulta

    @APP-1033_2
    Scenario: Receber Push notification quando tenho uma tele consulta, durante 3 dias antes
        Given que tenha uma consulta telemed agendada
        Then Com 72 horas prévias, devo receber uma push notification