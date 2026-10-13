*** Settings ***
Resource    Recursos.EstatusEmbarcacion.robot

*** Variables ***
&{Mensajes}    M1=Normal    M2=Emergencia    M3=RF
&{MensajeEditar}    Nombre=RFMensajeEditar    Prioridad=250    Duracion=30    Icono=I

*** Test Cases ***
Editar - Validar etiquetas y tooltips
    [Documentation]    Debera de mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Editar - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por Columna 2 y Campo ${Mensajes}[M1]
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Validar etiquetas
    [Teardown]    Close Browser
    
Editar - Validar numero de elementos en el combo Tipo Alerta
    [Documentation]    La cantidad que se muestra en la lista debe de coincidir con base de datos.
    [Tags]    Editar - Validar numero de elementos en el combo Tipo Alerta
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por Columna 2 y Campo ${Mensajes}[M2]
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Validar cantidad de registros Tipo Alerta en BD
    [Teardown]    Close Browser
    
Editar - Validar numero de elementos en el combo Uso de Comando
    [Documentation]    La cantidad que se muestra en la lista debe de coincidir con base de datos.
    [Tags]    Editar - Validar numero de elementos en el combo Uso de Comando
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por Columna 2 y Campo ${Mensajes}[M2]
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Validar cantidad de registros Uso de Comando en BD
    [Teardown]    Close Browser
    
Editar - Validar numero de elementos en el combo Reemplazar
    [Documentation]    La cantidad que se muestra en la lista debe de coincidir con base de datos.
    [Tags]    Editar - Validar numero de elementos en el combo Reemplazar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por Columna 2 y Campo ${Mensajes}[M2]
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Validar cantidad de registros Reemplazar en BD
    [Teardown]    Close Browser
    
Editar - Validar informacion
    [Documentation]    Debera coincidir la informacion mostrada en pantalla vs la BD.
    [Tags]    Editar - Validar informacion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por Columna 2 y Campo ${Mensajes}[M2]
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Validar informacion del registro en BD
    [Teardown]    Close Browser
    
Editar - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente los cambios en la Base de datos.
    [Tags]    Editar - Validar opcion Guardar - T68
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por Columna 2 y Campo ${Mensajes}[M3]
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del Mensaje    ${MensajeEditar}[Nombre]
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar informacion del registro en BD
    [Teardown]    Close Browser
    
Editar - Validar opcion Cancelar
    [Documentation]    Debera cancelar los cambios hechos en pantalla y no guardar nada en la BD.
    [Tags]    Editar - Validar opcion Cancelar - T69
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estatus de Embarcacion
    Filtrar por Columna 2 y Campo ${Mensajes}[M1]
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del Mensaje    ${MensajeEditar}[Nombre]
    Sleep    1
    Obtener datos del Mensaje
    Presionar opcion Cancelar
    Sleep    1
    Validar actualizacion SIN aplicar en BD
    Validar retorno a Grid de Resultados    ${xpathGrid}
    [Teardown]    Close Browser
    
*** Keywords ***
Ingresar al detalle del registro No. ${arg1} en el grid
    Click Element    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[8]/div
    Wait Until Page Contains Element    xpath=/html/body/div[3]/div/div[2]/div/div[10]/div/div[2]
    
Editar datos del Mensaje
    [Arguments]    ${arg1}
    Validar campo unico Nombre    ${arg1}
    Sleep    1
    Seleccionar Tipo Alerta
    Input Text    xpath=//*[@id="txtNombre"]/div/div[1]/input    ${NombreUnico}
    Input Text    xpath=//*[@id="txtPrioridad"]/div/div[1]/input    ${MensajeEditar}[Prioridad]
    Mostrar Alerta
    Seleccionar Estilo
    Cierre Automatico
    Input Text    xpath=//*[@id="txtDuracion"]/div/div[1]/input    ${MensajeEditar}[Duracion]
    Confirmar Mensaje
    Seleccionar Uso de Comando
    Mantener
    Seleccionar Reemplazar
    Alertar Siempre
    Input Text    xpath=//*[@id="txtIcono"]/div/div[1]/input    ${MensajeEditar}[Icono]
    
Validar campo unico Nombre
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select Descripcion from Sismep.TSismepEstatusMensajes where Descripcion='${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Validar campo unico Nombre    ${arg1}
    ...    ELSE    Set Test Variable    ${NombreUnico}    ${Valor}
    Disconnect From Database
    
Seleccionar Tipo Alerta
    Click Element    xpath=//*[@id="cboTipoAlerta"]/div[1]/div/div[2]/div[2]
    #Wait Until Element Is Visible    xpath=/html/body/div[5]/div/div/div/div[1]/div/div[1]/div[2]/div[3]/div
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[3]/div
    
Mostrar Alerta
    Click Element    xpath=//*[@id="switchMostrarAlerta"]
    
Seleccionar Estilo
    Click Element    xpath=//*[@id="cboEstilo"]/div[1]/div[2]/div[2]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[5]/div
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[5]/div
    
Cierre Automatico
    Click Element    xpath=//*[@id="switchCierreAutomatico"]
    Wait Until Element Is Enabled    xpath=//*[@id="txtDuracion"]/div/div[1]/input
    
Confirmar Mensaje
    Click Element    xpath=//*[@id="switchConfirmaMsg"]
    
Seleccionar Uso de Comando
    Click Element    xpath=//*[@id="ddlUsoComando"]/div[1]/div/div[2]/div
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[4]/div
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[4]/div
    
Mantener
    Click Element    xpath=//*[@id="switchMantener"]
    
Seleccionar Reemplazar
    Click Element    xpath=//*[@id="cboReemplazar"]/div[1]/div/div[2]/div
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[9]/div
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[9]/div
    
Alertar Siempre
    Click Element    xpath=//*[@id="switchAlertaSiempre"]
    
Presionar opcion Guardar
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[10]/div/div[1]
    
Presionar opcion Cancelar
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[10]/div/div[2]
    
Obtener datos del Mensaje
    ${Tipo}    Get Value    xpath=//*[@id="cboTipoAlerta"]/div[1]/div/div[1]/input
    ${Nombre}    Get Value    xpath=//*[@id="txtNombre"]/div/div[1]/input
    ${Pdd}    Get Value    xpath=//*[@id="txtPrioridad"]/div/div[1]/input
    ${Prioridad}=    Convert to Integer    ${Pdd}
    ${SW1}=    Execute JavaScript    return document.getElementsByClassName("sismep-switch col-1 dx-switch dx-swipeable dx-widget dx-visibility-change-handler")[0].getAttribute("aria-label")
    ${SW2}=    Execute JavaScript    return document.getElementsByClassName("sismep-switch col-1 dx-switch dx-swipeable dx-widget dx-visibility-change-handler")[1].getAttribute("aria-label")
    ${SW3}=    Execute JavaScript    return document.getElementsByClassName("sismep-switch col-1 dx-switch dx-swipeable dx-widget dx-visibility-change-handler")[2].getAttribute("aria-label")
    ${SW4}=    Execute JavaScript    return document.getElementsByClassName("sismep-switch col-1 dx-switch dx-swipeable dx-widget dx-visibility-change-handler")[3].getAttribute("aria-label")
    ${SW5}=    Execute JavaScript    return document.getElementsByClassName("sismep-switch col-1 dx-switch dx-swipeable dx-widget dx-visibility-change-handler")[4].getAttribute("aria-label")
    ${MostrarAlerta}=    Execute JavaScript    if('${SW1}'=='SI'){return 1}else{return 0};
    ${CierreAutomatico}=    Execute JavaScript    if('${SW2}'=='SI'){return 1}else{return 0};
    ${ConfirmarMensaje}=    Execute JavaScript    if('${SW3}'=='SI'){return 1}else{return 0};
    ${Mantener}=    Execute JavaScript    if('${SW4}'=='SI'){return 1}else{return 0};
    ${AlertarSiempre}=    Execute JavaScript    if('${SW5}'=='SI'){return 1}else{return 0};
    ${attrColor}    Get Element Attribute    xpath=//*[@id="cboEstilo"]/div[1]/div[1]/div/div[1]    class
    ${bgColor}    Execute Javascript    cadena='${attrColor}'; return Color = cadena.substr(20);
    ${Estilo}=    Execute JavaScript    if('${bgColor}'==''){return ${EMPTY}}else{return'${bgColor}'};
    ${Dur}    Get Value    xpath=//*[@id="txtDuracion"]/div/div[1]/input
    ${Duracion}=    Convert To Integer    ${Dur}
    #${Duracion}=    Execute JavaScript    if('${evalDuracion}'=='' || '${evalDuracion}'==0){return ${EMPTY}}else{return Number(${evalDuracion})};
    ${evalUso}    Get Value    xpath=//*[@id="ddlUsoComando"]/div[1]/div/div[1]/input
    ${Uso}=    Execute JavaScript    if('${evalUso}'==''){return ${EMPTY}}else{return'${evalUso}'};
    ${evalRemplazar}    Get Value    xpath=//*[@id="cboReemplazar"]/div[1]/div/div[1]/input
    ${Remplazar}=    Execute JavaScript    if('${evalRemplazar}'==''){return ${EMPTY}}else{return'${evalRemplazar}'};
    ${Icono}    Get Value    xpath=//*[@id="txtIcono"]/div/div[1]/input
    ${Sonido}    Get Text    xpath=//*[@id="FileUSonido"]/div/div/div/div[1]/div[2]/div
    Set Test Variable    ${Tipo}
    Set Test Variable    ${Nombre}
    Set Test Variable    ${Prioridad}
    Set Test Variable    ${MostrarAlerta}
    Set Test Variable    ${CierreAutomatico}
    Set Test Variable    ${ConfirmarMensaje}
    Set Test Variable    ${Mantener}
    Set Test Variable    ${AlertarSiempre}
    Set Test Variable    ${Estilo}
    Set Test Variable    ${Duracion}
    Set Test Variable    ${Uso}
    Set Test Variable    ${Remplazar}
    Set Test Variable    ${Icono}
    Set Test Variable    ${Sonido}
    
Validar informacion del registro en BD
    Obtener datos del Mensaje
    Conexion a Base de Datos
    @{queryResults}    Query    select d.DescripcionLarga, em.Descripcion, em.Prioridad, em.Alerta, em.Estilo, em.CierreAutomatico, isnull(em.Duracion,0), em.Confimacion, d2.DescripcionLarga, em.Mantener, em2.Descripcion, em.AlertaSiempre, em.NombreIcono, em.Sonido from Sismep.TSismepEstatusMensajes em join Sismep.TSismepDetalle d on em.IdTipoAlerta = d.IdDetalle left join Sismep.TSismepDetalle d2 on em.IdUsoComando = d2.IdDetalle left join Sismep.TSismepEstatusMensajes em2 on em.ReemplazarA = em2.IdEstatusMensaje where em.Descripcion = '${Nombre}'
    Should Be Equal    ${queryResults[0][0]}    ${Tipo}
    Should Be Equal    ${queryResults[0][1]}    ${Nombre}
    Should Be Equal    ${queryResults[0][2]}    ${Prioridad}
    Should Be Equal    ${queryResults[0][3]}    ${MostrarAlerta}
    Should Be Equal    ${queryResults[0][4]}    ${Estilo}
    Should Be Equal    ${queryResults[0][5]}    ${CierreAutomatico}
    Should Be Equal    ${queryResults[0][6]}    ${Duracion}
    Should Be Equal    ${queryResults[0][7]}    ${ConfirmarMensaje}
    Should Be Equal    ${queryResults[0][8]}    ${Uso}
    Should Be Equal    ${queryResults[0][9]}    ${Mantener}
    Should Be Equal    ${queryResults[0][10]}    ${Remplazar}
    Should Be Equal    ${queryResults[0][11]}    ${AlertarSiempre}
    Should Be Equal    ${queryResults[0][12]}    ${Icono}
    Should Be Equal    ${queryResults[0][13]}    ${Sonido}
    Disconnect From Database
    
Validar actualizacion SIN aplicar en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select Descripcion from Sismep.TSismepEstatusMensajes where Descripcion='${Nombre}'
    Disconnect From Database
    
Validar cantidad de registros Tipo Alerta en BD
    ${cboTipoAlerta}=    Execute Javascript    return document.getElementsByClassName("dx-scrollview-content")[0].getElementsByClassName("dx-item dx-list-item").length;
    Conexion a Base de Datos
    @{queryResults}    Query    select count(DescripcionLarga) from Sismep.TSismepDetalle where IdMaestro = 'BCA663E8-730C-4D7E-BEA5-EE9592230322' and Activo = '1'
    Should Be Equal    ${queryResults[0][0]}    ${cboTipoAlerta}
    Disconnect From Database
    
Validar cantidad de registros Uso de Comando en BD
    ${cboUsoComando}=    Execute Javascript    return document.getElementsByClassName("dx-scrollview-content")[2].getElementsByClassName("dx-item dx-list-item").length;
    Conexion a Base de Datos
    @{queryResults}    Query    select count(DescripcionLarga) from Sismep.TSismepDetalle where IdMaestro = '377F5464-8200-46F6-8374-47B9E46E0915' and Activo = '1'
    Should Be Equal    ${queryResults[0][0]}    ${cboUsoComando}
    Disconnect From Database
    
Validar cantidad de registros Reemplazar en BD
    ${cboReemplazar}=    Execute Javascript    return document.getElementsByClassName("dx-scrollview-content")[3].getElementsByClassName("dx-item dx-list-item").length;
    Conexion a Base de Datos
    @{queryResults}    Query    select COUNT(Descripcion) from Sismep.TSismepEstatusMensajes
    Should Be Equal    ${queryResults[0][0]}    ${cboReemplazar}
    
Validar etiquetas
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Configuración de Mensajes
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/label[1]    Tipo Alerta:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[2]/label[1]    Nombre:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[2]/label[2]    Prioridad:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[3]/label[1]    ¿Mostrar Alerta?:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[3]/label[2]    Estilo:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[4]/label[1]    ¿Cierre Automático?:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[4]/label[2]    Duración:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[4]/label[3]    Segs.
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[5]/label[1]    Confirmar Mensaje:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div[2]    Uso de Comando
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[6]/label[1]    Mantener:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[6]/label[2]    Reemplazar:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[7]/label[1]    Alertar Siempre:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[8]/label[1]    Icono:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[9]/label[1]    Sonido:
    ${btnGuardar}    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[10]/div/div[1]    tooltip
    ${btnCancelar}    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[10]/div/div[2]    tooltip
    Should be equal    ${btnGuardar}    Guardar
    Should be equal    ${btnCancelar}    Cancelar
    
