*** Settings ***
Resource    ../../Recursos.Generales.robot

*** Variables ***
${TODAS}    xpath=//*[@id="tipozonaTodas"]
${PUERTO}    xpath=//*[@id="67ab8adf-7ae3-40b7-91ed-a1d3e84a7a29"]
${INFORMATIVA}    xpath=//*[@id="52e2ddd5-9045-403e-a000-cd7a178d5cf8"]
${DECRETO}    xpath=//*[@id="3e221865-7dba-44ed-b358-df9b462c6462"]
${RESTRINGIDA}    xpath=//*[@id="c937b8dc-7816-4ac0-9625-ec27710fc91d"]
${PESCAPROHIBIDA}    xpath=//*[@id="1e8a8998-af64-4fcc-bb45-f5bfc6208a38"]

*** Test Cases ***
Zonas: Validar etiquetas
    [Documentation]    Valida que se muestre correctamente escritas las etiquetas de Zona.
    [Tags]    Zonas: Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Zonas
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser

Zonas: Validar cantidad de ligas
    [Documentation]    Valida que se muestre correctamente todas las opciones.
    [Tags]    Zonas: Validar cantidad de ligas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Zonas
    Sleep    1
    Contar No. de Zonas
    Validar cantidad de zonas en BD
    [Teardown]    Close Browser

Zonas: TODAS
    [Documentation]    Valida que se muestren correctamente todas las zonas pintadas en el mapa.
    [Tags]    Zonas: TODAS - T428
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Zonas
    Presionar la opcion: ${TODAS}
    Sleep    5
    [Teardown]    Close Browser
    
Zonas: PUERTO
    [Documentation]    Valida que se muestren correctamente las zonas Tipo Puerto en el mapa.
    [Tags]    Zonas: PUERTO - T418
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Zonas
    Presionar la opcion: ${PUERTO}
    Sleep    5
    [Teardown]    Close Browser
    
Zonas: INFORMATIVA
    [Documentation]    Valida que se muestren correctamente las zonas Tipo Informativa en el mapa
    [Tags]    Zonas: INFORMATIVA - T421
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Zonas
    Presionar la opcion: ${INFORMATIVA}
    Sleep    5
    [Teardown]    Close Browser
    
Zonas: DECRETO
    [Documentation]    Valida que se muestren correctamente las zonas Tipo Decreto en el mapa
    [Tags]    Zonas: DECRETO - T426
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Zonas
    Presionar la opcion: ${DECRETO}
    Sleep    5
    [Teardown]    Close Browser
    
Zonas: RESTRINGIDA
    [Documentation]    Valida que se muestren correctamente las zonas Tipo Restringida en el mapa
    [Tags]    Zonas: RESTRINGIDA - T422
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Zonas
    Presionar la opcion: ${RESTRINGIDA}
    Sleep    5
    [Teardown]    Close Browser
    
Zonas: PESCAPROHIBIDA
    [Documentation]    Valida que se muestren correctamente las zonas Tipo Pesca Prohibida en el mapa
    [Tags]    Zonas: PESCAPROHIBIDA - T424
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Zonas
    Presionar la opcion: ${PESCAPROHIBIDA}
    Sleep    5
    [Teardown]    Close Browser
    
*** Keywords ***
Presionar opcion Zonas
    Wait Until Element Is Visible    xpath=//*[@id="btnMenuZonas"]
    Click Element    xpath=//*[@id="btnMenuZonas"]
    
Validar etiquetas
    Wait Until Element Is Visible    xpath=//*[@id="ZonasDiv"]/div
    Element Text Should Be    xpath=//*[@id="ZonasDiv"]/div/div[1]/label    TODAS
    Element Text Should Be    xpath=//*[@id="ZonasDiv"]/div/div[2]/label    PUERTO
    Element Text Should Be    xpath=//*[@id="ZonasDiv"]/div/div[3]/label    INFORMATIVA
    Element Text Should Be    xpath=//*[@id="ZonasDiv"]/div/div[4]/label    ZONA DECRETO
    Element Text Should Be    xpath=//*[@id="ZonasDiv"]/div/div[5]/label    ZONA RESTRINGIDA
    Element Text Should Be    xpath=//*[@id="ZonasDiv"]/div/div[6]/label    ZONA DE PESCA PROHIBIDA

Contar No. de Zonas
    ${Ligas}=    Execute Javascript    return document.getElementsByClassName("dropdown-menu show")[0].getElementsByClassName("dropdown-item").length;
    Set Test Variable    ${Ligas}

Validar cantidad de zonas en BD
    Conexion a Base de datos
    @{queryResults}    Query    select count(Descripcion) from Sismep.TSismepTiposZonas where Activo = 1
    Should Be Equal    ${queryResults[0][0]}    ${Ligas}
    Disconnect From Database

Presionar la opcion: ${tipozona}
    Wait Until Element Is Visible    ${tipozona}
    Click Element    ${tipozona}
