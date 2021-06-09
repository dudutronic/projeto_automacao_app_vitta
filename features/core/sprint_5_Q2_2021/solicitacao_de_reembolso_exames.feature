#Projeto: APP Vitta - The Coders
#Estória: APP-1356 (Solicitação de Reembolso - Exames)
#data criaçã: 03-05-2021
#Sprint: 5-Q2/2021
#Execução:

@APP-1356
Feature: solicitacao_de_reembolso_exames.feature

  A maior parte das telas a serem desenvolvidas
  são similares a que já desenvolvemos em solicitação
  de consultas, dessa forma, podemos aproveitar os requisitos
  e comportamentos das telas desenvolvidas.


  Background: Navegar até integração da central de reembolso
    Given Dado que esteja logado com um "cpf" e "senha"
    And Tenha acessado a integração disponivel em central de reembolso


  @APP-1356_1
  Scenario: Exibir botão Exames na opção Selecionar procedimento
    Given Tenha acessado a central de reembolso
    When Selecionar solicitar reembolso
    Then Deve exibir a opção de seleção Selecionar o Tipo de procedimento "Exames"


  @APP-1356_2
  Scenario Outline: Campos 1 de 4 formulario Exames
    Given Que tenha passado pela tela de solicitação de reembolso
    When Selecionado o Tipo de procedimento "Exames"
    Then Exbir campos no formulario "campos_um_de_quatro"

    Examples:
      | campos_um_de_quatro         |
      | Paciente                    |
      | Data do procedimento        |
      | Valor total do procedimento |
      | Proximo                     |


  @APP-1356_3
  Scenario Outline: Validar campo Valor do procedimento
    Given Que tenha passado pela tela de solicitação de reembolso
    When Selecionado o Tipo de procedimento "Exames"
    And inserir valor do procedimento "valor_procedimento"
    Then Deve aceitar valor monetário no intervalo de R$1,00 a R$99.999,00
    And  Se valor não informado, apresentar a mensagem de erro: "Campo obrigatório"
    And Se valor menor do que R$1,00, apresentar a mensagem "Informe um valor a partir de R$1,00"
    And Se valor maior do que R$99.999,00, apresentar a mensagem "Informe um valor até R$99.999,00"


  @APP-1356_4
  Scenario: Campos 2 de 4 formulario Exames
    Given Que tenha passado pela tela de solicitação de reembolso
    When Selecionado o Tipo de procedimento "Exames"
    And Preencher pagina do formulário "paginas_anteriores" e clicar em Proximo
    Then Exibir check box "Nota Fiscal ou recibo (Obrigatório)"
    And Logo abaixo a opção para anexar recibo ou nota fiscal
    And Exbir "Dados Complementares" com a opção para anexar "outros documentos" e "pedidos médicos"
    And Se clicar no check-box exibir campo para inserir link do repositorio no lugar da opção do anexo para nota fiscal
    And Exibir botões "Anterior" e "Proximo"


  @APP-1356_5
  Scenario: Testar funcionalidade anexo
    Given Que tenha iniciado o procedimento do formulario de reembolso para "Exames"
    When Selecionado o anexar um aquivo
    Then Deve exibir as opções "Tirar foto", "Selecionar da galeria", "Selecionar um arquivo"


  @APP-1356_6
  Scenario Outline: Campos 3 de 4 formulario Exames
    Given Que tenha passado pela tela de solicitação de reembolso
    When Selecionado o Tipo de procedimento "Exames"
    And Preencher pagina do formulário "paginas_anteriores" e clicar em Proximo
    Then Exibir informativo: "Estas informações estão no Recibo ou nota fiscal"
    And Exbir campos no formulario "Dados do prestador" e informações "dados_prestador"
    And Exibir campo para pesquisa de "Endereço completo do prestador"
    And Exibir botões "Anterior" e "Proximo"

    Examples:
      | dados_prestador                  |
      | Nome do prestador de serviço     |
      | CPF/CNPJ do prestador de serviço |
      | Conselho                         |
      | Número de conselho               |
      | Endereço completo do prestador   |


  @APP-1356_7
  Scenario Outline: Campos 4 de 4 formulario Exames
    Given Que tenha passado pela tela de solicitação de reembolso
    When Selecionado o Tipo de procedimento "Exames"
    And Preencher pagina do formulário "paginas_anteriores" e clicar em Proximo
    Then Exbir campos no formulario "Favorecido bancario" "CPF do Favorecido Bancario"
    And Exibir os intens expecificos para lista de opções "tipo_de_conta"
    And Exibiur campo de seleção "banco", mostrar bancos disponiveis
    And Exibir campos "Agência sem DV", "Conta", "Dígito da conta"
    And Exibir botões "Anterior" e "Concluir"

    Examples:
      | tipo_de_conta      |
      | conta corrente     |
      | conta poupança     |
      | ordem de pagamento |


  @APP-1356_8
  Scenario: Concluir formulario de reembolso para exames
    Given Que tenha preenchido o formulário para reembolso
    When Clicar em concluir
    Then Emitir um protocolo para acompanhamento junto com uma finalização do pedido
    And Em Historico de solicitações deve constar as informações de acordo com o que foi preenchido