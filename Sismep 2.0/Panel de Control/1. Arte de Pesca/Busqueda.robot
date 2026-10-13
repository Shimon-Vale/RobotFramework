*** Settings ***
Resource    Recursos.ArtePesca.robot

*** Variables ***
${registroactivo}    OTRAS
${registroinactivo}    EQUIPOS
${countDescripcion}    select count(Descripcion) from [Sismep].[TSismepArtesCarga] where Activo= '1' and Descripcion like '%${registroactivo}%'
${selectDescripcion}    select Descripcion from [Sismep].[TSismepArtesCarga] where Activo = '1' and Descripcion like '%${registroactivo}%'
${countEstatus}    select count(Descripcion) from [Sismep].[TSismepArtesCarga] where Activo= '1'
${selectEstatus}    select top 1 Descripcion from [Sismep].[TSismepArtesCarga] where Activo = '1'
${countDescripcionInactivo}    select count(Descripcion) from [Sismep].[TSismepArtesCarga] where Activo= '0' and Descripcion like '%${registroinactivo}%'
${selectDescripcionInactivo}    select Descripcion from [Sismep].[TSismepArtesCarga] where Activo = '0' and Descripcion like '%${registroinactivo}%'
${countEstatusInactivo}    select count(Descripcion) from [Sismep].[TSismepArtesCarga] where Activo= '0'
${selectEstatusInactivo}    select top 1 Descripcion from [Sismep].[TSismepArtesCarga] where Activo = '0'
${countDescripcionTodos}    select count(Descripcion) from [Sismep].[TSismepArtesCarga] where Descripcion like '%${registroactivo}%'
${selectDescripcionTodos}    select Descripcion from [Sismep].[TSismepArtesCarga] where Descripcion like '%${registroactivo}%'
${countEstatusTodos}    select count(Descripcion) from [Sismep].[TSismepArtesCarga]
${selectEstatusTodos}    select top 1 Descripcion from [Sismep].[TSismepArtesCarga]
${xpathGrid}    //*[@id="gridArtesCarga"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Etiquetas y tooltips
    [Documentation]    Valida las etiquetas y tooltips en pantalla.
    [Tags]    Grid - Etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Validar etiquetas y tooltips
    [Teardown]    Close Browser

Filtro - Estatus Activo - Campo Descripcion
    [Documentation]    Debe de mostrar solo las artes de pesca activas que cumplan con el filtro "Descripcion" ingresado.
    [Tags]    Filtro - Estatus Activo - Campo Descripcion - T19
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Filtrar por Descripcion    ${registroactivo}
    Sleep    1
    Validar busqueda en base de datos    ${countDescripcion}    ${selectDescripcion}
    [Teardown]    Close Browser

Filtro - Estatus Activo
    [Documentation]    Debe de mostrar solo las artes de pesca activas.
    [Tags]    Filtro - Estatus Activo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Validar busqueda en base de datos    ${countEstatus}    ${selectEstatus}
    [Teardown]    Close Browser

Filtro - Estatus Inactivo - Campo Descripcion
    [Documentation]    Debe de mostrar solo las antenas artes de pesca que cumplan con el filtro "Descripcion" ingresado.
    [Tags]    Filtro - Estatus Inactivo - Campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Filtrar por estatus    3
    Filtrar por Descripcion    ${registroinactivo}
    Sleep    1
    Validar busqueda en base de datos    ${countDescripcionInactivo}    ${selectDescripcionInactivo}
    [Teardown]    Close Browser

Filtro - Estatus Inactivo
    [Documentation]    Debe de mostrar solo las artes de pesca Inactivas.
    [Tags]    Filtro - Estatus Inactivo - T20
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Filtrar por estatus    3
    Sleep    1
    Validar busqueda en base de datos    ${countEstatusInactivo}    ${selectEstatusInactivo}
    [Teardown]    Close Browser

Filtro - Estatus Todos - Campo Descripcion
    [Documentation]    Debe de mostrar todas las artes de pesca que cumplan con el filtro "Descripcion" ingresado.
    [Tags]    Filtro - Estatus Todos - Campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Filtrar por estatus    1
    Filtrar por Descripcion    ${registroactivo}
    Sleep    1
    Validar busqueda en base de datos    ${countDescripcionTodos}    ${selectDescripcionTodos}
    [Teardown]    Close Browser

Filtro - Todos Estatus
    [Documentation]    Debe de mostrar solo las artes de pesca Inactivas.
    [Tags]    Filtro - Todos Estatus
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Filtrar por estatus    1
    Sleep    1
    Validar busqueda en base de datos    ${countEstatusTodos}    ${selectEstatusTodos}
    [Teardown]    Close Browser
    
*** Keywords ***
Validar etiquetas y tooltips
    Wait Until Element is Visible    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4
    ${ttNR}=    Get Element Attribute    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div    title
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="gridArtesCarga"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div    title
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Catálogo de Artes de Pesca
    Element Text Should Be    xpath=//*[@id="dx-col-3"]/div[2]    Descripción
    Element Text Should Be    xpath=//*[@id="dx-col-4"]/div[3]    Estatus
    Element Text Should Be    xpath=//*[@id="gridArtesCarga"]/div/div[5]/div/table/tbody/tr[1]/td[3]/div    Detalle
    Should be equal    ${ttNR}    Nuevo Registro
    Should be equal    ${ttVD}    Ver Detalle

Validar busqueda en base de datos
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should Be Equal    ${queryRows[0][0]}    ${noReg}
    @{queryResults}    Query    ${arg2}
    ${Descripcion}=    Get Text    xpath=//*[@id="gridArtesCarga"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    Should Be Equal    ${queryResults[0][0]}    ${Descripcion}
    Disconnect From Database