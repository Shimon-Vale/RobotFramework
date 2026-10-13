*** Settings ***
Resource    Recursos.TiposZona.robot

*** Variables ***
${RegistroA}    TODAS
${RegistroI}    Zona

${countZonaA}    select count(Descripcion) from Sismep.TSismepTiposZonas where Descripcion='${RegistroA}' and Activo=1
${selectZonaA}    select top 1 Descripcion, ZonaInformativa, Activo from Sismep.TSismepTiposZonas where Descripcion='${RegistroA}' and Activo=1
${countZInformativaSIA}    select count(Descripcion) from Sismep.TSismepTiposZonas where ZonaInformativa=1 and Activo=1
${selectZInformativaSIA}    select top 1 Descripcion, ZonaInformativa, Activo from Sismep.TSismepTiposZonas where ZonaInformativa=1 and Activo=1
${countZInformativaNOA}    select count(Descripcion) from Sismep.TSismepTiposZonas where ZonaInformativa=0 and Activo=1
${selectZInformativaNOA}    select top 1 Descripcion, ZonaInformativa, Activo from Sismep.TSismepTiposZonas where ZonaInformativa=0 and Activo=1
${countActivo}    select count(Descripcion) from Sismep.TSismepTiposZonas where Activo=1
${selectActivo}    select top 1 Descripcion, ZonaInformativa, Activo from Sismep.TSismepTiposZonas where Activo=1

${countZonaI}    select count(Descripcion) from Sismep.TSismepTiposZonas where Descripcion like '%${RegistroI}%' and Activo=0
${selectZonaI}    select top 1 Descripcion, ZonaInformativa, Activo from Sismep.TSismepTiposZonas where Descripcion like '%${RegistroI}%' and Activo=0
${countZInformativaSII}    select count(Descripcion) from Sismep.TSismepTiposZonas where ZonaInformativa=1 and Activo=0
${selectZInformativaSII}    select top 1 Descripcion, ZonaInformativa, Activo from Sismep.TSismepTiposZonas where ZonaInformativa=1 and Activo=0
${countZInformativaNOI}    select count(Descripcion) from Sismep.TSismepTiposZonas where ZonaInformativa=0 and Activo=0
${selectZInformativaNOI}    select top 1 Descripcion, ZonaInformativa, Activo from Sismep.TSismepTiposZonas where ZonaInformativa=0 and Activo=0
${countInactivo}    select count(Descripcion) from Sismep.TSismepTiposZonas where Activo=0
${selectInactivo}    select top 1 Descripcion, ZonaInformativa, Activo from Sismep.TSismepTiposZonas where Activo=0

${countZona}    select count(Descripcion) from Sismep.TSismepTiposZonas where Descripcion='${RegistroA}'
${selectZona}    select top 1 Descripcion, ZonaInformativa, Activo from Sismep.TSismepTiposZonas where Descripcion='${RegistroA}'
${countZInformativaSI}    select count(Descripcion) from Sismep.TSismepTiposZonas where ZonaInformativa=1
${selectZInformativaSI}    select top 1 Descripcion, ZonaInformativa, Activo from Sismep.TSismepTiposZonas where ZonaInformativa=1
${countZInformativaNO}    select count(Descripcion) from Sismep.TSismepTiposZonas where ZonaInformativa=0
${selectZInformativaNO}    select top 1 Descripcion, ZonaInformativa, Activo from Sismep.TSismepTiposZonas where ZonaInformativa=0
${count}    select count(Descripcion) from Sismep.TSismepTiposZonas
${select}    select top 1 Descripcion, ZonaInformativa, Activo from Sismep.TSismepTiposZonas

${xpathGrid}    //*[@id="grid"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Grid - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Validar etiquetas y tooltips
    [Teardown]    Close Browser

Filtro - Estatus Activo - Zona
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Zona.
    [Tags]    Filtro - Estatus Activo - Zona - T172
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Filtrar por Zona    ${RegistroA}
    Sleep    1
    Validar resultado en BD    ${countZonaA}    ${selectZonaA}
    [Teardown]    Close Browser

Filtro - Estatus Activo - Zona Informativa - Si
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado
        ...    en Zona Informativa SI.
    [Tags]    Filtro - Estatus Activo - Zona Informativa - Si - T174
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Filtrar por Zona Informativa    2
    Sleep    1
    Validar resultado en BD    ${countZInformativaSIA}    ${selectZInformativaSIA}
    [Teardown]    Close Browser

Filtro - Estatus Activo - Zona Informativa - No
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado
        ...    en Zona Informativa NO.
    [Tags]    Filtro - Estatus Activo - Zona Informativa - No - T175
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Filtrar por Zona Informativa    3
    Sleep    1
    Validar resultado en BD    ${countZInformativaNOA}    ${selectZInformativaNOA}
    [Teardown]    Close Browser

Filtro - Estatus Activo
    [Documentation]    Debera mostrar Todos los registros Activos.
    [Tags]    Filtro - Estatus Activo - T177
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Sleep    1
    Validar resultado en BD    ${countActivo}    ${selectActivo}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Zona
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado en Zona.
    [Tags]    Filtro - Estatus Inactivo - Zona
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Sleep    1
    Filtrar por Estatus    3
    Filtrar por Zona    ${RegistroI}
    Sleep    1
    Validar resultado en BD    ${countZonaI}    ${selectZonaI}
    [Teardown]    Close Browser

Filtro - Estatus Inactivo - Zona Informativa - Si
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado
        ...    en Zona Informativa SI.
    [Tags]    Filtro - Estatus Inactivo - Zona Informativa - Si
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Sleep    1
    Filtrar por Estatus    3
    Filtrar por Zona Informativa    2
    Sleep    1
    Validar resultado en BD    ${countZInformativaSII}    ${selectZInformativaSII}
    [Teardown]    Close Browser

Filtro - Estatus Inactivo - Zona Informativa - No
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado
        ...    en Zona Informativa NO.
    [Tags]    Filtro - Estatus Inactivo - Zona Informativa - No
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Sleep    1
    Filtrar por Estatus    3
    Filtrar por Zona Informativa    3
    Sleep    1
    Validar resultado en BD    ${countZInformativaNOI}    ${selectZInformativaNOI}
    [Teardown]    Close Browser

Filtro - Estatus Inactivo
    [Documentation]    Debera mostrar Todos los registros Inactivos.
    [Tags]    Filtro - Estatus Inactivo - T178
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Sleep    1
    Filtrar por Estatus    3
    Sleep    1
    Validar resultado en BD    ${countInactivo}    ${selectInactivo}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Zona
    [Documentation]    Debera mostrar Todos los registros que coincidan con lo ingresado en Zona.
    [Tags]    Filtro - Estatus Todos - Zona - T179
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Sleep    1
    Filtrar por Estatus    1
    Filtrar por Zona    ${RegistroA}
    Sleep    1
    Validar resultado en BD    ${countZona}    ${selectZona}
    [Teardown]    Close Browser

Filtro - Estatus Todos - Zona Informativa - Si
    [Documentation]    Debera mostrar Todos los registros que coincidan con lo ingresado en 
        ...    Zona Informativa SI.
    [Tags]    Filtro - Estatus Todos - Zona Informativa - Si
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Sleep    1
    Filtrar por Estatus    1
    Filtrar por Zona Informativa    2
    Sleep    1
    Validar resultado en BD    ${countZInformativaSI}    ${selectZInformativaSI}
    [Teardown]    Close Browser

Filtro - Estatus Todos - Zona Informativa - No
    [Documentation]    Debera mostrar Todos los registros que coincidan con lo ingresado en 
        ...    Zona Informativa NO.
    [Tags]    Filtro - Estatus Todos - Zona Informativa - No
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Sleep    1
    Filtrar por Estatus    1
    Filtrar por Zona Informativa    3
    Sleep    1
    Validar resultado en BD    ${countZInformativaNO}    ${selectZInformativaNO}
    [Teardown]    Close Browser

Filtro - Estatus Todos
    [Documentation]    Debera mostrar Todos los registros.
    [Tags]    Filtro - Estatus Todos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Sleep    1
    Filtrar por Estatus    1
    Sleep    1
    Validar resultado en BD    ${count}    ${select}
    [Teardown]    Close Browser
    
*** Keywords ***
Validar etiquetas y tooltips
    ${ttNR}=    Get Element Attribute    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div    tooltip
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div    title
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Catálogo de Tipos de Zona
    Element Text Should Be    xpath=//*[@id="dx-col-4"]/div[2]    Zona
    Element Text Should Be    xpath=//*[@id="dx-col-5"]/div[3]    Zona Informativa
    Element Text Should Be    xpath=//*[@id="dx-col-6"]/div[3]    Estatus
    Element Text Should Be    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[1]/td[4]/div    Detalle
    Should be equal    ${ttNR}    Nuevo Registro
    Should be equal    ${ttVD}    Ver Detalle

Filtrar por Zona Informativa
    [Arguments]    ${opc}
    Wait Until Element Is Visible    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[2]/div/div/div/div[1]/div/div[2]/div[2]/div/div
    Click Element    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[2]/div/div/div/div[1]/div/div[2]/div[2]/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${opc}]/div
    
Validar resultado en BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${Zona}=    Get Text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${iconInformativa}=    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]/span/i    class
    ${iconEstatus}=    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/span/i    class
    ${Informativa}=    Execute Javascript    if('${iconInformativa}'=='fas fa-check-circle') {return true} else {return false};
    ${Estatus}=    Execute Javascript    if('${iconEstatus}'=='fas fa-check-circle') {return true} else {return false};
    @{queryResults}    Query    ${arg2}
    Should Be Equal    ${queryResults[0][0]}    ${Zona}
    Should Be Equal    ${queryResults[0][1]}    ${Informativa}
    Should Be Equal    ${queryResults[0][2]}    ${Estatus}
    Disconnect From Database