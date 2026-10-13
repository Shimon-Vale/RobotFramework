*** Settings ***
Resource    Recursos.EML.robot

*** Variables ***
&{Filtro}    Descripcion=ca    Municipio=10    Localidad=3
${countDescripcion}    select count(Descripcion) from Sismep.TSismepEstados where Descripcion like '%${Filtro}[Descripcion]%'
${selectDescripcion}    select top 1 e.Descripcion, (select count(1) from Sismep.TSismepMunicipios m where m.IdEstado = e.IdEstado), (select count(1) from Sismep.TSismepMunicipios m join Sismep.TSismepLocalidades l on m.IdMunicipio = l.IdMunicipio where m.IdEstado = e.IdEstado) from Sismep.TSismepEstados e where e.Descripcion like '%${Filtro}[Descripcion]%' order by e.Descripcion
${countTotalMpo}    select count(Resultado.TotalMpo) from (select e.Descripcion, (select count(1) from Sismep.TSismepMunicipios m where m.IdEstado = e.IdEstado) TotalMpo, (select count(1) from Sismep.TSismepMunicipios m join Sismep.TSismepLocalidades l on m.IdMunicipio = l.IdMunicipio where m.IdEstado = e.IdEstado) TotalLoc from Sismep.TSismepEstados e) Resultado where Resultado.TotalMpo = ${Filtro}[Municipio]
${selectTotalMpo}    select top 1 Resultado.Descripcion, Resultado.TotalMpo, Resultado.TotalLoc from (select e.Descripcion, (select count(1) from Sismep.TSismepMunicipios m where m.IdEstado = e.IdEstado) TotalMpo, (select count(1) from Sismep.TSismepMunicipios m join Sismep.TSismepLocalidades l on m.IdMunicipio = l.IdMunicipio where m.IdEstado = e.IdEstado) TotalLoc from Sismep.TSismepEstados e) Resultado where Resultado.TotalMpo = ${Filtro}[Municipio] order by Resultado.Descripcion
${countTotalLoc}    select count(Resultado.TotalLoc) from (select e.Descripcion, (select count(1) from Sismep.TSismepMunicipios m where m.IdEstado = e.IdEstado) TotalMpo, (select count(1) from Sismep.TSismepMunicipios m join Sismep.TSismepLocalidades l on m.IdMunicipio = l.IdMunicipio where m.IdEstado = e.IdEstado) TotalLoc from Sismep.TSismepEstados e) Resultado where Resultado.TotalLoc = ${Filtro}[Localidad]
${selectTotalLoc}    select top 1 Resultado.Descripcion, Resultado.TotalMpo, Resultado.TotalLoc from (select e.Descripcion, (select count(1) from Sismep.TSismepMunicipios m where m.IdEstado = e.IdEstado) TotalMpo, (select count(1) from Sismep.TSismepMunicipios m join Sismep.TSismepLocalidades l on m.IdMunicipio = l.IdMunicipio where m.IdEstado = e.IdEstado) TotalLoc from Sismep.TSismepEstados e) Resultado where Resultado.TotalLoc = ${Filtro}[Localidad] order by Resultado.Descripcion
${xpathGrid}    //*[@id="gridEstadoMunicipio"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Grid - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Validar etiquetas
    [Teardown]    Close Browser

Filtro - Campo Descripcion
    [Documentation]    Debera filtrar correctamente por el campo de Descripcion.
    [Tags]    Filtro - Campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Sleep    1
    Validar consulta contra BD    ${countDescripcion}    ${selectDescripcion}
    [Teardown]    Close Browser

Filtro - Campo Total de Municipios
    [Documentation]    Debera filtrar correctamente por el campo de Total de Municipios.
    [Tags]    Filtro - Campo Total de Municipios
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 2 y Campo ${Filtro}[Municipio]
    Sleep    1
    Validar consulta contra BD    ${countTotalMpo}    ${selectTotalMpo}
    [Teardown]    Close Browser

Filtro - Campo Total de Localidades
    [Documentation]    Debera filtrar correctamente por el campo de Total de Localidades.
    [Tags]    Filtro - Campo Total de Localidades
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 3 y Campo ${Filtro}[Localidad]
    Sleep    1
    Validar consulta contra BD    ${countTotalLoc}    ${selectTotalLoc}
    [Teardown]    Close Browser

*** Keywords ***
Validar etiquetas
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Catálogo de Estados, Municipios y Localidades
    Element Text Should Be    xpath=//*[@id="dx-col-10"]/div[2]    Descripción
    Element Text Should Be    xpath=//*[@id="dx-col-11"]/div[2]    Total de Municipios
    Element Text Should Be    xpath=//*[@id="dx-col-12"]/div[2]    Total de Localidades
    Element Text Should Be    xpath=//*[@id="gridEstadoMunicipio"]/div/div[5]/div/table/tbody/tr[1]/td[4]/div    Detalle
    ${ttNR}=    Get Element Attribute    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div    title
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="gridEstadoMunicipio"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div    title
    Should be equal    ${ttNR}    Nuevo Registro
    Should be equal    ${ttVD}    Ver Detalle

Validar consulta contra BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${gridDescripcion}=    Get text    xpath=//*[@id="gridEstadoMunicipio"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${Municipio}=    Get text    xpath=//*[@id="gridEstadoMunicipio"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    ${gridTotalMpo}=    Convert To Integer    ${Municipio}
    ${Localidad}=    Get text    xpath=//*[@id="gridEstadoMunicipio"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]
    ${gridTotalLoc}=    Convert To Integer    ${Localidad}
    @{queryResults}    Query    ${arg2}
    Should be equal    ${gridDescripcion}    ${queryResults[0][0]}
    Should be equal    ${gridTotalMpo}    ${queryResults[0][1]}
    Should be equal    ${gridTotalLoc}    ${queryResults[0][2]}
    Disconnect From Database
