*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
${TCExistente}    CALAMAR
${xpathGridBody}    //*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody
${queryTipoCarga}    select Descripcion from Sismep.TSismepTiposCarga where Descripcion=

*** Keywords ***
Ingresar a opcion Pesquerias
    Click Element    xpath=//*[@id="divMenuList"]/a[14]
    Wait Until Element Is Not Visible    xpath=//*[@id="grid"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30

Ingresar al detalle del registro No. ${arg1} en el grid
    Click Element    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[5]/div
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div/div[1]

Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    
Filtrar por Estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[4]/div/div/div
    Click Element    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[4]/div/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Presionar opcion Guardar
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div/div[1]
    
Presionar opcion Cancelar
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div/div[2]
    
Presionar opcion Eliminar
    Click Element    xpath=//*[@id="btnEliminar"]
    
Presionar opcion Reactivar
    Click Element    xpath=//*[@id="btnReactivar"]
    
Obtener datos del formulario
    ${Descripcion}=    Get Value    xpath=//*[@id="txtDescripcion"]/div/div[1]/input
    ${VMin}=    Get Value    xpath=//*[@id="txtVelMin"]/div/div[1]/input
    ${VMinima}=    Convert to Number    ${VMin}
    ${VMax}=    Get Value    xpath=//*[@id="txtVelMax"]/div/div[1]/input
    ${VMaxima}=    Convert to Number    ${VMax}
    Set Test Variable    ${Descripcion}
    Set Test Variable    ${VMinima}
    Set Test Variable    ${VMaxima}
    
Validar Pesqueria en BD
    [Arguments]    ${arg1}=1
    Conexion a Base de Datos
    @{queryResults}    Query    select Descripcion, VelocidadMin, VelocidadMax from Sismep.TSismepTiposCarga where Descripcion = '${Descripcion}' and Activo = ${arg1}
    ${VMinimaBD}=    Convert to Number    ${queryResults[0][1]}
    ${VMaximaBD}=    Convert to Number    ${queryResults[0][2]}
    Should Be Equal    ${queryResults[0][0]}    ${Descripcion}
    Should Be Equal    ${VMinimaBD}    ${VMinima}
    Should Be Equal    ${VMaximaBD}    ${VMaxima}
    Disconnect From Database
    
Validar Pesqueria inexistente en BD
    Conexion a Base de Datos
    Check If Not Exists In Database    select Descripcion, VelocidadMin, VelocidadMax from Sismep.TSismepTiposCarga where Descripcion = '${Descripcion}' and VelocidadMin = '${VMinima}' and VelocidadMax = '${VMaxima}' and Activo = 1
    Disconnect From Database