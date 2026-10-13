*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
${xpathGridBody}    //*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody 

*** Keywords ***
Ingresar a opcion Configuracion de Sistema
    Click Element    xpath=//*[@id="divMenuList"]/a[5]
    Wait Until Element Is Not Visible    xpath=//*[@id="grid"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30
    
Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    
Filtrar por fecha y hora
    [Arguments]    ${arg1}
    Input Text    //*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[4]/div/div[2]/div/div[1]/div/div[1]/input    ${arg1}
    Press Keys    //*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[4]/div/div[2]/div/div[1]/div/div[1]/input    ENTER