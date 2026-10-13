*** Settings ***
Resource    ../../Recursos.Generales.robot

*** Variables ***
${horasUTC}    6
${Comentario}    RFComentario
${JSLatitudDMS}    function LatitudDMS(latitud) {var absoluto = Math.abs(latitud); var grados = Math.floor(absoluto); var minutosnotruncados = (absoluto - grados) * 60; var minutos = Math.floor(minutosnotruncados); var segundos = Math.round((minutosnotruncados - minutos) * 60); var direccion = latitud >= 0 ? "N" : "S"; return grados + "\u00B0 " + minutos + "' " + segundos + '\u0022 ' + direccion;};
${JSLongitudDMS}    function LongitudDMS(longitud) {var absoluto = Math.abs(longitud); var grados = Math.floor(absoluto); var minutosnotruncados = (absoluto - grados) * 60; var minutos = Math.floor(minutosnotruncados); var segundos = Math.round((minutosnotruncados - minutos) * 60); var direccion = longitud >= 0 ? "E" : "W"; return grados + "\u00B0 " + minutos + "' " + segundos + '\u0022 ' + direccion;};
${panelalertas}    http://54.219.63.18:90/Controles/PanelAlertas

*** Test Cases ***
Panel de Alertas: Validar acceso al Panel
    [Documentation]    Valida que el usuario tiene acceso a la opcion de alertas
    [Tags]    Panel de Alertas: Validar acceso al Panel
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Panel de Alertas
    [Teardown]    Close Browser
    
Panel de Alertas: Validar numero de alertas en BD
    [Documentation]    Valida la cantidad de alertas mostradas contra el registro en BD
    [Tags]    Panel de Alertas: Validar numero de alertas en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Panel de Alertas
    Validar numero de alertas en BD
    [Teardown]    Close Browser

Panel de Alertas: Embarcacion - Validar etiquetas
    [Documentation]    Valida las etiquetas de la seccion embarcacion
    [Tags]    Panel de Alertas: Embarcacion - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Panel de Alertas
    Seleccionar una Alerta
    Embarcacion - Validar etiquetas
    [Teardown]    Close Browser

Panel de Alertas: Embarcacion - Validar datos de embarcacion
    [Documentation]    Valida la informacion mostrada en la seccion Datos de embarcacion
    [Tags]    Panel de Alertas: Embarcacion - Validar datos de embarcacion - T373
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Panel de Alertas
    Seleccionar una Alerta
    Sleep    1
    Validar datos de Embarcacion
    [Teardown]    Close Browser
    
Panel de Alertas: Embarcacion - Validar datos de embarcacion - Posicion Decimal
    [Documentation]    Valida los datos de posicion bajo la configuracion Decimal
    [Tags]    Panel de Alertas: Embarcacion - Validar datos de embarcacion - Posicion Decimal
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Monitoreo - Configurar posicion    ${M_Decimal}
    Presionar opcion Panel de Alertas
    Seleccionar una Alerta
    Sleep    1
    Validar datos de Embarcacion - Posicion Decimal
    [Teardown]    Close Browser
    
Panel de Alertas: Embarcacion - Validar datos de embarcacion - Velocidad KPH
    [Documentation]    Valida el dato de velocidad bajo la configuracion KPH
    [Tags]    Panel de Alertas: Embarcacion - Validar datos de embarcacion - Velocidad KPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Monitoreo - Configurar Velocidad    ${M_KPH}
    Presionar opcion Panel de Alertas
    Seleccionar una Alerta
    Sleep    1
    Validar datos de Embarcacion    CONVERT(DECIMAL(5,2),(a.Velocidad))    KPH
    [Teardown]    Close Browser
    
Panel de Alertas: Embarcacion - Validar datos de embarcacion - Velocidad MPH
    [Documentation]    Valida el dato de velocidad bajo la configuracion MPH
    [Tags]    Panel de Alertas: Embarcacion - Validar datos de embarcacion - Velocidad MPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Monitoreo - Configurar Velocidad    ${M_MPH}
    Presionar opcion Panel de Alertas
    Seleccionar una Alerta
    Sleep    1
    Validar datos de Embarcacion    CONVERT(DECIMAL(5,2),(a.Velocidad / 1.609))    MPH
    [Teardown]    Close Browser
    
Panel de Alertas: Datos de contacto - Validar etiquetas
    [Documentation]    Valida las etiquetas de la seccion Datos de contacto
    [Tags]    Panel de Alertas: Datos de contacto - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Panel de Alertas
    Seleccionar una Alerta
    Seleccionar TAB Datos de Contacto
    Sleep    1
    Datos de contacto - Validar etiquetas
    [Teardown]    Close Browser
    
Panel de Alertas: Datos de contacto - Validar Datos de contacto
    [Documentation]    Valida la informacion de contacto en BD
    [Tags]    Panel de Alertas: Datos de contacto - Validar Datos de contacto - T374
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Panel de Alertas
    Seleccionar una Alerta
    Seleccionar TAB Datos de Contacto
    Sleep    1
    Validar Datos de contacto
    [Teardown]    Close Browser
    
Panel de Alertas: Confirmar - Confirmar sin comentario
    [Documentation]    Valida el mensaje para el campo Obligatorio
    [Tags]    Panel de Alertas: Confirmar - Confirmar sin comentario
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Panel de Alertas
    Seleccionar una Alerta
    Seleccionar TAB Confirmar
    Sleep    1
    Presionar opcion Confirmar
    Validar mensaje    Campo obligatorio (Comentario confirmaci\u00F3n).
    [Teardown]    Close Browser

Panel de Alertas: Confirmar - Agregar comentario
    [Documentation]    Pendiente agregar validacion en confirmacion de alerta
    [Tags]    Panel de Alertas: Confirmar - Agregar comentario
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Panel de Alertas
    Seleccionar una Alerta
    Seleccionar TAB Confirmar
    Sleep    1
    Capturar comentario
    Presionar opcion Confirmar
    Sleep    1
    Validar alerta confirmada
    [Teardown]    Close Browser
    
Panel de Alertas: Confirmar - SMS - Validar mensaje de error
    [Documentation]    Valida el mensaje de advertencia para la opcion SMS
    [Tags]    Panel de Alertas: Confirmar - SMS - Validar mensaje de error
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Panel de Alertas
    Seleccionar una Alerta
    Seleccionar TAB Confirmar
    Sleep    1
    Presionar opcion SMS
    Validar mensaje    Se requiere de como minimo un contacto con teléfono móvil.
    [Teardown]    Close Browser
    
Panel de Alertas: Confirmar - Cedula - Validar acceso a la opcion
    [Documentation]    Pendiente validar prueba con la URL correcta
    [Tags]    Panel de Alertas: Confirmar - Cedula - Validar acceso a la opcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Panel de Alertas
    Seleccionar una Alerta
    Seleccionar TAB Confirmar
    Sleep    1
    Presionar opcion Cedula
    Validar liga en BD
    [Teardown]    Close Browser
    
Panel de Alertas: Confirmar - Seguir - Validar acceso a la opcion
    [Documentation]    Valida el acceso a la opcion Seguir
    [Tags]    Panel de Alertas: Confirmar - Seguir - Validar acceso a la opcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Panel de Alertas
    Seleccionar una Alerta
    Seleccionar TAB Confirmar
    Sleep    1
    Presionar opcion Seguir
    [Teardown]    Close Browser

*** Keywords ***
Presionar opcion Panel de Alertas
    Click Element    xpath=//*[@id="divPanelControles"]/button[9]
    Sleep    1
    Switch Window    url=${panelalertas}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="divContainer"]/section/div/div/div/div[1]/h3

Seleccionar una Alerta
    Click Element    xpath=//*[@id="AlertasConent"]/div[1]/div[1]/div/div[1]
    ${RNP}=    Get Value    xpath=/html/body/div[2]/div/div/div[2]/div/div[1]/div[1]/div/input
    ${UltimoReporte}=    Get Value    xpath=//*[@id="adUltimoReporte"]
    Set Test Variable    ${RNP}
    Set Test Variable    ${UltimoReporte}
    
Embarcacion - Validar etiquetas
    Wait Until Element Is Visible    xpath=//*[@id="embarcacion-tab"]
    Element Text Should Be    xpath=//*[@id="embarcacion-tab"]    Embarcación
    Element Text Should Be    xpath=//*[@id="embarcacion"]/div[1]/label    RNP
    Element Text Should Be    xpath=//*[@id="embarcacion"]/div[2]/label    Matrícula
    Element Text Should Be    xpath=//*[@id="embarcacion"]/div[3]/label    Embarcación
    Element Text Should Be    xpath=//*[@id="embarcacion"]/div[4]/label    Latitud
    Element Text Should Be    xpath=//*[@id="embarcacion"]/div[5]/label    Longitud
    Element Text Should Be    xpath=//*[@id="embarcacion"]/div[6]/label    Velocidad
    Element Text Should Be    xpath=//*[@id="embarcacion"]/div[7]/label    Rumbo
    Element Text Should Be    xpath=//*[@id="embarcacion"]/div[8]/label    Ultimo Reporte
    
Obtener el numero de alertas
    ${texto}=    Get Text    xpath=//*[@id="divContainer"]/section/div/div/div/div[1]/h3
    ${alertas}=    Execute JavaScript    cadena='${texto}'; return cadena.split(' ')[0];
    ${noalertas}=    Convert To Integer    ${alertas}
    Set Test Variable    ${noalertas}
    
Validar numero de alertas en BD
    Obtener el numero de alertas
    Conexion a Base de Datos
    #@{queryRows}    Query    select count(IdAlerta) from Sismep.TSismepAlertas where FechaAlerta > DATEADD(DAY, -1, GETUTCDATE())
    @{queryRows}    Query    select count(1) from (select top 30 IdAlerta from Sismep.TSismepAlertas where FechaAlerta > DATEADD(DAY, -1, GETUTCDATE()) order by FechaAlerta desc) alertas
    Should be equal    ${queryRows[0][0]}    ${noalertas}
    
Obtener datos de embarcacion
    ${RNP}=    Get Value    xpath=/html/body/div[2]/div/div/div[2]/div/div[1]/div[1]/div/input
    ${Matricula}=    Get Value    xpath=//*[@id="adMatricula"]
    ${Nombre}=    Get Value    xpath=//*[@id="adEmbarcacion"]
    ${Latitud}=    Get Value    xpath=//*[@id="adLatitud"]
    ${Longitud}=    Get Value    xpath=//*[@id="adLongitud"]
    ${Velocidad}=    Get Value    xpath=//*[@id="adVelocidad"]
    ${Rbo}=    Get Value    xpath=//*[@id="adRumbo"]
    ${Rumbo}=    Execute JavaScript    cadena='${Rbo}'; return cadena.split(' ')[0];
    ${UltimoReporte}=    Get Value    xpath=//*[@id="adUltimoReporte"]
    Set Test Variable    ${RNP}
    Set test Variable    ${Matricula}
    Set Test Variable    ${Nombre}
    Set Test Variable    ${Latitud}
    Set test Variable    ${Longitud}
    Set Test Variable    ${Velocidad}
    Set test Variable    ${Rumbo}
    Set Test Variable    ${UltimoReporte}
    
Validar datos de Embarcacion
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(a.Velocidad / 1.852))    ${etqVel}=Nudos
    Obtener datos de embarcacion
    Conexion a Base de datos
    @{queryResults}=    Query    select top 1 v.RNP, v.Matricula, v.Nombre, a.Latitud, a.Longitud, ${Vel}, a.Rumbo, FORMAT(DATEADD(HH, -${horasUTC}, a.FechaAlerta),'dd/MMMM/yyyy HH:mm', 'es-mx') from Sismep.TSismepVehiculos v join Sismep.TSismepAlertas a on v.IdVehiculo = a.IdVehiculo where v.Nombre = '${Nombre}' order by a.FechaAlerta desc
    ${LatitudBD}=    Execute Javascript    ${JSLatitudDMS} return LatitudDMS(${queryResults[0][3]});
    ${LongitudBD}=    Execute Javascript    ${JSLongitudDMS} return LongitudDMS(${queryResults[0][4]});
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} ${etqVel}
    ${RumboBD}=    Catenate    ${queryResults[0][6]}\u00B0
    ${UltimoRBD}=    Execute Javascript    cadena='${queryResults[0][7]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3;
    Should Be Equal    ${queryResults[0][0]}    ${RNP}
    Should Be Equal    ${queryResults[0][1]}    ${Matricula}
    Should Be Equal    ${queryResults[0][2]}    ${Nombre}
    Should Be Equal    ${LatitudBD}    ${Latitud}
    Should Be Equal    ${LongitudBD}    ${Longitud}
    Should Be Equal    ${VelocidadBD}    ${Velocidad}
    Should Be Equal    ${RumboBD}    ${Rumbo}
    Should Be Equal    ${UltimoRBD}    ${UltimoReporte}
    Disconnect From Database
    
Obtener datos de embarcacion - Posicion Decimal
    ${RNP}=    Get Value    xpath=/html/body/div[2]/div/div/div[2]/div/div[1]/div[1]/div/input
    ${Matricula}=    Get Value    xpath=//*[@id="adMatricula"]
    ${Nombre}=    Get Value    xpath=//*[@id="adEmbarcacion"]
    ${Lat}=    Get Value    xpath=//*[@id="adLatitud"]
    ${Latitud}=    Convert to Number    ${Lat}
    ${Lon}=    Get Value    xpath=//*[@id="adLongitud"]
    ${Longitud}=    Convert to Number    ${Lon}
    ${Velocidad}=    Get Value    xpath=//*[@id="adVelocidad"]
    ${Rbo}=    Get Value    xpath=//*[@id="adRumbo"]
    ${Rumbo}=    Execute JavaScript    cadena='${Rbo}'; return cadena.split(' ')[0];
    ${UltimoReporte}=    Get Value    xpath=//*[@id="adUltimoReporte"]
    Set Test Variable    ${RNP}
    Set test Variable    ${Matricula}
    Set Test Variable    ${Nombre}
    Set Test Variable    ${Latitud}
    Set test Variable    ${Longitud}
    Set Test Variable    ${Velocidad}
    Set test Variable    ${Rumbo}
    Set Test Variable    ${UltimoReporte}
    
Validar datos de Embarcacion - Posicion Decimal
    Obtener datos de embarcacion - Posicion Decimal
    Conexion a Base de datos
    @{queryResults}=    Query    select top 1 v.RNP, v.Matricula, v.Nombre, round(a.Latitud, 7), round(a.Longitud, 7), CONVERT(DECIMAL(5,2),(a.Velocidad / 1.852)), a.Rumbo, FORMAT(DATEADD(HH, -${horasUTC}, a.FechaAlerta),'dd/MMMM/yyyy HH:mm', 'es-mx') from Sismep.TSismepVehiculos v join Sismep.TSismepAlertas a on v.IdVehiculo = a.IdVehiculo where v.Nombre = '${Nombre}' order by a.FechaAlerta desc
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} Nudos
    ${RumboBD}=    Catenate    ${queryResults[0][6]}\u00B0
    ${UltimoRBD}=    Execute Javascript    cadena='${queryResults[0][7]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3;
    Should Be Equal    ${queryResults[0][0]}    ${RNP}
    Should Be Equal    ${queryResults[0][1]}    ${Matricula}
    Should Be Equal    ${queryResults[0][2]}    ${Nombre}
    Should Be Equal    ${queryResults[0][3]}    ${Latitud}
    Should Be Equal    ${queryResults[0][4]}    ${Longitud}
    Should Be Equal    ${VelocidadBD}    ${Velocidad}
    Should Be Equal    ${RumboBD}    ${Rumbo}
    Should Be Equal    ${UltimoRBD}    ${UltimoReporte}
    Disconnect From Database
    
Seleccionar TAB Datos de Contacto
    Wait Until Element Is Visible    xpath=//*[@id="contacto-tab"]
    Click Element    xpath=//*[@id="contacto-tab"]

Datos de contacto - Validar etiquetas
    Wait Until Element Is Visible    xpath=//*[@id="contacto-tab"]
    Element Text Should Be    xpath=//*[@id="contacto-tab"]    Datos De Contacto
    Element Text Should Be    xpath=//*[@id="contacto"]/table/thead/tr/th[1]    \u0023
    Element Text Should Be    xpath=//*[@id="contacto"]/table/thead/tr/th[2]    Nombre
    Element Text Should Be    xpath=//*[@id="contacto"]/table/thead/tr/th[3]    Teléfono
    
Obtener datos de contacto
    ${nombre}=    Get Text    xpath=//*[@id="tbDatosContacto"]/tr/td[1]
    ${tel}=    Get Text    xpath=//*[@id="tbDatosContacto"]/tr/td[2]
    Set test Variable    ${nombre}
    Set Test Variable    ${tel}
    
Validar datos de contacto
    Obtener datos de contacto
    Conexion a Base de datos
    @{queryResults}=    Query    select v.Nombre, rc.Nombre, rr.Telefono from Sismep.TSismepVehiculos v join Sismep.TSismepRazonSocialContactos rc on rc.IdRazonSocial = v.IdRazonSocial join Sismep.TSismepRazonSocialReferencias rr on rr.IdRazonSocialContacto = rc.IdRazonSocialContacto where v.RNP = '${RNP}'
    Should Be Equal    ${queryResults[0][1]}    ${nombre}
    Should Be Equal    ${queryResults[0][2]}    ${tel}
    Disconnect From Database
    
Seleccionar TAB Confirmar
    Wait Until Element Is Visible    xpath=//*[@id="confirmar-tab"]
    Click Element    xpath=//*[@id="confirmar-tab"]

Presionar opcion Confirmar
    Click Element    xpath=//*[@id="btnConfirmar"]
    
Validar alerta confirmada
    Conexion a Base de Datos
    Check If Not Exists In Database    select v.Nombre, a.FechaAlerta from Sismep.TSismepAlertas a join Sismep.TSismepVehiculos v on v.IdVehiculo = a.IdVehiculo where v.RNP = '${RNP}' and a.FechaAlerta >= DATEADD(hh, ${horasUTC}, '${UltimoReporte}')
    Check If Exists In Database    select v.Nombre, ac.FechaAlerta from Sismep.TSismepAlertasConfirmadas ac join Sismep.TSismepVehiculos v on v.IdVehiculo = ac.IdVehiculo where v.RNP = '${RNP}' and ac.FechaAlerta >= DATEADD(hh, ${horasUTC}, '${UltimoReporte}')
    Disconnect From Database
    
Capturar comentario
    Input Text    xpath=//*[@id="txtComentario"]    ${Comentario}
    
Presionar opcion SMS
    Click Element    xpath=//*[@id="btnSMS"]
    
Presionar opcion Cedula
    Click Element    xpath=//*[@id="btnCedula"]
    Sleep    1
    Switch Window    NEW
    Maximize Browser Window
    ${url}=    Get Location
    ${str}=    Execute JavaScript    str= "${url}"; return str.substr(0,51);
    Set Test Variable    ${str}
    
Presionar opcion Seguir
    Click Element    xpath=//*[@id="btnSeguir"]
    Sleep    1
    Switch Window    title=Sismep - Seguimiento Especial
    Maximize Browser Window
    Wait Until Element Is Visible    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[3]/div/img    timeout=15
    
Validar mensaje
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    xpath=/html/body/div[5]/div/div/div[2]
    Element Text Should Be    xpath=/html/body/div[5]/div/div/div[2]    ${arg1}
    
Validar liga en BD
    Conexion a Base de datos
    @{queryResults}=    Query    select ValorString from Sismep.TSismepConfiguracion where Configuracion='Cedulas'
    Should Be Equal    ${queryResults[0][0]}    ${str}
    Disconnect From Database