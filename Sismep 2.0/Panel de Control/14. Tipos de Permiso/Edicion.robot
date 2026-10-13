*** Settings ***
Resource    Recursos.TiposPermiso.robot

*** Variables ***
${filtroPermiso}    Grupo
${PermisoEditar}    GrupoRFEditar
${queryPermiso}    select Descripcion from Sismep.TSismepTiposPermiso where EditablePorUsuario=0 and Descripcion=

*** Test Cases ***
Editar - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Editar - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Permiso
    Filtrar por Columna 1 y Campo ${filtroPermiso}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Validar etiquetas y tooltips
    [Teardown]    Close Browser
    
Editar - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente el registro en la Base de datos.
    [Tags]    Editar - Validar opcion Guardar - T197
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Permiso
    Filtrar por Columna 1 y Campo ${filtroPermiso}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del formulario
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario
    Validar actualizacion en BD
    [Teardown]    Close Browser
    
Editar - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de edicion y no guardar en la Base de datos.
    [Tags]    Editar - Validar opcion Cancelar - T199
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Permiso
    Filtrar por Columna 1 y Campo ${filtroPermiso}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del formulario
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Cancelar
    Sleep    1
    Validar actualizacion SIN aplicar en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Editar - Validar campos requeridos
    [Documentation]    Debera pintar en rojo los campos obligatorios.
    [Tags]    Editar - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Permiso
    Filtrar por Columna 1 y Campo ${filtroPermiso}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Dejar vacio los campos del formulario
    Sleep    1
    Presionar opcion Guardar
    Validar campos obligatorios
    [Teardown]    Close Browser
    
*** Keywords ***
Ingresar al detalle del registro No. ${arg1} en el grid
    Click Element    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[2]/div
    Wait Until Page Contains Element    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div/div[2]
    
Editar datos del formulario
    Validar registro unico    ${PermisoEditar}    ${queryPermiso}
    Sleep    1
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    
Dejar vacio los campos del formulario
    Clear Element Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input
    
Presionar opcion Guardar
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div/div[1]
    
Presionar opcion Cancelar
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div/div[2]
    
Obtener datos del formulario
    ${Descripcion}=    Get Value    xpath=//*[@id="txtDescripcion"]/div/div[1]/input
    Set Test Variable    ${Descripcion}
    
Validar actualizacion en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select Descripcion from Sismep.TSismepTiposPermiso where EditablePorUsuario = 0 and Descripcion = '${Descripcion}'
    Should Be Equal    ${queryResults[0][0]}    ${Descripcion}
    Disconnect From Database
    
Validar actualizacion SIN aplicar en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select Descripcion from Sismep.TSismepTiposPermiso where EditablePorUsuario = 0 and Descripcion = '${Descripcion}'
    Disconnect From Database
    
Validar campos obligatorios
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="txtDescripcion"]    textContent
    Should be equal    ${attrDescripcion}    Obligatorio
    
Validar etiquetas y tooltips
    ${ttGuardar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div/div[1]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div/div[2]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div    Editar Tipo de Permiso
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[1]/label    Descripción:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar