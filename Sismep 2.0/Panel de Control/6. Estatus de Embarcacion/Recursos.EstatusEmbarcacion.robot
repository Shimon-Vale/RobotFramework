*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
${xpathGrid}    //*[@id="grid"]

*** Keywords ***
Ingresar a opcion Estatus de Embarcacion
    Click Element    xpath=//*[@id="divMenuList"]/a[8]
    Wait Until Element Is Not Visible    xpath=//*[@id="grid"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30
    
Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}