*** Settings ***
Resource    Recursos.Usuarios.robot

*** Variables ***
&{RegistroActivo}    Cliente=Astrum    Nombre=Administrador    Usuario=7x24    Correo=enrique.garcia@astrum.com.mx
&{RegistroInactivo}    Cliente=Astrum    Nombre=Monitoreo de pangas    Usuario=veracruz    Correo=enrique.garcia@astrum.com.mx

${countClienteA}    select count(c.Nombre) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where c.Nombre = '${RegistroActivo}[Cliente]' and u.Activo = 1
${selectClienteA}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where c.Nombre = '${RegistroActivo}[Cliente]' and u.Activo = 1
${countNombreA}    select count(u.Nombre) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.Nombre = '${RegistroActivo}[Nombre]' and u.Activo = 1
${selectNombreA}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.Nombre = '${RegistroActivo}[Nombre]' and u.Activo = 1
${countUsuarioA}    select count(u.UserName) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.UserName = '${RegistroActivo}[Usuario]' and u.Activo = 1
${selectUsuarioA}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.UserName = '${RegistroActivo}[Usuario]' and u.Activo = 1
${countCorreoA}    select count(ms.Email) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where ms.Email = '${RegistroActivo}[Correo]' and u.Activo = 1
${selectCorreoA}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where ms.Email = '${RegistroActivo}[Correo]' and u.Activo = 1 order by c.Nombre
${countEstatusA}    select count(c.Nombre) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.Activo = 1
${selectEstatusA}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.Activo = 1 order by u.Nombre

${countClienteI}    select count(c.Nombre) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where c.Nombre = '${RegistroInactivo}[Cliente]' and u.Activo = 0
${selectClienteI}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where c.Nombre = '${RegistroInactivo}[Cliente]' and u.Activo = 0 order by c.Nombre
${countNombreI}    select count(u.Nombre) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.Nombre = '${RegistroInactivo}[Nombre]' and u.Activo = 0
${selectNombreI}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.Nombre = '${RegistroInactivo}[Nombre]' and u.Activo = 0
${countUsuarioI}    select count(u.UserName) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.UserName = '${RegistroInactivo}[Usuario]' and u.Activo = 0
${selectUsuarioI}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.UserName = '${RegistroInactivo}[Usuario]' and u.Activo = 0
${countCorreoI}    select count(ms.Email) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where ms.Email = '${RegistroInactivo}[Correo]' and u.Activo = 0
${selectCorreoI}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where ms.Email = '${RegistroInactivo}[Correo]' and u.Activo = 0 order by u.Nombre
${countEstatusI}    select count(c.Nombre) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.Activo = 0
${selectEstatusI}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.Activo = 0 order by u.Nombre

${countCliente}    select count(c.Nombre) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where c.Nombre = '${RegistroActivo}[Cliente]'
${selectCliente}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where c.Nombre = '${RegistroActivo}[Cliente]' order by u.Nombre
${countNombre}    select count(u.Nombre) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.Nombre = '${RegistroActivo}[Nombre]'
${selectNombre}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.Nombre = '${RegistroActivo}[Nombre]'
${countUsuario}    select count(u.UserName) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.UserName = '${RegistroActivo}[Usuario]'
${selectUsuario}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where u.UserName = '${RegistroActivo}[Usuario]'
${countCorreo}    select count(ms.Email) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where ms.Email = '${RegistroActivo}[Correo]'
${selectCorreo}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente where ms.Email = '${RegistroActivo}[Correo]' order by u.Nombre
${countEstatus}    select count(c.Nombre) from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente
${selectEstatus}    select top 1 c.Nombre, u.Nombre, u.UserName, ms.Email from aspnet_Users u left join aspnet_Membership ms on u.UserId = ms.UserId join Sismep.TSismepClientes c on u.IdCliente = c.IdCliente order by u.Nombre

${xpathGrid}    //*[@id="gridUsuarios"]/div/div[11]/div/div[1]
${colNombreCompleto}    //*[@id="dx-col-25"]

*** Test Cases ***
Grid - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Grid - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Validar etiquetas y tooltips
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Cliente
    [Documentation]    Debera mostrar los resultados que coincidan con lo ingresado en el campo Cliente.
    [Tags]    Filtro - Estatus Activo - Campo Cliente - T207
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Filtrar por Columna 1 y Campo ${RegistroActivo}[Cliente]
    Sleep    1
    Presionar Orden por    ${colNombreCompleto}
    Sleep    0.5
    Validar resultado contra BD    ${countClienteA}    ${selectClienteA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Nombre Completo
    [Documentation]    Debera mostrar los resultados que coincidan con lo ingresado en el campo Nombre.
    [Tags]    Filtro - Estatus Activo - Campo Nombre Completo - T208
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Filtrar por Columna 2 y Campo ${RegistroActivo}[Nombre]
    Sleep    1
    Validar resultado contra BD    ${countNombreA}    ${selectNombreA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Usuario
    [Documentation]    Debera mostrar los resultados que coincidan con lo ingresado en el campo Usuario.
    [Tags]    Filtro - Estatus Activo - Campo Usuario - T206
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Filtrar por Columna 3 y Campo ${RegistroActivo}[Usuario]
    Sleep    1
    Validar resultado contra BD    ${countUsuarioA}    ${selectUsuarioA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo - Campo Correo
    [Documentation]    Debera mostrar los resultados que coincidan con lo ingresado en el campo Correo.
    [Tags]    Filtro - Estatus Activo - Campo Correo - T209
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Filtrar por Columna 4 y Campo ${RegistroActivo}[Correo]
    Sleep    1
    Presionar Orden por    ${colNombreCompleto}
    Sleep    0.5
    Validar resultado contra BD    ${countCorreoA}    ${selectCorreoA}
    [Teardown]    Close Browser
    
Filtro - Estatus Activo
    [Documentation]    Debera mostrar los registros que se encuentren con Estatus Activo.
    [Tags]    Filtro - Estatus Activo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Presionar Orden por    ${colNombreCompleto}
    Sleep    0.5
    Validar resultado contra BD    ${countEstatusA}    ${selectEstatusA}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Cliente
    [Documentation]    Debera mostrar los resultados que coincidan con lo ingresado 
        ...    en el campo Cliente y su estatus sea Inactivo.
    [Tags]    Filtro - Estatus Inactivo - Campo Cliente
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Filtrar por Estatus    3
    Filtrar por Columna 1 y Campo ${RegistroInactivo}[Cliente]
    Sleep    1
    Presionar Orden por    ${colNombreCompleto}
    Sleep    0.5
    Validar resultado contra BD    ${countClienteI}    ${selectClienteI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Nombre Completo
    [Documentation]    Debera mostrar los resultados que coincidan con lo ingresado 
        ...    en el campo Nombre Completo y su estatus sea Inactivo.
    [Tags]    Filtro - Estatus Inactivo - Campo Nombre Completo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Filtrar por Estatus    3
    Filtrar por Columna 2 y Campo ${RegistroInactivo}[Nombre]
    Sleep    1
    Validar resultado contra BD    ${countNombreI}    ${selectNombreI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Usuario
    [Documentation]    Debera mostrar los resultados que coincidan con lo ingresado 
        ...    en el campo Usuario y su estatus sea Inactivo.
    [Tags]    Filtro - Estatus Inactivo - Campo Usuario
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Filtrar por Estatus    3
    Filtrar por Columna 3 y Campo ${RegistroInactivo}[Usuario]
    Sleep    1
    Validar resultado contra BD    ${countUsuarioI}    ${selectUsuarioI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo - Campo Correo
    [Documentation]    Debera mostrar los resultados que coincidan con lo ingresado 
        ...    en el campo Correo y su estatus sea Inactivo.
    [Tags]    Filtro - Estatus Inactivo - Campo Correo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Filtrar por Estatus    3
    Filtrar por Columna 4 y Campo ${RegistroInactivo}[Correo]
    Sleep    1
    Presionar Orden por    ${colNombreCompleto}
    Sleep    0.5
    Validar resultado contra BD    ${countCorreoI}    ${selectCorreoI}
    [Teardown]    Close Browser
    
Filtro - Estatus Inactivo
    [Documentation]    Debera mostrar los registros que se encuentren con Estatus Inactivo
    [Tags]    Filtro - Estatus Inactivo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Filtrar por Estatus    3
    Sleep    1
    Presionar Orden por    ${colNombreCompleto}
    Sleep    0.5
    Validar resultado contra BD    ${countEstatusI}    ${selectEstatusI}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Cliente
    [Documentation]    Debera mostrar todos resultados que coincidan con lo ingresado 
        ...    en el campo Cliente ya sean activos o inactivos. 
    [Tags]    Filtro - Estatus Todos - Campo Cliente
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Filtrar por Estatus    1
    Filtrar por Columna 1 y Campo ${RegistroActivo}[Cliente]
    Sleep    1
    Presionar Orden por    ${colNombreCompleto}
    Sleep    0.5
    Validar resultado contra BD    ${countCliente}    ${selectCliente}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Nombre Completo
    [Documentation]    Debera mostrar todos resultados que coincidan con lo ingresado 
        ...    en el campo Nombre Completo ya sean activos o inactivos. 
    [Tags]    Filtro - Estatus Todos - Campo Nombre Completo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Filtrar por Estatus    1
    Filtrar por Columna 2 y Campo ${RegistroActivo}[Nombre]
    Sleep    1
    Validar resultado contra BD    ${countNombre}    ${selectNombre}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Usuario
    [Documentation]    Debera mostrar todos resultados que coincidan con lo ingresado 
        ...    en el campo Usuario ya sean activos o inactivos. 
    [Tags]    Filtro - Estatus Todos - Campo Usuario
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Filtrar por Estatus    1
    Filtrar por Columna 3 y Campo ${RegistroActivo}[Usuario]
    Sleep    1
    Validar resultado contra BD    ${countUsuario}    ${selectUsuario}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos - Campo Correo
    [Documentation]    Debera mostrar todos resultados que coincidan con lo ingresado 
        ...    en el campo Correo ya sean activos o inactivos. 
    [Tags]    Filtro - Estatus Todos - Campo Correo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Filtrar por Estatus    1
    Filtrar por Columna 4 y Campo ${RegistroActivo}[Correo]
    Sleep    1
    Presionar Orden por    ${colNombreCompleto}
    Sleep    0.5
    Validar resultado contra BD    ${countCorreo}    ${selectCorreo}
    [Teardown]    Close Browser
    
Filtro - Estatus Todos
    [Documentation]    Debera mostrar todos los resultados ya sean activos o inactivos. 
    [Tags]    Filtro - Estatus Todos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Usuarios
    Filtrar por Estatus    1
    Sleep    1
    Presionar Orden por    ${colNombreCompleto}
    Sleep    0.5
    Validar resultado contra BD    ${countEstatus}    ${selectEstatus}
    [Teardown]    Close Browser
    
*** Keywords ***
Validar resultado contra BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${Cliente}=    Get text    xpath=//*[@id="gridUsuarios"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${Nombre}=    Get text    xpath=//*[@id="gridUsuarios"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    ${Usuario}=    Get text    xpath=//*[@id="gridUsuarios"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]
    ${Correo}=    Get text    xpath=//*[@id="gridUsuarios"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]
    @{queryResults}    Query    ${arg2}
    Should be equal    ${Cliente}    ${queryResults[0][0]}
    Should be equal    ${Nombre}    ${queryResults[0][1]}
    Should be equal    ${Usuario}    ${queryResults[0][2]}
    Should be equal    ${Correo}    ${queryResults[0][3]}
    Disconnect From Database
    
Validar etiquetas y tooltips
    ${ttNR}=    Get Element Attribute    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div    tooltip
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="gridUsuarios"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[6]/div    title
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[1]    Catálogo de Usuarios
    Element Text Should Be    xpath=//*[@id="dx-col-24"]/div[2]    Cliente
    Element Text Should Be    xpath=//*[@id="dx-col-25"]/div[2]    Nombre Completo
    Element Text Should Be    xpath=//*[@id="dx-col-26"]/div[2]    Usuario
    Element Text Should Be    xpath=//*[@id="dx-col-27"]/div[2]    Correo
    Element Text Should Be    xpath=//*[@id="dx-col-28"]/div[3]    Estatus
    Element Text Should Be    xpath=//*[@id="gridUsuarios"]/div/div[5]/div/table/tbody/tr[1]/td[6]/div    Detalle
    Should be equal    ${ttNR}    Nuevo Registro
    Should be equal    ${ttVD}    Ver Detalle