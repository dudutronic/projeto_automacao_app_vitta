#Projeto: APP Vitta - The Coders
#Estória: APP-1019 (Processo de finalização de uma consulta de telemedicina)
#data criação: 01-04-2021
#Sprint: 1-Q2/2021
#automatizado

@APP-1019
Feature: processo_de_finalizacao_de_uma_consulta_de_telemedicina
    Background: Fazer Login na aplicação e navegar até a tela de avaliação
        Given Que esteja logado com um cpf com uma conta válida
            | cpf   | 000.000.000-00 |
            | senha | 00000          |
        When Eu inicio o teleatendimento
        And Finalizo o teleatendimento
        Then Deve ser exibida uma aréa para avaliação do médico.

    #fluxos de sucesso
    @APP-1019_01
    Scenario: Executar avaliação completa.
        Given Eu indico o número de estrelas "2" para experiência com o médico
        And Eu clico na opção avaliar.
        When Sou direcionado para avaliar a ferramenta
        And Eu indico o número de estrelas "2" para experiência com a ferramenta
        And Eu clico na opção avaliar.
        Then Ao finalizar a avaliação da ferramenta, deve apresentar o botão -voltar ao incio-.

    #fluxos de excessão
    @APP-1019_02
    Scenario: Pular avaliação do médico.
        Given Eu clico no botão -pular-.
        Then Sou direcionado para avaliar a ferramenta

    @APP-1019_03
    Scenario: Pular avaliação da ferramenta.
        Given Eu indico o número de estrelas "2" para experiência com o médico
        And Eu clico na opção avaliar.
        When Sou direcionado para avaliar a ferramenta
        And Eu clico no botão -pular-.
        Then Ao finalizar a avaliação da ferramenta, deve apresentar o botão -voltar ao incio-.

    @APP-1019_04
    Scenario: Medico não entrou na consulta
        Given Que o médico não entrou na consulta
        Then Não exibir a área de avaliação.
        And Exibir botão -voltar ao incio-.

    @APP-1019_05
    Scenario: Falha na conexão com o servidor primeira avaliação
        Given Eu indico o número de estrelas "2" para experiência com o médico
        When Eu clico na opção avaliar.
        Then Retorna a mensagem "Falha no servidor, por favor tente mais tarde"

    @APP-1019_06
    Scenario: Falha na conexão com o servidor segunda avaliação
        Given Eu indico o número de estrelas "2" para experiência com o médico
        And Eu clico na opção avaliar.
        When Sou direcionado para avaliar a ferramenta
        And Eu indico o número de estrelas "2" para experiência com a ferramenta
        And Eu clico na opção avaliar.
        Then Retorna a mensagem "Falha no servidor, por favor tente mais tarde"