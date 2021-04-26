#Projeto: APP Vitta - The Coders
#Estória: APP-1020 ([The Coders: Reembolso] Solicitar reembolso.)
#data criaçã: 19-04-2021
#Sprint: 2-Q2/2021
#Execução: Manual/Automatizada

@APP-1020
Feature: reembolso_solicitar_reembolso

  @APP-1020_01
  Scenario Outline: Efetuar login com CPF cadastrado (Solicitar integração com o seguro unimed pela primeira vez)
    Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
    And Insere uma senha "senha" válida
    When acessar a central de reembolso
    And solicitar o reembolso sem a integração com o seguro unimed ativa
    Then Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso

    Examples:
      | cpf         | senha         | mensagem                                                                                   |
      | 05061097041 | Melhor3maior@ | Para acessar a Central de Reembolsos você precisa ativar a integração com a Seguros Unimed |


  @APP-1020_02
  Scenario Outline: Solicitar reebolso(fluxo completo com sucesso - seguro Unimed com integração já ativa)
    Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
    And Insere uma senha "senha" válida
    And Acessar a centrar de reembolso e fazer a integração com o seguro unimed inserindo as credenciais "cpf" e "senha"
    When Preencher a tela com os dados do paciente
      | select_paciente            |  |
      | select_paciente            |  |
      | select_especialidade       |  |
      | calendar_data_procedimento |  |
      | input_valor_procedimento   |  |
    And Redirecionado a tela de anexos de anexos e definir check-in de link ou adicionar anexos
      | check_in | sim |
    And Ao clicar em -próxima-, é redirecionado a tela de prestadores
    And Preencher dados do prestador de serviços
      | input_nome_prestador_serviço |  |
      | input_cpf_cnpj_prestador     |  |
      | select_conselhor             |  |
      | input_numero_conselho        |  |
      | input_cep_prestador          |  |
    And Ao clicar em -próxima-, é redirecionado a tela de -dados para o reembolso-
    And Preencher dados do beneficiario para reembolso
      | select_favorecido_bancario |  |
      | input_cpf_favorecido       |  |
      | select_tipo_pagamento      |  |
      | select_banco               |  |
      | input_agencia              |  |
      | select_conta               |  |
      | select_digito              |  |
    Then Sou direcionado tela de finalização onde apresentará uma "mensagem"sobre o pedido


    Examples:
      | cpf         | senha         | mensagem                                 |
      | 05061097041 | Melhor3maior@ | pedido de reembolso efetuado com sucesso |



  #fluxo de exceção
  @APP-1026_03
  Scenario: Falha no servidor (Ao clicar em solicitar reembolso/ Clicar em proximo ao preencher dados do cadastro)
    Given Que esteja logado com um "cpf" e uma "senha" de uma conta válida
    When Solicitar o reembolso
    And clicar em próximo ao preencher os formulários
    Then Deve exibir a "mensagem" referente a situação que não qualifica ao reembolso no momento

    Examples:
      | cpf         | senha         | mensagem                                 |
      | 05061097041 | Melhor3maior@ | Não foi possivel completar a Solicitação |

  @APP-1026_04
  Scenario Outline: Solicitar reembolso(fluxo completo - Tenta continuar com formulario faltando informações)
    Given Que esteja logado com um "cpf" e uma "senha" de uma conta válida
    And Clicar no icone -Central de Reembolso-
    And Que em tela de reembolso com um beneficiario do seguro Unimed
    When clicar em próximo ao preencher os formulários
    Then Quando clicar continuar faltando informação do formulario ou informações incorretas, retornar "mensagem" de erro

    Examples:
      | cpf | senha | mensagem                                 |
      |     |       | Não foi possivel completar a Solicitação |
      |     |       | Campo Obrigatorio                        |
      |     |       | Dados inválidos                          |

  @APP-1026_05
  Scenario Outline: Solicitar reembolso(Possui mais que o seguro unimed)
    Given Que esteja logado com um "cpf" e uma "senha" de uma conta válida
    And Clicar no icone -Central de Reembolso-
    And Que em tela de reembolso com um beneficiario do seguro Unimed e outro beneficio
    When clicar em próximo ao preencher os formulários
    Then Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso

    Examples:
      | cpf | senha | mensagem                                                    |
      |     |       | Você não possue Seguros Unimed como beneficio do seu pacote |

  @APP-1020_06
  Scenario Outline: desconectar da integração do seguro unimed (Só deve ser possivél solicitar reembolso com a integração conectada)
    Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
    And Insere uma senha "senha" válida
    When Acessa a central de reembolso e faz a integração com "cpf" e "senha" válidos
    And Desloga da integração atual
    Then A aplicação não deve permitir a solicitação de reembolso
    But Deve permitir conectar novamente com a integração para solicitar o reembolso


    Examples:
      | cpf         | senha         | mensagem                                                                                   |
      | 05061097041 | Melhor3maior@ | Para acessar a Central de Reembolsos você precisa ativar a integração com a Seguros Unimed |

  @APP-1020_07
  Scenario Outline: Integração com um seguro diferente do unimed (No momento só deve ser possivél solicitar reembolso com a integração Unimed)
    Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
    And Insere uma senha "senha" válida
    When Acessa a central de reembolso e faz a integração com "cpf" e "senha" válidos que não sejam Unimed
    Then A aplicação não deve permitir a solicitação de reembolso
    But Deve permitir conectar novamente com a integração para solicitar o reembolso


    Examples:
      | cpf         | senha         | mensagem                                                                                   |
      | 76586007097 | Melhor3maior@ | Para acessar a Central de Reembolsos você precisa ativar a integração com a Seguros Unimed |