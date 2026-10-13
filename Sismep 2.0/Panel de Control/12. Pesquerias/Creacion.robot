*** Settings ***
Resource    Recursos.Pesquerias.robot

*** Variables ***
&{TCCrear}    Descripcion=RFPesqueria    VMinima=0.5678    VMaxima=4.2389
${btnGuardar}    /html/body/div[3]/div/div[2]/div/div[5]/div/div[1]

*** Test Cases ***
Crear - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Crear - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Validar etiquetas y tooltips
    [Teardown]    Close Browser
    
Crear - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente en la Base de datos.
    [Tags]    Crear - Validar opcion Guardar - T160
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario
    Validar Pesqueria en BD
    [Teardown]    Close Browser

Crear - Validar opcion Guardar - Ver Detalle
    [Documentation]    Debera mostrar correctamente los datos previmente guardados.
    [Tags]    Crear - Validar opcion Guardar - Ver Detalle
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario
    Presionar opcion Cancelar
    Sleep    1
    Filtrar por Columna 1 y Campo ${Descripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Validar Pesqueria en BD
    [Teardown]    Close Browser
    
Crear - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion y no guardar en la Base de datos.
    [Tags]    Crear - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Cancelar
    Sleep    1
    Validar Pesqueria inexistente en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Crear - Descripcion duplicada
    [Documentation]    Debera mostrar una validacion indicando que la Descripcion ya existe.
    [Tags]    Crear - Descripcion duplicada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario Descripcion duplicada
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    El registro ya existe.
    Obtener datos del formulario
    Validar Pesqueria inexistente en BD
    [Teardown]    Close Browser
    
Crear - Validacion de campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Crear - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Presionar opcion Guardar
    Sleep    1
    Validar campos obligatorios
    [Teardown]    Close Browser
    
*** Keywords ***
Capturar datos del formulario
    Validar registro unico    ${TCCrear}[Descripcion]    ${queryTipoCarga}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    Input Text    xpath=//*[@id="txtVelMin"]/div/div[1]/input    ${TCCrear}[VMinima]
    Input Text    xpath=//*[@id="txtVelMax"]/div/div[1]/input    ${TCCrear}[VMaxima]
    
Capturar datos del formulario Descripcion duplicada
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${TCExistente}
    Input Text    xpath=//*[@id="txtVelMin"]/div/div[1]/input    ${TCCrear}[VMinima]
    Input Text    xpath=//*[@id="txtVelMax"]/div/div[1]/input    ${TCCrear}[VMaxima]
    
Validar campos obligatorios
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="txtDescripcion"]    textContent
    ${attrVMin}=    Get Element Attribute    xpath=//*[@id="txtVelMin"]    textContent
    ${attrVMax}=    Get Element Attribute    xpath=//*[@id="txtVelMax"]    textContent
    Should be equal    ${attrDescripcion}    Obligatorio
    Should be equal    ${attrVMin}    Obligatorio
    Should be equal    ${attrVMax}    Obligatorio
    
Validar etiquetas y tooltips
    ${ttGuardar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div/div[1]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div/div[2]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Nuevo Tipo de Carga
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/label    Estatus:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[2]/label    Descripci\u00F3n:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[3]/label    Velocidad M\u00EDnima:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[4]/label    Velocidad M\u00E1xima:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar