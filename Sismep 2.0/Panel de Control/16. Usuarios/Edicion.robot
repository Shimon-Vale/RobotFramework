*** Settings ***
Resource    Recursos.Usuarios.robot

*** Variables ***
&{UsuarioEditar}    Nombre=RFNombreEditar    Usuario=RFUsuarioEditar    Correo=RFCorreoEditar@astrum.com.mx
&{UsuarioPassword}    Password=RFNewP@ss1Editar    RPassword=RFNewP@ss1Editar
${UsuarioFiltro}    RFUsuario
${colUsuario}    //*[@id="dx-col-26"]

*** Test Cases ***
Editar - TAB Usuario - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Editar - TAB Usuario - Validar etiquetas y tooltips
    Iniciar sesion
    Ingresar a opcion Usuarios
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Validar etiquetas y tooltips TAB Usuario
    [Teardown]    Close Browser
    
Editar - TAB Usuario - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente los cambios.
    [Tags]    Editar - TAB Usuario - Validar opcion Guardar
    Iniciar sesion
    Ingresar a opcion Usuarios
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Editar datos del formulario Usuario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Obtener datos del formulario - TAB Usuario
    Validar usuario en BD
    [Teardown]    Close Browser
    
Editar - TAB Usuario - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de edicion y no guardar cambios en la BD.
    [Tags]    Editar - TAB Usuario - Validar opcion Cancelar
    Iniciar sesion
    Ingresar a opcion Usuarios
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Editar datos del formulario Usuario
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Presionar opcion Cancelar
    Sleep    2
    Validar numero de usuarios en BD    0
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Editar - TAB Usuario - Validar opcion Desactivar
    [Documentation]    Debera inactivar el usuario correctamente.
    [Tags]    Editar - TAB Usuario - Validar opcion Desactivar
    Iniciar sesion
    Ingresar a opcion Usuarios
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Presionar opcion Desactivar
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar mensaje    Cambios guardados.
    Validar usuario en BD    0
    [Teardown]    Close Browser
    
Editar - TAB Usuario - Validar opcion Reactivar
    [Documentation]    Debera reactivar el usuario correctamente.
    [Tags]    Editar - TAB Usuario - Validar opcion Reactivar
    Iniciar sesion
    Ingresar a opcion Usuarios
    Filtrar por Estatus    3
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Presionar opcion Reactivar
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar mensaje    Cambios guardados.
    Validar usuario en BD
    [Teardown]    Close Browser
    
Editar - TAB Usuario - Usuario duplicado
    [Documentation]    Debera mostrar una validacion indicando que el usuario esta duplicado.
    [Tags]    Editar - TAB Usuario - Usuario duplicado
    Iniciar sesion
    Ingresar a opcion Usuarios
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Editar datos del formulario Usuario duplicado    ${UsuarioExistente}
    Sleep    1
    Presionar opcion Guardar
    Obtener datos del formulario - TAB Usuario
    Validar mensaje    Ya existe el usuario '${Usuario}' para el cliente '${Cliente}'
    Validar numero de usuarios en BD    0
    [Teardown]    Close Browser
    
Editar - TAB Usuario - Actualizar contrasena
    [Documentation]    Debera permitir actualizar la contrasena correctamente.
    [Tags]    Editar - TAB Usuario - Actualizar contrasena
    Iniciar sesion
    Ingresar a opcion Usuarios
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Presionar opcion Actualizar contrasena
    Capturar nueva contrasena
    Presionar opcion Guardar contrasena
    Validar mensaje    Contraseña actualizada
    [Teardown]    Close Browser
    
Editar - TAB Usuario - Actualizar contrasena - Validar inicio de sesion
    [Documentation]    Debera permitir iniciar sesion con la contrasena actualizada.
    [Tags]    Editar - TAB Usuario - Actualizar contrasena - Validar inicio de sesion
    Iniciar sesion
    Ingresar a opcion Usuarios
    Obtener Usuario sin Roles
    Filtrar por Columna 3 y Campo ${username}
    Sleep    1
    Presionar Orden por    ${colUsuario}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Presionar opcion Actualizar contrasena
    Capturar nueva contrasena
    Presionar opcion Guardar contrasena
    Validar mensaje    Contraseña actualizada
    Ingresar a opcion Roles
    Seleccionar Rol
    Sleep    1
    Presionar opcion Agregar Rol
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Roles
    Validar rol en BD
    Cerrar ventana del formulario
    Cerrar sesion
    Sleep    1
    Iniciar sesion con usuario creado    ${Usuario}    ${UsuarioPassword}[Password]
    Validar inicio de sesion
    [Teardown]    Close Browser
    
Editar - TAB Usuario - Mostrar validacion de campos requeridos
    [Documentation]    Debera mostrar la validacion indicando cuales son los campos requeridos.
    [Tags]    Editar - TAB Usuario - Mostrar validacion de campos requeridos
    Iniciar sesion
    Ingresar a opcion Usuarios
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Dejar vacio los campos del TAB Usuarios
    Mostrar campos obligatorios en TAB Usuario
    [Teardown]    Close Browser

Editar - TAB Usuario - Actualizar contrasena - Validacion de campos requeridos.
    [Documentation]    Debera mostrar en rojo los campos obligatorios al actualizar la contrasena
    [Tags]    Editar - TAB Usuario - Actualizar contrasena - Mostrar validacion de campos requeridos.
    Iniciar sesion
    Ingresar a opcion Usuarios
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Presionar opcion Actualizar contrasena
    Presionar opcion Guardar contrasena
    Validar campos obligatorios en TAB Usuario Actualizar contrasena
    [Teardown]    Close Browser
    
Editar - TAB Usuario - Actualizar contrasena - Validacion de campos requeridos ocultos.
    [Documentation]    Debera de validar que al ingresar a un nuevo Usuario los campos requeridos
        ...    se encuentren ocultos.
    [Tags]    Editar - TAB Usuario - Actualizar contrasena - Validacion de campos requeridos ocultos.
    Iniciar sesion
    Ingresar a opcion Usuarios
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Presionar opcion Actualizar contrasena
    Presionar opcion Guardar contrasena
    Presionar opcion Cancelar
    Sleep    1
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Presionar opcion Actualizar contrasena
    Validar campos requeridos ocultos en TAB Usuario Actualizar contrasena
    [Teardown]    Close Browser
    

Editar - TAB Usuario - Validacion para formato de correo electronico
    [Documentation]    Debera mostrar la validacion indicando el correcto formato del correo.
    [Tags]    Editar - TAB Usuario - Mostrar validacion para formato de correo electronico
    Iniciar sesion
    Ingresar a opcion Usuarios
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Capturar un correo con formato erroneo
    Validar formato de correo
    [Teardown]    Close Browser
    
Editar - TAB Usuario - Mostrar validacion de contrasenas
    [Documentation]    Debera mostrar una validacion indicando que la contrasena no es valida.
    [Tags]    Editar - TAB Usuario - Mostrar validacion de contrasenas
    Iniciar sesion
    Ingresar a opcion Usuarios
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Presionar opcion Actualizar contrasena
    Capturar nueva contrasena    arg2=${UsuarioError}[RPassword]
    Presionar opcion Guardar contrasena
    Validar mensaje    La contrase\u00f1a no es v\u00e1lida    #Javascript Code
    [Teardown]    Close Browser
    
Editar - TAB Roles - Agregar Rol
    [Documentation]    Debera permitir aregar un Rol al usuario.
    [Tags]    Editar - TAB Roles - Agregar Rol
    Iniciar sesion
    Ingresar a opcion Usuarios
    Obtener Usuario sin Roles
    Filtrar por Columna 3 y Campo ${username}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Ingresar a opcion Roles
    Seleccionar Rol
    Sleep    1
    Presionar opcion Agregar Rol
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Roles
    Validar rol en BD
    [Teardown]    Close Browser
    
Editar - TAB Roles - Validar mensaje para Rol duplicado
    [Documentation]    Debera mostrar una validacion indicando que el rol esta duplicado.
    [Tags]    Editar - TAB Roles - Validar mensaje para Rol duplicado
    Iniciar sesion
    Ingresar a opcion Usuarios
    Obtener Usuario con Roles
    Filtrar por Columna 3 y Campo ${username}
    Sleep    1
    Presionar Orden por    ${colUsuario}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Ingresar a opcion Roles
    Seleccionar Rol
    Sleep    1
    Presionar opcion Agregar Rol
    Validar mensaje    El registro ya existe.
    Obtener datos del Grid Roles
    Validar rol en BD
    [Teardown]    Close Browser
    
Editar - TAB Roles - Eliminar Rol
    [Documentation]    Debera permitir eliminar un Rol del usuario.
    [Tags]    Editar - TAB Roles - Eliminar Rol
    Iniciar sesion
    Ingresar a opcion Usuarios
    Obtener Usuario con Roles
    Filtrar por Columna 3 y Campo ${username}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Ingresar a opcion Roles
    Sleep    1
    Obtener datos del Grid Roles
    Presionar opcion Eliminar Rol
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro eliminado.
    Validar rol eliminado en BD
    [Teardown]    Close Browser
    
Editar - TAB Roles - Validar etiquetas
    [Documentation]    Debera mostrar correctamente escritas las etiquetas.
    [Tags]    Editar - TAB Roles - Validar etiquetas
    Iniciar sesion
    Ingresar a opcion Usuarios
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Ingresar a opcion Roles
    Validar etiquetas TAB Roles
    [Teardown]    Close Browser
    
Editar - TAB Mensajes - Agregar Mensaje - Todo verdadero
    [Documentation]    Debera permitir agregar un mensaje activado todas las casillas.
    [Tags]    Editar - TAB Mensajes - Agregar Mensaje - Todo verdadero
    Iniciar sesion
    Ingresar a opcion Usuarios
    Obtener Usuario sin Mensajes
    Filtrar por Columna 3 y Campo ${username}
    Sleep    1
    Presionar Orden por    ${colUsuario}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Ingresar a opcion Mensajes
    Capturar datos del Mensaje Todo Verdadero
    Sleep    1
    Presionar opcion Agregar Mensaje
    Validar mensaje    Registro guardado.
    Validacion de campo obligatorio oculto    ${xpathMsg}
    Sleep    2
    Obtener datos del Grid Mensajes
    Validar mensaje en BD
    [Teardown]    Close Browser
    
Editar - TAB Mensajes - Agregar Mensaje - Todo falso
    [Documentation]    Debera permitir agregar un mensaje sin ninguna casilla activada.
    [Tags]    Editar - TAB Mensajes - Agregar Mensaje - Todo falso
    Iniciar sesion
    Ingresar a opcion Usuarios
    Obtener Usuario sin Mensajes
    Filtrar por Columna 3 y Campo ${username}
    Sleep    1
    Presionar Orden por    ${colUsuario}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Ingresar a opcion Mensajes
    Seleccionar Mensaje
    Sleep    1
    Presionar opcion Agregar Mensaje
    Validar mensaje    Registro guardado.
    Validacion de campo obligatorio oculto    ${xpathMsg}
    Sleep    2
    Obtener datos del Grid Mensajes
    Validar mensaje en BD
    [Teardown]    Close Browser

Editar - TAB Mensajes - Editar Mensaje
    [Documentation]    Debera permitir editar un mensaje y guardar los cambios.
    [Tags]    Editar - TAB Mensajes - Editar Mensaje
    Iniciar sesion
    Ingresar a opcion Usuarios
    Obtener Usuario con Mensajes
    Filtrar por Columna 3 y Campo ${username}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Ingresar a opcion Mensajes
    Sleep    1
    Presionar opcion Ver detalle Mensaje
    Sleep    1
    Seleccionar Mensaje edicion
    Sleep    1
    Presionar opcion Guardar Mensaje
    Validar mensaje    Cambios guardados.
    Validacion de campo obligatorio oculto    ${xpathMsg}
    Sleep    1
    Obtener datos del Grid Mensajes
    Validar mensaje en BD
    [Teardown]    Close Browser

Editar - TAB Mensajes - Validar opcion Cancelar
    [Documentation]    Debera permitir editar un mensaje y guardar los cambios.
    [Tags]    Editar - TAB Mensajes - Validar opcion Cancelar
    Iniciar sesion
    Ingresar a opcion Usuarios
    Obtener Usuario con Mensajes
    Filtrar por Columna 3 y Campo ${username}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Ingresar a opcion Mensajes
    Sleep    1
    Presionar opcion Ver detalle Mensaje
    Sleep    1
    Seleccionar Mensaje
    Sleep    1
    Presionar opcion Cancelar Mensaje
    Sleep    1
    Validacion de campo obligatorio oculto    ${xpathMsg}
    Sleep    2
    Obtener datos del Grid Mensajes
    Validar mensaje en BD
    [Teardown]    Close Browser
    
Editar - TAB Mensajes - Validar aviso para Mensaje duplicado
    [Documentation]    Debera mostrar una validacion indicando que el mensaje esta duplicado.
    [Tags]    Editar - TAB Mensajes - Validar aviso para Mensaje duplicado
    Iniciar sesion
    Ingresar a opcion Usuarios
    Obtener Usuario con Mensajes
    Filtrar por Columna 3 y Campo ${username}
    Sleep    1
    Presionar Orden por    ${colUsuario}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Ingresar a opcion Mensajes
    Sleep    2
    Seleccionar Mensaje
    Sleep    1
    Presionar opcion Agregar Mensaje
    Validar mensaje    El registro ya existe.
    Obtener datos del Grid Mensajes
    Validar mensaje en BD
    [Teardown]    Close Browser
    
Editar - TAB Mensajes - Eliminar Mensaje
    [Documentation]    Debera permitir eliminar un mensaje del usuario.
    [Tags]    Editar - TAB Mensajes - Eliminar Mensaje
    Iniciar sesion
    Ingresar a opcion Usuarios
    Obtener Usuario con Mensajes
    Filtrar por Columna 3 y Campo ${username}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Ingresar a opcion Mensajes
    Obtener datos del Grid Mensajes
    Presionar opcion Eliminar Mensaje
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro eliminado.
    Validacion de campo obligatorio oculto    ${xpathMsg}
    Validar mensaje eliminado en BD
    [Teardown]    Close Browser
    
Editar - TAB Mensajes - Validar etiquetas
    [Documentation]    Debera validar que se muestren correctamente escritas las etiquetas de Mensajes.
    [Tags]    Editar - TAB Mensajes - Validar etiquetas
    Iniciar sesion
    Ingresar a opcion Usuarios
    Filtrar por Columna 3 y Campo ${UsuarioFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Ingresar a opcion Mensajes
    Validar etiquetas TAB Mensajes
    [Teardown]    Close Browser

*** Keywords ***
Ingresar al detalle del registro No. ${arg1} en el grid
    Wait Until Element Is Visible    xpath=//*[@id="gridUsuarios"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[6]/div
    Click Element    xpath=//*[@id="gridUsuarios"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[6]/div
    Wait Until Element Is Enabled    xpath=//*[@id="btnUsuarioGuardar"]
    
Editar datos del formulario Usuario
    Validar registro unico    ${UsuarioEditar}[Usuario]    ${queryUsername}
    Seleccionar Cliente    2
    Input Text    xpath=//*[@id="txtNombreCompleto"]/div/div[1]/input    ${UsuarioEditar}[Nombre]
    Input Text    xpath=//*[@id="txtUsuario"]/div/div[1]/input    ${valorUnico}
    Input Text    xpath=//*[@id="txtEmail"]/div/div[1]/input    ${UsuarioEditar}[Correo]
    
Editar datos del formulario Usuario duplicado
    [Arguments]    ${arg1}
    Seleccionar Cliente    2
    Input Text    xpath=//*[@id="txtNombreCompleto"]/div/div[1]/input    ${UsuarioEditar}[Nombre]
    Input Text    xpath=//*[@id="txtUsuario"]/div/div[1]/input    ${arg1}
    Input Text    xpath=//*[@id="txtEmail"]/div/div[1]/input    ${UsuarioEditar}[Correo]
    
Capturar un correo con formato erroneo
    Input Text    xpath=//*[@id="txtEmail"]/div/div[1]/input    ${UsuarioError}[Correo]
    
Capturar una contrasena diferente
    Input Text    xpath=//*[@id="txtConfirmarContrasena"]/div/div[1]/input    ${UsuarioError}[RPassword]
    
Capturar nueva contrasena
    [Arguments]    ${arg1}=${UsuarioPassword}[Password]    ${arg2}=${UsuarioPassword}[RPassword]
    Input Text    xpath=//*[@id="txtContrasena"]/div/div[1]/input    ${arg1}
    Input Text    xpath=//*[@id="txtConfirmarContrasena"]/div[1]/div[1]/input    ${arg2}
    
Dejar vacio los campos del TAB Usuarios
    Input Text    xpath=//*[@id="txtNombreCompleto"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtUsuario"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtEmail"]/div/div[1]/input    ${EMPTY}
    
Seleccionar Cliente
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="ddlCliente"]/div[1]/div/div[2]/div[2]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]/div
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]/div
    
Mostrar campos obligatorios en TAB Usuario
    ${Nombre}    Execute Javascript    return document.getElementsByClassName("sismep-textbox dx-textbox dx-texteditor dx-editor-outlined dx-widget dx-validator dx-visibility-change-handler dx-texteditor-empty dx-invalid")[0].textContent;
    ${Usuario}    Execute Javascript    return document.getElementsByClassName("sismep-textbox dx-textbox dx-texteditor dx-editor-outlined dx-widget dx-validator dx-visibility-change-handler dx-texteditor-empty dx-invalid")[0].textContent;
    ${Correo}    Execute Javascript    return document.getElementsByClassName("sismep-textbox dx-textbox dx-texteditor dx-editor-outlined dx-widget dx-validator dx-visibility-change-handler dx-texteditor-empty dx-invalid")[0].textContent;
    Should be equal    ${Nombre}    Obligatorio
    Should be equal    ${Usuario}    Obligatorio
    Should be equal    ${Correo}    Obligatorio

Validar campos obligatorios en TAB Usuario Actualizar contrasena
    ${reqPassword}=    Get Element Attribute    xpath=//*[@id="txtContrasena"]    textContent
    ${reqRPassword}=    Get Element Attribute    xpath=//*[@id="txtConfirmarContrasena"]    textContent
    Should Be Equal     ${reqPassword}    Obligatorio
    Should Be Equal     ${reqRPassword}    Obligatorio

Validar campos requeridos ocultos en TAB Usuario Actualizar contrasena
    ${reqPassword}=    Get Element Attribute    xpath=//*[@id="txtContrasena"]    textContent
    ${reqRPassword}=    Get Element Attribute    xpath=//*[@id="txtConfirmarContrasena"]    textContent
    Should Be Empty     ${reqPassword}
    Should Be Empty     ${reqRPassword}

Obtener Usuario sin Roles
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 u.UserName from aspnet_Users u left join aspnet_UsersInRoles ur on u.UserId = ur.UserId left join aspnet_Roles r on ur.RoleId = r.RoleId where u.UserName like '${UsuarioFiltro}%' and r.RoleName is null and u.Activo=1
    Set Test Variable    ${username}    ${queryResults[0][0]}
    Disconnect From Database
    
Obtener Usuario con Roles
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 u.UserName from aspnet_Users u left join aspnet_UsersInRoles ur on u.UserId = ur.UserId left join aspnet_Roles r on ur.RoleId = r.RoleId where u.UserName like '${UsuarioFiltro}%' and r.RoleName is not null and u.Activo=1
    Set Test Variable    ${username}    ${queryResults[0][0]}
    Disconnect From Database
    
Obtener Usuario sin Mensajes
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 u.UserName from aspnet_Users u left join Sismep.TSismepUsuariosEstatus ue on u.UserId = ue.IdUsuario left join Sismep.TSismepEstatusMensajes em on ue.IdEstatusMensaje = em.IdEstatusMensaje where u.UserName like '${UsuarioFiltro}%' and em.Descripcion is null and u.Activo=1
    Set Test Variable    ${username}    ${queryResults[0][0]}
    Disconnect From Database
    
Obtener Usuario con Mensajes
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 u.UserName from aspnet_Users u left join Sismep.TSismepUsuariosEstatus ue on u.UserId = ue.IdUsuario left join Sismep.TSismepEstatusMensajes em on ue.IdEstatusMensaje = em.IdEstatusMensaje where u.UserName like '${UsuarioFiltro}%' and em.Descripcion is not null and u.Activo=1
    Set Test Variable    ${username}    ${queryResults[0][0]}
    Disconnect From Database
    
Validar etiquetas y tooltips TAB Usuario
    ${ttGuardar}=    Get Element Attribute    xpath=//*[@id="btnUsuarioGuardar"]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=//*[@id="tabEditarUsuario"]/div[14]/div/div[2]    tooltip
    ${ttDesactivar}=    Get Element Attribute    xpath=//*[@id="btnUsuarioDesactivar"]    tooltip
    ${ttReactivar}=    Get Element Attribute    xpath=//*[@id="btnUsuarioReactivar"]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div    Editar Usuario ${Usuario}
    Element Text Should Be    xpath=//*[@id="lnkTabEditarUsuario"]    Usuario
    Element Text Should Be    xpath=//*[@id="tabEditarUsuario"]/div[1]/div[1]    Cliente:
    Element Text Should Be    xpath=//*[@id="tabEditarUsuario"]/div[2]/div[1]    Nombre Completo:
    Element Text Should Be    xpath=//*[@id="tabEditarUsuario"]/div[3]/div[1]    Usuario:
    Element Text Should Be    xpath=//*[@id="tabEditarUsuario"]/div[4]/div[1]    Correo:
    Element Text Should Be    xpath=//*[@id="tabEditarUsuario"]/div[5]/div[1]    Estatus:
    Element Text Should Be    xpath=//*[@id="tabEditarUsuario"]/div[8]/div[1]    Contraseña:
    Element Text Should Be    xpath=//*[@id="btnActualizarContrasena"]/div/span    Actualizar Contraseña
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    Should be equal    ${ttDesactivar}    Desactivar
    Should be equal    ${ttReactivar}    Reactivar