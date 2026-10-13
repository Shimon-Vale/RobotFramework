*** Settings ***
Resource    Recursos.ConfiguracionSistema.robot

*** Variables ***
&{Filtro}    Descripcion=Uni    Entero=1    Flotante=1    FechaHora=01/01/2016    Caracteres=m    Latitud=8    Longitud=-1

${countDescripcion}    select count(Descripcion) from Sismep.TSismepConfiguracion where Descripcion like '%${Filtro}[Descripcion]%'
${selectDescripcion}    select top 1 Descripcion, ValorInt, Valorfloat, ValorDateTime, ValorString, Latitud, Longitud from Sismep.TSismepConfiguracion where Descripcion like '%${Filtro}[Descripcion]%' order by Configuracion
${countEntero}    select count(ValorInt) from Sismep.TSismepConfiguracion where ValorInt like '%${Filtro}[Entero]%'
${selectEntero}    select top 1 Descripcion, ValorInt, Valorfloat, ValorDateTime, ValorString, Latitud, Longitud from Sismep.TSismepConfiguracion where ValorInt like '%${Filtro}[Entero]%' order by Configuracion
${countFlotante}    select count(Valorfloat) from Sismep.TSismepConfiguracion where Valorfloat like '%${Filtro}[Flotante]%'
${selectFlotante}    select top 1 Descripcion, ValorInt, Valorfloat, ValorDateTime, ValorString, Latitud, Longitud from Sismep.TSismepConfiguracion where Valorfloat like '%${Filtro}[Flotante]%' order by Configuracion
${countFechaHora}    select count(ValorDateTime) from Sismep.TSismepConfiguracion where ValorDateTime = '${Filtro}[FechaHora]'
${selectFechaHora}    select top 1 Descripcion, ValorInt, Valorfloat, ValorDateTime, ValorString, Latitud, Longitud from Sismep.TSismepConfiguracion where ValorDateTime = '${Filtro}[FechaHora]' order by Configuracion
${countCaracteres}    select count(ValorString) from Sismep.TSismepConfiguracion where ValorString like '%${Filtro}[Caracteres]%'
${selectCaracteres}    select top 1 Descripcion, ValorInt, Valorfloat, ValorDateTime, ValorString, Latitud, Longitud from Sismep.TSismepConfiguracion where ValorString like '%${Filtro}[Caracteres]%' order by Configuracion
${countLatitud}    select count(Latitud) from Sismep.TSismepConfiguracion where Latitud like '%${Filtro}[Latitud]%'
${selectLatitud}    select top 1 Descripcion, ValorInt, Valorfloat, ValorDateTime, ValorString, Latitud, Longitud from Sismep.TSismepConfiguracion where Latitud like '%${Filtro}[Latitud]%' order by Configuracion
${countLongitud}    select count(Longitud) from Sismep.TSismepConfiguracion where Longitud like '%${Filtro}[Longitud]%'
${selectLongitud}    select top 1 Descripcion, ValorInt, Valorfloat, ValorDateTime, ValorString, Latitud, Longitud from Sismep.TSismepConfiguracion where Longitud like '%${Filtro}[Longitud]%' order by Configuracion
${xpathGrid}    //*[@id="grid"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Validar etiquetas y tooltips
    [Documentation]    Debe de abrir una ventana con el titulo Catálogo de Tipos de Permiso.
    [Tags]    Grid - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser
    
Filtro - Descripcion
    [Documentation]    El sitio debera mostrar los registros que coincidan con lo ingresado.
    [Tags]    Filtro - Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Sleep    1
    Validar busqueda en BD    ${countDescripcion}    ${selectDescripcion}
    [Teardown]    Close Browser
    
Filtro - Entero
    [Documentation]    El sitio debera mostrar los registros que coincidan con lo ingresado.
    [Tags]    Filtro - Entero
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Filtrar por Columna 2 y Campo ${Filtro}[Entero]
    Sleep    1
    Validar busqueda en BD    ${countEntero}    ${selectEntero}
    [Teardown]    Close Browser
    
Filtro - Flotante
    [Documentation]    El sitio debera mostrar los registros que coincidan con lo ingresado.
    [Tags]    Filtro - Flotante
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Filtrar por Columna 3 y Campo ${Filtro}[Flotante]
    Sleep    1
    Validar busqueda en BD    ${countFlotante}    ${selectFlotante}
    [Teardown]    Close Browser
    
Filtro - Fecha y Hora
    [Documentation]    El sitio debera mostrar los registros que coincidan con lo ingresado.
    [Tags]    Filtro - Fecha y Hora
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Filtrar por fecha y hora    ${Filtro}[FechaHora]
    Sleep    1
    Validar busqueda en BD    ${countFechaHora}    ${selectFechaHora}
    [Teardown]    Close Browser
    
Filtro - Caracteres
    [Documentation]    El sitio debera mostrar los registros que coincidan con lo ingresado.
    [Tags]    Filtro - Caracteres
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Filtrar por Columna 5 y Campo ${Filtro}[Caracteres]
    Sleep    1
    Validar busqueda en BD    ${countCaracteres}    ${selectCaracteres}
    [Teardown]    Close Browser
    
Filtro - Latitud
    [Documentation]    El sitio debera mostrar los registros que coincidan con lo ingresado.
    [Tags]    Filtro - Latitud
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Filtrar por Columna 6 y Campo ${Filtro}[Latitud]
    Sleep    1
    Validar busqueda en BD    ${countLatitud}    ${selectLatitud}
    [Teardown]    Close Browser
    
Filtro - Longitud
    [Documentation]    El sitio debera mostrar los registros que coincidan con lo ingresado.
    [Tags]    Filtro - Longitud
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Filtrar por Columna 7 y Campo ${Filtro}[Longitud]
    Sleep    1
    Validar busqueda en BD    ${countLongitud}    ${selectLongitud}
    [Teardown]    Close Browser
    
*** Keywords ***
Validar busqueda en BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${Descripcion}=    Get Text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${Eto}=    Get Text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    ${Entero}=    Convert to Integer    ${Eto}
    ${Fte}=    Get Text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]
    ${Flotante}=    Convert to Number    ${Fte}
    ${fh}=    Get Text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]
    #${FechaHora}=    Execute JavaScript    fechahora = new Date('${fh}'); return fechahora.toISOString().replace('T',' ').replace('Z','');
    #${FechaHora}=    Execute JavaScript    fechahora = new Date('${fh}');  y = fechahora.getFullYear(); m = fechahora.getMonth() + 1; d = fechahora.getDate(); h = fechahora.getHours(); mn = fechahora.getMinutes(); return fechastring = y + '-' + (m <= 9 ? '0' + m : m) + '-' + (d <= 9 ? '0' + d : d) + ' ' + (h <= 9 ? '0' + h : h) + ':' + (mn <= 9 ? '0' + mn : mn)
    ${FechaHora}=    Execute JavaScript    cadena = '${fh}'; yy = cadena.substr(6,4); mm = cadena.substr(3,2); dd = cadena.substr(0,2); hhmm = cadena.substr(11); return fechastring = yy + '-' + mm + '-' + dd + ' ' + hhmm;
    ${Ctrs}=    Get Text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[5]
    ${Caracteres}=    Execute JavaScript    if('${Ctrs}'==' '){return ''}else{return'${Ctrs}'};
    ${Lat}=    Get Text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[6]
    ${Latitud}=    Convert to Number    ${Lat}
    ${Lon}=    Get Text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[7]
    ${Longitud}=    Convert to Number    ${Lon}
    @{queryResults}    Query    ${arg2}
    #${FechaHoraBD}=    Execute JavaScript    fechahorabd = new Date('${queryResults[0][3]}'); return fechahorabd.toISOString().replace('T',' ').replace('Z','');
    ${FechaHoraBD}=    Execute JavaScript    fechahorabd = new Date('${queryResults[0][3]}');  y = fechahorabd.getFullYear(); m = fechahorabd.getMonth() + 1; d = fechahorabd.getDate(); h = fechahorabd.getHours(); mn = fechahorabd.getMinutes(); return fechastring = y + '-' + (m <= 9 ? '0' + m : m) + '-' + (d <= 9 ? '0' + d : d) + ' ' + (h <= 9 ? '0' + h : h) + ':' + (mn <= 9 ? '0' + mn : mn)
    Should Be Equal    ${queryResults[0][0]}    ${Descripcion}
    Should Be Equal    ${queryResults[0][1]}    ${Entero}
    Should Be Equal    ${queryResults[0][2]}    ${Flotante}
    Should Be Equal     ${FechaHoraBD}    ${FechaHora}
    Should Be Equal    ${queryResults[0][4]}    ${Caracteres}
    Should Be Equal    ${queryResults[0][5]}    ${Latitud}
    Should Be Equal    ${queryResults[0][6]}    ${Longitud}
    Disconnect From Database
    
Validar etiquetas
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Cat\u00E1logo de Configuraci\u00F3n
    Element Text Should Be    xpath=//*[@id="dx-col-43"]/div[2]    Descripci\u00F3n
    Element Text Should Be    xpath=//*[@id="dx-col-44"]/div[2]    Entero
    Element Text Should Be    xpath=//*[@id="dx-col-45"]/div[2]    Flotante
    Element Text Should Be    xpath=//*[@id="dx-col-46"]/div[2]    Fecha y Hora
    Element Text Should Be    xpath=//*[@id="dx-col-47"]/div[2]    Caracteres
    Element Text Should Be    xpath=//*[@id="dx-col-48"]/div[2]    Latitud
    Element Text Should Be    xpath=//*[@id="dx-col-49"]/div[2]    Longitud
    Element Text Should Be    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[1]/td[8]/div    Detalle
    ${ttDetalle}=    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[8]/div    title
    Should be equal    ${ttDetalle}    Ver Detalle