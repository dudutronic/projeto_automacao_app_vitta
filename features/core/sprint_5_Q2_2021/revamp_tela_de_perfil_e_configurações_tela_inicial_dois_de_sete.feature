#Projeto: APP Vitta - The Coders
#Estória: APP-1207 (Revamp tela de perfil e configurações - Tela inicial 2 de 7)
#data criação: 28-05-2021
#Sprint: 5-Q2/2021
#Tipo de teste:

@APP-1207
Feature: revamp_tela_de_perfil_e_configurações_tela_inicial_dois_de_sete
    Os dados pessoais são informações que a equipe de saúde necessita para
    o melhor acompanhamento do paciente. Estamos trazendo essas perguntas
    para o usuário para antecipar o questionamento por parte da nossa
    equipe e levar uma melhor experiência para o usuário.


    Background: Fluxo completo de login
        Given Que esteja logado com um cpf "85216822046"
        And Uma senha "Melhor3maior@" de uma conta válida
        And Acesse tela Perfil e configurações


    @APP-1207_1
    Scenario: Criar banner de completude dos dados pessoais do usuário
        Given Qua apresenta o banner na Tela para completar os dados pessoais
        Then O banner deve ter a ação de ciclk para exibir os dados pessoais
        And A barra de progresso deve iniciar com 0% e a mensagem "preencha agora"
        And A barra de progresso deve ser alterada de acordo com % de campos preenchidos


    @APP-1207_2
    Scenario: Não cadastrar contato de emergencia
        Given Que esteja completando o cadastro
        When Usuario decide cadastrar ou não cadastrar um contato de emergencia
        Then Não deve ser refletido como paramento do progresso de nenhum dos locais referentes a dados pessoais


    @APP-1207_3
    Scenario: Retirada do banner da tela de perfil e configuração
        Given Qua apresenta o banner na Tela para completar os dados pessoais
        When completar o dados faltantes 100%
        Then Deve apresentar o icone X para fechar o banner e ele não ser mais apresentado
        But O usuario não clicar no X do banner, deve desaparecer em 24hs


    @APP-1207_4
    Scenario Outline: Visualização da screen de dados pessoais (Mensagens iniciais)
        Given Que tenha acessado a screen de dados pessoais
        Then Deve conter os disclamer com "titulo"
        And A mensagem no "corpo" sobre a importancia dos dados

        Examples:
            | titulo                                                 | corpo                                                                                                                                                                             |
            | É muito importante que seus dados estejam atualizados! | Eles são 100% confidenciais e são necessários para fazermos solicitações de exames, agendamentos de consultas, entre outras questões de saúde que possam ser solicitadas por você |


    @APP-1207_5
    Scenario Outline: Visualização da screen de dados pessoais (Campos do formulario 1 de 3)
        Given Que tenha acessado a screen de dados pessoais
        Then Deve exibir formulario com a completude e a descrição passos 1 de 3
        And Exibir os formularios para "dados_basicos"
        And O botão próximo que ao clicar salvara o status os dados da tela atual

        Examples:
            | dados_basicos                        |
            | Seu nome completo                    |
            | Seu celular                          |
            | Checkbox Esse número possue Whatsapp |


    @APP-1207_6
    Scenario Outline: Visualização da screen de dados pessoais (Campos do formulario 2 de 3)
        Given Que tenha acessado a screen de dados pessoais
        When Preencher a tela do formulario 1 de 3
        And Clicar em próximo
        Then Deve exibir formulario com a completude e a descrição passos 2 de 3
        And Exibir os formularios para "endereco_residencial"
        And O botão próximo que ao clicar salvara o status os dados da tela atual
        And O botão anterior que dará a opção de voltar a Tela
        #Será habilitado o campo voltar caso seja a continuação de um formulário previamente preenchido? Se for será possivel voltar e modificar o formulário?

        Examples:
            | endereco_residencial |
            | CEP                  |
            | Logradouro           |
            | Número               |
            | Complemento          |
            | Bairro               |
            | Cidade               |
            | Estado               |


    @APP-1207_7
    Scenario: tela endereço, regras do Formulário 2 de 3
        Given Que tenha acessado a screen de dados pessoais
        When Preencher parte do formulário e inserir o "cep"
        Then Retomar o os campos Logradouro, Bairro, Cidade e estados automaticamente
        And Os Os checkbox quando clicados, deverão ser marcados com a cor azul


    @APP-1207_8
    Scenario Outline: Visualização da screen de dados pessoais (Campos do formulario 3 de 3)
        Given Que tenha acessado a screen de dados pessoais
        When Preencher a tela do formulario 3 de 3
        And Clicar em próximo
        Then Deve exibir formulario com a completude e a descrição passos 3 de 3
        And Exibir os formularios para "contato_de_emergencia" e o "tipo" do contato
        And Exibir informação do "contao"
        And O botão próximo que ao clicar salvara o status os dados da tela atual
        And O botão anterior que dará a opção de voltar a Tela

        Examples:
            | contato_de_emergencia             | tipo     | contato  |
            | Checkbox de "Não desejo cadastrar | Conjuge  | nome     |
            |                                   | Pais     | telefone |
            |                                   | Avô(ó)   |          |
            |                                   | Filho(a) |          |
            |                                   | Amigo(a) |          |
            |                                   | Irmão(ã) |          |


    @APP-1207_9
    Scenario: tela contatos de emergencia, regras do Formulário 3 de 3
        Given Que tenha acessado a screen de dados pessoais
        And preencer formulário até a tela 3 de 3
        When Quando o usuario ativar "Não desejo cadastrar" contatos de emergencia
        Then Desativer campos de preenchimento e a tela serád dada como completa para clicar em próximo
        But Caso o botão "Não desejo cadastrar" contatos de emergencia não esteja ativo, deve seguir o preenchimento normalmente

    @APP-1207_10
    Scenario: Botão voltar dentro do formulário de dados pessoais (Quando  preenchido do incio)
        Given Que tenha acessado a screen de dados pessoais
        When Preencher parte do formulário e sair ou interromper o aplicativo após ter clicado em próximimo
        Then Ao retomar o preenchimento do formulário Deve continuar de onde parou
        But se for uma tela que apresente o botão anterior, será possivel voltar e editar a tela


    @APP-1207_11
    Scenario: Erro ao não preencher o informar um dos dados do formulário (Dados obrigatórios)
        Given Que tenha acessado a screen de dados pessoais
        When Preencher dados do formulario
        And Clicar em Próximo
        Then Quando campos obrigatorios preenchido de forma incorreta ou vazio não deve permitir ir a próxima tela
        And Não Deve Salvar dados
        And Deve apresentar mesagem "“por favor, preencha as informações destacadas" destacados em vermelho