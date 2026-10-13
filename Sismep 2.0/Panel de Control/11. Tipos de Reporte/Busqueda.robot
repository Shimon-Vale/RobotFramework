*** Settings ***
Resource    Recursos.TiposReporte.robot

*** Variables ***
&{RegistroActivo}    Tipo=Conexion   Mensaje=Emergencia
&{RegistroInactivo}    Tipo=RFPru   Mensaje=Res

${countTipoA}    select count(rm.Descripcion) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Descripcion like '%${RegistroActivo}[Tipo]%' and rm.Activo = 1
${selectTipoA}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Descripcion like '%${RegistroActivo}[Tipo]%' and rm.Activo = 1
${countMensajeA}    select count(em.Descripcion) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where em.Descripcion like '%${RegistroActivo}[Mensaje]%' and rm.Activo = 1
${selectMensajeA}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where em.Descripcion like '%${RegistroActivo}[Mensaje]%' and rm.Activo = 1
${countRESiA}    select count(rm.RegistrarEstatus) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.RegistrarEstatus = 1 and rm.Activo = 1
${selectRESiA}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.RegistrarEstatus = 1 and rm.Activo = 1
${countRENoA}    select count(rm.RegistrarEstatus) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.RegistrarEstatus = 0 and rm.Activo = 1
${selectRENoA}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.RegistrarEstatus = 0 and rm.Activo = 1
${countVCSiA}    select count(rm.ValidarCuadrante) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.ValidarCuadrante = 1 and rm.Activo = 1
${selectVCSiA}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.ValidarCuadrante = 1 and rm.Activo = 1
${countVCNoA}    select count(rm.ValidarCuadrante) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.ValidarCuadrante = 0 and rm.Activo = 1
${selectVCNoA}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.ValidarCuadrante = 0 and rm.Activo = 1
${countEstatusA}    select count(rm.Descripcion) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Activo = 1
${selectEstatusA}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Activo = 1

${countTipoI}    select count(rm.Descripcion) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Activo = 0
#${countTipoI}    select count(rm.Descripcion) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Descripcion like '%${RegistroInactivo}[Tipo]%' and rm.Activo = 0
${selectTipoI}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Activo = 0
${countMensajeI}    select count(em.Descripcion) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Activo = 0
#${countMensajeI}    select count(em.Descripcion) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where em.Descripcion like '%${RegistroInactivo}[Mensaje]%' and rm.Activo = 0
${selectMensajeI}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where em.Descripcion like '%${RegistroInactivo}[Mensaje]%' and rm.Activo = 0
${countRESiI}    select count(rm.RegistrarEstatus) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.RegistrarEstatus = 1 and rm.Activo = 0
${selectRESiI}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.RegistrarEstatus = 1 and rm.Activo = 0
${countRENoI}    select count(rm.RegistrarEstatus) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.RegistrarEstatus = 0 and rm.Activo = 0
${selectRENoI}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.RegistrarEstatus = 0 and rm.Activo = 0
${countVCSiI}    select count(rm.ValidarCuadrante) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.ValidarCuadrante = 1 and rm.Activo = 0
${selectVCSiI}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.ValidarCuadrante = 1 and rm.Activo = 0
${countVCNoI}    select count(rm.ValidarCuadrante) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.ValidarCuadrante = 0 and rm.Activo = 0
${selectVCNoI}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.ValidarCuadrante = 0 and rm.Activo = 0
${countEstatusI}    select count(rm.Descripcion) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Activo = 0
${selectEstatusI}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Activo = 0

${countTipo}    select count(rm.Descripcion) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Descripcion like '%${RegistroActivo}[Tipo]%'
${selectTipo}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Descripcion like '%${RegistroActivo}[Tipo]%'
${countMensaje}    select count(em.Descripcion) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where em.Descripcion like '%${RegistroActivo}[Mensaje]%'
${selectMensaje}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where em.Descripcion like '%${RegistroActivo}[Mensaje]%'
${countRESi}    select count(rm.RegistrarEstatus) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.RegistrarEstatus = 1
${selectRESi}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.RegistrarEstatus = 1
${countRENo}    select count(rm.RegistrarEstatus) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.RegistrarEstatus = 0
${selectRENo}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.RegistrarEstatus = 0
${countVCSi}    select count(rm.ValidarCuadrante) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.ValidarCuadrante = 1
${selectVCSi}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.ValidarCuadrante = 1
${countVCNo}    select count(rm.ValidarCuadrante) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.ValidarCuadrante = 0
${selectVCNo}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.ValidarCuadrante = 0
${countEstatus}    select count(rm.Descripcion) from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje
${selectEstatus}    select top 1 rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje

${xpathGrid}    //*[@id="grid"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Grid - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Validar etiquetas y tooltips
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Tipo Reporte
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Tipo Reporte.
    [Tags]    Filtro - Estatus Activo - Campo Tipo Reporte - T134
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Columna 1 y Campo ${RegistroActivo}[Tipo]
    Sleep    1
    Validar resultado contra BD    ${countTipoA}    ${selectTipoA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Estatus Mensaje
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Estatus Mensaje.
    [Tags]    Filtro - Estatus Activo - Campo Estatus Mensaje - T135
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Columna 2 y Campo ${RegistroActivo}[Mensaje]
    Sleep    1
    Validar resultado contra BD    ${countMensajeA}    ${selectMensajeA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Registrar Estatus SI
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Estatus SI.
    [Tags]    Filtro - Estatus Activo - Campo Registrar Estatus SI - T138
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Registrar Estatus    2    #SI
    Sleep    1
    Validar resultado contra BD    ${countRESiA}    ${selectRESiA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Registrar Estatus NO
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Estatus NO.
    [Tags]    Filtro - Estatus Activo - Campo Registrar Estatus NO - T138
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Registrar Estatus    3    #NO
    Sleep    1
    Validar resultado contra BD    ${countRENoA}    ${selectRENoA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Validar Cuadrante SI
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Cuadrante SI.
    [Tags]    Filtro - Estatus Activo - Campo Validar Cuadrante SI - T137
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Validar Cuadrante    2    #SI
    Sleep    1
    Validar resultado contra BD    ${countVCSiA}    ${selectVCSiA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Validar Cuadrante NO
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Cuadrante NO.
    [Tags]    Filtro - Estatus Activo - Campo Validar Cuadrante NO - T137
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Validar Cuadrante    3    #NO
    Sleep    1
    Validar resultado contra BD    ${countVCNoA}    ${selectVCNoA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo
    [Documentation]    Debera mostrar todos los registros Activos.
    [Tags]    Filtro - Estatus Activo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Sleep    1
    Validar resultado contra BD    ${countEstatusA}    ${selectEstatusA}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Tipo Reporte
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado en Tipo Reporte.
    [Tags]    Filtro - Estatus Inactivo - Campo Tipo Reporte
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Estatus    3
    Sleep    1
    Buscar registro    select Descripcion from BDSismep2.Sismep.TSismepTiposReporteM where Activo = '0'
    Filtrar por Columna 1 y Campo ${registro}
    Sleep    1
    Validar resultado contra BD    ${countTipoI}    ${selectTipoI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Estatus Mensaje
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado en Estatus Mensaje.
    [Tags]    Filtro - Estatus Inactivo - Campo Estatus Mensaje
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Estatus    3
    Sleep    1
    Buscar registro    select EM.Descripcion from BDSismep2.Sismep.TSismepTiposReporteM rm left join BDSismep2.Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje=em.IdEstatusMensaje where Activo = '0'
    Filtrar por Columna 2 y Campo ${registro}
    Sleep    1
    Validar resultado contra BD    ${countMensajeI}    ${selectMensajeI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Registrar Estatus SI
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado en Estatus SI.
    [Tags]    Filtro - Estatus Inactivo - Campo Registrar Estatus SI
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Estatus    3
    Filtrar por Registrar Estatus    2    #SI
    Sleep    1
    Validar resultado contra BD    ${countRESiI}    ${selectRESiI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Registrar Estatus NO
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado en Estatus NO.
    [Tags]    Filtro - Estatus Inactivo - Campo Registrar Estatus NO
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Estatus    3
    Filtrar por Registrar Estatus    3    #NO
    Sleep    1
    Validar resultado contra BD    ${countRENoI}    ${selectRENoI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Validar Cuadrante SI
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado en Cuadrante SI.
    [Tags]    Filtro - Estatus Inactivo - Campo Validar Cuadrante SI
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Estatus    3
    Filtrar por Validar Cuadrante    2    #SI
    Sleep    1
    Validar resultado contra BD    ${countVCSiI}    ${selectVCSiI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Validar Cuadrante NO
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado en Cuadrante NO.
    [Tags]    Filtro - Estatus Inactivo - Campo Validar Cuadrante NO
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Estatus    3
    Filtrar por Validar Cuadrante    3    #NO
    Sleep    1
    Validar resultado contra BD    ${countVCNoI}    ${selectVCNoI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo
    [Documentation]    Debera mostrar todos los registros Inactivos.
    [Tags]    Filtro - Estatus Inactivo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Estatus    3
    Sleep    1
    Validar resultado contra BD    ${countEstatusI}    ${selectEstatusI}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Tipo Reporte
    [Documentation]    Debera mostrar Todos los registros que coincidan con lo ingresado en Tipo Reporte.
    [Tags]    Filtro - Estatus Todos - Campo Tipo Reporte
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Estatus    1
    Sleep    1
    Filtrar por Columna 1 y Campo ${RegistroActivo}[Tipo]
    Sleep    1
    Validar resultado contra BD    ${countTipo}    ${selectTipo}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Estatus Mensaje
    [Documentation]    Debera mostrar Todos los registros que coincidan con lo ingresado en Estatus Mensajes.
    [Tags]    Filtro - Estatus Todos - Campo Estatus Mensaje
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Estatus    1
    Sleep    1
    Filtrar por Columna 2 y Campo ${RegistroActivo}[Mensaje]
    Sleep    1
    Validar resultado contra BD    ${countMensaje}    ${selectMensaje}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Registrar Estatus SI
    [Documentation]    Debera mostrar Todos los registros que coincidan con lo ingresado en Estatus SI.
    [Tags]    Filtro - Estatus Todos - Campo Registrar Estatus SI
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Estatus    1
    Filtrar por Registrar Estatus    2    #SI
    Sleep    1
    Validar resultado contra BD    ${countRESi}    ${selectRESi}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Registrar Estatus NO
    [Documentation]    Debera mostrar Todos los registros que coincidan con lo ingresado en Estatus NO.
    [Tags]    Filtro - Estatus Todos - Campo Registrar Estatus NO
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Estatus    1
    Filtrar por Registrar Estatus    3    #NO
    Sleep    1
    Validar resultado contra BD    ${countRENo}    ${selectRENo}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Validar Cuadrante SI
    [Documentation]    Debera mostrar Todos los registros que coincidan con lo ingresado en Cuadrante SI.
    [Tags]    Filtro - Estatus Todos - Campo Validar Cuadrante SI
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Estatus    1
    Filtrar por Validar Cuadrante    2    #SI
    Sleep    1
    Validar resultado contra BD    ${countVCSi}    ${selectVCSi}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Validar Cuadrante NO
    [Documentation]    Debera mostrar Todos los registros que coincidan con lo ingresado en Cuadrante NO.
    [Tags]    Filtro - Estatus Todos - Campo Validar Cuadrante NO
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Estatus    1
    Filtrar por Validar Cuadrante    3    #NO
    Sleep    1
    Validar resultado contra BD    ${countVCNo}    ${selectVCNo}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos
    [Documentation]    Debera mostrar Todos los registros.
    [Tags]    Filtro - Estatus Todos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Estatus    1
    Sleep    1
    Validar resultado contra BD    ${countEstatus}    ${selectEstatus}
    [Teardown]    Close Browser
    
*** Keywords ***
Filtrar por Registrar Estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div
    Click Element    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Filtrar por Validar Cuadrante
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[4]/div/div/div
    Click Element    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[4]/div/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Filtrar por Estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[5]/div/div/div
    Click Element    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[5]/div/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
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
    ${Tipo}=    Get text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${Msj}=    Get text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    ${Mensaje}=    Execute JavaScript    if('${Msj}'==' '){return ${EMPTY}}else{return'${Msj}'};
    ${attrRE}=    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/span/i    class
    ${attrVC}=    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/span/i    class
    ${RE}=    Execute Javascript    if('${attrRE}'=='fas fa-check-circle') {return true} else {return false};
    ${VC}=    Execute Javascript    if('${attrVC}'=='fas fa-check-circle') {return true} else {return false};
    @{queryResults}    Query    ${arg2}
    Should be equal    ${Tipo}    ${queryResults[0][0]}
    Should be equal    ${Mensaje}    ${queryResults[0][1]}
    Should be equal    ${RE}    ${queryResults[0][2]}
    Should be equal    ${VC}    ${queryResults[0][3]}
    Disconnect From Database
    
Validar etiquetas y tooltips
    ${ttNR}    Get Element Attribute    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div    tooltip
    ${ttVD}    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[6]/div    title
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Catálogo de Tipos de Reporte
    Element Text Should Be    xpath=//*[@id="dx-col-10"]/div[2]    Tipo Reporte
    Element Text Should Be    xpath=//*[@id="dx-col-11"]/div[2]    Estatus Mensaje
    Element Text Should Be    xpath=//*[@id="dx-col-12"]/div[3]    Registrar Estatus
    Element Text Should Be    xpath=//*[@id="dx-col-13"]/div[3]    Validar Cuadrante
    Element Text Should Be    xpath=//*[@id="dx-col-14"]/div[3]    Estatus
    Element Text Should Be    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[1]/td[6]/div    Detalle
    Should be equal    ${ttNR}    Nuevo Registro
    Should be equal    ${ttVD}    Ver Detalle

Buscar registro
    [Arguments]   ${query}
    Conexion a Base de Datos
    @{queryResults}    Query    ${query}
    Set Test Variable    ${registro}    ${queryResults[0][0]}
    Disconnect From Database