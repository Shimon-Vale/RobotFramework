*** Settings ***
Resource    Recursos.Antenas.robot

*** Variables ***
&{AntenaEditar}    Descripcion=RFAntenaEditar    Serie=x0k:01008984SKY50A    Voltaje=750
${filtro}    RFAntena

*** Test Cases ***
Editar - Ingresar al detalle de un registro
    [Documentation]    Debe de mostrar los datos del registro seleccionado correctamente.
    [Tags]    Editar - Ingresar al detalle de un registro
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    2    ${filtro}
    Sleep    1
    Ingresar al detalle del registro
    Obtener los valores del formulario
    Validar registro en BD
    [Teardown]    Close Browser
    
Editar - Valida Etiquetas y tooltips
    [Documentation]    Debe de abrir una ventana con el titulo Editar Antena.
    [Tags]    Editar - Etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Ingresar al detalle del registro
    Validar etiquetas y tooltips
    [Teardown]    Close Browser

Editar - Validar elementos del combo Tipo
    [Documentation]    Debe de mostrar un combo con los tipos de antena: IDP
    [Tags]    Editar - Validar elementos del combo Tipo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Ingresar al detalle del registro
    Sleep    1
    Validar elementos del combo Tipo
    [Teardown]    Close Browser
    
Editar - Validar opcion Cancelar
    [Documentation]    Debe de cerrar la ventana de Edicion sin guardar ningun cambio.
    [Tags]    Editar - Validar opcion Cancelar - T1113
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Ingresar al detalle del registro
    Sleep    1
    Editar datos del formulario
    Obtener los valores del formulario
    Presionar opcion Cancelar
    Consultar registro en BD    0
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Editar - Validar opcion Guardar
    [Documentation]    Debe de editar correctamente Todos los campos de la antena seleccionada.
    [Tags]    Editar - Validar opcion Guardar - T1112
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    2    ${filtro}
    Sleep    1
    Ingresar al detalle del registro
    Sleep    1
    Editar datos del formulario
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener los valores del formulario
    Validar registro en BD
    [Teardown]    Close Browser
    
Editar - Tipo
    [Documentation]    Debe de editar correctamente el tipo de la antena seleccionada.
    [Tags]    Editar - Tipo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    2    ${filtro}
    Sleep    1
    Ingresar al detalle del registro
    Sleep    1
    Seleccionar Tipo    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener los valores del formulario
    Validar registro en BD
    [Teardown]    Close Browser
    
Editar - Descripcion
    [Documentation]    Debe de editar correctamente la descripcion de la antena seleccionada.
    [Tags]    Editar - Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    2    ${filtro}
    Sleep    1
    Ingresar al detalle del registro
    Editar el campo Descripcion
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener los valores del formulario
    Validar registro en BD
    [Teardown]    Close Browser

Editar - Maximo de caracteres en campo Descripcion
    [Documentation]    Debe de editar con la cantidad maxima de caracteres en descripcion.
    [Tags]    Editar - Maximo de caracteres en campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    2    ${filtro}
    Sleep    1
    Ingresar al detalle del registro
    Editar el campo Descripcion    ${caracteres}
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener los valores del formulario
    Validar registro en BD
    [Teardown]    Close Browser
    
Editar - Serie
    [Documentation]    Debe de editar correctamente el No. de Serie de la antena seleccionada.
    [Tags]    Editar - Serie
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    2    ${filtro}
    Sleep    1
    Ingresar al detalle del registro
    Editar el campo Serie
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener los valores del formulario
    Validar registro en BD
    [Teardown]    Close Browser

Editar - Maximo de caracteres en campo Serie
    [Documentation]    Debe de editar con la cantidad maxima de caracteres en serie.
    [Tags]    Editar - Maximo de caracteres en campo Serie
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    2    ${filtro}
    Sleep    1
    Ingresar al detalle del registro
    Editar el campo Serie    ${caracteres}
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener los valores del formulario
    Validar registro en BD
    [Teardown]    Close Browser

Editar - Voltaje
    [Documentation]    Debe de editar correctamente el voltaje de la antena seleccionada.
    [Tags]    Editar - Voltaje
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    2    ${filtro}
    Sleep    1
    Ingresar al detalle del registro
    Editar el campo Voltaje
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener los valores del formulario
    Validar registro en BD
    [Teardown]    Close Browser

Editar - Voltaje requerido
    [Documentation]    No debe de guardar ninguna modificacion sin valor en este campo.
    [Tags]    Editar - Voltaje requerido
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    2    ${filtro}
    Sleep    1
    Ingresar al detalle del registro
    Dejar vacio el campo Voltaje
    Presionar opcion Guardar
    Sleep    1
    Validar voltaje requerido
    [Teardown]    Close Browser

Editar - Validar mensaje para Descripcion y Serie existente
    [Documentation]    Debe de mandar un mensaje con la leyenda "El registro ya existe." y no generar el registro.
    [Tags]    Editar - Validar mensaje para Descripcion y Serie existente
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    2    ${filtro}
    Sleep    1
    Ingresar al detalle del registro
    Sleep    1
    Editar datos del formulario - Descripcion y Serie existente
    Obtener los valores del formulario
    Presionar opcion Guardar
    Validar mensaje    El registro ya existe.
    Consultar registro en BD    1
    [Teardown]    Close Browser
    
Editar - Validar mensaje de eliminacion
    [Documentation]    Debe de monstrar un mensaje con la leyenda "El registro será desactivado".
    [Tags]    Editar - Validar mensaje de eliminacion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Sleep    1
    Ingresar al detalle del registro
    Sleep    1
    Presionar opcion Eliminar
    Validar mensaje de confirmacion    El registro será desactivado.
    [Teardown]    Close Browser
    
Editar - Desactivar
    [Documentation]    Debe de desactivar la antena seleccionada.
    [Tags]    Editar - Desactivar - T203
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    2    ${filtro}
    Sleep    1
    Ingresar al detalle del registro
    Obtener los valores del formulario
    Sleep    1
    Presionar opcion Eliminar
    Confirmar accion
    Sleep    1
    Validar mensaje    Cambios guardados.
    Validar registro en BD    0
    [Teardown]    Close Browser

Editar - Validar mensaje de reactivacion
    [Documentation]    Debe de monstrar un mensaje con la leyenda "El registro será reactivado".
    [Tags]    Editar - Validar mensaje de reactivacion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por estatus    3
    Sleep    1
    Ingresar al detalle del registro
    Sleep    1
    Presionar opcion Reactivar
    Validar mensaje de confirmacion    El registro será reactivado.
    [Teardown]    Close Browser
    
Editar - Reactivar
    [Documentation]    Debe de reactivar la antena seleccionada.
    [Tags]    Editar - Reactivar - T202
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por estatus    3
    Filtrar por    2    ${filtro}
    Sleep    1
    Ingresar al detalle del registro
    Obtener los valores del formulario
    Sleep    1
    Presionar opcion Reactivar
    Sleep    0.25
    Confirmar accion
    Sleep    0.5
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    [Teardown]    Close Browser

*** Keywords ***
Editar datos del formulario
    Seleccionar Tipo    1
    Validar registro unico    ${AntenaEditar}[Descripcion]    ${queryAntena}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    Validar registro unico    ${AntenaEditar}[Serie]    ${querySerie}
    Input Text    xpath=//*[@id="txtNoSerie"]/div/div[1]/input    ${valorUnico}
    Input Text    xpath=//*[@id="txtVoltaje"]/div/div[1]/input    ${AntenaEditar}[Voltaje]
    
Editar datos del formulario - Descripcion y Serie existente
    Seleccionar Tipo    3
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${AntenaExistente}[Descripcion]
    Input Text    xpath=//*[@id="txtNoSerie"]/div/div[1]/input    ${AntenaExistente}[Serie]
    Input Text    xpath=//*[@id="txtVoltaje"]/div/div[1]/input    ${AntenaExistente}[Voltaje]
    
Editar el campo Descripcion
    [Arguments]    ${dsc}=${AntenaEditar}[Descripcion]
    Validar registro unico    ${dsc}    ${queryAntena}
    Sleep    1
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    
Editar el campo Serie
    [Arguments]    ${ser}=${AntenaEditar}[Serie]
    Validar registro unico    ${ser}    ${querySerie}
    Sleep    1
    Input Text    xpath=//*[@id="txtNoSerie"]/div/div[1]/input    ${valorUnico}
    
Editar el campo Voltaje
    Input Text    xpath=//*[@id="txtVoltaje"]/div/div[1]/input    ${AntenaEditar}[Voltaje]
    
Dejar vacio el campo Voltaje
    Clear Element Text    xpath=//*[@id="txtVoltaje"]/div/div[1]/input
    
Validar voltaje requerido
    #${tipo}=    Get Element Attribute    xpath=//*[@id="cboModems"]    textContent
    #${reqTipo}    Execute Javascript    cadena='${tipo}'; return cadena.substr(length-11);
    #${reqSerie}=    Get Element Attribute    xpath=//*[@id="txtNoSerie"]    textContent
    ${reqVoltaje}=    Get Element Attribute    xpath=//*[@id="txtVoltaje"]    textContent
    #Should be equal    ${reqTipo}    Obligatorio
    #Should be equal    ${reqSerie}    Obligatorio
    Should be equal    ${reqVoltaje}    Obligatorio

Validar etiquetas y tooltips
    ${ttGuardar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[6]/div/div[1]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[6]/div/div[2]    tooltip
    ${ttEliminar}=    Get Element Attribute    xpath=//*[@id="btnEliminar"]    tooltip
    ${ttReactivar}=    Get Element Attribute    xpath=//*[@id="btnReactivar"]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Editar Antena
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[1]    Estatus:
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[1]    Tipo:
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[3]/div[1]    Descripción:
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[4]/div[1]    No. Serie:
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div[1]    Voltaje:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    Should be equal    ${ttEliminar}    Eliminar
    Should be equal    ${ttReactivar}    Reactivar