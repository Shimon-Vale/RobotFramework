*** Settings ***
Resource    Recursos.TiposReporte.robot

*** Variables ***
${TREditar}    RFTipoReporteEditar
${TRFiltro}    RFTipo

*** Test Cases ***
Editar - TAB Generales - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Editar - TAB Generales - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Columna 1 y Campo ${TRFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Validar etiquetas TAB Generales
    [Teardown]    Close Browser
    
Editar - TAB Generales - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion y no guardar en la Base de datos.
    [Tags]    Editar - TAB Generales - Validar opcion Cancelar - T143
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Obtener Tipo de Reporte sin Mensaje
    Filtrar por Columna 1 y Campo ${tiporeporte}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Capturar datos del formulario Generales TODOS los campos    ${TREditar}
    Sleep    1
    Obtener datos del formulario - TAB Generales
    Presionar opcion Cancelar
    Sleep    2
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    Sleep    2
    Validar Tipo de Reporte inexistente en BD
    [Teardown]    Close Browser
    
Editar - TAB Generales - Validar opcion Guardar (Todos los campos)
    [Documentation]    Debera guardar correctamente el registro.
    [Tags]    Editar - TAB Generales - Validar opcion Guardar (Todos los campos)
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Obtener Tipo de Reporte sin Mensaje
    Filtrar por Columna 1 y Campo ${tiporeporte}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Capturar datos del formulario Generales TODOS los campos    ${TREditar}
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Validar mensaje    Registro guardado.
    Sleep    2
    Obtener datos del formulario - TAB Generales
    Validar Tipo de Reporte en BD
    [Teardown]    Close Browser
    
Editar - TAB Acciones - Validar etiquetas
    [Documentation]    Debera mostrar correctamente escritas las etiquetas.
    [Tags]    Editar - TAB Acciones - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Filtrar por Columna 1 y Campo ${TRFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Obtener datos del formulario - TAB Generales
    Ingresar a opcion Acciones
    Sleep    1
    Validar etiquetas TAB Acciones
    [Teardown]    Close Browser
    
Editar - TAB Acciones - Agregar Accion
    [Documentation]    Debera agregar correctamente una accion.
    [Tags]    Editar - TAB Acciones - Agregar Accion - T142
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Obtener Tipo de Reporte sin Acciones
    Filtrar por Columna 1 y Campo ${tiporeporte}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Obtener datos del formulario - TAB Generales
    Ingresar a opcion Acciones
    Sleep    1
    Seleccionar Accion    Verifica Distancias
    Capturar Orden    1
    Presionar opcion Guardar Accion
    Sleep    1
    Obtener datos del Grid Acciones
    Validar Accion en BD
    [Teardown]    Close Browser
    
Editar - TAB Acciones - Eliminar Accion
    [Documentation]    Debera eliminar la accion correctamente.
    [Tags]    Editar - TAB Acciones - Eliminar Accion - T146
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Obtener Tipo de Reporte sin Acciones
    Filtrar por Columna 1 y Campo ${tiporeporte}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Obtener datos del formulario - TAB Generales
    Sleep    1
    Ingresar a opcion Acciones
    Seleccionar Accion    Verifica Distancias
    Capturar Orden    1
    Presionar opcion Guardar Accion
    Sleep    1
    Obtener datos del Grid Acciones
    Validar Accion en BD
    Presionar opcion Ver Detalle
    Presionar opcion Eliminar
    Sleep    2
    Confirma Accion
    Sleep    2
    Validar Accion inexistente en BD
    [Teardown]    Close Browser
    
*** Keywords ***
Ingresar al detalle del registro No. ${arg1} en el grid
    Click Element    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[6]/div
    Wait Until Element Is Visible	xpath=//*[@id="gen_btnGuardar"]
    
Obtener Tipo de Reporte sin Mensaje
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 rm.Descripcion from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Descripcion like '%${TRFiltro}%' and em.Descripcion is null and rm.RegistrarEstatus = 0 and rm.ValidarCuadrante = 0
    Set Test Variable    ${tiporeporte}    ${queryResults[0][0]}
    Disconnect From Database
    
Obtener Tipo de Reporte sin Acciones
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 rm.Descripcion from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje left join Sismep.TSismepTiposReporteD rd on rm.IdTipoReporteM = rd.IdTipoReporteM left join Sismep.TSismepDetalle d on rd.IdAccion = d.IdDetalle where rm.Descripcion like '%RFTipo%' and d.DescripcionLarga is null
    Set Test Variable    ${tiporeporte}    ${queryResults[0][0]}
    Disconnect From Database
    
Validar etiquetas TAB Generales
    ${ttGuardar}    Get Element Attribute    xpath=//*[@id="gen_btnGuardar"]    tooltip
    ${ttCancelar}    Get Element Attribute    xpath=//*[@id="tabGenerales"]/div[5]/div/div[2]    tooltip
    ${ttEliminar}    Get Element Attribute    xpath=//*[@id="gen_btnDesactivar"]    tooltip
    ${ttReactivar}    Get Element Attribute    xpath=//*[@id="gen_btnActivar"]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Editar Tipo de Reporte
    Element Text Should Be    xpath=//*[@id="lnkTabGenerales"]    Generales
    Element Text Should Be    xpath=//*[@id="tabGenerales"]/div[1]/div[1]    Estatus:
    Element Text Should Be    xpath=//*[@id="tabGenerales"]/div[2]/div[1]    Descripción:
    Element Text Should Be    xpath=//*[@id="tabGenerales"]/div[3]/div[1]    Validar Cuadrante:
    Element Text Should Be    xpath=//*[@id="tabGenerales"]/div[4]/div[1]    Registrar Estatus:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    Should be equal    ${ttEliminar}    Eliminar
    Should be equal    ${ttReactivar}    Reactivar