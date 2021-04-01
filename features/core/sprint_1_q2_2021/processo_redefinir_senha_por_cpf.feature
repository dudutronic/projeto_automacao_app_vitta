#Estória: APP-1073 (Processo de redefinir senha por CPF)
#data criação: 30-03-2021
#Sprint: A definir
#Execução: Manual
@APP-1073

Feature: processo_redefinir_senha_por_cpf.feature

    Como usuário e já tendo login do app, esqueci minha senha e gostaria de redefinir-la.
    #por que utilizar o novo e-mail ao invés de atualizar cadastro?

    Background: Solicitação de troca de senha(Usuarios login cadastrado - Esqueceu a senha)
        Given Given Que ao abri a tela incial e clicar em -Acessar minha conta-
        And Que informo um "cpf" que possui uma conta válida
        And Clicar em -Continuar-
        When Clicar em esqueci minha senha

    #fluxos de sucesso
    @APP-1073_01
    Scenario: Solicitação de troca de senha (Esqueceu a senha - Envio de código efetuado com sucesso)
        Given Que redirecionado a tela de esqueci minha senha, inserir "cpf"
        When Clico em -Receber código de válidação-
        Then O sistema deve enviar o código para o e-mail -Exibir para qual e-mail foi enviado-
        And o e-mail com o código deve ser o mesmo apresentado na tela do aplicativo

    @APP-1073_02
    Scenario: Solicitação de troca de senha (Esqueceu a senha - inserir código com sucesso)
        Given Que redirecionado a tela de esqueci minha senha, inserir "cpf"
        And Clico em -Receber código de válidação-
        And O sistema deve enviar o código para o e-mail -Exibir para qual e-mail foi enviado-
        When Inserir código recebido no e-mail
        And inserir nova senha
        And Clicar em redefinir senha
        Then O sistema deve exibir a mensagem "Sua nova senha foi salva"

    #fluxos de exceção
    @APP-1073_03
    Scenario: Solicitação de troca de senha (Esqueceu a senha - Erro ao clicar em receber código de validação )
        Given Que redirecionado a tela de esqueci minha senha, inserir "cpf"
        When Clico em -Receber código de válidação-
        And A conexão com o servidor é interrompida
        Then O sistema deve retornar a mensagem "Não foi possivel completar a Solicitação"

    @APP-1073_04
    Scenario: Solicitação de troca de senha (Esqueceu a senha - Erro ao clicar confirmar recebimento do código)
        Given Que redirecionado a tela de esqueci minha senha, inserir "cpf"
        And Clico em -Receber código de válidação-
        And O sistema deve enviar o código para o e-mail -Exibir para qual e-mail foi enviado-
        When Inserir código recebido no e-mail
        And inserir nova senha
        And Clicar em redefinir senha
        And A conexão com o servidor é interrompida
        Then O sistema deve retornar a mensagem "Não foi possivel completar a Solicitação"

    @APP-1073_05
    Scenario: Solicitação de troca de senha (Esqueceu a senha - Não recebimento do código no e-mail)
        Given Que redirecionado a tela de esqueci minha senha, inserir "cpf"
        And Clico em -Receber código de válidação-
        When O sistema deve enviar o código para o e-mail -Exibir para qual e-mail foi enviado-
        Then Depois de 3 minutos, se o e-mail não for recebido deve ser possivel -Reenviar meu código-

    @APP-1073_06
    Scenario: Solicitação de troca de senha(Usuarios não cadastrado - Esqueceu a senha)
        Given Que redirecionado a tela de esqueci minha senha, inserir "cpf"
        When Clico em -Receber código de válidação-
        Then O sistema deve informa que o cpf informado não é valido ou não está cadastrado

    @APP-1073_07
    Scenario: Solicitação de troca de senha (Esqueceu a senha - Troca de e-mail)
        Given Que redirecionado a tela de esqueci minha senha, inserir "cpf"
        And Clico em -Receber código de válidação-
        And O sistema deve enviar o código para o e-mail -Exibir para qual e-mail foi enviado-
        When Não tem mais acesso ao e-mail
        Then deve ser possivel escolher/ou trocar o e-mail do cadastro