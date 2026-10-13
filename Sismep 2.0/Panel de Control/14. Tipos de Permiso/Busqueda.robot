*** Settings ***
Resource    Recursos.TiposPermiso.robot

*** Variables ***
${Permiso}    Grupo

${countTodo}    select count(Descripcion) from Sismep.TSismepTiposPermiso where EditablePorUsuario = 0
${selectTodo}    select top 1 Descripcion from Sismep.TSismepTiposPermiso where EditablePorUsuario = 0
${countPermiso}    select count(Descripcion) from Sismep.TSismepTiposPermiso where EditablePorUsuario = 0 and Descripcion like '%${Permiso}%'
${selectPermiso}    select top 1 Descripcion from Sismep.TSismepTiposPermiso where EditablePorUsuario = 0 and Descripcion like '%${Permiso}%'

${xpathGrid}    //*[@id="grid"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Grid - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Permiso
    Validar etiquetas
    [Teardown]    Close Browser
    
Filtro - Total de registros en el grid
    [Documentation]    Debera mostrar el listado de tipos de permiso.
    [Tags]    Filtro - Total de registros en el grid
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Permiso
    Sleep    1
    Validar busqueda en BD    ${countTodo}    ${selectTodo}
    [Teardown]    Close Browser
    
Filtro - Por permiso
    [Documentation]    El sitio debera mostrar los registros que coincidan con lo ingresado.
    [Tags]    Filtro - Por permiso - T196
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Permiso
    Filtrar por Columna 1 y Campo ${Permiso}
    Sleep    1
    Validar busqueda en BD    ${countPermiso}    ${selectPermiso}
    [Teardown]    Close Browser
    
*** Keywords ***
Validar busqueda en BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${Permiso}=    Get Text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    @{queryResults}    Query    ${arg2}
    Should Be Equal    ${queryResults[0][0]}    ${Permiso}
    Disconnect From Database
    
Validar etiquetas
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]/div    title
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Catálogo de Tipos de Permiso
    Element Text Should Be    xpath=//*[@id="dx-col-2"]/div[2]    Permiso
    Element Text Should Be    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[1]/td[2]/div    Detalle
    Should be equal    ${ttVD}    Ver Detalle