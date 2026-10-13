*** Settings ***
Resource    Recursos.ConfiguracionSistema.robot

*** Variables ***
${Descripcion}    correo
&{Editar}    Descripcion=RFDescripcionEditar    Entero=55    Flotante=8.8    Fecha=01/01/2021 00:00    Caracteres=Edicion desde RobotFramework    Latitud=25.677197    Longitud=-100.303009

*** Test Cases ***
Editar - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Editar - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Filtrar por Columna 1 y Campo ${Descripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser
    
Editar - Validar detalle del registro
    [Documentation]    Valida que el formulario carga todos los datos como estan en BD.
    [Tags]    Editar - Validar detalle del registro
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Filtrar por Columna 1 y Campo ${Descripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario
    Validar informacion en BD
    [Teardown]    Close Browser

Editar - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente los cambios realizados.
    [Tags]    Editar - Validar opcion Guardar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Filtrar por Columna 1 y Campo ${Descripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del formulario    ${Editar}[Descripcion]
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar informacion en BD
    [Teardown]    Close Browser

Editar - Validar opcion Guardar - Ver Detalle
    [Documentation]    Debera mostrar la informacion de registro editada previamente.
    [Tags]    Editar - Validar opcion Guardar - Ver Detalle
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Filtrar por Columna 1 y Campo ${Descripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del formulario    ${Editar}[Descripcion]
    Sleep    1
    Presionar opcion Guardar
    Obtener datos del formulario
    Sleep    1
    Cerrar modal del formulario
    Sleep    1
    Filtrar por Columna 1 y Campo ${Descripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario
    Validar informacion en BD
    [Teardown]    Close Browser
    
Editar - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de edicion y no guardar cambios en BD.
    [Tags]    Editar - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del formulario    ${Editar}[Descripcion]
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Cancelar
    Sleep    1
    Validar actualizacion SIN aplicar en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Editar - Mostrar validacion de campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Editar - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Dejar vacio los campos del formulario
    Presionar opcion Guardar
    Sleep    1
    Validar campos obligatorios
    [Teardown]    Close Browser
    
Editar - Validacion de campos requeridos oculta
    [Documentation]    La validacion de campos obligatorios debe estar oculta al ingresar al formulario
    [Tags]    Editar - Validacion de campos requeridos oculta
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Configuracion de Sistema
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Dejar vacio los campos del formulario
    Presionar opcion Guardar
    Sleep    1
    Cerrar modal del formulario
    Ingresar al detalle del registro No. 1 en el grid
    Validacion de campos obligatorios oculta
    [Teardown]    Close Browser

*** Keywords ***
Ingresar al detalle del registro No. ${arg1} en el grid
    Click Element    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[8]/div
    Wait Until Page Contains Element    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div/div[2]
    
Editar datos del formulario
    [Arguments]    ${arg1}
    Validar campo unico Descripcion    ${arg1}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${DescripcionUnica}
    Input Text    xpath=//*[@id="txtEntero"]/div/div[1]/input    ${Editar}[Entero]
    Input Text    xpath=//*[@id="txtFlotante"]/div/div[1]/input    ${Editar}[Flotante]
    #Input Text    xpath=//*[@id="dpPFecha"]/div/div/div[1]/input    ${Editar}[Fecha]
    Seleccionar Fecha Hoy
    Input Text    xpath=//*[@id="txtCaracteres"]/div/div[1]/input    ${Editar}[Caracteres]
    Input Text    xpath=//*[@id="txtLatitud"]/div/div[1]/input    ${Editar}[Latitud]
    Input Text    xpath=//*[@id="txtLongitud"]/div/div[1]/input    ${Editar}[Longitud]
    
Validar campo unico Descripcion
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select Descripcion from Sismep.TSismepConfiguracion where Descripcion = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Validar campo unico Descripcion    ${arg1}
    ...    ELSE    Set Test Variable    ${DescripcionUnica}    ${Valor}
    Disconnect From Database
    
Obtener datos del formulario
    ${Descripcion}=    Get Value    xpath=//*[@id="txtDescripcion"]/div/div[1]/input
    ${Eto}=    Get Value    xpath=//*[@id="txtEntero"]/div/div[1]/input
    ${Entero}=    Convert to Integer    ${Eto}
    ${Fte}=    Get Value    xpath=//*[@id="txtFlotante"]/div/div[1]/input
    ${Flotante}=    Convert to Number    ${Fte}
    ${Fch}=    Get Value    xpath=//*[@id="dpPFecha"]/div/div/div[1]/input
    #${Fecha}=    Execute JavaScript    fechahora = new Date('${Fch}'); fechaISO = fechahora.toISOString().replace('T',' ').replace('Z',''); fechaUTC = new Date(fechaISO); y = fechaUTC.getFullYear(); m = fechaUTC.getMonth() + 1; d = fechaUTC.getDate(); h = fechaUTC.getHours(); mn = fechaUTC.getMinutes(); return fechastring = y + '-' + (m <= 9 ? '0' + m : m) + '-' + (d <= 9 ? '0' + d : d) + ' ' + (h <= 9 ? '0' + h : h) + ':' + (mn <= 9 ? '0' + mn : mn);
    ${Fecha}=    Execute JavaScript    fechahora = '${Fch}'; y = fechahora.slice(6,10); m = fechahora.slice(3,5); d = fechahora.slice(0,2); h = fechahora.slice(11,13); mn = fechahora.substr(14); return fechastring = y + '-' + m + '-' + d + ' ' + h + ':' + mn
    ${Caracteres}=    Get Value    xpath=//*[@id="txtCaracteres"]/div/div[1]/input
    ${Lat}=    Get Value    xpath=//*[@id="txtLatitud"]/div/div[1]/input
    ${Latitud}=    Convert to Number    ${Lat}
    ${Lon}=    Get Value    xpath=//*[@id="txtLongitud"]/div/div[1]/input
    ${Longitud}=    Convert to Number    ${Lon}
    Set Test Variable    ${Descripcion}
    Set Test Variable    ${Entero}
    Set Test Variable    ${Flotante}
    Set Test Variable    ${Fecha}
    Set Test Variable    ${Caracteres}
    Set Test Variable    ${Latitud}
    Set Test Variable    ${Longitud}
    
Dejar vacio los campos del formulario
    Clear Element Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input
    Clear Element Text    xpath=//*[@id="txtEntero"]/div/div[1]/input
    Clear Element Text    xpath=//*[@id="txtFlotante"]/div/div[1]/input
    Clear Element Text    xpath=//*[@id="dpPFecha"]/div/div/div[1]/input
    Clear Element Text    xpath=//*[@id="txtCaracteres"]/div/div[1]/input
    Clear Element Text    xpath=//*[@id="txtLatitud"]/div/div[1]/input
    Clear Element Text    xpath=//*[@id="txtLongitud"]/div/div[1]/input
    
Presionar opcion Guardar
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div/div[1]
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div/div[1]
    
Presionar opcion Cancelar
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div/div[2]
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div/div[2]
    
Validar informacion en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select Descripcion, ValorInt, Valorfloat, ValorDateTime, ValorString, Latitud, Longitud from Sismep.TSismepConfiguracion where Descripcion = '${Descripcion}'
    ${FechaBD}=    Execute JavaScript    fechahorabd = new Date('${queryResults[0][3]}');  y = fechahorabd.getFullYear(); m = fechahorabd.getMonth() + 1; d = fechahorabd.getDate(); h = fechahorabd.getHours(); mn = fechahorabd.getMinutes(); return fechastring = y + '-' + (m <= 9 ? '0' + m : m) + '-' + (d <= 9 ? '0' + d : d) + ' ' + (h <= 9 ? '0' + h : h) + ':' + (mn <= 9 ? '0' + mn : mn);
    Should Be Equal    ${queryResults[0][0]}    ${Descripcion}
    Should Be Equal    ${queryResults[0][1]}    ${Entero}
    Should Be Equal    ${queryResults[0][2]}    ${Flotante}
    Should Be Equal    ${FechaBD}    ${Fecha}
    #Should Be Equal    ${queryResults[0][3]}    ${Fecha}
    Should Be Equal    ${queryResults[0][4]}    ${Caracteres}
    Should Be Equal    ${queryResults[0][5]}    ${Latitud}
    Should Be Equal    ${queryResults[0][6]}    ${Longitud}
    Disconnect From Database
    
Validar actualizacion SIN aplicar en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select Descripcion from Sismep.TSismepConfiguracion where Descripcion = '${Descripcion}'
    Disconnect From Database
    
Validar campos obligatorios
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="txtDescripcion"]    textContent
    ${attrEntero}=    Get Element Attribute    xpath=//*[@id="txtEntero"]    textContent
    ${attrFlotante}=    Get Element Attribute    xpath=//*[@id="txtFlotante"]    textContent
    ${attrFecha}=    Get Element Attribute    xpath=//*[@id="dpPFecha"]    textContent
    ${attrCaracteres}=    Get Element Attribute    xpath=//*[@id="txtCaracteres"]    textContent
    ${attrLatitud}=    Get Element Attribute    xpath=//*[@id="txtLatitud"]    textContent
    ${attrLongitud}=    Get Element Attribute    xpath=//*[@id="txtLongitud"]    textContent
    Should be equal    ${attrDescripcion}    Obligatorio
    Should be equal    ${attrEntero}    Obligatorio
    Should be equal    ${attrFlotante}    Obligatorio
    Should be equal    ${attrFecha}    Obligatorio
    Should be equal    ${attrCaracteres}    Obligatorio
    Should be equal    ${attrLatitud}    Obligatorio
    Should be equal    ${attrLongitud}    Obligatorio
    
Validar etiquetas
    ${Titulo}=    Get Text    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div
    ${Descripcion}=    Get Text    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[1]
    ${Entero}=    Get Text    xpath=/html/body/div[3]/div/div[2]/div/div[2]/label
    ${Caracteres}=    Get Text    xpath=/html/body/div[3]/div/div[2]/div/div[3]/div[1]
    ${Latitud}=    Get Text    xpath=/html/body/div[3]/div/div[2]/div/div[4]/div[1]
    ${Flotante}=    Get Text    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div/div[2]/div/label
    ${Fecha}=    Get Text    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div/div[3]/div/label
    ${Longitud}=    Get Text    xpath=/html/body/div[3]/div/div[2]/div/div[4]/div[3]
    ${btnGuardar}    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div/div[1]    tooltip
    ${btnCancelar}    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div/div[2]    tooltip
    Should Be Equal    ${Titulo}    Editar Configuraci\u00F3n
    Should Be Equal    ${Descripcion}    Descripci\u00F3n:
    Should Be Equal    ${Entero}    Entero:
    Should Be Equal    ${Caracteres}    Caracteres:
    Should Be Equal    ${Latitud}    Latitud:
    Should Be Equal    ${Flotante}    Flotante:
    Should Be Equal    ${Fecha}    Fecha:
    Should Be Equal    ${Longitud}    Longitud:
    Should Be Equal    ${btnGuardar}    Guardar
    Should Be Equal    ${btnCancelar}    Cancelar

Seleccionar Fecha Hoy
    Click Element    xpath=//*[@id="dpPFecha"]/div[1]/div/div[2]/div[2]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div[1]/div
    Click Element    xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div/div
    Click Element    xpath=/html/body/div[4]/div/div[2]/div/div[3]/div[1]/div/div

Validacion de campos obligatorios oculta
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="txtDescripcion"]    textContent
    ${attrEntero}=    Get Element Attribute    xpath=//*[@id="txtEntero"]    textContent
    ${attrFlotante}=    Get Element Attribute    xpath=//*[@id="txtFlotante"]    textContent
    ${attrFecha}=    Get Element Attribute    xpath=//*[@id="dpPFecha"]    textContent
    ${attrCaracteres}=    Get Element Attribute    xpath=//*[@id="txtCaracteres"]    textContent
    ${attrLatitud}=    Get Element Attribute    xpath=//*[@id="txtLatitud"]    textContent
    ${attrLongitud}=    Get Element Attribute    xpath=//*[@id="txtLongitud"]    textContent
    Should Be Empty    ${attrDescripcion}
    Should Be Empty    ${attrEntero}
    Should Be Empty    ${attrFlotante}
    Should Be Empty    ${attrFecha}
    Should Be Empty    ${attrCaracteres}
    Should Be Empty    ${attrLatitud}
    Should Be Empty    ${attrLongitud}