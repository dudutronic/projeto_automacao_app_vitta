#Estória: APP-842 (Processo de finalização de uma consulta de telemedicina)
#data criação: 31-03-2021
#Sprint: Regressivo
#automatizado/manual

@APP-842
Feature: sala_de_espera_telemed_tirar_etapa_de_aguarda_para_entrar_na_sala_de_telemed

    Background: Fazer Login na aplicação e navegar até a tela de atendimentos
        Given Que esteja logado com um cpf com uma conta válida
            | cpf   | 000.000.000-00 |
            | senha | 00000          |

    @APP-842_01
    Scenario: Habilitar botão de acessar a teleconsulta (Mesmo sem o médico em sala)
        Given Que em tela de atedimento
        When clico no botão de acesso a teleconsulta
        Then Deve permitir o acesso a sala de tele consulta mesmo sem o médico logado

    @APP-842_02
    Scenario: Receber notificação de que o médico entrou na consulta (mesmo que não em tela de consulta)
        Given Que em tela de atedimento
        When O médico iniciar a teleconsulta
        Then Deve notificar o acesso do médico a sala de teleconsulta