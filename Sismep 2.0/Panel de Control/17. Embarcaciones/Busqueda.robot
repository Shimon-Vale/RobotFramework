*** Setting ***
Resource    Recursos.Embarcaciones.robot

*** Variables ***
&{EmbarcacionActiva}    RNP=00074575    Nombre=24 DE FEBRERO    Matricula=3101083723-1
&{EmbarcacionInactiva}    RNP=00040816    Nombre=7 HERMANOS    Matricula=25030411238

${countRNPA}    SELECT COUNT(RNP) FROM Sismep.TSismepVehiculos WHERE RNP = '${EmbarcacionActiva}[RNP]' AND Activo = 1
${selectRNPA}    SELECT top 1 RNP, Nombre, Matricula FROM Sismep.TSismepVehiculos WHERE RNP = '${EmbarcacionActiva}[RNP]' AND Activo = 1
${countNombreA}    SELECT COUNT(Nombre) FROM Sismep.TSismepVehiculos WHERE Nombre = '${EmbarcacionActiva}[Nombre]' AND Activo = 1
${selectNombreA}    SELECT top 1 RNP, Nombre, Matricula FROM Sismep.TSismepVehiculos WHERE Nombre = '${EmbarcacionActiva}[Nombre]' AND Activo = 1
${countMatriculaA}    SELECT COUNT(Matricula) FROM Sismep.TSismepVehiculos WHERE Matricula = '${EmbarcacionActiva}[Matricula]' AND Activo = 1
${selectMatriculaA}    SELECT top 1 RNP, Nombre, Matricula FROM Sismep.TSismepVehiculos WHERE Matricula = '${EmbarcacionActiva}[Matricula]' AND Activo = 1
${countEstatusA}    SELECT COUNT(Nombre) FROM Sismep.TSismepVehiculos WHERE Activo = 1
${selectEstatusA}    SELECT TOP 1 RNP, Nombre, Matricula FROM Sismep.TSismepVehiculos WHERE Activo = 1 ORDER BY Nombre

${countRNPI}    SELECT COUNT(RNP) FROM Sismep.TSismepVehiculos WHERE RNP = '${EmbarcacionInactiva}[RNP]' AND Activo = 0
${selectRNPI}    SELECT top 1 RNP, Nombre, Matricula FROM Sismep.TSismepVehiculos WHERE RNP = '${EmbarcacionInactiva}[RNP]' AND Activo = 0
${countNombreI}    SELECT COUNT(Nombre) FROM Sismep.TSismepVehiculos WHERE Nombre = '${EmbarcacionInactiva}[Nombre]' AND Activo = 0
${selectNombreI}    SELECT top 1 RNP, Nombre, Matricula FROM Sismep.TSismepVehiculos WHERE Nombre = '${EmbarcacionInactiva}[Nombre]' AND Activo = 0
${countMatriculaI}    SELECT COUNT(Matricula) FROM Sismep.TSismepVehiculos WHERE Matricula = '${EmbarcacionInactiva}[Matricula]' AND Activo = 0
${selectMatriculaI}    SELECT top 1 RNP, Nombre, Matricula FROM Sismep.TSismepVehiculos WHERE Matricula = '${EmbarcacionInactiva}[Matricula]' AND Activo = 0
${countEstatusI}    SELECT COUNT(Nombre) FROM Sismep.TSismepVehiculos WHERE Activo = 0
${selectEstatusI}    SELECT TOP 1 RNP, Nombre, Matricula FROM Sismep.TSismepVehiculos WHERE Activo = 0 ORDER BY Nombre

${countRNP}    SELECT COUNT(RNP) FROM Sismep.TSismepVehiculos WHERE RNP = '${EmbarcacionActiva}[RNP]'
${selectRNP}    SELECT top 1 RNP, Nombre, Matricula FROM Sismep.TSismepVehiculos WHERE RNP = '${EmbarcacionActiva}[RNP]'
${countNombre}    SELECT COUNT(Nombre) FROM Sismep.TSismepVehiculos WHERE Nombre = '${EmbarcacionActiva}[Nombre]'
${selectNombre}    SELECT top 1 RNP, Nombre, Matricula FROM Sismep.TSismepVehiculos WHERE Nombre = '${EmbarcacionActiva}[Nombre]'
${countMatricula}    SELECT COUNT(Matricula) FROM Sismep.TSismepVehiculos WHERE Matricula = '${EmbarcacionActiva}[Matricula]'
${selectMatricula}    SELECT top 1 RNP, Nombre, Matricula FROM Sismep.TSismepVehiculos WHERE Matricula = '${EmbarcacionActiva}[Matricula]'
${countEstatus}    SELECT COUNT(Nombre) FROM Sismep.TSismepVehiculos
${selectEstatus}    SELECT TOP 1 RNP, Nombre, Matricula FROM Sismep.TSismepVehiculos ORDER BY Nombre

${xpathGrid}    //*[@id="grid"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Validar etiquetas de pantalla Catalogo de Embarcaciones
    [Documentation]    Debera mostrar correctamente las etiquetas de la pantalla de busqueda
    [Tags]    Validar etiquetas de pantalla Catalogo de Embarcaciones
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Validar etiquetas y tooltips
    [Teardown]    Close Browser
        
Filtro - Estatus Activo - Campo RNP
    [Documentation]    Debera mostrar las embarcaciones que concuerden y/o tengan similitud con el valor ingresado.
    [Tags]    Filtro - Estatus Activo - Campo RNP - T215
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 1 y Campo ${EmbarcacionActiva}[RNP]
    Sleep    1
    Validar resultado contra BD    ${countRNPA}    ${selectRNPA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Nombre
    [Documentation]    Debera mostrar las embarcaciones que concuerden y/o tengan similitud con el valor ingresado.
    [Tags]    Filtro - Estatus Activo - Campo Nombre - T214
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${EmbarcacionActiva}[Nombre]
    Sleep    1
    Validar resultado contra BD    ${countNombreA}    ${selectNombreA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Matricula
    [Documentation]    Debera mostrar las embarcaciones que concuerden y/o tengan similitud con el valor ingresado.
    [Tags]    Filtro - Estatus Activo - Campo Matricula - T217
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 3 y Campo ${EmbarcacionActiva}[Matricula]
    Sleep    1
    Validar resultado contra BD    ${countMatriculaA}    ${selectMatriculaA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo
    [Documentation]    Debera mostrar las embarcaciones que concuerden y/o tengan similitud con el valor ingresado.
    [Tags]    Filtro - Estatus Activo - T216
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Validar resultado contra BD    ${countEstatusA}    ${selectEstatusA}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo RNP
    [Documentation]    Debera mostrar las embarcaciones que concuerden y/o tengan similitud con el valor ingresado.
    [Tags]    Filtro - Estatus Inactivo - Campo RNP
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Estatus    3
    Filtrar por Columna 1 y Campo ${EmbarcacionInactiva}[RNP]
    Sleep    1
    Validar resultado contra BD    ${countRNPI}    ${selectRNPI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Nombre
    [Documentation]    Debera mostrar las embarcaciones que concuerden y/o tengan similitud con el valor ingresado.
    [Tags]    Filtro - Estatus Inactivo - Campo Nombre
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Estatus    3
    Filtrar por Columna 2 y Campo ${EmbarcacionInactiva}[Nombre]
    Sleep    1
    Validar resultado contra BD    ${countNombreI}    ${selectNombreI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Matricula
    [Documentation]    Debera mostrar las embarcaciones que concuerden y/o tengan similitud con el valor ingresado.
    [Tags]    Filtro - Estatus Inactivo - Campo Matricula
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Estatus    3
    Filtrar por Columna 3 y Campo ${EmbarcacionInactiva}[Matricula]
    Sleep    1
    Validar resultado contra BD    ${countMatriculaI}    ${selectMatriculaI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo
    [Documentation]    Debera mostrar las embarcaciones que concuerden y/o tengan similitud con el valor ingresado.
    [Tags]    Filtro - Estatus Inactivo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Estatus    3
    Sleep    1
    Validar resultado contra BD    ${countEstatusI}    ${selectEstatusI}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo RNP
    [Documentation]    Debera mostrar las embarcaciones que concuerden y/o tengan similitud con el valor ingresado.
    [Tags]    Filtro - Estatus Todos - Campo RNP
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Estatus    1
    Filtrar por Columna 1 y Campo ${EmbarcacionActiva}[RNP]
    Sleep    1
    Validar resultado contra BD    ${countRNP}    ${selectRNP}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Nombre
    [Documentation]    Debera mostrar las embarcaciones que concuerden y/o tengan similitud con el valor ingresado.
    [Tags]    Filtro - Estatus Todos - Campo Nombre
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Estatus    1
    Filtrar por Columna 2 y Campo ${EmbarcacionActiva}[Nombre]
    Sleep    1
    Validar resultado contra BD    ${countNombre}    ${selectNombre}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Matricula
    [Documentation]    Debera mostrar las embarcaciones que concuerden y/o tengan similitud con el valor ingresado.
    [Tags]    Filtro - Estatus Todos - Campo Matricula
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Estatus    1
    Filtrar por Columna 3 y Campo ${EmbarcacionActiva}[Matricula]
    Sleep    1
    Validar resultado contra BD    ${countMatricula}    ${selectMatricula}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos
    [Documentation]    Debera mostrar las embarcaciones que concuerden y/o tengan similitud con el valor ingresado.
    [Tags]    Filtro - Estatus Todos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Estatus    1
    Sleep    1
    Validar resultado contra BD    ${countEstatus}    ${selectEstatus}
    [Teardown]    Close Browser
    
*** Keywords ***
Validar etiquetas y tooltips
    ${ttNR}=    Get Element Attribute    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div    tooltip
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[5]/div    title
    Element Text Should be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Catálogo de Embarcaciones
    Element Text Should be    xpath=//*[@id="dx-col-35"]/div[2]    RNP
    Element Text Should be    xpath=//*[@id="dx-col-36"]/div[2]    Nombre
    Element Text Should be    xpath=//*[@id="dx-col-37"]/div[2]    Matrícula
    Element Text Should be    xpath=//*[@id="dx-col-38"]/div[3]    Estatus
    Element Text Should be    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[1]/td[5]/div    Detalle
    Should be equal    ${ttNR}    Nuevo Registro
    Should be equal    ${ttVD}    Ver Detalle

Validar resultado contra BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${RNP}=    Get text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${Embarcacion}=    Get text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    ${Matricula}=    Get text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]
    @{queryResults}    Query    ${arg2}
    Should be equal    ${RNP}    ${queryResults[0][0]}
    Should be equal    ${Embarcacion}    ${queryResults[0][1]}
    Should be equal    ${Matricula}    ${queryResults[0][2]}
    Disconnect From Database