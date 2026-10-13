*** Settings ***
Resource    Recursos.PI.robot

*** Variables ***
&{PICrear}    Descripcion=RFPuntoInteres    Latitud=25.677124    Longitud=-100.303032
${PIExistente}    Isla Clarion

*** Test Cases ***
Crear - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Crear - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Presionar opcion Nuevo Registro
    Validar etiquetas
    [Teardown]    Close Browser
    
Crear - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente el registro en la Base de Datos.
    [Tags]    Crear - Validar opcion Guardar - T87
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Presionar opcion Nuevo Registro
    Capturar datos del formulario
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Validar PI en BD
    [Teardown]    Close Browser
    
Crear - Validar opcion Cancelar
    [Documentation]    Debera cancelar la acción de crear un registro sin guardar ningun registro.
    [Tags]    Crear - Validar opcion Cancelar - T91
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Presionar opcion Nuevo Registro
    Capturar datos del formulario    ${PICrear}[Descripcion]
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Cancelar
    Sleep    2
    Validar PI inexistente en BD
    [Teardown]    Close Browser
    
Crear - Descripcion duplicada
    [Documentation]    Debera mostrar una validacion indicando que la descripcion esta duplicada.
    [Tags]    Crear - Descripcion duplicada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Presionar opcion Nuevo Registro
    Capturar datos del formulario Descripcion duplicada    ${PIExistente}
    Sleep    1
    Presionar opcion Guardar
    Obtener datos del formulario
    Sleep    2
    Validar mensaje    El registro ya existe.
    Validar PI inexistente en BD
    [Teardown]    Close Browser
    
Crear - Validar campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Crear - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Presionar opcion Nuevo Registro
    Sleep    1
    Presionar opcion Guardar
    Sleep    1
    Validar campos obligatorios
    [Teardown]    Close Browser
    
*** Keywords ***
Presionar opcion Nuevo Registro
    Click element    xpath://*[@id="divContainer"]/div[1]/div[1]/div[2]/div
    
Capturar datos del formulario
    [Arguments]     ${dsc}=${PICrear}[Descripcion]
    #Validar campo unico Descripcion    ${arg1}
    Validar registro unico    ${dsc}    ${queryPInteres}
    Sleep    1
    #Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${DescripcionUnica}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    Seleccionar Tipo Punto    1
    Seleccionar Icono    3
    Input Text    xpath=//*[@id="txtLatitud"]/div/div[1]/input    ${PICrear}[Latitud]
    Input Text    xpath=//*[@id="txtLongitud"]/div/div[1]/input    ${PICrear}[Longitud]
    
Capturar datos del formulario Descripcion duplicada
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${arg1}
    Sleep    1
    Seleccionar Tipo Punto    1
    Seleccionar Icono    3
    Input Text    xpath=//*[@id="txtLatitud"]/div/div[1]/input    ${PICrear}[Latitud]
    Input Text    xpath=//*[@id="txtLongitud"]/div/div[1]/input    ${PICrear}[Longitud]
    
Validar campos obligatorios
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="txtDescripcion"]    textContent
    ${Tipo}    Execute Javascript    return document.getElementsByClassName("sismep-selectbox dx-selectbox dx-textbox dx-texteditor dx-dropdowneditor-button-visible dx-editor-outlined dx-texteditor-empty dx-widget dx-dropdowneditor dx-dropdowneditor-field-clickable dx-validator dx-visibility-change-handler dx-invalid")[0].textContent;
    ${attrTipo}    Execute Javascript    cadena='${Tipo}'; return Obli = cadena.substr(100, 111);
    ${Icono}    Execute Javascript    return document.getElementsByClassName("sismep-selectbox dx-selectbox dx-textbox dx-texteditor dx-dropdowneditor-button-visible dx-editor-outlined dx-texteditor-empty dx-widget dx-dropdowneditor dx-dropdowneditor-field-clickable dx-validator dx-visibility-change-handler dx-invalid")[0].textContent;
    ${attrIcono}    Execute Javascript    cadena='${Icono}'; return Obli = cadena.substr(100, 111);
    ${attrLatitud}=    Get Element Attribute    xpath=//*[@id="txtLatitud"]    textContent
    ${attrLongitud}=    Get Element Attribute    xpath=//*[@id="txtLongitud"]    textContent
    Should be equal    ${attrDescripcion}    Obligatorio
    Should be equal    ${attrTipo}    Obligatorio
    Should be equal    ${attrIcono}    Obligatorio
    Should be equal    ${attrLatitud}    Obligatorio
    Should be equal    ${attrLongitud}    Obligatorio
    
Validar etiquetas
    ${Titulo}=    Get Text    xpath:/html/body/div[3]/div/div[1]/div/div[1]/div/div/div
    ${Estatus}=    Get Text    xpath:/html/body/div[3]/div/div[2]/div/div[1]/div[1]
    ${Descripcion}=    Get text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[1]
    ${Tipo}=    Get text    xpath:/html/body/div[3]/div/div[2]/div/div[3]/div[1]
    ${Icono}=    Get text    xpath:/html/body/div[3]/div/div[2]/div/div[4]/div[1]
    ${Latitud}=    Get text    xpath:/html/body/div[3]/div/div[2]/div/div[5]/div[1]
    ${Longitud}=    Get text    xpath:/html/body/div[3]/div/div[2]/div/div[5]/div[3]
    ${toolGuardar}=    Execute JavaScript    return document.getElementsByClassName("sismep-button btn-padding dx-button dx-button-default dx-button-mode-contained dx-widget dx-button-has-icon")[1].getAttribute("title")
    ${toolCancelar}=    Execute JavaScript    return document.getElementsByClassName("sismep-button btn-padding dx-button dx-button-default dx-button-mode-contained dx-widget dx-button-has-icon")[2].getAttribute("title")
    Should Be Equal    ${Titulo}    Nuevo Punto de Interés
    Should Be Equal    ${Estatus}    Estatus:
    Should Be Equal As Strings    ${Descripcion}    Descripción:
    Should Be Equal As Strings    ${Tipo}    Tipo Punto:
    Should Be Equal As Strings    ${Icono}    Icono:
    Should Be Equal As Strings    ${Latitud}    Latitud:
    Should Be Equal As Strings    ${Longitud}    Longitud:
    Should be equal    ${toolGuardar}    Guardar
    Should be equal    ${toolCancelar}    Cancelar