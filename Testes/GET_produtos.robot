*** Settings ***
Resource   Keywords/GET_produtos_keywords.robot

*** Test Cases ***
Cenário 1: Pesquisar produto por um id válido
    DADO que o usuário inicie a sessão na API do serverest
    E realize o cadastro no sistema
    QUANDO o usuário receber o Token
    E realizar a requisição do produto ${_id}
    Então o sistema deve retornar um json com o produto relacionado ao id pesquisado

Cenário 2: Pesquisar produto por um id inexistente
    DADO que o usuário inicie a sessão na API do serverest
    E realize o cadastro no sistema
    QUANDO o usuário receber o Token
    E realizar a requisição com um id inexistente
    Então o sistema deve retornar um json contendo uma mensagem de erro