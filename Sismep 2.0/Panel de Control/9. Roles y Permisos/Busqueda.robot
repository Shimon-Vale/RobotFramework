*** Settings ***
Resource    Recursos.RolesPermisos.robot

*** Variables ***
&{RolActivo}    Nombre=Sistema    Descripcion=Opci
&{RolInactivo}    Nombre=Se    Descripcion=Mar

&{PermisoActivo}    Descripcion=Man    Tipo=Gru    Orden=1
&{PermisoInactivo}    Descripcion=Ga    Tipo=Cat    Orden=8

${countEstatusA}    select count(Activo) from aspnet_Roles where Activo = 1
${selectEstatusA}    select top 1 RoleName, [Description], Activo from aspnet_Roles where Activo = 1
${countNombreA}    select count(RoleName) from aspnet_Roles where RoleName like '%${RolActivo}[Nombre]%' and Activo = 1
${selectNombreA}    select top 1 RoleName, [Description], Activo from aspnet_Roles where RoleName like '%${RolActivo}[Nombre]%' and Activo = 1
${countDescripcionA}    select count([Description]) from aspnet_Roles where [Description] like '%${RolActivo}[Descripcion]%' and Activo = 1
${selectDescripcionA}    select top 1 RoleName, [Description], Activo from aspnet_Roles where [Description] like '%${RolActivo}[Descripcion]%' and Activo = 1

${countEstatusI}    select count(Activo) from aspnet_Roles where Activo = 0
${selectEstatusI}    select top 1 RoleName, [Description], Activo from aspnet_Roles where Activo = 0
${countNombreI}    select count(RoleName) from aspnet_Roles where RoleName like '%${RolInactivo}[Nombre]%' and Activo = 0
${selectNombreI}    select top 1 RoleName, [Description], Activo from aspnet_Roles where RoleName like '%${RolInactivo}[Nombre]%' and Activo = 0
${countDescripcionI}    select count([Description]) from aspnet_Roles where [Description] like '%${RolInactivo}[Descripcion]%' and Activo = 0
${selectDescripcionI}    select top 1 RoleName, [Description], Activo from aspnet_Roles where [Description] like '%${RolInactivo}[Descripcion]%' and Activo = 0

${countEstatus}    select count(Activo) from aspnet_Roles
${selectEstatus}    select top 1 RoleName, [Description], Activo from aspnet_Roles
${countNombre}    select count(RoleName) from aspnet_Roles where RoleName like '%${RolActivo}[Nombre]%'
${selectNombre}    select top 1 RoleName, [Description], Activo from aspnet_Roles where RoleName like '%${RolActivo}[Nombre]%'
${countDescripcion}    select count([Description]) from aspnet_Roles where [Description] like '%${RolActivo}[Descripcion]%'
${selectDescripcion}    select top 1 RoleName, [Description], Activo from aspnet_Roles where [Description] like '%${RolActivo}[Descripcion]%'

${countPEstatusA}    select count(p.Activo) from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Activo = 1
${selectPEstatusA}    select top 1 p.Descripcion, tp.Descripcion, p.Orden, p.Activo from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Activo = 1
${countPDescripcionA}    select count(p.Descripcion) from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Descripcion like '%${PermisoActivo}[Descripcion]%' and p.Activo = 1
${selectPDescripcionA}    select top 1 p.Descripcion, tp.Descripcion, p.Orden, p.Activo from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Descripcion like '%${PermisoActivo}[Descripcion]%' and p.Activo = 1
${countPTipoA}    select count(tp.Descripcion) from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where tp.Descripcion like '%${PermisoActivo}[Tipo]%' and p.Activo = 1
${selectPTipoA}    select top 1 p.Descripcion, tp.Descripcion, p.Orden, p.Activo from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where tp.Descripcion like '%${PermisoActivo}[Tipo]%' and p.Activo = 1
${countPOrdenA}    select count(p.Orden) from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Orden = ${PermisoActivo}[Orden] and p.Activo = 1
${selectPOrdenA}    select top 1 p.Descripcion, tp.Descripcion, p.Orden, p.Activo from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Orden = ${PermisoActivo}[Orden] and p.Activo = 1

${countPEstatusI}    select count(p.Activo) from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Activo = 0
${selectPEstatusI}    select top 1 p.Descripcion, tp.Descripcion, p.Orden, p.Activo from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Activo = 0
${countPDescripcionI}    select count(p.Descripcion) from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Descripcion like '%${PermisoInactivo}[Descripcion]%' and p.Activo = 0
${selectPDescripcionI}    select top 1 p.Descripcion, tp.Descripcion, p.Orden, p.Activo from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Descripcion like '%${PermisoInactivo}[Descripcion]%' and p.Activo = 0
${countPTipoI}    select count(tp.Descripcion) from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where tp.Descripcion like '%${PermisoInactivo}[Tipo]%' and p.Activo = 0
${selectPTipoI}    select top 1 p.Descripcion, tp.Descripcion, p.Orden, p.Activo from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where tp.Descripcion like '%${PermisoInactivo}[Tipo]%' and p.Activo = 0
${countPOrdenI}    select count(p.Orden) from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Orden = ${PermisoInactivo}[Orden] and p.Activo = 0
${selectPOrdenI}    select top 1 p.Descripcion, tp.Descripcion, p.Orden, p.Activo from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Orden = ${PermisoInactivo}[Orden] and p.Activo = 0

${countPEstatus}    select count(p.Activo) from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso
${selectPEstatus}    select top 1 p.Descripcion, tp.Descripcion, p.Orden, p.Activo from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso
${countPDescripcion}    select count(p.Descripcion) from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Descripcion like '%${PermisoActivo}[Descripcion]%'
${selectPDescripcion}    select top 1 p.Descripcion, tp.Descripcion, p.Orden, p.Activo from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Descripcion like '%${PermisoActivo}[Descripcion]%'
${countPTipo}    select count(tp.Descripcion) from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where tp.Descripcion like '%${PermisoActivo}[Tipo]%'
${selectPTipo}    select top 1 p.Descripcion, tp.Descripcion, p.Orden, p.Activo from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where tp.Descripcion like '%${PermisoActivo}[Tipo]%'
${countPOrden}    select count(p.Orden) from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Orden = ${PermisoActivo}[Orden]
${selectPOrden}    select top 1 p.Descripcion, tp.Descripcion, p.Orden, p.Activo from Sismep.TSismepPermisos p join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where p.Orden = ${PermisoActivo}[Orden]

${xpathGrid}    //*[@id="dataGrid"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid Roles - Validar etiquetas
    [Documentation]    Debera mostrar correctamente escritas las etiquetas.
    [Tags]    Grid Roles - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Sleep    1
    Validar etiquetas Roles
    [Teardown]    Close Browser
    
Filtro Roles - Estatus Activo
    [Documentation]    Debera mostrar los registros Activos.
    [Tags]    Filtro Roles - Estatus Activo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Sleep    1
    Validar resultado Roles contra BD    ${countEstatusA}    ${selectEstatusA}
    [Teardown]    Close Browser
    
Filtro Roles - Estatus Activo - Nombre Rol
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Nombre Rol.
    [Tags]    Filtro Roles - Estatus Activo - Nombre Rol
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Filtrar por Columna 1 y Campo ${RolActivo}[Nombre]
    Sleep    1
    Validar resultado Roles contra BD    ${countNombreA}    ${selectNombreA}
    [Teardown]    Close Browser
    
Filtro Roles - Estatus Activo - Descripcion
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro Roles - Estatus Activo - Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Filtrar por Columna 2 y Campo ${RolActivo}[Descripcion]
    Sleep    1
    Validar resultado Roles contra BD    ${countDescripcionA}    ${selectDescripcionA}
    [Teardown]    Close Browser
    
Filtro Roles - Estatus Inactivo
    [Documentation]    Debera mostrar todos los registros Inactivos.
    [Tags]    Filtro Roles - Estatus Inactivo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Filtrar por Estatus    3    ${Inactivo}
    Sleep    1
    Validar resultado Roles contra BD    ${countEstatusI}    ${selectEstatusI}
    [Teardown]    Close Browser
    
Filtro Roles - Estatus Inactivo - Nombre Rol
    [Documentation]    Debera mostrar los registros Inactivo que coincidan con lo ingresado en Nombre Rol.
    [Tags]    Filtro Roles - Estatus Inactivo - Nombre Rol
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Filtrar por Estatus    3    ${Inactivo}
    Filtrar por Columna 1 y Campo ${RolInactivo}[Nombre]
    Sleep    1
    Validar resultado Roles contra BD    ${countNombreI}    ${selectNombreI}
    [Teardown]    Close Browser
    
Filtro Roles - Estatus Inactivo - Descripcion
    [Documentation]    Debera mostrar los registros Inactivo que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro Roles - Estatus Inactivo - Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Filtrar por Estatus    3    ${Inactivo}
    Filtrar por Columna 2 y Campo ${RolInactivo}[Descripcion]
    Sleep    1
    Validar resultado Roles contra BD    ${countDescripcionI}    ${selectDescripcionI}
    [Teardown]    Close Browser
    
Filtro Roles - Estatus Todos
    [Documentation]    Debera mostrar todos los registros.
    [Tags]    Filtro Roles - Estatus Todos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Filtrar por Estatus    3    ${Todos}
    Sleep    1
    Validar resultado Roles contra BD    ${countEstatus}    ${selectEstatus}
    [Teardown]    Close Browser
    
Filtro Roles - Estatus Todos - Nombre Rol
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en Nombre Rol.
    [Tags]    Filtro Roles - Estatus Todos - Nombre Rol
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Filtrar por Estatus    3    ${Todos}
    Filtrar por Columna 1 y Campo ${RolActivo}[Nombre]
    Sleep    1
    Validar resultado Roles contra BD    ${countNombre}    ${selectNombre}
    [Teardown]    Close Browser
    
Filtro Roles - Estatus Todos - Descripcion
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro Roles - Estatus Todos - Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Filtrar por Estatus    3    ${Todos}
    Filtrar por Columna 2 y Campo ${RolActivo}[Descripcion]
    Sleep    1
    Validar resultado Roles contra BD    ${countDescripcion}    ${selectDescripcion}
    [Teardown]    Close Browser
    
Grid Permisos - Validar etiquetas
    [Documentation]    Debera mostrar correctamente escritas las etiquetas.
    [Tags]    Grid Permisos - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Sleep    1
    Validar etiquetas Permisos
    [Teardown]    Close Browser
    
Filtro Permisos - Estatus Activo
    [Documentation]    Debera mostrar los registros Activos.
    [Tags]    Filtro Permisos - Estatus Activo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Sleep    1
    Validar resultado Permisos contra BD    ${countPEstatusA}    ${selectPEstatusA}
    [Teardown]    Close Browser
    
Filtro Permisos - Estatus Activo - Descripcion
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro Permisos - Estatus Activo - Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Filtrar por Columna 1 y Campo ${PermisoActivo}[Descripcion]
    Sleep    1
    Validar resultado Permisos contra BD    ${countPDescripcionA}    ${selectPDescripcionA}
    [Teardown]    Close Browser
    
Filtro Permisos - Estatus Activo - Tipo
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Tipo.
    [Tags]    Filtro Permisos - Estatus Activo - Tipo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Filtrar por Columna 2 y Campo ${PermisoActivo}[Tipo]
    Sleep    1
    Validar resultado Permisos contra BD    ${countPTipoA}    ${selectPTipoA}
    [Teardown]    Close Browser
    
Filtro Permisos - Estatus Activo - Orden
    [Documentation]    Debera mostrar los registros Activos que coincidan con lo ingresado en Orden.
    [Tags]    Filtro Permisos - Estatus Activo - Orden
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Filtrar por Columna 3 y Campo ${PermisoActivo}[Orden]
    Sleep    1
    Validar resultado Permisos contra BD    ${countPOrdenA}    ${selectPOrdenA}
    [Teardown]    Close Browser
    
Filtro Permisos - Estatus Inactivo
    [Documentation]    Debera mostrar los registros Inactivos.
    [Tags]    Filtro Permisos - Estatus Inactivo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Filtrar por Estatus    4    ${Inactivo}
    Sleep    1
    Validar resultado Permisos contra BD    ${countPEstatusI}    ${selectPEstatusI}
    [Teardown]    Close Browser
    
Filtro Permisos - Estatus Inactivo - Descripcion
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro Permisos - Estatus Inactivo - Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Filtrar por Estatus    4    ${Inactivo}
    Filtrar por Columna 1 y Campo ${PermisoInactivo}[Descripcion]
    Sleep    1
    Validar resultado Permisos contra BD    ${countPDescripcionI}    ${selectPDescripcionI}
    [Teardown]    Close Browser
    
Filtro Permisos - Estatus Inactivo - Tipo
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado en Tipo.
    [Tags]    Filtro Permisos - Estatus Inactivo - Tipo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Filtrar por Estatus    4    ${Inactivo}
    Filtrar por Columna 2 y Campo ${PermisoInactivo}[Tipo]
    Sleep    1
    Validar resultado Permisos contra BD    ${countPTipoI}    ${selectPTipoI}
    [Teardown]    Close Browser
    
Filtro Permisos - Estatus Inactivo - Orden
    [Documentation]    Debera mostrar los registros Inactivos que coincidan con lo ingresado en Orden.
    [Tags]    Filtro Permisos - Estatus Inactivo - Orden
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Filtrar por Estatus    4    ${Inactivo}
    Filtrar por Columna 3 y Campo ${PermisoInactivo}[Orden]
    Sleep    1
    Validar resultado Permisos contra BD    ${countPOrdenI}    ${selectPOrdenI}
    [Teardown]    Close Browser
    
Filtro Permisos - Estatus Todos
    [Documentation]    Debera mostrar todos los registros.
    [Tags]    Filtro Permisos - Estatus Todos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Filtrar por Estatus    4    ${Todos}
    Sleep    1
    Validar resultado Permisos contra BD    ${countPEstatus}    ${selectPEstatus}
    [Teardown]    Close Browser
    
Filtro Permisos - Estatus Todos - Descripcion
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en Descripcion.
    [Tags]    Filtro Permisos - Estatus Todos - Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Filtrar por Estatus    4    ${Todos}
    Filtrar por Columna 1 y Campo ${PermisoActivo}[Descripcion]
    Sleep    1
    Validar resultado Permisos contra BD    ${countPDescripcion}    ${selectPDescripcion}
    [Teardown]    Close Browser
    
Filtro Permisos - Estatus Todos - Tipo
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en Tipo.
    [Tags]    Filtro Permisos - Estatus Todos - Tipo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Filtrar por Estatus    4    ${Todos}
    Filtrar por Columna 2 y Campo ${PermisoActivo}[Tipo]
    Sleep    1
    Validar resultado Permisos contra BD    ${countPTipo}    ${selectPTipo}
    [Teardown]    Close Browser
    
Filtro Permisos - Estatus Todos - Orden
    [Documentation]    Debera mostrar todos los registros que coincidan con lo ingresado en Orden.
    [Tags]    Filtro Permisos - Estatus Todos - Orden
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Filtrar por Estatus    4    ${Todos}
    Filtrar por Columna 3 y Campo ${PermisoActivo}[Orden]
    Sleep    1
    Validar resultado Permisos contra BD    ${countPOrden}    ${selectPOrden}
    [Teardown]    Close Browser
    
*** Keywords ***
Validar etiquetas Roles
    ${ttNR}=    Get Element Attribute    xpath=//*[@id="Panelroles"]/div/div[1]/div[2]/div[1]    tooltip
    ${ttCP}=    Get Element Attribute    xpath=//*[@id="Panelroles"]/div/div[1]/div[2]/div[2]    tooltip
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div    title
    Element Text Should Be    xpath=//*[@id="Panelroles"]/div/div[1]/div[1]/h4    Cat\u00E1logo de Roles y Permisos
    Element Text Should Be    xpath=//*[@id="dx-col-13"]/div[2]    Nombre Rol
    Element Text Should Be    xpath=//*[@id="dx-col-14"]/div[2]    Descripci\u00F3n
    Element Text Should Be    xpath=//*[@id="dx-col-15"]/div[3]    Estatus
    Element Text Should Be    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[1]/td[4]/div    Detalle
    Should be equal    ${ttNR}    Nuevo Registro
    Should be equal    ${ttCP}    Cat\u00E1logo de Permisos
    Should be equal    ${ttVD}    Ver Detalle
    
Validar etiquetas Permisos
    ${ttNR}=    Get Element Attribute    xpath=//*[@id="Panelroles"]/div/div[1]/div[2]/div[1]    tooltip
    ${ttCR}=    Get Element Attribute    xpath=//*[@id="Panelroles"]/div/div[1]/div[2]/div[2]    tooltip
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[5]/div    title
    Element Text Should Be    xpath=//*[@id="Panelroles"]/div/div[1]/div[1]/h4    Cat\u00E1logo de Permisos
    Element Text Should Be    xpath=//*[@id="dx-col-5"]/div[2]    Descripci\u00F3n
    Element Text Should Be    xpath=//*[@id="dx-col-6"]/div[2]    Tipo de Permiso
    Element Text Should Be    xpath=//*[@id="dx-col-7"]/div[2]    Orden
    Element Text Should Be    xpath=//*[@id="dx-col-8"]/div[3]    Estatus
    Element Text Should Be    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[1]/td[5]/div    Detalle
    Should be equal    ${ttNR}    Nuevo Registro
    Should be equal    ${ttCR}    Cat\u00E1logo de Roles
    Should be equal    ${ttVD}    Ver Detalle
    
Validar resultado Roles contra BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${gridNombreRol}=    Get text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${gridDescripcion}=    Get text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    @{queryResults}    Query    ${arg2}
    Should be equal    ${gridNombreRol}    ${queryResults[0][0]}
    Should be equal    ${gridDescripcion}    ${queryResults[0][1]}
    Disconnect From Database
    
Validar resultado Permisos contra BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${gridDescripcion}=    Get text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${gridTipo}=    Get text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    ${gridOdn}=    Get text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]
    ${gridOrden}=    Convert To Integer    ${gridOdn}
    @{queryResults}    Query    ${arg2}
    Should be equal    ${gridDescripcion}    ${queryResults[0][0]}
    Should be equal    ${gridTipo}    ${queryResults[0][1]}
    Should be equal    ${gridOrden}    ${queryResults[0][2]}
    Disconnect From Database