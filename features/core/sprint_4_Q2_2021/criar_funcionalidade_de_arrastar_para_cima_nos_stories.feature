#Projeto: APP Vitta - The Coders
#Estória: APP-1319 (Criar funcionalidade de arrastar para cima nos stories)
#data criação: 24-05-2021
#Sprint: 4-Q2/2021
#Tipo de teste: Manual

@APP-1319
Feature: criar_funcionalidade_de_arrastar_para_cima_nos_stories.feature

    Ser um CTA para o usuário conhecer a nova funcionalidade

    Background: Login com usuario válido
        Given Que esteja logado com um usuário "05061097041" com válido

    @APP-1319_1
    Scenario: Criar função arrasta para cima
        Given Que o sistema possua um story ativo
        Then Deve ser possível usar a funcionalidade de arrasta para cima

    @APP-1319_2
    Scenario: Recirecionamento de página pelo story
        Given Que o sistema possua um story ativo
        When Ativar a função arrasta para cima de um story
        Then Deve ser redirecionado a tela referente ao item do story
        But Se story informativo sem necessidade de redirecionamento, não apresentar arrasta para cima