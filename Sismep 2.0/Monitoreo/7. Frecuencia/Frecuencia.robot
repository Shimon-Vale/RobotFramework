*** Settings ***
Resource    ../../Recursos.Generales.robot

*** Variables ***
&{Validacion}    Nombre=Favor de seleccionar una Embarcación.    RazonSocial=Favor de seleccionar la Razón Social.    Litoral=Favor de seleccionar el Litoral.
...              Frecuencia=Favor de seleccionar una frecuencia mayor a 0.    Rango=Valor fuera de rango

${Embarcacion}    ARIES
${RazonSocial}    ALEJANDRO MONTANEZ ROSADO
${Litoral}    pacifico
${segundos}    -3

${countEmbarcacion}    select count(Nombre) from Sismep.TSismepVehiculos where Nombre = '${Embarcacion}'
${countPEmbarcacion}    select count(v.Nombre) from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena where v.Nombre = '${Embarcacion}' and c.IdTipoComando = '4C2BE91E-5B9C-4EE3-AC54-F515A65567A4' and c.FechaModificacion > DATEADD(S,${segundos},GETDATE())
${selectPEmbarcacion}    select v.Nombre from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena where v.Nombre = '${Embarcacion}' and c.IdTipoComando = '4C2BE91E-5B9C-4EE3-AC54-F515A65567A4' and c.FechaModificacion > DATEADD(S,${segundos},GETDATE())

${countRazonSocial}    select count(v.Nombre) from Sismep.TSismepVehiculos v join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial where rs.Descripcion = '${RazonSocial}'
${countPRazonSocial}    select count(v.Nombre) from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial where rs.Descripcion = '${RazonSocial}' and c.IdTipoComando = '4C2BE91E-5B9C-4EE3-AC54-F515A65567A4' and c.FechaModificacion > DATEADD(S,${segundos},GETDATE())
${selectPRazonSocial}    select top 1 rs.Descripcion from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial where rs.Descripcion = '${RazonSocial}' and c.IdTipoComando = '4C2BE91E-5B9C-4EE3-AC54-F515A65567A4' and c.FechaModificacion > DATEADD(S,${segundos},GETDATE())

#${countLitoral}    select count(v.Nombre) from Sismep.TSismepVehiculos v join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo where d.DescripcionCorta = '${Litoral}'
${countLitoral}    select count(v.Nombre) from Sismep.TSismepVehiculos v join Sismep.TSismepAntenas a on v.IdAntena = a.IdAntena join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where d.DescripcionCorta = '${Litoral}' and v.Texto5 = 'Barco' and v.Activo = 1
${countPLitoral}    select count(v.Nombre) from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where d.DescripcionCorta = '${Litoral}' and c.IdTipoComando = '4C2BE91E-5B9C-4EE3-AC54-F515A65567A4' and c.FechaModificacion > DATEADD(S,${segundos},GETDATE())
${selectPLitoral}    select top 1 d.DescripcionCorta from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where d.DescripcionCorta = '${Litoral}' and c.IdTipoComando = '4C2BE91E-5B9C-4EE3-AC54-F515A65567A4' and c.FechaModificacion > DATEADD(S,${segundos},GETDATE())

*** Test Cases ***
Frecuencia_ValidacionEtiquetas
    [Documentation]    Valida que las etiquetas se encuentren correctamente escritas en la ventana de Frecuencia.
    [Tags]    Frecuencia_ValidacionEtiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Frecuencia
    Validar etiquetas
    [Teardown]    Close Browser

Frecuencia_Validacion Sin Embarcacion
    [Documentation]    Al no seleccionar una embarcacion debera de mostrar una validacion.
    [Tags]    Frecuencia_Validacion Sin Embarcacion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Frecuencia
    Seleccionar Nueva Frecuencia
    Presionar boton Enviar
    Verificar Mensaje de Validacion    ${Validacion}[Nombre]
    [Teardown]    Close Browser

Frecuencia_Validacion Sin Razon_Social
    [Documentation]    Al no seleccionar una Razon Social debera de mostrar una validacion.
    [Tags]    Frecuencia_Validacion Sin Razon_Social
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Frecuencia
    Seleccionar opcion Razon Social
    Seleccionar Nueva Frecuencia
    Presionar boton Enviar
    Verificar Mensaje de Validacion    ${Validacion}[RazonSocial]
    [Teardown]    Close Browser

Frecuencia_Validacion Sin Litoral
    [Documentation]    Al no seleccionar un Litoral debera de mostrar una validacion.
    [Tags]    Frecuencia_Validacion Sin Litoral
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Frecuencia
    Seleccionar opcion Litoral
    Seleccionar Nueva Frecuencia
    Presionar boton Enviar
    Verificar Mensaje de Validacion    ${Validacion}[Litoral]
    [Teardown]    Close Browser

Frecuencia_Validacion Frecuencia=0
    [Documentation]    Debera de mostrar una validacion cuando la frecuencia seleccionada sea menor o igual a 0.
    [Tags]    Frecuencia_Validacion Frecuencia=0
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Frecuencia
    Sleep    1
    Presionar boton Enviar
    Verificar Mensaje de Validacion    ${Validacion}[Frecuencia]
    [Teardown]    Close Browser

Frecuencia_Validacion Vigencia Fuera_Rango
    [Documentation]    Debera de mostrar una validacion cuando la fecha seleccionada se encuentre fuera de rango.
    [Tags]    Frecuencia_Validacion Vigencia Fuera_Rango
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Frecuencia
    Seleccionar Vigencia Fuera Rango
    Verificar Mensaje de Validacion Fuera Rango    ${Validacion}[Rango]
    [Teardown]    Close Browser

Frecuencia_Enviar por Embarcacion
    [Documentation]    Valida el comando de cambio de frecuencia por embarcacion en base de datos
    [Tags]    Frecuencia_Enviar por Embarcacion - T1055
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Frecuencia
    Seleccionar Embarcacion
    Seleccionar Nueva Frecuencia
    Seleccionar Vigencia
    Presionar boton Enviar
    Sleep    1
    Validar comando en BD    ${countEmbarcacion}    ${countPEmbarcacion}    ${selectPEmbarcacion}    ${Embarcacion}
    [Teardown]    Close Browser

Frecuencia_Enviar por Razon Social
    [Documentation]    Valida el comando de cambio de frecuencia por razon social en base de datos
    ...    De acuerso con Desarrollo el cambio de frecuencia se envia a todas las embarcaciones de la razon social
    ...    aunque no se encuentren reportando (previamente reportada como incidencia S20-1442)
    [Tags]    Frecuencia_Enviar por Razon Social - T1056
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Frecuencia
    Seleccionar opcion Razon Social
    Seleccionar Razon Social
    Seleccionar Nueva Frecuencia    div=5
    Seleccionar Vigencia
    Presionar boton Enviar
    Sleep    1
    Validar comando en BD    ${countRazonSocial}    ${countPRazonSocial}    ${selectPRazonSocial}    ${RazonSocial}
    [Teardown]    Close Browser

Frecuencia_Enviar por Litoral
    [Documentation]    Valida el comando de cambio de frecuencia por litoral en base de datos
    ...    De acuerso con Desarrollo el cambio de frecuencia se envia a todas las embarcaciones de la razon social
    ...    aunque no se encuentren reportando
    [Tags]    Frecuencia_Enviar por Litoral - T1057
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Frecuencia
    Seleccionar opcion Litoral
    Seleccionar Litoral
    Seleccionar Nueva Frecuencia
    Seleccionar Vigencia
    Presionar boton Enviar
    Sleep    1
    Validar comando en BD    ${countLitoral}    ${countPLitoral}    ${selectPLitoral}    ${Litoral}
    [Teardown]    Close Browser

*** Keywords ***
Presionar opcion Frecuencia
    Wait Until Element Is Visible    //*[@id="divPanelControles"]/button[6]
    Click Element    //*[@id="divPanelControles"]/button[6]
    
Seleccionar Nueva Frecuencia
    [Arguments]    ${div}=4
    Wait Until Element Is Visible    //*[@id="ddlFrecuenciaNueva"]
    Click Element    //*[@id="ddlFrecuenciaNueva"]
    Wait Until Element Is Visible    xpath=/html/body/div[${div}]/div/div/div/div[1]/div/div[1]/div[2]/div[6]/div
    Click Element    xpath=/html/body/div[${div}]/div/div/div/div[1]/div/div[1]/div[2]/div[6]/div
    
Seleccionar opcion Razon Social
    Wait Until Element Is Visible    //*[@id="rgFrecuenciaOpciones"]/div/div[2]
    Click Element    //*[@id="rgFrecuenciaOpciones"]/div/div[2]
    
Seleccionar opcion Litoral
    Wait Until Element Is Visible    //*[@id="rgFrecuenciaOpciones"]/div/div[3]
    Click Element    //*[@id="rgFrecuenciaOpciones"]/div/div[3]
    
Seleccionar Embarcacion
    Wait Until Element Is Visible    //*[@id="ddlFrecuenciaVehiculo"]
    Click Element    //*[@id="ddlFrecuenciaVehiculo"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=/html/body/div[4]/div/div/div/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input    ${Embarcacion}
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div/div/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    
Seleccionar Razon Social
    Wait Until Element Is Visible    //*[@id="ddlFrecuenciaRazonSocial"]
    Click Element    //*[@id="ddlFrecuenciaRazonSocial"]
    Wait Until Page Contains Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[8]/div    timeout=15
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[8]/div
    
Seleccionar Litoral
    Wait Until Element Is Visible    //*[@id="ddlFrecuenciaLitoral"]
    Click Element    //*[@id="ddlFrecuenciaLitoral"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    
Seleccionar Vigencia
    Wait Until Element Is Visible    //*[@id="dpFrecuenciaVigencia"]/div/div/div[2]/div[2]
    Click Element    //*[@id="dpFrecuenciaVigencia"]/div/div/div[2]/div[2]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div[1]/div/div[2]/div/div/div/div/div[2]/div/div/div[1]/div/div/div/div[2]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div[1]/div/div[2]/div/div/div/div/div[2]/div/div/div[1]/div/div/div/div[2]/div[2]/div[1]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div[2]/div/div[3]/div[1]/div
    Click Element    xpath=/html/body/div[4]/div/div[2]/div/div[3]/div[1]/div
    
Seleccionar Vigencia Fuera Rango
    Wait Until Element Is Visible    //*[@id="dpFrecuenciaVigencia"]/div/div/div[2]/div[2]
    Click Element    //*[@id="dpFrecuenciaVigencia"]/div/div/div[2]/div[2]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div[1]/div/div[2]/div/div/div/div/div[2]/div/div/div[1]/div/div/div/div[2]/div[2]/div[2]
    Click Element    xpath=/html/body/div[4]/div/div[1]/div/div[2]/div/div/div/div/div[2]/div/div/div[1]/div/div/div/div[2]/div[2]/div[2]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div[2]/div/div[3]/div[1]/div
    Click Element    xpath=/html/body/div[4]/div/div[2]/div/div[3]/div[1]/div
    
Presionar boton Enviar
    Wait Until Element Is Visible    //*[@id="btnFrecuenciaAceptar"]
    Click Element    //*[@id="btnFrecuenciaAceptar"]
    
Verificar Mensaje de Validacion
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    class:dx-toast-message
    ${Msj}=    Get Text    class:dx-toast-message
    Should be equal    ${Msj}    ${arg1}
    
Verificar Mensaje de Validacion Fuera Rango
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    //*[@id="dpFrecuenciaVigencia"]/div[3]/div/div
    ${Msj}=    Get Text    //*[@id="dpFrecuenciaVigencia"]/div[3]/div/div
    Should be equal    ${Msj}    ${arg1}
    
Validar etiquetas
    Wait Until Element Is Visible    //*[@id="modalFrecuenciaTitulo"]
    ${titulo}=    Get Text    //*[@id="modalFrecuenciaTitulo"]
    ${etqNom1}=    Get Text    //*[@id="rgFrecuenciaOpciones"]/div/div[1]/div[2]
    ${etqNom2}=    Get Text    //*[@id="fgFrecuenciaNombre"]/label
    ${etqNue}=    Get Text    //*[@id="modalFrecuencia"]/div/div/div[2]/div[5]/label
    ${etqVig}=    Get Text    //*[@id="modalFrecuencia"]/div/div/div[2]/div[6]/label
    Click Element    //*[@id="rgFrecuenciaOpciones"]/div/div[2]
    ${etqRS1}=    Get Text    //*[@id="rgFrecuenciaOpciones"]/div/div[2]/div[2]
    ${etqRS2}=    Get Text    //*[@id="fgFrecuenciaRazonSocial"]/label
    Click Element    //*[@id="rgFrecuenciaOpciones"]/div/div[3]
    ${etqLit1}=    Get Text    //*[@id="rgFrecuenciaOpciones"]/div/div[3]/div[2]
    ${etqLit2}=    Get Text    //*[@id="fgFrecuenciaLitoral"]/label
    ${etqEnviar}=    Get Text    //*[@id="btnFrecuenciaAceptar"]/div/span
    Should Be Equal    ${titulo}    Módulo de Frecuencia
    Should Be Equal    ${etqNom1}    Nombre
    Should Be Equal    ${etqNom2}    Nombre:
    Should Be Equal    ${etqNue}    Nueva Frecuencia:
    Should Be Equal    ${etqVig}    Vigencia:
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