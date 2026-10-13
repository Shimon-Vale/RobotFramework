*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
${RegistroExistente}    PUERTO
${xpathGridBody}    //*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody
${queryTipoZona}    select Descripcion from Sismep.TSismepTiposZonas where Descripcion=

*** Keywords ***
Ingresar a opcion Tipos de Zona
    Deslizar scroll hacia abajo
    Click Element    xpath=//*[@id="divMenuList"]/a[15]
    Wait Until Element Is Not Visible    xpath=//*[@id="grid"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30

Filtrar por Zona
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input    ${arg1}
    
Filtrar por Estatus
    [Arguments]    ${opc}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div
    Click Element    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${opc}]/div

# Validar campo unico Descripcion
#     [Arguments]    ${arg1}
#     ${consecutivo}=    Evaluate    ${consecutivo}+1
#     Set Test Variable    ${consecutivo}    ${consecutivo}
#     ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
#     ${consultaSQL}=    Execute Javascript    return "select Descripcion from Sismep.TSismepTiposZonas where Descripcion = '${Valor}'";
#     Conexion a Base de Datos
#     ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
#     Run Keyword If    ${valida} == True    Validar campo unico Descripcion    ${arg1}
#     ...    ELSE    Set Test Variable    ${DescripcionUnica}    ${Valor}
#     Disconnect From Database
    
Presionar boton Guardar
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[9]/div/div[1]

Obtener datos del formulario
    ${Descripcion}=    Get Value    xpath=//*[@id="txtDescripcion"]/div/div[1]/input
    ${ZI}=    Get Value    xpath=//*[@id="rblZonaInformativa"]/input
    ${ZInformativa}=    Execute Javascript    if('${ZI}'=='true') {return true} else {return false};
    ${VP}=    Get Value    xpath=//*[@id="rblValidaProximidad"]/input
    ${VProximidad}=    Execute Javascript    if('${VP}'=='true') {return true} else {return false};
    ${RP}=    Get Value    xpath=//*[@id="rblRequierePI"]/input
    ${RPuntoInteres}=    Execute Javascript    if('${RP}'=='true') {return true} else {return false};
    ${AL}=    Get Value    xpath=//*[@id="rblAgregarListas"]/input
    ${AgregarListas}=    Execute Javascript    if('${AL}'=='true') {return true} else {return false};
    ${TL}=    Get Value    xpath=//*[@id="rblTipoLista"]/input
    ${TipoLista}=    Execute Javascript    if('${TL}'=='true') {return true} else {return false};
    ${MA}=    Get Value    xpath=//*[@id="rblMostrarAlerta"]/input
    ${MostrarAlerta}=    Execute Javascript    if('${MA}'=='true') {return true} else {return false};
    Set Test Variable    ${Descripcion}
    Set Test Variable    ${ZInformativa}
    Set Test Variable    ${VProximidad}
    Set Test Variable    ${RPuntoInteres}
    Set Test Variable    ${AgregarListas}
    Set Test Variable    ${TipoLista}
    Set Test Variable    ${MostrarAlerta}

Validar Tipo de Zona en BD
    [Arguments]    ${Activo}=1
    Obtener datos del formulario
    Conexion a Base de Datos
    @{queryResults}    Query    select Descripcion, ZonaInformativa, ValidaProximidad, RequierePuntoInteres, AgregaListas, Inclusion, GeneraAlerta from Sismep.TSismepTiposZonas where Descripcion = '${Descripcion}' and Activo=${Activo}
    Should Be Equal    ${queryResults[0][0]}    ${Descripcion}
    Should Be Equal    ${queryResults[0][1]}    ${ZInformativa}
    Should Be Equal    ${queryResults[0][2]}    ${VProximidad}
    Should Be Equal    ${queryResults[0][3]}    ${RPuntoInteres}
    Should Be Equal    ${queryResults[0][4]}    ${AgregarListas}
    Should Be Equal    ${queryResults[0][5]}    ${TipoLista}
    Should Be Equal    ${queryResults[0][6]}    ${MostrarAlerta}
    Disconnect From Database
    
Validar Tipo de Zona inexistente en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select Descripcion from Sismep.TSismepTiposZonas where Descripcion='${Descripcion}'
    Disconnect From Database
    
Presionar boton Cancelar
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[9]/div/div[2]

Presionar boton Ver detalle
    Click Element    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div/div
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div[2]/div/div[9]/div/div[1]
    
Validar campos requeridos
    ${attrDesc}=    Get Element Attribute    xpath=//*[@id="txtDescripcion"]    textContent
    Should be equal    ${attrDesc}    Obligatorio
    
Deslizar scroll hacia abajo
    Execute JavaScript    window.document.evaluate('//*[@id="divMenuList"]/a[15]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=//*[@id="divMenuList"]/a[15]    timeout=15