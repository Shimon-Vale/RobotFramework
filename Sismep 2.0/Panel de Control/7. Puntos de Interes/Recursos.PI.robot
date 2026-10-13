*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
${Todos}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
${Activo}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[2]
${Inactivo}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[3]
${queryPInteres}    select Descripcion from Sismep.TSismepPuntosInteres where Descripcion =

*** Keywords ***
Ingresar a opcion Puntos de Interes
    Click element    xpath://*[@id="divMenuList"]/a[9]
    Wait Until Element Is Not Visible    xpath=//*[@id="grid"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30
    
Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    
Filtrar por Estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[4]/div/div/div/div/div/div[2]/div[2]/div
    Click Element    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[4]/div/div/div/div/div/div[2]/div[2]/div
    Sleep    1
    Click Element    ${arg1}
    
Validar campo unico Descripcion
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select Descripcion from Sismep.TSismepPuntosInteres where Descripcion = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Validar campo unico Descripcion    ${arg1}
    ...    ELSE    Set Test Variable    ${DescripcionUnica}    ${Valor}
    Disconnect From Database
    
Seleccionar Tipo Punto
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    xpath=//*[@id="ddlTipoPunto"]
    Click Element    xpath=//*[@id="ddlTipoPunto"]
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Seleccionar Icono
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    xpath=//*[@id="cboIcono"]
    Click Element    xpath=//*[@id="cboIcono"]
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Presionar opcion Guardar
    Click Element    xpath=//*[@id="Guardar"]
    
Presionar opcion Cancelar
    Click Element    xpath=//*[@id="Cancelar"]
    
Presionar opcion Eliminar
    Click Element    xpath=//*[@id="DeleteButton"]
    
Presionar opcion Reactivar
    Click Element    xpath=//*[@id="ReactivarButton"]
    
Obtener datos del formulario
    ${Descripcion}=    Get Value    xpath=//*[@id="txtDescripcion"]/div/div[1]/input
    ${Tipo}=    Get Value    xpath=//*[@id="ddlTipoPunto"]/div[1]/div/div[1]/input
    ${Lat}=    Get Value    xpath=//*[@id="txtLatitud"]/div/div[1]/input
    ${Latitud}=    Execute Javascript    return parseFloat(${Lat});
    ${Lon}=    Get Value    xpath=//*[@id="txtLongitud"]/div/div[1]/input
    ${Longitud}=    Execute Javascript    return parseFloat(${Lon});
    Set Test Variable    ${Descripcion}
    Set Test Variable    ${Tipo}
    Set Test Variable    ${Latitud}
    Set Test Variable    ${Longitud}
    
#Validar mensaje
    #[Arguments]    ${arg1}
    #Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div[2]
    #Element Text Should Be    xpath=/html/body/div[4]/div/div/div[2]    ${arg1}
    
Validar PI en BD
    [Arguments]    ${arg1}=1
    Obtener datos del formulario
    Conexion a Base de Datos
    @{queryResults}    Query    select pti.Descripcion, d.DescripcionCorta, pti.Latitud, pti.Longitud, pti.Activo from Sismep.TSismepPuntosInteres pti join Sismep.TSismepDetalle d on pti.IdTipoPunto = d.IdDetalle where pti.Descripcion = '${Descripcion}' and pti.Activo = ${arg1}
    Should Be Equal    ${queryResults[0][0]}    ${Descripcion}
    Should Be Equal    ${queryResults[0][1]}    ${Tipo}
    Should Be Equal    ${queryResults[0][2]}    ${Latitud}
    Should Be Equal    ${queryResults[0][3]}    ${Longitud}
    Disconnect From Database
    
Validar PI inexistente en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select pti.Descripcion, d.DescripcionCorta, pti.Latitud, pti.Longitud, pti.Activo from Sismep.TSismepPuntosInteres pti join Sismep.TSismepDetalle d on pti.IdTipoPunto = d.IdDetalle where pti.Descripcion = '${Descripcion}' and d.DescripcionCorta = '${Tipo}' and pti.Latitud = '${Latitud}' and pti.Longitud = '${Longitud}' and pti.Activo = 1
    Disconnect From Database