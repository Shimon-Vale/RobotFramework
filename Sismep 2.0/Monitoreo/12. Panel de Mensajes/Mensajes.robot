*** Settings ***
Resource    ../../Recursos.Generales.robot

*** Variables ***
${DescargaExcel}    C:/Users/mmorales/Downloads/VistaDatosExcel.xlsx

*** Test Cases ***
Panel de Mensajes - Validar etiquetas
    [Documentation]    Valida que se muestren correctamente escritas las etiquetas.
    [Tags]    Panel de Mensajes - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Panel de Mensajes
    Sleep    2
    Validar etiquetas
    Sleep    1
    [Teardown]    Close Browser
    
Panel de Mensajes - Exportar a Excel
    [Documentation]    Debera validar que se exporte correctamente el archivo Excel.
    [Tags]    Panel de Mensajes - Exportar a Excel - T1059
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Panel de Mensajes
    Sleep    2
    Presionar boton Exportar a Excel
    Sleep    10
    Validar archivo de Excel generado
    [Teardown]    Close Browser
    
*** Keywords ***
Presionar opcion Panel de Mensajes
    Wait Until Element Is Visible    //*[@id="divPanelControles"]/button[7]
    Click Element    //*[@id="divPanelControles"]/button[7]
    Sleep    1
    #Select Window    title=Sismep - Panel de Mensajes
    Switch Window    title=Sismep - Panel de Mensajes
    Maximize Browser Window
    
Validar etiquetas
    Validar etiquetas Pagina 1
    Execute JavaScript    document.querySelector("#dx-col-19").scrollIntoView(false);
    Sleep    1
    Validar etiquetas Pagina 2
    Execute JavaScript    document.querySelector("#dx-col-28").scrollIntoView(false);
    Sleep    1
    Validar etiquetas Pagina 3
    Execute JavaScript    document.querySelector("#dx-col-39").scrollIntoView(false);
    Sleep    1
    Validar etiquetas Pagina 4
    Execute JavaScript    document.querySelector("#dx-col-51").scrollIntoView(false);
    Sleep    1
    Validar etiquetas Pagina 5
    Execute JavaScript    document.querySelector("#dx-col-59").scrollIntoView(false);
    Sleep    1
    Validar etiquetas Pagina 6
    
Validar etiquetas Pagina 1
    Element Text Should Be    //*[@id="dx-col-1"]    Folio
    Element Text Should Be    //*[@id="dx-col-2"]    Nombre
    Element Text Should Be    //*[@id="dx-col-3"]    Antena
    Element Text Should Be    //*[@id="dx-col-4"]    Matrícula
    Element Text Should Be    //*[@id="dx-col-5"]    RNP
    Element Text Should Be    //*[@id="dx-col-6"]    Último Reporte
    Element Text Should Be    //*[@id="dx-col-7"]    En Mantenimiento
    Element Text Should Be    //*[@id="dx-col-8"]    Emergencia
    Element Text Should Be    //*[@id="dx-col-9"]    Zona Prohibida
    Element Text Should Be    //*[@id="dx-col-10"]    Zona Pesca Prohibida
    Element Text Should Be    //*[@id="dx-col-11"]    Zona Decreto
    
Validar etiquetas Pagina 2
    Element Text Should Be    //*[@id="dx-col-12"]    Permiso Vencido
    Element Text Should Be    //*[@id="dx-col-13"]    Múltiples Permisos
    Element Text Should Be    //*[@id="dx-col-14"]    Proximidad
    Element Text Should Be    //*[@id="dx-col-15"]    Técnicamente Pescando
    Element Text Should Be    //*[@id="dx-col-16"]    Conectado
    Element Text Should Be    //*[@id="dx-col-17"]    Transmitiendo
    Element Text Should Be    //*[@id="dx-col-18"]    En Puerto
    Element Text Should Be    //*[@id="dx-col-19"]    Tipo Embarcaci\u00F3n
    
Validar etiquetas Pagina 3
    Element Text Should Be    //*[@id="dx-col-20"]    Razón Social
    Element Text Should Be    //*[@id="dx-col-21"]    RNPTitular
    Element Text Should Be    //*[@id="dx-col-22"]    Latitud
    Element Text Should Be    //*[@id="dx-col-23"]    Longitud
    Element Text Should Be    //*[@id="dx-col-24"]    Velocidad
    Element Text Should Be    //*[@id="dx-col-25"]    Rumbo
    Element Text Should Be    //*[@id="dx-col-26"]    Estado
    Element Text Should Be    //*[@id="dx-col-27"]    Municipio
    Element Text Should Be    //*[@id="dx-col-28"]    Localidad
    
Validar etiquetas Pagina 4
    Element Text Should Be    //*[@id="dx-col-29"]    Puerto Base
    Element Text Should Be    //*[@id="dx-col-30"]    Litoral
    Element Text Should Be    //*[@id="dx-col-31"]    Potencia Motor
    Element Text Should Be    //*[@id="dx-col-32"]    Eslora
    Element Text Should Be    //*[@id="dx-col-33"]    Puntal
    Element Text Should Be    //*[@id="dx-col-34"]    Asociacion
    Element Text Should Be    //*[@id="dx-col-35"]    Permiso 1
    Element Text Should Be    //*[@id="dx-col-36"]    Tipo 1
    Element Text Should Be    //*[@id="dx-col-37"]    Estatus 1
    Element Text Should Be    //*[@id="dx-col-38"]    Fecha Inicio 1
    Element Text Should Be    //*[@id="dx-col-39"]    Fecha Fin 1
    
Validar etiquetas Pagina 5
    Element Text Should Be    //*[@id="dx-col-40"]    Permiso 2
    Element Text Should Be    //*[@id="dx-col-41"]    Tipo 2
    Element Text Should Be    //*[@id="dx-col-42"]    Estatus 2
    Element Text Should Be    //*[@id="dx-col-43"]    Fecha Inicio 2
    Element Text Should Be    //*[@id="dx-col-44"]    Fecha Fin 2
    Element Text Should Be    //*[@id="dx-col-45"]    Permiso 3
    Element Text Should Be    //*[@id="dx-col-46"]    Tipo 3
    Element Text Should Be    //*[@id="dx-col-47"]    Estatus 3
    Element Text Should Be    //*[@id="dx-col-48"]    Fecha Inicio 3
    Element Text Should Be    //*[@id="dx-col-49"]    Fecha Fin 3
    Element Text Should Be    //*[@id="dx-col-50"]    Permiso 4
    Element Text Should Be    //*[@id="dx-col-51"]    Tipo 4
    
Validar etiquetas Pagina 6
    Element Text Should Be    //*[@id="dx-col-52"]    Estatus 4
    Element Text Should Be    //*[@id="dx-col-53"]    Fecha Inicio 4
    Element Text Should Be    //*[@id="dx-col-54"]    Fecha Fin 4
    Element Text Should Be    //*[@id="dx-col-55"]    Permiso 5
    Element Text Should Be    //*[@id="dx-col-56"]    Tipo 5
    Element Text Should Be    //*[@id="dx-col-57"]    Estatus 5
    Element Text Should Be    //*[@id="dx-col-58"]    Fecha Inicio 5
    Element Text Should Be    //*[@id="dx-col-59"]    Fecha Fin 5
    
Presionar boton Exportar a Excel
    Wait Until Element Is Visible    xpath=//*[@id="btnExcel"]
    Click Element    xpath=//*[@id="btnExcel"]
    
Validar archivo de Excel generado
    File Should Exist   ${DescargaExcel}