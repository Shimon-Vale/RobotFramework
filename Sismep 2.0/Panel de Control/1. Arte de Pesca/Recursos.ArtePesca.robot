*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
${artedepescaexistente}    OTRAS ARTES
${caracteres}    123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789
${xpathGridBody}    //*[@id="gridArtesCarga"]/div/div[6]/div/div/div[1]/div/table/tbody

*** Keywords ***
Ingresar a opcion Artes de Pesca
    Click Element    xpath=//*[@id="divMenuList"]/a[3]
    Wait Until Element Is Not Visible    xpath=//*[@id="gridArtesCarga"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="gridArtesCarga"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30
    
Filtrar por Descripcion
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="gridArtesCarga"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="gridArtesCarga"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input    ${arg1}
    
Filtrar por estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="gridArtesCarga"]/div/div[5]/div/table/tbody/tr[2]/td[2]/div/div/div
    Click Element    xpath=//*[@id="gridArtesCarga"]/div/div[5]/div/table/tbody/tr[2]/td[2]/div/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]

Capturar datos del formulario
    [Arguments]    ${val}    ${qry}
    #Validar campo unico Descripcion    ${arg1}
    Validar registro unico    ${val}    ${qry}
    #Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${Descripcion}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    
Capturar Descripcion existente
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${artedepescaexistente}

Dejar vacio el campo Descripcion
    Clear Element Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input
    
Obtener solo los caracteres soportados por el campo
    [Arguments]    ${arg1}
    ${campo}=    Execute JavaScript    return '${arg1}'.slice(0, 100);
    Set Test Variable    ${campo}
    
Presionar opcion Guardar
    Click Element    xpath=//*[@id="gen_btnGaurdar"]
    
Presionar opcion Cancelar
    Click Element    xpath=/html/body/div[3]/div/div[2]/div/div[3]/div/div[2]
    
Presionar opcion Desactivar
    Click Element    xpath=//*[@id="btnDesactivar"]
    
Presionar opcion Reactivar
    Click Element    xpath=//*[@id="btnReactivar"]
    
# Validar campo unico Descripcion
#     [Arguments]    ${arg1}
#     ${consecutivo}=    Evaluate    ${consecutivo}+1
#     Set Test Variable    ${consecutivo}    ${consecutivo}
#     ${Valor}=    Execute Javascript    return '${arg1}'+'${consecutivo}';
#     ${consultaSQL}=    Execute Javascript    return "SELECT * FROM [Sismep].[TSismepArtesCarga] WHERE Descripcion"+"= "+"'${Valor}'";
#     Conexion a Base de Datos
#     ${valida}=    Run Keyword And Return Status    Check If Exists In Database    ${consultaSQL}
#     Run Keyword If    ${valida} == True    Validar campo unico Descripcion    ${arg1}
#     ...    ELSE    Set Test Variable    ${Descripcion}    ${Valor}
#     Disconnect From Database
    
Validar numero de registros en BD
    [Arguments]    ${desc}    ${noReg}
    Conexion a Base de Datos
    Row Count Is Equal To X    select Descripcion from [Sismep].[TSismepArtesCarga] where Descripcion = '${desc}'    ${noReg}
    Disconnect From Database
    
Validar registro en BD
    [Arguments]    ${desc}    ${act}=1
    Conexion a Base de Datos
    @{queryResults}    Query    select Descripcion from [Sismep].[TSismepArtesCarga] where Descripcion = '${desc}' and Activo = '${act}'
    Should Be Equal    ${queryResults[0][0]}    ${desc}
    Disconnect From Database