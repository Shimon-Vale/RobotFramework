*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
${xpathGridBody}    //*[@id="gridEstadoMunicipio"]/div/div[6]/div/div/div[1]/div/table/tbody

*** Keywords ***
Ingresar a opcion Estados, Municipios y Localidades
    Click Element    xpath=//*[@id="divMenuList"]/a[6]
    Wait Until Element Is Not Visible    xpath=//*[@id="gridEstadoMunicipio"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="gridEstadoMunicipio"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30

Ingresar al detalle del registro No. ${arg1} en el grid
    Click Element    xpath=//*[@id="gridEstadoMunicipio"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[4]/div/div
    Wait Until Page Contains Element    xpath=//*[@id="gen_btnEliminar"]

Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="gridEstadoMunicipio"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="gridEstadoMunicipio"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}

Estado - Validar campo unico Descripcion
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select Descripcion from Sismep.TSismepEstados where Descripcion = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Estado - Validar campo unico Descripcion    ${arg1}
    ...    ELSE    Set Test Variable    ${EstadoUnico}    ${Valor}
    Disconnect From Database

Estado - Obtener datos del formulario
    ${Estado}=    Get Value    xpath=//*[@id="gen_txtDescripcion"]/div/div[1]/input
    Set Test Variable    ${Estado}
    
Estado - Mostrar campos obligatorios
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="gen_txtDescripcion"]    textContent
    Should be equal    ${attrDescripcion}    Obligatorio
    
Estado - Presionar boton Guardar
    Click Element    xpath=//*[@id="gen_btnGaurdar"]

Estado - Presionar boton Cancelar
    Click Element    xpath=//*[@id="tabGeneral"]/div[2]/div/div[2]

Estado - Presionar boton Eliminar
    Click Element    xpath=//*[@id="gen_btnEliminar"]

Seleccionar TAB Municipios
    Wait Until Element Is Visible    xpath=//*[@id="lnkTabGridMunicipio"]
    Click Element    xpath=//*[@id="lnkTabGridMunicipio"]

Municipio - Validar campo unico Descripcion
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select Descripcion from Sismep.TSismepMunicipios where Descripcion = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Municipio - Validar campo unico Descripcion    ${arg1}
    ...    ELSE    Set Test Variable    ${MunicipioUnico}    ${Valor}
    Disconnect From Database

Municipio - Obtener datos del formulario
    ${Municipio}=    Get Value    xpath=//*[@id="mpo_txtDescripcion"]/div/div[1]/input
    Set Test Variable    ${Municipio}

Municipio - Mostrar campos obligatorios
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="mpo_txtDescripcion"]    textContent
    Should be equal    ${attrDescripcion}    Obligatorio
    
Municipio - Presionar boton Guardar
    Click Element    xpath=//*[@id="mpo_btnGaurdar"]

Municipio - Presionar boton Cancelar
    Click Element    xpath=//*[@id="tabGridMunicipio"]/div/div[2]/div[2]/div/div[2]
    
Municipio - Presionar boton Eliminar
    Click Element    xpath=//*[@id="mpo_btnEliminar"]

Municipio - Presionar ver detalle
    Wait Until Element Is Visible    xpath=//*[@id="dataGridMunicipios"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div/div
    Click Element    xpath=//*[@id="dataGridMunicipios"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div/div
    
Seleccionar TAB Localidades
    Wait Until Element Is Visible    xpath=//*[@id="dataGridMunicipios"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div/div
    Click Element    xpath=//*[@id="dataGridMunicipios"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div/div
    Wait Until Element Is Visible    xpath=//*[@id="lnkTabGridLocalidad"]
    Click Element    xpath=//*[@id="lnkTabGridLocalidad"]

Localidad - Validar campo unico Descripcion
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select Descripcion from Sismep.TSismepLocalidades where Descripcion = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Localidad - Validar campo unico Descripcion    ${arg1}
    ...    ELSE    Set Test Variable    ${LocalidadUnica}    ${Valor}
    Disconnect From Database

Localidad - Obtener datos del formulario
    ${Localidad}=    Get Value    xpath=//*[@id="mpo_txtDescripcion"]/div[1]/div[1]/input
    Set Test Variable    ${Localidad}
    
Localidad - Mostrar campos obligatorios
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="loc_txtDescripcion"]    textContent
    Should be equal    ${attrDescripcion}    Obligatorio
    
Localidad - Presionar boton Guardar
    Click Element    xpath=//*[@id="loc_btnGaurdar"]

Localidad - Presionar boton Cancelar
    Click Element    xpath=//*[@id="tabGridLocalidad"]/div/div[2]/div[2]/div/div[2]
    
Localidad - Presionar boton Eliminar
    Click Element    xpath=//*[@id="loc_btnEliminar"]

Localidad - Presionar ver detalle
    Wait Until Element Is Visible    xpath=//*[@id="dataGridLocalidad"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]/div/div
    Click Element     xpath=//*[@id="dataGridLocalidad"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]/div/div
    
### Validaciones en Base de Datos
Validar Estado en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select Descripcion from Sismep.TSismepEstados where Descripcion='${EstadoUnico}'
    Should Be Equal    ${queryResults[0][0]}    ${EstadoUnico}
    Disconnect From Database

Validar Estado inexistente en BD
    [Arguments]    ${arg1}=${EstadoUnico}
    Conexion a Base de Datos
    Check If Not Exists In Database    select Descripcion from Sismep.TSismepEstados where Descripcion='${arg1}'
    Disconnect From Database

Validar Municipio en BD
    [Arguments]    ${arg1}=${EstadoUnico}    ${arg2}=${MunicipioUnico}
    Conexion a Base de Datos
    @{queryResults}    Query    select e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepEstados e left join Sismep.TSismepMunicipios m on e.IdEstado = m.IdEstado left join Sismep.TSismepLocalidades l on m.IdMunicipio = l.IdMunicipio where e.Descripcion = '${arg1}' and m.Descripcion = '${arg2}'
    Should Be Equal    ${queryResults[0][0]}    ${arg1}
    Should Be Equal    ${queryResults[0][1]}    ${arg2}
    Disconnect From Database

Validar Municipio inexistente en BD
    [Arguments]    ${arg1}=${EstadoUnico}    ${arg2}=${MunicipioUnico}
    Conexion a Base de Datos
    Check If Not Exists In Database    select e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepEstados e left join Sismep.TSismepMunicipios m on e.IdEstado = m.IdEstado left join Sismep.TSismepLocalidades l on m.IdMunicipio = l.IdMunicipio where e.Descripcion = '${arg1}' and m.Descripcion = '${arg2}'
    Disconnect From Database

Validar Localidad en BD
    [Arguments]    ${arg1}=${EstadoUnico}    ${arg2}=${MunicipioUnico}    ${arg3}=${LocalidadUnica}
    Conexion a Base de Datos
    @{queryResults}    Query    select e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepEstados e left join Sismep.TSismepMunicipios m on e.IdEstado = m.IdEstado left join Sismep.TSismepLocalidades l on m.IdMunicipio = l.IdMunicipio where e.Descripcion = '${arg1}' and m.Descripcion = '${arg2}' and l.Descripcion = '${arg3}'
    Should Be Equal    ${queryResults[0][0]}    ${arg1}
    Should Be Equal    ${queryResults[0][1]}    ${arg2}
    Should Be Equal    ${queryResults[0][2]}    ${arg3}
    Disconnect From Database

Validar Localidad inexistente en BD
    [Arguments]    ${arg1}=${EstadoUnico}    ${arg2}=${MunicipioUnico}    ${arg3}=${LocalidadUnica}
    Conexion a Base de Datos
    Check If Not Exists In Database    select e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepEstados e left join Sismep.TSismepMunicipios m on e.IdEstado = m.IdEstado left join Sismep.TSismepLocalidades l on m.IdMunicipio = l.IdMunicipio where e.Descripcion = '${arg1}' and m.Descripcion = '${arg2}' and l.Descripcion = '${arg3}'
    Disconnect From Database

Validacion de campo obligatorio oculto
    [Arguments]    ${campo}
    ${attrCampo}=    Get Element Attribute    xpath=${campo}    textContent
    Should Be Empty    ${attrCampo}

Validar boton Eliminar desactivado
    [Arguments]    ${btn}
    ${attrbtn}=    Get Element Attribute    xpath=${btn}    class
    Should Contain    ${attrbtn}    disabled

Validar campo vacio
    [Arguments]    ${campo}
    ${attrCampo}=    Get Element Attribute    xpath=${campo}    class    
    Should Contain    ${attrCampo}    empty