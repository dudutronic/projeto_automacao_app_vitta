#Projeto: APP Vitta - The Coders
#Estória: APP-1159 (Revamp tela de perfil e configurações - Tela inicial 1 de 7)
#data criação: 27-05-2021
#Sprint: 5-Q2/2021
#Tipo de teste: Manual

@APP-1159
Feature: revamp_tela_de_perfil_e_configurações_tela_inicial_um_de_sete

    Devido o crescimento do número de vidas que usam o APP,
    queremos que esses usuários possam ter mais autonomia
    para gerenciar os seus dados e também mais controle
    para personalizar as preferências de uso do APP.
    Por isso, estamos propondo evoluir a tela de Perfil
    e Configurações e assim, oferecer a melhor experiência possível.

    Background: Fluxo completo de login
        Given Que esteja logado com um cpf "85216822046"
        And Uma senha "Melhor3maior@" de uma conta válida

    @APP-1159_1
    Scenario: Atualizar foto do perfil (Criação de escolha de troca de foto)
        Given Acesse tela Perfil e configurações
        When Clicar no icone da câmera
        Then Deve aparecer o pop up "Editar foto do Perfil"
        And Deve constar as opções "Tirar uma foto agora" e "Escolha uma foto na galeria"

    @APP-1159_2
    Scenario: Atualizar foto do perfil (Alterar por meio de uma nova foto da camera)
        Given Acesse tela Perfil e configurações
        When Clicar no icone da câmera
        And Clicar na opção "Tirar foto agora" dentro do pop up "Editar foto do Perfil"
        Then deve abrir o aplicativo nativo camera
        And Deve ser possível tirar a foto e apresenta-la para inserção
        And Ao salvar, deve ficar como nova imagem de perfil

    @APP-1159_3
    Scenario: Atualizar foto do perfil (Alterar foto a partir das fotos locais do dispositivo)
        Given Acesse tela Perfil e configurações
        When Clicar no icone da câmera
        And Clicar na opção "Tirar foto agora" dentro do pop up "Editar foto do Perfil"
        Then deve abrir o a escolha de um repositorio de fotos do device
        And Deve ser possível selecionar uma imagem e apresenta-la para inserção
        And Ao salvar, deve ficar como nova imagem de perfil

    @APP-1159_4
    Scenario: Exibir novos campos na tela de Perfil
        Given Acesse tela Perfil e configurações
        Then Exibir o campo com "Nome completo do usuario" e "e-mail do usuario"

    @APP-1159_5
    Scenario: Exibir banner de completude dos dados pessoais do usuário
        Given Acesse tela Perfil e configurações
        Then Possuir banner com o titulo "Dados pessoais" for disponibilizado
        And Ao abrir banner deve conter os campos descrição
        And Barra com a completude dos dados preenchidos -Exibir de acordo com o preenchimento do formuladrio x%-
        And Banner deve conter a ação clicavel
        And Ter a o icone de fechamento do banner "X"

    @APP-1159_6
    Scenario: Interação do link do banner com o formulário de perfil
        Given Acesse tela Perfil e configurações
        When Clicar no banner "Dados pessoais"
        Then  Deve conter o link "Preencha agora" e "Complete agora"
        And Ao clicar em um deles devem redirecionar para o formulario para completude do perfil

    @APP-1159_7
    Scenario: Modificação da completude da barrar de porcentagem de Dados pessoais
        Given Acesse tela Perfil e configurações
        When Acessar banner ou na funcionalidade "Dados pessoais" -quando não estiver completo-
        And For redirecionado para o fomulário de preenchimento do perfil
        Then A medida que o formulário for preenchido a porcetagem X% apresentada deve ser modificada conforme a completude
        And Ao finalizar deve aparecer a mensagem "Parabéns! Seu perfil está completo"
        But Se sair do formulário antes de completude, na tela de perfil deve conter a porcentagem de acordo com o que foi preenchido
        And Deve continuar exibindo o banner para completar os dados

    @APP-1159_8
    Scenario Outline: Exibir novos submenus na tela de Perfil
        Given Acesse tela Perfil e configurações
        Then Exibir os "menus" com seus "submenus" criados
        And Manter os campos "versão do APP" e "FAZER LOGOUT"

        Examples:
            | menus          | submenus                              |
            | Dados pessoais | Complete seu cadastro com a Vitta     |
            | Dados de Login | Edite como você acessa o aplicativo   |
            | Endereços      | Insira e edite seus dados de endereço |
            | Permissões     | Controle as permissões de uso         |
            | Acesso seguro  | Configure a biometria para acesso     |
            | Integrações    | Controle as integrações do aplicativo |