*** Settings ***
Resource    ../../Recursos.Generales.robot

*** Test Cases ***
Validar acceso a la liga
    [Documentation]    Debera de abrir correctamente la URL del MAS.
    [Tags]    Validar acceso a la liga - T450
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion MAS
    Sleep    2
    Obtener url de la ventana emergente
    Validar url en BD
    [Teardown]    Close Browser

*** Keywords ***
Presionar opcion MAS
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/button[1]
    Click Element    xpath=//*[@id="divPanelControles"]/button[1]
    
Obtener url de la ventana emergente
    Switch Window    NEW
    ${url}=    Get Location
    Set Test Variable    ${url}

Validar url en BD
    Conexion a Base de datos
    @{queryResults}=    Query    select Valor from TSismepPermisos where Descripcion='Modulo Administrativo'
    Should Be Equal    ${queryResults[0][0]}    ${url}
    Disconnect From Database