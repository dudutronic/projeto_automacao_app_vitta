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

    Scenario: Receber Push notification quando tenho uma tele consulta, durante 3 dias antes
        Given que tenha uma consulta telemed agendada
        Then Com 72 horas prévias, devo receber uma push notification
