*** Settings ***
Resource   cadastro_keywords.robot

*** Keywords ***
E realizar a requisição do produto ${_id}
    [Documentation]    Realiza uma requisição informando o id do produto no path do endpoint
    ${RESPONSE}    GET On Session    alias=serveRest    url=/produtos/${_id}
Então o sistema deve retornar um json com o produto relacionado ao id pesquisado
    [Documentation]    Verifica se o produto retornado está correto e se o código é 200.
    ${HEADERS}   Create Dictionary  Authorization=${TOKEN}
    ${RESPONSE}  GET On Session     alias=serveRest    url=/produtos/${_id}    headers=${HEADERS}
    Log   Resposta Retornada: ${\n}${RESPONSE.text}
    Should Be Equal As Integers    ${RESPONSE.status_code}    200
    Dictionary Should Contain Item    ${RESPONSE.json()}    nome          Samsung 60 polegadas
    Dictionary Should Contain Item    ${RESPONSE.json()}    preco         ${5240}
    Dictionary Should Contain Item    ${RESPONSE.json()}    descricao     TV
    Dictionary Should Contain Item    ${RESPONSE.json()}    quantidade    ${49977}
    Dictionary Should Contain Item    ${RESPONSE.json()}    _id           K6leHdftCeOJj8BJ

    Delete All Sessions
E realizar a requisição com um id inexistente
    [Documentation]    Realiza uma requisição informando um id inválido igual a 123
    ${RESPONSE}    GET On Session    alias=serveRest    url=/produtos/A123    expected_status=400
    Should Be Equal As Strings    ${RESPONSE.status_code}    400
Então o sistema deve retornar um json contendo uma mensagem de erro
    [Documentation]    Verifica se o status de erro é 400
    ${HEADERS}   Create Dictionary  Authorization=${TOKEN}
    ${RESPONSE}  GET On Session     alias=serveRest    url=/produtos/A123    headers=${HEADERS}    expected_status=400
    Dictionary Should Contain Item    ${RESPONSE.json()}    message    Produto não encontrado

    Delete All Sessions
