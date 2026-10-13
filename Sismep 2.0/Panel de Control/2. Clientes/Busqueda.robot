*** Settings ***
Resource    Recursos.Clientes.robot

*** Variables ***
&{RegistroActivo}    Nombre=Astrum    Razon=R
&{RegistroInactivo}    Nombre=RFClientePrueba    Razon=RFazon Social

${countNombreA}     select count(Nombre) from Sismep.TSismepClientes where Nombre like '%${RegistroActivo}[Nombre]%' and Activo=1
${selectNombreA}     select top 1 Nombre, RazonSocial from Sismep.TSismepClientes where Nombre like '%${RegistroActivo}[Nombre]%' and Activo=1 order by Nombre
${countRazonA}    select count(RazonSocial) from Sismep.TSismepClientes where RazonSocial like '%${RegistroActivo}[Razon]%' and Activo=1
${selectRazonA}    select top 1 Nombre, RazonSocial from Sismep.TSismepClientes where RazonSocial like '%${RegistroActivo}[Razon]%' and Activo=1 order by Nombre
${countEstatusA}    select count(Activo) from Sismep.TSismepClientes where Activo=1
${selectEstatusA}    select top 1 Nombre, RazonSocial from Sismep.TSismepClientes where Activo=1 order by Nombre

${countNombreI}     select count(Nombre) from Sismep.TSismepClientes where Nombre like '%${RegistroInactivo}[Nombre]%' and Activo=0
${selectNombreI}     select top 1 Nombre, RazonSocial from Sismep.TSismepClientes where Nombre like '%${RegistroInactivo}[Nombre]%' and Activo=0 order by Nombre
${countRazonI}    select count(RazonSocial) from Sismep.TSismepClientes where RazonSocial like '%${RegistroInactivo}[Razon]%' and Activo=0
${selectRazonI}    select top 1 Nombre, RazonSocial from Sismep.TSismepClientes where RazonSocial like '%${RegistroInactivo}[Razon]%' and Activo=0 order by Nombre
${countEstatusI}    select count(Activo) from Sismep.TSismepClientes where Activo=0
${selectEstatusI}    select top 1 Nombre, RazonSocial from Sismep.TSismepClientes where Activo=0 order by Nombre

${countNombre}      select count(Nombre) from Sismep.TSismepClientes where Nombre like '%${RegistroActivo}[Nombre]%'
${selectNombre}     select top 1 Nombre, RazonSocial from Sismep.TSismepClientes where Nombre like '%${RegistroActivo}[Nombre]%' order by Nombre
${countRazon}     select count(RazonSocial) from Sismep.TSismepClientes where RazonSocial like '%${RegistroActivo}[Razon]%'
${selectRazon}    select top 1 Nombre, RazonSocial from Sismep.TSismepClientes where RazonSocial like '%${RegistroActivo}[Razon]%' order by Nombre
${countEstatus}    select count(Activo) from Sismep.TSismepClientes
${selectEstatus}    select top 1 Nombre, RazonSocial from Sismep.TSismepClientes order by Nombre

${xpathGrid}    //*[@id="grid"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Grid - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Validar etiquetas y tooltips
    [Teardown]    Close Browser

Filtro - Estatus Activo - Campo Nombre
    [Documentation]    Debera realizar el filtro correctamente por el campo Nombre.
    [Tags]    Filtro - Estatus Activo - Campo Nombre - T299
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Columna 1 y Campo ${RegistroActivo}[Nombre]
    Sleep    1
    Validar resultado en BD    ${countNombreA}    ${selectNombreA}
    [Teardown]    Close Browser

Filtro - Estatus Activo - Campo Razón Social
    [Documentation]    Debera realizar el filtro correctamente por el campo Razón Social.
    [Tags]    Filtro - Estatus Activo - Campo Razón Social
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Columna 2 y Campo ${RegistroActivo}[Razon]
    Sleep    1
    Validar resultado en BD    ${countRazonA}    ${selectRazonA}
    [Teardown]    Close Browser

Filtro - Estatus Activo
    [Documentation]    Debera realizar el filtro correctamente por el Estatus Activo.
    [Tags]   Filtro - Estatus Activo 
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Sleep    1
    Validar resultado en BD    ${countEstatusA}    ${selectEstatusA}
    [Teardown]    Close Browser

Filtro - Estatus Inactivo - Campo Nombre
    [Documentation]    Debera realizar el filtro correctamente por el campo Nombre y Estatus Inactivo.
    [Tags]    Filtro - Estatus Inactivo - Campo Nombre
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Estatus    Inactivo
    Filtrar por Columna 1 y Campo ${RegistroInactivo}[Nombre]
    Sleep    1
    Validar resultado en BD    ${countNombreI}    ${selectNombreI}
    [Teardown]    Close Browser

Filtro - Estatus Inactivo - Campo Razón Social
    [Documentation]    Debera realizar el filtro correctamente por el campo Razon Social y Estatus Inactivo.
    [Tags]    Filtro - Estatus Inactivo - Campo Razón Social
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Estatus    Inactivo
    Filtrar por Columna 2 y Campo ${RegistroInactivo}[Razon]
    Sleep    1
    Validar resultado en BD    ${countRazonI}    ${selectRazonI}
    [Teardown]    Close Browser

Filtro - Estatus Inactivo
    [Documentation]    Debera realizar el filtro correctamente por Estatus Inactivo.
    [Tags]    Filtro - Estatus Inactivo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Estatus    Inactivo
    Sleep    1
    Validar resultado en BD    ${countEstatusI}    ${selectEstatusI}
    [Teardown]    Close Browser

Filtro - Estatus Todos - Campo Nombre
    [Documentation]    Debera filtrar correctamente por el campo Nombre ya sea un registro Activo o Inactivo.
    [Tags]    Filtro - Estatus Todos - Campo Nombre
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Estatus    Todos
    Filtrar por Columna 1 y Campo ${RegistroActivo}[Nombre]
    Sleep    1
    Validar resultado en BD    ${countNombre}    ${selectNombre}
    [Teardown]    Close Browser

Filtro - Estatus Todos - Campo Razón Social
    [Documentation]    Debera filtrar correctamente por el campo Razon Social ya sea un registro Activo o Inactivo.
    [Tags]    Filtro - Estatus Todos - Campo Razón Social
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Estatus    Todos
    Filtrar por Columna 2 y Campo ${RegistroActivo}[Razon]
    Sleep    1
    Validar resultado en BD    ${countRazon}    ${selectRazon}
    [Teardown]    Close Browser

Filtro - Estatus Todos
    [Documentation]    Debera mostrar todos los registros.
    [Tags]    Filtro - Estatus Todos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Clientes
    Filtrar por Estatus    Todos
    Sleep    1
    Validar resultado en BD    ${countEstatus}    ${selectEstatus}
    [Teardown]    Close Browser

*** Keywords ***
Validar etiquetas y tooltips
    Wait Until Element Is Visible    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4
    ${ttNR}=    Get Element Attribute    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div    tooltip
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div    title
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Catálogo de Clientes
    Element Text Should Be    xpath=//*[@id="dx-col-16"]/div[2]    Nombre
    Element Text Should Be    xpath=//*[@id="dx-col-17"]/div[2]    Razón Social
    Element Text Should Be    xpath=//*[@id="dx-col-18"]/div[3]    Estatus
    Element Text Should Be    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[1]/td[4]/div    Detalle
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
#     ${rowText}=    Get Text    xpath://*[@id="grid"]/div/div[11]/div/div[1]
#     ${records}=    Execute JavaScript    actual='${rowText}'; split1 = actual.split('(')[1]; return split2 = split1.split(' ')[0];
#     ${rows}=    Convert To Integer    ${records}
#     Set Test Variable    ${rows}

Validar resultado en BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${Nombre}=    Get text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${RazonSocial}=    Get text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    @{queryResults}    Query    ${arg2}
    Should be equal    ${Nombre}    ${queryResults[0][0]}
    Should be equal    ${RazonSocial}    ${queryResults[0][1]}
    Disconnect From Database