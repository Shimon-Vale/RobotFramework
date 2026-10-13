*** Settings ***
Resource    ../../Recursos.Generales.robot

*** Variables ***
${horasUTC}    7
${Decimal}    xpath=//*[@id="rdP_Decimal"]
${DMS}    xpath=//*[@id="rdP_DMS"]
${KPH}    xpath=//*[@id="rdV_KPH"]
${MPH}    xpath=//*[@id="rdV_MPH"]
${Nudos}    xpath=//*[@id="rdV_Nudos"]
${DstKilometros}    xpath=//*[@id="rdD_Km"]
${DstMillas}    xpath=//*[@id="rdD_Mi"]
${DstNudos}    xpath=//*[@id="rdD_Nu"]
${JSLatitudDMS}    function LatitudDMS(latitud) {var absoluto = Math.abs(latitud); var grados = Math.floor(absoluto); var minutosnotruncados = (absoluto - grados) * 60; var minutos = Math.floor(minutosnotruncados); var segundos = Math.round((minutosnotruncados - minutos) * 60); var direccion = latitud >= 0 ? "N" : "S"; return grados + "\u00B0 " + minutos + "' " + segundos + '\u0022 ' + direccion;};
${JSLongitudDMS}    function LongitudDMS(longitud) {var absoluto = Math.abs(longitud); var grados = Math.floor(absoluto); var minutosnotruncados = (absoluto - grados) * 60; var minutos = Math.floor(minutosnotruncados); var segundos = Math.round((minutosnotruncados - minutos) * 60); var direccion = longitud >= 0 ? "E" : "W"; return grados + "\u00B0 " + minutos + "' " + segundos + '\u0022 ' + direccion;};

*** Keywords ***
Presionar opcion Reportes
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/div[3]
    Click Element    xpath=//*[@id="divPanelControles"]/div[3]
    
Configurar posicion
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    //*[@id="btnConfiguracion"]/span
    Click Element    xpath=//*[@id="btnConfiguracion"]
    Wait Until Element Is Visible    xpath=//*[@id="btnConfiguracion"]/ul/li[1]
    Mouse Over    xpath=//*[@id="btnConfiguracion"]/ul/li[1]
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}
    Click Element    xpath=//*[@id="btnConfiguracion"]

Configurar Velocidad
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    //*[@id="btnConfiguracion"]/span
    Click Element    xpath=//*[@id="btnConfiguracion"]
    Wait Until Element Is Visible    xpath=//*[@id="btnConfiguracion"]/ul/li[2]
    Mouse Over    xpath=//*[@id="btnConfiguracion"]/ul/li[2]
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}
    Click Element    xpath=//*[@id="btnConfiguracion"]

Configurar Distancia
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    //*[@id="btnConfiguracion"]/span
    Click Element    xpath=//*[@id="btnConfiguracion"]
    Wait Until Element Is Visible    xpath=//*[@id="btnConfiguracion"]/ul/li[3]
    Mouse Over    xpath=//*[@id="btnConfiguracion"]/ul/li[3]
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}
    Click Element    xpath=//*[@id="btnConfiguracion"]

Desplegar menu contextual de Embarcacion (clic izquierdo)
    Execute JavaScript    document.evaluate('//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[3]/div[1]/img',document.body,null,9,null).singleNodeValue.click();
    
Obtener datos de la Embarcacion
    ${Nombre}=    Get Text    xpath=//*[@id="toolBarData"]/div/div[2]/div[2]/span
    ${RNP}=    Get Text    xpath=//*[@id="toolBarData"]/div/div[3]/div[2]/span
    ${Matricula}=    Get Text    xpath=//*[@id="toolBarData"]/div/div[4]/div[2]/span
    Set Test Variable    ${Nombre}
    Set Test Variable    ${RNP}
    Set Test Variable    ${Matricula}
    
Validar etiquetas - Menu contextual (clic izquierdo)
    [Arguments]    ${nomEmb}
    Wait Until Element Is Visible    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2    ${nomEmb}
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[2]/td[1]/b    RNP:
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[3]/td[1]/b    Matr\u00EDcula:
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[4]/td[1]/b    Latitud:
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[5]/td[1]/b    Longitud:
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[6]/td[1]/b    Velocidad:
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[7]/td[1]/b    Rumbo:
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[8]/td[1]/b    Ultimo reporte:
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[9]/td[1]/b    Puerto base:

Obtener datos de la Embarcacion - Contextual - Default
    ${Nombre}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2
    ${RNP}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[2]/td[2]
    ${Matricula}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[3]/td[2]
    ${Latitud}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[4]/td[2]
    ${Longitud}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[5]/td[2]
    ${Velocidad}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[6]/td[2]
    ${Rumbo}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[7]/td[2]
    ${UltimoReporte}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[8]/td[2]
    ${PuertoBase}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[9]/td[2]
    Set Test Variable    ${Nombre}
    Set Test Variable    ${RNP}
    Set Test Variable    ${Matricula}
    Set Test Variable    ${Latitud}
    Set Test Variable    ${Longitud}
    Set Test Variable    ${Velocidad}
    Set Test Variable    ${Rumbo}
    Set Test Variable    ${UltimoReporte}
    Set Test Variable    ${PuertoBase}

Obtener datos de la Embarcacion - Contextual - Decimal
    ${Nombre}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2
    ${RNP}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[2]/td[2]
    ${Matricula}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[3]/td[2]
    ${Lat}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[4]/td[2]
    ${Latitud}=    Convert to Number    ${Lat}
    ${Lon}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[5]/td[2]
    ${Longitud}=    Convert to Number    ${Lon}
    ${Velocidad}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[6]/td[2]
    ${Rumbo}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[7]/td[2]
    ${UltimoReporte}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[8]/td[2]
    ${PuertoBase}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[9]/td[2]
    Set Test Variable    ${Nombre}
    Set Test Variable    ${RNP}
    Set Test Variable    ${Matricula}
    Set Test Variable    ${Latitud}
    Set Test Variable    ${Longitud}
    Set Test Variable    ${Velocidad}
    Set Test Variable    ${Rumbo}
    Set Test Variable    ${UltimoReporte}
    Set Test Variable    ${PuertoBase}
    
Seleccionar opcion Nueva Consulta
    Click Element    //*[@id="btnBack"]
    
Validar retorno a ventana de Consulta
    Wait Until Element Is Visible    xpath=//*[@id="validate"]/div/span
    Element Should Be Visible    xpath=//*[@id="validate"]/div/span
    
Seleccionar opcion Zonas
    Click Element    //*[@id="btnZonas"]
    
Validar zonas activadas
    ${atrZonas}=    Get Element Attribute    xpath=//*[@id="btnZonas"]    value
    Should be equal    ${atrZonas}    true
    
Seleccionar opcion Nautica
    Click Element    //*[@id="btnNautica"]
    
Validar nautica activada
    ${atrNautica}=    Get Element Attribute    xpath=//*[@id="btnNautica"]    value
    Should be equal    ${atrNautica}    true
    
Seleccionar opcion Distancia
    Wait Until Element Is Visible    //*[@id="btnDistancia"]
    Click Element    //*[@id="btnDistancia"]
    
Validar distancia activada
    [Arguments]    ${arg1}
    ${div}=    Execute JavaScript    return document.querySelector("#map-canvas > div > div > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(3)").childElementCount-1;
    ${atrDistancia}=    Get Element Attribute    xpath=//*[@id="btnDistancia"]    value
    Should be equal    ${atrDistancia}    true
    Execute JavaScript    document.evaluate('//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[3]/div[${div}]/img',document.body,null,9,null).singleNodeValue.click();
    Wait Until Element Is Visible    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[1]/div[2]/div[2]/span
    ${etq}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[1]/div[2]/div[2]/span
    Should Contain    ${etq}    ${arg1}

Seleccionar opcion Tabular
    Wait Until Element Is Visible    xpath=//*[@id="btnTabular"]
    Click Element    xpath=//*[@id="btnTabular"]
    Sleep    2
    Select Frame    xpath=//*[@id="iRepTabular"]
    Wait Until Element Is Visible    xpath=//*[@id="divtable"]/table    timeout=90
    ${date24h}    Get Current Date    result_format=%d/%m/%Y %H:%M
    Set Test Variable    ${date24h}

Presionar boton Exportar a Excel
    [Arguments]    ${id}=menu
    Wait Until Element Is Visible    xpath=//*[@id="${id}"]/div[2]/button
    Click Element    xpath=//*[@id="${id}"]/div[2]/button

Validar archivo de Excel generado
    [Arguments]    ${rutaReporte}
    File Should Exist   ${rutaReporte}

Presionar boton Imprimir
    [Arguments]    ${id}=menu
    Wait Until Element Is Visible    xpath=//*[@id="${id}"]/div[3]/button
    Click Element    xpath=//*[@id="${id}"]/div[3]/button

Validar ventana de impresion
    Wait Until Element Is Visible    xpath=//*[@id="sidebar"]//print-preview-button-strip//div/cr-button[1]
    Element Should Be Visible    xpath=//*[@id="plugin"]
    
Presionar boton Regresar
    [Arguments]    ${id}=menu
    Wait Until Element Is Visible    xpath=//*[@id="${id}"]/div[4]/button
    Click Element    xpath=//*[@id="${id}"]/div[4]/button

Validar retorno a ventana Vista Mapa
    Unselect Frame
    Element Should Be Visible    xpath=//*[@id="toolBar"]

Validar mensaje
    [Arguments]    ${div}    ${msg}
    Wait Until Element Is Visible    xpath=/html/body/div[${div}]/div/div
    Element Text Should Be    xpath=/html/body/div[${div}]/div/div/div[2]    ${msg}