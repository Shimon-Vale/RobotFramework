*** Settings ***
Resource    Recursos.RazonSocial.robot

*** Variables ***
&{RegistroActivo}    Nombre=Gil    RNP=0039    Estado=Campeche    Municipio=Mazatlan    Localidad=Tuxpan
&{RegistroInactivo}    Nombre=S.C    RNP=017    Estado=Sonora    Municipio=Mazatlan    Localidad=Cancun

${countNombreA}    select count(rs.Descripcion) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.Descripcion like '%${RegistroActivo}[Nombre]%' and rs.Activo = 1
${selectNombreA}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.Descripcion like '%${RegistroActivo}[Nombre]%' and rs.Activo = 1 order by rs.Descripcion
${countRNPA}    select count(rs.RNPTitular) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.RNPTitular like '%${RegistroActivo}[RNP]%' and rs.Activo = 1
${selectRNPA}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.RNPTitular like '%${RegistroActivo}[RNP]%' and rs.Activo = 1 order by rs.Descripcion
${countEstadoA}    select count(e.Descripcion) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where e.Descripcion like '%${RegistroActivo}[Estado]%' and rs.Activo = 1
${selectEstadoA}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where e.Descripcion like '%${RegistroActivo}[Estado]%' and rs.Activo = 1 order by rs.Descripcion
${countMunicipioA}    select count(m.Descripcion) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where m.Descripcion like '%${RegistroActivo}[Municipio]%' and rs.Activo = 1
${selectMunicipioA}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where m.Descripcion like '%${RegistroActivo}[Municipio]%' and rs.Activo = 1 order by rs.Descripcion
${countLocalidadA}    select count(l.Descripcion) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where l.Descripcion like '%${RegistroActivo}[Localidad]%' and rs.Activo = 1
${selectLocalidadA}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where l.Descripcion like '%${RegistroActivo}[Localidad]%' and rs.Activo = 1 order by rs.Descripcion
${countEstatusA}    select count(rs.Activo) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.Activo = 1
${selectEstatusA}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.Activo = 1 order by rs.Descripcion

${countNombreI}    select count(rs.Descripcion) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.Descripcion like '%${RegistroInactivo}[Nombre]%' and rs.Activo = 0
${selectNombreI}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.Descripcion like '%${RegistroInactivo}[Nombre]%' and rs.Activo = 0 order by rs.Descripcion
${countRNPI}    select count(rs.RNPTitular) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.RNPTitular like '%${RegistroInactivo}[RNP]%' and rs.Activo = 0
${selectRNPI}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.RNPTitular like '%${RegistroInactivo}[RNP]%' and rs.Activo = 0 order by rs.Descripcion
${countEstadoI}    select count(e.Descripcion) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where e.Descripcion like '%${RegistroInactivo}[Estado]%' and rs.Activo = 0
${selectEstadoI}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where e.Descripcion like '%${RegistroInactivo}[Estado]%' and rs.Activo = 0 order by rs.Descripcion
${countMunicipioI}    select count(m.Descripcion) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where m.Descripcion like '%${RegistroInactivo}[Municipio]%' and rs.Activo = 0
${selectMunicipioI}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where m.Descripcion like '%${RegistroInactivo}[Municipio]%' and rs.Activo = 0 order by rs.Descripcion
${countLocalidadI}    select count(l.Descripcion) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where l.Descripcion like '%${RegistroInactivo}[Localidad]%' and rs.Activo = 0
${selectLocalidadI}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where l.Descripcion like '%${RegistroInactivo}[Localidad]%' and rs.Activo = 0 order by rs.Descripcion
${countEstatusI}    select count(rs.Activo) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.Activo = 0
${selectEstatusI}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.Activo = 0 order by rs.Descripcion

${countNombre}    select count(rs.Descripcion) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.Descripcion like '%${RegistroActivo}[Nombre]%'
${selectNombre}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.Descripcion like '%${RegistroActivo}[Nombre]%' order by rs.Descripcion
${countRNP}    select count(rs.RNPTitular) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.RNPTitular like '%${RegistroActivo}[RNP]%'
${selectRNP}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where rs.RNPTitular like '%${RegistroActivo}[RNP]%' order by rs.Descripcion
${countEstado}    select count(e.Descripcion) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where e.Descripcion like '%${RegistroActivo}[Estado]%'
${selectEstado}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where e.Descripcion like '%${RegistroActivo}[Estado]%' order by rs.Descripcion
${countMunicipio}    select count(m.Descripcion) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where m.Descripcion like '%${RegistroActivo}[Municipio]%'
${selectMunicipio}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where m.Descripcion like '%${RegistroActivo}[Municipio]%' order by rs.Descripcion
${countLocalidad}    select count(l.Descripcion) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where l.Descripcion like '%${RegistroActivo}[Localidad]%'
${selectLocalidad}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado where l.Descripcion like '%${RegistroActivo}[Localidad]%' order by rs.Descripcion
${countEstatus}    select count(rs.Activo) from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado
${selectEstatus}    select top 1 rs.Descripcion, rs.RNPTitular, e.Descripcion, m.Descripcion, l.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepLocalidades l on rs.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios m on l.IdMunicipio = m.IdMunicipio join Sismep.TSismepEstados e on m.IdEstado = e.IdEstado order by rs.Descripcion

${xpathGrid}    //*[@id="dataGrid"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Validar etiquetas
    [Documentation]    Debera mostrar correctamente escritas las etiquetas.
    [Tags]    Grid - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Descripcion
    [Documentation]    Debera mostrar los registros activos que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro - Estatus Activo - Campo Descripcion - T93
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Columna 1 y Campo ${RegistroActivo}[Nombre]
    Sleep    1
    Validar resultado contra BD    ${countNombreA}    ${selectNombreA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - RNP
    [Documentation]    Debera mostrar los registros activos que coincidan con lo ingresado en RNP.
    [Tags]    Filtro - Estatus Activo - RNP
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Columna 2 y Campo ${RegistroActivo}[RNP]
    Sleep    1
    Validar resultado contra BD    ${countRNPA}    ${selectRNPA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Estado
    [Documentation]    Debera mostrar los registros activos que coincidan con lo ingresado en Estado.
    [Tags]    Filtro - Estatus Activo - Estado - T96
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Columna 3 y Campo ${RegistroActivo}[Estado]
    Sleep    1
    Validar resultado contra BD    ${countEstadoA}    ${selectEstadoA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Municipio
    [Documentation]    Debera mostrar los registros activos que coincidan con lo ingresado en Municipio.
    [Tags]    Filtro - Estatus Activo - Municipio - T97
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Columna 4 y Campo ${RegistroActivo}[Municipio]
    Sleep    1
    Validar resultado contra BD    ${countMunicipioA}    ${selectMunicipioA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Localidad
    [Documentation]    Debera mostrar los registros activos que coincidan con lo ingresado en Localidad.
    [Tags]    Filtro - Estatus Activo - Localidad - T98
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Columna 5 y Campo ${RegistroActivo}[Localidad]
    Sleep    1
    Validar resultado contra BD    ${countLocalidadA}    ${selectLocalidadA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo
    [Documentation]    Debera mostrar todos los registros Activos.
    [Tags]    Filtro - Estatus Activo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Sleep    1
    Validar resultado contra BD    ${countEstatusA}    ${selectEstatusA}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Descripcion
    [Documentation]    Debera mostrar los registros inactivos que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro - Estatus Inactivo - Campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Estatus    ${Inactivo}
    Filtrar por Columna 1 y Campo ${RegistroInactivo}[Nombre]
    Sleep    1
    Validar resultado contra BD    ${countNombreI}    ${selectNombreI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - RNP
    [Documentation]    Debera mostrar los registros inactivos que coincidan con lo ingresado en RNP.
    [Tags]    Filtro - Estatus Inactivo - RNP
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Estatus    ${Inactivo}
    Filtrar por Columna 2 y Campo ${RegistroInactivo}[RNP]
    Sleep    1
    Validar resultado contra BD    ${countRNPI}    ${selectRNPI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Estado
    [Documentation]    Debera mostrar los registros inactivos que coincidan con lo ingresado en Estado.
    [Tags]    Filtro - Estatus Inactivo - Estado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Estatus    ${Inactivo}
    Filtrar por Columna 3 y Campo ${RegistroInactivo}[Estado]
    Sleep    1
    Validar resultado contra BD    ${countEstadoI}    ${selectEstadoI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Municipio
    [Documentation]    Debera mostrar los registros inactivos que coincidan con lo ingresado en Municipio.
    [Tags]    Filtro - Estatus Inactivo - Municipio
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Estatus    ${Inactivo}
    Filtrar por Columna 4 y Campo ${RegistroInactivo}[Municipio]
    Sleep    1
    Validar resultado contra BD    ${countMunicipioI}    ${selectMunicipioI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Localidad
    [Documentation]    Debera mostrar los registros inactivos que coincidan con lo ingresado en Localidad.
    [Tags]    Filtro - Estatus Inactivo - Localidad
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Estatus    ${Inactivo}
    Filtrar por Columna 5 y Campo ${RegistroInactivo}[Localidad]
    Sleep    1
    Validar resultado contra BD    ${countLocalidadI}    ${selectLocalidadI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo
    [Documentation]    Debera mostrar todos los registros Inactivos.
    [Tags]    Filtro - Estatus Inactivo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Estatus    ${Inactivo}
    Sleep    1
    Validar resultado contra BD    ${countEstatusI}    ${selectEstatusI}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Descripcion
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro - Estatus Todos - Campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Estatus    ${Todos}
    Filtrar por Columna 1 y Campo ${RegistroActivo}[Nombre]
    Sleep    1
    Validar resultado contra BD    ${countNombre}    ${selectNombre}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - RNP
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en RNP.
    [Tags]    Filtro - Estatus Todos - RNP
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Estatus    ${Todos}
    Filtrar por Columna 2 y Campo ${RegistroActivo}[RNP]
    Sleep    1
    Validar resultado contra BD    ${countRNP}    ${selectRNP}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Estado
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en Estados.
    [Tags]    Filtro - Estatus Todos - Estado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Estatus    ${Todos}
    Filtrar por Columna 3 y Campo ${RegistroActivo}[Estado]
    Sleep    1
    Validar resultado contra BD    ${countEstado}    ${selectEstado}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Municipio
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en Municipio.
    [Tags]    Filtro - Estatus Todos - Municipio
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Estatus    ${Todos}
    Filtrar por Columna 4 y Campo ${RegistroActivo}[Municipio]
    Sleep    1
    Validar resultado contra BD    ${countMunicipio}    ${selectMunicipio}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Localidad
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en Localidad.
    [Tags]    Filtro - Estatus Todos - Localidad
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Estatus    ${Todos}
    Filtrar por Columna 5 y Campo ${RegistroActivo}[Localidad]
    Sleep    1
    Validar resultado contra BD    ${countLocalidad}    ${selectLocalidad}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos
    [Documentation]    Debera mostrar todos los registros.
    [Tags]    Filtro - Estatus Todos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
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
#     ${rowText}=    Get Text    xpath://*[@id="dataGrid"]/div/div[11]/div/div[1]
#     ${records}=    Execute JavaScript    actual='${rowText}'; split1 = actual.split('(')[1]; return split2 = split1.split(' ')[0];
#     ${rows}=    Convert To Integer    ${records}
#     Set Test Variable    ${rows}
    
Validar resultado contra BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${Nombre}=    Get text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${RNP}=    Get text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    ${Estado}=    Get text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]
    ${Municipio}=    Get text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]
    ${Localidad}=    Get text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[5]
    @{queryResults}    Query    ${arg2}
    Should be equal    ${Nombre}    ${queryResults[0][0]}
    Should be equal    ${RNP}    ${queryResults[0][1]}
    Should be equal    ${Estado}    ${queryResults[0][2]}
    Should be equal    ${Municipio}    ${queryResults[0][3]}
    Should be equal    ${Localidad}    ${queryResults[0][4]}
    Disconnect From Database
    
Validar etiquetas
    ${ttNR}=    Get Element Attribute    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div    title
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[7]/div    title
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Catálogo de Razón Social
    Element Text Should Be    xpath=//*[@id="dx-col-17"]/div[2]    Nombre
    Element Text Should Be    xpath=//*[@id="dx-col-18"]/div[2]    RNP del Titular
    Element Text Should Be    xpath=//*[@id="dx-col-19"]/div[2]    Estado
    Element Text Should Be    xpath=//*[@id="dx-col-20"]/div[2]    Municipio
    Element Text Should Be    xpath=//*[@id="dx-col-21"]/div[2]    Localidad
    Element Text Should Be    xpath=//*[@id="dx-col-22"]/div[3]    Estatus
    Element Text Should Be    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[1]/td[7]/div    Detalle
    Should be equal    ${ttNR}    Nuevo Registro
    Should be equal    ${ttVD}    Ver Detalle