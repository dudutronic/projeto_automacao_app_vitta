#Projeto: APP Vitta - The Coders
#Estória: APP-1209 (Revamp tela de perfil e configurações - Endereço (4 de 7)
#data criação: 01-06-2021
#Sprint: 5-Q2/2021
#Tipo de teste:

@APP-1209
Feature: revamp_tela_de_perfil_e_configurações_endereco_quatro_de_sete.feature

    Como usuário autenticado no APP
    Eu quero inserir um novo endereço ou editar um endereço já cadastrado
    Para manter meu cadastro atualizado

    Background: Fluxo completo de login
        Given Que esteja logado com um cpf "05061097041"
        And Uma senha "Melhor3maior@" de uma conta válida
        When Acesse tela Perfil e configurações
        And Clicar em Endereços


    Scenario: Criação da tela Endereço (Para alteração ou adição)
        Given Que tenha acessado Endereços a partir da tela Perfil e configuração
        Then Deve Exibir uma nova tela com cards dos endereços cadastrados -exibir completo dentro deles-
        And Qual é o tipo de endereço, "Casa" ou "Escritório"
        And Só será possivel cadastrar dois endereços
    #And O um botão de +
    #But Não ouver endereço cadastrado deve constar um botão com o simbolo +


    Scenario: Editar endereços
        Given Que tenha acessado Endereços a partir da tela Perfil e configuração
        When Clicar em um card de endereço
        Then Deve abrir para a edição
        And Após finalizar, deve voltar para a tela de endereços com as informações atualizadas
        But Ocorrer erro com servidor, as informações não devem ser atualizadas


    Scenario: Cadastrar endereços
        Given Que tenha acessado Endereços a partir da tela Perfil e configuração
        When Clicar em um card de endereço não cadastrado
        Then Deve exibir a mensagem "Você não tem um endereço cadastrado"
        And Permitir adicionar um novo endereço
        And Após finalizar, deve voltar para a tela de endereços com as informações atualizadas
        But Ocorrer erro com servidor, as informações não devem ser atualizadas