*** Settings ***
Library    Libraries/sikimage.py

*** Test Cases ***
O filtro e a imagem têm o mesmo formato?
    ${camera}    Camera Image Shape
    ${edge}      Edges Image Shape

    Should Be Equal    ${camera}    ${edge}