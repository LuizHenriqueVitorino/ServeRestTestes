*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    FakerLibrary
Resource   ../Variables/globals_variables.robot

*** Keywords ***
Criar dados do usuário
    [Documentation]    Cria um dicionário com os dados do usuário
    ${FIRT_NAME}  FakerLibrary.First Name
    ${LAST_NAME}  FakerLibrary.Last Name
    ${EMAIL}      FakerLibrary.Email
    ${PASSWORD}   FakerLibrary.Password
    ${USUARIO}    Create Dictionary    nome=${FIRT_NAME} ${LAST_NAME}  email=${EMAIL}  senha=${PASSWORD}
    Set Suite Variable    ${USUARIO}  
DADO que o usuário inicie a sessão na API do serverest
    [Documentation]    Inicia a cessão na API do serverest
    ${HEADERS}    Create Dictionary    Content-Type=application/json
    Create Session    alias=serveRest    url=${BASE_URL}    headers=${HEADERS}    disable_warnings=1
E realize o cadastro no sistema
    Criar dados do usuário
    ${Body}    Create Dictionary    nome=${USUARIO.nome}    email=${USUARIO.email}    password=${USUARIO.senha}    administrador=true
    ${RESPONSE}    POST On Session     alias=serveRest    url=usuarios    json=${BODY}
    Log   Resposta Retornada: ${\n}${RESPONSE.text}
QUANDO o usuário receber o Token
    ${BODY}      Create Dictionary   email=${USUARIO.email}   password=${USUARIO.senha}
    ${RESPONSE}  POST On Session     alias=serveRest    url=login    json=${BODY}
    Log   Resposta Retornada: ${\n}${RESPONSE.text}
    Dictionary Should Contain Item    ${RESPONSE.json()}    message    Login realizado com sucesso
    ${TOKEN}     Get From Dictionary    ${RESPONSE.json()}    authorization
    Set Suite Variable    ${TOKEN}