#Projeto: APP Vitta - The Coders
#Estória: APP-1357 (Solicitação de Reembolso - Cirurgias)
#data criaçã: 14-06-2021
#Sprint: 6-Q2/2021
#Execução:

@APP-1357
Feature: solicitacao_de_reembolso_cirurgias.feature

    A maior parte das telas a serem desenvolvidas
    são similares a que já desenvolvemos em solicitação
    de consultas, dessa forma, podemos aproveitar os requisitos
    e comportamentos das telas desenvolvidas.


    Background: Navegar até integração da central de reembolso
        Given Dado que esteja logado com um cpf "05061097041" e senha "Melhor3maior@"
        And Tenha acessado a integração disponivel em central de reembolso


    @APP-1357_1
    Scenario: Exibir botão Exames na opção Selecionar procedimento
        Given Tenha acessado a central de reembolso
        When Selecionar solicitar reembolso
        Then Deve exibir a opção de seleção Selecionar o Tipo de procedimento "Cirurgias"


    @APP-1357_2
    Scenario Outline: Campos 1 de 4 formulario Cirurgias
        Given Que tenha passado pela tela de solicitação de reembolso
        When Selecionado o Tipo de procedimento "Cirurgias"
        Then Exbir campos no formulario "campos_um_de_quatro"

        Examples:
            | campos_um_de_quatro         |
            | Paciente                    |
            | Data do procedimento        |
            | Valor total do procedimento |
            | Proximo                     |


    @APP-1357_3
    Scenario Outline: Validar campo Valor do procedimento
        Given Que tenha passado pela tela de solicitação de reembolso
        When Selecionado o Tipo de procedimento "Cirurgias"
        And inserir valor do procedimento "valor_procedimento"
        Then Deve aceitar valor monetário no intervalo de R$1,00 a R$99.999,00
        And  Se valor não informado, apresentar a mensagem de erro: "Campo obrigatório"
        And Se valor menor do que R$1,00, apresentar a mensagem "Informe um valor a partir de R$1,00"
        And Se valor maior do que R$99.999,00, apresentar a mensagem "Informe um valor até R$99.999,00"


    @APP-1357_4
    Scenario: Campos 2 de 4 formulario Cirurgias(Disclamer)
        Given Que tenha passado pela tela de solicitação de reembolso
        When Selecionado o Tipo de procedimento "Cirurgias"
        And Preencher pagina do formulário "paginas_anteriores" e clicar em Proximo
        Then Na pagina 2 de 4 deve exibir disclamer com a "mensagem"

        Examples:
            | mensagem                                                                                                                                  |
            | Os documentos originais devem ser guardados por, pelo menos, 5 anos após a data de emissão.                                               |
            | Recibo ou nota fiscal são documentos obrigatórios, porém, para uma análise mais efetiva de seu reembolso, anexe também outros documentos. |
            | Cada arquivo anexado abaixo poderá ser uma imagem ou pdf e deve ter tamanho máximo de 25 MB.                                              |


    @APP-1357_5
    Scenario: Campos 2 de 4 formulario Cirurgias
        Given Que tenha passado pela tela de solicitação de reembolso
        When Selecionado o Tipo de procedimento "Cirurgias"
        And Preencher pagina do formulário "paginas_anteriores" e clicar em Proximo
        Then Exibir check box "Nota Fiscal ou recibo (Obrigatório)"
        And Logo abaixo a opção para anexar recibo ou nota fiscal
        And Exbir "Dados Complementares" com a opção para anexar "outros documentos", "Anexar pedido médico", "anexar prévia" e "Anexar resultado de exame"
        And Se clicar no check-box exibir campo para inserir link do repositorio no lugar da opção do anexo para nota fiscal
        And Exibir botões "Anterior" e "Proximo"


    @APP-1357_6
    Scenario: Testar funcionalidade anexo
        Given Que tenha iniciado o procedimento do formulario de reembolso para "Cirurgias"
        When Selecionado o anexar um aquivo
        Then Deve exibir as opções "Tirar foto", "Selecionar da galeria", "Selecionar um arquivo"


    @APP-1357_7
    Scenario Outline: Campos 3 de 4 formulario Cirurgias
        Given Que tenha passado pela tela de solicitação de reembolso
        When Selecionado o Tipo de procedimento "Cirurgias"
        And Preencher pagina do formulário "paginas_anteriores" e clicar em Proximo
        Then Exibir informativo: "Estas informações estão no Recibo ou nota fiscal"
        And Exbir campos no formulario "Dados do prestador" e informações "dados_prestador"
        And Exibir campo para pesquisa de "Endereço completo do prestador"
        And Exibir botões "Anterior" e "Proximo"

        Examples:
            | dados_prestador                  |
            | Nome do prestador de serviço     |
            | CPF/CNPJ do prestador de serviço |
            | Conselho   / Lista               |
            | Número de conselho               |
            | Endereço completo do prestador   |


    @APP-1357_8
    Scenario Outline: Campos 4 de 4 formulario Cirurgias
        Given Que tenha passado pela tela de solicitação de reembolso
        When Selecionado o Tipo de procedimento "Cirurgias"
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


    @APP-1357_9
    Scenario: Concluir formulario de reembolso para Cirurgias
        Given Que tenha preenchido o formulário para reembolso
        When Clicar em concluir
        Then Emitir um protocolo para acompanhamento junto com uma finalização do pedido
        And Em Historico de solicitações deve constar as informações de acordo com o que foi preenchido