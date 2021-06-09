#Projeto: APP Vitta - The Coders
#Estória: APP-1307 ([Melhoria] Buscar automaticamente o endereço do prestador ao informar o CEP na solicitação de reembolso)
#data criaçã: 09-06-2021
#Sprint: 7-Q2/2021
#Execução:

@APP-1307
Feature: melhoria_buscar_automaticamente_o_endereco_do_prestador_ao_informar_o_cep_na_solicitação_de_reembolso

    Buscar automaticamente o endereço do prestador baseado
    na informação fornecida no campo de CEP na tela de
    solicitação de reembolso.

    Background: Navegar até integração da central de reembolso
        Given Dado que esteja logado com um cpf "05061097041" e senha "Melhor3maior@"
        And Tenha acessado a integração disponivel em central de reembolso

@APP-1307_1
    Scenario: Testar retorno do endereço no formulário de reembolso de forma automatica
        Given Que o usuario esteja preenchendo o formulario de reembolso
        When Inserir o "cep" para buscar endereço -Completo ou incompleto-
        Then A busca deve ser feita automaticamente
        And O iten de busca com icone da lupa deve ser removida
        But Inserir CEP zerado, não deve ser possivél proceguir com o formulário
        And Apresentar mensagem de erro

        Examples:
            | cep      |
            | 52291690 |
            | 52291    |
            |          |