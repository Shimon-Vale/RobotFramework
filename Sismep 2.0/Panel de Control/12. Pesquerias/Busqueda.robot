*** Settings ***
Resource    Recursos.Pesquerias.robot

*** Variables ***
&{RegistroActivo}    Descripcion=Cala    VMinima=3    VMaxima=6
&{RegistroInactivo}    Descripcion=RFPru    VMinima=1    VMaxima=10

${countDescripcionA}    select count(Descripcion) from Sismep.TSismepTiposCarga where Descripcion like '%${RegistroActivo}[Descripcion]%' and Activo = 1
${selectDescripcionA}    select top 1 Descripcion, VelocidadMin, VelocidadMax from Sismep.TSismepTiposCarga where Descripcion like '%${RegistroActivo}[Descripcion]%' and Activo = 1 order by Descripcion
${countVMinimaA}    select count(VelocidadMin) from Sismep.TSismepTiposCarga where VelocidadMin like '%${RegistroActivo}[VMinima]%' and Activo = 1
${selectVMinimaA}    select top 1 Descripcion, VelocidadMin, VelocidadMax from Sismep.TSismepTiposCarga where VelocidadMin like '%${RegistroActivo}[VMinima]%' and Activo = 1 order by Descripcion
${countVMaximaA}    select count(VelocidadMax) from Sismep.TSismepTiposCarga where VelocidadMax like '%${RegistroActivo}[VMaxima]%' and Activo = 1
${selectVMaximaA}    select top 1 Descripcion, VelocidadMin, VelocidadMax from Sismep.TSismepTiposCarga where VelocidadMax like '%${RegistroActivo}[VMaxima]%' and Activo = 1 order by Descripcion
${countEstatusA}    select count(Activo) from Sismep.TSismepTiposCarga where Activo = 1
${selectEstatusA}    select top 1 Descripcion, VelocidadMin, VelocidadMax from Sismep.TSismepTiposCarga where Activo = 1 order by Descripcion

${countDescripcionI}    select count(Descripcion) from Sismep.TSismepTiposCarga where Descripcion like '%${RegistroInactivo}[Descripcion]%' and Activo = 0
${selectDescripcionI}    select top 1 Descripcion, VelocidadMin, VelocidadMax from Sismep.TSismepTiposCarga where Descripcion like '%${RegistroInactivo}[Descripcion]%' and Activo = 0 order by Descripcion
${countVMinimaI}    select count(VelocidadMin) from Sismep.TSismepTiposCarga where VelocidadMin like '%${RegistroInactivo}[VMinima]%' and Activo = 0
${selectVMinimaI}    select top 1 Descripcion, VelocidadMin, VelocidadMax from Sismep.TSismepTiposCarga where VelocidadMin like '%${RegistroInactivo}[VMinima]%' and Activo = 0 order by Descripcion
${countVMaximaI}    select count(VelocidadMax) from Sismep.TSismepTiposCarga where VelocidadMax like '%${RegistroInactivo}[VMaxima]%' and Activo = 0
${selectVMaximaI}    select top 1 Descripcion, VelocidadMin, VelocidadMax from Sismep.TSismepTiposCarga where VelocidadMax like '%${RegistroInactivo}[VMaxima]%' and Activo = 0 order by Descripcion
${countEstatusI}    select count(Activo) from Sismep.TSismepTiposCarga where Activo = 0
${selectEstatusI}    select top 1 Descripcion, VelocidadMin, VelocidadMax from Sismep.TSismepTiposCarga where Activo = 0 order by Descripcion

${countDescripcion}    select count(Descripcion) from Sismep.TSismepTiposCarga where Descripcion like '%${RegistroActivo}[Descripcion]%'
${selectDescripcion}    select top 1 Descripcion, VelocidadMin, VelocidadMax from Sismep.TSismepTiposCarga where Descripcion like '%${RegistroActivo}[Descripcion]%' order by Descripcion
${countVMinima}    select count(VelocidadMin) from Sismep.TSismepTiposCarga where VelocidadMin like '%${RegistroActivo}[VMinima]%'
${selectVMinima}    select top 1 Descripcion, VelocidadMin, VelocidadMax from Sismep.TSismepTiposCarga where VelocidadMin like '%${RegistroActivo}[VMinima]%' order by Descripcion
${countVMaxima}    select count(VelocidadMax) from Sismep.TSismepTiposCarga where VelocidadMax like '%${RegistroActivo}[VMaxima]%'
${selectVMaxima}    select top 1 Descripcion, VelocidadMin, VelocidadMax from Sismep.TSismepTiposCarga where VelocidadMax like '%${RegistroActivo}[VMaxima]%' order by Descripcion
${countEstatus}    select count(Activo) from Sismep.TSismepTiposCarga
${selectEstatus}    select top 1 Descripcion, VelocidadMin, VelocidadMax from Sismep.TSismepTiposCarga order by Descripcion

${xpathGrid}    //*[@id="grid"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Grid - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Validar etiquetas y tooltips
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Descripcion
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro - Estatus Activo - Campo Descripcion - T151
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Columna 1 y Campo ${RegistroActivo}[Descripcion]
    Sleep    1
    Validar resultado contra BD    ${countDescripcionA}    ${selectDescripcionA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Velocidad Minima
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Velocidad Minima.
    [Tags]    Filtro - Estatus Activo - Campo Velocidad Minima - T152
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Columna 2 y Campo ${RegistroActivo}[VMinima]
    Sleep    1
    Validar resultado contra BD    ${countVMinimaA}    ${selectVMinimaA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Velocidad Maxima
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Velocidad Maxima.
    [Tags]    Filtro - Estatus Activo - Campo Velocidad Maxima - T153
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Columna 3 y Campo ${RegistroActivo}[VMaxima]
    Sleep    1
    Validar resultado contra BD    ${countVMaximaA}    ${selectVMaximaA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo
    [Documentation]    Debera mostrar todos los registros Activos.
    [Tags]    Filtro - Estatus Activo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Sleep    1
    Validar resultado contra BD    ${countEstatusA}    ${selectEstatusA}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Descripcion
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro - Estatus Inactivo - Campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Estatus    3
    Filtrar por Columna 1 y Campo ${RegistroInactivo}[Descripcion]
    Sleep    1
    Validar resultado contra BD    ${countDescripcionI}    ${selectDescripcionI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Velocidad Minima
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado en Velocidad Minima.
    [Tags]    Filtro - Estatus Inactivo - Campo Velocidad Minima
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Estatus    3
    Filtrar por Columna 2 y Campo ${RegistroInactivo}[VMinima]
    Sleep    1
    Validar resultado contra BD    ${countVMinimaI}    ${selectVMinimaI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Velocidad Maxima
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado en Velocidad Maxima.
    [Tags]    Filtro - Estatus Inactivo - Campo Velocidad Maxima
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Estatus    3
    Filtrar por Columna 3 y Campo ${RegistroInactivo}[VMaxima]
    Sleep    1
    Validar resultado contra BD    ${countVMaximaI}    ${selectVMaximaI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo
    [Documentation]    Debera mostrar todos los registros Inactivos.
    [Tags]    Filtro - Estatus Inactivo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Estatus    3
    Sleep    1
    Validar resultado contra BD    ${countEstatusI}    ${selectEstatusI}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Descripcion
    [Documentation]    Debera mostrar Todos los registros que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro - Estatus Todos - Campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Estatus    1
    Filtrar por Columna 1 y Campo ${RegistroActivo}[Descripcion]
    Sleep    1
    Validar resultado contra BD    ${countDescripcion}    ${selectDescripcion}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Velocidad Minima
    [Documentation]    Debera mostrar Todos los registros que coincidan con lo ingresado en Velocidad Minima.
    [Tags]    Filtro - Estatus Todos - Campo Velocidad Minima
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Estatus    1
    Filtrar por Columna 2 y Campo ${RegistroActivo}[VMinima]
    Sleep    1
    Validar resultado contra BD    ${countVMinima}    ${selectVMinima}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Velocidad Maxima
    [Documentation]    Debera mostrar Todos los registros que coincidan con lo ingresado en Velocidad Maxima.
    [Tags]    Filtro - Estatus Todos - Campo Velocidad Maxima
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Estatus    1
    Filtrar por Columna 3 y Campo ${RegistroActivo}[VMaxima]
    Sleep    1
    Validar resultado contra BD    ${countVMaxima}    ${selectVMaxima}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos
    [Documentation]    Debera mostrar Todos los registros.
    [Tags]    Filtro - Estatus Todos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Pesquerias
    Filtrar por Estatus    1
    Sleep    1
    Validar resultado contra BD    ${countEstatus}    ${selectEstatus}
    [Teardown]    Close Browser
    
*** Keywords ***
Validar resultado contra BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${Descripcion}=    Get text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${VMin}=    Get text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    ${VMinima}=    Convert to Number    ${VMin}
    ${VMax}=     Get text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]
    ${VMaxima}=    Convert to Number    ${VMax}
    @{queryResults}    Query    ${arg2}
    ${VMinimaBD}=    Convert to Number    ${queryResults[0][1]}
    ${VMaximaBD}=    Convert to Number    ${queryResults[0][2]}
    Should be equal    ${Descripcion}    ${queryResults[0][0]}
    Should be equal    ${VMinima}    ${VMinimaBD}
    Should be equal    ${VMaxima}    ${VMaximaBD}
    Disconnect From Database
    
Validar etiquetas y tooltips
    ${ttNR}=    Get Element Attribute    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div    tooltip
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[5]/div    title
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Catálogo Pesquer\u00EDas
    Element Text Should Be    xpath=//*[@id="dx-col-5"]/div[2]    Descripci\u00F3n
    Element Text Should Be    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[1]/td[2]/div[2]    Velocidad M\u00EDnima
    Element Text Should Be    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[1]/td[3]/div[2]    Velocidad M\u00E1xima
    Element Text Should Be    xpath=//*[@id="dx-col-6"]/div[3]    Estatus
    Element Text Should Be    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[1]/td[5]/div    Detalle
    Should be equal    ${ttNR}    Nuevo Registro
    Should be equal    ${ttVD}    Ver Detalle