***Settings***
Resource    ../resources/base.robot

Test Setup       Open Session
Test Teardown    Close Session

***Variables***
${EMAIL}    io.qaninja.android.twp:id/etEmail
${SENHA}    io.qaninja.android.twp:id/etPassword

***Test Cases***
Deve Logar com sucesso
    Go To Login Form

    #Input Text    io.qaninja.android.twp:id/etEmail       eu@papito.io
    #Input Text    io.qaninja.android.twp:id/etPassword    qaninja
    #Click Text    ENTRAR

    #Wait Until Page Contains    Show! Suas credenciais são validas.