*** Settings ***
Resource    Recursos.Usuarios.robot

*** Variables ***
&{UsuarioCrear}    Nombre=RFNombre    Usuario=RFUsuario    Correo=RFCorreo@astrum.com.mx    Password=RFP@ss1    RPassword=RFP@ss1
&{UsuarioPassword}    Password=RFNewP@ss1    RPassword=RFNewP@ss1
${btnGuardar}    //*[@id="btnUsuarioGuardar"]

*** Test Cases ***
Crear - TAB Usuario - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Crear - TAB Usuario - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Validar etiquetas y tooltips TAB Usuario
    [Teardown]    Close Browser
    
Crear - TAB Usuario - Validar opcion Guardar
    [Documentation]    Valida que se guarde correctamente el registro del Usuario en la BD.
    [Tags]    Crear - TAB Usuario - Validar opcion Guardar - T213
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Validar campos obligatorios en TAB Usuarios ocultos
    Obtener datos del formulario - TAB Usuario
    Validar usuario en BD
    [Teardown]    Close Browser

Crear - TAB Usuario - Validar opcion Cancelar
    [Documentation]    Debera cancelar la acción de Nuevo registro sin guardar en la BD.
    [Tags]    Crear - TAB Usuario - Validar opcion Cancelar - T212
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Sleep    1
    Obtener datos del formulario - TAB Usuario
    Presionar opcion Cancelar
    Sleep    2
    Validar numero de usuarios en BD    0
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Crear - TAB Usuario - Validar inicio de sesion
    [Documentation]    Debera permitir iniciar sesión con un Usuario nuevo.
    [Tags]    Crear - TAB Usuario - Validar inicio de sesion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Usuario
    Validar usuario en BD
    Sleep    1
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
    Iniciar sesion con usuario creado    ${Usuario}    ${UsuarioCrear}[Password]
    Validar inicio de sesion
    [Teardown]    Close Browser
    
Crear - TAB Usuario - Usuario duplicado
    [Documentation]    Debera mostrar una validacion indicando que el usuario ya existe.
    [Tags]    Crear - TAB Usuario - Usuario duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario Usuario duplicado    ${UsuarioExistente}
    Sleep    1
    Presionar opcion Guardar
    Obtener datos del formulario - TAB Usuario
    Validar mensaje    Ya existe el usuario '${Usuario}' para el cliente '${Cliente}'
    Validar numero de usuarios en BD    1
    [Teardown]    Close Browser
    
Crear - TAB Usuario - Actualizar contrasena
    [Documentation]    Debera permitir cambiar la contrasena de un usuario.
    [Tags]    Crear - TAB Usuario - Actualizar contrasena
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Usuario
    Validar usuario en BD
    Sleep    1
    Presionar opcion Actualizar contrasena
    Capturar nueva contrasena
    Presionar opcion Guardar contrasena
    Validar mensaje    Contraseña actualizada
    [Teardown]    Close Browser

Crear - TAB Usuario - Actualizar contrasena - Validar inicio de sesion
    [Documentation]    Debera permitir iniciar sesión al modificar la contrasena de un usuario.
    [Tags]    Crear - TAB Usuario - Actualizar contrasena - Validar inicio de sesion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Usuario
    Validar usuario en BD
    Sleep    1
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
    
Crear - TAB Usuario - Validacion de campos requeridos
    [Documentation]    Debera indicar los campos obligatorios de la pestana Usuarios.
    [Tags]    Crear - TAB Usuario - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Presionar opcion Guardar
    Validar campos obligatorios en TAB Usuario
    [Teardown]    Close Browser

Crear - TAB Usuario - Validar campos requeridos ocultos
    [Documentation]    Debera validar que al agregar un nuevo Usuario se encuentren ocultos
        ...    los campos obligatorios.
    [Tags]    Crear - TAB Usuario - Actualizar contrasena - Validar campos requeridos ocultos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Presionar opcion Guardar
    Presionar opcion Cancelar
    Sleep    1
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Validar campos obligatorios en TAB Usuarios ocultos
    [Teardown]    Close Browser
    
Crear - TAB Usuario - Mostrar validacion para formato de correo electronico
    [Documentation]    Debera mostrar una validacion indicando el formato correcto del correo.
    [Tags]    Crear - TAB Usuario - Mostrar validacion para formato de correo electronico
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Capturar un correo con formato erroneo
    Validar formato de correo
    [Teardown]    Close Browser
    
Crear - TAB Usuario - Mostrar validacion de contrasenas
    [Documentation]    Debera mostrar una validacion cuando la contrasena no sea valida.
    [Tags]    Crear - TAB Usuario - Mostrar validacion de contrasenas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Capturar una contrasena diferente
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    La contrase\u00f1a no es v\u00e1lida    #Javascript Code
    [Teardown]    Close Browser
    
Crear - TAB Roles - Agregar Rol
    [Documentation]    Debera permitir asignarle un rol al usuario.
    [Tags]    Crear - TAB Roles - Agregar Rol - T1124
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Usuario
    Validar usuario en BD
    Sleep    1
    Ingresar a opcion Roles
    Seleccionar Rol
    Sleep    1
    Presionar opcion Agregar Rol
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Roles
    Validar rol en BD
    [Teardown]    Close Browser
    
Crear - TAB Roles - Validar mensaje para Rol duplicado
    [Documentation]    Debera mostrar una validacion indicando que el rol ya existe.
    [Tags]    Crear - TAB Roles - Validar mensaje para Rol duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Usuario
    Validar usuario en BD
    Sleep    1
    Ingresar a opcion Roles
    Seleccionar Rol
    Sleep    1
    Presionar opcion Agregar Rol
    Validar mensaje    Registro guardado.
    Seleccionar Rol
    Sleep    1
    Presionar opcion Agregar Rol
    Validar mensaje    El registro ya existe.
    Obtener datos del Grid Roles
    Validar rol en BD
    [Teardown]    Close Browser
    
Crear - TAB Roles - Eliminar Rol
    [Documentation]    Debera permitir eliminar un rol del usuario.
    [Tags]    Crear - TAB Roles - Eliminar Rol
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Usuario
    Validar usuario en BD
    Sleep    1
    Ingresar a opcion Roles
    Seleccionar Rol
    Sleep    1
    Presionar opcion Agregar Rol
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Roles
    Validar rol en BD
    Presionar opcion Eliminar Rol
    Sleep    0.25
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro eliminado.
    Validar rol eliminado en BD
    [Teardown]    Close Browser
    
Crear - TAB Roles - Validar etiquetas
    [Documentation]    Debera validar que se muestren correctamente escritas las etiquetas.
    [Tags]    Crear - TAB Roles - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Usuario
    Validar usuario en BD
    Sleep    1
    Ingresar a opcion Roles
    Validar etiquetas TAB Roles
    [Teardown]    Close Browser
    
Crear - TAB Mensajes - Agregar Mensaje - Todo verdadero
    [Documentation]    Debera permitir agregar un mensaje activando todas las casillas.
    [Tags]    Crear - TAB Mensajes - Agregar Mensaje - Todo verdadero
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Usuario
    Validar usuario en BD
    Sleep    1
    Ingresar a opcion Mensajes
    Capturar datos del Mensaje Todo Verdadero
    Sleep    1
    Presionar opcion Agregar Mensaje
    Validar mensaje    Registro guardado.
    Validacion de campo obligatorio oculto    ${xpathMsg}
    Sleep    1
    Obtener datos del Grid Mensajes
    Validar mensaje en BD
    [Teardown]    Close Browser
    
Crear - TAB Mensajes - Agregar Mensaje - Todo falso
    [Documentation]    Debera permitir agregar un mensaje con ninguna casilla activada.
    [Tags]    Crear - TAB Mensajes - Agregar Mensaje - Todo falso
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Usuario
    Validar usuario en BD
    Sleep    1
    Ingresar a opcion Mensajes
    Seleccionar Mensaje
    Sleep    1
    Presionar opcion Agregar Mensaje
    Validar mensaje    Registro guardado.
    Validacion de campo obligatorio oculto    ${xpathMsg}
    Sleep    1
    Obtener datos del Grid Mensajes
    Validar mensaje en BD
    [Teardown]    Close Browser
    
Crear - TAB Mensajes - Validar aviso para Mensaje duplicado
    [Documentation]    Debera mostrar una validacion indicando que el mensaje ya existe.
    [Tags]    Crear - TAB Mensajes - Validar aviso para Mensaje duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Usuario
    Validar usuario en BD
    Sleep    1
    Ingresar a opcion Mensajes
    Seleccionar Mensaje
    Sleep    1
    Presionar opcion Agregar Mensaje
    Validar mensaje    Registro guardado.
    Seleccionar Mensaje
    Sleep    1
    Presionar opcion Agregar Mensaje
    Validar mensaje    El registro ya existe.
    Obtener datos del Grid Mensajes
    Validar mensaje en BD
    [Teardown]    Close Browser
    
Crear - TAB Mensajes - Eliminar Mensaje
    [Documentation]    Debera permitir eliminar un mensaje.
    [Tags]    Crear - TAB Mensajes - Eliminar Mensaje
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Usuario
    Validar usuario en BD
    Sleep    1
    Ingresar a opcion Mensajes
    Seleccionar Mensaje
    Sleep    1
    Presionar opcion Agregar Mensaje
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Mensajes
    Validar mensaje en BD
    Presionar opcion Eliminar Mensaje
    Sleep    0.25
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro eliminado.
    Validar mensaje eliminado en BD
    [Teardown]    Close Browser
    
Crear - TAB Mensajes - Validar etiquetas
    [Documentation]    Debera mostrar las etiquetas correctamente escritas en la pestana Mensajes.
    [Tags]    Crear - TAB Mensajes - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Usuario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Usuario
    Validar usuario en BD
    Sleep    1
    Ingresar a opcion Mensajes
    Validar etiquetas TAB Mensajes
    [Teardown]    Close Browser
    
*** Keywords ***
Capturar datos del formulario Usuario
    Validar registro unico    ${UsuarioCrear}[Usuario]    ${queryUsername} 
    Sleep    1
    Seleccionar Cliente
    Input Text    xpath=//*[@id="txtNombreCompleto"]/div/div[1]/input    ${UsuarioCrear}[Nombre]
    Input Text    xpath=//*[@id="txtUsuario"]/div/div[1]/input    ${valorUnico}
    Input Text    xpath=//*[@id="txtEmail"]/div/div[1]/input    ${UsuarioCrear}[Correo]
    Input Text    xpath=//*[@id="txtContrasena"]/div/div[1]/input    ${UsuarioCrear}[Password]
    Input Text    xpath=//*[@id="txtConfirmarContrasena"]/div/div[1]/input    ${UsuarioCrear}[RPassword]
    
Capturar datos del formulario Usuario duplicado
    [Arguments]    ${arg1}
    Seleccionar Cliente
    Input Text    xpath=//*[@id="txtNombreCompleto"]/div/div[1]/input    ${UsuarioCrear}[Nombre]
    Input Text    xpath=//*[@id="txtUsuario"]/div/div[1]/input    ${arg1}
    Input Text    xpath=//*[@id="txtEmail"]/div/div[1]/input    ${UsuarioCrear}[Correo]
    Input Text    xpath=//*[@id="txtContrasena"]/div/div[1]/input    ${UsuarioCrear}[Password]
    Input Text    xpath=//*[@id="txtConfirmarContrasena"]/div/div[1]/input    ${UsuarioCrear}[RPassword]
    
Capturar un correo con formato erroneo
    Input Text    xpath=//*[@id="txtEmail"]/div/div[1]/input    ${UsuarioError}[Correo]
    
Capturar una contrasena diferente
    Input Text    xpath=//*[@id="txtConfirmarContrasena"]/div/div[1]/input    ${UsuarioError}[RPassword]
    
Capturar nueva contrasena
    Input Text    xpath=//*[@id="txtContrasena"]/div/div[1]/input    ${UsuarioPassword}[Password]
    Input Text    xpath=//*[@id="txtConfirmarContrasena"]/div[1]/div[1]/input    ${UsuarioPassword}[RPassword]
    
Dejar vacio los campos del TAB Usuarios
    Input Text    xpath=//*[@id="txtNombreCompleto"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtUsuario"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtEmail"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtContrasena"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtConfirmarContrasena"]/div/div[1]/input    ${EMPTY}
    
Seleccionar Cliente
    Click Element    xpath=//*[@id="ddlCliente"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    
Validar campos obligatorios en TAB Usuario
    ${reqCliente}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[1]/div[1]/div[2]/div/div[3]/div/div    textContent
    ${reqNombre}=    Get Element Attribute    xpath=//*[@id="txtNombreCompleto"]    textContent
    ${reqUsuario}=    Get Element Attribute    xpath=//*[@id="txtUsuario"]    textContent
    ${reqCorreo}=    Get Element Attribute    xpath=//*[@id="txtEmail"]    textContent
    ${reqPassword}=    Get Element Attribute    xpath=//*[@id="txtContrasena"]    textContent
    ${reqRPassword}=    Get Element Attribute    xpath=//*[@id="txtConfirmarContrasena"]    textContent
    Should be equal    ${reqCliente}    Obligatorio
    Should be equal    ${reqNombre}    Obligatorio
    Should be equal    ${reqUsuario}    Obligatorio
    Should be equal    ${reqCorreo}    Obligatorio
    Should be equal    ${reqPassword}    Obligatorio
    Should be equal    ${reqRPassword}    Obligatorio

Validar campos obligatorios en TAB Usuarios ocultos
    ${reqCliente}=    Get Element Attribute    xpath=//*[@id="ddlCliente"]    class
    ${reqNombre}=    Get Element Attribute    xpath=//*[@id="txtNombreCompleto"]    textContent
    ${reqUsuario}=    Get Element Attribute    xpath=//*[@id="txtUsuario"]    textContent
    ${reqCorreo}=    Get Element Attribute    xpath=//*[@id="txtEmail"]    textContent
    ${reqPassword}=    Get Element Attribute    xpath=//*[@id="txtContrasena"]    textContent
    ${reqRPassword}=    Get Element Attribute    xpath=//*[@id="txtConfirmarContrasena"]    textContent
    Should Not Contain    ${reqCliente}    dx-invalid
    Should Be Empty     ${reqNombre}
    Should Be Empty     ${reqUsuario}
    Should Be Empty     ${reqCorreo}
    Should Be Empty     ${reqPassword}
    Should Be Empty     ${reqRPassword}
    
Validar etiquetas y tooltips TAB Usuario
    ${ttGuardar}=    Get Element Attribute    xpath=//*[@id="btnUsuarioGuardar"]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=//*[@id="tabEditarUsuario"]/div[14]/div/div[2]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div    Nuevo Usuario
    Element Text Should Be    xpath=//*[@id="lnkTabEditarUsuario"]    Usuario
    Element Text Should Be    xpath=//*[@id="tabEditarUsuario"]/div[1]/div[1]    Cliente:
    Element Text Should Be    xpath=//*[@id="tabEditarUsuario"]/div[2]/div[1]    Nombre Completo:
    Element Text Should Be    xpath=//*[@id="tabEditarUsuario"]/div[3]/div[1]    Usuario:
    Element Text Should Be    xpath=//*[@id="tabEditarUsuario"]/div[4]/div[1]    Correo:
    Element Text Should Be    xpath=//*[@id="tabEditarUsuario"]/div[5]/div[1]    Estatus:
    Element Text Should Be    xpath=//*[@id="tabEditarUsuario"]/div[6]/div[1]    Contraseña:
    Element Text Should Be    xpath=//*[@id="tabEditarUsuario"]/div[7]/div[1]    Confirmar Contraseña:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar