#Projeto: APP Vitta - The Coders
#Estória: APP-1333 (Não exibir o botão de central de reembolso quando nao houver disponivel esta opcao para os meus produtos)
#data criaçã: 19-04-2021
#Obs: herança feature APP-1020 (reembolso_solicitar_reembolso)
#Sprint: 4-Q2/2021
#Execução: Manual

@APP-1333
Feature: Não exibir o botão de central de reembolso quando nao houver disponivel esta opcao para os meus produtos

    @APP-1333_1
    #Se o usúario não possuir produtos, ou possuir produtos que não são elégiveis a reembolso.
    Scenario: Usuário com produtos Não elegivel a reembolso
        Given Que esteja logado com um usuário "05061097041" com válido
        When Não possui um produto que seja elegivél a reembolso
        Then O sistema Não deve exibir o botão de central de reembolso

    @APP-1333_2
    #Se o usuario possuir um unico produto ou mais de um, porém entre eles deve existir elegivéis
    Scenario: Usuário com produtos elegiveis a reembolso
        Given Que esteja logado com um usuário "05061097041" com válido
        When Seja elegivél a reembolso
        And Verificar se a integração está ativa
        Then O sistema deve exibir a central de reembolso
