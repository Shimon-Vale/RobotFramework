*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Keywords ***
Ingresar a opcion Maestro Detalle
    Click Element    xpath=//*[@id="divMenuList"]/a[7]
    Wait Until Element Is Not Visible    xpath=//*[@id="dataGrid"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30
    
Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="dataGrid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    
Detalle Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="dataGridDetalle"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="dataGridDetalle"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    
Filtrar por Estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="dataGridDetalle"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div/div[1]/div/div[2]/div[2]
    Click Element    xpath=//*[@id="dataGridDetalle"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div/div[1]/div/div[2]/div[2]
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}

