*** Settings ***
Resource    Recursos.Busqueda.robot

*** Variables ***
${DMS}    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[1]/ul/li[1]/a
${Decimal}    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[1]/ul/li[2]/a
${KPH}    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]/ul/li[1]/a
${MPH}    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]/ul/li[2]/a
${Nudos}    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]/ul/li[3]/a

*** Test Cases ***
Validar etiquetas - Menu contextual (clic izquierdo)
    [Documentation]    Valida que se muestre correctamente escritas las etiquetas en el Menu contextual.
    [Tags]    Validar etiquetas - Menu contextual (clic izquierdo) - T320
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Sleep    1
    Validar etiquetas - Menu contextual (clic izquierdo)
    [Teardown]    Close Browser
    
Busqueda por Nombre - Validar datos de embarcacion en BD
    [Documentation]    Valida que se haga correctamente la busqueda por nombre y la informacion mostrada en el menu contextual coincida con la almacenada en la Base de datos.
    [Tags]    Busqueda por Nombre - Validar datos de embarcacion en BD - T409
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Sleep    1
    Validar datos de Embarcacion en BD - Contextual
    [Teardown]    Close Browser
    
Busqueda por RNP - Validar datos de embarcacion en BD
    [Documentation]    Valida que se haga correctamente la busqueda por RNP y la informacion mostrada en el menu contextual coincida con la almacenada en la Base de datos.
    [Tags]    Busqueda por RNP - Validar datos de embarcacion en BD - T413
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 2, Campo ${Embarcacion}[RNP]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Sleep    1
    Validar datos de Embarcacion en BD - Contextual
    [Teardown]    Close Browser

Busqueda por Matricula - Validar datos de embarcacion en BD
    [Documentation]    Valida que se haga correctamente la busqueda por Matricula y la informacion mostrada en el menu contextual coincida con la almacenada en la Base de datos.
    [Tags]    Busqueda por Matricula - Validar datos de embarcacion en BD - T410
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 3, Campo ${Embarcacion}[Matricula]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Sleep    1
    Validar datos de Embarcacion en BD - Contextual
    [Teardown]    Close Browser

Configuracion - Menu contextual izquierdo - Posicion Decimal
    [Documentation]    Valida que al momento de cambiar la configuracion de Posicion a Decimal se muestre correctamente en el Menu contextual.
    [Tags]    Configuracion - Menu contextual izquierdo - Posicion Decimal
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Configurar Posicion    ${Decimal}
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Sleep    1
    Validar datos de Embarcacion en BD - Contextual - Posicion Decimal
    [Teardown]    Close Browser

Configuracion - Menu contextual izquierdo - Velocidad KPH
    [Documentation]    Valida que al momento de cambiar la configuracion de Velocidad a KPH se muestre correctamente en el Menu contextual.
    [Tags]    Configuracion - Menu contextual izquierdo - Velocidad KPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Configurar Velocidad    ${KPH}
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Sleep    1
    Validar datos de Embarcacion en BD - Contextual    CONVERT(DECIMAL(5,2),(mf.Velocidad))    KPH
    [Teardown]    Close Browser

Configuracion - Menu contextual izquierdo - Velocidad a MPH
    [Documentation]    Valida que al momento de cambiar la configuracion de Velocidad a MPH se muestre correctamente en el Menu contextual.
    [Tags]    Configuracion - Menu contextual izquierdo - Velocidad a MPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Configurar Velocidad    ${MPH}
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Sleep    1
    Validar datos de Embarcacion en BD - Contextual    CONVERT(DECIMAL(5,2),(mf.Velocidad / 1.609))    MPH
    [Teardown]    Close Browser

*** Keywords ***    
Desplegar menu contextual de Embarcacion (clic izquierdo)
    Click Element    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[3]/div/img

Validar etiquetas - Menu contextual (clic izquierdo)
    Wait Until Element Is Visible    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2
    Element Text Should Be    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2    ${Embarcacion}[Nombre]
    Element Text Should Be    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[2]/td[1]/b    RNP:
    Element Text Should Be    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[3]/td[1]/b    Matr\u00EDcula:
    Element Text Should Be    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[4]/td[1]/b    Latitud:
    Element Text Should Be    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[5]/td[1]/b    Longitud:
    Element Text Should Be    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[6]/td[1]/b    Velocidad:
    Element Text Should Be    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[7]/td[1]/b    Rumbo:
    Element Text Should Be    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[8]/td[1]/b    Ultimo reporte:
    Element Text Should Be    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[9]/td[1]/b    Puerto base:
    Element Text Should Be    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[10]/td[1]/b    Transmitiendo:
    Element Text Should Be    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[11]/td[1]/b    RazonSocial:
    Element Text Should Be    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[12]/td[1]/b    Permisos:

Obtener datos de la Embarcacion - Contextual - Default
    ${Nombre}=    Get Text           xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2
    ${RNP}=    Get Text              xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[2]/td[2]
    ${Matricula}=    Get Text        xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[3]/td[2]
    ${Latitud}=    Get Text          xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[4]/td[2]
    ${Longitud}=    Get Text         xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[5]/td[2]
    ${Velocidad}=    Get Text        xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[6]/td[2]
    ${Rbo}=    Get Text            xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[7]/td[2]
    ${Rumbo}=    Execute Javascript    cadena='${Rbo}'; return cadena.split(' ')[0];
    ${UltimoReporte}=    Get Text    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[8]/td[2]
    ${PuertoBase}=    Get Text       xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[9]/td[2]
    ${Transmitiendo}=    Get Text    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[10]/td[2]
    ${RazonSocial}=    Get Text      xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[11]/td[2]
    ${Permisos}=    Get Text         xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[12]/td[2]
    Set Test Variable    ${Nombre}
    Set Test Variable    ${RNP}
    Set Test Variable    ${Matricula}
    Set Test Variable    ${Latitud}
    Set Test Variable    ${Longitud}
    Set Test Variable    ${Velocidad}
    Set Test Variable    ${Rumbo}
    Set Test Variable    ${UltimoReporte}
    Set Test Variable    ${PuertoBase}
    Set Test Variable    ${Transmitiendo}
    Set Test Variable    ${RazonSocial}
    Set Test Variable    ${Permisos}
    
Validar datos de Embarcacion en BD - Contextual
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mf.Velocidad / 1.852))    ${etqVel}=Nudos
    Obtener datos de la Embarcacion - Contextual - Default
    Conexion a Base de datos
    @{queryResults}=    Query    select v.Nombre, v.RNP, v.Matricula, mf.Latitud, mf.Longitud, ${Vel}, mf.Rumbo, FORMAT(DATEADD(HH, -${horasUTC}, mf.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), pti.Descripcion, rs.Descripcion, (select tc.Descripcion + '-' from Sismep.TSismepVehiculos ve join Sismep.TSismepVehiculosPermisos vp on ve.IdVehiculo = vp.IdVehiculo and vp.Activo=1 join Sismep.TSismepTiposCarga tc on vp.IdTipoCarga = tc.IdTipoCarga where vp.IdVehiculo = v.IdVehiculo order by tc.Descripcion desc for xml path ('')) from Sismep.TSismepMensajesMFoto mf join Sismep.TSismepVehiculos v on mf.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial where v.Nombre = '${Embarcacion}[Nombre]'
    ${LatitudBD}=    Execute Javascript    ${JSLatitudDMS} return LatitudDMS(${queryResults[0][3]});
    ${LongitudBD}=    Execute Javascript    ${JSLongitudDMS} return LongitudDMS(${queryResults[0][4]});
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} ${etqVel}
    ${RumboBD}=    Catenate    ${queryResults[0][6]}\u00B0    #Pendiente revision de este dato, como aplicar la letra correcta
    ${UltimoRBD}=    Execute Javascript    cadena='${queryResults[0][7]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3 + ' horas';
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${RNP}
    Should Be Equal    ${queryResults[0][2]}    ${Matricula}
    Should Be Equal    ${LatitudBD}    ${Latitud}
    Should Be Equal    ${LongitudBD}    ${Longitud}
    Should Be Equal    ${VelocidadBD}    ${Velocidad}
    Should Be Equal    ${RumboBD}    ${Rumbo}
    Should Be Equal    ${UltimoRBD}    ${UltimoReporte}
    Should Be Equal    ${queryResults[0][8]}    ${PuertoBase}
    Should Be Equal    ${queryResults[0][9]}    ${RazonSocial}
    #Should Be Equal    ${queryResults[0][10]}    ${Permisos}
    Disconnect From Database

Obtener datos de la Embarcacion - Contextual - Decimal
    ${Nombre}=    Get Text           xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2
    ${RNP}=    Get Text              xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[2]/td[2]
    ${Matricula}=    Get Text        xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[3]/td[2]
    ${Lat}=    Get Text              xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[4]/td[2]
    ${Latitud}=    Convert to Number    ${Lat}
    ${Lon}=    Get Text              xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[5]/td[2]
    ${Longitud}=    Convert to Number    ${Lon}
    ${Velocidad}=    Get Text        xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[6]/td[2]
    ${Rbo}=    Get Text            xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[7]/td[2]
    ${Rumbo}=    Execute Javascript    cadena='${Rbo}'; return cadena.slice(0,-2);
    ${UltimoReporte}=    Get Text    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[8]/td[2]
    ${PuertoBase}=    Get Text       xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[9]/td[2]
    ${Transmitiendo}=    Get Text    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[10]/td[2]
    ${RazonSocial}=    Get Text      xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[11]/td[2]
    ${Permisos}=    Get Text         xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[12]/td[2]
    Set Test Variable    ${Nombre}
    Set Test Variable    ${RNP}
    Set Test Variable    ${Matricula}
    Set Test Variable    ${Latitud}
    Set Test Variable    ${Longitud}
    Set Test Variable    ${Velocidad}
    Set Test Variable    ${Rumbo}
    Set Test Variable    ${UltimoReporte}
    Set Test Variable    ${PuertoBase}
    Set Test Variable    ${Transmitiendo}
    Set Test Variable    ${RazonSocial}
    Set Test Variable    ${Permisos}
    
Validar datos de Embarcacion en BD - Contextual - Posicion Decimal
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mf.Velocidad / 1.852))    ${etqVel}=Nudos
    Obtener datos de la Embarcacion - Contextual - Decimal
    Conexion a Base de datos
    @{queryResults}=    Query    select v.Nombre, v.RNP, v.Matricula, round(mf.Latitud, 7), round(mf.Longitud, 7), ${Vel}, mf.Rumbo, FORMAT(DATEADD(HH, -${horasUTC}, mf.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), pti.Descripcion, rs.Descripcion, (select tc.Descripcion + '-' from Sismep.TSismepVehiculos ve join Sismep.TSismepVehiculosPermisos vp on ve.IdVehiculo = vp.IdVehiculo and vp.Activo=1 join Sismep.TSismepTiposCarga tc on vp.IdTipoCarga = tc.IdTipoCarga where vp.IdVehiculo = v.IdVehiculo order by tc.Descripcion desc for xml path ('')) from Sismep.TSismepMensajesMFoto mf join Sismep.TSismepVehiculos v on mf.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial where v.Nombre = '${Embarcacion}[Nombre]'
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} ${etqVel}
    ${RumboBD}=    Catenate    ${queryResults[0][6]}\u00B0    #Pendiente revision de este dato, como aplicar la letra correcta
    ${UltimoRBD}=    Execute Javascript    cadena='${queryResults[0][7]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3 + ' horas';
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${RNP}
    Should Be Equal    ${queryResults[0][2]}    ${Matricula}
    Should Be Equal    ${queryResults[0][3]}    ${Latitud}
    Should Be Equal    ${queryResults[0][4]}    ${Longitud}
    Should Be Equal    ${VelocidadBD}    ${Velocidad}
    Should Be Equal    ${RumboBD}    ${Rumbo}
    Should Be Equal    ${UltimoRBD}    ${UltimoReporte}
    Should Be Equal    ${queryResults[0][8]}    ${PuertoBase}
    Should Be Equal    ${queryResults[0][9]}    ${RazonSocial}
    #Should Be Equal    ${queryResults[0][10]}    ${Permisos}
    Disconnect From Database
    
Configurar Posicion
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    xpath=//*[@id="dropdownMenuButton"]
    Execute JavaScript    document.evaluate('//*[@id="dropdownMenuButton"]',document.body,null,9,null).singleNodeValue.click();
    Wait Until Element Is Visible    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[1]
    Mouse Over    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[1]
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}
    
Configurar Velocidad
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    xpath=//*[@id="dropdownMenuButton"]
    Execute JavaScript    document.evaluate('//*[@id="dropdownMenuButton"]',document.body,null,9,null).singleNodeValue.click();
    Wait Until Element Is Visible    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]
    Mouse Over    xpath=//*[@id="footer"]/div/div/div[5]/div[1]/div/ul/li[2]
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}