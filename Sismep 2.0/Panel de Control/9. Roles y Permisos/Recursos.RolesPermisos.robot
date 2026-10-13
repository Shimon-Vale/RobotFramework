*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
${Todos}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
${Activo}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[2]
${Inactivo}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[3]
${xpathGridBody}    //*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody

*** Keywords ***
Ingresar a opcion Roles y Permisos
    Click Element    xpath=//*[@id="divMenuList"]/a[11]
    Wait Until Element Is Not Visible    xpath=//*[@id="dataGrid"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30
    
### Pantalla principal
Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    
Filtrar por Estatus
    [Arguments]    ${columna}    ${path}
    Wait Until Element Is Enabled    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[${columna}]/div/div/div
    Click Element    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[${columna}]/div/div/div
    Sleep    1
    Click Element    ${path}
    
Presionar boton Catalogo de Permisos
    Click Element    xpath=//*[@id="Panelroles"]/div/div[1]/div[2]/div[2]
    Wait Until Element Is Not Visible    xpath=//*[@id="dataGrid"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30
    
### Formulario Rol
Rol - Validar campo unico Nombre
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select RoleName from aspnet_Roles where RoleName = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Rol - Validar campo unico Nombre    ${arg1}
    ...    ELSE    Set Test Variable    ${NombreUnico}    ${Valor}
    Disconnect From Database
    
Rol - Validar campo unico Descripcion
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select [Description] from aspnet_Roles where [Description] = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Rol - Validar campo unico Descripcion    ${arg1}
    ...    ELSE    Set Test Variable    ${DescripcionUnica}    ${Valor}
    Disconnect From Database
    
Rol - Obtener datos del formulario
    ${Nombre}=    Get Value    xpath=//*[@id="txtNombreRol"]/div/div[1]/input
    ${Descripcion}=    Get Value    xpath=//*[@id="txtDescripcion"]/div/div[1]/input
    Set Test Variable    ${Nombre}
    Set Test Variable    ${Descripcion}
    
### Formulario Permiso
Permiso - Validar campo unico Descripcion
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select p.Descripcion from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Descripcion = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Permiso - Validar campo unico Descripcion    ${arg1}
    ...    ELSE    Set Test Variable    ${DescripcionUnica}    ${Valor}
    Disconnect From Database
    
Permiso - Validar campo unico Etiqueta
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select p.Etiqueta from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Etiqueta = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Permiso - Validar campo unico Etiqueta    ${arg1}
    ...    ELSE    Set Test Variable    ${EtiquetaUnica}    ${Valor}
    Disconnect From Database
    
### Botones en formulario Rol
Presionar opcion Guardar
    Click Element    xpath=//*[@id="tab1"]/div[4]/div/div[1]
    
Presionar opcion Cancelar
    Click Element    xpath=//*[@id="tab1"]/div[4]/div/div[2]
    
Presionar opcion Eliminar
    Click Element    xpath=//*[@id="btnEliminar"]
    
Presionar opcion Reactivar
    Click Element    xpath=//*[@id="btnReactivar"]
    
### Botones en formulario Permiso
Presionar opcion Guardar Permiso
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[7]/div/div[1]
    
Presionar opcion Cancelar Permiso
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[7]/div/div[2]
    
### TAB Permisos
Presionar opcion Permisos
    Click Element    xpath=//*[@id="lnkTab2"]
    
Seleccionar Tipo de Permiso
    Click Element    xpath=//*[@id="cboTipoPermiso"]/div[1]/div/div[2]/div[2]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div
    
Seleccionar Permiso
    Press Keys    xpath=//*[@id="cboPermiso"]/div[1]/div/div[1]/input    ARROW_DOWN
    Press Keys    xpath=//*[@id="cboPermiso"]/div[1]/div/div[1]/input    ARROW_DOWN
    
Presionar opcion Agregar permiso
    Click Element    xpath=//*[@id="tab2"]/div[2]/div/div[1]
    
Presionar opcion Activar-Desactivar permiso
    Click Element    xpath=//*[@id="dataGridPermisos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div
    
Obtener numero de filas del Grid Permisos
    ${NoFilas}=    Execute Javascript    return document.getElementsByClassName("dx-datagrid-table dx-datagrid-table-fixed")[3].rows.length -1;
    Set Test Variable    ${NoFilas}
    
Obtener datos del Grid Permisos
    Obtener numero de filas del Grid Permisos
    ${gridDescripcion}=    Get text    xpath=//*[@id="dataGridPermisos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${NoFilas}]/td[1]
    ${gridTipo}=    Get text    xpath=//*[@id="dataGridPermisos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${NoFilas}]/td[2]
    Set Test Variable    ${gridDescripcion}
    Set Test Variable    ${gridTipo}
    
TAB Permisos - Filtrar por Estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="dataGridPermisos"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div
    Click Element    xpath=//*[@id="dataGridPermisos"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div
    Click Element    xpath=//*[contains(text(),'${arg1}')]

TAB Permisos - Filtrar por Orden
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div[2]/div/div/div[1]/input    ${arg1}
    
Permiso - Obtener datos del formulario
    ${Tipo}=    Get Value    xpath=//*[@id="cbTipoPermiso"]/div[1]/div/div[1]/input
    ${Descripcion}=    Get Value    xpath=//*[@id="txtDescripcion"]/div/div[1]/input
    ${Etiqueta}=    Get Value    xpath=//*[@id="txtEtiqueta"]/div/div[1]/input
    ${Odn}=    Get Value    xpath=//*[@id="txtOrden"]/div/div[1]/input
    ${Orden}=    Convert To Integer    ${Odn}
    ${Valor}=    Get Value    xpath=//*[@id="txtValor"]/div/div[1]/input
    Set Test Variable    ${Tipo}
    Set Test Variable    ${Descripcion}
    Set Test Variable    ${Etiqueta}
    Set Test Variable    ${Orden}
    Set Test Variable    ${Valor}
    
Validar Rol en BD
    [Arguments]    ${arg1}=1
    Conexion a Base de Datos
    @{queryResults}    Query    select RoleName, [Description], Activo from aspnet_Roles where RoleName = '${Nombre}' and [Description] = '${Descripcion}' and Activo = ${arg1}
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${Descripcion}
    Disconnect From Database
    
Validar Rol inexistente en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select RoleName, [Description], Activo from aspnet_Roles where RoleName = '${Nombre}' and [Description] = '${Descripcion}' and Activo = 1
    Disconnect From Database
    
Validar Rol-Permiso en BD
    [Arguments]    ${arg1}=1
    Conexion a Base de Datos
    @{queryResults}    Query    select r.RoleName, p.Descripcion, tp.Descripcion from aspnet_Roles r join Sismep.TSismepRolesPermisos rp on r.RoleId = rp.IdRol join Sismep.TSismepPermisos p on rp.IdPermiso = p.IdPermiso join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where r.RoleName = '${Nombre}' and p.Descripcion = '${gridDescripcion}' and rp.Activo = ${arg1}
    Should be equal    ${Nombre}    ${queryResults[0][0]}
    Should be equal    ${gridDescripcion}    ${queryResults[0][1]}
    Should be equal    ${gridTipo}    ${queryResults[0][2]}
    Disconnect From Database
    
Validar Permiso en BD
    [Arguments]    ${arg1}=1
    Conexion a Base de Datos
    @{queryResults}    Query    select tp.Descripcion, p.Descripcion, p.Etiqueta, p.Orden, p.Valor, p.Activo from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Descripcion = '${Descripcion}' and p.Etiqueta = '${Etiqueta}' and p.Activo = ${arg1}
    Should Be Equal    ${queryResults[0][0]}    ${Tipo}
    Should Be Equal    ${queryResults[0][1]}    ${Descripcion}
    Should Be Equal    ${queryResults[0][2]}    ${Etiqueta}
    Should Be Equal    ${queryResults[0][3]}    ${Orden}
    Should Be Equal    ${queryResults[0][4]}    ${Valor}
    Disconnect From Database
    
Validar Permiso inexistente en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select tp.Descripcion, p.Descripcion, p.Etiqueta, p.Orden, p.Valor, p.Activo from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Descripcion = '${Descripcion}' and p.Etiqueta = '${Etiqueta}' and p.Activo = 1
    Disconnect From Database
    
Rol - Validar campos requeridos
    ${attrNombre}=    Get Element Attribute    xpath=//*[@id="txtNombreRol"]    textContent
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="txtDescripcion"]    textContent
    Should be equal    ${attrNombre}    Obligatorio
    Should be equal    ${attrDescripcion}    Obligatorio