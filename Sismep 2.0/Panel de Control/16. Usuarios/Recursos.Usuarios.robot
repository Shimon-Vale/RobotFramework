*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
&{UsuarioError}    Correo=RFErrCorreo    RPassword=RFErrP@ss1
${UsuarioExistente}    7x24
${xpathGridBody}    //*[@id="gridUsuarios"]/div/div[6]/div/div/div[1]/div/table/tbody
${xpathMsg}    //*[@id="ddlMensajes"]
${queryUsername}    select UserName from aspnet_Users where UserName=

*** Keywords ***
Ingresar a opcion Usuarios
    Deslizar scroll hacia abajo
    Click Element    xpath=//*[@id="divMenuList"]/a[18]
    Wait Until Element Is Not Visible    xpath=//*[@id="gridUsuarios"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="gridUsuarios"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30
    
Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="gridUsuarios"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="gridUsuarios"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    
Filtrar por Estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="gridUsuarios"]/div/div[5]/div/table/tbody/tr[2]/td[5]/div/div/div
    Click Element    xpath=//*[@id="gridUsuarios"]/div/div[5]/div/table/tbody/tr[2]/td[5]/div/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Validar formato de correo
    ${attrCorreo}=    Get Element Attribute    xpath=//*[@id="txtEmail"]    regexvalidationmessage
    Should be equal    ${attrCorreo}    Formato de correo no valido
    
Obtener datos del formulario - TAB Usuario
    ${Cliente}=    Get Value    xpath=//*[@id="ddlCliente"]/div[1]/div/div[1]/input
    ${Nombre}=    Get Value    xpath=//*[@id="txtNombreCompleto"]/div/div[1]/input
    ${Usuario}=    Get Value   xpath=//*[@id="txtUsuario"]/div/div[1]/input
    ${Correo}=    Get Value    xpath=//*[@id="txtEmail"]/div/div[1]/input
    Set Test Variable    ${Cliente}
    Set Test Variable    ${Nombre}
    Set Test Variable    ${Usuario}
    Set Test Variable    ${Correo}
    
Presionar opcion Guardar
    Click Element    xpath=//*[@id="btnUsuarioGuardar"]
    
Presionar opcion Cancelar
    Click Element    xpath=//*[@id="tabEditarUsuario"]/div[14]/div/div[2]
    
Presionar opcion Desactivar
    Click Element    xpath=//*[@id="btnUsuarioDesactivar"]
    
Presionar opcion Reactivar
    Click Element    xpath=//*[@id="btnUsuarioReactivar"]
    
Presionar opcion Actualizar contrasena
    Wait Until Element Is Visible    xpath=//*[@id="btnActualizarContrasena"]
    Click Element    xpath=//*[@id="btnActualizarContrasena"]
    
Presionar opcion Guardar contrasena
    Click Element    xpath=//*[@id="tabEditarUsuario"]/div[9]/div[2]/div/div[1]/div
    
Cerrar ventana del formulario
    Click Element    xpath=/html/body/div[3]/div/div[1]/div/div[3]/div/div/div
    
Cerrar sesion
    Click Element    xpath=//*[@id="navbarDropdown"]
    Wait Until Element Is Visible    xpath=//*[@id="page-content-wrapper"]/nav/div[3]/ul/li/div
    Click Element    xpath=//*[@id="page-content-wrapper"]/nav/div[3]/ul/li/div
    
Iniciar sesion con usuario creado
    [Arguments]    ${arg1}    ${arg2}
    Wait Until Element Is Visible	xpath=//*[@id="Usuario"]
    Wait Until Element Is Visible	xpath=//*[@id="Password"]
    Input Text    name=Usuario    ${arg1}
    Input Password    name=Password    ${arg2}
    Click Element    id=btnLogin
    
Validar inicio de sesion
    Wait Until Element Is Visible    xpath=//*[@id="navbarDropdown"]
    Element Text Should Be    xpath=//*[@id="navbarDropdown"]    ${Usuario}
    
Ingresar a opcion Roles
    Click Element    xpath=//*[@id="lnkTabRoles"]
        
Seleccionar Rol
    Click Element    xpath=//*[@id="ddlRoles"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[2]
    
Presionar opcion Agregar Rol
    Click Element    xpath=//*[@id="btnAgregarRoles"]
    
Presionar opcion Eliminar Rol
    Click Element    xpath=//*[@id="dataGridRoles"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div
    
Obtener datos del Grid Roles
    ${Rol}=    Get text    xpath=//*[@id="dataGridRoles"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    Set Test Variable    ${Rol}
    
Ingresar a opcion Mensajes
    Click Element    xpath=//*[@id="lnkTabMensajes"]
    
Capturar datos del Mensaje Todo Verdadero
    Seleccionar Mensaje
    Presionar opcion Mostrar Alerta
    Presionar opcion Tipo Usuario Ejecutor
    Presionar opcion Cierre Automatico
    Presionar opcion Confirmar Mensaje
    
Seleccionar Mensaje
    Click Element    xpath=//*[@id="ddlMensajes"]/div[1]/div/div[2]/div[2]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[5]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[5]

Seleccionar Mensaje edicion
    Click Element    xpath=//*[@id="ddlMensajes"]/div[1]/div/div[2]/div[2]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[5]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[2]
    
Presionar opcion Mostrar Alerta
    Click Element    xpath=//*[@id="chkMostrarAlerta"]
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[1]/div[2]/div/div/div[1]
    
Presionar opcion Tipo Usuario Ejecutor
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[1]/div[2]/div/div/div[1]
    
Presionar opcion Cierre Automatico
    Click Element    xpath=//*[@id="chkCierreAutomatico"]
    
Presionar opcion Confirmar Mensaje
    Click Element    xpath=//*[@id="chkConfirmarMensaje"]
    
Presionar opcion Agregar Mensaje
    Click Element    xpath=//*[@id="tabMesaje_btnSave"]
    
Presionar opcion Eliminar Mensaje
    Click Element    xpath=//*[@id="dataGridMensajes"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[6]/div

Presionar opcion Ver detalle Mensaje
    Click Element    xpath=//*[@id="dataGridMensajes"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[7]/div

Presionar opcion Guardar Mensaje
    Click Element    xpath=//*[@id="tabMesaje_btnSave"]

Presionar opcion Cancelar Mensaje
    Click Element    xpath=//*[@id="tabMesaje_btnRemove"]

Obtener datos del Grid Mensajes
    ${Mensaje}=    Get text    xpath=//*[@id="dataGridMensajes"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${attrAlerta}=    Get Element Attribute    xpath=//*[@id="dataGridMensajes"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]/span/i    class
    ${attrTipo}=    Get text    xpath=//*[@id="dataGridMensajes"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]
    ${attrCierre}=    Get Element Attribute    xpath=//*[@id="dataGridMensajes"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/span/i    class
    ${attrConfirmar}=    Get Element Attribute    xpath=//*[@id="dataGridMensajes"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[5]/span/i    class
    ${Alerta}=    Execute Javascript    if('${attrAlerta}'=='fas fa-check-circle') {return true} else {return false};
    ${Tipo}=    Execute Javascript    if('${attrTipo}'=='Ejecutor') {return true} else {return false};
    ${Cierre}=    Execute Javascript    if('${attrCierre}'=='fas fa-check-circle') {return true} else {return false};
    ${Confirmar}=    Execute Javascript    if('${attrConfirmar}'=='fas fa-check-circle') {return true} else {return false};
    Set Test Variable    ${Mensaje}
    Set Test Variable    ${Alerta}
    Set Test Variable    ${Tipo}
    Set Test Variable    ${Cierre}
    Set Test Variable    ${Confirmar}
    
Aceptar mensaje
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div/div/div
    Click Element    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div/div/div
    
Validar usuario en BD
    [Arguments]    ${arg1}=1
    Conexion a Base de Datos
    @{queryResults}    Query    select c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.UserName = '${Usuario}' and u.Activo = ${arg1}
    Should Be Equal    ${queryResults[0][0]}    ${Cliente}
    Should Be Equal    ${queryResults[0][1]}    ${Nombre}
    Should Be Equal    ${queryResults[0][2]}    ${Usuario}
    Should Be Equal    ${queryResults[0][3]}    ${Correo}
    Disconnect From Database
    
Validar numero de usuarios en BD
    [Arguments]    ${arg1}
    Conexion a Base de Datos
    Row Count Is Equal To X    select c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.UserName = '${Usuario}' and c.Nombre = '${Cliente}' and u.Activo = 1    ${arg1}
    Disconnect From Database
    
Validar rol en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select u.UserName, r.RoleName from aspnet_Users u join aspnet_UsersInRoles ur on u.UserId = ur.UserId join aspnet_Roles r on ur.RoleId = r.RoleId where u.UserName = '${Usuario}' and r.RoleName = '${Rol}'
    Should Be Equal    ${queryResults[0][0]}    ${Usuario}
    Should Be Equal    ${queryResults[0][1]}    ${Rol}
    Disconnect From Database
    
Validar rol eliminado en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select u.UserName, r.RoleName from aspnet_Users u join aspnet_UsersInRoles ur on u.UserId = ur.UserId join aspnet_Roles r on ur.RoleId = r.RoleId where u.UserName = '${Usuario}' and r.RoleName = '${Rol}'
    Should be empty    ${queryResults}
    Disconnect From Database
    
Validar mensaje en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select u.UserName, em.Descripcion, ue.Alerta, ue.Ejecutor, ue.CierreAutomatico, ue.Confirmacion from aspnet_Users u join Sismep.TSismepUsuariosEstatus ue on u.UserId = ue.IdUsuario join Sismep.TSismepEstatusMensajes em on ue.IdEstatusMensaje = em.IdEstatusMensaje where u.UserName = '${Usuario}' and em.Descripcion = '${Mensaje}'
    Should Be Equal    ${queryResults[0][0]}    ${Usuario}
    Should Be Equal    ${queryResults[0][1]}    ${Mensaje}
    Should Be Equal    ${queryResults[0][2]}    ${Alerta}
    Should Be Equal    ${queryResults[0][3]}    ${Tipo}
    Should Be Equal    ${queryResults[0][4]}    ${Cierre}
    Should Be Equal    ${queryResults[0][5]}    ${Confirmar}
    Disconnect From Database
    
Validar mensaje eliminado en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select u.UserName, em.Descripcion, ue.Alerta, ue.Ejecutor, ue.CierreAutomatico, ue.Confirmacion from aspnet_Users u join Sismep.TSismepUsuariosEstatus ue on u.UserId = ue.IdUsuario join Sismep.TSismepEstatusMensajes em on ue.IdEstatusMensaje = em.IdEstatusMensaje where u.UserName = '${Usuario}' and em.Descripcion = '${Mensaje}'
    Should be empty    ${queryResults}
    Disconnect From Database
    
Validar etiquetas TAB Roles
    Element Text Should Be    xpath=//*[@id="lnkTabRoles"]    Roles
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[2]/div[1]/div[1]    Roles:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[2]/div[2]/div/div[5]/div/table/tbody/tr[1]/td[1]    Nombre Rol
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[2]/div[2]/div/div[5]/div/table/tbody/tr[1]/td[2]    Descripción
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[2]/div[2]/div/div[5]/div/table/tbody/tr[1]/td[3]    Estatus
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[2]/div[2]/div/div[5]/div/table/tbody/tr[1]/td[4]    Acciones
    
Validar etiquetas TAB Mensajes
    Element Text Should Be    xpath=//*[@id="lnkTabMensajes"]    Mensajes
    Element Text Should Be    xpath=//*[@id="tabMensajes"]/div[1]/div[1]    Mensajes:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[1]/div/div[1]    Mostrar alerta:
    Element Text Should Be    xpath=//*[@id="tabMensajes"]/div[1]/div[2]/div[2]/div[2]/div[1]/div[1]    Tipo Usuario:
    Element Text Should Be    xpath=//*[@id="tabMensajes"]/div[1]/div[2]/div[2]/div[2]/div[2]/div[1]    Cierre Automático:
    Element Text Should Be    xpath=//*[@id="tabMensajes"]/div[1]/div[2]/div[2]/div[2]/div[3]/div[1]    Confirmar Mensaje:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[1]/div[2]/div/div/div[1]/div[2]    Ejecutor
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[1]/div[2]/div/div/div[2]/div[2]    Visor
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[3]/div[3]/div/div[5]/div/table/tbody/tr[1]/td[1]    Mensaje
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[3]/div[3]/div/div[5]/div/table/tbody/tr[1]/td[2]    Alerta
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[3]/div[3]/div/div[5]/div/table/tbody/tr[1]/td[3]    Tipo Usuario
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[3]/div[3]/div/div[5]/div/table/tbody/tr[1]/td[4]    Cierre
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[3]/div[3]/div/div[5]/div/table/tbody/tr[1]/td[5]    Confirmar
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[3]/div[3]/div/div[5]/div/table/tbody/tr[1]/td[6]    Eliminar
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[3]/div[3]/div/div[5]/div/table/tbody/tr[1]/td[7]    Detalle
    
Deslizar scroll hacia abajo
    Execute JavaScript    window.document.evaluate('//*[@id="divMenuList"]/a[18]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=//*[@id="divMenuList"]/a[18]    timeout=15
    
Validacion de campo obligatorio oculto
    [Arguments]    ${campo}
    ${attrCampo}=    Get Element Attribute    xpath=${campo}    class
    Should Not Contain    ${attrCampo}    dx-invalid

Presionar Orden por
    [Arguments]    ${columna}
    Click Element    xpath=${columna}