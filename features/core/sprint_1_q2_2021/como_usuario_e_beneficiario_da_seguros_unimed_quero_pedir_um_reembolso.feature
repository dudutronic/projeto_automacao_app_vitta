        #Estória: APP-1020 (Como usuário e beneficiário da Seguros Unimed quero pedir um reembolso)
        #data criaçã:o 31-03-2021
        #Sprint: 8-Q1/202
        #Execução: Manual/Automatizada
        @APP-1020plicação antes do login
        Given Given Que ao abri a tela incial e clicar em -Acessar minha conta-

    Scenario: Solicitar reebolso com um usuario beneficiario

Feature: como_usuario_e_beneficiario_da_seguros_unimed_quero_pedir_um_reembolso
    Background: Tela inicial da  da seguros Unimed qualificado para reembolso
        @APP-1020_01
        Given Que esteja logado com um cpf com uma conta válida
            | cpf   | 000.000.000-00 |
            | senha | 00000          |
        And Entro na tela de -Central de Reembolso-
        And Ao clica em solicitar reebolso, é redirecionado para a tela -solicitar o reembolso-
        When Preencher a tela com os dados do paciente
            | select_paciente            |
            | select_paciente            |
            | select_especialidade       |
            | calendar_data_procedimento |
            | input_valor_procedimento   |
        And Redirecionado a tela de anexos de anexos e definir check-in de link ou adicionar anexos
            | check_in | sim |
        And Ao clicar em -próxima-, é redirecionado a tela de prestadores
        And Preencher dados do prestador de serviços
            | input_nome_prestador_serviço |
            | input_cpf_cnpj_prestador     |
            | select_conselhor             |
            | input_numero_conselho        |
            | input_cep_prestador          |
        And Ao clicar em -próxima-, é redirecionado a tela de -dados para o reembolso-
        And Preencher dados do beneficiario para reembolso
            | select_favorecido_bancario |
            | input_cpf_favorecido       |
            | select_tipo_pagamento      |
            | select_banco               |
            | input_agencia              |
            | select_conta               |
            | select_digito              |
        Then Sou direcionado tela de finalização onde apresentará uma mensagem sobre o pedido
            | mensagem | pedido de reembolso efetuado com sucesso |

    @APP-1026_02
    Scenario Outline: Efetuar login com CPF cadastrado
        Given Sou direcionado a tela de boas vindas
        When Inserir um "cpf" que -NÃO- possui uma conta
        Then Deve exibir uma "mensagem" de erro

        Examples:
            | cpf | mensagem                                     |
            |     | Seu CPF não foi encontrado em nossa base     |
            |     | Seu CPF já tem um cadastrado na Vitta        |
            |     | CPF iválido, por favor informe um CPF válido |

    @APP-1026_03
    Scenario: Falha no servidor
        Given Sou direcionado a tela de boas vindas
        When Inserir um "cpf"
        Then Retorna a mensagem "Falha no servidor, por favor tente mais tarde"