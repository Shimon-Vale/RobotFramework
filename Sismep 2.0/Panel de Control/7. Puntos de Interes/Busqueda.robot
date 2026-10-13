*** Settings ***
Resource    ../../Recursos.Generales.robot
Resource    Recursos.PI.robot

*** Variables ***
&{RegistroActivo}    Descripcion=Bahia    Latitud=26    Longitud=-10
&{RegistroInactivo}    Descripcion=Isla    Latitud=27    Longitud=-11

${countDescripcionA}    select count(Descripcion) from Sismep.TSismepPuntosInteres where Descripcion like '%${RegistroActivo}[Descripcion]%' and Activo = 1
${selectDescripcionA}    select top 1 Descripcion, Latitud, Longitud, Activo from Sismep.TSismepPuntosInteres where Descripcion like '%${RegistroActivo}[Descripcion]%' and Activo = 1 order by Descripcion
${countLatitudA}    select count(Latitud) from Sismep.TSismepPuntosInteres where Latitud like '${RegistroActivo}[Latitud]%' and Activo = 1
${selectLatitudA}    select top 1 Descripcion, Latitud, Longitud, Activo from Sismep.TSismepPuntosInteres where Latitud like '${RegistroActivo}[Latitud]%' and Activo = 1 order by Descripcion
${countLongitudA}    select count(Longitud) from Sismep.TSismepPuntosInteres where Longitud like '${RegistroActivo}[Longitud]%' and Activo = 1
${selectLongitudA}    select top 1 Descripcion, Latitud, Longitud, Activo from Sismep.TSismepPuntosInteres where Longitud like '${RegistroActivo}[Longitud]%' and Activo = 1 order by Descripcion
${countEstatusA}    select count(Activo) from Sismep.TSismepPuntosInteres where Activo = 1
${selectEstatusA}    select top 1 Descripcion, Latitud, Longitud, Activo from Sismep.TSismepPuntosInteres where Activo = 1 order by Descripcion

${countDescripcionI}    select count(Descripcion) from Sismep.TSismepPuntosInteres where Descripcion like '%${RegistroInactivo}[Descripcion]%' and Activo = 0
${selectDescripcionI}    select top 1 Descripcion, Latitud, Longitud, Activo from Sismep.TSismepPuntosInteres where Descripcion like '%${RegistroInactivo}[Descripcion]%' and Activo = 0 order by Descripcion
${countLatitudI}    select count(Latitud) from Sismep.TSismepPuntosInteres where Latitud like '${RegistroInactivo}[Latitud]%' and Activo = 0
${selectLatitudI}    select top 1 Descripcion, Latitud, Longitud, Activo from Sismep.TSismepPuntosInteres where Latitud like '${RegistroInactivo}[Latitud]%' and Activo = 0 order by Descripcion
${countLongitudI}    select count(Longitud) from Sismep.TSismepPuntosInteres where Longitud like '${RegistroInactivo}[Longitud]%' and Activo = 0
${selectLongitudI}    select top 1 Descripcion, Latitud, Longitud, Activo from Sismep.TSismepPuntosInteres where Longitud like '${RegistroInactivo}[Longitud]%' and Activo = 0 order by Descripcion
${countEstatusI}    select count(Activo) from Sismep.TSismepPuntosInteres where Activo = 0
${selectEstatusI}    select top 1 Descripcion, Latitud, Longitud, Activo from Sismep.TSismepPuntosInteres where Activo = 0 order by Descripcion

${countDescripcion}    select count(Descripcion) from Sismep.TSismepPuntosInteres where Descripcion like '%${RegistroActivo}[Descripcion]%'
${selectDescripcion}    select top 1 Descripcion, Latitud, Longitud, Activo from Sismep.TSismepPuntosInteres where Descripcion like '%${RegistroActivo}[Descripcion]%' order by Descripcion
${countLatitud}    select count(Latitud) from Sismep.TSismepPuntosInteres where Latitud like '${RegistroActivo}[Latitud]%'
${selectLatitud}    select top 1 Descripcion, Latitud, Longitud, Activo from Sismep.TSismepPuntosInteres where Latitud like '${RegistroActivo}[Latitud]%' order by Descripcion
${countLongitud}    select count(Longitud) from Sismep.TSismepPuntosInteres where Longitud like '${RegistroActivo}[Longitud]%'
${selectLongitud}    select top 1 Descripcion, Latitud, Longitud, Activo from Sismep.TSismepPuntosInteres where Longitud like '${RegistroActivo}[Longitud]%' order by Descripcion
${countEstatus}    select count(Activo) from Sismep.TSismepPuntosInteres
${selectEstatus}    select top 1 Descripcion, Latitud, Longitud, Activo from Sismep.TSismepPuntosInteres order by Descripcion

${xpathGrid}    //*[@id="grid"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Validar etiquetas
    [Documentation]    Debera mostrar correctamente escritas las etiquetas.
    [Tags]    Grid - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Descripcion
    [Documentation]    Debera mostrar los resultados Activos que coincida con lo ingresado en el campo Descripcion.
    [Tags]    Filtro - Estatus Activo - Campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Filtrar por Columna 1 y Campo ${RegistroActivo}[Descripcion]
    Sleep    1
    Validar resultado contra BD    ${countDescripcionA}    ${selectDescripcionA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Latitud
    [Documentation]    Debera mostrar los resultados Activos que coincida con lo ingresado en el campo Latitud.
    [Tags]    Filtro - Estatus Activo - Campo Latitud
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Filtrar por Columna 2 y Campo ${RegistroActivo}[Latitud]
    Sleep    1
    Validar resultado contra BD    ${countLatitudA}    ${selectLatitudA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Longitud
    [Documentation]    Debera mostrar los resultados Activos que coincida con lo ingresado en el campo Longitud.
    [Tags]    Filtro - Estatus Activo - Campo Longitud
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Filtrar por Columna 3 y Campo ${RegistroActivo}[Longitud]
    Sleep    1
    Validar resultado contra BD    ${countLongitudA}    ${selectLongitudA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo
    [Documentation]    Debera mostrar los registros Activos.
    [Tags]    Filtro - Estatus Activo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Sleep    1
    Validar resultado contra BD    ${countEstatusA}    ${selectEstatusA}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Descripcion
    [Documentation]    Debera mostrar los registros inactivos que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro - Estatus Inactivo - Campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Sleep    1
    Filtrar por Estatus    ${Inactivo}
    Filtrar por Columna 1 y Campo ${RegistroInactivo}[Descripcion]
    Sleep    1
    Validar resultado contra BD    ${countDescripcionI}    ${selectDescripcionI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Latitud
    [Documentation]    Debera mostrar los registros inactivos que coincidan con lo ingresado en Latitud.
    [Tags]    Filtro - Estatus Inactivo - Campo Latitud
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Sleep    1
    Filtrar por Estatus    ${Inactivo}
    Filtrar por Columna 2 y Campo ${RegistroInactivo}[Latitud]
    Sleep    1
    Validar resultado contra BD    ${countLatitudI}    ${selectLatitudI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Longitud
    [Documentation]    Debera mostrar los registros inactivos que coincidan con lo ingresado en Longitud.
    [Tags]    Filtro - Estatus Inactivo - Campo Longitud
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Sleep    1
    Filtrar por Estatus    ${Inactivo}
    Filtrar por Columna 3 y Campo ${RegistroInactivo}[Longitud]
    Sleep    1
    Validar resultado contra BD    ${countLongitudI}    ${selectLongitudI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo
    [Documentation]    Debera mostrar los registros Inactivo.
    [Tags]    Filtro - Estatus Inactivo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Sleep    1
    Filtrar por Estatus    ${Inactivo}
    Sleep    1
    Validar resultado contra BD    ${countEstatusI}    ${selectEstatusI}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Descripcion
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro - Estatus Todos - Campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Sleep    1
    Filtrar por Estatus    ${Todos}
    Filtrar por Columna 1 y Campo ${RegistroActivo}[Descripcion]
    Sleep    1
    Validar resultado contra BD    ${countDescripcion}    ${selectDescripcion}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Latitud
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en Latitud.
    [Tags]    Filtro - Estatus Todos - Campo Latitud
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Sleep    1
    Filtrar por Estatus    ${Todos}
    Filtrar por Columna 2 y Campo ${RegistroActivo}[Latitud]
    Sleep    1
    Validar resultado contra BD    ${countLatitud}    ${selectLatitud}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Longitud
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en Longitud.
    [Tags]    Filtro - Estatus Todos - Campo Longitud
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Sleep    1
    Filtrar por Estatus    ${Todos}
    Filtrar por Columna 3 y Campo ${RegistroActivo}[Longitud]
    Sleep    1
    Validar resultado contra BD    ${countLongitud}    ${selectLongitud}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos
    [Documentation]    Debera mostrar todos los registros.
    [Tags]    Filtro - Estatus Todos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Puntos de Interes
    Sleep    1
    Filtrar por Estatus    ${Todos}
    Sleep    1
    Validar resultado contra BD    ${countEstatus}    ${selectEstatus}
    [Teardown]    Close Browser
    
*** Keywords ***
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
    
Validar resultado contra BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${Descripcion}=    Get text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${Lat}=    Get text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    ${Latitud}=    Execute Javascript    return parseFloat(${Lat});
    ${Lon}=    Get text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]
    ${Longitud}=    Execute Javascript    return parseFloat(${Lon});
    @{queryResults}    Query    ${arg2}
    Should be equal    ${Descripcion}    ${queryResults[0][0]}
    Should be equal    ${Latitud}    ${queryResults[0][1]}
    Should be equal    ${Longitud}    ${queryResults[0][2]}
    Disconnect From Database
    
Validar etiquetas
    ${ttNR}=    Get Element Attribute    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div    title
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[5]/div    title
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Catálogo de Puntos de Interés
    Element Text Should Be    xpath=//*[@id="dx-col-9"]/div[2]    Descripción
    Element Text Should Be    xpath=//*[@id="dx-col-10"]/div[2]    Latitud
    Element Text Should Be    xpath=//*[@id="dx-col-11"]/div[2]    Longitud
    Element Text Should Be    xpath=//*[@id="dx-col-12"]/div[3]    Estatus
    Element Text Should Be    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[1]/td[5]/div    Detalle
    #${Titulo}=    Get text    xpath://*[@id="divContainer"]/div[1]/div[1]/div[1]/h4
    #${Descripcion}=    Get text    xpath=//*[@id="dx-col-11"]/div[2]
    #${Lat}=    Get text    xpath://*[@id="dx-col-12"]/div[2]
    #${Lon}=    Get text    xpath://*[@id="dx-col-13"]/div[2]
    #${Estatus}=    Get text    xpath://*[@id="dx-col-14"]/div[3]
    #${Detalle}=    Get text    xpath://*[@id="dx-col-15"]/div
    #${ttNR}=    Execute JavaScript    return document.getElementsByClassName("sismep-button btn-padding dx-button dx-button-default dx-button-mode-contained dx-widget dx-button-has-icon")[0].getAttribute("title")
    #${ttVD}=    Execute JavaScript    return document.getElementsByClassName("dx-button dx-button-Normal dx-button-mode-contained dx-widget dx-button-has-icon")[1].getAttribute("title")
    #Should Be Equal As Strings    ${Titulo}    Catálogo de Puntos de Interés
    #Should Be Equal As Strings    ${Descripcion}    Descripción
    #Should Be Equal As Strings    ${Lat}    Latitud
    #Should Be Equal As Strings    ${Lon}    Longitud
    #Should Be Equal As Strings    ${Estatus}    Estatus
    #Should Be Equal As Strings    ${Detalle}    Detalle
    Should be equal    ${ttNR}    Nuevo Registro
    Should be equal    ${ttVD}    Ver Detalle