*** Settings ***
Resource    Recursos.Reportes.robot

*** Variables ***
&{Embarcacion}    Nombre=PUERTO SAN CARLOS    RNP=00046557    Matricula=25033692232
&{EmbarcacionSD}    Nombre=BALAM II    RNP=00021147    Matricula=2602051123-7
${titRecreacion}    title=Sismep - Reporte de Recreaci\u00F3n Posiciones
${fechaini}    14/10/2022 00:00:00
${fechafin}    14/10/2022 23:59:59
${fechainiUTC}    20221014 07:00:00
${fechafinUTC}    20221015 07:00:00
${DescargaReporte}    C:/Users/mmorales/Downloads/ReporteRecreacionPos.xlsx
${divmapa}    2

*** Test Cases ***
Reporte de Recreacion de Posiciones: Validar etiquetas
    [Documentation]    Valida que se muestren correctamente escritas las etiquetas.
    [Tags]    Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Filtro Embarcacion Obligatorio
    [Documentation]    Valida que se muestre una validacion al dejar el campo de embarcacion vacio.
    [Tags]    Filtro Embarcacion Obligatorio - T1086
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Seleccionar rango de fechas
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    7    Favor de seleccionar "Vehiculo".
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Validacion rango de fechas
    [Documentation]    Valida que se muestre una validacion cuando la fecha inicial sea mayor fecha final.
    [Tags]    Validacion rango de fechas - T1087
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas    ${fechafin}    ${fechaini}
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    7    Fecha Inicial debe ser menor a la Fecha Final.
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Validacion Fecha Inical y Final en blanco
    [Documentation]    Valida que se muestre una validacion cuando el rango de fechas este vacio.
    [Tags]    Validacion Fecha Inical y Final en blanco
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas    ${EMPTY}    ${EMPTY}
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    7    Favor de completar los campos Fecha Inicial y Fecha Final.
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta sin resultados - Validar mensaje
    [Documentation]    Valida que se muestre un validacion cuando la consulta no contega resultados.
    [Tags]    Consulta sin resultados - Validar mensaje - T1085
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionSD}[Nombre]
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    7    No se encontraron resultados.
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre
    [Documentation]    Valida que se realice correctamente la consulta por Nombre.
    [Tags]    Consulta por Nombre - T1088
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Validar etiquetas y tooltips
    [Documentation]    Valida que se muestren correctamente escritas las etiquetas 
        ...    y textos de los tooltips.
    [Tags]    Consulta por Nombre - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Validar resultado de la consulta - Etiquetas y tooltips
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Validar datos de Embarcacion en BD
    [Documentation]    Valida que los resultados de la consulta sean correctos contra la Base de datos.
    [Tags]    Consulta por Nombre - Validar datos de Embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Validar datos de Embarcacion en BD
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Menu contextual izquierdo - Validar etiquetas
    [Documentation]    Valida que se muestre correctamente escritas las etiquetas del Menu contextual.
    [Tags]    Consulta por Nombre - Menu contextual izquierdo - Validar etiquetas - T588
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Zoom IN
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar etiquetas - Menu contextual (clic izquierdo)    ${Embarcacion}[Nombre]
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Menu contextual izquierdo - Validar datos de Embarcacion en BD
    [Documentation]    Valida que la informacion mostrada en el Menu sea correcta contra la BD.
    [Tags]    Consulta por Nombre - Menu contextual izquierdo - Validar datos de Embarcacion en BD - T588
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Zoom IN
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Nueva consulta
    [Documentation]    Valida que permita regresar a la ventana de parametros
        ...    para realizar una Nueva Consulta.
    [Tags]    Consulta por Nombre - Nueva consulta - T586
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar opcion Nueva Consulta
    Validar retorno a ventana de Consulta
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Mostrar zonas
    [Documentation]    Valida que al seleccionar la opcion Zonas se muestre las zonas pintadas en el mapa.
    [Tags]    Consulta por Nombre - Mostrar zonas - T579
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar opcion Zonas
    Sleep    5
    Validar zonas activadas
    [Teardown]    Close Browser

#Reporte de Recreacion de Posiciones: Consulta por Nombre - Mostrar Nautica
    #[Documentation]    Valida ...
    #[Tags]    Consulta por Nombre - Mostrar Nautica
    #Iniciar sesion
    #Sleep    1
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte de Recreacion de Posiciones
    #Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    #Seleccionar rango de fechas
    #Sleep    1
    #Presionar boton Consultar
    #Sleep    2
    #Seleccionar opcion Nautica
    #Sleep    5
    #Validar nautica activada
    #[Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Mostrar Distancia
    [Documentation]    Valida que al seleccionar la opcion Distancia permita calcular
        ...    la distancia de un punto a otro.
    [Tags]    Consulta por Nombre - Mostrar Distancia - T583
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Distancia
    Sleep    2
    Zoom IN
    Validar distancia activada    mn
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Mostrar Tabular
    [Documentation]    Valida que se muestre los resultados de la consulta correctamente Tabulados.
    [Tags]    Consulta por Nombre - Mostrar Tabular - T587
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Tabular - Validar etiquetas
    [Documentation]    Valida que se muestre correctamente escritas las etiquetas en el tabular.
    ...    Validar si es correcto que este reporte no presente
    ...    el titulo del sistema
    [Tags]    Consulta por Nombre - Tabular - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    Validar etiquetas en Tabular
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Tabular - Validar informacion en BD
    [Documentation]    Valida que la informacion mostrada en el tabular sea correcta 
        ...    contra la informacion de la Base de datos.
    [Tags]    Consulta por Nombre - Tabular - Validar informacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    Sleep    1
    Validar informacion en BD del Tabular
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Tabular - Posicion Decimal
    [Documentation]    Valida que se muestre correctamente la configuracion de 
        ...    Posicion en Decimal en el Tabular.
    [Tags]    Consulta por Nombre - Tabular - Posicion Decimal
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar posicion    ${Decimal}
    Sleep    2
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular (posicion Decimal)
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Tabular - Velocidad KPH
    [Documentation]    Valida que se muestre correctamente la configuracion de 
        ...   Velocidad en KPH en el Tabular.
    [Tags]    Consulta por Nombre - Tabular - Velocidad KPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${KPH}
    Sleep    2
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular    CONVERT(DECIMAL(5,2),(mcp.Velocidad))    KPH
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Tabular - Velocidad MPH
    [Documentation]    Valida que se muestre correctamente la configuracion de 
        ...    Velocidad en MPH en el Tabular.
    [Tags]    Consulta por Nombre - Tabular - Velocidad MPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${MPH}
    Sleep    2
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular    CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.609))    MPH
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Tabular - Exportar a Excel
    [Documentation]    Valida que se exporte correctamente el archivo Excel.
    [Tags]    Consulta por Nombre - Tabular - Exportar a Excel - T1089
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    Presionar boton Exportar a Excel
    Sleep    5
    Validar archivo de Excel generado    ${DescargaReporte}
    [Teardown]    Close Browser

#Reporte de Recreacion de Posiciones: Consulta por Nombre - Tabular - Imprimir
    #[Documentation]    Valida que se imprima correctamente el Tabular.
    #[Tags]    Consulta por Nombre - Tabular - Imprimir
    #Iniciar sesion
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte de Recreacion de Posiciones
    #Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    #Seleccionar rango de fechas
    #Sleep    1
    #Presionar boton Consultar
    #Seleccionar opcion Tabular
    #Presionar boton imprimir
    #Sleep    2
    #Validar ventana de impresion
    #[Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Tabular - Vista Mapa
    [Documentation]    Valida que al presionar el boton Vista Mapa del Tabular
        ...    te regrese al mapa de resultados.
    [Tags]    Consulta por Nombre - Tabular - Vista Mapa - T1095
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    Presionar boton Regresar
    Sleep    2
    Validar retorno a ventana Vista Mapa
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Configuracion (contextual) - Posicion Decimal
    [Documentation]    Valida que se muestre correctamente la configuracion 
        ...    de Posicion en Decimal en el mapa contextual.
    [Tags]    Consulta por Nombre - Configuracion (contextual) - Posicion Decimal
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar posicion    ${Decimal}
    Zoom IN
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual - Posicion Decimal
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Configuracion (contextual) - Velocidad KPH
    [Documentation]    Valida que se muestre correctamente la configuracion 
        ...    de Velocidad en KPH en el mapa contextual.
    [Tags]    Consulta por Nombre - Configuracion (contextual) - Velocidad KPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${KPH}
    Zoom IN
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual    CONVERT(DECIMAL(5,2),(mcp.Velocidad))    KPH
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Configuracion (contextual) - Velocidad MPH
    [Documentation]    Valida que se muestre correctamente la configuracion 
        ...    de Velocidad en MPH en el mapa contextual.
    [Tags]    Consulta por Nombre - Configuracion (contextual) - Velocidad MPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${MPH}
    Zoom IN
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual    CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.609))    MPH
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Configuracion - Distancia Km
    [Documentation]    Valida que se muestre correctamente la configuracion 
        ...    de Distancia en Km al seleccionar Distancia.
    [Tags]    Consulta por Nombre - Configuracion - Distancia Km
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Distancia    ${DstKilometros}
    Zoom IN
    Seleccionar opcion Distancia
    Sleep    1
    Validar distancia activada    km
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Nombre - Configuracion - Distancia Mi
    [Documentation]    Valida que se muestre correctamente la configuracion 
        ...    de Distancia en Mi al seleccionar Distancia.
    [Tags]    Consulta por Nombre - Configuracion - Distancia Mi
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Distancia    ${DstMillas}
    Zoom IN
    Seleccionar opcion Distancia
    Sleep    1
    Validar distancia activada    mi
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por RNP - Validar datos de Embarcacion en BD
    [Documentation]    Valida que se muestre correctamente los resultados al realizar
        ...    la consulta por RNP contra la BD.
    [Tags]    Consulta por RNP - Validar datos de Embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 2, Campo ${Embarcacion}[RNP]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Validar datos de Embarcacion en BD
    [Teardown]    Close Browser

Reporte de Recreacion de Posiciones: Consulta por Matricula - Validar datos de Embarcacion en BD
    [Documentation]    Valida que se muestre correctamente los resultados al realizar
        ...    la consulta por Matricula contra la BD.
    [Tags]    Consulta por Matricula - Validar datos de Embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Recreacion de Posiciones
    Filtrar Embarcacion por Columna 3, Campo ${Embarcacion}[Matricula]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Validar datos de Embarcacion en BD
    [Teardown]    Close Browser

*** Keywords ***
Presionar opcion Reporte de Recreacion de Posiciones
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/div[3]/div/a[5]
    Click Element    xpath=//*[@id="divPanelControles"]/div[3]/div/a[5]
    Sleep    1
    Switch Window    ${titRecreacion}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="cboDevExEmbarques"]/div[1]/div/div[1]/input    timeout=60

Filtrar Embarcacion por Columna ${COL}, Campo ${CAMPO}
    Click Element    xpath=//*[@id="cboDevExEmbarques"]/div[1]/div/div[1]/input
    Sleep    1
    Input Text    xpath=//*[@id="cboDevExEmbarques_template"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    Sleep    1
    Click Element    xpath=//*[@id="cboDevExEmbarques_template"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[${COL}]

Seleccionar rango de fechas
    [Arguments]    ${inicial}=${fechaini}    ${final}=${fechafin}
    Input Text    xpath=//*[@id="date-time-inicial"]/div/div/div[1]/input    ${inicial}
    Input Text    xpath=//*[@id="date-time-final"]/div/div/div[1]/input    ${final}

Presionar boton Consultar
    Click Element    xpath=//*[@id="validate"]/div
    Wait Until Element Is Visible    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[3]/div[1]/img    timeout=30

Presionar opcion Consultar (obligatorios)
    Click Element    xpath=//*[@id="validate"]/div
    
Validar etiquetas
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/h3    Reporte de Recreación Posiciones
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[1]/label    Embarcación
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[2]/div[1]/label    Fecha Inicial:
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[2]/div[2]/label    Fecha Final:
    Element Text Should Be    xpath=//*[@id="validate"]/div/span    Consultar

Validar resultado de la consulta - Etiquetas y tooltips
    ${ttConsulta}=    Get Element Attribute    xpath=//*[@id="btnBack"]    title
    ${ttZonas}=    Get Element Attribute    xpath=//*[@id="btnZonas"]    title
    ${ttNautica}=    Get Element Attribute    xpath=//*[@id="btnNautica"]    title
    ${ttDistancia}=    Get Element Attribute    xpath=//*[@id="btnDistancia"]    title
    ${ttTabular}=    Get Element Attribute    xpath=//*[@id="btnTabular"]    title
    ${ttConfiguracion}=    Get Element Attribute    xpath=//*[@id="btnConfiguracion"]/span    title
    ${ttReproducir}=    Get Element Attribute    xpath=/html/body/div[1]/div/button[6]    title
    ${ttDetener}=    Get Element Attribute    xpath=/html/body/div[1]/div/button[7]    title
    Element Text Should Be    //*[@id="toolBarData"]/div/div[1]/div/h4    Reporte de Recreación Posiciones
    Element Text Should Be    //*[@id="toolBarData"]/div/div[2]/div[1]    Nombre:
    Element Text Should Be    //*[@id="toolBarData"]/div/div[3]/div[1]    RNP:
    Element Text Should Be    //*[@id="toolBarData"]/div/div[4]/div[1]    Matricula:
    Should be equal    ${ttConsulta}    Nueva Consulta
    Should be equal    ${ttZonas}    Zonas
    Should be equal    ${ttNautica}    Nautica
    Should be equal    ${ttDistancia}    Distancia
    Should be equal    ${ttTabular}    Tabular
    Should be equal    ${ttConfiguracion}    Configuraci\u00F3n
    Should be equal    ${ttReproducir}    Reproducir
    Should be equal    ${ttDetener}    Detener

# Obtener datos de la embarcacion
#     ${Nombre}=    Get Text    xpath=//*[@id="toolBarData"]/div/div[2]/div[2]/span
#     ${RNP}=    Get Text    xpath=//*[@id="toolBarData"]/div/div[3]/div[2]/span
#     ${Matricula}=    Get Text    xpath=//*[@id="toolBarData"]/div/div[4]/div[2]/span
#     Set Test Variable    ${Nombre}
#     Set Test Variable    ${RNP}
#     Set Test Variable    ${Matricula}
    
Validar datos de Embarcacion en BD
    Obtener datos de la Embarcacion
    Conexion a Base de datos
    ${countmapa}=    Execute JavaScript    return document.querySelector("#map-canvas > div > div > div:nth-child(2) > div:nth-child(${divmapa}) > div > div:nth-child(3)").childElementCount-1;
    @{countDB}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}'
    Should be equal    ${countDB[0][0]}    ${countmapa}
    @{queryResults}=    Query    select Nombre, RNP, Matricula from Sismep.TSismepVehiculos where Nombre = '${Embarcacion}[Nombre]'
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${RNP}
    Should Be Equal    ${queryResults[0][2]}    ${Matricula}
    Disconnect From Database

# Desplegar menu contextual de Embarcacion (clic izquierdo)
#     Click Element    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[3]/div[1]/img

# Validar etiquetas - Menu contextual (clic izquierdo)
#     Wait Until Element Is Visible    //*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[1]/td/h2
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[1]/td/h2    ${Embarcacion}[Nombre]
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[2]/td[1]/b    RNP:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[3]/td[1]/b    Matr\u00EDcula:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[4]/td[1]/b    Latitud:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[5]/td[1]/b    Longitud:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[6]/td[1]/b    Velocidad:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[7]/td[1]/b    Rumbo:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[8]/td[1]/b    Ultimo reporte:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[9]/td[1]/b    Puerto base:

# Obtener datos de la Embarcacion - Contextual - Default
#     ${Nombre}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[1]/td/h2
#     ${RNP}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[2]/td[2]
#     ${Matricula}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[3]/td[2]
#     ${Latitud}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[4]/td[2]
#     ${Longitud}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[5]/td[2]
#     ${Velocidad}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[6]/td[2]
#     ${Rumbo}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[7]/td[2]
#     ${UltimoReporte}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[8]/td[2]
#     ${PuertoBase}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[9]/td[2]
#     Set Test Variable    ${Nombre}
#     Set Test Variable    ${RNP}
#     Set Test Variable    ${Matricula}
#     Set Test Variable    ${Latitud}
#     Set Test Variable    ${Longitud}
#     Set Test Variable    ${Velocidad}
#     Set Test Variable    ${Rumbo}
#     Set Test Variable    ${UltimoReporte}
#     Set Test Variable    ${PuertoBase}

# Obtener datos de la Embarcacion - Contextual - Decimal
#     ${Nombre}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[1]/td/h2
#     ${RNP}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[2]/td[2]
#     ${Matricula}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[3]/td[2]
#     ${Lat}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[4]/td[2]
#     ${Latitud}=    Convert to Number    ${Lat}
#     ${Lon}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[5]/td[2]
#     ${Longitud}=    Convert to Number    ${Lon}
#     ${Velocidad}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[6]/td[2]
#     ${Rumbo}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[7]/td[2]
#     ${UltimoReporte}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[8]/td[2]
#     ${PuertoBase}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[9]/td[2]
#     Set Test Variable    ${Nombre}
#     Set Test Variable    ${RNP}
#     Set Test Variable    ${Matricula}
#     Set Test Variable    ${Latitud}
#     Set Test Variable    ${Longitud}
#     Set Test Variable    ${Velocidad}
#     Set Test Variable    ${Rumbo}
#     Set Test Variable    ${UltimoReporte}
#     Set Test Variable    ${PuertoBase}
    
Validar datos de Embarcacion en BD - Contextual
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Obtener datos de la Embarcacion - Contextual - Default
    Conexion a Base de datos
    @{queryResults}=    Query    select top 1 v.Nombre, v.RNP, v.Matricula, mcp.Latitud, mcp.Longitud, ${Vel}, mcp.Rumbo, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), pti.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' order by mcp.FechaRecepcionUnitrac
    ${LatitudBD}=    Execute Javascript    ${JSLatitudDMS} return LatitudDMS(${queryResults[0][3]});
    ${LongitudBD}=    Execute Javascript    ${JSLongitudDMS} return LongitudDMS(${queryResults[0][4]});
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} ${etqVel}
    ${RumboBD}=    Catenate    ${queryResults[0][6]}\u00B0
    ${UltimoRBD}=    Execute Javascript    cadena='${queryResults[0][7]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3;
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${RNP}
    Should Be Equal    ${queryResults[0][2]}    ${Matricula}
    Should Be Equal    ${LatitudBD}    ${Latitud}
    Should Be Equal    ${LongitudBD}    ${Longitud}
    Should Be Equal    ${VelocidadBD}    ${Velocidad}
    Should Be Equal    ${RumboBD}    ${Rumbo}
    Should Be Equal    ${UltimoRBD}    ${UltimoReporte}
    Should Be Equal    ${queryResults[0][8]}    ${PuertoBase}
    Disconnect From Database
    
Validar datos de Embarcacion en BD - Contextual - Posicion Decimal
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Obtener datos de la Embarcacion - Contextual - Decimal
    Conexion a Base de datos
    @{queryResults}=    Query    select top 1 v.Nombre, v.RNP, v.Matricula, round(mcp.Latitud, 7), round(mcp.Longitud, 7), ${Vel}, mcp.Rumbo, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), pti.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' order by mcp.FechaRecepcionUnitrac
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} ${etqVel}
    ${RumboBD}=    Catenate    ${queryResults[0][6]}\u00B0
    ${UltimoRBD}=    Execute Javascript    cadena='${queryResults[0][7]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3;
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${RNP}
    Should Be Equal    ${queryResults[0][2]}    ${Matricula}
    Should Be Equal    ${queryResults[0][3]}    ${Latitud}
    Should Be Equal    ${queryResults[0][4]}    ${Longitud}
    Should Be Equal    ${VelocidadBD}    ${Velocidad}
    Should Be Equal    ${RumboBD}    ${Rumbo}
    Should Be Equal    ${UltimoRBD}    ${UltimoReporte}
    Should Be Equal    ${queryResults[0][8]}    ${PuertoBase}
    Disconnect From Database
    
# Seleccionar opcion Nueva Consulta
#     Click Element    //*[@id="btnBack"]

# Validar retorno a ventana de Consulta
#     Wait Until Element Is Visible    xpath=//*[@id="validate"]/div
#     Element Should Be Visible    xpath=//*[@id="validate"]/div

# Seleccionar opcion Zonas
#     Click Element    xpath=//*[@id="btnZonas"]

# Validar zonas activadas
#     ${atrZonas}=    Get Element Attribute    xpath=//*[@id="btnZonas"]    value
#     Should be equal    ${atrZonas}    true

# Seleccionar opcion Nautica
#     Click Element    //*[@id="btnNautica"]

# Validar nautica activada
#     ${atrNautica}=    Get Element Attribute    xpath=//*[@id="btnNautica"]    value
#     Should be equal    ${atrNautica}    true

# Seleccionar opcion Distancia
#     Wait Until Element Is Visible    //*[@id="btnDistancia"]
#     Click Element    //*[@id="btnDistancia"]

# Validar distancia activada
#     [Arguments]    ${arg1}
#     ${div}=    Execute JavaScript    return document.querySelector("#map-canvas > div > div > div:nth-child(2) > div:nth-child(${divmapa}) > div > div:nth-child(3)").childElementCount-1;
#     ${atrDistancia}=    Get Element Attribute    xpath=//*[@id="btnDistancia"]    value
#     Should be equal    ${atrDistancia}    true
#     Execute JavaScript    document.evaluate('//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[3]/div[${div}]/img',document.body,null,9,null).singleNodeValue.click();
#     Wait Until Element Is Visible    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div/div/div/div/div/h3
#     ${etq}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[${divmapa}]/div/div[4]/div[2]/div/div/div/div/div/div/h3
#     Should Contain    ${etq}    ${arg1}
    
# Seleccionar opcion Tabular
#     Wait Until Element Is Visible    xpath=//*[@id="btnTabular"]
#     Click Element    xpath=//*[@id="btnTabular"]
#     Sleep    2
#     Select Frame    xpath=//*[@id="iRepTabular"]
#     Wait Until Element Is Visible    xpath=//*[@id="divtable"]    timeout=30
#     ${date24h}    Get Current Date    result_format=%d/%m/%Y %H:%M
#     Set Test Variable    ${date24h}

Obtener datos de Embarcacion y Usuario en BD
    Conexion a Base de datos
    @{queryResults}=    Query    select v.Nombre, v.RNP, v.Matricula, rs.Descripcion from Sismep.TSismepVehiculos v join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial where v.Nombre = '${Embarcacion}[Nombre]'
    @{queryUsuario}=    Query    select Nombre from aspnet_Users where UserName = '${credenciales}[usuario]'
    Set Test Variable    ${Nombre}    ${queryResults[0][0]}
    Set Test Variable    ${RNP}    ${queryResults[0][1]}
    Set Test Variable    ${Matricula}    ${queryResults[0][2]}
    Set Test Variable    ${RazonSocial}    ${queryResults[0][3]}
    Set Test Variable    ${Usuario}    ${queryUsuario[0][0]}
    Disconnect From Database
    
Validar etiquetas en Tabular
    Obtener datos de Embarcacion y Usuario en BD
    Sleep    1
    ${ttExcel}=    Get Element Attribute    xpath=//*[@id="menu"]/div[2]/button    title
    ${ttImprimir}=    Get Element Attribute    xpath=//*[@id="menu"]/div[3]/button    title
    ${ttMapa}=    Get Element Attribute    xpath=//*[@id="menu"]/div[4]/button    title
    Should be equal    ${ttExcel}    Exportar a Excel
    Should be equal    ${ttImprimir}    Imprimir
    Should be equal    ${ttMapa}    Vista Mapa
    ${Embarcacion}=    Catenate    Embarcacion: ${Nombre} ${SPACE}RNP:${RNP} ${SPACE}Matricula:${Matricula}
    ${RazonSocial}=    Catenate    Razon Social: ${RazonSocial}
    ${Rango}=    Catenate    Rango del Reporte: ${fechaini} al ${fechafin}
    ${UserImp}=    Get Text    xpath=//*[@id="VesselInfo"]/p[4]
    ${UsuarioImp}=    Execute Javascript    cadena='${UserImp}'; return cadena.slice(0,-3);
    Element Text Should Be    //*[@id="headerRigth"]/h2    conapesca.gob.mx
    Element Text Should Be    //*[@id="banner"]/h3/span    Sistema de Localizaci\u00F3n y Monitoreo de Embarcaciones Pesqueras
    Element Text Should Be    //*[@id="VesselInfo"]/p[1]    ${Embarcacion}
    Element Text Should Be    //*[@id="VesselInfo"]/p[2]    ${RazonSocial}
    Element Text Should Be    //*[@id="VesselInfo"]/p[3]    ${Rango}
    Should be equal    ${UsuarioImp}    Usuario: ${Usuario} Impreso el ${date24h}
    Element Text Should Be    //*[@id="main"]/div[2]/h3/span    Recreación de Posiciones
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[1]    Orden
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[2]    Fecha
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[3]    Latitud
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[4]    Longitud
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[5]    Rumbo
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[6]    Velocidad
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[7]    Mantenimiento
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[8]    Emergencia
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[9]    Zona Prohibida
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[10]    Pesca Prohibida
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[11]    Permiso Vencido
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[12]    Multiples Permisos
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[13]    Proximidad
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[14]    Tecnicamente Pescando
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[15]    Conexion
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[16]    Transmitiendo
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[17]    EnPuerto
    Element Text Should Be    //*[@id="pBottom"]    Comisi\u00F3n Nacional de Acuacultura y Pesca, M\u00E9xico - Algunos derechos reservados \u00A9 2014
    Element Text Should Be    //*[@id="pTop"]    Av. Camar\u00F3n S\u00E1balo S/N Esq. Tibur\u00F3n, Fracc. S\u00E1balo Country Club, C.P. 82100 Mazatl\u00E1n, Sin. Mex. Tel. 01-800-6674-022
    
Validar informacion en BD del Tabular
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Conexion a Base de Datos
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table > tbody").rows.length -1;
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}'
    Should be equal    ${queryRows[0][0]}    ${rows}
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[2]
    ${Latitud}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[3]
    ${Longitud}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[4]
    ${Rumbo}=     Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[6]
    ${Mantenimiento}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[7]
    #${Emergencia}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[8]
    #${ZonaProhibida}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[9]
    #${PescaProhibida}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[10]
    #${PermisoVencido}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[11]
    #${MultiplesPermisos}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[12]
    #${Proximidad}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[13]
    #${TecPescando}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[14]
    #${Conexion}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[15]
    #${Transmitiendo}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[16]
    #${EnPuerto}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[17]
    @{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), mcp.Latitud, mcp.Longitud, mcp.Rumbo, ${Vel}, Mantenimiento = case when v.Mantenimiento = 0 then 'No' else 'Si' end from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' order by mcp.FechaRecepcionUnitrac
    ${FechaBD}=    Execute Javascript    cadena='${queryResults[0][1]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3;
    ${LatitudBD}=    Execute Javascript    ${JSLatitudDMS} return LatitudDMS(${queryResults[0][2]});
    ${LongitudBD}=    Execute Javascript    ${JSLongitudDMS} return LongitudDMS(${queryResults[0][3]});
    ${RumboBD}=    Catenate    ${queryResults[0][4]}\u00B0
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} ${etqVel}
    Should be equal    ${FechaBD}    ${Fecha}
    Should be equal    ${LatitudBD}    ${Latitud}
    Should be equal    ${LongitudBD}    ${Longitud}
    Should be equal    ${RumboBD}    ${Rumbo}
    Should be equal    ${VelocidadBD}    ${Velocidad}
    Should be equal    ${queryResults[0][6]}    ${Mantenimiento}
    Disconnect From Database
    
Validar informacion en BD del Tabular (posicion Decimal)
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Conexion a Base de Datos
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table > tbody").rows.length -1;
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}'
    Should be equal    ${queryRows[0][0]}    ${rows}
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[2]
    ${Lat}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[3]
    ${Latitud}=    Convert to Number    ${Lat}
    ${Lon}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[4]
    ${Longitud}=    Convert to Number    ${Lon}
    ${Rumbo}=     Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[6]
    ${Mantenimiento}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[7]
    #${Emergencia}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[8]
    #${ZonaProhibida}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[9]
    #${PescaProhibida}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[10]
    #${PermisoVencido}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[11]
    #${MultiplesPermisos}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[12]
    #${Proximidad}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[13]
    #${TecPescando}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[14]
    #${Conexion}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[15]
    #${Transmitiendo}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[16]
    #${EnPuerto}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[17]
    @{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), round(mcp.Latitud, 7), round(mcp.Longitud, 7), mcp.Rumbo, ${Vel}, Mantenimiento = case when v.Mantenimiento = 0 then 'No' else 'Si' end from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' order by mcp.FechaRecepcionUnitrac
    ${FechaBD}=    Execute Javascript    cadena='${queryResults[0][1]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3;
    ${LatitudBD}=    Execute Javascript    ${JSLatitudDMS} return LatitudDMS(${queryResults[0][2]});
    ${LongitudBD}=    Execute Javascript    ${JSLongitudDMS} return LongitudDMS(${queryResults[0][3]});
    ${RumboBD}=    Catenate    ${queryResults[0][4]}\u00B0
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} ${etqVel}
    Should be equal    ${FechaBD}    ${Fecha}
    Should be equal    ${queryResults[0][2]}    ${Latitud}
    Should be equal    ${queryResults[0][3]}    ${Longitud}
    Should be equal    ${RumboBD}    ${Rumbo}
    Should be equal    ${VelocidadBD}    ${Velocidad}
    Should be equal    ${queryResults[0][6]}    ${Mantenimiento}
    Disconnect From Database
   
# Presionar el boton Exportar a Excel
#     Wait Until Element Is Visible    xpath=//*[@id="menu"]/div[2]/button
#     Click Element    xpath=//*[@id="menu"]/div[2]/button

# Validar archivo Excel generado
#     File Should Exist   ${DescargaReporte}

# Presionar boton Imprimir
#     Wait Until Element Is Visible    xpath=//*[@id="menu"]/div[3]/button
#     Click Element    xpath=//*[@id="menu"]/div[3]/button

# Validar ventana de impresion
#     Wait Until Element Is Visible    xpath=//*[@id="sidebar"]//print-preview-button-strip//div/cr-button[1]
#     Element Should Be Visible    xpath=//*[@id="plugin"]

# Validar retorno a ventana Vista Mapa
#     Unselect Frame
#     Element Should Be Visible    xpath=//*[@id="toolBarData"]/div/div[1]/div/h4

# Seleccionar opcion Vista Mapa
#     Wait Until Element Is Visible    xpath=//*[@id="menu"]/div[4]/button
#     Click Element    xpath=//*[@id="menu"]/div[4]/button
    
# Validar mensaje
#     [Arguments]    ${arg1}
#     Wait Until Element Is Visible    xpath=/html/body/div[7]/div/div
#     Element Text Should Be    xpath=/html/body/div[7]/div/div/div[2]    ${arg1}

Zoom IN
    Execute JavaScript    map.setZoom(30);