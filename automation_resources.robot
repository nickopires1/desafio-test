*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.automationpractice.com
&{PREENCHER_CADASTRO}    email=piresdasilvanickolas@gmail.com    senha=testerobot1234

*** Keywords ***
Abrir o navegador
    Open Browser   
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser
Acessar a home page do site Automationpractice.com
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=//b[contains(.,'Cart')]
Digitar o nome de produto "Blouse" no campo de pesquisa
    Input Text    locator=search_query_top    text=Blouse
Clicar no botão de pesquisa
    Click Element    locator=submit_search
 Verificar o resultado da pesquisa se está listando o produto "Blouse"
     Wait Until Page Contains    text=In stock
Clicar no produto e adicionar "Blouse" no carrinho
    Mouse Over    locator=//div[contains(@class,'product-container')]
    Click Element    locator=//span[contains(.,'Add to cart')]
    Sleep    3
 Prosseguir para o check-out
    Click Element    locator=//span[contains(.,'Proceed to checkout')]
    Wait Until Page Contains    text=Summary
    Click Element    locator=(//span[contains(.,'Proceed to checkout')])[2]
    Wait Until Page Contains    text=Email address
Preencher o Email
    Input Text    locator=//input[@id='email']    text=${PREENCHER_CADASTRO.email}
    Sleep    2
    Input Password    locator=//input[contains(@type,'password')]    password=${PREENCHER_CADASTRO.senha}
    Sleep    2
    Click Element    locator=(//span[contains(.,'Sign in')])[2]
Prosseguir para o Endereço
    Wait Until Page Contains    text=Choose a delivery address:
    Click Element    locator=(//span[contains(.,'Proceed to checkout')])[2]
Prosseguir para o Envio
    Wait Until Page Contains    text=Choose a shipping option for this address:
    Select Checkbox    locator=//input[contains(@type,'checkbox')]
    Sleep    2
    Click Element    locator=(//span[contains(.,'Proceed to checkout')])[2]
Prosseguir para o Pagamento
    Wait Until Page Contains    text=Product
    Click Element    locator=//p[@class='payment_module'][contains(.,'Pay by bank wire (order processing will be longer)')]
    Wait Until Page Contains    text=You have chosen to pay by bank wire. Here is a short summary of your order:
    Click Element    locator=//span[contains(.,'I confirm my order')]
Ver o pedido
    Click Element    locator=//a[@class='button-exclusive btn btn-default'][contains(.,'Back to orders')]
    Wait Until Page Contains    text=Order reference

     