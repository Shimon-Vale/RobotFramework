*** Settings ***
Resource    ../Recursos.Generales.robot

*** Keywords ***
Obtener el numero de registros en el grid
    [Arguments]    ${xpathGrid}
    ${visible}=    Run Keyword And Return Status    Element Should Be Visible    class=dx-pages
    Run Keyword If    ${visible}==False    Filas por pagina
    ...    ELSE    Total de registros en el grid    ${xpathGrid}

Filas por pagina
    ${regTexto}=    Execute Javascript    return document.getElementsByClassName("dx-row dx-data-row dx-column-lines").length;
    ${noReg}=    Convert To Integer    ${regTexto}
    Set Test Variable    ${noReg}

Total de registros en el grid
    [Arguments]    ${xpathGrid}
    ${rowText}=    Get Text    xpath=${xpathGrid}
    ${regTexto}=    Execute JavaScript    actual='${rowText}'; split1 = actual.split('(')[1]; return split2 = split1.split(' ')[0];
    ${noReg}=    Convert To Integer    ${regTexto}
    Set Test Variable    ${noReg}
    
Validar mensaje
    [Arguments]    ${arg1}    ${arg2}=4
    Wait Until Element Is Visible    xpath=/html/body/div[${arg2}]/div/div/div[2]
    Element Text Should be    xpath=/html/body/div[${arg2}]/div/div/div[2]    ${arg1}
    #Wait Until Element Is Not Visible    xpath=/html/body/div[${arg2}]/div/div/div[2]

Validar mensaje de confirmacion
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div[2]/div
    Element Text Should Be    xpath=/html/body/div[4]/div/div/div[2]/div    ${arg1}
    
Confirmar accion
    [Arguments]    ${div}=4
    Wait Until Element Is Visible    xpath=/html/body/div[${div}]/div/div/div[3]/div/div[2]/div[2]/div/div
    Click Element    xpath=/html/body/div[${div}]/div/div/div[3]/div/div[2]/div[2]/div/div

Cancelar accion
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div[1]/div/div
    Click Element    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div[1]/div/div

Validar retorno a Grid de Resultados
    [Arguments]    ${xpathGridBody}
    Wait Until Element Is Not Visible    xpath=/html/body/div[3]/div/div[1]/div/div[3]/div/div/div
    Wait Until Element Is Visible    xpath=${xpathGridBody}    timeout=30

Presionar opcion Nuevo Registro
    [Arguments]    ${xpathBtn}
    Wait Until Element Is Visible    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div
    Click Element    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div
    Wait Until Element Is Visible    xpath=${xpathBtn}

Validar registro unico
    [Arguments]    ${valor}    ${querySQL}
    ${valorRandom}=    Evaluate    random.randint(1, 200)
    ${valorUnico}=    Catenate    ${valor}${valorRandom}
    Conexion a Base de Datos
    ${consultaSQL}=    Query    ${querySQL}'${valorUnico}'
    Disconnect From Database
    ${noReg}=    Get Length    ${consultaSQL}
    Run Keyword If    ${noReg} == 0    Set Test Variable    ${valorUnico}
    ...    ELSE    Validar registro unico    ${valor}    ${querySQL}

Cerrar modal del formulario
    Wait Until Element Is Not Visible    xpath=/html/body/div[4]/div/div/div[2]
    Click Element    xpath=/html/body/div[3]/div/div[1]/div/div[3]/div/div/div