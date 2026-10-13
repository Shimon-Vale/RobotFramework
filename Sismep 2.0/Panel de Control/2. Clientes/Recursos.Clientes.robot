*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
${RegistroExistente}    Conapesca
${banner}    C:/Users/iloera/Downloads/Img/banner.png
${logo}    C:/Users/iloera/Downloads/Img/logo.png
${xpathGridBody}    //*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody 

*** Keywords ***
Ingresar a opcion Clientes
    Click Element    xpath=//*[@id="divMenuList"]/a[4]
    Wait Until Element Is Not Visible    xpath=//*[@id="grid"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30

Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}

Filtrar por Estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div/div/div/div[1]/input
    Click Element    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div/div/div/div[1]/input
    Click Element    xpath=//*[contains(text(),'${arg1}')]

Contactos - Filtrar por Estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="gridContacto"]/div/div[5]/div/table/tbody/tr[2]/td[4]/div/div/div
    Click Element    xpath=//*[@id="gridContacto"]/div/div[5]/div/table/tbody/tr[2]/td[4]/div/div/div
    Click Element    xpath=//*[contains(text(),'${arg1}')]
    
Validar campo unico Nombre
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select Nombre from Sismep.TSismepClientes where Nombre = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Validar campo unico Nombre    ${arg1}
    ...    ELSE    Set Test Variable    ${CteNombreUnico}    ${Valor}
    Disconnect From Database

Generales - Obtener datos del formulario
    ${CteNombre}=    Get Value    xpath=//*[@id="txtNombreCliente"]/div/div[1]/input
    ${CteRazon}=    Get Value    xpath=//*[@id="txtRazonSocial"]/div/div[1]/input
    ${CteDireccion}=    Get Value    xpath=//*[@id="txtDireccion"]/div/div[1]/input
    ${CteComentarios}=    Get Value    xpath=//*[@id="txtComentarios"]/div/div[1]/textarea
    Set Test Variable    ${CteNombre}
    Set Test Variable    ${CteRazon}
    Set Test Variable    ${CteDireccion}
    Set Test Variable    ${CteComentarios}
    
Generales - Presionar boton Guardar
    Click Element    xpath=//*[@id="btnGuardar"]

Generales - Presionar boton Cancelar
    Click Element    xpath=//*[@id="btnCancelar"]

Generales - Presionar boton Eliminar
    Click Element    xpath=//*[@id="btnEliminar"]

Generales - Presionar boton Reactivar
    Click Element     xpath=//*[@id="btnReactivar"]

Generales - Validar registro en BD
    [Arguments]    ${arg1}=1
    Conexion a Base de Datos
    @{queryResults}    Query    select Nombre, RazonSocial, Direccion, Comentarios from Sismep.TSismepClientes where Nombre = '${CteNombre}' and Activo = ${arg1}
    Should Be Equal    ${queryResults[0][0]}    ${CteNombre}
    Should Be Equal    ${queryResults[0][1]}    ${CteRazon}
    Should Be Equal    ${queryResults[0][2]}    ${CteDireccion}
    Should Be Equal    ${queryResults[0][3]}    ${CteComentarios}
    Disconnect From Database

Generales - Validar Cliente inexistente en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select Nombre, RazonSocial, Direccion, Comentarios from Sismep.TSismepClientes where Nombre = '${CteNombreUnico}'
    Disconnect From Database

Seleccionar TAB Configuracion Sistema
    Click Element    xpath=//*[@id="tabConfiguracion"]
    Wait Until Element Is Visible    xpath=//*[@id="btnConfigGuardar"]

Configuracion - Obtener datos del formulario
    ${Nombre}=    Get Value    xpath=//*[@id="txtNombreSistema"]/div/div[1]/input
    ${Banner}=    Get Text    xpath=//*[@id="fuBanner"]/div/div/div/div[1]/div[2]/div
    ${Logo}=    Get Text    xpath=//*[@id="fuLogo"]/div/div/div/div[1]/div[2]/div
    ${attrEstilo}=    Get Element Attribute    xpath=//*[@id="cboEstilo"]/div[1]/div[1]/div/div[1]    class
    ${Estilo}    Execute Javascript    cadena='${attrEstilo}'; return cadena.substr(20);
    Set Test Variable    ${Nombre}
    Set Test Variable    ${Banner}
    Set Test Variable    ${Logo}
    Set Test Variable    ${Estilo}

Configuracion - Presionar boton Guardar
    Click Element    xpath=//*[@id="btnConfigGuardar"]

#Configuracion - Aceptar cambios
    #Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div/div/div
    #Click Element    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div/div/div
    
Configuracion - Validar registro en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select Nombre, TituloAplicacion, Banner, Logo, Estilo from Sismep.TSismepClientes where Nombre='${CteNombre}' and TituloAplicacion = '${Nombre}' and Banner = '${Banner}' and Logo = '${Logo}' and Estilo = '${Estilo}'
    Should Be Equal    ${queryResults[0][0]}    ${CteNombre}
    Should Be Equal    ${queryResults[0][1]}    ${Nombre}
    Should Be Equal    ${queryResults[0][2]}    ${Banner}
    Should Be Equal    ${queryResults[0][3]}    ${Logo}
    Should Be Equal    ${queryResults[0][4]}    ${Estilo}
    Disconnect From Database

Seleccionar TAB Contactos
    Click Element    xpath=//*[@id="tabContactos"]
    Wait Until Element Is Visible    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[7]/div/div[1]
    
Contacto - Validar campo unico Nombre
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select Nombre from Sismep.TSismepClientesContactos where Nombre = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Contacto - Validar campo unico Nombre    ${arg1}
    ...    ELSE    Set Test Variable    ${CtoNombreUnico}    ${Valor}
    Disconnect From Database
    
Contactos - Obtener datos del formulario
    ${CtoNombre}    Get Value    xpath=//*[@id="txtContactoNombre"]/div/div[1]/input
    ${CtoApellido}    Get Value    xpath=//*[@id="txtContactoApellido"]/div/div[1]/input
    ${CtoDireccion}    Get Value    xpath=//*[@id="txtContactoDireccion"]/div/div[1]/input
    ${CtoEstado}    Get Value    xpath=//*[@id="cboContactoEstado"]/div[1]/div/div[1]/input
    ${CtoMunicipio}    Get Value    xpath=//*[@id="cboContactoMunicipio"]/div[1]/div/div[1]/input
    ${CtoLocalidad}    Get Value    xpath=//*[@id="cboContactoLocalidad"]/div[1]/div/div[1]/input
    ${CtoComentario}    Get Value    xpath=//*[@id="txtContactoComentarios"]/div/div[1]/textarea
    Set Test Variable    ${CtoNombre}
    Set Test Variable    ${CtoApellido}
    Set Test Variable    ${CtoDireccion}
    Set Test Variable    ${CtoEstado}
    Set Test Variable    ${CtoMunicipio}
    Set Test Variable    ${CtoLocalidad}
    Set Test Variable    ${CtoComentario}
    
Contactos - Presionar boton Guardar
    Click Element    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[7]/div/div[1]

Contactos - Presionar boton Cancelar
    Click Element    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[7]/div/div[2]
    
Contactos - Presionar boton Eliminar
    Click Element     xpath=//*[@id="btnContactoEliminar"]
    
Contactos - Presionar boton Reactivar
    Click Element    xpath=//*[@id="btnContactoReactivar"]
    
Contactos - Presionar Ver detalle
    Click Element    xpath=//*[@id="gridContacto"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[5]/div/div
    
Contactos - Validar registro en BD
    [Arguments]    ${arg1}=1
    Conexion a Base de Datos
    @{queryResults}    Query    select c.Nombre, cc.Nombre, cc.Apellidos, cc.Direccion, cc.Estado, cc.Municipio, cc.Localidad, cc.Comentarios from Sismep.TSismepClientes c join Sismep.TSismepClientesContactos cc on c.IdCliente = cc.IdCliente where c.Nombre = '${CteNombre}' and cc.Nombre = '${CtoNombre}' and cc.Activo = ${arg1}
    Should Be Equal    ${queryResults[0][0]}    ${CteNombre}
    Should Be Equal    ${queryResults[0][1]}    ${CtoNombre}
    Should Be Equal    ${queryResults[0][2]}    ${CtoApellido}
    Should Be Equal    ${queryResults[0][3]}    ${CtoDireccion}
    Should Be Equal    ${queryResults[0][4]}    ${CtoEstado}
    Should Be Equal    ${queryResults[0][5]}    ${CtoMunicipio}
    Should Be Equal    ${queryResults[0][6]}    ${CtoLocalidad}
    Should Be Equal    ${queryResults[0][7]}    ${CtoComentario}
    Disconnect From Database

Contactos - Validar registro inexistente en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select c.Nombre, cc.Nombre, cc.Apellidos, cc.Direccion, cc.Estado, cc.Municipio, cc.Localidad, cc.Comentarios from Sismep.TSismepClientes c join Sismep.TSismepClientesContactos cc on c.IdCliente = cc.IdCliente where c.Nombre = '${CteNombre}' and cc.Nombre = '${CtoNombre}'
    Disconnect From Database

TelefonoReferencia - Obtener datos del formulario
    ${Tel}    Get Value    xpath=//*[@id="txtTelefono"]/div/div[1]/input
    ${Telefono}=    Execute JavaScript    cadena = '${Tel}'; return cadena.replace('-','').replace('-','');
    ${Referencia}    Get Value    xpath=//*[@id="txtReferencia"]/div/div[1]/input
    Set Test Variable    ${Telefono}
    Set Test Variable    ${Referencia}
    
TelefonoReferencia - Presionar Ver detalle
    Wait Until Element Is Visible    xpath=//*[@id="gridTelefono"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div/div
    Click Element    xpath=//*[@id="gridTelefono"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div/div
    
TelefonoReferencia - Presionar boton Agregar
    Wait Until Element Is Visible    xpath=//*[@id="btnAgregarTelefono"]/div
    Click Element    xpath=//*[@id="btnAgregarTelefono"]/div
    
TelefonoReferencia - Presionar boton Eliminar
    Wait Until Element Is Visible    xpath=//*[@id="gridTelefono"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div/div
    Click Element     xpath=//*[@id="gridTelefono"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div/div
    
TelefonoReferencia - Validar registro en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select c.Nombre, cc.Nombre, cr.Telefono, cr.Referencia from Sismep.TSismepClientes c left join Sismep.TSismepClientesContactos cc on c.IdCliente = cc.IdCliente left join Sismep.TSismepClientesReferencias cr on cc.IdClienteContacto = cr.IdClienteContacto where c.Nombre = '${CteNombre}' and cc.Nombre = '${CtoNombre}' and cr.Telefono = '${Telefono}' and cr.Referencia = '${Referencia}'
    Should Be Equal    ${queryResults[0][0]}    ${CteNombre}
    Should Be Equal    ${queryResults[0][1]}    ${CtoNombre}
    Should Be Equal    ${queryResults[0][2]}    ${Telefono}
    Should Be Equal    ${queryResults[0][3]}    ${Referencia}
    Disconnect From Database
    
TelefonoReferencia - Validar registro inexistente en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select c.Nombre, cc.Nombre, cr.Telefono, cr.Referencia from Sismep.TSismepClientes c left join Sismep.TSismepClientesContactos cc on c.IdCliente = cc.IdCliente left join Sismep.TSismepClientesReferencias cr on cc.IdClienteContacto = cr.IdClienteContacto where c.Nombre = '${CteNombre}' and cc.Nombre = '${CtoNombre}' and cr.Telefono = '${Telefono}' and cr.Referencia = '${Referencia}'
    Disconnect From Database
    
Hacer scroll para ver el Boton Ver Detalle
    Wait Until Element Is Enabled    xpath=//*[@id="gridContacto"]/div/div[5]/div/table/tbody/tr[1]/td[5]/div
    Execute JavaScript    window.document.evaluate('//*[@id="gridContacto"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[5]/div/div', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    
Hacer scroll para ver el TAB Contactos
    Execute JavaScript    window.document.evaluate('//*[@id="tabContactos"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);