*** Settings ***
Resource    ../../Recursos.Generales.robot

*** Variables ***
&{Validacion}    Nombre=Favor de seleccionar una Embarcación.    RazonSocial=Favor de seleccionar la Razón Social.    Litoral=Favor de seleccionar el Litoral.

${Embarcacion}    ARIES
${RazonSocial}    ALEJANDRO MONTANEZ ROSADO
${Litoral}    pacifico
${segundos}    -3

${countEmbarcacion}    select count(Nombre) from Sismep.TSismepVehiculos where Nombre = '${Embarcacion}'
${countPEmbarcacion}    select count(v.Nombre) from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena where v.Nombre = '${Embarcacion}' and c.IdTipoComando = 'D4108A90-4EDA-4BD4-AED4-3351BA31CC38' and c.FechaModificacion > DATEADD(S,${segundos},GETDATE())
${selectPEmbarcacion}    select v.Nombre from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena where v.Nombre = '${Embarcacion}' and c.IdTipoComando = 'D4108A90-4EDA-4BD4-AED4-3351BA31CC38' and c.FechaModificacion > DATEADD(S,${segundos},GETDATE())

${countRazonSocial}    select count(v.Nombre) from Sismep.TSismepVehiculos v join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo where rs.Descripcion = '${RazonSocial}'
${countPRazonSocial}    select count(v.Nombre) from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial where rs.Descripcion = '${RazonSocial}' and c.IdTipoComando = 'D4108A90-4EDA-4BD4-AED4-3351BA31CC38' and c.FechaModificacion > DATEADD(S,${segundos},GETDATE())
${selectPRazonSocial}    select top 1 rs.Descripcion from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial where rs.Descripcion = '${RazonSocial}' and c.IdTipoComando = 'D4108A90-4EDA-4BD4-AED4-3351BA31CC38' and c.FechaModificacion > DATEADD(S,${segundos},GETDATE())

${countLitoral}    select count(v.Nombre) from Sismep.TSismepVehiculos v join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo where d.DescripcionCorta = '${Litoral}'
${countPLitoral}    select count(v.Nombre) from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where d.DescripcionCorta = '${Litoral}' and c.IdTipoComando = 'D4108A90-4EDA-4BD4-AED4-3351BA31CC38' and c.FechaModificacion > DATEADD(S,${segundos},GETDATE())
${selectPLitoral}    select top 1 d.DescripcionCorta from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where d.DescripcionCorta = '${Litoral}' and c.IdTipoComando = 'D4108A90-4EDA-4BD4-AED4-3351BA31CC38' and c.FechaModificacion > DATEADD(S,${segundos},GETDATE())

*** Test Cases ***
Poleo_ValidacionEtiquetas
    [Documentation]    Valida que se muestren correctamente escritas las etiquetas de la ventana Poleo.
    [Tags]    Poleo_ValidacionEtiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Poleo
    Validar etiquetas
    [Teardown]    Close Browser

Poleo_Validacion sin Embarcacion
    [Documentation]    Al no seleccionar una embarcacion debera mostrarse una validacion.
    [Tags]    Poleo_Validacion sin Embarcacion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Poleo
    Presionar boton Enviar
    Verificar Mensaje de Validacion    ${Validacion}[Nombre]
    [Teardown]    Close Browser

Poleo_Validacion sin Razon Social
    [Documentation]    Al no seleccionar una Razon Social debera mostrarse una validacion.
    [Tags]    Poleo_Validacion sin Razon Social
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Poleo
    Seleccionar opcion Razon Social
    Presionar boton Enviar
    Verificar Mensaje de Validacion    ${Validacion}[RazonSocial]
    [Teardown]    Close Browser

Poleo_Validacion sin Litoral
    [Documentation]    Al no seleccionar un litoral debera de mostrarse una validacion.
    [Tags]    Poleo_Validacion sin Litoral
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Poleo
    Seleccionar opcion Litoral
    Presionar boton Enviar
    Verificar Mensaje de Validacion    ${Validacion}[Litoral]
    [Teardown]    Close Browser

Poleo_Enviar por Embarcacion
    [Documentation]    Valida el comando de poleo por embarcacion en base de datos
    [Tags]    Poleo_Enviar por Embarcacion - T1052
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Poleo
    Seleccionar Embarcacion
    Presionar boton Enviar
    Sleep    1
    Validar comando en BD    ${countEmbarcacion}    ${countPEmbarcacion}    ${selectPEmbarcacion}    ${Embarcacion}
    [Teardown]    Close Browser

Poleo_Enviar por Razon Social
    [Documentation]    Valida el comando de poleo por razon social en base de datos
    [Tags]    Poleo_Enviar por Razon Social - T1053
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Poleo
    Seleccionar opcion Razon Social
    Seleccionar Razon Social
    Presionar boton Enviar
    Sleep    1
    Validar comando en BD    ${countRazonSocial}    ${countPRazonSocial}    ${selectPRazonSocial}    ${RazonSocial}
    [Teardown]    Close Browser

Poleo_Enviar por Litoral
    [Documentation]    Valida el comando de poleo por litoral en base de datos
    [Tags]    Poleo_Enviar por Litoral - T1054
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Poleo
    Seleccionar opcion Litoral
    Seleccionar Litoral
    Presionar boton Enviar
    Sleep    1
    Validar comando en BD    ${countLitoral}    ${countPLitoral}    ${selectPLitoral}    ${Litoral}
    [Teardown]    Close Browser

*** Keywords ***
Presionar opcion Poleo
    Wait Until Element Is Visible    //*[@id="divPanelControles"]/button[3]
    Click Element    //*[@id="divPanelControles"]/button[3]
    
Seleccionar opcion Razon Social
    Wait Until Element Is Visible    //*[@id="rgPoleoOpciones"]/div/div[2]/div[1]/div
    Click Element    //*[@id="rgPoleoOpciones"]/div/div[2]/div[1]/div
    
Seleccionar opcion Litoral
    Wait Until Element Is Visible    //*[@id="rgPoleoOpciones"]/div/div[3]
    Click Element    //*[@id="rgPoleoOpciones"]/div/div[3]
    
Presionar boton Enviar
    Wait Until Element Is Visible    id=btnPoleoAceptar
    Click Element    id=btnPoleoAceptar
    Wait Until Element Is Not Visible    xpath=/html/body/div[3]/div/div    timeout=15
    
Verificar Mensaje de Validacion
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    class:dx-toast-message
    ${Msj}=    Get Text    class:dx-toast-message
    Should be equal    ${Msj}    ${arg1}
    
Seleccionar Embarcacion
    Wait Until Element Is Visible    //*[@id="ddlPoleoVehiculo"]/div[1]/div/div[2]/div/div/div
    Click Element    //*[@id="ddlPoleoVehiculo"]/div[1]/div/div[2]/div/div/div
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=/html/body/div[4]/div/div/div/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input    ${Embarcacion}
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div/div/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    
Seleccionar Razon Social
    Wait Until Element Is Visible    //*[@id="ddlPoleoRazonSocial"]
    Click Element    //*[@id="ddlPoleoRazonSocial"]
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[8]
    
Seleccionar Litoral
    Wait Until Element Is Visible    //*[@id="ddlPoleoLitoral"]
    Click Element    //*[@id="ddlPoleoLitoral"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    
Validar etiquetas
    Wait Until Element Is Visible    //*[@id="modalPoleoTitulo"]
    ${titulo}=    Get Text    //*[@id="modalPoleoTitulo"]
    ${etqNom1}=    Get Text    //*[@id="rgPoleoOpciones"]/div/div[1]/div[2]
    ${etqNom2}=    Get Text    //*[@id="fgPoleoNombre"]/label
    Click Element    //*[@id="rgPoleoOpciones"]/div/div[2]/div[1]/div
    ${etqRS1}=    Get Text    //*[@id="rgPoleoOpciones"]/div/div[2]/div[2]
    ${etqRS2}=    Get Text    //*[@id="fgPoleoRazonSocial"]/label
    Click Element    //*[@id="rgPoleoOpciones"]/div/div[3]
    ${etqLit1}=    Get Text    //*[@id="rgPoleoOpciones"]/div/div[3]/div[2]
    ${etqLit2}=    Get Text    //*[@id="fgPoleoLitoral"]/label
    ${etqEnviar}=    Get Text    //*[@id="btnPoleoAceptar"]/div/span
    Should Be Equal    ${titulo}    Módulo de Poleo
    Should Be Equal    ${etqNom1}    Nombre
    Should Be Equal    ${etqNom2}    Nombre:
    Should Be Equal    ${etqRS1}    Razón Social
    Should Be Equal    ${etqRS2}    Razón Social:
    Should Be Equal    ${etqLit1}    Litoral
    Should Be Equal    ${etqLit2}    Litoral:
    Should Be Equal    ${etqEnviar}    Enviar
    
Validar comando en BD
    [Arguments]    ${arg1}    ${arg2}    ${arg3}    ${arg4}
    Conexion a Base de Datos
    @{query1}    Query    ${arg1}
    @{query2}    Query    ${arg2}
    Should be equal    ${query1[0][0]}    ${query2[0][0]}
    @{query3}    Query    ${arg3}
    Should be equal    ${arg4}    ${query3[0][0]}
    Disconnect From Database