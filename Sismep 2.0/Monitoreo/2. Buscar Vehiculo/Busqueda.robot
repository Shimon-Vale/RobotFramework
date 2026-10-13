*** Settings ***
Resource    Recursos.Busqueda.robot

*** Test Cases ***
Validar etiquetas de la opcion Buscar Vehiculo
    [Documentation]    Valida que las etiquetas mostradas en Buscar vehiculo esten correctamente escritas.
    [Tags]    Validar etiquetas de la opcion Buscar Vehiculo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Desplegar listado de Embarcaciones
    Sleep    1
    Validar etiquetas y tooltips
    [Teardown]    Close Browser
    
*** Keywords ***
Desplegar listado de Embarcaciones
    Wait Until Element Is Visible    xpath=//*[@id="ddblBuscarVehiculo"]/div[1]/div/div[2]/div/div/div    timeout=15
    Click Element    xpath=//*[@id="ddblBuscarVehiculo"]/div[1]/div/div[2]/div/div/div

Validar etiquetas y tooltips
    ${ttBV}=    Get Element Attribute    xpath=//*[@id="divPanelControles"]/button[4]    title
    Should Be Equal As Strings    ${ttBV}    Buscar Vehiculo
    Element Text Should Be    //*[@id="dx-col-1"]/div[2]    Nombre
    Element Text Should Be    //*[@id="dx-col-2"]/div[2]    RNP
    Element Text Should Be    //*[@id="dx-col-3"]/div[2]    Matrícula