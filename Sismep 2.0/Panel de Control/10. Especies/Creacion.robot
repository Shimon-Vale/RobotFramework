*** Settings ***
Resource    Recursos.Especies.robot

*** Variables ***
&{EspecieCrear}    Descripcion=RFEspecie
${EspecieExistente}    CALAMAR
${btnGuardar}    //*[@id="gen_btnGaurdar"]

*** Test Cases ***
Crear - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tootlips.
    [Tags]    Crear - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Validar etiquetas y tooltips
    [Teardown]    Close Browser

Crear - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente en la Base de datos.
    [Tags]    Crear - Validar opcion Guardar - T126
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Validar mensaje    Registro guardado.
    Obtener datos del formulario
    Validar Especies en BD
    [Teardown]    Close Browser

Crear - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion y no guardar en la Base de datos.
    [Tags]    Crear - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    ${EspecieCrear}
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Cancelar
    Sleep    2
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    Validar Especie inexistente en BD
    [Teardown]    Close Browser

Crear - Descripcion duplicada
    [Documentation]    Debera mostrar una validacion indicando que la descripcion ya existe.
    [Tags]    Crear - Descripcion duplicada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario Descripcion duplicada    ${EspecieExistente}
    Sleep    1
    Presionar opcion Guardar
    Obtener datos del formulario
    Sleep    2
    Validar mensaje    El registro ya existe.
    Validar numero de registros en BD    1
    [Teardown]    Close Browser

Crear - Validar campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Crear - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Presionar opcion Guardar
    Sleep    1
    Validar campos obligatorios
    [Teardown]    Close Browser

*** Keywords ***
Validar etiquetas y tooltips
    ${ttGuardar}    Get Element Attribute    xpath=//*[@id="gen_btnGaurdar"]    tooltip
    ${ttCancelar}    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[4]/div/div[2]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Nueva Especie
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[1]    Estatus:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[1]    Nombre:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[3]/div[1]    Tipo de Carga:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    
Capturar datos del formulario
    [Arguments]    ${dsc}=${EspecieCrear}[Descripcion]
    #Validar campo unico Descripcion    ${arg1}
    Validar registro unico    ${dsc}    ${queryEspecies}
    Sleep    1
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    Seleccionar Tipo de carga    2

Capturar datos del formulario Descripcion duplicada
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${arg1}
    Seleccionar Tipo de carga    2

Validar campos obligatorios
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="txtDescripcion"]    textContent
    ${Tipo}=    Get Element Attribute    xpath=//*[@id="ddlTipoCarga"]    textContent
    ${attrTipo}    Execute Javascript    cadena='${Tipo}'; return cadena.substr(length-11);
    Should be equal    ${attrDescripcion}    Obligatorio
    Should be equal    ${attrTipo}    Obligatorio