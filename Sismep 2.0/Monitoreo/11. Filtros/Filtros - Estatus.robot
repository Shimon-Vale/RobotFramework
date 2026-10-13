*** Settings ***
Resource    ../../Recursos.Generales.robot
Resource    Recursos.Filtros.robot

*** Variables ***
${AvisoPescaProhibida}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[1]/div[1]/div
${AvisoZonaProhibida}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[2]/div[1]/div
${Ciclados}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[3]/div[1]/div
${Conectado}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[4]/div[1]/div
${Desconectado}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[5]/div[1]/div
${Emergencia}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[6]/div[1]/div
${EnPuerto}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[7]/div[1]/div
${EnZona}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[8]/div[1]/div
${EntradaAPuerto}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[9]/div[1]/div
${FueraDePuerto}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[10]/div[1]/div
${Mantenimiento}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[11]/div[1]/div
${MensajeDeTexto}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[12]/div[1]/div
${MultiplesPermisos}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[13]/div[1]/div
${Normal}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[14]/div[1]/div
${PermisoVencido}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[15]/div[1]/div
${PescaProhibidaCedula}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[16]/div[1]/div
${ProximidadAEmbarcaciones}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[17]/div[1]/div
${SalidaDePuerto}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[18]/div[1]/div
${Todos}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[19]/div[1]/div
${TxIrregular}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[20]/div[1]/div
${TecnicamentePescando}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[21]/div[1]/div
${ZonaDecreto}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[22]/div[1]/div
${ZonaProhibidaCedula}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[23]/div[1]/div

*** Test Cases ***
Estatus - Aviso Pesca Prohibida
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Aviso Pesca Prohibida.
    [Tags]    Estatus - Aviso Pesca Prohibida - T337
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${AvisoPescaProhibida}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Aviso Pesca Prohibida
    [Teardown]    Close Browser

Estatus - Aviso Zona Prohibida
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Aviso Zona Prohibida.
    [Tags]    Estatus - Aviso Zona Prohibida - T335
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${AvisoZonaProhibida}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Aviso Zona Prohibida
    [Teardown]    Close Browser

Estatus - Ciclados
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Ciclados.
    [Tags]    Estatus - Ciclados
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${Ciclados}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Ciclado
    [Teardown]    Close Browser

Estatus - Conectado
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Conectado.
    [Tags]    Estatus - Conectado - T352
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${Conectado}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Conectado
    [Teardown]    Close Browser

Estatus - Desconectado
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Desconectado.
    [Tags]    Estatus - Desconectado - T343
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${Desconectado}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Bateria de Respaldo
    [Teardown]    Close Browser

Estatus - Emergencia
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Emergencia.
    [Tags]    Estatus - Emergencia - T353
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${Emergencia}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Emergencia
    [Teardown]    Close Browser

Estatus - En Puerto
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus En Puerto.
    [Tags]    Estatus - En Puerto - T350
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${EnPuerto}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    En Puerto
    [Teardown]    Close Browser

Estatus - En Zona
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus En Zona.
    [Tags]    Estatus - En Zona - T351
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${EnZona}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD2    En Zona
    [Teardown]    Close Browser

Estatus - Entrada a Puerto
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus a Puerto.
    [Tags]    Estatus - Entrada a Puerto
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${EntradaAPuerto}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD2    Entrada a puerto
    [Teardown]    Close Browser

Estatus - Fuera de Puerto
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Fuera de Puerto.
    [Tags]    Estatus - Fuera de Puerto 
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${FueraDePuerto}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD - Fuera de Puerto
    [Teardown]    Close Browser

Estatus - Mantenimiento
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Mantenimiento.
        ...    PENDIENTE - Validar script de consulta a la BD
    [Tags]    Estatus - Mantenimiento 
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${Mantenimiento}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Mantenimiento
    [Teardown]    Close Browser

Estatus - Mensaje de Texto
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Mensaje de Texto.
    [Tags]    Estatus - Mensaje de Texto - 346
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${MensajeDeTexto}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Mensaje de Texto
    [Teardown]    Close Browser

Estatus - Multiples Permisos
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Multiples Permisos.
    [Tags]    Estatus - Multiples Permisos - T345
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${MultiplesPermisos}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    M\u00FAltiples Permisos
    [Teardown]    Close Browser

Estatus - Normal
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Normal
    [Tags]    Estatus - Normal - T341
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${Normal}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD2    Normal
    [Teardown]    Close Browser

Estatus - Permiso vencido
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Permiso vencido.
    [Tags]    Estatus - Permiso vencido - T348
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${PermisoVencido}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Permiso Vencido
    [Teardown]    Close Browser

Estatus - Pesca Prohibida - Cedula
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Pesca Prohibida - Cedula.
    [Tags]    Estatus - Pesca Prohibida - Cedula - T349
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${PescaProhibidaCedula}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Pesca Prohibida
    [Teardown]    Close Browser

Estatus - Proximidad a Embarcaciones
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Proximidad a Embarcaciones.
    [Tags]    Estatus - Proximidad a Embarcaciones - T344
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Filtrar por: ${ProximidadAEmbarcaciones}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Proximidad a Embarcaciones
    [Teardown]    Close Browser

Estatus - Salida de Puerto
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Salida de Puerto.
    [Tags]    Estatus - Salida de Puerto - T347
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Deslizar scroll
    Filtrar por: ${SalidaDePuerto}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD2    Salida de Puerto
    [Teardown]    Close Browser

Estatus - TODOS
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus TODOS.
    [Tags]    Estatus - TODOS
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Deslizar scroll
    Filtrar por: ${Todos}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD - TODOS
    [Teardown]    Close Browser

Estatus - Tx Irregular
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Tx Irregular.
    [Tags]    Estatus - Tx Irregular - T338
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Deslizar scroll
    Filtrar por: ${TxIrregular}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD - Tx Irregular
    [Teardown]    Close Browser

Estatus - Tecnicamente Pescando
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Tecnicamente Pescando.
    [Tags]    Estatus - Tecnicamente Pescando - T340
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Deslizar scroll
    Filtrar por: ${TecnicamentePescando}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    T\u00E9cnicamente Pescando
    [Teardown]    Close Browser

Estatus - Zona Decreto
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Zona Decreto.
    [Tags]    Estatus - Zona Decreto - T334
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Deslizar scroll
    Filtrar por: ${ZonaDecreto}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Zona Decreto
    [Teardown]    Close Browser

Estatus - Zona Prohibida Cedula
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Estatus Zona Prohibida Cedula.
    [Tags]    Estatus - Zona Prohibida Cedula - T336
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Estatus
    Sleep    1
    Deslizar scroll
    Filtrar por: ${ZonaProhibidaCedula}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Zona Prohibida
    [Teardown]    Close Browser

*** Keywords ***
Validar en BD
    [Arguments]    ${arg1}
    Obtener el numero de registros en el grid
    Conexion a Base de Datos
    @{queryRows}    Query    select count(df.IdEstatusMensaje) from Sismep.TSismepMensajesDFoto df join Sismep.TSismepEstatusMensajes em on df.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepMensajesMFoto mf on df.IdMensaje = mf.IdMensajeM join Sismep.TSismepVehiculos v on mf.idvehiculo = v.idvehiculo and v.Activo=1 where em.Descripcion = '${arg1}'
    Should be equal    ${queryRows[0][0]}    ${numemb}
    Disconnect From Database

Validar en BD2
    [Arguments]    ${arg1}
    Obtener el numero de registros en el grid
    Conexion a Base de Datos
    @{queryRows}    Query    select count(mf.IdEstatusMensaje) from Sismep.TSismepMensajesMFoto mf left join Sismep.TSismepMensajesDFoto df on mf.IdMensajeM = df.IdMensaje and mf.IdEstatusMensaje = df.IdEstatusMensaje join Sismep.TSismepEstatusMensajes em1 on mf.IdEstatusMensaje = em1.IdEstatusMensaje left join Sismep.TSismepEstatusMensajes em2 on df.IdEstatusMensaje = em2.IdEstatusMensaje join Sismep.TSismepVehiculos v on mf.IdVehiculo = v.IdVehiculo where em1.Descripcion = '${arg1}'
    Should be equal    ${queryRows[0][0]}    ${numemb}
    Disconnect From Database
    
Validar en BD - Fuera de Puerto
    Obtener el numero de registros en el grid
    ${username}    Get Text    xpath=//*[@id="navbarDropdown"]
    Conexion a Base de Datos
    @{queryUserId}    Query    select UserId from aspnet_Users where UserName='${username}'
    @{query1}    Query    select count(v.IdVehiculo) from Sismep.TSismepVehiculos v with(nolock) inner join Sismep.FnRegresaPermisoVehiculoTodos('${queryUserId[0][0]}') pu on v.IdVehiculo = pu.IdVehiculo inner join Sismep.TSismepMensajesMFoto m on m.IdVehiculo = v.IdVehiculo where v.Activo = 1
    @{query2}    Query    select count(mf.IdEstatusMensaje) from Sismep.TSismepMensajesMFoto mf left join Sismep.TSismepMensajesDFoto df on mf.IdMensajeM = df.IdMensaje join Sismep.TSismepEstatusMensajes em1 on mf.IdEstatusMensaje = em1.IdEstatusMensaje left join Sismep.TSismepEstatusMensajes em2 on df.IdEstatusMensaje = em2.IdEstatusMensaje join Sismep.TSismepVehiculos v on mf.IdVehiculo = v.IdVehiculo where em2.Descripcion = 'En Puerto'
    ${fuerapuerto}=    Evaluate    ${query1[0][0]}-${query2[0][0]}
    Should Be Equal    ${fuerapuerto}    ${numemb}
    Disconnect From Database
    
Validar en BD - TODOS
    Obtener el numero de registros en el grid
    ${username}    Get Text    xpath=//*[@id="navbarDropdown"]
    Conexion a Base de Datos
    @{queryUserId}    Query    select UserId from aspnet_Users where UserName='${username}'
    @{queryResults}    Query    select count(v.IdVehiculo) from Sismep.TSismepVehiculos v with(nolock) inner join Sismep.FnRegresaPermisoVehiculoTodos('${queryUserId[0][0]}') pu on v.IdVehiculo = pu.IdVehiculo inner join Sismep.TSismepMensajesMFoto m on m.IdVehiculo = v.IdVehiculo where v.Activo = 1
    Should Be Equal    ${queryResults[0][0]}    ${numemb}
    Disconnect From Database
    
Validar en BD - Tx Irregular
    Obtener el numero de registros en el grid
    Conexion a Base de Datos
    @{queryRows}    Query    select count(mf.IdVehiculo) from Sismep.TSismepMensajesMFoto mf join Sismep.ATSismepTxIrregular tx on mf.IdVehiculo = tx.IdVehicle
    Should be equal    ${queryRows[0][0]}    ${numemb}
    Disconnect From Database
    
Deslizar scroll
    Execute JavaScript    window.document.evaluate('/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[17]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[17]    timeout=15