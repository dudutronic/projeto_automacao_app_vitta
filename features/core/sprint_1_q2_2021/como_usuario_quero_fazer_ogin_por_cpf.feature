#Estória: APP-1042 (Como usuário, quero fazer login por CPF)
#data criação: -04-2021
#Sprint: A definir
#Execução: Manual

@APP-1046
Feature: possibilidade_de_incluir_um_logo_nos_beneficios_de_saude
    Background: Fazer Login na aplicação e navegar até a tela de avaliação
        Given Que esteja logado com um cpf com uma conta válida
            | cpf | 852.168.220-46 |


    #fluxo principal
    Scenario: Trocar login de e-mail para Login de CPF
        Given Que estou em tela de login com opção de logar com e-mail
        When Clicar em trocar opção de login
        Then Deve ser apresentar a tela de login por cpf
        And possível logar com o cpf

    Scenario: Logar com sucesso com CPF
        Given Que estou em tela de login com opção de logar com cpf
        When que eu insiro o "cpf" e "senha" válidos
        Then Deve logar no sistema com sucesso

        Examples:
            | cpf            | senha         |
            | 852.168.220-46 | Melhor3maior@ |

    #fluxo de exceção
    Scenario: Válidar caracteres inceridos no input de CPF/ CPF vazio / Falha na conexão com o servidor
        Given Que estou em tela de login com opção de logar com cpf
        When que eu insiro o "cpf" e "senha" válidos
        Then O sistema deve retornar uma "mensagem" de erro

        Examples:
            | cpf            | senha         | mensagem |
            | 45dadae5c1     | Melhor3maior@ |          |
            | 111.111.111-00 | Melhor3maior@ |          |
            | 852.168.220-46 | Melhor3maior@ |          |

    Scenario: Tentar logar com cpf válido porém diferente do informado anteriormente
        Given Que estou em tela de login com opção de logar com cpf
        When que eu insiro o "cpf" e "senha" válidos
        Then O sistema deve retornar uma "mensagem"
        Examples:
            | cpf        | senha         | mensagem |
            | 45dadae5c1 | Melhor3maior@ |          |