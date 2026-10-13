*** Settings ***
Resource    Recursos.Zonas.robot

*** Variables ***
${zonaCrear}    RFZona
${normaCrear}    RFNorma
${btnGuardar}    //*[@id="gen_btnZonaGaurdar"]

*** Test Cases ***
Crear - Generales - Validar etiquetas y tooltips
    [Documentation]    Debera validar que las etiquetas se muestren correctamente escritas.
    [Tags]    Crear - Validar etiquetas y tooltips - T287
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Validar etiquetas y tooltips
    [Teardown]    Close Browser
    
Crear - Generales - Validar opcion Guardar - TODAS
    [Documentation]    Debera permitir guardar una zona tipo TODAS.
    [Tags]    Crear - Validar opcion Guardar - TODAS
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    1
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    [Teardown]    Close Browser
    
Crear - Generales - Validar opcion Guardar - PUERTO
    [Documentation]    Debera permitir guardar una zona Tipo Puerto.
    [Tags]    Crear - Validar opcion Guardar - PUERTO - T292
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    2
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    [Teardown]    Close Browser
    
Crear - Generales - Validar opcion Guardar - INFORMATIVA
    [Documentation]    Debera permitir guardar una zona Tipo Informativa
    [Tags]    Crear - Validar opcion Guardar - INFORMATIVA - T294
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    3
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    [Teardown]    Close Browser

Crear - Generales - Validar opcion Cancelar - INFORMATIVA
    [Documentation]    Debera permitir guardar una zona Tipo Informativa
    [Tags]    Crear - Validar opcion Guardar - INFORMATIVA - T294
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    3
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Cancelar
    Validar registro inexistente en BD    ${valorUnico}
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser

Crear - Generales - Validar opcion Guardar - De INFORMATIVA a PESCA PROHIBIDA
    [Documentation]    Debera permitir guardar una zona Tipo Informativa
    [Tags]    Crear - Validar opcion Guardar - INFORMATIVA - T294
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    3
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Sleep    1
    Seleccionar Tipo de Zona    6
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Validar TAB Listas Tipo Carga Activo
    [Teardown]    Close Browser
    
Crear - Generales - Validar opcion Guardar - INFORMATIVA con Punto de Interes
    [Documentation]    Debera permitir guardar una zona Tipo Informativa seleccionado un Punto de Interes.
    [Tags]    Crear - Validar opcion Guardar - INFORMATIVA
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    3
    Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    [Teardown]    Close Browser
    
Crear - Generales - Validar opcion Guardar - ZONA DECRETO
    [Documentation]    Debera permitir guardar una zona Tipo Zona Decreto.
    [Tags]    Crear - Validar opcion Guardar - ZONA DECRETO - T289
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    4
    Capturar fecha para Zona Decreto
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    [Teardown]    Close Browser
    
Crear - Generales - Validar opcion Guardar - ZONA RESTRINGIDA
    [Documentation]    Debera permitir guardar una zona Tipo Zona Restringida.
    [Tags]    Crear - Validar opcion Guardar - ZONA RESTRINGIDA - T296
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    5
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    [Teardown]    Close Browser
    
Crear - Generales - Validar opcion Guardar - ZONA DE PESCA PROHIBIDA
    [Documentation]    Debera permitir guardar una zona Tipo Zona Pesca Prohibida.
    [Tags]    Crear - Validar opcion Guardar - ZONA DE PESCA PROHIBIDA - T298
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    6
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    [Teardown]    Close Browser
    
Crear - Generales - Nombre Duplicado
    [Documentation]    Debera de mostrar una validacion indicando que el nombre de la zona ya existe.
    [Tags]    Crear - Generales - Nombre Duplicado.
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Descripcion duplicada    3
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    El registro ya existe.
    [Teardown]    Close Browser
    
Crear - Generales - Campos Obligatorios
    [Documentation]    Debera indicar los campos obligatorios para crear una zona.
    [Tags]    Crear - Generales - Campos Obligatorios
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Presionar opcion Guardar
    Validar campos requeridos
    [Teardown]    Close Browser

Crear - Generales - Campos Obligatorios Zona Decreto
    [Documentation]    Debera indicar los campos obligatorios para crear una zona.
    [Tags]    Crear - Generales - Campos Obligatorios
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Seleccionar Tipo de Zona    4
    Presionar opcion Guardar
    Validar campos requeridos - Zona Decreto
    [Teardown]    Close Browser
    
Crear - Tipo Carga - Validar etiquetas
    [Documentation]    Debera validar que las etiquetas de la pestana Tipo Carga se muestren
        ...    corectamente escritas.
    [Tags]    Crear - Tipo Carga - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    6
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Ingresar a TAB Listas Tipo Carga
    Validar etiquetas del TAB Listas Tipo Carga
    [Teardown]    Close Browser

Crear - Tipo Carga - Agregar
    [Documentation]    Debera permitir agregar un Tipo de Carga a la zona.
    [Tags]    Crear - Tipo Carga - Agregar - T281
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    6
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Ingresar a TAB Listas Tipo Carga
    Seleccionar Tipo de Carga    2
    Ingresar fecha inicio y fecha fin
    Presionar opcion Agregar
    Validar mensaje    Registro guardado.
    Validar Nueva lista en BD
    [Teardown]    Close Browser
    
Crear - Tipo Carga - Agregar - Fechas incorrectas
    [Documentation]    Debera mostrar una validacion indicando que la fecha inicial
        ...    no debe ser mayor a la final.
    [Tags]    Crear - Tipo Carga - Agregar - Fechas incorrectas - T283
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario    6
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Ingresar a TAB Listas Tipo Carga
    Seleccionar Tipo de Carga    2
    Ingresar fecha inicio mayor a fecha fin
    Presionar opcion Agregar
    Validar mensaje    Fecha Inicio debe ser menor a Fecha Fin.
    [Teardown]    Close Browser
    
Crear - Tipo Carga - Eliminar
    [Documentation]    Debera permitir eliminar un Tipo de Carga de la zona.
    [Tags]    Crear - Tipo de Carga - Eliminar - T284
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario    6
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Ingresar a TAB Listas Tipo Carga
    Sleep    1
    Seleccionar Tipo de Carga    2
    Ingresar fecha inicio y fecha fin
    Presionar opcion Agregar
    Sleep    2
    Validar Nueva lista en BD
    Presionar opcion Eliminar Tipo de Carga
    Sleep    0.25
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro eliminado.
    Validar lista eliminada en BD
    [Teardown]    Close Browser
    
Crear - Tipo Carga - Campos obligatorios
    [Documentation]    Debera indicar los campos obligatorios para crear un Tipo de Carga.
    [Tags]    Crear - Tipo Carga - Campos obligatorios 
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    6
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Ingresar a TAB Listas Tipo Carga
    Sleep    1
    Presionar opcion Agregar
    Sleep    1
    Tipo Carga - Validar campos requeridos
    [Teardown]    Close Browser
    
Crear - Geo Punto - Validar etiquetas
    [Documentation]    Debera validar que se muestren correctamente escritas las etiquetas.
    [Tags]    Crear - Geo Punto - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    3
    #Capturar color Hexadecimal
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Ingresar a TAB Geo Punto
    Validar etiquetas y tooltips del TAB Geo Punto
    [Teardown]    Close Browser
        
Crear - Geo Punto - Guardar Geo Puntos
    [Documentation]    Debera permitir guardar los puntos de la zona.
    [Tags]    Crear - Geo Punto - Guardar Geo Puntos - T286
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    3
    #Capturar color Hexadecimal
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Ingresar a TAB Geo Punto
    Capturar coordenadas    25.765500|-100.410964,25.762592|-100.406662,25.759886|-100.407789,25.762968|-100.412628
    Presionar opcion Agregar Coordenadas
    Presionar opcion Guardar Geo Puntos
    Validar mensaje    Se guardaron correctamente ${NoFilas} registros.
    Validar Puntos en BD
    [Teardown]    Close Browser
    
Crear - Geo Punto - Dejar campo de coordenadas vacia
    [Documentation]    Debera mostrar un validacion indicando que se deben ingresar 
        ...    Latitud y longitud.
    [Tags]    Crear - Geo Punto - Dejar campo de coordenadas vacia
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    3
    #Capturar color Hexadecimal
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Ingresar a TAB Geo Punto
    Presionar opcion Agregar Coordenadas
    Validar mensaje    Favor de ingresar las coordenadas Latitud|Longitud separadas por (,)
    [Teardown]    Close Browser
    
Crear - Geo Punto - Validar titulo de la ventana Mapa
    [Documentation]    Debera validar que se mustre correctamente escrtio el titulo.
    [Tags]    Crear - Geo Punto - Validar titulo de la ventana Mapa
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    3
    #Capturar color Hexadecimal
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Ingresar a TAB Geo Punto
    Presionar opcion Ver en Mapa
    Validar titulo de la ventana Mapa
    [Teardown]    Close Browser
    
Crear - Geo Punto - Eliminar coordenadas
    [Documentation]    Debera validar que se eliminen correctamente las coordenadas ingresadas.
    [Tags]    Crear - Geo Punto - Eliminar coordenadas - T1120
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    3
    #Capturar color Hexadecimal
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Ingresar a TAB Geo Punto
    Capturar coordenadas    25.765500|-100.410964,25.762592|-100.406662,25.759886|-100.407789,25.762968|-100.412628
    Presionar opcion Borrar Coordenadas
    Validar caja de coordenadas vacia
    [Teardown]    Close Browser
    
Crear - Geo Punto - Eliminar un Geo Punto
    [Documentation]    Debera permitir eliminar un geopunto de la lista ingresada.
    [Tags]    Crear - Geo Punto - Eliminar un Geo Punto
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    3
    #Capturar color Hexadecimal
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Ingresar a TAB Geo Punto
    Capturar coordenadas    25.765500|-100.410964,25.762592|-100.406662,25.759886|-100.407789,25.762968|-100.412628
    Presionar opcion Agregar Coordenadas
    Presionar opcion Guardar Geo Puntos
    Validar mensaje    Se guardaron correctamente ${NoFilas} registros.
    Validar Puntos en BD
    Presionar opcion Quitar punto
    Sleep    0.25
    Confirmar accion
    Sleep    1
    Validar mensaje    Se eliminaron correctamente los registros.
    Validar Puntos en BD
    [Teardown]    Close Browser
    
Crear - Geo Punto - Eliminar TODOS los Geo Puntos
    [Documentation]    Debera permitir eliminar todos los Geopuntos guardados en la Zona.
    [Tags]    Crear - Geo Punto - Eliminar TODOS los Geo Puntos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    3
    #Capturar color Hexadecimal
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Ingresar a TAB Geo Punto
    Capturar coordenadas    25.765500|-100.410964,25.762592|-100.406662,25.759886|-100.407789,25.762968|-100.412628
    Presionar opcion Agregar Coordenadas
    Presionar opcion Guardar Geo Puntos
    Validar mensaje    Se guardaron correctamente ${NoFilas} registros.
    Validar Puntos en BD
    Presionar opcion Borrar Todo
    Sleep    0.25
    Confirmar accion
    Sleep    1
    Validar mensaje    Se eliminaron correctamente los registros.
    Validar Puntos eliminados en BD
    [Teardown]    Close Browser
    
Crear - Geo Punto - Eliminar Geo Puntos a una Zona con menos de 4 puntos 
    [Documentation]    Debera indicar una validacion donde indique que es necesario
        ...    ingresar por lo menos 3 geopuntos en el mapa.
    [Tags]    Crear - Geo Punto - Eliminar Geo Puntos a una Zona con menos de 4 puntos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario    3
    #Capturar color Hexadecimal
    #Seleccionar Punto de Interes    12
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    Ingresar a TAB Geo Punto
    Capturar coordenadas    23.14632287498098|-109.2995020968254,25.190927040196957|-109.0358302218254,22.29509651274008|-105.9596583468254
    Presionar opcion Agregar Coordenadas
    Presionar opcion Guardar Geo Puntos
    Validar mensaje    Se guardaron correctamente ${NoFilas} registros.
    Validar Puntos en BD
    Presionar opcion Quitar punto
    Sleep    2
    Validar mensaje    Deben existir al menos tres puntos distintos.
    [Teardown]    Close Browser
    
*** Keywords ***
Capturar datos del formulario
    [Arguments]    ${tz}
    Validar registro unico    ${zonaCrear}    ${queryZona}
    Wait Until Element Is Enabled    xpath=//*[@id="gen_txtNombre"]/div/div[1]/input
    Input Text    xpath=//*[@id="gen_txtNombre"]/div/div[1]/input    ${valorUnico}
    Input Text    xpath=//*[@id="gen_txtNorma"]/div/div[1]/input    ${normaCrear}
    Seleccionar Tipo de Zona    ${tz}
    
Capturar datos del formulario Descripcion duplicada
    [Arguments]    ${tz}
    Input Text    xpath=//*[@id="gen_txtNombre"]/div/div[1]/input    ${RegistroExistente}
    Input Text    xpath=//*[@id="gen_txtNorma"]/div/div[1]/input    ${normaCrear}
    Seleccionar Tipo de Zona    ${tz}
    
Capturar color Hexadecimal
    Click Element    xpath=//*[@id="gen_colorPicker"]/div/div/div/div[2]/div[2]/div
    Input Text    xpath=/html/body/div[4]/div/div[1]/div/div/div/div[3]/div/label[4]/div/div/div[1]/input    2ECC71
    Click Element    xpath=/html/body/div[4]/div/div[2]/div/div[3]/div[1]/div/div/div
    
Capturar fecha para Zona Decreto
    Click Element    xpath=//*[@id="gen_dtpFechaDecreto"]/div/div/div[2]/div[2]
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/table/tbody/tr[5]/td[6]
    
Ingresar a TAB Listas Tipo Carga
    Wait Until Element Is Not Visible     xpath=/html/body/div[4]/div/div/div[2]
    Click Element    //*[@id="lnkTabListas"]
    Wait Until Element Is Visible     xpath=//*[@id="tabListas"]/div[2]/div[3]/div
    
Tipo Carga - Validar campos requeridos
    ${TipoCarga}=    Get Element Attribute    xpath=//*[@id="ltc_ddlTipoCarga"]    textContent
    ${attrTipoCarga}    Execute Javascript    cadena='${TipoCarga}'; return cadena.substr(length-11);
    ${attrInicio}=    Get Element Attribute    xpath=//*[@id="ltc_dtpFechaInicio"]    textContent
    ${attrFin}=    Get Element Attribute    xpath=//*[@id="ltc_dtpFechaFin"]    textContent
    Should be equal    ${attrTipoCarga}    Obligatorio
    Should be equal    ${attrInicio}    Obligatorio
    Should be equal    ${attrFin}    Obligatorio
    
Ingresar a TAB Geo Punto
    Wait Until Element Is Not Visible     xpath=/html/body/div[4]/div/div/div[2]
    Click Element    //*[@id="lnkTabGeoPunt"]
    Wait Until Element Is Visible     xpath=//*[@id="tabGeoPunt"]/div[2]/div[2]/div/div/div[1]
    
Validar campos requeridos
    ${attrNombre}=    Get Element Attribute    xpath=//*[@id="gen_txtNombre"]    textContent
    ${attrNorma}=    Get Element Attribute    xpath=//*[@id="gen_txtNorma"]    textContent
    ${TipoZona}=    Get Element Attribute    xpath=//*[@id="gen_ddlTipoZona"]    textContent
    ${attrTipoZona}    Execute Javascript    cadena='${TipoZona}'; return cadena.substr(length-11);
    #${PI}=    Get Element Attribute    xpath=//*[@id="gen_ddlPuntosInteres"]    textContent
    #${attrPI}    Execute Javascript    cadena='${PI}'; return cadena.substr(length-11);
    Should be equal    ${attrNombre}    Obligatorio
    Should be equal    ${attrNorma}    Obligatorio
    Should be equal    ${attrTipoZona}    Obligatorio
    #Should be equal    ${attrPI}    Obligatorio
    
Validar campos requeridos - Zona Decreto
    ${attrNombre}=    Get Element Attribute    xpath=//*[@id="gen_txtNombre"]    textContent
    ${attrNorma}=    Get Element Attribute    xpath=//*[@id="gen_txtNorma"]    textContent
    ${attrFecha}=    Get Element Attribute    xpath=//*[@id="gen_dtpFechaDecreto"]    textContent
    Should be equal    ${attrNombre}    Obligatorio
    Should be equal    ${attrNorma}    Obligatorio
    Should be equal    ${attrFecha}    Obligatorio

Validar etiquetas y tooltips
    ${ttGuardar}    Get Element Attribute    id=gen_btnZonaGaurdar    tooltip
    ${ttCancelar}    Get Element Attribute    xpath=//*[@id="tabEditarZona"]/div[8]/div/div[2]    tooltip
    ${ttEliminar}    Get Element Attribute    id=gen_btnZonaDesactivar    tooltip
    ${ttReactivar}    Get Element Attribute    id=gen_btnZonaActivar    tooltip
    Element Text Should Be    xpath=//*[@id="lnkTabEditarZona"]    Generales
    Element Text Should Be    xpath=//*[@id="tabEditarZona"]/div[1]/div[1]    Estatus:
    Element Text Should Be    xpath=//*[@id="tabEditarZona"]/div[2]/div[1]    Datos de Zona:
    Element Text Should Be    xpath=//*[@id="tabEditarZona"]/div[3]/div[1]    Norma:
    Element Text Should Be    xpath=//*[@id="tabEditarZona"]/div[4]/div[1]    Color:
    Element Text Should Be    xpath=//*[@id="tabEditarZona"]/div[5]/div[1]    Tipo de Zona:
    Element Text Should Be    xpath=//*[@id="tabEditarZona"]/div[6]/div[1]    Puntos de Interés:
    Element Text Should Be    xpath=//*[@id="tabEditarZona"]/div[7]/div[1]    Fecha Decreto:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    Should be equal    ${ttEliminar}    Eliminar
    Should be equal    ${ttReactivar}    Reactivar
    
Validar etiquetas del TAB Listas Tipo Carga
    Element Text Should Be    xpath=//*[@id="lnkTabListas"]    Listas Tipo Carga
    Element Text Should Be    xpath=//*[@id="tabListas"]/div[1]/div[1]    Tipo de Carga:
    Element Text Should Be    xpath=//*[@id="tabListas"]/div[2]/div[2]/div/div[1]    Fecha Inicio:
    Element Text Should Be    xpath=//*[@id="tabListas"]/div[2]/div[2]/div/div[3]    Fecha Fin:
    Element Text Should Be    xpath=//*[@id="dx-col-12"]/div[2]    Tipo Carga
    Element Text Should Be    xpath=//*[@id="dx-col-13"]/div[2]    FechaInicial
    Element Text Should Be    xpath=//*[@id="dx-col-14"]/div[2]    FechaFinal
    Element Text Should Be    xpath=//*[@id="ltc_dataGirdListas"]/div/div[5]/div/table/tbody/tr[1]/td[4]/div    Acciones
    
Validar etiquetas y tooltips del TAB Geo Punto
    ${ttGuardar}    Get Element Attribute    xpath=//*[@id="tabGeoPunt"]/div[2]/div[1]/div/div/div[1]    tooltip
    ${ttEliminarP}    Get Element Attribute    xpath=//*[@id="tabGeoPunt"]/div[2]/div[1]/div/div/div[2]    tooltip
    ${ttMapa}    Get Element Attribute    xpath=//*[@id="tabGeoPunt"]/div[2]/div[2]/div/div/div[1]    tooltip
    ${ttAgregar}    Get Element Attribute    xpath=//*[@id="tabGeoPunt"]/div[2]/div[2]/div/div/div[2]    tooltip
    ${ttEliminarC}    Get Element Attribute    xpath=//*[@id="tabGeoPunt"]/div[2]/div[2]/div/div/div[3]    tooltip
    Element Text Should Be    xpath=//*[@id="lnkTabGeoPunt"]    Geo Punto
    Element Text Should Be    xpath=//*[@id="tabGeoPunt"]/div[1]/div[1]/div[1]/h5    Puntos de la Zona:
    Element Text Should Be    xpath=//*[@id="tabGeoPunt"]/div[1]/div[2]/h5    Coordenadas: Latitud|Longitud Separadas por coma(,):
    Element Text Should Be    xpath=//*[@id="dx-col-15"]/div[2]    Id Secuencia
    Element Text Should Be    xpath=//*[@id="dx-col-16"]/div[2]    Latitud
    Element Text Should Be    xpath=//*[@id="dx-col-17"]/div[2]    Longitud
    Element Text Should Be    xpath=//*[@id="geo_dataGridGeoPuntos"]/div/div[5]/div/table/tbody/tr[1]/td[4]/div    Acciones
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttEliminarP}    Borrar Todo
    Should be equal    ${ttMapa}    Ver en mapa
    Should be equal    ${ttAgregar}    Agregar
    Should be equal    ${ttEliminarC}    Borrar Todo

Validar TAB Listas Tipo Carga Activo
    ${tipoCarga}=    Execute Javascript    return document.getElementById("lnkTabListas").getAttribute("class")
    Should be equal    ${tipoCarga}    nav-link