*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
${Todos}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
${Activo}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[2]
${Inactivo}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[3]
${xpathGridBody}    //*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody

*** Keywords ***
Ingresar a opcion Razon Social
    Click Element    xpath=//*[@id="divMenuList"]/a[10]
    Wait Until Element Is Not Visible    xpath=//*[@id="dataGrid"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody
    
Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    
Filtrar por Estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[6]/div/div/div
    Click Element    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[6]/div/div/div
    Sleep    1
    Click Element    ${arg1}
    
Validar campo unico Nombre
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select Descripcion from Sismep.TSismepRazonSocial where Descripcion = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Validar campo unico Nombre    ${arg1}
    ...    ELSE    Set Test Variable    ${NombreUnico}    ${Valor}
    Disconnect From Database
    
Validar campo unico RNP
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select RNPTitular from Sismep.TSismepRazonSocial where RNPTitular = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Validar campo unico RNP    ${arg1}
    ...    ELSE    Set Test Variable    ${RNPUnico}    ${Valor}
    Disconnect From Database
    
Presionar opcion Guardar
    Click Element    xpath=//*[@id="razonSocial"]/div/div[4]/div/div[1]
    
Presionar opcion Cancelar
    Click Element    xpath=//*[@id="razonSocial"]/div/div[4]/div/div[2]
    
Presionar opcion Eliminar
    Click Element    xpath=//*[@id="btnEliminar"]
    
Presionar opcion Reactivar
    Click Element    xpath=//*[@id="btnReactivar"]
    
Obtener datos del formulario
    ${Nombre}=    Get Value    xpath=//*[@id="txtNombre"]/div/div[1]/input
    ${RNP}=    Get Value    xpath=//*[@id="txtRnpTitular"]/div/div[1]/input
    ${Estado}=    Get Value    xpath=//*[@id="cboEstado"]/div[1]/div/div[1]/input
    ${Municipio}=    Get Value    xpath=//*[@id="cboMunicipio"]/div[1]/div/div[1]/input
    ${Localidad}=    Get Value    xpath=//*[@id="cboLocalidad"]/div[1]/div/div[1]/input
    Set Test Variable    ${Nombre}
    Set Test Variable    ${RNP}
    Set Test Variable    ${Estado}
    Set Test Variable    ${Municipio}
    Set Test Variable    ${Localidad}
    
Ingresar a opcion Contactos
    Click Element    xpath=//*[@id="tabContactos"]
    Wait Until Element Is Visible    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[4]/div/div[1]
    
Presionar opcion Guardar Contacto
    Click Element    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[4]/div/div[1]
    
Presionar opcion Cancelar Contacto
    Click Element    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[4]/div/div[2]
    
Obtener datos del Grid Contacto
    ${NombreCto}=    Get text    xpath=//*[@id="gridContactos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${DireccionCto}=    Get text    xpath=//*[@id="gridContactos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    Set Test Variable    ${NombreCto}
    Set Test Variable    ${DireccionCto}
    
Presionar opcion Detalle de contacto
    Click Element    xpath=//*[@id="gridContactos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div
    
Capturar telefono
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="txtTelefono"]/div/div[1]/input    ${arg1}
    
Presionar opcion Agregar Telefono
    Click Element    xpath=//*[@id="btnAgregarTelefono"]
    
Presionar opcion Eliminar Telefono
    Obtener numero de filas del Grid Telefonos
    Click Element    xpath=//*[@id="gridTelefonos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${NoFilas}]/td[3]/div
    
Obtener datos del Grid Telefono
    Obtener numero de filas del Grid Telefonos
    ${TelefonoCto}=    Get text    xpath=//*[@id="gridTelefonos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${NoFilas}]/td[1]
    Set Test Variable    ${TelefonoCto}
    
Obtener numero de filas del Grid Telefonos
    ${NoFilas}=    Execute Javascript    return document.getElementsByClassName("dx-datagrid-table dx-datagrid-table-fixed")[3].rows.length -1;
    Set Test Variable    ${NoFilas}
    
#Confirmar accion
    #[Arguments]    ${div}=4
    #Click Element    xpath=/html/body/div[${div}]/div/div/div[3]/div/div[2]/div[2]/div/div
    #Click Element    xpath=/html/body/div[${div}]/div/div/div[3]/div/div[2]/div[2]/div
    #Execute Javascript    document.evaluate('/html/body/div[4]/div/div/div[3]/div/div[2]/div[2]/div/div',document.body,null,9,null).singleNodeValue.click();
    
Validar campos vacios
    ${NombreCto}=    Get text    xpath=//*[@id="txtNombreContacto"]/div/div[1]/input
    ${DireccionCto}=    Get text    xpath=//*[@id="txtDireccion"]/div/div[1]/input
    ${ComentariosCto}=    Get text    xpath=//*[@id="txtComentarios"]/div/div[1]/textarea
    Should Be Empty    ${NombreCto}
    Should Be Empty    ${DireccionCto}
    Should Be Empty    ${ComentariosCto}
    
#Validar mensaje
    #[Arguments]    ${arg1}
    #Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div[2]
    #Element Text Should Be    xpath=/html/body/div[4]/div/div/div[2]    ${arg1}
    
Validar Razon Social en BD
    [Arguments]    ${arg1}=1
    Conexion a Base de Datos
    @{queryResults}    Query    select rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.Descripcion = '${Nombre}' and rs.RNPTitular = '${RNP}' and rs.Activo = ${arg1}
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${RNP}
    Should Be Equal    ${queryResults[0][2]}    ${Estado}
    Should Be Equal    ${queryResults[0][3]}    ${Municipio}
    Should Be Equal    ${queryResults[0][4]}    ${Localidad}
    Disconnect From Database
    
Validar Razon Social inexistente en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select Descripcion, RNPTitular from Sismep.TSismepRazonSocial where Descripcion = '${Nombre}' and RNPTitular = '${RNP}' and Activo = 1
    Disconnect From Database
    
Validar contacto en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select rs.Descripcion, rsc.Nombre, rsc.Direccion from Sismep.TSismepRazonSocial rs join Sismep.TSismepRazonSocialContactos rsc on rs.IdRazonSocial = rsc.IdRazonSocial where rs.Descripcion = '${Nombre}' and rsc.Nombre = '${NombreCto}' and rsc.Direccion = '${DireccionCto}'
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${NombreCto}
    Should Be Equal    ${queryResults[0][2]}    ${DireccionCto}
    Disconnect From Database
    
Validar telefono en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select rs.Descripcion, rsc.Nombre, rsr.Telefono from Sismep.TSismepRazonSocial rs join Sismep.TSismepRazonSocialContactos rsc on rs.IdRazonSocial = rsc.IdRazonSocial left join Sismep.TSismepRazonSocialReferencias rsr on rsc.IdRazonSocialContacto = rsr.IdRazonSocialContacto where rs.Descripcion = '${Nombre}' and rsc.Nombre = '${NombreCto}' and rsr.Telefono = '${TelefonoCto}'
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${NombreCto}
    Should Be Equal    ${queryResults[0][2]}    ${TelefonoCto}
    Disconnect From Database
    
Validar telefono eliminado en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select rs.Descripcion, rsc.Nombre, rsr.Telefono from Sismep.TSismepRazonSocial rs join Sismep.TSismepRazonSocialContactos rsc on rs.IdRazonSocial = rsc.IdRazonSocial left join Sismep.TSismepRazonSocialReferencias rsr on rsc.IdRazonSocialContacto = rsr.IdRazonSocialContacto where rs.Descripcion = '${Nombre}' and rsc.Nombre = '${NombreCto}' and rsr.Telefono = '${TelefonoCto}'
    Disconnect From Database
