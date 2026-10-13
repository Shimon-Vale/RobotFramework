*** Settings ***
Resource    ../../Recursos.Generales.robot

*** Variables ***
${SMN}            xpath=//*[@id="divPanelControles"]/div[1]/div/a[1]
${SCT}          xpath=//*[@id="divPanelControles"]/div[1]/div/a[2]
${AIS}            xpath=//*[@id="divPanelControles"]/div[1]/div/a[3]
${PM}             xpath=//*[@id="divPanelControles"]/div[1]/div/a[4]
${SOAP}           xpath=//*[@id="divPanelControles"]/div[1]/div/a[5]
${Sipesca}        xpath=//*[@id="divPanelControles"]/div[1]/div/a[6]
${LG}             xpath=//*[@id="divPanelControles"]/div[1]/div/a[7]
${SEMAR}          xpath=//*[@id="divPanelControles"]/div[1]/div/a[8]
${MSW}            xpath=//*[@id="divPanelControles"]/div[1]/div/a[9]
${MMA}            xpath=//*[@id="divPanelControles"]/div[1]/div/a[10]
${titSMN}         title= Servicio Meteorológico Nacional
${titSCT}         title= Secretaria de Comunicaciones y Transportes: Boletines Meteorológicos
${titAIS}         title= MarineTraffic: Global Ship Tracking Intelligence | AIS Marine Traffic
${titPM}         title= Sistema de Monitoreo Satelital de Embarcaciones Pesqueras
${titSOAP}        title= CONAPESCA - Sistema de Operación Acuícola y Pesquero
${titSipesca}     title= SIPESCA | Login
${titLG}    title= undefined
${titSEMAR}    title= undefined
${titMSW}    title= undefined
${titMMA}    title= undefined
${selectSMN}      Select Descripcion, Valor from Sismep.TSismepPermisos where IdPermiso = '22613187-DFC3-4583-95C3-8E3FDCF084DE'
${selectSCT}      Select Descripcion, Valor from Sismep.TSismepPermisos where IdPermiso = 'AABDEFE7-F459-4D25-BEE1-D4E77C2E9823'
${selectAIS}      Select Descripcion, Valor from Sismep.TSismepPermisos where IdPermiso = 'F529840C-F150-42A7-9BCF-1038C5552CFD'
${selectPM}      Select Descripcion, Valor from Sismep.TSismepPermisos where IdPermiso = 'DE87EB9D-4282-499F-A054-3CAA94031F34'
${selectSOAP}     Select Descripcion, Valor from Sismep.TSismepPermisos where IdPermiso = '2CA00FFA-4EE2-434A-831F-72DEEEE457E3'
${selectSipesca}    Select Descripcion, Valor from Sismep.TSismepPermisos where IdPermiso = '2A38C9C1-2DEA-4789-8321-4A03874E2FAD'
${selectLG}       Select Descripcion, Valor from Sismep.TSismepPermisos where IdPermiso = '0B968301-F89D-4202-AC1D-1B4E25EED55D'
${selectSEMAR}    Select Descripcion, Valor from Sismep.TSismepPermisos where IdPermiso = '600BE3FC-9F0B-4472-8B8C-D4DE7FE4CE87'
${selectMSW}      Select Descripcion, Valor from Sismep.TSismepPermisos where IdPermiso = '15D6BEDB-0318-49E6-A198-7A8DBCA34638'
${selectMMA}      Select Descripcion, Valor from Sismep.TSismepPermisos where IdPermiso = 'B3100A0E-0867-4DA1-95E2-19B3D1295B1D'


*** Test Cases ***
Accesos: Validar etiquetas
    [Documentation]    Valida que se muestren correctamente
        ...    escritas las etiquetas.
    [Tags]    Accesos: Validar etiquetas 
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Accesos
    Validar etiquetas y tooltips
    [Teardown]    Close Browser

Accesos: Cantidad de ligas
    [Documentation]    Valida que la cantidad de ligas 
        ...    mostradas concuerden con la Base de datos.
    [Tags]    Accesos: Cantidad de ligas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Accesos
    Sleep    2
    Contar No. de ligas mostradas
    Validar cantidad de ligas en BD
    [Teardown]    Close Browser

Accesos: Servicio Meteorologico Nacional
    [Documentation]    Debera ingresar correctamente a la liga y
        ...     validar que coincidan con la almacenada en BD.
    [Tags]    Accesos: Servicio Meteorologico Nacional - T451
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Accesos
    Sleep    1
    Presionar la opcion: ${SMN}
    Sleep    2
    Obtener liga de la ventana emergente    ${titSMN}
    Validar liga en BD    ${selectSMN}
    [Teardown]    Close Browser

Accesos: Boletin Meteorologico SCT
    [Documentation]    Debera ingresar correctamente a la liga y
        ...     validar que coincidan con la almacenada en BD.
    [Tags]    Accesos: Boletin Meteorologico SCT - T452
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Accesos
    Sleep    1
    Presionar la opcion: ${SCT}
    Sleep    2
    Obtener liga de la ventana emergente    ${titSCT}
    Validar liga en BD    ${selectSCT}
    [Teardown]    Close Browser

Accesos: Trafico maritimo AIS
    [Documentation]    Debera ingresar correctamente a la liga y
        ...     validar que coincidan con la almacenada en BD.
    [Tags]    Accesos: Trafico maritimo AIS - T453
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Accesos
    Sleep    1
    Presionar la opcion: ${AIS}
    Sleep    2
    Obtener liga de la ventana emergente    ${titAIS}
    Validar liga en BD    ${selectAIS}
    [Teardown]    Close Browser

Accesos: Pagina de monitoreo
    [Documentation]    Debera ingresar correctamente a la liga y
        ...     validar que coincidan con la almacenada en BD.
    [Tags]    Accesos: Pagina de monitoreo - T455
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Accesos
    Sleep    1
    Presionar la opcion: ${PM}
    Sleep    2
    Obtener liga de la ventana emergente    ${titPM}
    Validar liga en BD    ${selectPM}
    [Teardown]    Close Browser

Accesos: SOAP
    [Documentation]    Debera ingresar correctamente a la liga y
        ...     validar que coincidan con la almacenada en BD.
    [Tags]    Accesos: SOAP - T456
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Accesos
    Sleep    1
    Presionar la opcion: ${SOAP}
    Sleep    2
    Obtener liga de la ventana emergente    ${titSOAP}
    Validar liga en BD    ${selectSOAP}
    [Teardown]    Close Browser

Accesos: Sipesca
    [Documentation]    Debera ingresar correctamente a la liga y
        ...     validar que coincidan con la almacenada en BD.
    [Tags]    Accesos: Sipesca - T457
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Accesos
    Sleep    1
    Presionar la opcion: ${Sipesca}
    Sleep    2
    Obtener liga de la ventana emergente    ${titSipesca}
    Validar liga en BD    ${selectSipesca}
    [Teardown]    Close Browser

Accesos: Licencia Google
    [Documentation]    Debera ingresar correctamente a la liga y
        ...     validar que coincidan con la almacenada en BD.
    [Tags]    Accesos: Licencia Google - T459
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Accesos
    Sleep    1
    Presionar la opcion: ${LG}
    Sleep    2
    Obtener liga de la ventana emergente    ${titLG}
    Validar liga en BD    ${selectLG}
    [Teardown]    Close Browser

Accesos: Licencia Nautica SEMAR
    [Documentation]    Debera ingresar correctamente a la liga y
        ...     validar que coincidan con la almacenada en BD.
    [Tags]    Accesos: Licencia Nautica SEMAR - T460
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Accesos
    Sleep    1
    Presionar la opcion: ${SEMAR}
    Sleep    2
    Obtener liga de la ventana emergente    ${titSEMAR}
    Validar liga en BD    ${selectSEMAR}
    [Teardown]    Close Browser

Accesos: Manual Sismep Web
    [Documentation]    Debera ingresar correctamente a la liga y
        ...     validar que coincidan con la almacenada en BD.
    [Tags]    Accesos: Manual Sismep Web - T461
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Accesos
    Sleep    1
    Presionar la opcion: ${MSW}
    Sleep    2
    Obtener liga de la ventana emergente    ${titMSW}
    Validar liga en BD    ${selectMSW}
    [Teardown]    Close Browser

Accesos: Manual modulo administrativo
    [Documentation]    Debera ingresar correctamente a la liga y
        ...     validar que coincidan con la almacenada en BD.
    [Tags]    Accesos: Manual modulo administrativo - T462
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Accesos
    Sleep    1
    Presionar la opcion: ${MMA}
    Sleep    2
    Obtener liga de la ventana emergente    ${titMMA}
    Validar liga en BD    ${selectMMA}
    [Teardown]    Close Browser

*** Keywords ***
Presionar opcion Accesos
    Wait Until Element Is Visible    xpath=//*[@id="btnMenuLigas"]
    Click Element    xpath=//*[@id="btnMenuLigas"]
    
Validar etiquetas y tooltips
    ${Accesos}=    Execute Javascript    return document.getElementsByClassName("dropdown btn-monitor-url-div")[0].getAttribute("title")
    Should Be Equal As Strings    ${Accesos}    Accesos
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[1]/div/a[1]    Servicio Meteorologico Nacional
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[1]/div/a[2]    Boletin Meteorologico SCT
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[1]/div/a[3]    Trafico Maritimo AIS
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[1]/div/a[4]    Pagina de monitoreo
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[1]/div/a[5]    SOAP
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[1]/div/a[6]    Sipesca
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[1]/div/a[7]    Licencia Google
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[1]/div/a[8]    Licencia Nautica SEMAR
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[1]/div/a[9]    Manual Sismep Web
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[1]/div/a[10]    Manual Modulo administrativo

Validar cantidad de ligas en BD
    Conexion a Base de datos
    @{queryResults}    Query    select COUNT(*) from Sismep.TSismepPermisos where IdTipoPermiso = 'AD596D65-7D09-427C-B3F7-FE27B06A71A6' and Activo = 1
    Should Be Equal    ${queryResults[0][0]}    ${Ligas}
    Disconnect From Database

Contar No. de ligas mostradas
    ${Ligas}=    Execute Javascript    return document.getElementsByClassName("dropdown-menu show")[0].getElementsByClassName("dropdown-item").length;
    Set Test Variable    ${Ligas}

Presionar la opcion: ${LIGA}
    Wait Until Element Is Visible    ${LIGA}
    ${descripcion}=    Get text    ${LIGA}
    Click Element    ${LIGA}
    Set Test Variable    ${descripcion}

Validar liga en BD
    [Arguments]    ${arg1}
    Conexion a Base de datos
    @{queryResults}=    Query    ${arg1}
    Should Be Equal    ${queryResults[0][0]}    ${descripcion}
    Should Be Equal    ${queryResults[0][1]}    ${url}
    Disconnect From Database

Obtener liga de la ventana emergente
    [Arguments]    ${arg1}
    #Select Window    ${arg1}
    Switch Window    ${arg1}
    ${url}=    Get Location
    Set Test Variable    ${url}