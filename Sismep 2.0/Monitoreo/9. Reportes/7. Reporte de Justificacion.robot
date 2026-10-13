*** Settings ***
Resource    Recursos.Reportes.robot

*** Variables ***
${titJustificacion}    title=Sismep - Reporte de Justificaci\u00F3n
${DescargaReporte}   C:/Users/mmorales/Downloads/Reporte.xlsx
${Decimal}    xpath=//*[@id="rdP_Decimal"]

*** Test Cases ***
Reporte de Justificacion: Validar etiquetas
    [Documentation]    Valida que se muestren correctamente escritas las etiquetas.
    [Tags]    Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Justificacion
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser

Reporte de Justificacion: Consultar
    [Documentation]    Valida que se muestren correctamente los resultados de la consulta.
    [Tags]    Consultar - T610
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Justificacion
    Sleep    1
    Presionar opcion Consultar
    [Teardown]    Close Browser

Reporte de Justificacion: Consultar - Validar etiquetas en tabular
    [Documentation]    Valida que se muestren correctamente escritas las etiquetas del tabular.
    [Tags]    Consultar - Validar etiquetas en tabular
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Justificacion
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar etiquetas en Tabular
    [Teardown]    Close Browser
    
Reporte de Justificacion: Consultar - Validar informacion en BD del Tabular
    [Documentation]    Valida que la informacion se muestre correctamente
        ...    contra la base de datos.
    [Tags]    Validar informacion en BD del Tabular
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Justificacion
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar informacion en BD del Tabular
    [Teardown]    Close Browser
    
Reporte de Justificacion: Exportar a Excel
    [Documentation]    Valida que se exporte correctamente el archivo Excel.
    [Tags]    Exportar a Excel - T611
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Justificacion
    Sleep    1
    Presionar opcion Consultar
    Presionar boton Exportar a Excel
    Sleep    5
    Validar archivo de Excel generado    ${DescargaReporte}
    [Teardown]    Close Browser

#Reporte de Justificacion: Imprimir
    #Iniciar sesion
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte de Justificacion
    #Sleep    1
    #Presionar opcion Consultar
    #Presionar boton Imprimir
    #Sleep    2
    #Validar ventana de Impresion
    #[Teardown]    Close Browser

Reporte de Justificacion: Nueva Consulta
    [Documentation]    Valida que permita regresar a realizar una Nueva Consulta.
    [Tags]    Nueva Consulta - T1070
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Justificacion
    Sleep    1
    Presionar opcion Consultar
    Presionar boton Regresar    form1
    Sleep    2
    Validar retorno a ventana Consulta
    [Teardown]    Close Browser
    
Reporte de Justificacion: Posicion Decimal
    [Documentation]    Valida que se muestre correctamente la configuracion
        ...    de Posicion en Decimal en el tabular.
    [Tags]    Posicion Decimal - T612
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Justificacion
    Sleep    1
    Configurar posicion    ${Decimal}
    Sleep    1
    Presionar opcion Consultar
    [Teardown]    Close Browser

*** Keywords ***
Presionar opcion Reporte de Justificacion
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/div[3]/div/a[9]
    Click Element    xpath=//*[@id="divPanelControles"]/div[3]/div/a[9]
    Sleep    1
    Switch Window    ${titJustificacion}
    Maximize Browser Window

Presionar opcion Consultar
    Click Element    xpath=//*[@id="bConsultar"]/div
    Sleep    1
    Select Frame    //*[@id="iRepTabular"]
    Wait Until Element Is Visible    xpath=//*[@id="divtable"]    timeout=60

Validar etiquetas
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/h3    Reporte de Justificación
    Element Text Should Be    xpath=//*[@id="bConsultar"]/div/span    Consultar
    Element Text Should Be    xpath=//*[@id="bConfigura"]/div/span    Configuraci\u00F3n

# Presionar boton Regresar
#     Wait Until Element Is Visible    xpath=//*[@id="form1"]/div[4]/button
#     Click Element    xpath=//*[@id="form1"]/div[4]/button

Presionar boton Exportar a Excel
    Wait Until Element Is Visible    xpath=//*[@id="btnExportar"]
    Click Element    xpath=//*[@id="btnExportar"]

# Validar archivo de Excel generado
#     File Should Exist    ${DescargaReporte}

Presionar boton Imprimir
    Wait Until Element Is Visible    xpath=//*[@id="btnPrint"]
    Click Element    xpath=//*[@id="btnPrint"]

# Validar ventana de impresion
#     Wait Until Element Is Visible    xpath=//*[@id="sidebar"]//print-preview-button-strip//div/cr-button[1]
#     Element Should Be Visible    xpath=//*[@id="plugin"]

Validar retorno a ventana Consulta
    Unselect Frame
    Element Should Be Visible    xpath=//*[@id="bConsultar"]/div

Configurar posicion
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    xpath=//*[@id="bConfigura"]
    Click Element    xpath=//*[@id="bConfigura"]
    Wait Until Element Is Visible    xpath=//*[@id="bConfigura"]/div/ul/li/a
    Mouse Over    xpath=//*[@id="bConfigura"]/div/ul/li/a
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}

Validar etiquetas en Tabular
    ${ttExcel}=    Get Element Attribute    xpath=//*[@id="btnExportar"]    title
    ${ttImprimir}=    Get Element Attribute    xpath=//*[@id="btnPrint"]    title
    ${ttRegresar}=    Get Element Attribute    xpath=//*[@id="form1"]/div[4]/button    title
    Should be equal    ${ttExcel}    Exportar a Excel
    Should be equal    ${ttImprimir}    Imprimir
    Should be equal    ${ttRegresar}    Regresar
    Element Text Should Be    //*[@id="headerRigth"]/h2/span    conapesca.gob.mx
    Element Text Should Be    //*[@id="banner"]/h3/span    Sistema de Localizaci\u00F3n y Monitoreo de Embarcaciones Pesqueras
    Element Text Should Be    //*[@id="main"]/div[2]/h3/span    Reporte de Justificaci\u00F3n
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[1]    Embarcacion
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[2]    Matricula
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[3]    Razon Social
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[4]    UltimaTx
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[5]    Latitud
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[6]    Longitud
    Element Text Should Be    //*[@id="pBottom"]/span    Comisi\u00F3n Nacional de Acuacultura y Pesca, M\u00E9xico - Algunos derechos reservados \u00A9 2014
    Element Text Should Be    //*[@id="pTop"]/span    Av. Camar\u00F3n S\u00E1balo S/N Esq. Tibur\u00F3n, Fracc. S\u00E1balo Country Club, C.P. 82100 Mazatl\u00E1n, Sin. Mex. Tel. 01-800-6674-022
    
Validar informacion en BD del Tabular
    Conexion a Base de Datos
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table > tbody").rows.length -1;
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepVehiculos v join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo where v.Anio = 1
    Should be equal    ${queryRows[0][0]}    ${rows}
    ${Embarcacion}    Get Text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[1]
    ${Matricula}    Get Text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[2]
    ${RazonSocial}    Get Text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[3]
    ${UltimaTx}=    Get Text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[4]
    ${Latitud}=    Get Text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[5]
    ${Longitud}=    Get Text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[6]
    @{queryResults}    Query    select v.Nombre, v.Matricula, rs.Descripcion, FORMAT(DATEADD(HH, -${horasUTC}, mf.FechaRecepcionUnitrac),'dd/MM/yyyy HH:mm:ss', 'es-mx'), mf.Latitud, mf.Longitud from Sismep.TSismepVehiculos v join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo where v.Anio = 1 and v.Nombre = '${Embarcacion}'
    ${LatitudBD}=    Execute Javascript    ${JSLatitudDMS} return LatitudDMS(${queryResults[0][4]});
    ${LongitudBD}=    Execute Javascript    ${JSLongitudDMS} return LongitudDMS(${queryResults[0][5]});
    Should be equal    ${queryResults[0][0]}    ${Embarcacion}
    Should be equal    ${queryResults[0][1]}    ${Matricula}
    Should be equal    ${queryResults[0][2]}    ${RazonSocial}
    Should be equal    ${queryResults[0][3]}    ${UltimaTx}
    Should be equal    ${LatitudBD}    ${Latitud}
    Should be equal    ${LongitudBD}    ${Longitud}
    Disconnect From Database