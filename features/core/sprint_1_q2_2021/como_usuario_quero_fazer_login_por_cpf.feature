#Estória: APP-1042 (Como usuário, quero fazer login por CPF)
#data criação: 12-04-2021
#Sprint: A definir
#Execução: Manual

@APP-1042
Feature: como_usuario_quero_fazer_login_por_cpf
    Background: Fazer Login na aplicação e navegar até a tela de avaliação
        Given Que esteja logado com um cpf com uma conta válida
            | cpf | 852.168.220-46 |


    #fluxo principal
    @APP-1042_1
    Scenario: Trocar login de e-mail para Login de CPF
        Given Que estou em tela de login com opção de logar com e-mail
        When Clicar em trocar opção de login
        Then Deve ser apresentar a tela de login por cpf
        And possível logar com o cpf
    @APP-1042_2
    Scenario: Logar com sucesso com CPF
        Given Que estou em tela de login com opção de logar com cpf
        When que eu insiro o "cpf" e "senha" válidos
        Then Deve logar no sistema com sucesso

        Examples:
            | cpf            | senha         |
            | 852.168.220-46 | Melhor3maior@ |

    #fluxo de exceção
    @APP-1042_3
    Scenario: Válidar caracteres inceridos no input de CPF/ CPF vazio / Falha na conexão com o servidor
        Given Que estou em tela de login com opção de logar com cpf
        When que eu insiro o "cpf" e "senha" válidos
        Then O sistema deve retornar uma "mensagem" de erro

        Examples:
            | cpf            | senha         | mensagem |
            | 45dadae5c1     | Melhor3maior@ |          |
            | 111.111.111-00 | Melhor3maior@ |          |
            | 852.168.220-46 | Melhor3maior@ |          |
    @APP-1042_4
    Scenario: Tentar logar com cpf válido porém diferente do informado anteriormente
        Given Que estou em tela de login com opção de logar com cpf
        When que eu insiro o "cpf" e "senha" válidos
        Then O sistema deve retornar uma "mensagem"
        Examples:
            | cpf        | senha         | mensagem |
            | 45dadae5c1 | Melhor3maior@ |          |