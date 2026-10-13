*** Settings ***
Resource    Recursos.MaestroDetalle.robot

*** Variables ***
&{DetalleEditar}    DCorta=RFDCortaEditar    DLarga=RFDLargaEditar
#${TCExistente}    CALAMAR

${FiltroDescripcion}    Tipos de Acciones
&{FiltroDetalleA}    DCorta=mi    DLarga=dad
&{FiltroDetalleI}    DCorta=Em    DLarga=Em

${countEstatusA}    select count(d.Activo) from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.Activo = 1
${selectEstatusA}    select top 1 m.DescripcionLarga, d.DescripcionCorta, d.DescripcionLarga from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.Activo = 1 order by d.DescripcionCorta
${countDCortaA}    select count(d.DescripcionCorta) from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.DescripcionCorta like '%${FiltroDetalleA}[DCorta]%' and d.Activo = 1
${selectDCortaA}    select top 1 m.DescripcionLarga, d.DescripcionCorta, d.DescripcionLarga from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.DescripcionCorta like '%${FiltroDetalleA}[DCorta]%' and d.Activo = 1 order by d.DescripcionCorta
${countDLargaA}    select count(d.DescripcionLarga) from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.DescripcionLarga like '%${FiltroDetalleA}[DLarga]%' and d.Activo = 1
${selectDLargaA}    select top 1 m.DescripcionLarga, d.DescripcionCorta, d.DescripcionLarga from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.DescripcionLarga like '%${FiltroDetalleA}[DLarga]%' and d.Activo = 1 order by d.DescripcionCorta
${countEstatusI}    select count(d.Activo) from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.Activo = 0
${selectEstatusI}    select top 1 m.DescripcionLarga, d.DescripcionCorta, d.DescripcionLarga from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.Activo = 0 order by d.DescripcionCorta
${countDCortaI}    select count(d.DescripcionCorta) from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.DescripcionCorta like '%${FiltroDetalleI}[DCorta]%' and d.Activo = 0
${selectDCortaI}    select top 1 m.DescripcionLarga, d.DescripcionCorta, d.DescripcionLarga from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.DescripcionCorta like '%${FiltroDetalleI}[DCorta]%' and d.Activo = 0 order by d.DescripcionCorta
${countDLargaI}    select count(d.DescripcionLarga) from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.DescripcionLarga like '%${FiltroDetalleI}[DLarga]%' and d.Activo = 0
${selectDLargaI}    select top 1 m.DescripcionLarga, d.DescripcionCorta, d.DescripcionLarga from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.DescripcionLarga like '%${FiltroDetalleI}[DLarga]%' and d.Activo = 0 order by d.DescripcionCorta
${countEstatus}    select count(d.Activo) from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}'
${selectEstatus}    select top 1 m.DescripcionLarga, d.DescripcionCorta, d.DescripcionLarga from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' order by d.DescripcionCorta
${countDCorta}    select count(d.DescripcionCorta) from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.DescripcionCorta like '%${FiltroDetalleA}[DCorta]%'
${selectDCorta}    select top 1 m.DescripcionLarga, d.DescripcionCorta, d.DescripcionLarga from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.DescripcionCorta like '%${FiltroDetalleA}[DCorta]%' order by d.DescripcionCorta
${countDLarga}    select count(d.DescripcionLarga) from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.DescripcionLarga like '%${FiltroDetalleA}[DLarga]%'
${selectDLarga}    select top 1 m.DescripcionLarga, d.DescripcionCorta, d.DescripcionLarga from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.DescripcionLarga like '%${FiltroDetalleA}[DLarga]%' order by d.DescripcionCorta

${Todos}    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
${Activo}    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[2]
${Inactivo}    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[3]

*** Test Cases ***
Editar - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Editar - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Ingresar al detalle del registro No. 1 en el grid
    Validar etiquetas
    [Teardown]    Close Browser
    
Editar - Filtro Estatus Activo
    [Documentation]    Debera mostrar todos los registros Activos.
    [Tags]    Editar - Filtro Estatus Activo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Validar resultado contra BD    ${countEstatusA}    ${selectEstatusA}
    [Teardown]    Close Browser
    
Editar - Filtro Estatus Activo - Descripcion Corta
    [Documentation]    Debera mostrar los registros activos que coincidan con
        ...    lo ingresado en Descripcion Corta.
    [Tags]    Editar - Filtro Estatus Activo - Descripcion Corta
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Detalle Filtrar por Columna 1 y Campo ${FiltroDetalleA}[DCorta]
    Sleep    1
    Validar resultado contra BD    ${countDCortaA}    ${selectDCortaA}
    [Teardown]    Close Browser
    
Editar - Filtro Estatus Activo - Descripcion Larga
    [Documentation]    Debera mostrar los registros activos que coincidan con
        ...    lo ingresado en Descripcion Larga.
    [Tags]    Editar - Filtro Estatus Activo - Descripcion Larga
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Detalle Filtrar por Columna 2 y Campo ${FiltroDetalleA}[DLarga]
    Sleep    1
    Validar resultado contra BD    ${countDLargaA}    ${selectDLargaA}
    [Teardown]    Close Browser
    
Editar - Filtro Estatus Inactivo
    [Documentation]    Debera mostrar los registros Inactivos.
    [Tags]    Editar - Filtro Estatus Inactivo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Filtrar por Estatus    ${Inactivo}
    Sleep    1
    Validar resultado contra BD    ${countEstatusI}    ${selectEstatusI}
    [Teardown]    Close Browser
    
Editar - Filtro Estatus Inactivo - Descripcion Corta
    [Documentation]    Debera mostrar los registros inactivos que coincidan con
        ...    lo ingresado en Descripcion Corta.
    [Tags]    Editar - Filtro Estatus Inactivo - Descripcion Corta
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Filtrar por Estatus    ${Inactivo}
    Detalle Filtrar por Columna 1 y Campo ${FiltroDetalleI}[DCorta]
    Sleep    1
    Validar resultado contra BD    ${countDCortaI}    ${selectDCortaI}
    [Teardown]    Close Browser
    
Editar - Filtro Estatus Inactivo - Descripcion Larga
    [Documentation]    Debera mostrar los registros inactivos que coincidan con
        ...    lo ingresado en Descripcion Larga.
    [Tags]    Editar - Filtro Estatus Inactivo - Descripcion Larga
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Filtrar por Estatus    ${Inactivo}
    Detalle Filtrar por Columna 2 y Campo ${FiltroDetalleI}[DLarga]
    Sleep    1
    Validar resultado contra BD    ${countDLargaI}    ${selectDLargaI}
    [Teardown]    Close Browser
    
Editar - Filtro Estatus Todos
    [Documentation]    Debera mostrar Todos los registros.
    [Tags]    Editar - Filtro Estatus Todos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Filtrar por Estatus    ${Todos}
    Validar resultado contra BD    ${countEstatus}    ${selectEstatus}
    [Teardown]    Close Browser
    
Editar - Filtro Estatus Todos - Descripcion Corta
    [Documentation]    Debera mostrar los registros activos e inactivos que coincidan con
        ...    lo ingresado en Descripcion Corta.
    [Tags]    Editar - Filtro Estatus Todos - Descripcion Corta
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Filtrar por Estatus    ${Todos}
    Detalle Filtrar por Columna 1 y Campo ${FiltroDetalleA}[DCorta]
    Sleep    1
    Validar resultado contra BD    ${countDCorta}    ${selectDCorta}
    [Teardown]    Close Browser
    
Editar - Filtro Estatus Todos - Descripcion Larga
    [Documentation]    Debera mostrar los registros activos e inactivos que coincidan con
        ...    lo ingresado en Descripcion Larga.
    [Tags]    Editar - Filtro Estatus Todos - Descripcion Larga
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Filtrar por Estatus    ${Todos}
    Detalle Filtrar por Columna 2 y Campo ${FiltroDetalleA}[DLarga]
    Sleep    1
    Validar resultado contra BD    ${countDLarga}    ${selectDLarga}
    [Teardown]    Close Browser
    
Editar - Detalle - Validar etiquetas
    [Documentation]    Debera de mostrar correctamente escritas las etiquetas.
    [Tags]    Editar - Detalle - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Ingresar al detalle del registro
    Validar etiquetas detalle
    [Teardown]    Close Browser
    
Editar - Detalle - Validar opcion Guardar
    [Documentation]    Debera guardar los cambios realizados correctamente en la BD.
    [Tags]    Editar - Detalle - Validar opcion Guardar - T62
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Detalle Filtrar por Columna 1 y Campo ${FiltroDetalleA}[DCorta]
    Sleep    1
    Ingresar al detalle del registro
    Sleep    1
    Editar datos del formulario    ${DetalleEditar}[DCorta]    ${DetalleEditar}[DLarga]
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario
    #Sleep    2
    Validar edicion en BD
    [Teardown]    Close Browser
    
Editar - Detalle - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de editar y no guardar los cambios en la BD.
    [Tags]    Editar - Detalle - Validar opcion Cancelar - T63
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Detalle Filtrar por Columna 1 y Campo ${FiltroDetalleA}[DCorta]
    Sleep    1
    Ingresar al detalle del registro
    Sleep    1
    Editar datos del formulario    ${DetalleEditar}[DCorta]    ${DetalleEditar}[DLarga]
    Obtener datos del formulario
    Presionar opcion Cancelar
    Sleep    1
    Validar edicion sin aplicar en BD
    Validar retorno a Grid de Detalle
    [Teardown]    Close Browser
    
Editar - Detalle - Validar opcion Desactivar
    [Documentation]    Debera desactivar el registro correctamente.
    [Tags]    Editar - Detalle - Validar opcion Desactivar - T64
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Detalle Filtrar por Columna 1 y Campo ${FiltroDetalleA}[DCorta]
    Sleep    1
    Ingresar al detalle del registro
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Desactivar
    Sleep    1
    Confirmar Accion
    Sleep    1
    Validar mensaje    Registro guardado.
    Validar edicion en BD    0
    [Teardown]    Close Browser
    
Editar - Detalle - Validar opcion Reactivar
    [Documentation]    Debera reactivar el registro correctamente.
    [Tags]    Editar - Detalle - Validar opcion Reactivar - T65
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Filtrar por Estatus    ${Inactivo}
    Detalle Filtrar por Columna 1 y Campo ${FiltroDetalleA}[DCorta]
    Sleep    1
    Ingresar al detalle del registro
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Reactivar
    Sleep    1
    Confirmar Accion
    Sleep    1
    Validar mensaje    Registro guardado.
    Validar edicion en BD
    [Teardown]    Close Browser
    
Editar - Detalle - Mostrar validacion de campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Editar - Detalle - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Maestro Detalle
    Filtrar por Columna 1 y Campo ${FiltroDescripcion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Detalle Filtrar por Columna 1 y Campo ${FiltroDetalleA}[DCorta]
    Sleep    1
    Ingresar al detalle del registro
    Sleep    1
    Dejar vacio los campos del formulario
    Presionar opcion Guardar
    Sleep    1
    Mostrar campos obligatorios
    [Teardown]    Close Browser
    
*** Keywords ***
Ingresar al detalle del registro No. ${arg1} en el grid
    ${Descripcion}=    Get text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    Click Element    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[2]/div
    Wait Until Element Is Visible    xpath=//*[@id="dataGridDetalle"]/div/div[5]/div/table/tbody
    Set Test Variable    ${Descripcion}
    
Ingresar al detalle del registro
    Wait Until Element Is Visible    xpath=//*[@id="dataGridDetalle"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${DCorta}=    Get text    xpath=//*[@id="dataGridDetalle"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    Click Element    xpath=//*[@id="dataGridDetalle"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div
    Wait Until Page Contains Element    xpath=//*[@id="btnDesactivar"]
    Set Test Variable    ${DCorta}
    
Obtener el numero de registros en el grid
    ${visible}=    Run Keyword And Return Status    Element Should Be Visible    class=dx-pages
    Run Keyword If    ${visible}==False    Filas por pagina
    ...    ELSE    Total de registros en el grid
    
Filas por pagina
    ${rows}=    Execute Javascript    return document.getElementsByClassName("dx-datagrid-table dx-datagrid-table-fixed")[3].rows.length -1;
    Set Test Variable    ${rows}
    
Total de registros en el grid
    ${rowText}=    Get Text    xpath://*[@id="dataGridDetalle"]/div/div[11]/div/div[1]
    ${records}=    Execute JavaScript    actual='${rowText}'; split1 = actual.split('(')[1]; return split2 = split1.split(' ')[0];
    ${rows}=    Convert To Integer    ${records}
    Set Test Variable    ${rows}
    
Editar datos del formulario
    [Arguments]    ${arg1}    ${arg2}
    Validar campo unico Descripcion Corta    ${arg1}
    Validar campo unico Descripcion Larga    ${arg2}
    Input Text    xpath=//*[@id="txtDescripcionCorta"]/div/div[1]/input    ${DCortaUnica}
    Input Text    xpath=//*[@id="txtDescripcionLarga"]/div/div[1]/input    ${DLargaUnica}
    
Dejar vacio los campos del formulario
    Input Text    xpath=//*[@id="txtDescripcionCorta"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtDescripcionLarga"]/div/div[1]/input    ${EMPTY}
    
Presionar opcion Guardar
    Click Element    xpath=//*[@id="tabEditarDetalle"]/div[4]/div/div[1]
    
Presionar opcion Cancelar
    Click Element    xpath=//*[@id="tabEditarDetalle"]/div[4]/div/div[2]
    
Presionar opcion Desactivar
    Click Element    xpath=//*[@id="btnDesactivar"]
    
Presionar opcion Reactivar
    Click Element    xpath=//*[@id="btnActivar"]
    
Obtener datos del formulario
    ${valDCorta}=    Get Value    xpath=//*[@id="txtDescripcionCorta"]/div/div[1]/input
    ${valDLarga}=    Get Value    xpath=//*[@id="txtDescripcionLarga"]/div/div[1]/input
    Set Test Variable    ${valDCorta}
    Set Test Variable    ${valDLarga}
    
Confirmar Accion
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div[2]/div/div
    Click Element    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div[2]/div/div
    
Validar campo unico Descripcion Corta
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select d.DescripcionCorta from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where d.DescripcionCorta = '${Valor}' and d.Activo = 1";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Validar campo unico Descripcion Corta    ${arg1}
    ...    ELSE    Set Test Variable    ${DCortaUnica}    ${Valor}
    Disconnect From Database
    
Validar campo unico Descripcion Larga
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select d.DescripcionLarga from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where d.DescripcionLarga = '${Valor}' and d.Activo = 1";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Validar campo unico Descripcion Larga    ${arg1}
    ...    ELSE    Set Test Variable    ${DLargaUnica}    ${Valor}
    Disconnect From Database
    
Validar resultado contra BD
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should be equal    ${queryRows[0][0]}    ${rows}
    ${DCorta}=    Get text    xpath=//*[@id="dataGridDetalle"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${DLarga}=    Get text    xpath=//*[@id="dataGridDetalle"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    @{queryResults}    Query    ${arg2}
    Should be equal    ${Descripcion}    ${queryResults[0][0]}
    Should be equal    ${DCorta}    ${queryResults[0][1]}
    Should be equal    ${DLarga}    ${queryResults[0][2]}
    Disconnect From Database
    
Validar edicion en BD
    [Arguments]    ${arg1}=1
    Conexion a Base de Datos
    @{queryResults}    Query    select m.DescripcionLarga, d.DescripcionCorta, d.DescripcionLarga from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.DescripcionCorta = '${valDCorta}' and d.DescripcionLarga = '${valDLarga}' and d.Activo = ${arg1}
    Should Be Equal    ${queryResults[0][0]}    ${Descripcion}
    Should Be Equal    ${queryResults[0][1]}    ${valDCorta}
    Should Be Equal    ${queryResults[0][2]}    ${valDLarga}
    Disconnect From Database
    
Validar edicion sin aplicar en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select m.DescripcionLarga, d.DescripcionCorta, d.DescripcionLarga from Sismep.TSismepMaestro m join Sismep.TSismepDetalle d on m.IdMaestro = d.IdMaestro where m.DescripcionLarga = '${FiltroDescripcion}' and d.DescripcionCorta = '${valDCorta}' and d.DescripcionLarga = '${valDLarga}' and d.Activo = 1
    Disconnect From Database
    
Mostrar campos obligatorios
    ${attrDCorta}=    Get Element Attribute    xpath=//*[@id="txtDescripcionCorta"]    textContent
    ${attrDLarga}=    Get Element Attribute    xpath=//*[@id="txtDescripcionLarga"]    textContent
    Should be equal    ${attrDCorta}    Obligatorio
    Should be equal    ${attrDLarga}    Obligatorio
    
Validar etiquetas
    Conexion a Base de Datos
    ${queryResults}    Query    select DescripcionCorta from Sismep.TSismepMaestro where DescripcionLarga = '${Descripcion}'
    ${TituloBD}=    Execute Javascript    return 'Detalle de '+'[${queryResults[0][0]}]';
    Disconnect From Database
    ${etqTitulo}=    Get Text    xpath:/html/body/div[3]/div/div[1]/div/div[1]/div/div/div
    ${etqTABDetalle}=    Get Text    xpath://*[@id="lnkTabGrid"]
    ${etqDCorta}=    Get Text    xpath://*[@id="dx-col-9"]/div[2]
    ${etqDLarga}=    Get Text    xpath://*[@id="dx-col-10"]/div[2]
    ${etqEstatus}=    Get Text    xpath://*[@id="dx-col-11"]/div[3]
    ${etqDetalle}=    Get Text    xpath=//*[@id="dataGridDetalle"]/div/div[5]/div/table/tbody/tr[1]/td[4]/div
    ${toolVD}=    Get Element Attribute    xpath=//*[@id="dataGridDetalle"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[4]/div    title
    Should Be Equal    ${etqTitulo}    ${TituloBD}
    Should Be Equal    ${etqTABDetalle}    Detalle
    Should Be Equal As Strings    ${etqDCorta}    Descripci\u00F3n Corta
    Should Be Equal As Strings    ${etqDLarga}    Descripci\u00F3n Larga
    Should Be Equal As Strings    ${etqEstatus}    Estatus
    Should Be Equal As Strings    ${etqDetalle}    Detalle
    Should be equal    ${toolVD}    Ver Detalle
    
Validar etiquetas detalle
    ${etqTABEditar}=    Get Text    xpath://*[@id="lnkTabEditar"]
    ${etqDCorta}=    Get Text    xpath://*[@id="tabEditarDetalle"]/div[1]/div[1]
    ${etqDLarga}=    Get Text    xpath://*[@id="tabEditarDetalle"]/div[2]/div[1]
    ${etqEstatus}=    Get Text    xpath://*[@id="tabEditarDetalle"]/div[3]/div[1]
    ${toolGuardar}=    Get Element Attribute    xpath=//*[@id="tabEditarDetalle"]/div[4]/div/div[1]    tooltip
    ${toolCancelar}=    Get Element Attribute    xpath=//*[@id="tabEditarDetalle"]/div[4]/div/div[2]    tooltip
    ${toolDesactivar}=    Get Element Attribute    xpath=//*[@id="btnDesactivar"]    tooltip
    ${toolReactivar}=    Get Element Attribute    xpath=//*[@id="btnActivar"]    tooltip
    Should Be Equal    ${etqTABEditar}    Editar Detalle [${DCorta}]
    Should Be Equal As Strings    ${etqDCorta}    Descripci\u00F3n Corta:
    Should Be Equal As Strings    ${etqDLarga}    Descripci\u00F3n Larga:
    Should Be Equal As Strings    ${etqEstatus}    Estatus
    Should be equal    ${toolGuardar}    Guardar
    Should be equal    ${toolCancelar}    Cancelar
    Should be equal    ${toolDesactivar}    Desactivar
    Should be equal    ${toolReactivar}    Reactivar

Validar retorno a Grid de Detalle
    Wait Until Element Is Visible    xpath=//*[@id="dataGridDetalle"]   timeout=30