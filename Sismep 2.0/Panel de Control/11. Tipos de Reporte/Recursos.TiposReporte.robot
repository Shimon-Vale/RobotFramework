*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
${xpathGridBody}    //*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody

*** Keywords ***
Ingresar a opcion Tipos de Reporte
    Click Element    xpath=//*[@id="divMenuList"]/a[13]
    Wait Until Element Is Not Visible    xpath=//*[@id="grid"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30
    
Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    
Capturar datos del formulario Generales TODOS los campos
    [Arguments]    ${arg1}
    Validar campo unico Descripcion    ${arg1}
    Sleep    1
    Input Text    xpath=//*[@id="gen_txtDescripcion"]/div/div[1]/input    ${DescripcionUnica}
    Validar cuadrante
    Registrar estatus
    Seleccionar estatus
    
Validar campo unico Descripcion
    [Arguments]    ${arg1}
    ${consecutivo}=    Evaluate    ${consecutivo}+1
    Set Test Variable    ${consecutivo}    ${consecutivo}
    ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
    ${consultaSQL}=    Execute Javascript    return "select Descripcion from Sismep.TSismepTiposReporteM where Descripcion = '${Valor}'";
    Conexion a Base de Datos
    ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
    Run Keyword If    ${valida} == True    Validar campo unico Descripcion    ${arg1}
    ...    ELSE    Set Test Variable    ${DescripcionUnica}    ${Valor}
    Disconnect From Database
    
Validar cuadrante
    #Click Element    xpath=//*[@id="gen_chkValidaCuadrante"]
    Execute JavaScript    document.evaluate('//*[@id="gen_chkValidaCuadrante"]',document.body,null,9,null).singleNodeValue.click();
    
Registrar estatus
    Click Element    xpath=//*[@id="gen_chkRegistraEstatus"]
    
Seleccionar estatus
    #[Arguments]    ${arg1}=3    #Ciclado
    Wait Until Element Is Visible    xpath=//*[@id="gen_ddlEstatusMensaje"]/div[1]/div/div[1]/input
    Click Element    xpath=//*[@id="gen_ddlEstatusMensaje"]/div[1]/div/div[2]/div[2]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[3]/div
    
Obtener datos del formulario - TAB Generales
    ${Descripcion}=    Get Value    xpath=//*[@id="gen_txtDescripcion"]/div/div[1]/input
    ${vc}    Get Element Attribute    xpath=//*[@id="gen_chkValidaCuadrante"]    aria-label
    ${re}    Get Element Attribute    xpath=//*[@id="gen_chkRegistraEstatus"]    aria-label
    ${vCuadrante}=    Execute Javascript    if('${vc}'=='SI') {return true} else {return false};
    ${rEstatus}=    Execute Javascript    if('${re}'=='SI') {return true} else {return false};
    ${estMensaje}=    Get Value    xpath=//*[@id="gen_ddlEstatusMensaje"]/div[1]/div/div[1]/input
    ${EMensaje}=    Execute JavaScript    if('${estMensaje}'==''){return ${EMPTY}}else{return'${estMensaje}'};
    Set Test Variable    ${Descripcion}
    Set Test Variable    ${vCuadrante}
    Set Test Variable    ${rEstatus}
    Set Test Variable    ${EMensaje}
    
Presionar opcion Guardar
    Click Element    xpath=//*[@id="gen_btnGuardar"]
    
Presionar opcion Cancelar
    Click Element    xpath=//*[@id="tabGenerales"]/div[5]/div/div[2]
    
Ingresar a opcion Acciones
     Wait Until Element Is Enabled    xpath=//*[@id="lnkTabAcciones"]
    Click Element    xpath=//*[@id="lnkTabAcciones"]
    
Seleccionar Accion
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    xpath=//*[@id="acc_ddlTipoAccion"]/div[1]/div/div[1]/input
    Click Element    xpath=//*[@id="acc_ddlTipoAccion"]/div[1]/div/div[2]/div[2]
    Click Element    xpath=//*[contains(text(),'${arg1}')]
    
Capturar Orden
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="acc_ddlOrden"]/div/div[1]/input    ${arg1}
    
Presionar opcion Guardar Accion
    Click Element    xpath=//*[@id="acc_btnGuardar"]
    
Presionar opcion Ver Detalle
    Click Element    xpath=//*[@id="acc_grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div
    
Presionar opcion Eliminar
    Click Element    xpath=//*[@id="acc_btnEliminar"]
    
Confirma Accion
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div[2]/div/div
    Click Element    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div[2]/div/div
    
Obtener datos del Grid Acciones
    ${Accion}=    Get text    xpath=//*[@id="acc_grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${Odn}=    Get text    xpath=//*[@id="acc_grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    ${Orden}=    Convert to Integer    ${Odn}
    Set Test Variable    ${Accion}
    Set Test Variable    ${Orden}
    
Validar Tipo de Reporte en BD
    [Arguments]    ${arg1}=1
    Conexion a Base de Datos
    @{queryResults}    Query    select rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Descripcion = '${Descripcion}' and rm.Activo = ${arg1}
    Should Be Equal    ${queryResults[0][0]}    ${Descripcion}
    Should Be Equal    ${queryResults[0][1]}    ${EMensaje}
    Should Be Equal    ${queryResults[0][2]}    ${rEstatus}
    Should Be Equal    ${queryResults[0][3]}    ${vCuadrante}
    Disconnect From Database
    
Validar Tipo de Reporte inexistente en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select rm.Descripcion, em.Descripcion, rm.RegistrarEstatus, rm.ValidarCuadrante, rm.Activo from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje where rm.Descripcion = '${Descripcion}' and em.Descripcion = '${EMensaje}' and rm.RegistrarEstatus = '${rEstatus}' and rm.ValidarCuadrante = '${vCuadrante}' and rm.Activo = 1
    Disconnect From Database
    
Validar Accion en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select rm.Descripcion, d.DescripcionLarga, rd.OrdenAccion from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje left join Sismep.TSismepTiposReporteD rd on rm.IdTipoReporteM = rd.IdTipoReporteM left join Sismep.TSismepDetalle d on rd.IdAccion = d.IdDetalle where rm.Descripcion = '${Descripcion}' and d.DescripcionLarga='${Accion}' and rd.OrdenAccion='${Orden}'
    Should Be Equal    ${queryResults[0][0]}    ${Descripcion}
    Should Be Equal    ${queryResults[0][1]}    ${Accion}
    Should Be Equal    ${queryResults[0][2]}    ${Orden}
    Disconnect From Database
    
Validar Accion inexistente en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select rm.Descripcion, d.DescripcionLarga, rd.OrdenAccion from Sismep.TSismepTiposReporteM rm left join Sismep.TSismepEstatusMensajes em on rm.IdEstatusMensaje = em.IdEstatusMensaje left join Sismep.TSismepTiposReporteD rd on rm.IdTipoReporteM = rd.IdTipoReporteM left join Sismep.TSismepDetalle d on rd.IdAccion = d.IdDetalle where rm.Descripcion = '${Descripcion}' and d.DescripcionLarga='${Accion}' and rd.OrdenAccion='${Orden}'
    Disconnect From Database
    
Validar etiquetas TAB Acciones
    ${ttGuardar}    Get Element Attribute    xpath=//*[@id="acc_btnGuardar"]    tooltip
    ${ttCancelar}    Get Element Attribute    xpath=//*[@id="tabAcciones"]/div[2]/div/div[2]    tooltip
    ${ttEliminar}    Get Element Attribute    xpath=//*[@id="acc_btnEliminar"]    tooltip
    Element Text Should Be    xpath=//*[@id="lnkTabAcciones"]    Acciones
    Element Text Should Be    xpath=//*[@id="tabAcciones"]/div[1]/div[1]    Accion:
    Element Text Should Be    xpath=//*[@id="tabAcciones"]/div[1]/div[3]    Orden:
    Element Text Should Be    xpath=//*[@id="dx-col-15"]/div[2]    Descripci\u00F3n
    Element Text Should Be    xpath=//*[@id="dx-col-16"]/div[2]    Orden de Acci\u00F3n
    Element Text Should Be    xpath=//*[@id="acc_grid"]/div/div[5]/div/table/tbody/tr[1]/td[3]/div    Detalle
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    Should be equal    ${ttEliminar}    Eliminar