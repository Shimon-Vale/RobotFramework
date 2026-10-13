*** Settings ***
Resource    Recursos.Especies.robot

*** Variables ***
${EspecieEditar}    RFEspecieEditar
${EspecieExistente}    CALAMAR
${EspecieFiltro}    RFEsp

*** Test Cases ***
Editar - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Editar - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Ingresar al detalle del registro No. 1 en el grid
    Validar etiquetas y tooltips
    [Teardown]    Close Browser

Editar - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de edicion y no guardar en la Base de datos.
    [Tags]    Editar - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Filtrar por Columna 1 y Campo ${EspecieFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del formulario    ${EspecieEditar}
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Cancelar
    Sleep    1
    Validar Especie inexistente en BD
    [Teardown]    Close Browser
    
Editar - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente los cambios en la Base de datos.
    [Tags]    Editar - Validar opcion Guardar - T131
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Filtrar por Columna 1 y Campo ${EspecieFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del formulario    ${EspecieEditar}
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Validar mensaje    Registro guardado.
    Obtener datos del formulario
    Validar Especies en BD
    [Teardown]    Close Browser

Editar - Validar opcion Desactivar
    [Documentation]    Debera desactivar correctamente el registro.
    [Tags]    Editar - Validar opcion Desactivar - T132
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Filtrar por Columna 1 y Campo ${EspecieFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Obtener datos del formulario
    Sleep    1
    Presionar opcion Desactivar
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar Especies en BD    0
    [Teardown]    Close Browser

Editar - Validar opcion Reactivar
    [Documentation]    Debera reactivar correctamente el registro.
    [Tags]    Editar - Validar opcion Reactivar - T129
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Sleep    1
    Filtrar por Estatus    3
    Filtrar por Columna 1 y Campo ${EspecieFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Obtener datos del formulario
    Sleep    1
    Presionar opcion Reactivar
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar Especies en BD
    [Teardown]    Close Browser

Editar - Descripcion duplicada
    [Documentation]    Debera mostrar una validacion indicando que la descripcion ya existe.
    [Tags]    Editar - Descripcion duplicada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Filtrar por Columna 1 y Campo ${EspecieFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Editar datos del formulario Descripcion duplicada    ${EspecieExistente}
    Sleep    1
    Presionar opcion Guardar
    Obtener datos del formulario
    Sleep    1
    Validar mensaje    Se localiz\u00F3 un registro con la misma referencia, favor de verificarlo o notificar al administrador.
    Validar Especie inexistente en BD
    [Teardown]    Close Browser

Editar - Validar campos requeridos
    [Documentation]    Debera mostrar en color rojo los campos obligatorios.
    [Tags]    Editar - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Filtrar por Columna 1 y Campo ${EspecieFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Dejar vacio los campos del formulario
    Sleep    1
    Presionar opcion Guardar
    Validar campos obligatorios
    [Teardown]    Close Browser

*** Keywords ***
Validar etiquetas y tooltips
    ${ttGuardar}    Get Element Attribute    xpath=//*[@id="gen_btnGaurdar"]    tooltip
    ${ttCancelar}    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[4]/div/div[2]    tooltip
    ${ttDesactivar}    Get Element Attribute    xpath=//*[@id="btnDesactivar"]    tooltip
    ${ttReactivar}    Get Element Attribute    xpath=//*[@id="btnReactivar"]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Editar Especie
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[1]    Estatus:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[1]    Nombre:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[3]/div[1]    Tipo de Carga:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    Should be equal    ${ttDesactivar}    Desactivar
    Should be equal    ${ttReactivar}    Reactivar

Ingresar al detalle del registro No. ${arg1} en el grid
    Click Element    xpath=//*[@id="gridSubTipoCarga"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[4]/div/div
    Wait Until Element Is Visible    xpath=//*[@id="gen_btnGaurdar"]

Editar datos del formulario
    [Arguments]    ${arg1}
    Validar campo unico Descripcion    ${arg1}
    Sleep    1
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${DescripcionUnica}
    Seleccionar Tipo de carga    6

Editar datos del formulario Descripcion duplicada
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${arg1}
    Seleccionar Tipo de carga    6

Dejar vacio los campos del formulario
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${EMPTY}

Confirmar accion
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div[2]/div/div
    Click Element    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div[2]/div/div

Validar campos obligatorios
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="txtDescripcion"]    textContent
    Should be equal    ${attrDescripcion}    Obligatorio