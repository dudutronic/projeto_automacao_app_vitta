#Projeto: APP Vitta - The Coders
#Estória: APP-1226 (Anúncio - Central de Reembolso)
#data criação: 24-05-2021
#Sprint: 4-Q2/2021
#Tipo de teste: Manual

@APP-1226
Feature: anuncio_central_de_reembolso.feature
    O anúncio das funcionalidades de reembolso serão colocadas em produção em breve,
    pensando nisso, precisamos criar telas de funcionamento dessa features.

    @APP-1226_1
    Scenario: Anúncio - Central de Reembolso(Cliente Elegivél a reembolso)
        Given Que esteja logado com um usuário "05061097041" com válido
        When Possuir produto elegivél a central de reembolso
        And E for o primeiro acesso a aplicação ou usuario deslogue e logue novamente
        Then Deve apresentar o anúncio com conteúdo explicativo sobre a central de reembolso
        And Deve conter o informativo de como acessar a central de reembolso
        And Ao clicar no anúncio deve redirecionar para o local do informativo
        But Após fechar o anuncio, se aplicativo fechado ou alternado, não deve exibir novamente