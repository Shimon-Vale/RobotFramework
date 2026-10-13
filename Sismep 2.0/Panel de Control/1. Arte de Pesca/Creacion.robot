*** Settings ***
Resource    Recursos.ArtePesca.robot

*** Variables ***
${artedepesca}    RFArtedePesca
${artedepescavacia}
${btnGuardar}    //*[@id="gen_btnGaurdar"]
${querySQL}    SELECT Descripcion FROM [Sismep].[TSismepArtesCarga] WHERE Descripcion=

*** Test Cases ***
Crear - Validar etiquetas y tooltips
    [Documentation]    Validar etiquetas y tooltips de la ventana.
    [Tags]    Crear - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Presionar opcion Nuevo registro    ${btnGuardar}
    Validar etiquetas y tooltips
    [Teardown]    Close Browser

Crear - Validar opcion Guardar
    [Documentation]    Debe de guardar correctamente el registro.
    [Tags]    Crear - Validar opcion Guardar - T29
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Presionar opcion Nuevo registro    ${btnGuardar}
    Capturar datos del formulario    ${artedepesca}    ${querySQL}
    Presionar opcion Guardar
    Sleep    1
    Validar registro en BD    ${valorUnico}
    Validar mensaje    Registro guardado.
    [Teardown]    Close Browser

Crear - Validar opcion Cancelar
    [Documentation]    Debe de cerrar la ventana sin guardar ningun registro.
    [Tags]    Crear - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Presionar opcion Nuevo registro    ${btnGuardar}
    Capturar datos del formulario    ${artedepesca}    ${querySQL}
    Sleep    1
    Presionar opcion Cancelar
    Validar numero de registros en BD    ${valorUnico}    0
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser

Crear - Descripcion requerida
    [Documentation]    No debe de guardar el registro sin este campo.
    [Tags]    Crear - Descripcion requerida
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Presionar opcion Nuevo registro    ${btnGuardar}
    Dejar vacio el campo Descripcion
    Presionar opcion Guardar
    Validar numero de registros en BD    ${artedepescavacia}    0
    [Teardown]    Close Browser

Crear - Maximo de caracteres en campo Descripcion
    [Documentation]    Debe de editar correctamente la descripcion de la antena seleccionada con el maximo de caracteres permitidos.
    [Tags]    Crear - Maximo de caracteres en campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Presionar opcion Nuevo registro    ${btnGuardar}
    Capturar datos del formulario    ${artedepesca}    ${querySQL}
    Obtener solo los caracteres soportados por el campo    ${valorUnico}
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Validar registro en BD    ${campo}
    [Teardown]    Close Browser

Crear - Validar Descripcion existente
    [Documentation]    No debe guardar registros duplicados con este campo.
    [Tags]    Crear - Validar Descripcion existente - T30
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Presionar opcion Nuevo registro    ${btnGuardar}
    Capturar Descripcion existente
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    El registro ya existe.
    Validar numero de registros en BD    ${artedepescaexistente}    1
    [Teardown]    Close Browser
    
*** Keywords ***    
Validar etiquetas y tooltips
    ${guardar}=    Get Element Attribute    xpath=//*[@id="gen_btnGaurdar"]    tooltip
    ${cancelar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[3]/div/div[2]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div    Nueva Arte de Pesca
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[1]    Estatus:
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[2]    Descripción:
    Should be equal    ${guardar}    Guardar
    Should be equal    ${cancelar}    Cancelar