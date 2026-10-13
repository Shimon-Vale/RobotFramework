*** Settings ***
Resource    ../Recursos.PanelControl.robot

*** Variables ***
${xpathGridBody}    //*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody

*** Keywords ***
Ingresar a opcion Tipos de Permiso
    Deslizar scroll hacia abajo
    Click Element    xpath=//*[@id="divMenuList"]/a[16]
    Wait Until Element Is Not Visible    xpath=//*[@id="grid"]/div/div[7]/div/div    timeout=30
    Wait Until Element Is Visible    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody    timeout=30
    
Filtrar por Columna ${COL} y Campo ${CAMPO}
    Wait Until Element Is Enabled    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="grid"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    
Deslizar scroll hacia abajo
    Execute JavaScript    window.document.evaluate('//*[@id="divMenuList"]/a[16]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=//*[@id="divMenuList"]/a[16]    timeout=15