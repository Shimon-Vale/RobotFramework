*** Settings ***
Resource    ../../Recursos.Generales.robot

*** Variables ***
${horasUTC}    6

*** Test Cases ***
Monitoreo - Validar etiquetas y tooltips
    [Documentation]    Debera validar que las etiquetas mostradas en pantalla se encuentren escritas correctamente.
    [Tags]    Monitoreo - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Sleep    1
    Validar etiquetas y tooltips
    [Teardown]    Close Browser
    
Monitoreo - Validar Latitud y Longitud en DMS
    [Documentation]    Debera validar que la latitud y la longitud mostrada en el mapa al desplazarse sea en DMS.
    [Tags]    Monitoreo - Validar Latitud y Longitud en DMS - T400
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Sleep    1
    Mover el mouse sobre la opcion Buscar Embarcacion
    Sleep    1
    Validar Latitud y Longitud en DMS
    [Teardown]    Close Browser
    
Monitoreo - Validar Latitud y Longitud en Decimal
    [Documentation]    Debera validar que la latitud y la longitud mostrada en el mapa al desplazarse sea en Decimal.
    [Tags]    Monitoreo - Validar Latitud y Longitud en Decimal - T402
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Sleep    1
    Esperar advertencia de alertas no visible
    Monitoreo - Configurar posicion    ${M_Decimal}
    Mover el mouse sobre la opcion Buscar Embarcacion
    Sleep    1
    Validar Latitud y Longitud en Decimal
    [Teardown]    Close Browser
    
Monitoreo - Validar numero de embarcaciones
    [Documentation]    Debera de validar que el numero de embarcaciones sea correcto según el usuario con el que se ingreso.
    [Tags]    Monitoreo - Validar numero de embarcaciones
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Sleep    1
    Validar numero de embarcaciones
    [Teardown]    Close Browser
    
Monitoreo - Validar fecha de ultimo reporte
    [Documentation]    Debera de validar que la fecha mostrada corresponda a la del ultimo reporte que llego al sistema.
    [Tags]    Monitoreo - Validar fecha de ultimo reporte
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Sleep    1
    Validar fecha de ultimo reporte
    [Teardown]    Close Browser
    
Monitoreo - Configuracion - Validar etiquetas
    [Documentation]    Debera validar que las etiquetas mostradas se muestren correctamente escritas.
    [Tags]    Monitoreo - Configuracion - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Sleep    1
    Configuracion - Validar etiquetas
    [Teardown]    Close Browser
    
Monitoreo - Validar numero de embarcaciones Sin Justificacion
    [Documentation]    Debera validar que el numero de embarcaciones que se muestren correspondan a las embarcaciones Sin justificacion.
    [Tags]    Monitoreo - Validar numero de embarcaciones Sin Justificacion - T401
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Sleep    1
    Validar numero de embarcaciones Sin Justificacion
    [Teardown]    Close Browser
    
Monitoreo - Validar numero de embarcaciones con Transmision Irregular
    [Documentation]    Debera validar que el numero de embarcaciones que se muestren correspondan a las embarcaciones con Transmision Irregular.
    [Tags]    Monitoreo - Validar numero de embarcaciones con Transmision Irregular - T1060
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Sleep    1
    Validar numero de embarcaciones con Transmision Irregular
    [Teardown]    Close Browser
    
Monitoreo - Validar numero de Alertas
    [Documentation]    Debera validar que el numero de alertas mostrado en pantalla correspondan a las alertas en la Base de datos.
    [Tags]    Monitoreo - Validar numero de Alertas - T1130
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Sleep    1
    Validar numero de Alertas
    [Teardown]    Close Browser
    
Calcular distancia - Distancia en Millas Nauticas
    [Documentation]    Debera de calcular la distancia correctamente en el mapa en Millas nauticas.
    [Tags]    Calcular distancia - Distancia en Millas Nauticas - T1131
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Sleep    1
    Seleccionar Calcular distancia (clic derecho)
    Validar distancia    mn
    [Teardown]    Close Browser

Calcular distancia - Distancia en Kilometros
    [Documentation]    Debera de calcular la distancia correctamente en el mapa en Kilometros.
    [Tags]    Configuracion - Distancia en Kilometros
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Monitoreo - Configurar Distancia    ${M_DstKilometros}
    Sleep    1
    Seleccionar Calcular distancia (clic derecho)
    Validar distancia    km
    [Teardown]    Close Browser

Calcular distancia - Distancia en Millas
    [Documentation]    Debera de calcular la distancia correctamente en el mapa en Millas.
    [Tags]    Configuracion - Distancia en Millas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Monitoreo - Configurar Distancia    ${M_DstMillas}
    Sleep    1
    Seleccionar Calcular distancia (clic derecho)
    Validar distancia    mi
    [Teardown]    Close Browser

Limpiar distancias
    [Documentation]    Debera de limpiar las distancias que se muestran en el mapa.
    [Tags]    Limpiar distancias - T1132
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Sleep    1
    Seleccionar Calcular distancia (clic derecho)
    Sleep    1
    Seleccionar Limpiar distancias
    Sleep    1
    Validar limpieza de iconos
    [Teardown]    Close Browser

*** Keywords ***
Validar etiquetas y tooltips
    ${etqLat}=    Get Text    xpath=//*[@id="stLatitud"]
    ${Latitud}=    Execute JavaScript    str="${etqLat}"; return str.substr(0,8);
    ${etqLon}=    Get Text    xpath=//*[@id="stLongitud"]
    ${Longitud}=    Execute JavaScript    str="${etqLon}"; return str.substr(0,9);
    ${etqEmb}=    Get Text    xpath=//*[@id="stEmbarcaciones"]
    ${Embarcaciones}=    Execute JavaScript    str="${etqEmb}"; return str.substr(0,13);
    ${etqURpt}=    Get Text    xpath=//*[@id="stUltimoReporte"]
    ${UltimoRpt}=    Execute JavaScript    str="${etqURpt}"; return str.substr(0,16);
    ${ttAjustes}=    Get Element Attribute    xpath=//*[@id="dropdownMenuButton"]    title
    ${ttSinJust}=    Get Element Attribute    xpath=//*[@id="footer"]/div/div/div[5]/div[2]    title
    ${ttTIrreg}=    Get Element Attribute    xpath=//*[@id="footer"]/div/div/div[5]/div[3]    title
    ${ttAlertas}=    Get Element Attribute    xpath=//*[@id="footer"]/div/div/div[5]/div[4]/button    title
    Element Text Should Be    xpath=//*[@id="lblTitle"]    Sistema Satelital de Monitoreo a Embarcaciones Pesqueras
    Should be equal    ${Latitud}    Latitud:
    Should be equal    ${Longitud}    Longitud:
    Should be equal    ${Embarcaciones}    Embarcaciones
    Should be equal    ${UltimoRpt}    \u00DAltimo Reporte :
    Should be equal    ${ttAjustes}    Ajustes
    Should be equal    ${ttSinJust}    Sin Justificaci\u00F3n
    Should be equal    ${ttTIrreg}    Transmisi\u00F3n Irregular
    Should be equal    ${ttAlertas}    Alertas
    
Seleccionar Calcular distancia (clic derecho)
    Open Context Menu    xpath=//*[@id="map"]/div[1]/div/div[2]/div[3]
    Sleep    1
    Click Element    xpath=//*[@id="contextMenuMap"]/div/ul/li[1]/a/div/span

Validar distancia
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[3]/div[2]/img
    Click Element    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[3]/div[2]/img
    #Wait Until Element Is Visible    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div/div/div/div/div/h3
    #${etq}=    Get Text    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div/div/div/div/div/h3
    Wait Until Element Is Visible    xpath=//*[@id="map"]/div/div/div[2]/div[1]/div[2]/div[2]/span
    ${etq}=    Get Text    xpath=//*[@id="map"]/div/div/div[2]/div[1]/div[2]/div[2]/span
    Should Contain    ${etq}    ${arg1}
    
Seleccionar Limpiar distancias
    Click Element    xpath=//*[@id="contextMenuMap"]/div/ul/li[2]/a/div

Validar limpieza de iconos
    Wait Until Element Is Not Visible    xpath=//*[@id="map"]/div[1]/div/div[2]/div[3]/div/div[3]/div[2]/img
    
Validar Latitud y Longitud en DMS
    ${etqLat}=    Get Text    xpath=//*[@id="stLatitud"]
    ${etqLon}=    Get Text    xpath=//*[@id="stLongitud"]
    Should Contain Any    ${etqLat}    \u00BA    \u0027    \u0022
    Should Contain Any    ${etqLon}    \u00BA    \u0027    \u0022
    
Validar Latitud y Longitud en Decimal
    ${etqLat}=    Get Text    xpath=//*[@id="stLatitud"]
    ${etqLon}=    Get Text    xpath=//*[@id="stLongitud"]
    ${Latitud}    Remove String    ${etqLat}    Latitud:
    ${Longitud}    Remove String    ${etqLon}    Longitud:
    ${LatEsDecimal}=    Run Keyword And Return Status    Convert to Number    ${Latitud}
    ${LonEsDecimal}=    Run Keyword And Return Status    Convert to Number    ${Longitud}
    Should Be Equal    ${LatEsDecimal}    ${TRUE}
    Should Be Equal    ${LonEsDecimal}    ${TRUE}
    
Validar numero de embarcaciones
    ${etqEmb}=    Get Text    xpath=//*[@id="stEmbarcaciones"]
    ${username}    Get Text    xpath=//*[@id="navbarDropdown"]
    Conexion a Base de Datos
    @{queryUserId}    Query    select UserId from aspnet_Users where UserName='${username}'
    @{queryResults}    Query    select count(v.IdVehiculo) from Sismep.TSismepVehiculos v with(nolock) inner join Sismep.FnRegresaPermisoVehiculoTodos('${queryUserId[0][0]}') pu on v.IdVehiculo = pu.IdVehiculo inner join Sismep.TSismepMensajesMFoto m on m.IdVehiculo = v.IdVehiculo where v.Activo = 1
    ${Embarcaciones}=    Catenate    Embarcaciones ${queryResults[0][0]} de ${queryResults[0][0]}
    Should Be Equal    ${etqEmb}    ${Embarcaciones}
    Disconnect From Database
    
Validar fecha de ultimo reporte
    ${etqURpt}=    Get Text    xpath=//*[@id="stUltimoReporte"]
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 FORMAT(DATEADD(HH, -${horasUTC}, FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx') from Sismep.TSismepMensajesMFoto order by FechaRecepcionUnitrac desc
    ${FechaBD}=    Execute Javascript    cadena='${queryResults[0][0]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3;
    ${UltimoRpt}=    Catenate    \u00DAltimo Reporte : ${FechaBD} horas
    Should Be Equal    ${etqURpt}    ${UltimoRpt}
    Disconnect From Database
    
Configuracion - Validar etiquetas
    Click Element    xpath=//*[@id="dropdownMenuButton"]
    Wait Until Element Is Visible    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[1]/a
    Mouse Over    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[1]/a
    Element Text Should Be    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[1]/a    Posici\u00F3n
    Element Text Should Be    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[1]/ul/li[1]/a    ${SPACE}DMS
    Element Text Should Be    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[1]/ul/li[2]/a    ${SPACE}Decimal
    Sleep    1
    Mouse Over    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]/a
    Element Text Should Be    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]/a    Velocidad
    Element Text Should Be    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]/ul/li[1]/a    ${SPACE}KPH
    Element Text Should Be    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]/ul/li[2]/a    ${SPACE}MPH
    Element Text Should Be    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]/ul/li[3]/a    ${SPACE}Nudos
    Sleep    1
    Mouse Over    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[3]/a
    Element Text Should Be    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[3]/a    Distancia
    Element Text Should Be    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[3]/ul/li[1]/a    ${SPACE}Kil\u00F3metros
    Element Text Should Be    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[3]/ul/li[2]/a    ${SPACE}Millas
    Element Text Should Be    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[3]/ul/li[3]/a    ${SPACE}Millas N\u00E1uticas
    
Validar numero de embarcaciones Sin Justificacion
    ${etqSJus}=    Get Text    xpath=//*[@id="stSinJusti"]
    ${SJus}=    Convert To Integer    ${etqSJus}
    Conexion a Base de Datos
    @{queryResults}    Query    select count(v.Nombre) from Sismep.TSismepVehiculos v join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo where v.Anio = 1
    Should Be Equal    ${queryResults[0][0]}    ${SJus}
    Disconnect From Database
    
Validar numero de embarcaciones con Transmision Irregular
    ${etqTIrre}=    Get Text    xpath=//*[@id="stTxIrregular"]
    ${TIrre}=    Convert To Integer    ${etqTIrre}
    #Conexion a Base de Datos
    #@{queryResults}    Query    #Pendiente definir script
    #Should Be Equal    ${queryResults[0][0]}    ${TIrre}
    #Disconnect From Database
    
Validar numero de Alertas
    ${etqAlertas}=    Get Text    xpath=//*[@id="stAlerta"]
    ${Alertas}=    Convert To Integer    ${etqAlertas}
    Conexion a Base de Datos
    #@{queryResults}    Query    select count(IdAlerta) from Sismep.TSismepAlertas where FechaAlerta > GETUTCDATE()-1
    @{queryResults}    Query    select count(1) from (select top 30 IdAlerta from Sismep.TSismepAlertas where FechaAlerta > DATEADD(DAY, -1, GETUTCDATE()) order by FechaAlerta desc) alertas
    Should Be Equal    ${queryResults[0][0]}    ${Alertas}
    Disconnect From Database
    
Mover el mouse sobre la opcion Buscar Embarcacion
    Mouse Over    xpath=//*[@id="map"]/div/div/div[2]/div[3]