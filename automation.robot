*** Settings ***
Documentation    Essa suíte vai fazer uma compra no site automationpractice.com
Resource         automation_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso 01 - Compra no Site
    [Tags]    COMPRA

    Acessar a home page do site Automationpractice.com
    Digitar o nome de produto "Blouse" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Blouse"
    Clicar no produto e adicionar "Blouse" no carrinho
    Prosseguir para o check-out
    Preencher o Email
    Prosseguir para o Endereço
    Prosseguir para o Envio
    Prosseguir para o Pagamento
    Ver o pedido


