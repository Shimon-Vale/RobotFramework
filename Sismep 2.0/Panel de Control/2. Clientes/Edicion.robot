*** Settings ***
Resource    Recursos.Clientes.robot

*** Variables ***
&{ClienteEditar}    Nombre=RFClienteEditar    Razon=RFRazonSocialEditar    Dir=RFDireccionEditar   Com=RFComentariosEditar    Sistema=RFSistemaEditar
&{ContactoEditar}    Nombre=RFContactoNombreEditar    Apellido=RFContactoApellidoEditar    Direccion=RFContactoDireccionEditar    Comentarios=RFComentariosEditar    Telefono=88170707070    Referencia=RFReferenciaEditar
${ClienteFiltro}    RFCliente

*** Test Cases ***
Editar - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Editar - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Columna 1 y Campo ${ClienteFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Validar etiquetas
    [Teardown]    Close Browser

Editar - TAB Generales - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente los cambios realizados.
    [Tags]    Editar - TAB Generales - Validar opcion Guardar - T314
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Columna 1 y Campo ${ClienteFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Editar datos del formulario    ${ClienteEditar}[Nombre]
    Generales - Obtener datos del formulario
    Generales - Presionar boton Guardar
    Validar mensaje    Registro guardado.
    Generales - Validar registro en BD
    [Teardown]    Close Browser

Editar - TAB Generales - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion y no guardar en la BD.
    [Tags]    Editar - TAB Generales - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Columna 1 y Campo ${ClienteFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Editar datos del formulario    ${ClienteEditar}[Nombre]
    Generales - Presionar boton Cancelar
    Sleep    1
    Generales - Validar Cliente inexistente en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser

Editar - TAB Generales - Validar opcion Eliminar(Desactivar)
    [Documentation]    Debera desactivar correctamente el Cliente.
    [Tags]    Editar - TAB Generales - Validar opcion Eliminar(Desactivar)
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Columna 1 y Campo ${ClienteFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Obtener datos del formulario
    Sleep    1
    Generales - Presionar boton Eliminar
    Sleep    1
    Confirmar accion
    Validar mensaje    Cambios guardados.
    Generales - Validar registro en BD    0
    [Teardown]    Close Browser
    
Editar - TAB Generales - Validar opcion Reactivar
    [Documentation]    Debera reactivar correctamente el Cliente.
    [Tags]    Editar - TAB Generales - Validar opcion Reactivar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Estatus    Inactivo
    Filtrar por Columna 1 y Campo ${ClienteFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Obtener datos del formulario
    Sleep    1
    Generales - Presionar boton Reactivar
    Sleep    1
    Confirmar accion
    Validar mensaje    Cambios guardados.
    Generales - Validar registro en BD
    [Teardown]    Close Browser
    
Editar - TAB Generales - Nombre duplicado
    [Documentation]    Debera mostrar una validacion indicando que el registro ya existe.
    [Tags]    Editar - TAB Generales - Nombre duplicado - T314
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Columna 1 y Campo ${ClienteFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Editar datos del formulario Nombre duplicado    ${RegistroExistente}
    Generales - Presionar boton Guardar
    Validar mensaje    El registro ya existe.
    [Teardown]    Close Browser

Editar - TAB Generales - Mostrar campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Editar - TAB Generales - Mostrar campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Columna 1 y Campo ${ClienteFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Dejar vacios los campos del formulario
    Generales - Presionar boton Guardar
    Validar mensaje    Favor de validar los campos obligatorios
    [Teardown]    Close Browser

Editar - TAB Generales - Ver Detalle
    [Documentation]    Valida que al ver el detalle de un registro se muestre correctamente la información.
    [Tags]    Editar - TAB Generales - Ver Detalle
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Columna 1 y Campo ${ClienteFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Obtener datos del formulario
    Generales - Validar registro en BD
    Sleep    1
    Generales - Editar datos del formulario    ${ClienteEditar}[Nombre]
    Generales - Obtener datos del formulario
    Generales - Presionar boton Guardar
    Generales - Presionar boton Cancelar
    Sleep    1
    Filtrar por Columna 1 y Campo ${CteNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Obtener datos del formulario
    Generales - Validar registro en BD
    [Teardown]    Close Browser

Editar - TAB Configuracion Sistema - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente la informacion correctamente.
    [Tags]    Editar - TAB Configuracion Sistema - Validar opcion Guardar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Columna 1 y Campo ${ClienteFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Configuracion Sistema
    Configuracion - Editar datos del formulario
    Configuracion - Presionar boton Guardar
    Validar mensaje    Cambios guardados. Para efectos de Estilo, favor de volver a iniciar sesi\u00F3n
    Configuracion - Obtener datos del formulario
    Configuracion - Validar registro en BD
    [Teardown]    Close Browser

Editar - TAB Configuracion Sistema - Validar campos requeridos
    [Documentation]    Debera mostrar en color rojo los campos que son obligatorios.
    [Tags]    Editar - TAB Configuracion Sistema - Validar campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Columna 1 y Campo ${ClienteFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar TAB Configuracion Sistema
    Configuracion - Dejar vacio el formulario
    Configuracion - Presionar boton Guardar
    Sleep    1
    Configuracion - Validar campos obligatorios
    [Teardown]    Close Browser

Editar - TAB Configuracion Sistema - Ver Detalle
    [Documentation]    Valida que al ver el detalle de un registro se muestre correctamente la información.
    [Tags]    Editar - TAB Configuracion Sistema - Ver Detalle
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Columna 1 y Campo ${ClienteFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Generales - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Configuracion Sistema
    Sleep    1
    Configuracion - Editar datos del formulario
    Configuracion - Presionar boton Guardar
    Configuracion - Obtener datos del formulario
    Sleep    1
    Cerrar modal del formulario
    Filtrar por Columna 1 y Campo ${CteNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar TAB Configuracion Sistema
    Sleep    1
    Configuracion - Obtener datos del formulario
    Configuracion - Validar registro en BD
    [Teardown]    Close Browser

Editar - TAB Contactos - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente la informacion de la pestana contactos.
    [Tags]    Editar - TAB Contactos - Validar opcion Guardar - T316
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Obtener Cliente con Contactos    Activo=1
    Filtrar por Columna 1 y Campo ${cliente}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Contactos
    Sleep    1
    Hacer scroll para ver el Boton Ver Detalle
    Sleep    1
    Contactos - Presionar Ver detalle
    Sleep    1
    Hacer scroll para ver el TAB Contactos
    Sleep    1
    Contactos - Editar datos del formulario    ${ContactoEditar}[Nombre]
    Contactos - Obtener datos del formulario
    Contactos - Presionar boton Guardar
    Validar mensaje    Registro guardado.
    Contactos - Validar registro en BD
    [Teardown]    Close Browser

Editar - TAB Contactos - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de guardar en la pestana Contactos.
    [Tags]    Editar - TAB Contactos - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Obtener Cliente con Contactos    Activo=1
    Filtrar por Columna 1 y Campo ${cliente}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Contactos
    Sleep    1
    Hacer scroll para ver el Boton Ver Detalle
    Sleep    1
    Contactos - Presionar Ver detalle
    Sleep    1
    Hacer scroll para ver el TAB Contactos
    Sleep    1
    Contactos - Editar datos del formulario    ${ContactoEditar}[Nombre]
    Contactos - Obtener datos del formulario
    Contactos - Presionar boton Cancelar
    Contactos - Validar registro inexistente en BD
    [Teardown]    Close Browser

Editar - TAB Contactos - Validar opcion Eliminar(Desactivar)
    [Documentation]    Debera desactivar el contacto correctamente.
    [Tags]    Editar - TAB Contactos - Validar opcion Eliminar(Desactivar)
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Obtener Cliente con Contactos    Activo=1
    Filtrar por Columna 1 y Campo ${cliente}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Contactos
    Sleep    1
    Hacer scroll para ver el Boton Ver Detalle
    Sleep    1
    Contactos - Presionar Ver detalle
    Sleep    1
    Contactos - Obtener datos del formulario
    Contactos - Presionar boton Eliminar
    Sleep    1
    Confirmar accion
    Validar mensaje    Registro guardado.
    Contactos - Validar registro en BD    0
    [Teardown]    Close Browser
    
Editar - TAB Contactos - Validar opcion Reactivar
    [Documentation]    Debera reactivar correctamente el contacto.
    [Tags]    Editar - TAB Contactos - Validar opcion Reactivar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Obtener Cliente con Contactos    Activo=0
    Filtrar por Columna 1 y Campo ${cliente}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Contactos
    Sleep    1
    Contactos - Filtrar por Estatus    Inactivo
    Sleep    1
    Hacer scroll para ver el Boton Ver Detalle
    Sleep    1
    Contactos - Presionar Ver detalle
    Sleep    1
    Contactos - Obtener datos del formulario
    Contactos - Presionar boton Reactivar
    Sleep    1
    Confirmar accion
    Validar mensaje    Registro guardado.
    Contactos - Validar registro en BD
    [Teardown]    Close Browser
    
Editar - TAB Contactos - Validar campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios de la pestana Contactos.
    [Tags]    Editar - TAB Contactos - Validar campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Obtener Cliente con Contactos    Activo=1
    Filtrar por Columna 1 y Campo ${cliente}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar TAB Contactos
    Sleep    1
    Hacer scroll para ver el Boton Ver Detalle
    Sleep    1
    Contactos - Presionar Ver detalle
    Sleep    1
    Hacer scroll para ver el TAB Contactos
    Sleep    1
    Contactos - Dejar vacios los campos del formulario
    Contactos - Presionar boton Guardar
    Sleep    1
    Contactos - Validar campos requeridos
    [Teardown]    Close Browser

Editar - TAB Contactos - Agregar Telefono
    [Documentation]    Debera permitir agregar Telefono correctamente en la pestana Contactos.
    [Tags]    Editar - TAB Contactos - Agregar Telefono
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Obtener Cliente con Contactos    Activo=1
    Filtrar por Columna 1 y Campo ${cliente}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Contactos
    Sleep    1
    Hacer scroll para ver el Boton Ver Detalle
    Sleep    1
    Contactos - Presionar Ver detalle
    Sleep    1
    Contactos - Obtener datos del formulario
    Hacer scroll para ver el TAB Contactos
    Sleep    1
    TelefonoReferencia - Capturar datos del formulario
    TelefonoReferencia - Obtener datos del formulario
    TelefonoReferencia - Presionar boton Agregar
    Validar mensaje    Cambios guardados.
    TelefonoReferencia - Validar registro en BD
    [Teardown]    Close Browser

Editar - TAB Contactos - Eliminar Telefono
    [Documentation]    Debera eliminar correctamente el telefono de la pestana Contactos.
    [Tags]    Editar - TAB Contactos - Eliminar Telefono
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Obtener Cliente con Contactos y Telefonos    Activo=1
    Filtrar por Columna 1 y Campo ${cliente}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Contactos
    Sleep    1
    Hacer scroll para ver el Boton Ver Detalle
    Sleep    1
    Contactos - Presionar Ver detalle
    Sleep    1
    Contactos - Obtener datos del formulario
    Hacer scroll para ver el TAB Contactos
    Sleep    1
    TelefonoReferencia - Presionar Ver detalle
    TelefonoReferencia - Obtener datos del formulario
    TelefonoReferencia - Presionar boton Eliminar
    Sleep    1
    Confirmar accion
    Validar mensaje    Cambios guardados.
    TelefonoReferencia - Validar registro inexistente en BD
    [Teardown]    Close Browser
    
Editar - TAB Contactos - Agregar Telefono - Validar campos requeridos
    [Documentation]    Debera mostrar en color rojo los campos obligatorios.
    [Tags]    Editar - TAB Contactos - Agregar Telefono - Validar campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Obtener Cliente con Contactos    Activo=1
    Filtrar por Columna 1 y Campo ${cliente}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar TAB Contactos
    Sleep    1
    Hacer scroll para ver el Boton Ver Detalle
    Sleep    1
    Contactos - Presionar Ver detalle
    Sleep    1
    Hacer scroll para ver el TAB Contactos
    Sleep    1
    TelefonoReferencia - Presionar boton Agregar
    Sleep    1
    TelefonoReferencia - Validar campos requeridos
    [Teardown]    Close Browser

Editar - TAB Contactos - Ver Detalle
    [Documentation]    Valida que al ver el detalle de un registro se muestre correctamente la información.
    [Tags]    Editar - TAB Contactos - Ver Detalle
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Columna 1 y Campo ${ClienteFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Generales - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Contactos
    Sleep    1
    Hacer scroll para ver el Boton Ver Detalle
    Sleep    1
    Contactos - Presionar Ver detalle
    Sleep    1
    Hacer scroll para ver el TAB Contactos
    Sleep    1
    Contactos - Obtener datos del formulario
    Contactos - Validar registro en BD
    Sleep    1
    Contactos - Editar datos del formulario    ${ContactoEditar}[Nombre]
    Contactos - Presionar boton Guardar
    Sleep    1
    Cerrar modal del formulario
    Sleep    1
    Filtrar por Columna 1 y Campo ${CteNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar TAB Contactos
    Sleep    1
    Hacer scroll para ver el Boton Ver Detalle
    Sleep    1
    Contactos - Presionar Ver detalle
    Sleep    1
    Hacer scroll para ver el TAB Contactos
    Sleep    1
    Contactos - Obtener datos del formulario
    Contactos - Validar registro en BD
    [Teardown]    Close Browser

*** Keywords ***
Ingresar al detalle del registro No. ${arg1} en el grid
    Click Element    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[4]/div/div
    Wait Until Page Contains Element    xpath=//*[@id="btnEliminar"]

Validar etiquetas
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div
    Element Text Should Be    xpath=//*[@id="tabGenerales"]    Generales
    Element Text Should Be    xpath=//*[@id="generales"]/div[1]/label    Estatus:
    Element Text Should Be    xpath=//*[@id="generales"]/div[2]/label    Nombre Cliente:
    Element Text Should Be    xpath=//*[@id="generales"]/div[3]/label    Razón Social:
    Element Text Should Be    xpath=//*[@id="generales"]/div[4]/label    Dirección:
    Element Text Should Be    xpath=//*[@id="generales"]/div[5]/label    Comentarios:
    ${ttGuardar}=    Get Element Attribute    xpath=//*[@id="btnGuardar"]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=//*[@id="btnCancelar"]    tooltip
    ${ttEliminar}=    Get Element Attribute    xpath=//*[@id="btnEliminar"]    tooltip
    ${ttReactivar}=    Get Element Attribute    xpath=//*[@id="btnReactivar"]    tooltip
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    Should be equal    ${ttEliminar}    Eliminar
    Should be equal    ${ttReactivar}    Reactivar
    Sleep    1
    Seleccionar TAB Configuracion Sistema
    Wait Until Element Is Visible    xpath=//*[@id="tabConfiguracion"]
    Element Text Should Be    xpath=//*[@id="tabConfiguracion"]    Configuración Sistema
    Element Text Should Be    xpath=//*[@id="configuracion"]/div[1]/label    Nombre del Sistema:
    Element Text Should Be    xpath=//*[@id="configuracion"]/div[2]/label    Banner:
    Element Text Should Be    xpath=//*[@id="configuracion"]/div[3]/label    Logo:
    Element Text Should Be    xpath=//*[@id="configuracion"]/div[4]/label    Estilo:
    Sleep    1
    Seleccionar TAB Contactos
    Wait Until Element Is Visible    xpath=//*[@id="tabContactos"]
    Element Text Should Be    xpath=//*[@id="tabContactos"]    Contactos
    Element Text Should Be    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[1]/div[1]    Nombre:
    Element Text Should Be    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[1]/div[3]    Apellido:
    Element Text Should Be    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[2]/div[1]    Dirección:
    Element Text Should Be    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[3]/div[1]    Estado:
    Element Text Should Be    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[4]/div[1]    Municipio:
    Element Text Should Be    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[5]/div[1]    Localidad:
    Element Text Should Be    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[6]/div[1]    Comentarios:
    Element Text Should Be    xpath=//*[@id="contactos"]/div/div[1]/div[2]/div[1]/div[1]    Teléfono:
    Element Text Should Be    xpath=//*[@id="contactos"]/div/div[1]/div[2]/div[2]/div[1]    Referencia:
    Element Text Should Be    xpath=//*[@id="dx-col-25"]/div[2]    Nombre
    Element Text Should Be    xpath=//*[@id="dx-col-26"]/div[2]    Apellidos
    Element Text Should Be    xpath=//*[@id="dx-col-27"]/div[2]    Dirección
    Element Text Should Be    xpath=//*[@id="dx-col-28"]/div[3]    Estatus
    Element Text Should Be    xpath=//*[@id="gridContacto"]/div/div[5]/div/table/tbody/tr[1]/td[5]/div    Detalle
    ${ttCtoGuardar}=    Get Element Attribute    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[7]/div/div[1]    tooltip
    ${ttCtoCancelar}=    Get Element Attribute    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[7]/div/div[2]    tooltip
    Should be equal    ${ttCtoGuardar}    Guardar
    Should be equal    ${ttCtoCancelar}    Cancelar
    
Generales - Editar datos del formulario
    [Arguments]    ${arg1}
    Validar campo unico Nombre    ${arg1}
    Input Text    xpath=//*[@id="txtNombreCliente"]/div/div[1]/input    ${CteNombreUnico}
    Input Text    xpath=//*[@id="txtRazonSocial"]/div/div[1]/input    ${ClienteEditar}[Razon]
    Input Text    xpath=//*[@id="txtDireccion"]/div/div[1]/input    ${ClienteEditar}[Dir]
    Input Text    xpath=//*[@id="txtComentarios"]/div/div[1]/textarea    ${ClienteEditar}[Com]

Generales - Editar datos del formulario Nombre duplicado
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="txtNombreCliente"]/div/div[1]/input    ${arg1}
    Input Text    xpath=//*[@id="txtRazonSocial"]/div/div[1]/input    ${ClienteEditar}[Razon]
    Input Text    xpath=//*[@id="txtDireccion"]/div/div[1]/input    ${ClienteEditar}[Dir]
    Input Text    xpath=//*[@id="txtComentarios"]/div/div[1]/textarea    ${ClienteEditar}[Com]

Generales - Dejar vacios los campos del formulario
    Input Text    xpath=//*[@id="txtNombreCliente"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtRazonSocial"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtDireccion"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtComentarios"]/div/div[1]/textarea    ${EMPTY}
    
Configuracion - Editar datos del formulario
    [Arguments]    ${estilo}=1
    Input Text    xpath=//*[@id="txtNombreSistema"]/div/div[1]/input    ${ClienteEditar}[Sistema]
    Choose File    xpath=//*[@id="fuBanner"]/div/div/div/div[1]/div[2]/input    ${banner}
    Choose File    xpath=//*[@id="fuLogo"]/div/div/div/div[1]/div[2]/input    ${logo}
    Click Element    xpath=//*[@id="cboEstilo"]/div[1]/div[2]/div[2]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[5]/div
    Execute JavaScript    document.evaluate('/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${estilo}]/div',document.body,null,9,null).singleNodeValue.click();

Configuracion - Dejar vacio el formulario
    Input Text    xpath=//*[@id="txtNombreSistema"]/div/div[1]/input    ${EMPTY}
    
Configuracion - Validar campos obligatorios
    ${Nombre}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[0].textContent;
    Should be equal    ${Nombre}    Obligatorio
    
Contactos - Editar datos del formulario
    [Arguments]    ${arg1}
    Contacto - Validar campo unico Nombre    ${arg1}
    Wait Until Element Is Visible    xpath=//*[@id="tabContactos"]
    Input Text    xpath=//*[@id="txtContactoNombre"]/div/div[1]/input    ${CtoNombreUnico}
    Input Text    xpath=//*[@id="txtContactoApellido"]/div/div[1]/input    ${ContactoEditar}[Apellido]
    Input Text    xpath=//*[@id="txtContactoDireccion"]/div/div[1]/input    ${ContactoEditar}[Direccion]
    Seleccionar Estado
    Seleccionar Municipio
    Seleccionar Localidad
    Input Text    xpath=//*[@id="txtContactoComentarios"]/div/div[1]/textarea    ${ContactoEditar}[Comentarios]
    
Contactos - Dejar vacios los campos del formulario
    Input Text    xpath=//*[@id="txtContactoNombre"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtContactoApellido"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtContactoDireccion"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtContactoComentarios"]/div/div[1]/textarea    ${EMPTY}
    
Contactos - Validar campos requeridos
    ${Nombre}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[0].textContent;
    ${Apellido}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[1].textContent;
    Should be equal    ${Nombre}    Obligatorio
    Should be equal    ${Apellido}    Obligatorio
    
TelefonoReferencia - Capturar datos del formulario
    Input Text    xpath=//*[@id="txtTelefono"]/div/div[1]/input    ${ContactoEditar}[Telefono]
    Input Text    xpath=//*[@id="txtReferencia"]/div/div[1]/input    ${ContactoEditar}[Referencia]

TelefonoReferencia - Validar campos requeridos
    ${Telefono}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[0].textContent;
    ${Referencia}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[1].textContent;
    Should be equal    ${Telefono}    Obligatorio
    Should be equal    ${Referencia}    Obligatorio

Seleccionar Estado
    Click Element    xpath=//*[@id="cboContactoEstado"]/div[1]/div/div[2]/div[2]/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div
    
Seleccionar Municipio
    Click Element    xpath=//*[@id="cboContactoMunicipio"]/div[1]/div/div[2]/div[2]/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div
    
Seleccionar Localidad
    Click Element    xpath=//*[@id="cboContactoLocalidad"]/div[1]/div/div[2]/div[2]/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div
            
Obtener Cliente con Contactos
    [Arguments]    ${Activo}
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 c.Nombre from Sismep.TSismepClientes c join Sismep.TSismepClientesContactos cc on c.IdCliente = cc.IdCliente where c.Nombre like '%${ClienteFiltro}%' and cc.Activo = ${Activo}
    Set Test Variable    ${cliente}    ${queryResults[0][0]}
    Disconnect From Database
    
Obtener Cliente con Contactos y Telefonos
    [Arguments]    ${Activo}
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 c.Nombre from Sismep.TSismepClientes c join Sismep.TSismepClientesContactos cc on c.IdCliente = cc.IdCliente join Sismep.TSismepClientesReferencias cr on cc.IdClienteContacto = cr.IdClienteContacto where c.Nombre like '%${ClienteFiltro}%' and cc.Activo = ${Activo}
    Set Test Variable    ${cliente}    ${queryResults[0][0]}
    Disconnect From Database