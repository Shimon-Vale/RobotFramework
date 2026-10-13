*** Settings ***
Resource    Recursos.PI.robot

*** Variables ***
&{PIEditar}    Descripcion=RFPuntoInteresEditar    Latitud=25.6795614    Longitud=-100.305752
${PIExistente}    Isla Clarion
${PIFiltro}    RFPunto

*** Test Cases ***
Editar - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Editar - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Filtrar por Columna 1 y Campo ${PIFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Validar etiquetas
    [Teardown]    Close Browser
    
Editar - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente los cambios realizados en la Base de Datos.
    [Tags]    Editar - Validar opcion Guardar - T79
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Filtrar por Columna 1 y Campo ${PIFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del formulario    ${PIEditar}[Descripcion]
    Sleep    1
    Presionar opcion Guardar
    Sleep    1
    Validar PI en BD
    [Teardown]    Close Browser
    
Editar - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de edicion sin guardar nada en la Base de datos.
    [Tags]    Editar - Validar opcion Cancelar - T85
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Filtrar por Columna 1 y Campo ${PIFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del formulario    ${PIEditar}[Descripcion]
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Cancelar
    Sleep    1
    Validar PI inexistente en BD
    [Teardown]    Close Browser
    
Editar - Validar opcion Eliminar
    [Documentation]    Debera desactivar el registro correctamente.
    [Tags]    Editar - Validar opcion Eliminar - T78
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Filtrar por Columna 1 y Campo ${PIFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Presionar opcion Eliminar
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar PI en BD    0
    [Teardown]    Close Browser
    
Editar - Validar opcion Reactivar
    [Documentation]    Debera reactivar el registro correctamente.
    [Tags]    Editar - Validar opcion Reactivar - T76
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Sleep    1
    Filtrar por Estatus    ${Inactivo}
    Filtrar por Columna 1 y Campo ${PIFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Presionar opcion Reactivar
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar PI en BD
    [Teardown]    Close Browser
    
Editar - Descripcion duplicada
    [Documentation]    Debera mostrar una validacion indicando que el registro esta duplicado.
    [Tags]    Editar - Descripcion duplicada - T80
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Filtrar por Columna 1 y Campo ${PIFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del formulario Descripcion duplicada    ${PIExistente}
    Sleep    1
    Presionar opcion Guardar
    Obtener datos del formulario
    Sleep    2
    Validar mensaje    El registro ya existe.
    Validar PI inexistente en BD
    [Teardown]    Close Browser
    
Editar - Mostrar validacion de campos requeridos
    [Documentation]    Debera mostrar en color rojo los campos obligatorios.
    [Tags]    Editar - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Filtrar por Columna 1 y Campo ${PIFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Dejar vacio los campos del formulario
    Presionar opcion Guardar
    Sleep    1
    Mostrar campos obligatorios
    [Teardown]    Close Browser
    
*** Keywords ***
Ingresar al detalle del registro No. ${arg1} en el grid
    Click Element    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[5]/div
    Wait Until Page Contains Element    xpath=//*[@id="DeleteButton"]
    
Editar datos del formulario
    [Arguments]    ${arg1}
    Validar campo unico Descripcion    ${arg1}
    Sleep    1
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${DescripcionUnica}
    Seleccionar Tipo Punto    2
    Seleccionar Icono    6
    Input Text    xpath=//*[@id="txtLatitud"]/div/div[1]/input    ${PIEditar}[Latitud]
    Input Text    xpath=//*[@id="txtLongitud"]/div/div[1]/input    ${PIEditar}[Longitud]
    
Editar datos del formulario Descripcion duplicada
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${arg1}
    Seleccionar Tipo Punto    2
    Seleccionar Icono    6
    Input Text    xpath=//*[@id="txtLatitud"]/div/div[1]/input    ${PIEditar}[Latitud]
    Input Text    xpath=//*[@id="txtLongitud"]/div/div[1]/input    ${PIEditar}[Longitud]
    
Dejar vacio los campos del formulario
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtLatitud"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtLongitud"]/div/div[1]/input    ${EMPTY}
    
Confirmar accion
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div[2]/div/div
    Click Element    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div[2]/div/div
    
Mostrar campos obligatorios
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="txtDescripcion"]    textContent
    ${attrLatitud}=    Get Element Attribute    xpath=//*[@id="txtLatitud"]    textContent
    ${attrLongitud}=    Get Element Attribute    xpath=//*[@id="txtLongitud"]    textContent
    Should be equal    ${attrDescripcion}    Obligatorio
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
    ${toolEliminar}=    Execute JavaScript    return document.getElementsByClassName("sismep-button btn-padding dx-button dx-button-danger dx-button-mode-contained dx-widget dx-button-has-icon")[0].getAttribute("title")
    ${toolReactivar}=    Execute JavaScript    return document.getElementsByClassName("sismep-button btn-padding dx-button dx-button-success dx-button-mode-contained dx-widget dx-button-has-icon dx-state-disabled")[0].getAttribute("title")
    Should Be Equal    ${Titulo}    Editar Punto de Interés
    Should Be Equal    ${Estatus}    Estatus:
    Should Be Equal As Strings    ${Descripcion}    Descripción:
    Should Be Equal As Strings    ${Tipo}    Tipo Punto:
    Should Be Equal As Strings    ${Icono}    Icono:
    Should Be Equal As Strings    ${Latitud}    Latitud:
    Should Be Equal As Strings    ${Longitud}    Longitud:
    Should be equal    ${toolGuardar}    Guardar
    Should be equal    ${toolCancelar}    Cancelar
    Should be equal    ${toolEliminar}    Eliminar
    Should be equal    ${toolReactivar}    Reactivar