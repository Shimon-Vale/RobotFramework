*** Settings ***
Resource    Recursos.EstatusEmbarcacion.robot

*** Variables ***
&{EM}    Tipo=Pantalla    Mensaje=Zona    Tiempo=30    Prioridad=1

${countTodos}    select count(em.Descripcion) from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle
${selectTodos}    select top 1 d.DescripcionCorta, em.Descripcion, em.Alerta, em.CierreAutomatico, em.Confimacion, isnull(em.Duracion,0), em.Prioridad from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle order by em.Descripcion
${countTipo}    select count(d.DescripcionCorta) from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where d.DescripcionCorta like '%${EM}[Tipo]%'
${selectTipo}    select top 1 d.DescripcionCorta, em.Descripcion, em.Alerta, em.CierreAutomatico, em.Confimacion, isnull(em.Duracion,0), em.Prioridad from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where d.DescripcionCorta like '%${EM}[Tipo]%' order by em.Descripcion
${countMensaje}    select count(em.Descripcion) from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.Descripcion like '%${EM}[Mensaje]%'
${selectMensaje}    select top 1 d.DescripcionCorta, em.Descripcion, em.Alerta, em.CierreAutomatico, em.Confimacion, isnull(em.Duracion,0), em.Prioridad from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.Descripcion like '%${EM}[Mensaje]%' order by em.Descripcion
${countAlertaA}    select count(em.Alerta) from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.Alerta = 1
${selectAlertaA}    select top 1 d.DescripcionCorta, em.Descripcion, em.Alerta, em.CierreAutomatico, em.Confimacion, isnull(em.Duracion,0), em.Prioridad from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.Alerta = 1 order by em.Descripcion
${countAlertaI}    select count(em.Alerta) from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.Alerta = 0
${selectAlertaI}    select top 1 d.DescripcionCorta, em.Descripcion, em.Alerta, em.CierreAutomatico, em.Confimacion, isnull(em.Duracion,0), em.Prioridad from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.Alerta = 0 order by em.Descripcion
${countCierreA}    select count(em.CierreAutomatico) from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.CierreAutomatico = 1
${selectCierreA}    select top 1 d.DescripcionCorta, em.Descripcion, em.Alerta, em.CierreAutomatico, em.Confimacion, isnull(em.Duracion,0), em.Prioridad from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.CierreAutomatico = 1 order by em.Descripcion
${countCierreI}    select count(em.CierreAutomatico) from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.CierreAutomatico = 0
${selectCierreI}    select top 1 d.DescripcionCorta, em.Descripcion, em.Alerta, em.CierreAutomatico, em.Confimacion, isnull(em.Duracion,0), em.Prioridad from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.CierreAutomatico = 0 order by em.Descripcion
${countConfirmarA}    select count(em.Confimacion) from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.Confimacion = 1
${selectConfirmarA}    select top 1 d.DescripcionCorta, em.Descripcion, em.Alerta, em.CierreAutomatico, em.Confimacion, isnull(em.Duracion,0), em.Prioridad from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.Confimacion = 1 order by em.Descripcion
${countConfirmarI}    select count(em.Confimacion) from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.Confimacion = 0
${selectConfirmarI}    select top 1 d.DescripcionCorta, em.Descripcion, em.Alerta, em.CierreAutomatico, em.Confimacion, isnull(em.Duracion,0), em.Prioridad from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.Confimacion = 0 order by em.Descripcion
${countTiempo}    select count(em.Duracion) from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.Duracion like '%${EM}[Tiempo]%'
${selectTiempo}    select top 1 d.DescripcionCorta, em.Descripcion, em.Alerta, em.CierreAutomatico, em.Confimacion, isnull(em.Duracion,0), em.Prioridad from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.Duracion like '%${EM}[Tiempo]%' order by em.Descripcion
${countPrioridad}    select count(em.Prioridad) from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.Prioridad like '%${EM}[Prioridad]%'
${selectPrioridad}    select top 1 d.DescripcionCorta, em.Descripcion, em.Alerta, em.CierreAutomatico, em.Confimacion, isnull(em.Duracion,0), em.Prioridad from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle where em.Prioridad like '%${EM}[Prioridad]%' order by em.Descripcion

*** Test Cases ***
Grid - Validar etiquetas
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Grid - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser
    
Filtro - Todos
    [Documentation]    Debera filtrar por Todos.
    [Tags]    Filtro - Todos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Sleep    1
    Validar resultado contra BD    ${countTodos}    ${selectTodos}
    [Teardown]    Close Browser
    
Filtro - Tipo Alerta
    [Documentation]    Debera mostrar los resultados que coincidan con lo ingresado en Tipo Alerta.
    [Tags]    Filtro - Tipo Alerta
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por Columna 1 y Campo ${EM}[Tipo]
    Sleep    1
    Validar resultado contra BD    ${countTipo}    ${selectTipo}
    [Teardown]    Close Browser
    
Filtro - Mensaje
    [Documentation]    Debera mostrar los resultados que coincidan con lo ingresado en Mensaje.
    [Tags]    Filtro - Mensaje
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por Columna 2 y Campo ${EM}[Mensaje]
    Sleep    1
    Validar resultado contra BD    ${countMensaje}    ${selectMensaje}
    [Teardown]    Close Browser
    
Filtro - Alerta Activo
    [Documentation]    Debera mostrar los resultados que coincidan con Alerta sea igual Activo.
    [Tags]    Filtro - Alerta Activo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por    3    Activo
    Sleep    1
    Validar resultado contra BD    ${countAlertaA}    ${selectAlertaA}
    [Teardown]    Close Browser
    
Filtro - Alerta Inactivo
    [Documentation]    Debera mostrar los resultados que coincidan con Alerta sea igual Inactivo.
    [Tags]    Filtro - Alerta Inactivo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por    3    Inactivo
    Sleep    1
    Validar resultado contra BD    ${countAlertaI}    ${selectAlertaI}
    [Teardown]    Close Browser
    
Filtro - Cierre Activo
    [Documentation]    Debera mostrar los resultados que coincidan con Cierre Automatico sea igual Activo.
    [Tags]    Filtro - Cierre Activo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por    4    Activo
    Sleep    1
    Validar resultado contra BD    ${countCierreA}    ${selectCierreA}
    [Teardown]    Close Browser
    
Filtro - Cierre Inactivo
    [Documentation]    Debera mostrar los resultados que coincidan con Cierre Automatico sea igual Inactivo.
    [Tags]    Filtro - Cierre Inactivo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por    4    Inactivo
    Sleep    1
    Validar resultado contra BD    ${countCierreI}    ${selectCierreI}
    [Teardown]    Close Browser
    
Filtro - Confirmar Activo
    [Documentation]    Debera mostrar los resultados que coincidan con Confirmar Mensaje sea igual Activo.
    [Tags]    Filtro - Confirmar Activo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por    5    Activo
    Sleep    1
    Validar resultado contra BD    ${countConfirmarA}    ${selectConfirmarA}
    [Teardown]    Close Browser
    
Filtro - Confirmar Inactivo
    [Documentation]    Debera mostrar los resultados que coincidan con Confirmar Mensaje sea igual Inactivo.
    [Tags]    Filtro - Confirmar Inactivo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por    5    Inactivo
    Sleep    1
    Validar resultado contra BD    ${countConfirmarI}    ${selectConfirmarI}
    [Teardown]    Close Browser
    
Filtro - Tiempo
    [Documentation]    Debera mostrar los resultados que coincidan con lo ingresado en el filtro Tiempo.
    [Tags]    Filtro - Tiempo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por Columna 6 y Campo ${EM}[Tiempo]
    Sleep    1
    Validar resultado contra BD    ${countTiempo}    ${selectTiempo}
    [Teardown]    Close Browser
    
Filtro - Prioridad
    [Documentation]    Debera mostrar los resultados que coincidan con lo ingresado en el filtro Prioridad.
    [Tags]    Filtro - Prioridad
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por Columna 7 y Campo ${EM}[Prioridad]
    Sleep    1
    Validar resultado contra BD    ${countPrioridad}    ${selectPrioridad}
    [Teardown]    Close Browser
    
*** Keywords ***
Filtrar por
    [Arguments]    ${arg1}    ${arg2}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div
    Click Element    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[${arg1}]/div/div/div
    Click Element    xpath=//*[contains(text(),'${arg2}')]
    
Validar resultado contra BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    //*[@id="grid"]/div/div[11]/div/div[1]
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${noReg}
    ${Tipo}=    Get Text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${Mensaje}=    Get Text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    ${iconAlerta}=    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/span/i    class
    ${iconCierre}=    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/span/i    class
    ${iconConfirmar}=    Get Element Attribute    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[5]/span/i    class
    ${Alerta}=    Execute Javascript    if('${iconAlerta}'=='fas fa-check-circle') {return true} else {return false};
    ${Cierre}=    Execute Javascript    if('${iconCierre}'=='fas fa-check-circle') {return true} else {return false};
    ${Confirmar}=    Execute Javascript    if('${iconConfirmar}'=='fas fa-check-circle') {return true} else {return false};
    ${Tpo}=    Get Text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[6]
    ${Tiempo}=    Convert To Integer    ${Tpo}
    ${Prd}=    Get Text    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[7]
    ${Prioridad}=    Convert To Integer    ${Prd}
    @{queryResults}    Query    ${arg2}
    Should Be Equal    ${queryResults[0][0]}    ${Tipo}
    Should Be Equal    ${queryResults[0][1]}    ${Mensaje}
    Should Be Equal    ${queryResults[0][2]}    ${Alerta}
    Should Be Equal    ${queryResults[0][3]}    ${Cierre}
    Should Be Equal    ${queryResults[0][4]}    ${Confirmar}
    Should Be Equal    ${queryResults[0][5]}    ${Tiempo}
    Should Be Equal    ${queryResults[0][6]}    ${Prioridad}
    Disconnect From Database
    
Validar etiquetas
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[1]/div/div[1]/h4    Catálogo de Estatus de Embarcación
    Element Text Should Be    xpath=//*[@id="dx-col-22"]/div[2]    Tipo Alerta
    Element Text Should Be    xpath=//*[@id="dx-col-23"]/div[2]    Mensaje
    Element Text Should Be    xpath=//*[@id="dx-col-24"]/div[3]    Alerta
    Element Text Should Be    xpath=//*[@id="dx-col-25"]/div[3]    Cierre Automático
    Element Text Should Be    xpath=//*[@id="dx-col-26"]/div[3]    Confirmar Mensaje
    Element Text Should Be    xpath=//*[@id="dx-col-27"]/div[2]    Tiempo
    Element Text Should Be    xpath=//*[@id="dx-col-28"]/div[2]    Prioridad
    Element Text Should Be    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[1]/td[8]/div    Detalle