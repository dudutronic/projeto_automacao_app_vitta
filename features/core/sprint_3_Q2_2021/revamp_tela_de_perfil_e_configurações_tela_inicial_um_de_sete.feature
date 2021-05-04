#Projeto: APP Vitta - The Coders
#Estória: APP-1159 (Revamp tela de perfil e configurações - Tela inicial 1 de 7)
#data criação: -05-2021
#Sprint: 3-Q2/2021
#Tipo de teste:

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

    Scenario: Atualizar foto do perfil (Criação de escolha de troca de foto)
        Given Acesse tela Perfil e configurações
        When Clicar no icone da câmera
        Then Deve aparecer o pop up "Editar foto do Perfil"
        And Deve constar as opções "Tirar uma foto agora" e "Escolha uma foto na galeria"

    Scenario: Atualizar foto do perfil (Alterar por meio de uma nova foto da camera)
        Given Acesse tela Perfil e configurações
        When Clicar no icone da câmera
        And Clicar na opção "Tirar foto agora" dentro do pop up "Editar foto do Perfil"
        Then deve abrir o aplicativo nativo camera
        And Deve ser possível tirar a foto e apresenta-la para inserção
        And Ao salvar, deve ficar como nova imagem de perfil

    Scenario: Atualizar foto do perfil (Alterar foto a partir das fotos locais do dispositivo)
        Given Acesse tela Perfil e configurações
        When Clicar no icone da câmera
        And Clicar na opção "Tirar foto agora" dentro do pop up "Editar foto do Perfil"
        Then deve abrir o a escolha de um repositorio de fotos do device
        And Deve ser possível selecionar uma imagem e apresenta-la para inserção
        And Ao salvar, deve ficar como nova imagem de perfil