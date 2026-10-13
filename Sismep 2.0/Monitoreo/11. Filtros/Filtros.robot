*** Settings ***
Resource    ../../Recursos.Generales.robot
Resource    Recursos.Filtros.robot

*** Test Cases ***
Filtros - Validar etiquetas
    [Documentation]    Debera validar que se muestren 
        ...    correctamente escritas las etiquetas.
    [Tags]    Filtros - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Validar etiquetas
    [Teardown]    Close Browser

*** Keywords ***
Validar etiquetas
    Element Text Should Be    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[1]/div[2]/div/div    Estatus
    Sleep    1
    Desplegar opcion Estatus
    Sleep    1
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[1]/div[2]/div/div    Aviso Pesca Prohibida
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[2]/div[2]/div/div    Aviso Zona Prohibida
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[3]/div[2]/div/div    Ciclados
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[4]/div[2]/div/div    Conectado
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[5]/div[2]/div/div    Desconectado
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[6]/div[2]/div/div    Emergencia
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[7]/div[2]/div/div    En Puerto
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[8]/div[2]/div/div    En Zona
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[9]/div[2]/div/div    Entrada a puerto
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[10]/div[2]/div/div    Fuera de Puerto
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[11]/div[2]/div/div    Mantenimiento
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[12]/div[2]/div/div    Mensaje de Texto
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[13]/div[2]/div/div    Múltiples Permisos
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[14]/div[2]/div/div    Normal
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[15]/div[2]/div/div    Permiso Vencido
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[16]/div[2]/div/div    Pesca Prohibida - Cedula
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[17]/div[2]/div/div    Proximidad a Embarcaciones
    Deslizar scroll estatus abajo
    Sleep    1
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[18]/div[2]/div/div    Salida de Puerto
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[19]/div[2]/div/div    TODOS
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[20]/div[2]/div/div    Tx Irregular
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[21]/div[2]/div/div    Técnicamente Pescando
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[22]/div[2]/div/div    Zona Decreto
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[23]/div[2]/div/div    Zona Prohibida Cedula
    Deslizar scroll estatus arriba
    Sleep    1
    Desplegar opcion Estatus
    Sleep    1
    Element Text Should Be    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[2]/div[2]/div/div    Litoral
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[2]/ul/li[1]/div[2]/div/div    Golfo
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[2]/ul/li[2]/div[2]/div/div    Pacifico
    Desplegar opcion Litoral
    Sleep    1
    Element Text Should Be    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[3]/div[2]/div/div    Grupos
    Desplegar opcion Grupos
    Sleep    1
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[1]/div[2]/div/div    BASES MARINAS
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[2]/div[2]/div/div    CONTROL
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[3]/div[2]/div/div    CUBA
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[4]/div[2]/div/div    Carga Inicial
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[5]/div[2]/div/div    DGIV
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[6]/div[2]/div/div    GOLFO DE MEXICO
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[7]/div[2]/div/div    NUEVOS
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[8]/div[2]/div/div    PACIFICO
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[9]/div[2]/div/div    PESCA DIDACTICA
    Desplegar opcion Grupos
    Sleep    1
    Element Text Should Be    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[4]/div[2]/div/div    Permisos
    Desplegar opcion Permisos
    Sleep    1
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[1]/div[2]/div/div    ANCHOVETA
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[2]/div[2]/div/div    CALAMAR
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[3]/div[2]/div/div    CALAMAR 2
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[4]/div[2]/div/div    CAMARON DE ALTAMAR
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[5]/div[2]/div/div    CAMARON DE ALTAMAR 2
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[6]/div[2]/div/div    CAMARON DE ALTAMAR MENORES
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[7]/div[2]/div/div    CANGREJO
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[8]/div[2]/div/div    ESCAMA MARINA
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[9]/div[2]/div/div    ESCAMA MARINA 2
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[10]/div[2]/div/div    ESCAMA MARINA MENORES
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[11]/div[2]/div/div    FOMENTO
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[12]/div[2]/div/div    FOMENTO 2
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[13]/div[2]/div/div    JAIBA
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[14]/div[2]/div/div    JAIBA MENORES
    Deslizar scroll permisos abajo
    Sleep    1
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[15]/div[2]/div/div    LANGOSTA
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[16]/div[2]/div/div    MERLUZA
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[17]/div[2]/div/div    OSTION MENORES
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[18]/div[2]/div/div    PELAGICOS MENORES
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[19]/div[2]/div/div    PEZ ESPADA
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[20]/div[2]/div/div    PULPO
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[21]/div[2]/div/div    SARDINA
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[22]/div[2]/div/div    TIBURON
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[23]/div[2]/div/div    TIBURON MENORES
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[24]/div[2]/div/div    TUNIDOS
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[25]/div[2]/div/div    TUNIDOS 2
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[26]/div[2]/div/div    TUNIDOS 3
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[27]/div[2]/div/div    TUNIDOS 4
    Deslizar scroll permisos arriba
    Sleep    1
    Desplegar opcion Permisos
    Sleep    1
    Element Text Should Be    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[5]/div[2]/div/div    Transmitiendo
    Desplegar opcion Transmitiendo
    Sleep    1
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[5]/ul/li[1]/div[2]/div/div    No
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[5]/ul/li[2]/div[2]/div/div    Si
    Desplegar opcion Transmitiendo
    Sleep    1
    Element Text Should Be    xpath=//*[@id="treeview-filtro"]/div/div/div/div[1]/ul/li[6]/div[2]/div/div    Tipo
    Desplegar opcion Tipo
    Sleep    1
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[6]/ul/li[1]/div[2]/div/div    Barco
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[6]/ul/li[2]/div[2]/div/div    Panga
    
Deslizar scroll estatus abajo
    Execute JavaScript    window.document.evaluate('/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[17]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]/ul/li[17]    timeout=15
    
Deslizar scroll estatus arriba
    Execute JavaScript    window.document.evaluate('/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[1]    timeout=15
    
Deslizar scroll permisos abajo
    Execute JavaScript    window.document.evaluate('/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[13]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[13]    timeout=15
    
Deslizar scroll permisos arriba
    Execute JavaScript    window.document.evaluate('/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]    timeout=15