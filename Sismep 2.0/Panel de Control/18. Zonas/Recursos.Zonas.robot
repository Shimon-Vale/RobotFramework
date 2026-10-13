*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
${RegistroExistente}    Habana Cuba
${xpathGridBody}    //*[@id="gridZonas"]/div/div[6]/div/div/div[1]/div/table/tbody
${queryZona}    SELECT Descripcion FROM [Sismep].[TSismepZonas] WHERE Descripcion=
${queryNorma}    SELECT Norma FROM [Sismep].[TSismepZonas] WHERE Descripcion=

*** Keywords ***
Ingresar a opcion Zona
    Deslizar scroll hacia abajo
    Click Element    xpath=//*[@id="divMenuList"]/a[20]
    Wait Until Element Is Not Visible    xpath=//*[@id="gridZonas"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="gridZonas"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30
    
Seleccionar Tipo de Zona
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="gen_ddlTipoZona"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Seleccionar Punto de Interes
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="gen_ddlPuntosInteres"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Presionar opcion Guardar
    Click Element    id=gen_btnZonaGaurdar
    
Presionar opcion Cancelar
    Click Element    xpath=//*[@id="tabEditarZona"]/div[8]/div/div[2]
    
Obtener Nombre de la Zona
    ${Zona}=    Get Value    xpath=//*[@id="gen_txtNombre"]/div/div[1]/input
    Set Test Variable    ${Zona}

Obtener datos del formulario
    ${Zona}=    Get Value    xpath=//*[@id="gen_txtNombre"]/div/div[1]/input
    ${Norma}=    Get Value    xpath=//*[@id="gen_txtNorma"]/div/div[1]/input
    ${TipodeZona}=    Get Value    xpath=//*[@id="gen_ddlTipoZona"]/div[1]/div/div[1]/input
    ${Pti}=    GetValue    xpath=//*[@id="gen_ddlPuntosInteres"]/div[1]/div/div[1]/input
    ${PuntoInteres}=    Execute JavaScript    if('${Pti}'==''){return null}else{return'${Pti}'};
    Set Test Variable    ${Zona}
    Set Test Variable    ${Norma}
    Set Test Variable    ${TipodeZona}
    Set Test Variable    ${PuntoInteres}

Validar registro en BD
    [Arguments]    ${Activo}=1
    Obtener datos del formulario
    Conexion a Base de Datos
    @{queryResults}    Query    select z.Descripcion, z.Norma, z.Color, tz.Descripcion, pti.Descripcion from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona left join Sismep.TSismepPuntosInteres pti on z.IdPuntoInteres = pti.IdPuntoInteres where z.Descripcion = '${Zona}' and z.Activo = ${Activo} order by z.Descripcion
    Should Be Equal    ${queryResults[0][0]}    ${Zona}
    Should Be Equal    ${queryResults[0][1]}    ${Norma}
    Should Be Equal    ${queryResults[0][3]}    ${TipodeZona}
    Should Be Equal    ${queryResults[0][4]}    ${PuntoInteres}
    Disconnect From Database
    
Validar registro inexistente en BD
    [Arguments]    ${desc}
    Conexion a Base de Datos
    Check If Not Exists In Database    select z.Descripcion, z.Norma, z.Color, tz.Descripcion, pti.Descripcion from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona left join Sismep.TSismepPuntosInteres pti on z.IdPuntoInteres = pti.IdPuntoInteres where z.Descripcion = '${desc}' and z.Activo = 1
    Disconnect From Database
    
Seleccionar Tipo de Carga
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="ltc_ddlTipoCarga"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Ingresar fecha inicio y fecha fin
    Click Element    //*[@id="ltc_dtpFechaInicio"]/div[1]/div/div[2]/div[2]
    Sleep    1
    Execute Javascript    document.evaluate('/html/body/div[4]/div/div/div/div[1]/div/div[1]/table/tbody/tr[1]/td[1]',document.body,null,9,null).singleNodeValue.click();
    Sleep    1
    Click Element    //*[@id="ltc_dtpFechaFin"]/div[1]/div/div[2]/div[2]
    Sleep    1
    Execute Javascript    document.evaluate('/html/body/div[4]/div/div/div/div[1]/div/div[1]/table/tbody/tr[4]/td[7]',document.body,null,9,null).singleNodeValue.click();
    
Ingresar fecha inicio mayor a fecha fin
    Click Element    //*[@id="ltc_dtpFechaInicio"]/div[1]/div/div[2]/div[2]
    Sleep    1
    Execute Javascript    document.evaluate('/html/body/div[4]/div/div/div/div[1]/div/div[1]/table/tbody/tr[4]/td[7]',document.body,null,9,null).singleNodeValue.click();
    Sleep    1
    Click Element    //*[@id="ltc_dtpFechaFin"]/div[1]/div/div[2]/div[2]
    Sleep    1
    Execute Javascript    document.evaluate('/html/body/div[4]/div/div/div/div[1]/div/div[1]/table/tbody/tr[1]/td[1]',document.body,null,9,null).singleNodeValue.click();
    
Presionar opcion Agregar
    Click Element    xpath=//*[@id="tabListas"]/div[2]/div[3]/div
    
Validar Nueva lista en BD
    Obtener Tipo de Carga del Grid
    Conexion a Base de Datos
    @{queryResults}    Query    select z.Descripcion, tc.Descripcion, zl.FechaInicial, zl.FechaFinal from Sismep.TSismepZonasListas zl join Sismep.TSismepZonas z on zl.IdZona = z.IdZona join Sismep.TSismepTiposCarga tc on zl.IdTipoCarga = tc.IdTipoCarga where z.Descripcion = '${Zona}' and tc.Descripcion = '${TipodeCarga}'
    Should Be Equal    ${queryResults[0][0]}    ${Zona}
    Should Be Equal    ${queryResults[0][1]}    ${TipodeCarga}
    Disconnect From Database
    
Obtener Tipo de Carga del Grid
    ${TipodeCarga}    Get Text    xpath=//*[@id="ltc_dataGirdListas"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    Set Test Variable    ${TipodeCarga}
    
Presionar opcion Eliminar Tipo de Carga
    ${TipodeCarga}=    Get Element Attribute    xpath=//*[@id="ltc_dataGirdListas"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]    textContent
    Click Element    xpath=//*[@id="ltc_dataGirdListas"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div
    Set Test Variable    ${TipodeCarga}
    
Validar lista eliminada en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select z.Descripcion, tc.Descripcion, zl.FechaInicial, zl.FechaFinal from Sismep.TSismepZonasListas zl join Sismep.TSismepZonas z on zl.IdZona = z.IdZona join Sismep.TSismepTiposCarga tc on zl.IdTipoCarga = tc.IdTipoCarga where z.Descripcion = '${Zona}' and tc.Descripcion = '${TipodeCarga}'
    Disconnect From Database
    
Capturar coordenadas
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="geo_txtAreaCoord"]/div/div[1]/textarea    ${arg1}
    
Presionar opcion Agregar Coordenadas
    Click Element    xpath=//*[@id="tabGeoPunt"]/div[2]/div[2]/div/div/div[2]
    
Presionar opcion Borrar Coordenadas
    Click Element    //*[@id="tabGeoPunt"]/div[2]/div[2]/div/div/div[3]
    
Validar caja de coordenadas vacia
    ${coordenadas}=    Get text    xpath=//*[@id="geo_txtAreaCoord"]/div/div[1]/textarea
    Should Be Empty    ${coordenadas}
    
Presionar opcion Ver en Mapa
    Click Element    //*[@id="tabGeoPunt"]/div[2]/div[2]/div/div/div[1]
    Wait Until Element Is Visible    //*[@id="popupMapaSZ"]/div/div
    
Validar titulo de la ventana Mapa
    ${titulo}    Get Element Attribute    //*[@id="popupMapaSZ"]/div/div/div[1]/div/div[1]/div/div/div    textContent
    Should be equal    ${titulo}    Zona de ${Zona}
    
Presionar opcion Guardar Geo Puntos
    Wait Until Element Is Visible    xpath=//*[@id="geo_dataGridGeoPuntos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    Click Element    xpath=//*[@id="tabGeoPunt"]/div[2]/div[1]/div/div/div[1]
    Sleep    1
    ${NoFilas}=    Execute Javascript    return document.getElementsByClassName("dx-datagrid-table dx-datagrid-table-fixed")[5].rows.length -1;
    Set Test Variable    ${NoFilas}
    
Presionar opcion Quitar punto
    Click Element    //*[@id="geo_dataGridGeoPuntos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div
    
Presionar opcion Borrar Todo
    Click Element    //*[@id="tabGeoPunt"]/div[2]/div[1]/div/div/div[2]
    
Validar Puntos en BD
    Obtener datos del Grid Puntos de la Zona
    Conexion a Base de Datos
    @{queryCount}    Query    select count(zp.IdSecuencia) from Sismep.TSismepZonasPuntos zp join Sismep.TSismepZonas z on zp.IdZona = z.IdZona where z.Descripcion = '${Zona}'
    Should Be Equal    ${queryCount[0][0]}    ${NoFilas}
    @{queryResults}    Query    select top 1 z.Descripcion, zp.IdSecuencia, zp.Latitud, zp.Longitud from Sismep.TSismepZonasPuntos zp join Sismep.TSismepZonas z on zp.IdZona = z.IdZona where z.Descripcion = '${Zona}' order by zp.IdSecuencia
    Should Be Equal    ${queryResults[0][0]}    ${Zona}
    Should Be Equal    ${queryResults[0][2]}    ${latitud}
    Should Be Equal    ${queryResults[0][3]}    ${longitud}
    Disconnect From Database
    
Validar Puntos eliminados en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select z.Descripcion, zp.IdSecuencia, zp.Latitud, zp.Longitud from Sismep.TSismepZonasPuntos zp join Sismep.TSismepZonas z on zp.IdZona = z.IdZona where z.Descripcion = '${Zona}'
    Disconnect From Database
    
Obtener datos del Grid Puntos de la Zona
    ${NoFilas}=    Execute Javascript    return document.getElementsByClassName("dx-datagrid-table dx-datagrid-table-fixed")[5].rows.length -1;
    ${lat}=    Get Text    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    ${latitud}=    Convert To Number    ${lat}
    ${lon}=    Get Text    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]
    ${longitud}=    Convert To Number    ${lon}
    Set Test Variable    ${NoFilas}
    Set Test Variable    ${latitud}
    Set Test Variable    ${longitud}
    
Deslizar scroll hacia abajo
    Execute JavaScript    window.document.evaluate('//*[@id="divMenuList"]/a[20]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=//*[@id="divMenuList"]/a[20]    timeout=15