#Projeto: APP Vitta - The Coders
#Estória: APP-1370 ([Melhoria] Limitar o valor e a data do procedimento na solicitação de reembolso)
#data criaçã: 09-06-2021
#Sprint: 7-Q2/2021
#Execução:

@APP-1370
Feature: melhoria_limitar_o_valor_e_a_data_do_procedimento_na_solicitação_de_reembolso

    Pensando em melhorar a experiência no fluxo de solicitação
    de reembolso, estamos propondo alguns tratamentos para as
    informações do procedimento inseridas pelo usuário.

    Background: Navegar até integração da central de reembolso
        Given Dado que esteja logado com um cpf "05061097041" e senha "Melhor3maior@"
        And Tenha acessado a integração disponivel em central de reembolso


    @APP-1370_1
    Scenario: Testar inserção de data para solicitar reembolso
        Given Que esteja preenchendo o formulário de reembolso
        When Inserir a data do procedimento
        Then Não deve aceitar uma data maior que a atual, Exbir mensagem "A data máxima aceita é até hoje"
        And Não aceitar uma data menor do que a data de 1 ano atrás, Exbir mensagem "A data mínima aceita é de até 365 dias atrás"
        But Se não informar a data, exibir mensagem "Campo obrigatório"


    @APP-1370_2
    Scenario Outline: Validar campo Valor do procedimento (Consulta médica)
        Given Que tenha passado pela tela de solicitação de reembolso
        When Selecionado o Tipo de procedimento "Consulta Médica"
        And inserir valor do procedimento "valor_procedimento"
        Then Deve aceitar valor monetário no intervalo de R$1,00 a R$99.999,00
        And  Se valor não informado, apresentar a mensagem de erro: "Campo obrigatório"
        And Se valor menor do que R$1,00, apresentar a mensagem "Informe um valor a partir de R$1,00"
        And Se valor maior do que R$99.999,00, apresentar a mensagem "Informe um valor até R$3.000,00"