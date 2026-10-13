*** Settings ***
Resource    Recursos.Reportes.robot

*** Variables ***
${urlBase}    http://54.219.63.18:90
${ReporteRuta}    xpath=//*[@id="divPanelControles"]/div[3]/div/a[1]
${ReporteArea}    xpath=//*[@id="divPanelControles"]/div[3]/div/a[2]
${ReporteAlertas}    xpath=//*[@id="divPanelControles"]/div[3]/div/a[3]
${ReporteDistanciaRecorrida}    xpath=//*[@id="divPanelControles"]/div[3]/div/a[4]
${RecreacionPosiciones}    xpath=//*[@id="divPanelControles"]/div[3]/div/a[5]
${BitacoraSistema}    xpath=//*[@id="divPanelControles"]/div[3]/div/a[6]
${EstatusTerminal}    xpath=//*[@id="divPanelControles"]/div[3]/div/a[7]
${ReportePresencia}    xpath=//*[@id="divPanelControles"]/div[3]/div/a[8]
${ReporteJustificacion}    xpath=//*[@id="divPanelControles"]/div[3]/div/a[9]
${selectRuta}     select Valor from Sismep.TSismepPermisos where IdPermiso='2F4E4EE7-AAC0-4998-884B-AA175FE795D2'
${selectArea}     select Valor from Sismep.TSismepPermisos where IdPermiso='3FAB55B0-02E4-4189-80DC-09D89A392294'
${selectAlertas}    select Valor from Sismep.TSismepPermisos where IdPermiso='6FDBEB34-5B0C-41A5-8407-48E4AD14A6BF'
${selectDistancia}    select Valor from Sismep.TSismepPermisos where IdPermiso='7276C3E3-A7FC-490C-92F8-C904B777524B'
${selectRecreacion}    select Valor from Sismep.TSismepPermisos where IdPermiso='84C157C2-F962-47E6-BF1E-0BA95647F940'
${selectPresencia}    select Valor from Sismep.TSismepPermisos where IdPermiso='B06CD910-A6D9-44B9-8737-9B71B4A4336E'
${selectJustificacion}    select Valor from Sismep.TSismepPermisos where IdPermiso='CA746E51-3D62-4903-B492-AC3EB69E55AA'
${selectBitacora}    select Valor from Sismep.TSismepPermisos where IdPermiso='10BDF953-209C-4292-B157-6706E9EF442E'
${selectTerminal}    select Valor from Sismep.TSismepPermisos where IdPermiso='A72EB71E-FBDF-4EF8-A4E8-AA7FF8C3EA89'
${titReporteRuta}    title=Sismep - Reporte de Ruta
${titReporteArea}    title=Sismep - Reporte de \u00C1rea
${titAlertas}     title=Sismep - Alertas
${titDistanciaRecorrida}    title= Sismep - Distancia Recorrida
${titRecreacion}    title=Sismep - Reporte de Recreaci\u00F3n Posiciones
${titReportePresencia}    title=Sismep - Alertas
${titJustificacion}    title=Sismep - Reporte de Justificaci\u00F3n

*** Test Cases ***
Reportes: Validar etiquetas
    [Documentation]    Valida que las etiquetas se encuentren correctamente escritas.
    [Tags]    Reportes: Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Sleep    1
    Validar etiquetas de la seccion Reportes
    [Teardown]    Close Browser

Reportes: Validar cantidad de ligas
    [Documentation]    Valida que las ligas mostradas sean las mismas que se tienen configuradas en la Base de datos.
    [Tags]    Reportes: Validar cantidad de ligas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Sleep    1
    Contar No. de ligas
    Validar cantidad de ligas en BD
    [Teardown]    Close Browser

Reportes: Reporte de Ruta
    [Documentation]    Valida que la liga del reporte de Ruta sea la correcta.
    [Tags]    Reportes: Reporte de Ruta
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar la opcion: ${ReporteRuta}
    Sleep    2
    Obtener la liga de la ventana emergente    ${titReporteRuta}
    Validar liga en BD    ${selectRuta}
    [Teardown]    Close Browser

Reportes: Reporte de Area
    [Documentation]    Valida que la liga del reporte de Area sea la correcta.
    [Tags]    Reportes: Reporte de Area
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar la opcion: ${ReporteArea}
    Sleep    2
    Obtener la liga de la ventana emergente    ${titReporteArea}
    Validar liga en BD    ${selectArea}
    [Teardown]    Close Browser

Reportes: Reporte de Alertas
    [Documentation]    Valida que la liga del reporte de Alertas sea la correcta.
    [Tags]    Reportes: Reporte de Alertas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar la opcion: ${ReporteAlertas}
    Sleep    2
    Obtener la liga de la ventana emergente    ${titAlertas}
    Validar liga en BD     ${selectAlertas}
    [Teardown]    Close Browser

Reportes: Reporte de Distancia Recorrida
    [Documentation]    Valida que la liga del reporte de Distancia recorrida sea la correcta.
    [Tags]    Reportes: Reporte de Distancia Recorrida
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar la opcion: ${ReporteDistanciaRecorrida}
    Sleep    2
    Obtener la liga de la ventana emergente    ${titDistanciaRecorrida}
    Validar liga en BD    ${selectDistancia}
    [Teardown]    Close Browser

Reportes: Recreacion de posiciones
    [Documentation]    Valida que la liga del reporte de Recreacion de posiciones sea la correcta.
    [Tags]    Reportes: Recreacion de posiciones
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar la opcion: ${RecreacionPosiciones}
    Sleep    2
    Obtener la liga de la ventana emergente    ${titRecreacion}
    Validar liga en BD    ${selectRecreacion}
    [Teardown]    Close Browser

Reportes: Reporte de Presencia
    [Documentation]    Valida que la liga del reporte de Presencia sea la correcta.
    [Tags]    Reportes: Reporte de Presencia
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar la opcion: ${ReportePresencia}
    Sleep    2
    Obtener la liga de la ventana emergente    ${titReportePresencia}
    Validar liga en BD    ${selectPresencia}
    [Teardown]    Close Browser

Reportes: Reporte de Justificacion
    [Documentation]    Valida que la liga del reporte de Justificacion sea la correcta.
    [Tags]    Reportes: Reporte de Justificacion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar la opcion: ${ReporteJustificacion}
    Sleep    2
    Obtener la liga de la ventana emergente    ${titJustificacion}
    Validar liga en BD    ${selectJustificacion}
    [Teardown]    Close Browser

*** Keywords ***
Validar etiquetas de la seccion Reportes
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/div[3]/div/a[1]
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[3]/div/a[1]    Reporte de Ruta
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[3]/div/a[2]    Reporte de Area
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[3]/div/a[3]    Reporte de Alertas
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[3]/div/a[4]    Reporte de Distancia Recorrida
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[3]/div/a[5]    Recreación de posiciones
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[3]/div/a[6]    Bitacora Sistema
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[3]/div/a[7]    Estatus de Terminal
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[3]/div/a[8]    Reporte Presencia
    Element Text Should Be    xpath=//*[@id="divPanelControles"]/div[3]/div/a[9]    Reporte de Justificación

Contar No. de ligas
    ${Ligas}=    Execute Javascript    return document.getElementsByClassName("dropdown-menu show")[0].getElementsByClassName("dropdown-item").length;
    Set Test Variable    ${Ligas}

Validar cantidad de ligas en BD
    Conexion a Base de datos
    @{queryResults}    Query    select COUNT(*) from Sismep.TSismepPermisos where IdTipoPermiso='667F026E-9E5E-43BE-9C74-7886B5A87668'
    Should Be Equal    ${queryResults[0][0]}    ${Ligas}
    Disconnect From Database

Presionar la opcion: ${LIGA}
    Wait Until Element Is Visible    ${LIGA}
    Click Element    ${LIGA}

Obtener la liga de la ventana emergente
    [Arguments]    ${arg1}
    Switch Window    ${arg1}
    ${url}=    Get Location
    ${str}=    Execute JavaScript    var str= "${url}"; str=str.replace("${urlBase}","~"); return str;
    Set Test Variable    ${str}
    
Validar liga en BD
    [Arguments]    ${arg1}
    Conexion a Base de datos
    @{queryResults}=    Query    ${arg1}
    Should Be Equal    ${queryResults[0][0]}    ${str}
    Disconnect From Database