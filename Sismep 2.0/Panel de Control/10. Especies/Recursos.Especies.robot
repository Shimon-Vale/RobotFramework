*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
${xpathGridBody}    //*[@id="gridSubTipoCarga"]/div/div[6]/div/div/div[1]/div/table/tbody
${queryEspecies}    select Descripcion from Sismep.TSismepTiposCarga where Descripcion =

*** Keywords ***
Ingresar a opcion Especies
    Click Element    xpath=//*[@id="divMenuList"]/a[12]
    Wait Until Element Is Not Visible    xpath=//*[@id="gridSubTipoCarga"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="gridSubTipoCarga"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30
    
Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="gridSubTipoCarga"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="gridSubTipoCarga"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}

Filtrar por Estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="gridSubTipoCarga"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div
    Click Element    xpath=//*[@id="gridSubTipoCarga"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]

Validar campo unico Descripcion
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select Descripcion from Sismep.TSismepSubTiposCarga where Descripcion = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Validar campo unico Descripcion    ${arg1}
    ...    ELSE    Set Test Variable    ${DescripcionUnica}    ${Valor}
    Disconnect From Database

Seleccionar Tipo de carga
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="ddlTipoCarga"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Presionar opcion Guardar
    Click Element    xpath=//*[@id="gen_btnGaurdar"]

Presionar opcion Cancelar
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[4]/div/div[2]

Presionar opcion Desactivar
    Click Element    xpath=//*[@id="btnDesactivar"]

Presionar opcion Reactivar
    Click Element    xpath=//*[@id="btnReactivar"]

Obtener datos del formulario
    ${Descripcion}=    Get Value    xpath=//*[@id="txtDescripcion"]/div/div[1]/input
    ${Tipo}=    Get Value    xpath=//*[@id="ddlTipoCarga"]/div[1]/div/div[1]/input
    Set Test Variable    ${Descripcion}
    Set Test Variable    ${Tipo}

Validar Especies en BD
    [Arguments]    ${arg1}=1
    Conexion a Base de Datos
    @{queryResults}    Query    select stc.Descripcion, tc.Descripcion from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where stc.Descripcion = '${Descripcion}' and tc.Descripcion = '${Tipo}' and stc.Activo = ${arg1}
    Should Be Equal    ${queryResults[0][0]}    ${Descripcion}
    Should Be Equal    ${queryResults[0][1]}    ${Tipo}
    Disconnect From Database

Validar Especie inexistente en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select stc.Descripcion, tc.Descripcion from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where stc.Descripcion = '${Descripcion}' and tc.Descripcion = '${Tipo}' and stc.Activo = 1
    Disconnect From Database
    
Validar numero de registros en BD
    [Arguments]    ${arg1}
    Conexion a Base de Datos
    Row Count Is Equal To X    select stc.Descripcion, tc.Descripcion from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where stc.Descripcion = '${Descripcion}' and tc.Descripcion = '${Tipo}' and stc.Activo = 1    ${arg1}
    Disconnect From Database