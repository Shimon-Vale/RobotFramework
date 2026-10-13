*** Settings ***
Resource    Recursos.MaestroDetalle.robot

*** Variables ***
${FiltroDescripcion}    Tipo

${countTodo}    select count(DescripcionLarga) from Sismep.TSismepMaestro
${selectTodo}    select DescripcionLarga from Sismep.TSismepMaestro order by IdExterno
${countDescripcion}    select count(DescripcionLarga) from Sismep.TSismepMaestro where DescripcionLarga like '%${FiltroDescripcion}%'
${selectDescripcion}    select DescripcionLarga from Sismep.TSismepMaestro where DescripcionLarga like '%${FiltroDescripcion}%' order by IdExterno
${xpathGrid}    //*[@id="dataGrid"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente estritas las etiquetas y tooltips.
    [Tags]    Grid - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Validar etiquetas
    [Teardown]    Close Browser
    
Filtro - Todo
    [Documentation]    Debera realizar el filtro por todos.
    [Tags]    Filtro - Todo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Sleep    1
    Validar resultado contra BD    ${countTodo}    ${selectTodo}
    [Teardown]    Close Browser
    
Filtro - Campo Descripcion
    [Documentation]    Debera mostrar los resultados que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro - Campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Validar resultado contra BD    ${countDescripcion}    ${selectDescripcion}
    [Teardown]    Close Browser
    
*** Keywords ***
Validar resultado contra BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${Descripcion}=    Get text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    @{queryResults}    Query    ${arg2}
    Should be equal    ${Descripcion}    ${queryResults[0][0]}
    Disconnect From Database
    
Validar etiquetas
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]/div    title
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Catálogo de Maestro Detalle
    Element Text Should Be    xpath=//*[@id="dx-col-8"]/div[2]    Descripción
    Element Text Should Be    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[1]/td[2]/div    Detalle
    Should be equal    ${ttVD}    Ver Detalle