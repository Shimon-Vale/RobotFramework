*** Setting ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
&{EmbarcacionExistente}    Nombre=ANA MARIA    RNP=00073817    Matricula=3101075523-8
${xpathGridBody}    //*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody
${xpathGrupo}    //*[@id="cboGrupos"]
${xpathArte}    //*[@id="cboArteCarga"]
${xpathSubTipo}    //*[@id="cboSubtipoCarga"]
${queryNombre}    SELECT Nombre FROM [Sismep].[TSismepVehiculos] WHERE Nombre=
${queryRNP}    SELECT RNP FROM [Sismep].[TSismepVehiculos] WHERE RNP=
${queryMatricula}    SELECT Matricula FROM [Sismep].[TSismepVehiculos] WHERE Matricula=

*** Keywords ***
Ingresar a opcion Embarcaciones
    Deslizar scroll hacia abajo
    Click Element    xpath=//*[@id="divMenuList"]/a[19]
    Wait Until Element Is Not Visible    xpath=//*[@id="grid"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30
    
Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    
Filtrar por Estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[4]/div/div/div
    Click Element    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[4]/div/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Ingresar a seccion Caracteristicas
    Click Element    xpath=//*[@id="tabCaracteristicas"]
    Wait Until Element Is Visible    xpath=//*[@id="txtCaracteristicasCarga"]/div/div[1]/input
    
Ingresar a seccion Grupos
    Click Element    xpath=//*[@id="tabGrupos"]
    Wait Until Element Is Visible    xpath=//*[@id="cboGrupos"]/div[1]/div/div[1]/input
    
Ingresar a seccion Permisos
    Click Element    xpath=//*[@id="tabPermisos"]
    Wait Until Element Is Visible    xpath=//*[@id="cboPTipoCarga"]/div[1]/div/div[1]/input
    
Ingresar a seccion Subtipos de Carga
    Click Element    xpath=//*[@id="tabSubTiposCarga"]
    Wait Until Element Is Visible    xpath=//*[@id="cboSubtipoCarga"]/div[1]/div/div[1]/input
    
Ingresar a seccion Artes de carga
    Click Element    xpath=//*[@id="tabArtesCarga"]
    Wait Until Element Is Visible    xpath=//*[@id="cboArteCarga"]/div[1]/div/div[1]/input
    
Ingresar a seccion Cambios de Antena
    Click Element    xpath=//*[@id="tabCambiosAntena"]
    
Obtener datos del formulario - TAB Generales
    ${edomtto}=    Execute Javascript    return document.getElementById("switchEnMantenimiento").getAttribute("aria-label")
    ${mtto}=    Execute Javascript    if('${edomtto}'=='SI') {return true} else {return false};
    ${Nombre}=    Get Value    xpath=//*[@id="txtVehiculoNombre"]/div[1]/div[1]/input
    ${RazonSocial}=    Get Value    xpath=//*[@id="cboVehiculoRazonSocial"]/div[1]/div/div[1]/input
    ${Antena}=    Get Value   xpath=//*[@id="cboVehiculoAntena"]/div[1]/div/div[1]/input
    ${RNP}=    Get Value    xpath=//*[@id="txtVehiculoRNPBarco"]/div/div[1]/input
    ${Litoral}=    Get Value    xpath=//*[@id="cboVehiculoLitoral"]/div[1]/div/div[1]/input
    ${Folio}=    Get Value    xpath=//*[@id="txtVehiculoFolio"]/div/div[1]/input
    ${Matricula}=    Get Value    xpath=//*[@id="txtVehiculoMatricula"]/div/div[1]/input
    ${Tipo}=    Get Value    xpath=//*[@id="cboVehiculoTipo"]/div[1]/div/div[1]/input
    ${Estado}=    Get Value    xpath=//*[@id="cboVehiculoEstado"]/div[1]/div/div[1]/input
    ${Municipio}=    Get Value    xpath=//*[@id="cboVehiculoMunicipio"]/div[1]/div/div[1]/input
    ${Localidad}=    Get Value    xpath=//*[@id="cboVehiculoLocalidad"]/div[1]/div/div[1]/input
    ${PuertoBase}=    Get Value    xpath=//*[@id="cboVehiculoPuertoBase"]/div[1]/div/div[1]/input
    ${Justificacion}=    Get Value    xpath=//*[@id="txtVehiculoJustificacion"]/div/div[1]/input
    Set Test Variable    ${Nombre}
    Set Test Variable    ${RazonSocial}
    Set Test Variable    ${Antena}
    Set Test Variable    ${RNP}
    Set Test Variable    ${Litoral}
    Set Test Variable    ${Folio}
    Set Test Variable    ${Matricula}
    Set Test Variable    ${Tipo}
    Set Test Variable    ${Estado}
    Set Test Variable    ${Municipio}
    Set Test Variable    ${Localidad}
    Set Test Variable    ${PuertoBase}
    Set Test Variable    ${Justificacion}
    Set Test Variable    ${mtto}
    
Dejar vacio los campos de la seccion Caracteristicas
    Input Text    xpath=//*[@id="txtCaracteristicasCarga"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtCaracteristicasEslora"]/div[1]/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtCaracteristicasManga"]/div[1]/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtCaracteristicasPuntal"]/div[1]/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtCaracteristicasTonelajeB"]/div[1]/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtCaracteristicasTonejaleN"]/div[1]/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtCaracteristicasPotenciaMotor"]/div[1]/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtCaracteristicasMarca"]/div[1]/div[1]/input    ${EMPTY}
    Wait Until Element Is Visible    xpath=//*[@id="btnCaracteristicasGuardar"]
    
Capturar texto en los campos de la seccion Caracteristicas
    Input Text    xpath=//*[@id="txtCaracteristicasCarga"]/div/div[1]/input    Texto
    Input Text    xpath=//*[@id="txtCaracteristicasEslora"]/div[1]/div[1]/input    Texto
    Input Text    xpath=//*[@id="txtCaracteristicasManga"]/div[1]/div[1]/input    Texto
    Input Text    xpath=//*[@id="txtCaracteristicasPuntal"]/div[1]/div[1]/input    Texto
    Input Text    xpath=//*[@id="txtCaracteristicasTonelajeB"]/div[1]/div[1]/input    Texto
    Input Text    xpath=//*[@id="txtCaracteristicasTonejaleN"]/div[1]/div[1]/input    Texto
    Input Text    xpath=//*[@id="txtCaracteristicasPotenciaMotor"]/div[1]/div[1]/input    Texto
    Input Text    xpath=//*[@id="txtCaracteristicasMarca"]/div[1]/div[1]/input    Texto
    Wait Until Element Is Visible    xpath=//*[@id="btnCaracteristicasGuardar"]
    
Seleccionar Grupo
    #[Arguments]    ${gpo}    ${div}=4
    [Arguments]    ${gpo}
    Click Element    xpath=//*[@id="cboGrupos"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${gpo}]
    
Seleccionar Tipo de Carga
    #[Arguments]    ${carga}    ${div}=4
    [Arguments]    ${carga}
    Click Element    xpath=//*[@id="cboPTipoCarga"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${carga}]
    
Seleccionar Subtipo de Carga
    #[Arguments]    ${div}=4
    Click Element    xpath=//*[@id="cboSubtipoCarga"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div
    
Seleccionar Arte de Carga
    #[Arguments]    ${arte}    ${div}=4
    [Arguments]    ${arte}
    Click Element    xpath=//*[@id="cboArteCarga"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${arte}]
    
Hacer scroll para ver el Boton Guardar Generales
    Execute JavaScript    window.document.evaluate('//*[@id="btnVehiculoGuardar"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=//*[@id="btnVehiculoGuardar"]
    
Presionar opcion Guardar
    Click Element    xpath=//*[@id="btnVehiculoGuardar"]
    
Presionar opcion Cancelar
    Click Element    xpath=//*[@id="btnVehiculoCancelar"]
    
Presionar opcion Eliminar
    Click Element    xpath=//*[@id="btnVehiculoEliminar"]
    
Presionar opcion Reactivar
    Click Element    xpath=//*[@id="btnVehiculoReactivar"]
    
Presionar opcion Guardar Caracteristicas
    Click Element    xpath=//*[@id="btnCaracteristicasGuardar"]
    
Presionar opcion Agregar Grupo
    Click Element    xpath=//*[@id="btnGrupoAgregar"]
    
Presionar opcion Eliminar Grupo
    Obtener numero de filas del Grid Grupos
    Click Element    //*[@id="gridGrupos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${NoFilas}]/td[2]/div
    
Presionar opcion Guardar Permiso
    Click Element    xpath=//*[@id="btnPGuardar"]
    
Presionar opcion Detalle de Permiso
    Wait Until Element Is Visible    xpath=//*[@id="gridPermisos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[8]/div
    Click Element    xpath=//*[@id="gridPermisos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[8]/div
    
Presionar opcion Eliminar Permiso
    Click Element    xpath=//*[@id="btnPEliminar"]
    
Presionar opcion Reactivar Permiso
    Click Element    xpath=//*[@id="btnPReactivar"]
    
Presionar opcion Agregar Subtipo
    Click Element    xpath=//*[@id="btnSubTipoCargaAgregar"]
    
Presionar opcion Eliminar Subtipo
    Click Element    xpath=//*[@id="gridSubTipoCarga"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]/div
    
Presionar opcion Agregar Arte de Carga
    Click Element    xpath=//*[@id="btnArteCargaAgregar"]
    
Presionar opcion Eliminar Arte de Carga
    Obtener numero de filas del Grid Artes de Carga
    Click Element    xpath=//*[@id="gridArteCarga"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${NoFilas}]/td[2]/div
    
Obtener numero de filas del Grid Grupos
    ${NoFilas}=    Execute Javascript    return document.getElementsByClassName("dx-datagrid-table dx-datagrid-table-fixed")[3].rows.length -1;
    Set Test Variable    ${NoFilas}
    
Obtener datos del Grid Grupos
    Obtener numero de filas del Grid Grupos
    ${Grupo}=    Get text    xpath=//*[@id="gridGrupos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${NoFilas}]/td[1]
    Set Test Variable    ${Grupo}
    
Obtener datos del Grid Permisos
    ${permiso}=    Get Element Attribute    xpath=//*[@id="gridPermisos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]    textContent
    ${tipocarga}=    Get Element Attribute    xpath=//*[@id="gridPermisos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]    textContent
    ${nopermiso}=    Get Element Attribute    xpath=//*[@id="gridPermisos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[5]    textContent
    Set Test Variable    ${permiso}
    Set Test Variable    ${tipocarga}
    Set Test Variable    ${nopermiso}
    
Obtener numero de filas del Grid Subtipos
    ${NoFilas}=    Execute Javascript    return document.getElementsByClassName("dx-datagrid-table dx-datagrid-table-fixed")[7].rows.length -1;
    Set Test Variable    ${NoFilas}
    
Obtener datos del Grid Subtipo
    ${SubTipoCarga}=    Get text    xpath=//*[@id="gridSubTipoCarga"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    Set Test Variable    ${SubTipoCarga}
    
Obtener numero de filas del Grid Artes de Carga
    ${NoFilas}=    Execute Javascript    return document.getElementsByClassName("dx-datagrid-table dx-datagrid-table-fixed")[9].rows.length -1;
    Set Test Variable    ${NoFilas}
    
Obtener datos del Grid Artes de Carga
    Obtener numero de filas del Grid Artes de Carga
    ${ArtesCarga}=    Get text    xpath=//*[@id="gridArteCarga"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${NoFilas}]/td[1]
    Set Test Variable    ${ArtesCarga}
    
Obtener Embarcacion sin permisos
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 v.Nombre from Sismep.TSismepVehiculos v left join Sismep.TSismepVehiculosPermisos vp on v.IdVehiculo = vp.IdVehiculo left join Sismep.TSismepTiposCarga tc on vp.IdTipoCarga = tc.IdTipoCarga where v.Nombre like 'RFEmbarcacion%' and tc.Descripcion is null and v.Activo=1
    Set Test Variable    ${Embarcacion}    ${queryResults[0][0]}
    Disconnect From Database
    
Obtener Embarcacion con permisos
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 v.Nombre from Sismep.TSismepVehiculos v join Sismep.TSismepVehiculosPermisos vp on v.IdVehiculo = vp.IdVehiculo join Sismep.TSismepTiposCarga tc on vp.IdTipoCarga = tc.IdTipoCarga where v.Nombre like 'RFEmbarcacion%' and v.Activo=1
    Set Test Variable    ${Embarcacion}    ${queryResults[0][0]}
    Disconnect From Database
    
Validar numero de registros en BD
    [Arguments]    ${arg1}    ${arg2}    ${arg3}    ${arg4}
    Conexion a Base de Datos
    Row Count Is Equal To X    select v.Nombre, rs.Descripcion, a.IdExterno, v.RNP, d.DescripcionCorta, v.Folio, v.Matricula, v.Texto5, edo.Descripcion, mpo.Descripcion, l.Descripcion, pti.Descripcion, v.Texto1 from Sismep.TSismepVehiculos v join Sismep.TSismepAntenas a on v.IdAntena = a.IdAntena join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial join Sismep.TSismepLocalidades l on v.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios mpo on l.IdMunicipio = mpo.IdMunicipio join Sismep.TSismepEstados edo on mpo.IdEstado = edo.IdEstado join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where v.Nombre = '${arg1}' and v.RNP='${arg2}' and v.Matricula='${arg3}'    ${arg4}
    Disconnect From Database
    
Validar grupo en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select v.Nombre, d.DescripcionCorta from Sismep.TSismepVehiculos v join Sismep.TSismepVehiculosGrupos vg on v.IdVehiculo = vg.IdVehiculo join Sismep.TSismepDetalle d on vg.IdGrupo = d.IdDetalle where v.Nombre = '${Nombre}' and d.DescripcionCorta = '${Grupo}'
    Should be equal    ${Nombre}    ${queryResults[0][0]}
    Should be equal    ${Grupo}    ${queryResults[0][1]}
    Disconnect From Database
    
Validar grupo eliminado en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select v.Nombre, d.DescripcionCorta from Sismep.TSismepVehiculos v join Sismep.TSismepVehiculosGrupos vg on v.IdVehiculo = vg.IdVehiculo join Sismep.TSismepDetalle d on vg.IdGrupo = d.IdDetalle where v.Nombre = '${Nombre}' and d.DescripcionCorta = '${Grupo}'
    Should be empty    ${queryResults}
    Disconnect From Database
    
Validar permiso en BD
    [Arguments]    ${arg1}
    Conexion a Base de Datos
    @{queryResults}    Query    select v.Nombre, vp.Descripcion, tc.Descripcion, vp.FechaInicial, vp.FechaFinal, vp.NumeroPermiso, vp.Activo from Sismep.TSismepVehiculos v join Sismep.TSismepVehiculosPermisos vp on v.IdVehiculo = vp.IdVehiculo join Sismep.TSismepTiposCarga tc on vp.IdTipoCarga = tc.IdTipoCarga where v.Nombre='${Nombre}' and vp.Activo=${arg1}
    Should be equal    ${Nombre}    ${queryResults[0][0]}
    Should be equal    ${permiso}    ${queryResults[0][1]}
    Should be equal    ${tipocarga}    ${queryResults[0][2]}
    Should be equal    ${nopermiso}    ${queryResults[0][5]}
    Disconnect From Database
    
Validar subtipo en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select v.Nombre, stc.Descripcion from Sismep.TSismepVehiculos v join Sismep.TSismepVehiculosSubTiposCarga vsc on v.IdVehiculo = vsc.IdVehiculo join Sismep.TSismepSubTiposCarga stc on vsc.IdSubTiposCarga = stc.IdSubTiposCarga where v.Nombre='${Nombre}' and stc.Descripcion='${SubTipoCarga}'
    Should be equal    ${Nombre}    ${queryResults[0][0]}
    Should be equal    ${SubTipoCarga}    ${queryResults[0][1]}
    Disconnect From Database
    
Validar subtipo eliminado en BD
    Conexion a Base de Datos
    Obtener numero de filas del Grid Subtipos
    @{queryResults}    Query    select count(stc.Descripcion) from Sismep.TSismepVehiculos v join Sismep.TSismepVehiculosSubTiposCarga vsc on v.IdVehiculo = vsc.IdVehiculo join Sismep.TSismepSubTiposCarga stc on vsc.IdSubTiposCarga = stc.IdSubTiposCarga where v.Nombre='${Nombre}' and stc.Descripcion='${SubTipoCarga}'
    Should be equal    ${NoFilas}    ${queryResults[0][0]}
    Disconnect From Database
    
Validar arte de carga en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select v.Nombre, ac.Descripcion from Sismep.TSismepVehiculos v join Sismep.TSismepVehiculosArteCarga vac on v.IdVehiculo = vac.IdVehiculo join Sismep.TSismepArtesCarga ac on vac.IdArteCarga = ac.IdArteCarga where v.Nombre='${Nombre}' and ac.Descripcion='${ArtesCarga}'
    Should be equal    ${Nombre}    ${queryResults[0][0]}
    Should be equal    ${ArtesCarga}    ${queryResults[0][1]}
    Disconnect From Database
    
Validar arte de carga eliminado en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select v.Nombre, ac.Descripcion from Sismep.TSismepVehiculos v join Sismep.TSismepVehiculosArteCarga vac on v.IdVehiculo = vac.IdVehiculo join Sismep.TSismepArtesCarga ac on vac.IdArteCarga = ac.IdArteCarga where v.Nombre='${Nombre}' and ac.Descripcion='${ArtesCarga}'
    Should be empty    ${queryResults}
    Disconnect From Database

Validar etiquetas y tooltips TAB Caracteristicas
    ${ttGuardar}=    Get Element Attribute    xpath=//*[@id="btnCaracteristicasGuardar"]    tooltip
    Element Text Should be    xpath=//*[@id="tabCaracteristicas"]    Características
    Element Text Should be    xpath=//*[@id="caracteristicas"]/div[1]/label[1]    Carga:
    Element Text Should be    xpath=//*[@id="caracteristicas"]/div[2]/label[1]    Manga:
    Element Text Should be    xpath=//*[@id="caracteristicas"]/div[3]/label[1]    Tonelaje B:
    Element Text Should be    xpath=//*[@id="caracteristicas"]/div[4]/label[1]    Potencia Motor:
    Element Text Should be    xpath=//*[@id="chkCaracteristicasFotografia"]/div/span[2]    Fotografía
    Element Text Should be    xpath=//*[@id="caracteristicas"]/div[1]/label[2]    Eslora:
    Element Text Should be    xpath=//*[@id="caracteristicas"]/div[2]/label[2]    Puntal:
    Element Text Should be    xpath=//*[@id="caracteristicas"]/div[3]/label[2]    Tonelaje N:
    Element Text Should be    xpath=//*[@id="caracteristicas"]/div[4]/label[2]    Marca:
    Element Text Should be    xpath=//*[@id="fuCaracteristicasFotografia"]/div/div/div/div[1]/div[1]/div/span    Seleccione...
    Should be equal    ${ttGuardar}    Guardar
    
Validar campos obligatorios en TAB Caracteristicas
    ${Carga}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[0].textContent;
    ${Manga}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[1].textContent;
    ${TonelajeB}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[2].textContent;
    ${Potencia}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[3].textContent;
    ${Eslora}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[4].textContent;
    ${Puntal}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[5].textContent;
    ${TonelajeN}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[6].textContent;
    ${Marca}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[7].textContent;
    Should be equal    ${Carga}    Obligatorio
    Should be equal    ${Manga}    Obligatorio
    Should be equal    ${TonelajeB}    Obligatorio
    Should be equal    ${Potencia}    Obligatorio
    Should be equal    ${Eslora}    Obligatorio
    Should be equal    ${Puntal}    Obligatorio
    Should be equal    ${TonelajeN}    Obligatorio
    Should be equal    ${Marca}    Obligatorio
    
Validar captura de solo numeros en TAB Caracteristicas
    ${Carga}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[0].textContent;
    ${Manga}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[1].textContent;
    ${TonelajeB}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[2].textContent;
    ${Potencia}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[3].textContent;
    ${Eslora}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[4].textContent;
    ${Puntal}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[5].textContent;
    ${TonelajeN}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[6].textContent;
    Should be equal    ${Carga}    Solo se permiten numeros o decimal
    Should be equal    ${Manga}    Solo se permiten numeros o decimal
    Should be equal    ${TonelajeB}    Solo se permiten numeros o decimal
    Should be equal    ${Potencia}    Solo se permiten numeros o decimal
    Should be equal    ${Eslora}    Solo se permiten numeros o decimal
    Should be equal    ${Puntal}    Solo se permiten numeros o decimal
    Should be equal    ${TonelajeN}    Solo se permiten numeros o decimal
    
Validar etiquetas y tooltips TAB Grupos
    ${ttAgregar}=    Get Element Attribute    xpath=//*[@id="btnGrupoAgregar"]    tooltip
    Element Text Should be    xpath=//*[@id="tabGrupos"]    Grupos
    Element Text Should be    xpath=//*[@id="grupos"]/div[1]/label    Grupos:
    Should be equal    ${ttAgregar}    Agregar
    #Las etiquetas en los titulos del Grid son dinamicos por lo que el xpath cambia en cada sesion
    
Validar etiquetas y tooltips TAB Permisos
    ${ttGuardar}=    Get Element Attribute    xpath=//*[@id="btnPGuardar"]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=//*[@id="btnPCancelar"]    tooltip
    ${ttEliminar}=    Get Element Attribute    xpath=//*[@id="btnPEliminar"]    tooltip
    ${ttReactivar}=    Get Element Attribute    xpath=//*[@id="btnPReactivar"]    tooltip
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="gridPermisos"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[8]/div    title
    Element Text Should be    xpath=//*[@id="tabPermisos"]    Permisos
    Element Text Should be    xpath=//*[@id="permisos"]/div[1]/label[1]    Estatus Permiso:
    Element Text Should be    xpath=//*[@id="permisos"]/div[1]/label[2]    Estatus:
    Element Text Should be    xpath=//*[@id="permisos"]/div[2]/label[1]    Tipo Carga:
    Element Text Should be    xpath=//*[@id="permisos"]/div[2]/label[2]    No. Permiso:
    Element Text Should be    xpath=//*[@id="permisos"]/div[3]/label    Descripción:
    Element Text Should be    xpath=//*[@id="permisos"]/div[4]/label[1]    Fecha Inicio:
    Element Text Should be    xpath=//*[@id="permisos"]/div[4]/label[2]    Fecha Fin:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    Should be equal    ${ttEliminar}    Eliminar
    Should be equal    ${ttReactivar}    Reactivar
    Should be equal    ${ttVD}    Ver Detalle
    #Las etiquetas en los titulos del Grid son dinamicos por lo que el xpath cambia en cada sesion
    
Validar campos obligatorios en TAB Permisos
    ${reqTipoCarga}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[4]/div[2]/div[1]/div/div[3]/div/div    textContent
    ${reqPermiso}=    Get Element Attribute    xpath=//*[@id="txtPNoPermoso"]    textContent
    ${reqDescripcion}=    Get Element Attribute    xpath=//*[@id="txtPDescripcion"]    textContent
    ${reqFecIni}=    Get Element Attribute    xpath=//*[@id="dpPFechaInicio"]    textContent
    ${reqFecFin}=    Get Element Attribute    xpath=//*[@id="dpPFechaFin"]    textContent
    Should be equal    ${reqTipoCarga}    Obligatorio
    Should be equal    ${reqPermiso}    Obligatorio
    Should be equal    ${reqDescripcion}    Obligatorio
    Should be equal    ${reqFecIni}    Obligatorio
    Should be equal    ${reqFecFin}    Obligatorio
    
Validar campos obligatorios en TAB Permisos ocultos
    ${reqTipoCarga}=    Get Element Attribute    xpath=//*[@id="cboPTipoCarga"]    class
    ${reqPermiso}=    Get Element Attribute    xpath=//*[@id="txtPNoPermoso"]    textContent
    ${reqDescripcion}=    Get Element Attribute    xpath=//*[@id="txtPDescripcion"]    textContent
    ${reqFecIni}=    Get Element Attribute    xpath=//*[@id="dpPFechaInicio"]    textContent
    ${reqFecFin}=    Get Element Attribute    xpath=//*[@id="dpPFechaFin"]    textContent
    Should Not Contain    ${reqTipoCarga}    dx-invalid
    Should Be Empty    ${reqPermiso}
    Should Be Empty    ${reqDescripcion}
    Should Be Empty    ${reqFecIni}
    Should Be Empty    ${reqFecFin}

Dejar vacio los campos de la seccion Permisos
    Input Text    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[4]/div[2]/div[2]/div/div/div[1]/input    ${EMPTY}
    Input Text    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[4]/div[3]/div/div/div/div[1]/input    ${EMPTY}
    Input Text    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[4]/div[4]/div[1]/div/div/div/div[1]/input    ${EMPTY}
    Input Text    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div[4]/div[4]/div[2]/div/div/div/div[1]/input    ${EMPTY}

Validar etiquetas y tooltips TAB Subtipos de Carga
    ${ttAgregar}=    Get Element Attribute    xpath=//*[@id="btnSubTipoCargaAgregar"]    tooltip
    Element Text Should be    xpath=//*[@id="tabSubTiposCarga"]    Subtipos de Carga
    Element Text Should be    xpath=//*[@id="subtiposCarga"]/div[1]/label    Subtipo de Carga:
    Should be equal    ${ttAgregar}    Agregar
    #Las etiquetas en los titulos del Grid son dinamicos por lo que el xpath cambia en cada sesion
    
Validar etiquetas y tooltips TAB Artes de Carga
    ${ttAgregar}=    Get Element Attribute    xpath=//*[@id="btnArteCargaAgregar"]    tooltip
    Element Text Should be    xpath=//*[@id="tabArtesCarga"]    Artes Carga
    Element Text Should be    xpath=//*[@id="artesCarga"]/div[1]/label    Artes Carga:
    Should be equal    ${ttAgregar}    Agregar
    #Las etiquetas en los titulos del Grid son dinamicos por lo que el xpath cambia en cada sesion
    
Validar etiquetas en ventana de confirmacion
    ${Confirmar}=    Execute JavaScript    return document.getElementsByClassName("dx-toolbar dx-widget dx-visibility-change-handler dx-collection dx-popup-title")[1].textContent;
    Should be equal    ${Confirmar}    Confirmar
    ${Mensaje}=    Execute JavaScript    return document.getElementsByClassName("dx-dialog-message")[0].textContent;
    Should be equal    ${Mensaje}    El registro ser\u00E1 desactivado.
    ${btnAceptar}=    Execute JavaScript    return document.getElementsByClassName("dx-button-text")[2].textContent;
    Should be equal    ${btnAceptar}    Aceptar
    ${btnCancelar}=    Execute JavaScript    return document.getElementsByClassName("dx-button-text")[1].textContent;
    Should be equal    ${btnCancelar}    Cancelar
    
Deslizar scroll hacia abajo
    Execute JavaScript    window.document.evaluate('//*[@id="divMenuList"]/a[19]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=//*[@id="divMenuList"]/a[19]    timeout=15

Validacion de campo obligatorio oculto
    [Arguments]    ${campo}
    ${attrCampo}=    Get Element Attribute    xpath=${campo}    class
    Should Not Contain    ${attrCampo}    dx-invalid