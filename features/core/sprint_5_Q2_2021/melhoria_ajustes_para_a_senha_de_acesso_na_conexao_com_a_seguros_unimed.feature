#Projeto: APP Vitta - The Coders
#Estória: APP-1303 ([Melhoria] Ajustes para a senha de acesso na conexão com a Seguros Unimed)
#data criação: 02-06-2021
#Sprint: 5-Q2/2021
#Tipo de teste:

@APP-1303
Feature: melhoria_ajustes_para_a_senha_de_acesso_na_conexao_com_a_seguros_unimed.feature

    Garantir que o usuário consiga validar se sua senha está
    correta durante a integração com a Seguros Unimed.

    Background: Navegar até integração da central de reembolso
        Given Dado que esteja logado com um "cpf" e "senha"
        And Tenha acessado a integração disponivel em central de reembolso

    Scenario: Inserir Hide (Olhinho) no campo de senha da integração com os seguros
        Given Tenha inserido o "cpf" do beneficiario preenchido
        When Inserir "senha", virar com a mascara ativa
        Then Deve apresentar o campo Hide
        And Quando clicar no hide, deve exibir/ocultar a senha
        And Se estiver incorreta ao tentar conectar, exibir mensagem de erro "Senha incorreta"
