#Projeto: APP Vitta - The Coders
#Estória: APP-525 (Implementação de sala de espera)
#data criação: -05-2021
#Sprint: Regressão
#Tipo de teste: 

@APP-525
Feature: alterar_marcacao_de_presenca_para_botao_de_açao_da_tela_de_espera

Feature: processo_de_finalizacao_de_uma_consulta_de_telemedicina
    Background: Fazer Login na aplicação e navegar até a tela de avaliação
        Given Que esteja logado com um cpf com uma conta válida
            | cpf   | 000.000.000-00 |
            | senha | 00000          |
        When Eu inicio o teleatendimento