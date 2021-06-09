***Settings***
Documentation    Aqui teremos as KWs Helpers

***Variables***
${START}    xpath=//*[@content-desc='Acessar minha conta']

***Keywords***
Get Started
    Wait Until Page Contains    Sua liberdade na palma da mão.    20    
    Click element               ${START}

Go To Login Form
    Wait Until Page Contains    Seja bem vindo à Vitta!

     Click Element At Coordinates    182                               983
     Wait Until Page Contains        Sua liberdade na palma da mão.    20     
#    Wait Until Page Contains        FORMS

#    Click Text                  LOGIN
#    Wait Until Page Contains    Fala QA, vamos testar o login?