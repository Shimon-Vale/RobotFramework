*** Settings ***
Resource    Recursos.Zonas.robot

*** Variables ***
${filtroDescripcion}    RF
${filtroTipoZPP}    ZONA DE PESCA PROHIBIDA
${filtroTipoINF}    INFORMATIVA
${zonaEditar}    RFZonaEdicion
${normaEditar}    RFNormaEdicion

*** Test Cases ***
Editar - Validar etiquetas del TAB Generales
    [Documentation]    Debera mostrar correctamente escritas las etiquetas de la pantalla Generales.
    [Tags]    Editar - Validar etiquetas del TAB Generales
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Ingresar al detalle del primer registro en el grid
    Validar etiquetas y tooltips
    [Teardown]    Close Browser
    
Editar - Validar etiquetas del TAB Listas Tipo Carga
    [Documentation]    Debera mostrar correctamente escritas las etiquetas de la pestana Listas Tipo Carga.
    [Tags]    Editar - Validar etiquetas del TAB Listas Tipo Carga
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    2    ${filtroTipoZPP}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Sleep    1
    Ingresar a TAB Listas Tipo Carga
    Sleep    1
    Validar etiquetas del TAB Listas Tipo Carga
    [Teardown]    Close Browser

Editar - Validar etiquetas y tooltips del TAB Geo Punto
    [Documentation]    Debera mostrar correctamente escritas las etiquetas de la pestala GeoPunto.
    [Tags]    Editar - Validar etiquetas y tooltips del TAB Geo Punto
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Sleep    1
    Ingresar a TAB Geo Punto
    Sleep    1
    Validar etiquetas y tooltips del TAB Geo Punto
    [Teardown]    Close Browser
            
Editar - Generales - Actualizar Zona
    [Documentation]    Debera permitir editar la zona correctamente y guardar los cambios.
    [Tags]    Editar - Generales - Actualizar Zona - T277
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Filtrar por    2    ${filtroTipoINF}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Actualizar campo Zona
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    [Teardown]    Close Browser
    
Editar - Generales - Actualizar Norma
    [Documentation]    Debera permitir modificar el campo Norma y guardar los cambios.
    [Tags]    Editar - Generales - Actualizar Norma
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Filtrar por    2    ${filtroTipoINF}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Actualizar campo Norma
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    [Teardown]    Close Browser
    
Editar - Generales - Actualizar Tipo de Zona
    [Documentation]    Debera permitir modificar el Tipo de Zona y guardar los cambios.
    [Tags]    Editar - Generales - Actualizar Tipo de Zona - T1122
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Filtrar por    2    ${filtroTipoINF}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Sleep    1
    Seleccionar Tipo de Zona    2
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    [Teardown]    Close Browser
    
Editar - Generales - Actualizar Punto de Interes
    [Documentation]    Debera permitir modificar el Punto de interes y guardar los cambios.
    [Tags]    Editar - Generales - Actualizar Punto de Interes
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Filtrar por    2    ${filtroTipoINF}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Sleep    1
    Seleccionar Punto de Interes    5
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    [Teardown]    Close Browser
    
Editar - Generales - Actualizar Todos los campos
    [Documentation]    Debera permitir modificar todos los campos y guardar los cambios.
    [Tags]    Editar - Generales - Actualizar Todos los campos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Filtrar por    2    ${filtroTipoINF}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Actualizar campo Zona
    Actualizar campo Norma
    Sleep    1
    Seleccionar Tipo de Zona    2
    Sleep    1
    Seleccionar Punto de Interes    5
    Presionar opcion Guardar
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    [Teardown]    Close Browser
    
Editar - Generales - Actualizar Todos los campos - Cancelar
    [Documentation]    Debera permitir modificar todos los campos y guardar los cambios.
    [Tags]    Editar - Generales - Actualizar Todos los campos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Filtrar por    2    ${filtroTipoINF}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Actualizar campo Zona
    Actualizar campo Norma
    Sleep    1
    Seleccionar Tipo de Zona    2
    Sleep    1
    Seleccionar Punto de Interes    5
    Presionar opcion Cancelar
    Validar registro inexistente en BD    ${valorUnico}
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser

Editar - Generales - Nombre Duplicado
    [Documentation]    Debera mostrar una validacion indicando que el nombre ya existe.
    [Tags]    Editar - Generales - Nombre Duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Filtrar por    2    ${filtroTipoINF}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Actualizar campo Zona Duplicada
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    El registro ya existe.
    [Teardown]    Close Browser
    
Editar - Generales - Campos Obligatorios
    [Documentation]    Debera indicar los campos obligatorios para Editar la zona.
    [Tags]    Editar - Generales - Nombre Duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Filtrar por    2    ${filtroTipoINF}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Dejar vacio los campos del formulario
    Sleep    1
    Presionar opcion Guardar
    Validar campos requeridos
    [Teardown]    Close Browser
    
Editar - Tipo Carga - Agregar
    [Documentation]    Debera permitir agregar un Tipo de carga correctamente.
    [Tags]    Editar - Tipo Carga - Agregar - T269
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Filtrar por    2    ${filtroTipoZPP}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Obtener Nombre de la Zona
    Sleep    1
    Ingresar a TAB Listas Tipo Carga
    Seleccionar Tipo de Carga    4
    Ingresar fecha inicio y fecha fin
    Presionar opcion Agregar
    Validar mensaje    Registro guardado.
    Validar Nueva lista en BD
    [Teardown]    Close Browser
    
Editar - Tipo Carga - Agregar - Fechas incorrectas
    [Documentation]    Debera mostrar una validacion indicando que la fecha Inicial
        ...    no puede ser mayor a la Final.
    [Tags]    Editar - Tipo Carga - Agregar - Fechas incorrectas - T272
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Filtrar por    2    ${filtroTipoZPP}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Sleep    1
    Ingresar a TAB Listas Tipo Carga
    Seleccionar Tipo de Carga    7
    Ingresar fecha inicio mayor a fecha fin
    Presionar opcion Agregar
    Validar mensaje    Fecha Inicio debe ser menor a Fecha Fin.
    [Teardown]    Close Browser
    
Editar - Tipo Carga - Eliminar
    [Documentation]    Debera permitir eliminar un Tipo de Carga correctamente.
    [Tags]    Editar - Tipo Carga - Eliminar - T270
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Filtrar por    2    ${filtroTipoZPP}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Obtener Nombre de la Zona
    Sleep    1
    Ingresar a TAB Listas Tipo Carga
    Presionar opcion Eliminar Tipo de Carga
    Sleep    0.25
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro eliminado.
    Validar lista eliminada en BD
    [Teardown]    Close Browser

Editar - Tipo Carga - Campos obligatorios
    [Documentation]    Debera indicar los campos obligarios para editar un Tipo de Carga.
    [Tags]    Editar - Tipo Carga - Campos obligatorios
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Filtrar por    2    ${filtroTipoZPP}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Sleep    1
    Ingresar a TAB Listas Tipo Carga
    Sleep    1
    Presionar opcion Agregar
    Sleep    1
    Tipo Carga - Validar campos requeridos
    [Teardown]    Close Browser
    
Editar - Geo Punto - Guardar Geo Puntos
    [Documentation]    Debera permitir editar los GeoPuntos y guardarlos correctamente.
    [Tags]    Editar - Geo Punto - Guardar Geo Puntos - T274
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Obtener Nombre de la Zona
    Sleep    1
    Ingresar a TAB Geo Punto
    Capturar coordenadas    25.46896922367321|-110.9694239718254,28.715548227745575|-112.1120020968254,26.259825349945963|-109.3873927218254
    Presionar opcion Agregar Coordenadas
    Presionar opcion Guardar Geo Puntos
    Validar mensaje    Se guardaron correctamente ${NoFilas} registros.
    Validar Puntos en BD
    [Teardown]    Close Browser
    
Editar - Geo Punto - Dejar campo de coordenadas vacia
    [Documentation]    Debera indicar que se ingrese correctamente las coordenadas correspondientes.
    [Tags]    Editar - Geo Punto - Dejar campo de coordenadas vacia
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Sleep    1
    Ingresar a TAB Geo Punto
    Presionar opcion Agregar Coordenadas
    Validar mensaje    Favor de ingresar las coordenadas Latitud|Longitud separadas por (,)
    [Teardown]    Close Browser
    
Editar - Geo Punto - Validar titulo de la ventana Mapa
    [Documentation]    Debera validar que se muestre correctamente escrito el titulo del Mapa.
    [Tags]    Editar - Geo Punto - Validar titulo de la ventana Mapa
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Obtener Nombre de la Zona
    Sleep    1
    Ingresar a TAB Geo Punto
    Presionar opcion Ver en Mapa
    Validar titulo de la ventana Mapa
    [Teardown]    Close Browser
    
Editar - Geo Punto - Eliminar coordenadas
    [Documentation]    Debera permitir eliminar las coordenadas de una zona.
    [Tags]    Editar - Geo Punto - Eliminar coordenadas - T276
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Sleep    1
    Ingresar a TAB Geo Punto
    Capturar coordenadas    25.46896922367321|-110.9694239718254,28.715548227745575|-112.1120020968254,26.259825349945963|-109.3873927218254
    Presionar opcion Borrar Coordenadas
    Validar caja de coordenadas vacia
    [Teardown]    Close Browser
    
Editar - Geo Punto - Eliminar un Geo Punto
    [Documentation]    Debera permitir eliminar un Geopunto de la lista de coordenadas.
    [Tags]    Editar - Geo Punto - Eliminar un Geo Punto
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Obtener Zona con mas de 4 puntos
    Filtrar por    1    ${zn}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Obtener Nombre de la Zona
    Sleep    1
    Ingresar a TAB Geo Punto
    Sleep    1
    Presionar opcion Quitar punto
    Sleep    0.25
    Confirmar accion
    Sleep    1
    Validar mensaje    Se eliminaron correctamente los registros.
    Validar Puntos en BD
    [Teardown]    Close Browser
    
Crear - Geo Punto - Eliminar TODOS los Geo Puntos
    [Documentation]    Debera permitir elimianr todos los GeoPuntos de la Zona.
    [Tags]    Crear - Geo Punto - Eliminar TODOS los Geo Puntos - T275
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Obtener Zona con menos de 4 puntos
    Filtrar por    1    ${zn}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Obtener Nombre de la Zona
    Sleep    1
    Ingresar a TAB Geo Punto
    Sleep    1
    Presionar opcion Borrar Todo
    Sleep    0.25
    Confirmar accion
    Sleep    1
    Validar mensaje    Se eliminaron correctamente los registros.
    Validar Puntos eliminados en BD
    [Teardown]    Close Browser
    
Editar - Geo Punto - Eliminar Geo Puntos a una Zona con menos de 4 puntos
    [Documentation]    Debera mostrar una validacion indicando que es necesario ingresar
        ...    por lo menos 3 geopuntos.
    [Tags]    Editar - Geo Punto - Eliminar Geo Puntos a una Zona con menos de 4 puntos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Obtener Zona con menos de 4 puntos
    Filtrar por    1    ${zn}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Sleep    1
    Ingresar a TAB Geo Punto
    Sleep    1
    Presionar opcion Quitar punto
    Sleep    2
    Validar mensaje    Deben existir al menos tres puntos distintos.
    [Teardown]    Close Browser
    
Editar - Desactivar Zona
    [Documentation]    Debera inactivar la zona correctamente.
    [Tags]    Editar - Desactivar Zona - T279
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${filtroDescripcion}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Sleep    1
    Presionar opcion Eliminar
    Sleep    0.25
    Confirmar accion
    Sleep    1
    Validar mensaje    Cambios guardados.
    Validar registro en BD    0
    [Teardown]    Close Browser

Editar - Re activar Zona
    [Documentation]    Debera reactivar la zona correctamente.
    [Tags]    Editar - Re activar Zona - T280
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    3
    Filtrar por    1    ${filtroDescripcion}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Sleep    1
    Presionar opcion Reactivar
    Sleep    0.25
    Confirmar accion
    Sleep    1
    Validar mensaje    Cambios guardados.
    Validar registro en BD
    [Teardown]    Close Browser
    
*** Keywords ***
Ingresar al detalle del primer registro en el grid
    Click Element    xpath=//*[@id="gridZonas"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[6]/div
    
Actualizar campo Zona
    Validar registro unico    ${zonaEditar}    ${queryZona}
    Input Text    xpath=//*[@id="gen_txtNombre"]/div/div[1]/input    ${valorUnico}
    
Actualizar campo Zona Duplicada
    Input Text    xpath=//*[@id="gen_txtNombre"]/div/div[1]/input    ${RegistroExistente}
    
Actualizar campo Norma
    Validar registro unico    ${normaEditar}    ${queryNorma}
    Input Text    xpath=//*[@id="gen_txtNorma"]/div/div[1]/input    ${valorUnico}
    
Dejar vacio los campos del formulario
    Input Text    xpath=//*[@id="gen_txtNombre"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="gen_txtNorma"]/div/div[1]/input    ${EMPTY}
    #Input Text    xpath=//*[@id="gen_ddlTipoZona"]/div[1]/div/div[1]/input    ${EMPTY}
    #Input Text    xpath=//*[@id="gen_ddlPuntosInteres"]/div[1]/div/div[1]/input    ${EMPTY}
    
Obtener Zona con mas de 4 puntos
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 z.Descripcion from Sismep.TSismepZonasPuntos zp join Sismep.TSismepZonas z on zp.IdZona = z.IdZona where z.Descripcion like '${filtroDescripcion}%' group by z.Descripcion having count(zp.IdSecuencia) >= 4
    Set Test Variable    ${zn}    ${queryResults[0][0]}
    Disconnect From Database
    
Obtener Zona con menos de 4 puntos
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 z.Descripcion from Sismep.TSismepZonasPuntos zp join Sismep.TSismepZonas z on zp.IdZona = z.IdZona where z.Descripcion like '${filtroDescripcion}%' group by z.Descripcion having count(zp.IdSecuencia) < 4
    Set Test Variable    ${zn}    ${queryResults[0][0]}
    Disconnect From Database
    
Filtrar por
    [Arguments]    ${arg1}    ${arg2}
    Wait Until Element Is Enabled    xpath=//*[@id="gridZonas"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="gridZonas"]/div/div[5]/div/table/tbody/tr[2]/td[${arg1}]/div/div[2]/div/div/div[1]/input    ${arg2}
    
Filtrar por Estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="gridZonas"]/div/div[5]/div/table/tbody/tr[2]/td[5]/div/div/div/div[1]/div/div[2]/div[2]/div/div
    Click Element    xpath=//*[@id="gridZonas"]/div/div[5]/div/table/tbody/tr[2]/td[5]/div/div/div/div[1]/div/div[2]/div[2]/div/div
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]/div
    
Ingresar a TAB Listas Tipo Carga
    Click Element    //*[@id="lnkTabListas"]
    Wait Until Element Is Visible     xpath=//*[@id="tabListas"]/div[2]/div[3]/div
    
Ingresar a TAB Geo Punto
    Click Element    //*[@id="lnkTabGeoPunt"]
    Wait Until Element Is Visible     xpath=//*[@id="tabGeoPunt"]/div[2]/div[2]/div/div/div[1]
    
Presionar opcion Eliminar
    Click Element    xpath=//*[@id="gen_btnZonaDesactivar"]
    
Presionar opcion Reactivar
    Click Element    id=gen_btnZonaActivar
    
Tipo Carga - Validar campos requeridos
    ${TipoCarga}=    Get Element Attribute    xpath=//*[@id="ltc_ddlTipoCarga"]    textContent
    ${attrTipoCarga}    Execute Javascript    cadena='${TipoCarga}'; return cadena.substr(length-11);
    Should be equal    ${attrTipoCarga}    Obligatorio
    
Validar campos requeridos
    ${attrNombre}=    Get Element Attribute    xpath=//*[@id="gen_txtNombre"]    textContent
    ${attrNorma}=    Get Element Attribute    xpath=//*[@id="gen_txtNorma"]    textContent
    Should be equal    ${attrNombre}    Obligatorio
    Should be equal    ${attrNorma}    Obligatorio
    
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
    Element Text Should Be    xpath=//*[@id="dx-col-23"]/div[2]    Tipo Carga
    Element Text Should Be    xpath=//*[@id="dx-col-24"]/div[2]    Fecha Inicial
    Element Text Should Be    xpath=//*[@id="dx-col-25"]/div[2]    Fecha Final
    Element Text Should Be    xpath=//*[@id="ltc_dataGirdListas"]/div/div[5]/div/table/tbody/tr[1]/td[4]/div    Acciones
    
Validar etiquetas y tooltips del TAB Geo Punto
    ${ttGuardar}    Get Element Attribute    xpath=//*[@id="tabGeoPunt"]/div[2]/div[1]/div/div/div[1]    tooltip
    ${ttEliminar}    Get Element Attribute    xpath=//*[@id="tabGeoPunt"]/div[2]/div[1]/div/div/div[2]    tooltip
    ${ttMapa}    Get Element Attribute    xpath=//*[@id="tabGeoPunt"]/div[2]/div[2]/div/div/div[1]    tooltip
    ${ttAgregar}    Get Element Attribute    xpath=//*[@id="tabGeoPunt"]/div[2]/div[2]/div/div/div[2]    tooltip
    ${ttLimpiar}    Get Element Attribute    xpath=//*[@id="tabGeoPunt"]/div[2]/div[2]/div/div/div[3]    tooltip
    Element Text Should Be    xpath=//*[@id="lnkTabGeoPunt"]    Geo Punto
    Element Text Should Be    xpath=//*[@id="tabGeoPunt"]/div[1]/div[1]/div[1]/h5    Puntos de la Zona:
    Element Text Should Be    xpath=//*[@id="tabGeoPunt"]/div[1]/div[2]/h5    Coordenadas: Latitud|Longitud Separadas por coma(,):
    Element Text Should Be    xpath=//*[@id="dx-col-26"]/div[2]    Id Secuencia
    Element Text Should Be    xpath=//*[@id="dx-col-27"]/div[2]    Latitud
    Element Text Should Be    xpath=//*[@id="dx-col-28"]/div[2]    Longitud
    Element Text Should Be    xpath=//*[@id="geo_dataGridGeoPuntos"]/div/div[5]/div/table/tbody/tr[1]/td[4]/div    Acciones
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttEliminar}    Borrar Todo
    Should be equal    ${ttMapa}    Ver en mapa
    Should be equal    ${ttAgregar}    Agregar
    Should be equal    ${ttLimpiar}    Borrar Todo