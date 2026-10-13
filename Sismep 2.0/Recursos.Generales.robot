*** Settings ***
Library    String
Library    BuiltIn
Library    DateTime
Library    OperatingSystem
Library    SeleniumLibrary
Library    DatabaseLibrary

*** Variables ***
#${url}    http://192.168.1.30:9201/
#${url}    http://54.219.63.18:90/
${url}    https://www.google.com/
#${url}    http://192.168.1.30:97/account/login
${consecutivo}    0
&{credenciales}    usuario=Administrador    password=---
${M_DMS}    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[1]/ul/li[1]/a
${M_Decimal}    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[1]/ul/li[2]/a
${M_KPH}    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]/ul/li[1]/a
${M_MPH}    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]/ul/li[2]/a
${M_Nudos}    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]/ul/li[3]/a
${M_DstKilometros}    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[3]/ul/li[1]/a
${M_DstMillas}    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[3]/ul/li[2]/a
${M_DstNudos}    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[3]/ul/li[3]/a

*** Keywords ***
Iniciar sesion
    Open Browser    ${url}    chrome    options=add_argument("--incognito")
    Maximize Browser Window
    Wait Until Element Is Visible	xpath=//*[@id="Usuario"]
    Wait Until Element Is Visible	xpath=//*[@id="Password"]
    Input Text    name=Usuario    ${credenciales}[usuario]
    Input Password    name=Password    ${credenciales}[password]
    Click Element    id=btnLogin
    Wait Until Element Is Not Visible    xpath=/html/body/div[2]/div/div[2]    timeout=90
    Wait Until Element Is Visible	xpath=//*[@id="alertasChart"]
    
Ingresar a opcion Monitoreo
    Click Element    xpath://*[@id="divMenuList"]/a[2]/span
    Wait Until Element Is Not Visible    xpath=/html/body/div[2]/div/div[2]    timeout=90
    Wait Until Element Is Visible    xpath=//*[@id="map"]/div/div/div[2]    timeout=90
    
Conexion a Base de Datos
    Connect to Database    pymssql    BDSismep2    usr    pss    1.0.0.0		1433

    
Monitoreo - Configurar posicion
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="dropdownMenuButton"]
    Wait Until Element Is Visible    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[1]/a
    Mouse Over    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[1]/a
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}
    
Monitoreo - Configurar Velocidad
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="dropdownMenuButton"]
    Wait Until Element Is Visible    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]/a
    Mouse Over    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]/a
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}
    
Monitoreo - Configurar Distancia
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="dropdownMenuButton"]
    Wait Until Element Is Visible    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[3]/a
    Mouse Over    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[3]/a
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}
    
Esperar advertencia de alertas no visible
    Wait Until Element Is Not Visible    xpath=//*[@id="sbAlert"]/div[1]/p    timeout=20