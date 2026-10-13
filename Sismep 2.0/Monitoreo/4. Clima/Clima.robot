*** Settings ***
Resource    ../../Recursos.Generales.robot

*** Variables ***
${MostrarClima}    xpath=//*[@id="chkwunder"]
${TemperaturaActual}    xpath=//*[@id="chkShowForecast"]
${Nubosidad}    xpath=//*[@id="chknube"]

*** Test Cases ***
Clima: Validar etiquetas
    [Documentation]    Valida que se muestre correctamente escritas las etiquetas.
    [Tags]    Clima: Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Clima
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser

Clima: Mostrar Clima
    [Documentation]    Valida que al activar la opcion Clima muestre el clima en pantalla.
    [Tags]    Clima: Mostrar Clima - T437
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Clima
    Presionar la opcion: ${MostrarClima}
    Sleep    5
    [Teardown]    Close Browser
    
Clima: Temperatura Actual
    [Documentation]    Valida que al activar la opcion Temperatura actual muestre la temperatura en iconos en el mapa.
    [Tags]    Clima: Temperatura Actual - T440
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Clima
    Presionar la opcion: ${TemperaturaActual}
    Sleep    5
    [Teardown]    Close Browser
    
Clima: Nubosidad
    [Documentation]    Valida que al activar la opcion Nubosidad se refleje en el mapa.
    [Tags]    Clima: Nubosidad - 447
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Clima
    Presionar la opcion: ${Nubosidad}
    Sleep    5
    [Teardown]    Close Browser
    
*** Keywords ***
Presionar opcion Clima
    Wait Until Element Is Visible    xpath=//*[@id="btnMenuClimas"]
    Click Element    xpath=//*[@id="btnMenuClimas"]
    
Validar etiquetas
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/div[2]/div
    ${MC}=    Get Text    //*[@id="divPanelControles"]/div[2]/div/div[1]/label
    ${TA}=    Get Text    //*[@id="divPanelControles"]/div[2]/div/div[2]/label
    ${N}=    Get Text    //*[@id="divPanelControles"]/div[2]/div/div[3]/label
    ${etqMC}=    Execute Javascript    cadena='${MC}'; return cadena.trimStart();
    ${etqTA}=    Execute Javascript    cadena='${TA}'; return cadena.trimStart();
    ${etqN}=    Execute Javascript    cadena='${N}'; return cadena.trimStart();
    Should Be Equal    ${etqMC}    Mostrar Clima
    Should Be Equal    ${etqTA}    Temperatura Actual
    Should Be Equal    ${etqN}    Nubosidad

Contar No. de Zonas
    ${Ligas}=    Execute Javascript    return document.getElementsByClassName("dropdown-menu show")[0].getElementsByClassName("dropdown-item").length;
    Set Test Variable    ${Ligas}
    
Presionar la opcion: ${tipozona}
    Wait Until Element Is Visible    ${tipozona}
    Click Element    ${tipozona}
