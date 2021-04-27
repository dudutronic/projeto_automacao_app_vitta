    #Projeto: APP Vitta - The Coders
    #Estória: APP-1021 ([The Coders: Reembolso] Solicitar prévia.)
    #data criaçã: 26-04-2021
    #Sprint: 2-Q2/2021
    #Execução: Manual/Automatizada


    @APP-1021_01
    Scenario: Efetuar login com CPF elegivél a central de reembolso (Criação de botões na tela inicial do central de reembolso)
        Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
        And Insere uma senha "senha" válida
        And acessar a central de reembolso e selecionar o beneficio
        Then Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso
        And Na tela de central de reembolso devem constar os botões "Solicitar reembolso", "Solicitar prévia" e "Histórico de solicitações"

    @APP-1021_02
    Scenario Outline:: Solicitar prévia: Criar opções de prévia
        Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
        And Insere uma senha "senha" válida
        And acessar a central de reembolso e selecionar o beneficio
        And Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso
        When Na tela de central de reembolso acessar "Solicitar prévia"
        Then Deve poder visualizar o campor Escolha uma opção com botões de "previas" disponiveis

        Examples:
            | previas                        |
            | Prévia de consulta médica      |
            | Prévia de outros procedimentos |


    @APP-1021_03
    Scenario Outline:: Solicitar prévia: Criar opções de prévia
        Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
        And Insere uma senha "senha" válida
        And acessar a central de reembolso e selecionar o beneficio
        And Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso
        When Na tela de central de reembolso acessar "Solicitar prévia"
        And Clicar em Prévia de consulta médica
        Then Deve apresentar os "campos" referente a essa tela

        Examples:
            | campos               |
            | tipo de previa       |
            | Paciente             |
            | data do procedimento |

    @APP-1021_04
    Scenario Outline:: Solicitar prévia: Previa de outros produtos
        Given Que o usuario informa um "cpf" de uma conta válida escolhendo logar por ele
        And Insere uma senha "senha" válida
        And acessar a central de reembolso e selecionar o beneficio
        And Deve deve ser possivel inserir o "cpf" e "senha" para vincular a integração para continuar a solicitação de reembolso
        When Na tela de central de reembolso acessar "Solicitar prévia"
        And Clicar em Prévia de Outros produtos
        Then Deve apresentar a "mensagem" referente a essa tela
        And Clicar em OK, a mensagem deve desaparecer
        And O usuario é redirecionado a tela de reembolso

        Examples:
            | cpf         | senha        | mensagem                                                                                                                        |
            | 05061097041 | Melhor3maior | Desculpe, ainda estamos trabalhando nessa funcionalidade! Caso tenha alguma dúvida, entre em contato com nossa equipe de saúde. |
