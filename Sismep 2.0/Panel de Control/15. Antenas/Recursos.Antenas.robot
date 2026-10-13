*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
&{AntenaExistente}    Descripcion=RockFleet    Serie=300234060202680    Voltaje=1000
${caracteres}    caracteres1caracteres2caracteres3caracteres4carac
${xpathGridBody}    //*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody
${queryAntena}    select Descripcion from Sismep.TSismepAntenas where Descripcion=
${querySerie}    select NoSerie from Sismep.TSismepAntenas where NoSerie=

*** Keywords ***
Ingresar a opcion Antenas
    Deslizar scroll hacia abajo
    Click Element    xpath=//*[@id="divMenuList"]/a[17]
    Wait Until Element Is Not Visible    xpath=//*[@id="dataGrid"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30

Ingresar al detalle del registro
    Wait Until Element Is Enabled    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[7]/div
    Click Element    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[7]/div
    
Filtrar por
    [Arguments]    ${arg1}    ${arg2}
    Wait Until Element Is Enabled    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[${arg1}]/div/div[2]/div/div/div[1]/input    ${arg2}
    
Filtrar por estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[6]/div/div/div
    Click Element    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[6]/div/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Seleccionar Tipo
    [Arguments]    ${arg1}
    Execute Javascript    document.evaluate('//*[@id="cboModems"]/div[1]/div/div[2]/div[2]',document.body,null,9,null).singleNodeValue.click();
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Validar elementos del combo Tipo
    Execute Javascript    document.evaluate('//*[@id="cboModems"]/div[1]/div/div[2]/div[2]',document.body,null,9,null).singleNodeValue.click();
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Element Should Contain    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]/div    IDP
    Element Should Contain    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div    ETR
    Element Should Contain    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[3]/div    RockFleet
    Element Should Contain    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[4]/div    Modem migraci\u00F3n
    
Obtener los valores del formulario
    ${tipo}    Get Value    xpath=//*[@id="cboModems"]/div[1]/div/div[1]/input
    ${des}    Get Value    xpath=//*[@id="txtDescripcion"]/div/div[1]/input
    ${descripcion}=    Execute JavaScript    if ('${des}'.length >= 50) {return '${des}'.slice(0, 50)} else {return '${des}'};
    ${ser}    Get Value    xpath=//*[@id="txtNoSerie"]/div/div[1]/input
    ${serie}=    Execute JavaScript    if ('${ser}'.length >= 50) {return '${ser}'.slice(0, 50)} else {return '${ser}'};
    ${vol}    Get Value    xpath=//*[@id="txtVoltaje"]/div/div[1]/input
    ${voltaje}=    Execute JavaScript    if ('${vol}'.length > 0) {return parseFloat('${vol}')} else {return 0};
    Set Test Variable    ${tipo}
    Set Test Variable    ${descripcion}
    Set Test Variable    ${serie}
    Set Test Variable    ${voltaje}
    
Presionar opcion Guardar
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[6]/div/div[1]/div

Presionar opcion Cancelar
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[6]/div/div[2]/div

Presionar opcion Eliminar
    Click Element    xpath=//*[@id="btnEliminar"]

Presionar opcion Reactivar
    Wait Until Element Is Enabled    xpath=//*[@id="btnReactivar"]
    Click Element    xpath=//*[@id="btnReactivar"]
        
Consultar registro en BD
    [Arguments]    ${arg1}
    Conexion a Base de Datos
    Row Count Is Equal To X    select m.Descripcion, a.Descripcion, a.IdExterno, a.Voltaje from [Sismep].[TSismepAntenas] a join [Sismep].[TSismepModems] m on a.IdModem=m.IdModem where a.Activo = 1 and m.Descripcion = '${tipo}' and a.Descripcion = '${descripcion}' and a.NoSerie = '${serie}' and a.Voltaje = ${voltaje}    ${arg1}
    Disconnect From Database
    
Validar registro en BD
    [Arguments]    ${Activo}=1
    Conexion a Base de Datos
    @{queryResults}    Query    select m.Descripcion, a.Descripcion, a.IdExterno, a.Voltaje from [Sismep].[TSismepAntenas] a join [Sismep].[TSismepModems] m on a.IdModem=m.IdModem where a.Activo = ${Activo} and m.Descripcion = '${tipo}' and a.Descripcion = '${descripcion}' and a.NoSerie = '${serie}' and a.Voltaje = ${voltaje}
    Should Be Equal    ${queryResults[0][0]}    ${tipo}
    Should Be Equal    ${queryResults[0][1]}    ${descripcion}
    Should Be Equal    ${queryResults[0][2]}    ${serie}
    Should Be Equal    ${queryResults[0][3]}    ${voltaje}
    Disconnect From Database
    
Deslizar scroll hacia abajo
    Execute JavaScript    window.document.evaluate('//*[@id="divMenuList"]/a[17]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=//*[@id="divMenuList"]/a[17]    timeout=15