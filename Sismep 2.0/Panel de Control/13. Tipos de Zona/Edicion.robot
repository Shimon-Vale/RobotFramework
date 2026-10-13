*** Settings ***
Resource    Recursos.TiposZona.robot

*** Variables ***
${filtroZona}    RFTipo
${tipoZonaEditar}       RFTipoZonaEditar

*** Test Cases ***
Edicion: Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Edicion: Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Filtrar por Zona    ${filtroZona}
    Presionar Orden por Zona
    Sleep    1
    Presionar boton Ver detalle
    Validar etiquetas y tooltips
    [Teardown]    Close Browser

Edicion: Editar Tipo de Zona
    [Documentation]    Debera guardar correctamente los cambios en la Base de datos.
    [Tags]    Edicion: Editar Tipo de Zona
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Filtrar por Zona    ${filtroZona}
    Sleep    1
    Presionar boton Ver detalle
    Editar los campos del formulario
    Presionar boton Guardar
    Validar mensaje    Cambios guardados.
    Validar Tipo de Zona en BD
    [Teardown]    Close Browser

Edicion: Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de edicion y no guardar en la Base de datos.
    [Tags]    Edicion: Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Filtrar por Zona    ${filtroZona}
    Sleep    1
    Presionar boton Ver detalle
    Editar los campos del formulario
    Obtener datos del formulario
    Sleep    1
    Presionar boton Cancelar
    Validar Tipo de Zona inexistente en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser

Edicion: Validar opcion Eliminar (Desactivar)
    [Documentation]    Debera desactivar el registro correctamente.
    [Tags]    Edicion: Validar opcion Eliminar (Desactivar) - T184
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Filtrar por Zona    ${filtroZona}
    Sleep    1
    Presionar boton Ver detalle
    Sleep    1
    Presionar boton Eliminar
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar mensaje    Cambios guardados.
    Validar Tipo de Zona en BD    Activo=0
    [Teardown]    Close Browser

Edicion: Validar opcion Reactivar
    [Documentation]    Debera reactivar correctamente el registro.
    [Tags]    Edicion: Validar opcion Reactivar - T185
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Filtrar por Estatus    3
    Filtrar por Zona    ${filtroZona}
    Sleep    1
    Presionar boton Ver detalle
    Sleep    1
    Presionar boton Reactivar
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar mensaje    Cambios guardados.
    Validar Tipo de Zona en BD
    [Teardown]    Close Browser

Edicion: Descripcion duplicada
    [Documentation]    Debera mostrar una validacion indicando que la Descripcion ya existe.
    [Tags]    Edicion: Descripcion duplicada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Filtrar por Zona    ${filtroZona}
    Sleep    1
    Presionar boton Ver detalle
    Editar datos del formulario Descripcion duplicada
    Sleep    1
    Presionar boton Guardar
    Validar mensaje    El registro ya existe.
    [Teardown]    Close Browser

Edicion: Campos obligatorios
    [Documentation]    Debera pintar en rojo los campos obligatorios.
    [Tags]    Edicion: Campos obligatorios
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Filtrar por Zona    ${filtroZona}
    Sleep    1
    Presionar boton Ver detalle
    Borrar descripcion
    Sleep    1
    Presionar boton Guardar
    Validar campos requeridos
    [Teardown]    Close Browser

*** Keywords ***
Validar etiquetas y tooltips
    ${ttGuardar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[9]/div/div[1]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[9]/div/div[2]    tooltip
    ${ttEliminar}=    Get Element Attribute    xpath=//*[@id="btnEliminar"]    tooltip
    ${ttReactivar}=    Get Element Attribute    xpath=//*[@id="btnReactivar"]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Editar Tipo de Zona
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/label    Estatus:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[2]/label    Descripción:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[3]/label    Zona Informativa:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[4]/label    ¿Valida Proximidad?:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[5]/label    ¿Requiere Punto de Interés?:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[6]/label    ¿Agregar Listas?:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[7]/label    Tipo de Lista:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[8]/label    ¿Mostrar Alerta?:
    Element Text Should Be    xpath=//*[@id="rblZonaInformativa"]/div/div[1]/div[2]    Sí
    Element Text Should Be    xpath=//*[@id="rblZonaInformativa"]/div/div[2]/div[2]    No
    Element Text Should Be    xpath=//*[@id="rblValidaProximidad"]/div/div[1]/div[2]    Sí
    Element Text Should Be    xpath=//*[@id="rblValidaProximidad"]/div/div[2]/div[2]    No
    Element Text Should Be    xpath=//*[@id="rblRequierePI"]/div/div[1]/div[2]    Sí
    Element Text Should Be    xpath=//*[@id="rblRequierePI"]/div/div[2]/div[2]    No
    Element Text Should Be    xpath=//*[@id="rblAgregarListas"]/div/div[1]/div[2]    Sí
    Element Text Should Be    xpath=//*[@id="rblAgregarListas"]/div/div[2]/div[2]    No
    #Element Text Should Be    xpath=//*[@id="rblTipoLista"]/div/div[1]/div[2]    Inclusión
    #Element Text Should Be    xpath=//*[@id="rblTipoLista"]/div/div[2]/div[2]    Exclusión
    Element Text Should Be    xpath=//*[@id="rblMostrarAlerta"]/div/div[1]/div[2]    Sí
    Element Text Should Be    xpath=//*[@id="rblMostrarAlerta"]/div/div[2]/div[2]    No
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    Should be equal    ${ttEliminar}    Eliminar
    Should be equal    ${ttReactivar}    Reactivar

Editar los campos del formulario
    Validar registro unico    ${tipoZonaEditar}    ${queryTipoZona}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    Click Element    xpath=//*[@id="rblValidaProximidad"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblAgregarListas"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblMostrarAlerta"]/div/div[2]/div[1]/div

Editar datos del formulario Descripcion duplicada
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${RegistroExistente}
    Click Element    xpath=//*[@id="rblValidaProximidad"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblAgregarListas"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblMostrarAlerta"]/div/div[2]/div[1]/div
    
Borrar descripcion
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${EMPTY}
    
Presionar boton Eliminar
    Click Element    xpath=//*[@id="btnEliminar"]

Presionar boton Reactivar
    Click Element    xpath=//*[@id="btnReactivar"]
    
Presionar Orden por Zona
    Click Element    //*[@id="dx-col-4"]