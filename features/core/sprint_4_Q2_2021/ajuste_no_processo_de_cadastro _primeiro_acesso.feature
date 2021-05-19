#Projeto: APP Vitta - The Coders
#Estória: APP-1222 (Ajuste no processo de Cadastro - Primeiro Acesso)
#data criação: -05-2021
#Sprint: 3-Q2/2021
#Tipo de teste:

@APP-1222
Feature: ajuste_no_processo_de_cadastro _primeiro_acesso

    Motivation (Start with why)
    Passamos a receber todos os e-mail da vida da base única para o APP,
    dessa forma, a validação do e-mail do usuário ficaria mais fácil se
    o mesmo nos informasse o e-mail correto, assim, haveria a possibilidade
    de comparar com os e-mails da nossa base e retornaria com o fluxo com
    sucesso ou falha.

    Scenario Outline: Primeiro acesso com um cpf pré-cadastrado (e-mail correto)
        Given Que insira um "cpf" válido pré cadastrado
        And clicar em continuar
        Then Nova tela deve conter o e-mail pré-cadastrado com partes ocultas
        And Campo para inserção de código de segurança

        Examples:
            | cpf         |
            | 05061097041 |


    Scenario Outline: Primeiro acesso com um cpf pré-cadastrado (e-mail incorreto/troca de e-mail)
        Given Que insira um "cpf" válido pré cadastrado
        And clicar em continuar
        Then Nova tela deve conter o e-mail pré-cadastrado com partes ocultas
        And Campo para inserção de código de segurança

        Examples:
            | cpf         |
            | 05061097041 |