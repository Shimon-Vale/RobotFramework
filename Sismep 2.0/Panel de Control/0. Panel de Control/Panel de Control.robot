*** Settings ***
Resource    ../../Recursos.Generales.robot

*** Variables ***
${EpE}    //*[@id="bxBar"]/div[1]/div[1]/h3[2]/input
${permisosChart}    //*[@id="bxPie"]/div[1]/div/button
${permisosEstadoChart}    //*[@id="bxBar"]/div[1]/div[2]/button
${alertasChart}    //*[@id="bxLine"]/div[1]/div/button

*** Test Cases ***
Panel de control : Validar etiquetas
    [Documentation]    Debera mostrar correctamente escritas las etiquetas.
    [Tags]    Panel de control : Validar etiquetas
    Iniciar sesion
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser

Panel de control : Validar Total de embarcaciones
    [Documentation]    Debera mostrar correctamente el no. de embarcaciones contra la BD.
    [Tags]    Panel de control : Validar Total de embarcaciones
    Iniciar sesion
    Sleep    3
    Validar total de Embarcaciones en BD
    [Teardown]    Close Browser

Panel de control : Validar Embarcaciones Golfo
    [Documentation]    Debera mostrar correctamente el no. de embarcaciones del Golfo contra la BD.
    [Tags]    Panel de control : Validar Embarcaciones Golfo
    Iniciar sesion
    Sleep    3
    Validar total de Embarcaciones golfo en BD
    [Teardown]    Close Browser

Panel de control : Validar Embarcaciones Pacifico
    [Documentation]    Debera mostrar correctamente el no. de embarcaciones del Pacifico contra la BD.
    [Tags]    Panel de control : Validar Embarcaciones Pacifico
    Iniciar sesion
    Sleep    3
    Validar total de Embarcaciones pacifico en BD
    [Teardown]    Close Browser

Panel de control : Maximizar Permisos vigentes/vencidos
    [Documentation]    Debera maximizar la sección de Permisos Vigentes/Vencidos correctamente.
    [Tags]    Panel de control : Maximizar Permisos vigentes/vencidos
    Iniciar sesion
    Sleep    1
    Maximizar: ${permisosChart}
    [Teardown]    Close Browser

Panel de control : Minimizar Permisos vigentes/vencidos
    [Documentation]    Debera minimizar la sección de Permisos Vigentes/Vencidos correctamente.
    [Tags]    Panel de control : Minimizar Permisos vigentes/vencidos
    Iniciar sesion
    Sleep    1
    Maximizar: ${permisosChart}
    Sleep    1
    Minimizar: ${permisosChart}
    [Teardown]    Close Browser
    
Panel de control : Maximizar Permisos por Estado
    [Documentation]    Debera maximizar la sección de Permisos por Estado correctamente.
    [Tags]    Panel de control : Maximizar Permisos por Estado
    Iniciar sesion
    Sleep    1
    Maximizar: ${permisosEstadoChart}
    [Teardown]    Close Browser

Panel de control : Minimizar Permisos por Estado
    [Documentation]    Debera minimizar la sección de Permisos por Estado correctamente.
    [Tags]    Panel de control : Minimizar Permisos por Estado
    Iniciar sesion
    Sleep    1
    Maximizar: ${permisosEstadoChart}
    Sleep    1
    Minimizar: ${permisosEstadoChart}
    [Teardown]    Close Browser

Panel de control : Seleccionar opcion Embarcaciones por Estado
    [Documentation]    Debera mostrar la grafica con los resultados por Estado.
    [Tags]    Panel de control : Seleccionar opcion Embarcaciones por Estado
    Iniciar sesion
    Sleep    1
    Seleccionar opcion: ${EpE}
    [Teardown]    Close Browser
    
Panel de control : Maximizar Embarcaciones por Estado
    [Documentation]    Debera maximizar la sección de Embarcaciones por Estado correctamente.
    [Tags]    Panel de control : Maximizar Embarcaciones por Estado
    Iniciar sesion
    Sleep    1
    Seleccionar opcion: ${EpE}
    Sleep    1
    Maximizar: ${permisosEstadoChart}
    [Teardown]    Close Browser

Panel de control : Minimizar Embarcaciones por Estado
    [Documentation]    Debera minimizar la sección de Embarcaciones por Estado correctamente.
    [Tags]    Panel de control : Minimizar Embarcaciones por Estado
    Iniciar sesion
    Sleep    1
    Seleccionar opcion: ${EpE}
    Sleep    1
    Maximizar: ${permisosEstadoChart}
    Sleep    1
    Minimizar: ${permisosEstadoChart}
    [Teardown]    Close Browser

Panel de control : Maximizar Alertas
    [Documentation]    Debera maximizar la sección de Alertas correctamente.
    [Tags]    Panel de control : Maximizar Alertas
    Iniciar sesion
    Sleep    2
    Maximizar: ${alertasChart}
    [Teardown]    Close Browser

Panel de control : Minimizar Alertas
    [Documentation]    Debera minimizar la sección de Alertas correctamente.
    [Tags]    Panel de control : Minimizar Alertas
    Iniciar sesion
    Sleep    2
    Maximizar: ${alertasChart}
    Sleep    1
    Minimizar: ${alertasChart}
    [Teardown]    Close Browser

*** Keywords ***
Presionar opcion Panel de Control
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/button[2]
    Click Element    xpath=//*[@id="divPanelControles"]/button[2]
    
Validar etiquetas
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[2]/section[1]/h1    Dashboard
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[2]/section[2]/div[1]/div[1]/div/div[1]/p    Embarcaciones
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[2]/section[2]/div[1]/div[2]/div/div[1]/p    Embarcaciones golfo
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[2]/section[2]/div[1]/div[3]/div/div[1]/p    Embarcaciones pacifico
    Element Text Should Be    xpath=//*[@id="divContainer"]/div[2]/section[2]/div[1]/div[4]/div/div[1]/p    Alertas
    Element Text Should Be    xpath=//*[@id="bxPie"]/div[1]/h3    Permisos Vigentes / Vencidos
    Element Text Should Be    xpath=//*[@id="bxBar"]/div[1]/div[1]/h3[1]    Permisos Por Estado
    Element Text Should Be    xpath=//*[@id="bxBar"]/div[1]/div[1]/h3[2]    Embarcaciones Por Estado
    Element Text Should Be    xpath=//*[@id="bxLine"]/div[1]/h3    Alertas Actuales vs Ultimo Año

Seleccionar opcion: ${OPC}
    Wait Until Element Is Visible    ${OPC}
    #Click Element    ${OPC}
    Execute Javascript    document.evaluate('${OPC}',document.body,null,9,null).singleNodeValue.click();

Maximizar: ${Op}
    Wait Until Element Is Visible    ${Op}
    #Click Element    ${Op}
    Execute Javascript    document.evaluate('${Op}',document.body,null,9,null).singleNodeValue.click();

Minimizar: ${Min}
    Wait Until Element Is Visible    ${Min}
    #Click Element    ${Min}
    Execute Javascript    document.evaluate('${Min}',document.body,null,9,null).singleNodeValue.click();

Obtener valores de Embarcaciones
    ${Embarc}    Get Text    xpath=//*[@id="lblTotalEmbarcaciones"]
    ${Embarcaciones}    Convert To Integer    ${Embarc}
    ${EmbarcGolfo}    Get Text    xpath=//*[@id="lblTotalEmbarcacionesGolfo"]
    ${EmbarcacionesGolfo}    Convert To Integer    ${EmbarcGolfo}
    ${EmbarcPac}    Get Text    xpath=//*[@id="lblTotalEmbarcacionesPacifico"]
    ${EmbarcacionesPacifico}    Convert To Integer    ${EmbarcPac}
    ${Alert}    Get Text    xpath=//*[@id="lblTotalAlertas"]
    ${Alertas}    Convert To Integer    ${Alert}
    Set Test Variable    ${Embarcaciones}
    Set Test Variable    ${EmbarcacionesGolfo}
    Set Test Variable    ${EmbarcacionesPacifico}
    Set Test Variable    ${Alertas}

Validar total de Embarcaciones en BD
    Obtener valores de Embarcaciones
    ${username}    Get Text    xpath=//*[@id="navbarDropdown"]
    Conexion a Base de Datos
    @{queryUserId}    Query    select UserId from aspnet_Users where UserName='${username}'
    @{queryResults}    Query    select count(v.IdVehiculo) from Sismep.TSismepVehiculos v with(nolock) inner join Sismep.FnRegresaPermisoVehiculoTodos('${queryUserId[0][0]}') pu on v.IdVehiculo = pu.IdVehiculo inner join Sismep.TSismepMensajesMFoto m on m.IdVehiculo = v.IdVehiculo where v.Activo = 1
    Should Be Equal    ${queryResults[0][0]}    ${Embarcaciones}
    Disconnect From Database

Validar total de Embarcaciones golfo en BD
    Obtener valores de Embarcaciones
    ${username}    Get Text    xpath=//*[@id="navbarDropdown"]
    Conexion a Base de Datos
    @{queryUserId}    Query    select UserId from aspnet_Users where UserName='${username}'
    @{queryResults}    Query    select count(v.IdVehiculo) from Sismep.TSismepVehiculos v with(nolock) inner join Sismep.FnRegresaPermisoVehiculoTodos('${queryUserId[0][0]}') pu on v.IdVehiculo = pu.IdVehiculo inner join Sismep.TSismepMensajesMFoto m on m.IdVehiculo = v.IdVehiculo where v.IdRegion='0D66DAA1-8A10-4620-8DCD-C1860CAAAA6C' and v.Activo = 1
    Should Be Equal    ${queryResults[0][0]}    ${EmbarcacionesGolfo}
    Disconnect From Database

Validar total de Embarcaciones pacifico en BD
    Obtener valores de Embarcaciones
    ${username}    Get Text    xpath=//*[@id="navbarDropdown"]
    Conexion a Base de Datos
    @{queryUserId}    Query    select UserId from aspnet_Users where UserName='${username}'
    @{queryResults}    Query    select count(v.IdVehiculo) from Sismep.TSismepVehiculos v with(nolock) inner join Sismep.FnRegresaPermisoVehiculoTodos('${queryUserId[0][0]}') pu on v.IdVehiculo = pu.IdVehiculo inner join Sismep.TSismepMensajesMFoto m on m.IdVehiculo = v.IdVehiculo where v.IdRegion='917885AD-BBF5-4A69-8DC4-9AE457238C3A' and v.Activo = 1
    Should Be Equal    ${queryResults[0][0]}    ${EmbarcacionesPacifico}
    Disconnect From Database