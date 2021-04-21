#Projeto: APP Vitta - The Coders
#Estória: APP-1073 (Processo de redefinir senha por CPF)
#data criação: 21/04/2021
#Sprint: #Sprint: 2-Q2/2021
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
        Then O sistema deve enviar o código para o e-mail -Exibir para qual e-mail foi enviado de forma que esteja com parte mascarado-
        And o e-mail com o código deve ser o mesmo apresentado na tela do aplicativo

    @APP-1073_02
    Scenario: Solicitação de troca de senha (Esqueceu a senha - inserir código com sucesso)
        Given Que redirecionado a tela de esqueci minha senha, inserir "cpf"
        And Clico em -Receber código de válidação-
        And O sistema deve enviar o código para o e-mail -Exibir para qual e-mail foi enviado-
        When Inserir código recebido no e-mail
        And inserir nova senha
        And Clicar em redefinir senha
        Then O sistema deve redirecionar para a tela de home e exibir a mensagem "Sua nova senha foi salva"


    #fluxos de exceção
    @APP-1073_03
    Scenario: Solicitação de troca de senha (Esqueceu a senha - Erro ao clicar em receber código de validação/Não recebimento do código no e-mail )
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
    Scenario: Solicitação de troca de senha (Solicitar novo Código antes de vencido)
        Given Que redirecionado a tela de esqueci minha senha, inserir "cpf"
        And Clico em -Receber código de válidação-
        When O sistema deve enviar o código para o e-mail -Exibir para qual e-mail foi enviado-
        Then O usuario pode solicitar um novo código válido antes do tempo do vencimento
        But O código antigo deve perder a válidade

    @APP-1073_06
    Scenario: Solicitação de troca de senha (Esqueceu a senha - Código vencido)
        Given Que redirecionado a tela de esqueci minha senha, inserir "cpf"
        And Clico em -Receber código de válidação-
        When O sistema deve enviar o código para o e-mail -Exibir para qual e-mail foi enviado-
        Then Depois de 3 minutos, se o não for utilizado, não deve ser possivel completar a solicitação

    @APP-1073_07
    Scenario: Solicitação de troca de senha (Esqueceu a senha - Código já utilizado)
        Given Que redirecionado a tela de esqueci minha senha, inserir "cpf"
        And Clico em -Receber código de válidação-
        When O sistema deve enviar o código para o e-mail -Exibir para qual e-mail foi enviado-
        Then Depois de utilizado, o não pode ser reutilizado, não deve ser possivel completar a solicitação

    @APP-1073_08
    Scenario: Solicitação de troca de senha(Usuarios não cadastrado - Esqueceu a senha)
        Given Que redirecionado a tela de esqueci minha senha, inserir "cpf"
        When Clico em -Receber código de válidação-
        Then O sistema deve informa que o cpf informado não é valido ou não está cadastrado

    @APP-1073_09
    Scenario: Solicitação de troca de senha (Esqueceu a senha - Troca de e-mail)
        Given Que redirecionado a tela de esqueci minha senha, inserir "cpf"
        And Clico em -Receber código de válidação-
        And O sistema deve enviar o código para o e-mail -Exibir para qual e-mail foi enviado-
        When Não tem mais acesso ao e-mail
        Then deve ser possivel escolher/ou trocar o e-mail do cadastro