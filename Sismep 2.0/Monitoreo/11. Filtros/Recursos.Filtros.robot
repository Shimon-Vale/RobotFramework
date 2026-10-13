*** Keywords ***
Presionar opcion Filtros
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/button[8]    timeout=15
    Click Element    xpath=//*[@id="divPanelControles"]/button[8]

Desplegar opcion Estatus
    Wait Until Element Is Visible    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[1]/div[3]    timeout=15
    Click Element    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[1]/div[3]
        
Desplegar opcion Litoral
    Wait Until Element Is Visible    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[2]/div[3]    timeout=15
    Click Element    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[2]/div[3]
    
Desplegar opcion Grupos
    Wait Until Element Is Visible    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[3]/div[3]    timeout=15
    Click Element    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[3]/div[3]
    
Desplegar opcion Permisos
    Wait Until Element Is Visible    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[4]/div[3]    timeout=15
    Click Element    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[4]/div[3]
    
Desplegar opcion Transmitiendo
    Wait Until Element Is Visible    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[5]/div[3]    timeout=15
    Click Element    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[5]/div[3]
    
Desplegar opcion Tipo
    Wait Until Element Is Visible    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[6]/div[3]    timeout=15
    Click Element    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[6]/div[3]
    
Filtrar por: ${OPC}
    Wait Until Element Is Visible    ${OPC}    timeout=15
    Click Element    ${OPC}

Presionar boton Filtrar
    Click Element    xpath=//*[@id="btnFiltrar"]
    Wait Until Element Is Not Visible    xpath=/html/body/div[2]/div/div[2]    timeout=30

Obtener el numero de registros en el grid
    ${textofooter}=    Get Text    xpath=//*[@id="stEmbarcaciones"]
    ${registros}=    Execute JavaScript    cadena='${textofooter}'; return cadena.split(' ')[1];
    ${numemb}=    Convert To Integer    ${registros}
    Set Test Variable    ${numemb}
