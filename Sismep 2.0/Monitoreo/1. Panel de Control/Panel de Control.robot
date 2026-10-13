*** Settings ***
Resource    ../../Recursos.Generales.robot

*** Variables ***
${EpE}            xpath=//*[@id="bxBar"]/div[1]/div[1]/h3[2]/input
${permisosChart}       xpath=//*[@id="bxPie"]/div[1]/div/button
${permisosEstadoChart}    xpath=//*[@id="bxBar"]/div[1]/div[2]/button
${alertasChart}        xpath=//*[@id="bxLine"]/div[1]/div/button

*** Test Cases ***
Panel de control - Validar acceso
    [Documentation]    Debera mostrar correctamente la pantalla de panel de control.
    [Tags]    Panel de control - Validar acceso
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Panel de Control
    Sleep    1
    Validar acceso a Panel de Control
    [Teardown]    Close Browser
    
*** Keywords ***
Presionar opcion Panel de Control
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/button[2]
    Click Element    xpath=//*[@id="divPanelControles"]/button[2]
    
Validar acceso a Panel de Control
    Wait Until Element Is Visible    xpath=//*[@id="bxLine"]
    Element Should Be Visible    xpath=//*[@id="bxLine"]