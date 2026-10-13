*** Settings ***
Resource    Recursos.Pesquerias.robot

*** Variables ***
&{TCEditar}    Descripcion=RFPesqueriaEditar    VMinima=1.8765    VMaxima=5.4321
${filtroDescripcion}    RF

*** Test Cases ***
Editar - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Editar - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Ingresar al detalle del registro No. 1 en el grid
    Validar etiquetas y tooltips
    [Teardown]    Close Browser

Editar - Validar Ver detalle
    [Documentation]    Debera mostrar correctamente la informacion de la pesqueria seleccionada.
    [Tags]    Editar - Validar Ver detalle
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Ingresar al detalle del registro No. 1 en el grid
    Obtener datos del formulario
    Validar Pesqueria en BD
    [Teardown]    Close Browser

Editar - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente en la Base de datos.
    [Tags]    Editar - Validar opcion Guardar - T156
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Columna 1 y Campo ${filtroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Editar datos del formulario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario
    Validar Pesqueria en BD
    [Teardown]    Close Browser
    
Editar - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de edicion y no guardar en la BD.
    [Tags]    Editar - Validar opcion Cancelar - T159
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Columna 1 y Campo ${filtroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Editar datos del formulario
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Cancelar
    Sleep    1
    Validar Pesqueria inexistente en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Editar - Validar opcion Eliminar
    [Documentation]    Debera desactivar correctamente el registro.
    [Tags]    Editar - Validar opcion Eliminar - T157
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Columna 1 y Campo ${filtroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Obtener datos del formulario
    Sleep    1
    Presionar opcion Eliminar
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro guardado.
    Validar Pesqueria en BD    0
    [Teardown]    Close Browser
    
Editar - Validar opcion Reactivar
    [Documentation]    Debera reactivar correctamente el registro.
    [Tags]    Editar - Validar opcion Reactivar - T158
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Estatus    3
    Filtrar por Columna 1 y Campo ${filtroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Obtener datos del formulario
    Sleep    1
    Presionar opcion Reactivar
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro guardado.
    Validar Pesqueria en BD
    [Teardown]    Close Browser
    
Editar - Descripcion duplicada
    [Documentation]    Debera mostrar una validacion indicando que la Descripcion ya existe.
    [Tags]    Editar - Descripcion duplicada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Columna 1 y Campo ${filtroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Editar datos del formulario Descripcion duplicada
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    El registro ya existe.
    Obtener datos del formulario
    Validar Pesqueria inexistente en BD
    [Teardown]    Close Browser
    
Editar - Validar campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Editar - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Columna 1 y Campo ${filtroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Dejar vacio los campos del formulario
    Presionar opcion Guardar
    Sleep    1
    Validar campos requeridos
    [Teardown]    Close Browser
    
*** Keywords ***
Editar datos del formulario
    Validar registro unico    ${TCEditar}[Descripcion]    ${queryTipoCarga}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    Input Text    xpath=//*[@id="txtVelMin"]/div/div[1]/input    ${TCEditar}[VMinima]
    Input Text    xpath=//*[@id="txtVelMax"]/div/div[1]/input    ${TCEditar}[VMaxima]
    
Editar datos del formulario Descripcion duplicada
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${TCExistente}
    Input Text    xpath=//*[@id="txtVelMin"]/div/div[1]/input    ${TCEditar}[VMinima]
    Input Text    xpath=//*[@id="txtVelMax"]/div/div[1]/input    ${TCEditar}[VMaxima]
    
Dejar vacio los campos del formulario
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtVelMin"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtVelMax"]/div/div[1]/input    ${EMPTY}
    
Validar campos requeridos
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="txtDescripcion"]    textContent
    ${attrVMin}=    Get Element Attribute    xpath=//*[@id="txtVelMin"]    textContent
    ${attrVMax}=    Get Element Attribute    xpath=//*[@id="txtVelMax"]    textContent
    Should be equal    ${attrDescripcion}    Obligatorio
    Should be equal    ${attrVMin}    Obligatorio
    Should be equal    ${attrVMax}    Obligatorio
    
Validar etiquetas y tooltips
    ${ttGuardar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div/div[1]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div/div[2]    tooltip
    ${ttEliminar}=    Get Element Attribute    xpath=//*[@id="btnEliminar"]    tooltip
    ${ttReactivar}=    Get Element Attribute    xpath=//*[@id="btnReactivar"]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Editar Tipo de Carga
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/label    Estatus:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[2]/label    Descripci\u00F3n:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[3]/label    Velocidad M\u00EDnima:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[4]/label    Velocidad M\u00E1xima:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    Should be equal    ${ttEliminar}    Eliminar
    Should be equal    ${ttReactivar}    Reactivar