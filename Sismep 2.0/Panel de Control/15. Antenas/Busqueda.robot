*** Settings ***
Resource    Recursos.Antenas.robot

*** Variables ***
&{antenaactiva}    id=740B29C1-8DA4-4E6D-8E76-603F97BA64BC    tipo=IDP    descripcion=01315168SKYC51D    marca=SKYWAVE    modelo=IDP    serie=01434222SKY1263
&{antenainactiva}    id=4CD3A131-9F19-4759-AE98-979E5F750D84    tipo=ETR    descripcion=00201465VTIB11A    marca=SKYWAVE    modelo=ETR    serie=00202022VTIEFFB

${countTipo}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.IdModem='${antenaactiva}[id]' and a.Activo=1
${selectTipo}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.IdModem='${antenaactiva}[id]' and a.Activo=1 order by a.IdAntena
${countDescripcion}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Descripcion like '%${antenaactiva}[descripcion]%' and a.Activo=1
${selectDescripcion}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Descripcion like '%${antenaactiva}[descripcion]%' and a.Activo=1 order by a.IdAntena
${countMarca}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Marca='${antenaactiva}[marca]' and a.Activo=1
${selectMarca}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Marca='${antenaactiva}[marca]' and a.Activo=1 order by a.Descripcion
${countModelo}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Modelo like '%${antenaactiva}[modelo]%' and a.Activo=1
${selectModelo}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Modelo like '%${antenaactiva}[modelo]%' and a.Activo=1 order by a.Descripcion
${countSerie}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.NoSerie like '%${antenaactiva}[serie]%' and a.Activo=1
${selectSerie}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.NoSerie like '%${antenaactiva}[serie]%' and a.Activo=1
${countEstatus}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Activo=1
${selectEstatus}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Activo=1 order by a.IdAntena

${countTipoInactivo}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.IdModem='${antenainactiva}[id]' and a.Activo=0
${selectTipoInactivo}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.IdModem='${antenainactiva}[id]' and a.Activo=0 order by a.Descripcion
${countDescripcionInactivo}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Descripcion like '%${antenainactiva}[descripcion]%' and a.Activo=0
${selectDescripcionInactivo}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Descripcion like '%${antenainactiva}[descripcion]%' and a.Activo=0 order by a.IdAntena
${countMarcaInactivo}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Marca='${antenainactiva}[marca]' and a.Activo=0
${selectMarcaInactivo}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Marca='${antenainactiva}[marca]' and a.Activo=0 order by a.Descripcion
${countModeloInactivo}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Modelo='${antenainactiva}[modelo]' and a.Activo=0
${selectModeloInactivo}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Modelo='${antenainactiva}[modelo]' and a.Activo=0 order by a.Descripcion
${countSerieInactivo}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.NoSerie like '%${antenainactiva}[serie]%' and a.Activo=0
${selectSerieInactivo}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.NoSerie like '%${antenainactiva}[serie]%' and a.Activo=0
${countEstatusInactivo}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Activo=0
${selectEstatusInactivo}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Activo=0 order by a.NoSerie

${countTipoTodos}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.IdModem='${antenaactiva}[id]'
${selectTipoTodos}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.IdModem='${antenaactiva}[id]' order by a.NoSerie
${countDescripcionTodos}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Descripcion like '%${antenaactiva}[descripcion]%'
${selectDescripcionTodos}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Descripcion like '%${antenaactiva}[descripcion]%' order by a.IdAntena
${countMarcaTodos}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Marca='${antenaactiva}[marca]'
${selectMarcaTodos}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Marca='${antenaactiva}[marca]' order by a.Descripcion
${countModeloTodos}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Modelo like '%${antenaactiva}[modelo]%'
${selectModeloTodos}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.Modelo like '%${antenaactiva}[modelo]%' order by a.Descripcion
${countSerieTodos}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.NoSerie like '%${antenaactiva}[serie]%'
${selectSerieTodos}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem where a.NoSerie like '%${antenaactiva}[serie]%' order by a.NoSerie
${countEstatusTodos}    select COUNT(*) from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem
${selectEstatusTodos}    select top 1 m.Descripcion, a.Descripcion, a.Marca, a.Modelo, a.NoSerie from Sismep.TSismepAntenas a join Sismep.TSismepModems m on a.IdModem = m.IdModem order by a.NoSerie

${xpathGrid}    //*[@id="dataGrid"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Etiquetas y tooltips
    [Documentation]    Se validan las etiquetas del modulo de Antenas.
    [Tags]    Grid - Etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Validar etiquetas y tooltips
    [Teardown]    Close Browser
    
Filtro - Activo Tipo
    [Documentation]    Debe de mostrar solo las antenas activas que cumplan con el filtro "Tipo" ingresado.
    [Tags]    Filtro - Activo Tipo 
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    1    ${antenaactiva}[tipo]
    Sleep    1
    Validar busqueda en base de datos    ${countTipo}    ${selectTipo}
    [Teardown]    Close Browser

Filtro - Activo Descripcion
    [Documentation]    Debe de mostrar solo las antenas activas que cumplan con el filtro "Descripcion" ingresado.
    [Tags]    Filtro - Activo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    2    ${antenaactiva}[descripcion]
    Sleep    1
    Validar busqueda en base de datos    ${countDescripcion}    ${selectDescripcion}
    [Teardown]    Close Browser

Filtro - Activo Marca
    [Documentation]    Debe de mostrar solo las antenas activas que cumplan con el filtro "Marca" ingresado.
    [Tags]    Filtro - Activo Marca
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    3    ${antenaactiva}[marca]
    Sleep    1
    Validar busqueda en base de datos    ${countMarca}    ${selectMarca}
    [Teardown]    Close Browser

Filtro - Activo Modelo
    [Documentation]    Debe de mostrar solo las antenas activas que cumplan con el filtro "Modelo" ingresado.
    [Tags]    Filtro - Activo Modelo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    4    ${antenaactiva}[modelo]
    Sleep    1
    Validar busqueda en base de datos    ${countModelo}    ${selectModelo}
    [Teardown]    Close Browser

Filtro - Activo Serie
    [Documentation]    Debe de mostrar solo las antenas activas que cumplan con el filtro "Serie" ingresado.
    [Tags]    Filtro - Activo Serie
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por    5    ${antenaactiva}[serie]
    Sleep    1
    Validar busqueda en base de datos    ${countSerie}    ${selectSerie}
    [Teardown]    Close Browser

Filtro - Activo Estatus
    [Documentation]    Debe de mostrar solo las antenas activas.
    [Tags]    Filtro - Activo Estatus - T1116
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Sleep    1
    Validar busqueda en base de datos    ${countEstatus}    ${selectEstatus}
    [Teardown]    Close Browser

Filtro - Inactivo Tipo
    [Documentation]    Debe de mostrar solo las antenas inactivas que cumplan con el filtro "Tipo" ingresado.
    [Tags]    Filtro - Inactivo Tipo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por estatus    3
    Filtrar por    1    ${antenainactiva}[tipo]
    Sleep    1
    Validar busqueda en base de datos    ${countTipoInactivo}    ${selectTipoInactivo}
    [Teardown]    Close Browser

Filtro - Inactivo Descripcion
    [Documentation]    Debe de mostrar solo las antenas inactivas que cumplan con el filtro "Descripcion" ingresado.
    [Tags]    Filtro - Inactivo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por estatus    3
    Filtrar por    2    ${antenainactiva}[descripcion]
    Sleep    1
    Validar busqueda en base de datos    ${countDescripcionInactivo}    ${selectDescripcionInactivo}
    [Teardown]    Close Browser

Filtro - Inactivo Marca
    [Documentation]    Debe de mostrar solo las antenas inactivas que cumplan con el filtro "Marca" ingresado.
    [Tags]    Filtro - Inactivo Marca
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por estatus    3
    Filtrar por    3    ${antenainactiva}[marca]
    Sleep    1
    Validar busqueda en base de datos    ${countMarcaInactivo}    ${selectMarcaInactivo}
    [Teardown]    Close Browser

Filtro - Inactivo Modelo
    [Documentation]    Debe de mostrar solo las antenas inactivas que cumplan con el filtro "Modelo" ingresado.
    [Tags]    Filtro - Inactivo Modelo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por estatus    3
    Filtrar por    4    ${antenainactiva}[modelo]
    Sleep    1
    Validar busqueda en base de datos    ${countModeloInactivo}    ${selectModeloInactivo}
    [Teardown]    Close Browser

Filtro - Inactivo Serie
    [Documentation]    Debe de mostrar solo las antenas inactivas que cumplan con el filtro "Serie" ingresado.
    [Tags]    Filtro - Inactivo Serie
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por estatus    3
    Filtrar por    5    ${antenainactiva}[serie]
    Sleep    1
    Validar busqueda en base de datos    ${countSerieInactivo}    ${selectSerieInactivo}
    [Teardown]    Close Browser

Filtro - Inactivo Estatus
    [Documentation]    Debe de mostrar solo las antenas inactivas.
    [Tags]    Filtro - Inactivo Estatus
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por estatus    3
    Sleep    1
    Validar busqueda en base de datos    ${countEstatusInactivo}    ${selectEstatusInactivo}
    [Teardown]    Close Browser

Filtro - Todos Tipo
    [Documentation]    Debe de mostrar todas las antenas que cumplan con el filtro "Tipo" ingresado.
    [Tags]    Filtro - Todos Tipo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por estatus    1
    Filtrar por    1    ${antenaactiva}[tipo]
    Sleep    1
    Validar busqueda en base de datos    ${countTipoTodos}    ${selectTipoTodos}
    [Teardown]    Close Browser

Filtro - Todos Descripcion
    [Documentation]    Debe de mostrar todas las antenas que cumplan con el filtro "Descripcion" ingresado.
    [Tags]    Filtro - Todos Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por estatus    1
    Filtrar por    2    ${antenaactiva}[descripcion]
    Sleep    1
    Validar busqueda en base de datos    ${countDescripcionTodos}    ${selectDescripcionTodos}
    [Teardown]    Close Browser

Filtro - Todos Marca
    [Documentation]    Debe de mostrar todas las antenas que cumplan con el filtro "Marca" ingresado.
    [Tags]    Filtro - Todos Marca
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por estatus    1
    Filtrar por    3    ${antenaactiva}[marca]
    Sleep    1
    Validar busqueda en base de datos    ${countMarcaTodos}    ${selectMarcaTodos}
    [Teardown]    Close Browser

Filtro - Todos Modelo
    [Documentation]    Debe de mostrar todas las antenas que cumplan con el filtro "Modelo" ingresado.
    [Tags]    Filtro - Todos Modelo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por estatus    1
    Filtrar por    4    ${antenaactiva}[modelo]
    Sleep    1
    Validar busqueda en base de datos    ${countModeloTodos}    ${selectModeloTodos}
    [Teardown]    Close Browser

Filtro - Todos Serie
    [Documentation]    Debe de mostrar todas las antenas que cumplan con el filtro "Serie" ingresado.
    [Tags]    Filtro - Todos Serie
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por estatus    1
    Filtrar por    5    ${antenaactiva}[serie]
    Sleep    1
    Validar busqueda en base de datos    ${countSerieTodos}    ${selectSerieTodos}
    [Teardown]    Close Browser

Filtro - Todos Estatus
    [Documentation]    Debe de mostrar todas las antenas.
    [Tags]    Filtro - Todos Estatus
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Filtrar por estatus    1
    Sleep    1
    Validar busqueda en base de datos    ${countEstatusTodos}    ${selectEstatusTodos}
    [Teardown]    Close Browser
    
*** Keywords ***
Validar busqueda en base de datos
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should Be Equal    ${queryRows[0][0]}    ${noReg}
    ${Tipo}=    Get Text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${Descripcion}=    Get Text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    ${Mca}=    Get Text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]
    ${Marca}=    Execute JavaScript    if('${Mca}'==' '){return 'None'}else{return'${Mca}'};
    ${Mlo}=    Get Text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]
    ${Modelo}=    Execute JavaScript    if('${Mlo}'==' '){return 'None'}else{return'${Mlo}'};
    ${Serie}=    Get Text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[5]
    @{queryResults}    Query    ${arg2}
    ${MarcaDB}=    Execute JavaScript    if('${queryResults[0][2]}'==''){return 'None'}else{return'${queryResults[0][2]}'};
    ${ModeloDB}=    Execute JavaScript    if('${queryResults[0][3]}'==''){return 'None'}else{return'${queryResults[0][3]}'};
    Should Be Equal    ${queryResults[0][0]}    ${Tipo}
    Should Be Equal    ${queryResults[0][1]}    ${Descripcion}
    Should Be Equal    ${MarcaDB}    ${Marca}
    Should Be Equal    ${ModeloDB}    ${Modelo}
    Should Be Equal    ${queryResults[0][4]}    ${Serie}
    Disconnect From Database

Validar etiquetas y tooltips
    ${ttNR}=    Get Element Attribute    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div    tooltip
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[7]/div    title
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Catálogo de Antenas
    Element Text Should Be    xpath=//*[@id="dx-col-7"]/div[2]    Tipo
    Element Text Should Be    xpath=//*[@id="dx-col-8"]/div[2]    Descripción
    Element Text Should Be    xpath=//*[@id="dx-col-9"]/div[2]    Marca
    Element Text Should Be    xpath=//*[@id="dx-col-10"]/div[2]    Modelo
    Element Text Should Be    xpath=//*[@id="dx-col-11"]/div[2]    No Serie
    Element Text Should Be    xpath=//*[@id="dx-col-12"]/div[3]    Estatus
    Element Text Should Be    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[1]/td[7]/div    Detalle
    Should be equal    ${ttNR}    Nuevo Registro
    Should be equal    ${ttVD}    Ver Detalle