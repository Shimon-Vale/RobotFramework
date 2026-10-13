*** Settings ***
Resource    Recursos.Especies.robot

*** Variables ***
&{RegistroActivo}    Descripcion=CAL    Tipo=CAM
&{RegistroInactivo}    Descripcion=JAI    Tipo=PUL

${countDescripcionA}    select count(stc.Descripcion) from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where stc.Descripcion like '%${RegistroActivo}[Descripcion]%' and stc.Activo = 1
${selectDescripcionA}    select top 1 stc.Descripcion, tc.Descripcion from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where stc.Descripcion like '%${RegistroActivo}[Descripcion]%' and stc.Activo = 1 order by stc.Descripcion
${countTipoA}     select count(tc.Descripcion) from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where tc.Descripcion like '%${RegistroActivo}[Tipo]%' and stc.Activo = 1
${selectTipoA}    select top 1 stc.Descripcion, tc.Descripcion from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where tc.Descripcion like '%${RegistroActivo}[Tipo]%' and stc.Activo = 1 order by stc.Descripcion
${countEstatusA}    select count(stc.Activo) from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where stc.Activo = 1
${selectEstatusA}    select top 1 stc.Descripcion, tc.Descripcion from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where stc.Activo = 1 order by stc.Descripcion

${countDescripcionI}    select count(stc.Descripcion) from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where stc.Descripcion like '%${RegistroInactivo}[Descripcion]%' and stc.Activo = 0
${selectDescripcionI}    select top 1 stc.Descripcion, tc.Descripcion from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where stc.Descripcion like '%${RegistroInactivo}[Descripcion]%' and stc.Activo = 0 order by stc.Descripcion
${countTipoI}     select count(tc.Descripcion) from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where tc.Descripcion like '%${RegistroInactivo}[Tipo]%' and stc.Activo = 0
${selectTipoI}    select top 1 stc.Descripcion, tc.Descripcion from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where tc.Descripcion like '%${RegistroInactivo}[Tipo]%' and stc.Activo = 0 order by stc.Descripcion
${countEstatusI}    select count(stc.Activo) from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where stc.Activo = 0
${selectEstatusI}    select top 1 stc.Descripcion, tc.Descripcion from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where stc.Activo = 0 order by stc.Descripcion

${countDescripcion}    select count(stc.Descripcion) from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where stc.Descripcion like '%${RegistroActivo}[Descripcion]%'
${selectDescripcion}    select top 1 stc.Descripcion, tc.Descripcion from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where stc.Descripcion like '%${RegistroActivo}[Descripcion]%' order by stc.Descripcion
${countTipo}     select count(tc.Descripcion) from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where tc.Descripcion like '%${RegistroActivo}[Tipo]%'
${selectTipo}    select top 1 stc.Descripcion, tc.Descripcion from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga where tc.Descripcion like '%${RegistroActivo}[Tipo]%' order by stc.Descripcion
${countEstatus}    select count(stc.Activo) from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga
${selectEstatus}    select top 1 stc.Descripcion, tc.Descripcion from Sismep.TSismepSubTiposCarga stc join Sismep.TSismepTiposCarga tc on stc.IdTipoCarga = tc.IdTipoCarga order by stc.Descripcion

${xpathGrid}    //*[@id="gridSubTipoCarga"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Grid - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Validar etiquetas y tooltips
    [Teardown]    Close Browser

Filtro - Estatus Activo - Campo Descripcion
    [Documentation]    Debera mostrar los resultados activos que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro - Estatus Activo - Campo Descripcion - T124
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Filtrar por Columna 1 y Campo ${RegistroActivo}[Descripcion]
    Sleep    1
    Validar resultado contra BD    ${countDescripcionA}    ${selectDescripcionA}
    [Teardown]    Close Browser

Filtro - Estatus Activo - Tipo de Carga
    [Documentation]    Debera mostrar los resultados activos que coincidan con lo ingresado en Tipo de Carga.
    [Tags]    Filtro - Estatus Activo - Tipo de Carga - T123
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Filtrar por Columna 2 y Campo ${RegistroActivo}[Tipo]
    Sleep    1
    Validar resultado contra BD    ${countTipoA}    ${selectTipoA}
    [Teardown]    Close Browser

Filtro - Estatus Activo
    [Documentation]    Debera mostrar todos los resultados Activos.
    [Tags]    Filtro - Estatus Activo - T122
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Sleep    1
    Validar resultado contra BD    ${countEstatusA}    ${selectEstatusA}
    [Teardown]    Close Browser

Filtro - Estatus Inactivo - Campo Descripcion
    [Documentation]    Debera mostrar los resultados Inactivos que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro - Estatus Inactivo - Campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Filtrar por Estatus    3
    Filtrar por Columna 1 y Campo ${RegistroInactivo}[Descripcion]
    Sleep    1
    Validar resultado contra BD    ${countDescripcionI}    ${selectDescripcionI}
    [Teardown]    Close Browser

Filtro - Estatus Inactivo - Tipo de Carga
    [Documentation]    Debera mostrar los resultados Inactivos que coincidan con lo ingresado en Tipo de Carga.
    [Tags]    Filtro - Estatus Inactivo - Tipo de Carga
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Filtrar por Estatus    3
    Filtrar por Columna 2 y Campo ${RegistroInactivo}[Tipo]
    Sleep    1
    Validar resultado contra BD    ${countTipoI}    ${selectTipoI}
    [Teardown]    Close Browser

Filtro - Estatus Inactivo
    [Documentation]    Debera mostrar todos los registros Inactivos.
    [Tags]    Filtro - Estatus Inactivo - T120
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Filtrar por Estatus    3
    Sleep    1
    Validar resultado contra BD    ${countEstatusI}    ${selectEstatusI}
    [Teardown]    Close Browser

Filtro - Estatus Todos - Campo Descripcion
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro - Estatus Todos - Campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Filtrar por Estatus    1
    Filtrar por Columna 1 y Campo ${RegistroActivo}[Descripcion]
    Sleep    1
    Validar resultado contra BD    ${countDescripcion}    ${selectDescripcion}
    [Teardown]    Close Browser

Filtro - Estatus Todos - Tipo de Carga
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en Tipo de Carga.
    [Tags]    Filtro - Estatus Todos - Tipo de Carga
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Filtrar por Estatus    1
    Filtrar por Columna 2 y Campo ${RegistroActivo}[Tipo]
    Sleep    1
    Validar resultado contra BD    ${countTipo}    ${selectTipo}
    [Teardown]    Close Browser

Filtro - Estatus Todos
    [Documentation]    Debera mostrar Todos los registros.
    [Tags]    Filtro - Estatus Todos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Especies
    Filtrar por Estatus    1
    Sleep    1
    Validar resultado contra BD    ${countEstatus}    ${selectEstatus}
    [Teardown]    Close Browser

*** Keywords ***
Validar etiquetas y tooltips
    ${ttNR}    Get Element Attribute    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div    tooltip
    ${ttVD}    Get Element Attribute    xpath=//*[@id="gridSubTipoCarga"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div    title
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Catálogo de Especies
    Element Text Should Be    xpath=//*[@id="dx-col-4"]/div[2]    Descripción
    Element Text Should Be    xpath=//*[@id="dx-col-5"]/div[2]    Tipo de Carga
    Element Text Should Be    xpath=//*[@id="dx-col-6"]/div[3]    Estatus
    Element Text Should Be    xpath=//*[@id="gridSubTipoCarga"]/div/div[5]/div/table/tbody/tr[1]/td[4]/div    Detalle
    Should be equal    ${ttNR}    Nuevo Registro
    Should be equal    ${ttVD}    Ver Detalle

# Obtener el numero de registros en el grid
#     ${visible}=    Run Keyword And Return Status    Element Should Be Visible    class=dx-pages
#     Run Keyword If    ${visible}==False    Filas por pagina
#     ...    ELSE    Total de registros en el grid

# Filas por pagina
#     ${rows}=    Execute Javascript    return document.getElementsByClassName("dx-row dx-data-row dx-column-lines").length;
#     Set Test Variable    ${rows}

# Total de registros en el grid
#     ${rowText}=    Get Text    xpath=//*[@id="gridSubTipoCarga"]/div/div[11]/div/div[1]
#     ${records}=    Execute JavaScript    actual='${rowText}'; split1 = actual.split('(')[1]; return split2 = split1.split(' ')[0];
#     ${rows}=    Convert To Integer    ${records}
#     Set Test Variable    ${rows}

Validar resultado contra BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${Descripcion}=    Get text    xpath=//*[@id="gridSubTipoCarga"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${Tipo}=    Get text    xpath=//*[@id="gridSubTipoCarga"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    @{queryResults}    Query    ${arg2}
    Should be equal    ${Descripcion}    ${queryResults[0][0]}
    Should be equal    ${Tipo}    ${queryResults[0][1]}
    Disconnect From Database