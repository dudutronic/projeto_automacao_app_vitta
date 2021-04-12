#Estória: APP-1020 (Como usuário e beneficiário da Seguros Unimed quero pedir um reembolso)
#data criaçã: 12-04-2021
#Sprint: 1-Q2/2021
#Execução: Manual/Automatizada

@APP-1020
Feature: como_usuario_e_beneficiario_da_seguros_unimed_quero_pedir_um_reembolso
  Background: Solicitação de troca de senha(Usuarios login cadastrado - Esqueceu a senha)
    Given Que ao abri a tela incial e clicar em -Acessar minha conta-
    And Que informo um "cpf" que possui uma conta válida
    And Clicar em -Continuar-

  @APP-1020_01
  Scenario Outline: Solicitar reebolso(fluxo completo com sucesso - seguro Unimed e seguro Unimed + outro seguro)
    Given Que esteja logado com um cpf com uma conta válida
      | cpf   | 000.000.000-00 |
      | senha | 00000          |
    And Clicar no icone -Central de Reembolso-
    And Que em tela de reembolso com um beneficiario do seguro Unimed
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
    Then Sou direcionado tela de finalização onde apresentará uma mensagem sobre o pedido
      | mensagem | pedido de reembolso efetuado com sucesso |

    Examples:
      | cpf | senha |
      |     |       |
      |     |       |

  #fluxo de exceção
  @APP-1020_02
  Scenario Outline: Efetuar login com CPF cadastrado (não possui seguro unimed ativo)
    Given Que esteja logado com um "cpf" com uma conta válida
      | senha | 00000 |
    When Solicitar o reembolso
    Then Deve exibir a "mensagem" referente a situação que não qualifica ao reembolso no momento

    Examples:
      | cpf | mensagem                                                                                   |
      |     | Para acessar a Central de Reembolsos você precisa ativar a integração com a Seguros Unimed |
      |     | Você não possue Seguros Unimed como beneficio do seu pacote                                |

  @APP-1026_03
  Scenario: Falha no servidor (Ao clicar em solicitar reembolso/ Clicar em proximo ao preencher dados do cadastro)
    Given Que esteja logado com um "cpf" com uma conta válida
    When Solicitar o reembolso
    And clicar em próximo ao preencher os formulários
    Then Deve exibir a "mensagem" referente a situação que não qualifica ao reembolso no momento

    Examples:
      | cpf | senha | mensagem                                 |
      |     |       | Não foi possivel completar a Solicitação |