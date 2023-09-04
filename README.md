# Teste de API com Robot Framework

Este projeto visa testar os endpoints e as funções da API pública serveRest utilizando o Robot Framework e as bibliotecas RequestLibrary, FakerLibrary e Collection.

## Dependências

Para executar os testes deste projeto, você precisará do Robot Framework, juntamente com as bibliotecas de suporte. Certifique-se de ter o Python instalado no seu sistema.

1. Instale o Robot Framework:

   ```
    pip install robotframework
   ```

2. Instale a biblioteca RequestsLibrary para fazer solicitações HTTP:
   ```
   pip install robotframework-requests
   ```
3. Instale a biblioteca FakerLibrary para gerar dados falsos:

   ```
   pip install robotframework-faker
   ```
4. Para que o teste do skimage funcione corretamente, você também precisa instalar a dependência
   ```
   pip install scikit-image
   ```

## Execução do teste

1. Vá para a raíz do projeto;
2. Para rodar um comando em robot, precisa-se escrever
   ```
       robot -d PATH/DO/RELATÓRIO PATH/DO/ARQUIVO/DE/TESTE
   ```
   No nosso exemplo, se você estiver na raíz do SERVERESTTESTE deve rodar o comando:
   ```
       robot -d Resultados Testes/GET_produtos_keywords.robot
   ```
