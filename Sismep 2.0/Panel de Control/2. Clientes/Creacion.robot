*** Settings ***
Resource    Recursos.Clientes.robot

*** Variables ***
&{ClienteCrear}    Nombre=RFCliente    Razon=RFRazonSocial    Dir=RFDireccion   Com=RFComentarios    Sistema=RFSistema
&{ContactoCrear}    Nombre=RFContactoNombre    Apellido=RFContactoApellido    Direccion=RFContactoDireccion    Comentarios=RFComentarios    Telefono=88180808080    Referencia=RFReferencia
${btnGuardar}    //*[@id="btnGuardar"]

*** Test Cases ***
Crear - TAB Generales - Validar etiquetas y tooltips
    [Documentation]    Debera validar que se muestren correctamente escritas las etiquetas y tooltips.
    [Tags]    Crear - TAB Generales - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Sleep    1
    Generales - Validar etiquetas
    [Teardown]    Close Browser

Crear - TAB Generales - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente el registro de Clientes.
    [Tags]    Crear - TAB Generales - Validar opcion Guardar - T318
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Generales - Capturar datos del formulario    ${ClienteCrear}[Nombre]
    Generales - Obtener datos del formulario
    Generales - Presionar boton Guardar
    Validar mensaje    Registro guardado.
    Generales - Validar registro en BD
    [Teardown]    Close Browser

Crear - TAB Generales - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de guardado sin guardar nada en la BD.
    [Tags]    Crear - TAB Generales - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Generales - Capturar datos del formulario    ${ClienteCrear}[Nombre]
    Generales - Presionar boton Cancelar
    Sleep    1
    Generales - Validar Cliente inexistente en BD
    Validar retorno a Grid de Resultados   ${xpathGridBody}
    [Teardown]    Close Browser

Crear - TAB Generales - Nombre duplicado
    [Documentation]    Debera validar indicar una validación indicando que ya existe el Cliente.
    [Tags]    Crear - TAB Generales - Nombre duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Generales - Capturar datos del formulario Nombre duplicado    ${RegistroExistente}
    Generales - Presionar boton Guardar
    Validar mensaje    El registro ya existe.
    [Teardown]    Close Browser

Crear - TAB Generales - Validar campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Crear - TAB Generales - Validar campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Sleep    1
    Generales - Presionar boton Guardar
    Validar mensaje    Favor de validar los campos obligatorios
    Generales - Validar campos requeridos
    [Teardown]    Close Browser

Crear - TAB Configuracion Sistema - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips
        ...    de la pestana configuracion de sistema.
    [Tags]    Crear - TAB Configuracion Sistema - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Cliente - Llenar el formulario y Guardar
    Sleep    1
    Seleccionar TAB Configuracion Sistema
    Configuracion - Validar etiquetas
    [Teardown]    Close Browser

Crear - TAB Configuracion Sistema - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente la informacion de la pestaña Configuracion del Sistema.
    [Tags]    Crear - TAB Configuracion Sistema - Validar opcion Guardar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Cliente - Llenar el formulario y Guardar
    Sleep    1
    Seleccionar TAB Configuracion Sistema
    Configuracion - Capturar datos del formulario    3
    Configuracion - Obtener datos del formulario
    Sleep    1
    Configuracion - Presionar boton Guardar
    Validar mensaje    Cambios guardados. Para efectos de Estilo, favor de volver a iniciar sesi\u00F3n
    Configuracion - Validar registro en BD
    [Teardown]    Close Browser

Crear - TAB Configuracion Sistema - Validar opcion Guardar - datos requeridos
    [Documentation]    Debera permitir guardar los datos ingresando solo los datos requeridos.
    [Tags]    Crear - TAB Configuracion Sistema - Validar opcion Guardar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Cliente - Llenar el formulario y Guardar
    Sleep    1
    Seleccionar TAB Configuracion Sistema
    Configuracion - Capturar datos del formulario - datos requeridos    3
    Sleep    1
    Configuracion - Presionar boton Guardar
    Sleep    1
    Cerrar modal del formulario
    Filtrar por Columna 1 y Campo ${CteNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar TAB Configuracion Sistema
    Sleep    1
    Configuracion - Validar campos no requeridos vacios     //*[@id="fuBanner"]/div/div/div/div[1]/div[2]/div 
    Configuracion - Validar campos no requeridos vacios     //*[@id="fuLogo"]/div/div/div/div[1]/div[2]/div
    [Teardown]    Close Browser

Crear - TAB Configuracion Sistema - Validar campos requeridos
    [Documentation]    Debera de mostrar en rojo los campos que son obligatorios.
    [Tags]    Crear - TAB Configuracion Sistema - Validar campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Cliente - Llenar el formulario y Guardar
    Sleep    1
    Seleccionar TAB Configuracion Sistema
    Configuracion - Presionar boton Guardar
    Sleep    1
    Configuracion - Validar campos obligatorios
    [Teardown]    Close Browser

Crear - TAB Contactos - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Crear - TAB Contactos - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Cliente - Llenar el formulario y Guardar
    Sleep    3
    Seleccionar TAB Configuracion Sistema
    Configuracion - Llenar el formulario y Guardar
    Sleep    3
    Seleccionar TAB Contactos
    Contactos - Validar etiquetas
    [Teardown]    Close Browser

Crear - TAB Contactos - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente la informacion de la pestana Contactos.
    [Tags]    Crear - TAB Contactos - Validar opcion Guardar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Cliente - Llenar el formulario y Guardar
    Sleep    3
    Seleccionar TAB Configuracion Sistema
    Configuracion - Llenar el formulario y Guardar
    Sleep    3
    Seleccionar TAB Contactos
    Contactos - Capturar datos del formulario    ${ContactoCrear}[Nombre]
    Contactos - Obtener datos del formulario
    Contactos - Presionar boton Guardar
    Validar mensaje    Registro guardado.
    Contactos - Validar registro en BD
    [Teardown]    Close Browser

Crear - TAB Contactos - Volver a ingresar al detalle del registro
    [Documentation]    Valida que al crear un nuevo registro y volver a ingresar a su detalle conserva los datos creados.
    [Tags]    Crear - TAB Contactos - Validar opcion Guardar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Cliente - Llenar el formulario y Guardar
    Sleep    3
    Seleccionar TAB Configuracion Sistema
    Configuracion - Llenar el formulario y Guardar
    Sleep    3
    Seleccionar TAB Contactos
    Contactos - Capturar datos del formulario    ${ContactoCrear}[Nombre]
    Contactos - Obtener datos del formulario
    Contactos - Presionar boton Guardar
    Sleep    1
    Contactos - Validar registro en BD
    Sleep    1
    Cerrar modal del formulario
    Filtrar por Columna 1 y Campo ${CteNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Generales - Obtener datos del formulario
    Validar datos de TAB Generales
    Sleep    1
    Seleccionar TAB Configuracion Sistema
    Configuracion - Obtener datos del formulario
    Validar datos de TAB Configuracion
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
    Validar datos de TAB Contactos
    [Teardown]    Close Browser

Crear - TAB Contactos - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de guardar.
    [Tags]    Crear - TAB Contactos - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Cliente - Llenar el formulario y Guardar
    Sleep    3
    Seleccionar TAB Configuracion Sistema
    Configuracion - Llenar el formulario y Guardar
    Sleep    3
    Seleccionar TAB Contactos
    Contactos - Capturar datos del formulario    ${ContactoCrear}[Nombre]
    Contactos - Obtener datos del formulario
    Contactos - Presionar boton Cancelar
    Contactos - Validar registro inexistente en BD
    [Teardown]    Close Browser

Crear - TAB Contactos - Validar campos requeridos
    [Documentation]    Debera de mostrar en rojo los campos obligatorios.
    [Tags]    Crear - TAB Contactos - Validar campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Cliente - Llenar el formulario y Guardar
    Sleep    3
    Seleccionar TAB Configuracion Sistema
    Configuracion - Llenar el formulario y Guardar
    Sleep    3
    Seleccionar TAB Contactos
    Contactos - Presionar boton Guardar
    Contactos - Validar campos requeridos
    [Teardown]    Close Browser

Crear - TAB Contactos - Agregar Telefono
    [Documentation]    Debera permitir agregar un numero de Telefono en la pestaña Contactos.
    [Tags]    Crear - TAB Contactos - Agregar Telefono
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Cliente - Llenar el formulario y Guardar
    Sleep    3
    Seleccionar TAB Configuracion Sistema
    Configuracion - Llenar el formulario y Guardar
    Sleep    3
    Seleccionar TAB Contactos
    Contactos - Llenar el formulario y Guardar
    Sleep    1
    Contactos - Presionar Ver detalle
    Sleep    1
    Hacer scroll para ver el TAB Contactos
    TelefonoReferencia - Capturar datos del formulario
    TelefonoReferencia - Obtener datos del formulario
    Sleep    1
    TelefonoReferencia - Presionar boton Agregar
    Validar mensaje    Cambios guardados.
    TelefonoReferencia - Validar registro en BD
    [Teardown]    Close Browser

Crear - TAB Contactos - Agregar Telefono - Mostrar campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios de la seccion Agregar Telefono.
    [Tags]    Crear - TAB Contactos - Agregar Telefono - Mostrar campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Presionar opcion Nuevo Registro    ${btnGuardar} 
    Cliente - Llenar el formulario y Guardar
    Sleep    3
    Seleccionar TAB Configuracion Sistema
    Configuracion - Llenar el formulario y Guardar
    Sleep    3
    Seleccionar TAB Contactos
    Contactos - Llenar el formulario y Guardar
    Sleep    1
    Contactos - Presionar Ver detalle
    Sleep    1
    Hacer scroll para ver el TAB Contactos
    Sleep    1
    TelefonoReferencia - Presionar boton Agregar
    TelefonoReferencia - Mostrar campos requeridos
    [Teardown]    Close Browser

*** Keywords ***
Generales - Validar etiquetas
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Nuevo Cliente
    Element Text Should Be    xpath=//*[@id="tabGenerales"]    Generales
    Element Text Should Be    xpath=//*[@id="generales"]/div[1]/label    Estatus:
    Element Text Should Be    xpath=//*[@id="generales"]/div[2]/label    Nombre Cliente:
    Element Text Should Be    xpath=//*[@id="generales"]/div[3]/label    Razón Social:
    Element Text Should Be    xpath=//*[@id="generales"]/div[4]/label    Dirección:
    Element Text Should Be    xpath=//*[@id="generales"]/div[5]/label    Comentarios:
    ${ttGuardar}=    Get Element Attribute    xpath=//*[@id="btnGuardar"]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=//*[@id="btnCancelar"]    tooltip
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar

Generales - Capturar datos del formulario
    [Arguments]    ${arg1}
    Validar campo unico Nombre    ${arg1}
    Input Text    xpath=//*[@id="txtNombreCliente"]/div/div[1]/input    ${CteNombreUnico}
    Input Text    xpath=//*[@id="txtRazonSocial"]/div/div[1]/input    ${ClienteCrear}[Razon]
    Input Text    xpath=//*[@id="txtDireccion"]/div/div[1]/input    ${ClienteCrear}[Dir]
    Input Text    xpath=//*[@id="txtComentarios"]/div/div[1]/textarea    ${ClienteCrear}[Com]

Generales - Capturar datos del formulario Nombre duplicado
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="txtNombreCliente"]/div/div[1]/input    ${arg1}
    Input Text    xpath=//*[@id="txtRazonSocial"]/div/div[1]/input    ${ClienteCrear}[Razon]
    Input Text    xpath=//*[@id="txtDireccion"]/div/div[1]/input    ${ClienteCrear}[Dir]
    Input Text    xpath=//*[@id="txtComentarios"]/div/div[1]/textarea    ${ClienteCrear}[Com]

Generales - Validar campos requeridos
    ${Cliente}=    Get Element Attribute    xpath=//*[@id="txtNombreCliente"]    textContent
    Should be equal    ${Cliente}    Obligatorio
    
Configuracion - Validar etiquetas
    Wait Until Element Is Visible    xpath=//*[@id="tabConfiguracion"]
    Element Text Should Be    xpath=//*[@id="tabConfiguracion"]    Configuración Sistema
    Element Text Should Be    xpath=//*[@id="configuracion"]/div[1]/label    Nombre del Sistema:
    Element Text Should Be    xpath=//*[@id="configuracion"]/div[2]/label    Banner:
    Element Text Should Be    xpath=//*[@id="configuracion"]/div[3]/label    Logo:
    Element Text Should Be    xpath=//*[@id="configuracion"]/div[4]/label    Estilo:

Configuracion - Capturar datos del formulario
    [Arguments]    ${estilo}=1
    Input Text    xpath=//*[@id="txtNombreSistema"]/div/div[1]/input    ${ClienteCrear}[Sistema]
    Choose File    xpath=//*[@id="fuBanner"]/div/div/div/div[1]/div[2]/input    ${banner}
    Choose File    xpath=//*[@id="fuLogo"]/div/div/div/div[1]/div[2]/input    ${logo}
    Click Element    xpath=//*[@id="cboEstilo"]/div[1]/div[2]/div[2]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[5]/div
    Execute JavaScript    document.evaluate('/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${estilo}]/div',document.body,null,9,null).singleNodeValue.click();

Configuracion - Capturar datos del formulario - datos requeridos
    [Arguments]    ${estilo}=1
    Input Text    xpath=//*[@id="txtNombreSistema"]/div/div[1]/input    ${ClienteCrear}[Sistema]
    Click Element    xpath=//*[@id="cboEstilo"]/div[1]/div[2]/div[2]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[5]/div
    Execute JavaScript    document.evaluate('/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${estilo}]/div',document.body,null,9,null).singleNodeValue.click();

Configuracion - Validar campos obligatorios
    ${Nombre}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[0].textContent;
    ${Estilo}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[1].textContent;
    Should be equal    ${Nombre}    Obligatorio
    Should be equal    ${Estilo}    Obligatorio

Configuracion - Validar campos no requeridos vacios
    [Arguments]    ${campo}
    ${attrCampo}=    Get Text    xpath=${campo}   
    Should Contain    ${attrCampo}    o arrastre una imagen
    
Contactos - Validar etiquetas
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
    ${toolGuardar}=    Get Element Attribute    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[7]/div/div[1]    tooltip
    ${toolCancelar}=    Get Element Attribute    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[7]/div/div[2]    tooltip
    Should be equal    ${toolGuardar}    Guardar
    Should be equal    ${toolCancelar}    Cancelar

Contactos - Capturar datos del formulario
    [Arguments]    ${arg1}
    Contacto - Validar campo unico Nombre    ${arg1}
    Input Text    xpath=//*[@id="txtContactoNombre"]/div/div[1]/input    ${CtoNombreUnico}
    Input Text    xpath=//*[@id="txtContactoApellido"]/div/div[1]/input    ${ContactoCrear}[Apellido]
    Input Text    xpath=//*[@id="txtContactoDireccion"]/div/div[1]/input    ${ContactoCrear}[Direccion]
    Seleccionar Estado
    Seleccionar Municipio
    Seleccionar Localidad
    Input Text    xpath=//*[@id="txtContactoComentarios"]/div/div[1]/textarea    ${ContactoCrear}[Comentarios]
    
Contactos - Validar campos requeridos
    ${Nombre}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[0].textContent;
    ${Apellido}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[1].textContent;
    ${Estado}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[2].textContent;
    ${Municipio}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[3].textContent;
    ${Localidad}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[4].textContent;
    Should be equal    ${Nombre}    Obligatorio
    Should be equal    ${Apellido}    Obligatorio
    Should be equal    ${Estado}    Obligatorio
    Should be equal    ${Municipio}    Obligatorio
    Should be equal    ${Localidad}    Obligatorio
    
TelefonoReferencia - Capturar datos del formulario
    Input Text    xpath=//*[@id="txtTelefono"]/div/div[1]/input    ${ContactoCrear}[Telefono]
    Input Text    xpath=//*[@id="txtReferencia"]/div/div[1]/input    ${ContactoCrear}[Referencia]

TelefonoReferencia - Mostrar campos requeridos
    ${Telefono}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[0].textContent;
    ${Referencia}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[1].textContent;
    Should be equal    ${Telefono}    Obligatorio
    Should be equal    ${Referencia}    Obligatorio

Seleccionar Estado
    Click Element    xpath=//*[@id="cboContactoEstado"]/div[1]/div/div[2]/div[2]/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[4]
    
Seleccionar Municipio
    Click Element    xpath=//*[@id="cboContactoMunicipio"]/div[1]/div/div[2]/div[2]/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[3]
    
Seleccionar Localidad
    Click Element    xpath=//*[@id="cboContactoLocalidad"]/div[1]/div/div[2]/div[2]/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[6]
    
Cliente - Llenar el formulario y Guardar
    Generales - Capturar datos del formulario    ${ClienteCrear}[Nombre]
    Generales - Obtener datos del formulario
    Sleep    1
    Generales - Presionar boton Guardar
    Wait Until Element Is Not Visible    xpath=/html/body/div[4]/div/div
    #Wait Until Element Is Not Visible    xpath=/html/body/div[4]/div/div/div[2]

Configuracion - Llenar el formulario y Guardar
    Configuracion - Capturar datos del formulario
    Sleep    1
    Configuracion - Presionar boton Guardar
    Wait Until Element Is Not Visible    xpath=/html/body/div[4]/div/div
    #Wait Until Element Is Not Visible    xpath=/html/body/div[4]/div/div/div[2]

Contactos - Llenar el formulario y Guardar
    Contactos - Capturar datos del formulario    ${ContactoCrear}[Nombre]
    Contactos - Obtener datos del formulario
    Sleep    1
    Contactos - Presionar boton Guardar
    Sleep    1
    Hacer scroll para ver el Boton Ver Detalle

Cerrar modal del formulario
    Wait Until Element Is Not Visible    xpath=/html/body/div[4]/div/div/div[2]
    Click Element    xpath=/html/body/div[3]/div/div[1]/div/div[3]/div/div/div

Ingresar al detalle del registro No. ${arg1} en el grid
    Click Element    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[4]/div/div
    Wait Until Page Contains Element    xpath=//*[@id="btnEliminar"]

Validar datos de TAB Generales
    Should Not Be Empty    ${CteNombre}
    Should Not Be Empty    ${CteRazon}
    Should Not Be Empty    ${CteDireccion}
    Should Not Be Empty    ${CteComentarios}

Validar datos de TAB Configuracion
    Should Not Be Empty    ${Nombre}
    Should Not Be Empty    ${Banner}
    Should Not Be Empty    ${Logo}
    Should Not Be Empty    ${Estilo}

Validar datos de TAB Contactos
    Should Not Be Empty    ${CtoNombre}
    Should Not Be Empty    ${CtoApellido}
    Should Not Be Empty    ${CtoDireccion}
    Should Not Be Empty    ${CtoEstado}
    Should Not Be Empty    ${CtoMunicipio}
    Should Not Be Empty    ${CtoLocalidad}
    Should Not Be Empty    ${CtoComentario}