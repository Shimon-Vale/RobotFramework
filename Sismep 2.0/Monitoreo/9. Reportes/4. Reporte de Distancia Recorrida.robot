*** Settings ***
Resource    Recursos.Reportes.robot

*** Variables ***
&{Embarcacion}    Nombre=PERLA NEGRA    RNP=00047035    Matricula=25031861339
&{EmbarcacionSD}    Nombre=BALAM II    RNP=00021147    Matricula=2602051123-7
${titDistanciaRecorrida}    title= Sismep - Distancia Recorrida
${fechaini}    14/10/2022 00:00:00
${fechafin}    14/10/2022 23:59:59
${fechainiUTC}    20221014 07:00:00
${fechafinUTC}    20221015 07:00:00
${DescargaReporte}    C:/Users/mmorales/Downloads/ReporteDistancia.xlsx

*** Test Cases ***
Reporte de Distancia Recorrida: Validar etiquetas
    [Documentation]    Valida que se muestren correctamente escritas las etiquetas.
    [Tags]    Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Filtro Embarcacion Obligatorio
    [Documentation]    Valida que muestre una validacion al dejar el campo de Embarcacion vacio.
    [Tags]    Filtro Embarcacion Obligatorio - T1074
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    7    Favor de seleccionar "Vehiculo".
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Validacion rango de fechas
    [Documentation]    Valida que se muestre una validacion cuando la fecha inicial sea mayor a la fecha final.
    [Tags]    Validacion rango de fechas - T1075
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas    ${fechafin}    ${fechaini}
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    7    Fecha Inicial debe ser menor a la Fecha Final.
    [Teardown]    Close Browser
    
Reporte de Distancia Recorrida: Validacion Fecha Inicial y Final en blanco
    [Documentation]    Valida que se muestre una validacion al dejar vacios los campos de rango de fechas.
    [Tags]    Validacion Fecha Inicial y Final en blanco
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas    ${EMPTY}    ${EMPTY}
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    7    Favor de completar los campos Fecha Inicial y Fecha Final.
    [Teardown]    Close Browser
    
Reporte de Distancia Recorrida: Consulta sin resultados - Validar mensaje
    [Documentation]    Valida que se muestre una validacion cuando la consulta no contiene resultados.
    [Tags]    Consulta sin resultados - Validar mensaje - T1073
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionSD}[Nombre]
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    7    No se encontraron resultados.
    [Teardown]    Close Browser
    
Reporte de Distancia Recorrida: Consulta por Nombre
    [Documentation]    Valida que se realice correctamente la consulta por el Nombre de la embarcacion.
    [Tags]    Consulta por Nombre - T1076
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Validar etiquetas y tooltips
    [Documentation]    Valida que se muestre correctamente escritas las etiquetas y los textos de los tooltips.
    [Tags]    Consulta por Nombre - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Validar resultado de la consulta - Etiquetas y tooltips
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Validar datos de Embarcacion en BD
    [Documentation]    Valida que los resultados mostrados en la consulta coincidan con los almacenados en la BD.
    [Tags]    Consulta por Nombre - Validar datos de Embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Validar datos de Embarcacion en BD
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Menu contextual izquierdo - Validar etiquetas
    [Documentation]    Valida que se muestre correctamente escritas las etiquetas del Menu contextual.
    [Tags]    Consulta por Nombre - Menu contextual izquierdo - Validar etiquetas - T575
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar etiquetas - Menu contextual (clic izquierdo)    ${Embarcacion}[Nombre]
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Menu contextual izquierdo - Validar datos de Embarcacion en BD
    [Documentation]    Valida que la informacion mostrada en el menu contextual este correcta contra la Base de datos.
    [Tags]    Consulta por Nombre - Menu contextual izquierdo - Validar datos de Embarcacion en BD - T575
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Nueva consulta
    [Documentation]    Valida que permita regresar a la ventana de parametros para realizar una Nueva Consulta.
    [Tags]    Consulta por Nombre - Nueva consulta - T573
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    1
    Seleccionar opcion Nueva Consulta
    Validar retorno a ventana de Consulta
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Mostrar zonas
    [Documentation]    Valida que al seleccionar la opcion Zonas se muestren las zonas pintadas en el mapa.
    [Tags]    Consulta por Nombre - Mostrar zonas - T565
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    1
    Seleccionar opcion Zonas
    Sleep    5
    Validar zonas activadas
    [Teardown]    Close Browser

#Reporte de Distancia Recorrida: Consulta por Nombre - Mostrar Nautica
    #[Documentation]    Valida ...
    #[Tags]    Consulta por Nombre - Mostrar Nautica
    #Iniciar sesion
    #Sleep    1
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte de Distancia Recorrida
    #Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    #Seleccionar rango de fechas
    #Sleep    1
    #Presionar boton Consultar
    #Sleep    1
    #Seleccionar opcion Nautica
    #Sleep    5
    #Validar nautica activada
    #[Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Mostrar Distancia
    [Documentation]    Valida que al seleccionar la opcion Distancia permita calcular la distancia de un punto a otro.
    [Tags]    Consulta por Nombre - Mostrar Distancia - T570
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Distancia
    Sleep    1
    Validar distancia activada    mn
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Mostrar Tabular
    [Documentation]    Valida que se muestren correctamente los resultados en el tabular.
    [Tags]    Consulta por Nombre - Mostrar Tabular - T574
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Tabular - Validar etiquetas
    [Documentation]    Valida que se muestren correctamente escritas las etiquetas en el Tabular.
    [Tags]    Consulta por Nombre - Tabular - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    Validar etiquetas en Tabular
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Tabular - Validar informacion en BD
    [Documentation]    Valida la informacion del primer registro del tabular
    ...    contra la informacion en base de datos
    [Tags]    Consulta por Nombre - Tabular - Validar informacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    Sleep    1
    Validar informacion en BD del Tabular
    [Teardown]    Close Browser
    
Reporte de Distancia Recorrida: Consulta por Nombre - Tabular - Posicion Decimal
    [Documentation]    Valida la informacion del primer registro del tabular con la configuracion
    ...    aplicada para los datos de latitud y longitud en decimal contra la informacion
    ...    en base de datos
    [Tags]    Consulta por Nombre - Tabular - Posicion Decimal - T572
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar posicion    ${Decimal}
    Sleep    1
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular (posicion Decimal)
    [Teardown]    Close Browser
    
Reporte de Distancia Recorrida: Consulta por Nombre - Tabular - Velocidad KPH
    [Documentation]    Valida la informacion del primer registro del tabular con la configuracion
    ...    aplicada para el dato de velocidad en KPH contra la informacion
    ...    en base de datos
    [Tags]    Consulta por Nombre - Tabular - Velocidad KPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${KPH}
    Sleep    1
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular    CONVERT(DECIMAL(5,2),(mcp.Velocidad))    KPH
    [Teardown]    Close Browser
    
Reporte de Distancia Recorrida: Consulta por Nombre - Tabular - Velocidad MPH
    [Documentation]    Valida la informacion del primer registro del tabular con la configuracion
    ...    aplicada para el dato de velocidad en MPH contra la informacion
    ...    en base de datos
    [Tags]    Consulta por Nombre - Tabular - Velocidad MPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${MPH}
    Sleep    1
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular    CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.609))    MPH
    [Teardown]    Close Browser
    
Reporte de Distancia Recorrida: Consulta por Nombre - Tabular - Exportar a Excel
    [Documentation]    Valida que se exporte correctamente el archivo Excel.
    [Tags]    Consulta por Nombre - Tabular - Exportar a Excel - T1077
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    Presionar boton Exportar a Excel    form1
    Sleep    5
    Validar archivo de Excel generado    ${DescargaReporte}
    [Teardown]    Close Browser

#Reporte de Distancia Recorrida: Consulta por Nombre - Tabular - Imprimir
    #[Documentation]    Valida que se realice correctamente la impresion del tabular.
    #...    Por actualizar, el caso no finaliza al lanzar la ventana de impresion
    #[Tags]    Consulta por Nombre - Tabular - Imprimir
    #Iniciar sesion
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte de Distancia Recorrida
    #Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    #Seleccionar rango de fechas
    #Sleep    1
    #Presionar boton Consultar
    #Seleccionar opcion Tabular
    #Presionar boton Imprimir
    #Sleep    2
    #Validar ventana de impresion
    #[Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Tabular - Vista Mapa
    [Documentation]    Valida que al seleccionar el boton Vista Mapa desde el Tabular 
    ...    se regrese al Mapa de resultados. 
    [Tags]    Consulta por Nombre - Tabular - Vista Mapa - T1083
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    Presionar boton Regresar    form1
    Sleep    2
    Validar retorno a ventana Vista Mapa
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Configuracion (contextual) - Posicion Decimal
    [Documentation]    Debera mostrar el cambio de la posicion en decimal
    ...    en el contextual de la embarcacion
    [Tags]    Consulta por Nombre - Configuracion (contextual) - Posicion Decimal
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar posicion    ${Decimal}
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual - Posicion Decimal
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Configuracion (contextual) - Velocidad KPH
    [Documentation]    Debera mostrar el cambio de la velocidad en KPH
    ...    en el contextual de la embarcacion
    [Tags]    Consulta por Nombre - Configuracion (contextual) - Velocidad KPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${KPH}
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual    CONVERT(DECIMAL(5,2),(mcp.Velocidad))    KPH
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Configuracion (contextual) - Velocidad MPH
    [Documentation]    Debera mostrar el cambio de la velocidad en MPH
    ...    en el contextual de la embarcacion
    [Tags]    Consulta por Nombre - Configuracion (contextual) - Velocidad MPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${MPH}
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual    CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.609))    MPH
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Configuracion - Distancia Km
    [Documentation]    Debera mostrar el cambio para el calculo de distancia en Km
    [Tags]    Consulta por Nombre - Configuracion - Distancia Km
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Distancia    ${DstKilometros}
    Seleccionar opcion Distancia
    Sleep    1
    Validar distancia activada    km
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Nombre - Configuracion - Distancia Mi
    [Documentation]    Debera mostrar el cambio para el calculo de distancia en Mi
    [Tags]    Consulta por Nombre - Configuracion - Distancia Mi
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Distancia    ${DstMillas}
    Seleccionar opcion Distancia
    Sleep    1
    Validar distancia activada    mi
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por RNP - Validar datos de Embarcacion en BD
    [Documentation]    Valida que los resultados de la consulta por RNP sean correctos contra los de la BD.
    [Tags]    Consulta por RNP - Validar datos de Embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 2, Campo ${Embarcacion}[RNP]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Validar datos de Embarcacion en BD
    [Teardown]    Close Browser

Reporte de Distancia Recorrida: Consulta por Matricula - Validar datos de Embarcacion en BD
    [Documentation]    Valida que los resultados de la consulta por Matricula sean correctos contra los de la BD.
    [Tags]    Consulta por Matricula - Validar datos de Embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Distancia Recorrida
    Filtrar Embarcacion por Columna 3, Campo ${Embarcacion}[Matricula]
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Validar datos de Embarcacion en BD
    [Teardown]    Close Browser

*** Keywords ***
Presionar opcion Reporte de Distancia Recorrida
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/div[3]/div/a[4]
    Click Element    xpath=//*[@id="divPanelControles"]/div[3]/div/a[4]
    Sleep    1
    Switch Window    ${titDistanciaRecorrida}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="cboDevExEmbarques"]/div[1]/div/div[1]/input    timeout=60
    
Validar etiquetas
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/h3    Distancia Recorrida
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[1]/label    Embarcación
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[2]/div[1]/label    Fecha Inicial:
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[2]/div[2]/label    Fecha Final:
    Element Text Should Be    xpath=//*[@id="validate"]/div/span    Consultar
    
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
    Wait Until Element Is Visible    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[3]/div[1]/img    timeout=30
    
Presionar opcion Consultar (obligatorios)
    Click Element    xpath=//*[@id="validate"]/div
    
Validar resultado de la consulta - Etiquetas y tooltips
    ${ttConsulta}=    Get Element Attribute    xpath=//*[@id="btnBack"]    title
    ${ttZonas}=    Get Element Attribute    xpath=//*[@id="btnZonas"]    title
    ${ttNautica}=    Get Element Attribute    xpath=//*[@id="btnNautica"]    title
    ${ttDistancia}=    Get Element Attribute    xpath=//*[@id="btnDistancia"]    title
    ${ttTabular}=    Get Element Attribute    xpath=//*[@id="btnTabular"]    title
    ${ttConfiguracion}=    Get Element Attribute    xpath=//*[@id="btnConfiguracion"]/span    title
    Element Text Should Be    //*[@id="toolBarData"]/div/div[1]/div/h4    Distancia Recorrida
    Element Text Should Be    //*[@id="toolBarData"]/div/div[2]/div[1]    Nombre:
    Element Text Should Be    //*[@id="toolBarData"]/div/div[3]/div[1]    RNP:
    Element Text Should Be    //*[@id="toolBarData"]/div/div[4]/div[1]    Matricula:
    Should be equal    ${ttConsulta}    Nueva Consulta
    Should be equal    ${ttZonas}    Zonas
    Should be equal    ${ttNautica}    Nautica
    Should be equal    ${ttDistancia}    Distancia
    Should be equal    ${ttTabular}    Tabular
    Should be equal    ${ttConfiguracion}    Configuraci\u00F3n
    
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
    ${countmapa}=    Execute JavaScript    return document.querySelector("#map-canvas > div > div > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(3)").childElementCount-1;
    @{countDB}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}'
    Should be equal    ${countDB[0][0]}    ${countmapa}
    @{queryResults}=    Query    select Nombre, RNP, Matricula from Sismep.TSismepVehiculos where Nombre = '${Embarcacion}[Nombre]'
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${RNP}
    Should Be Equal    ${queryResults[0][2]}    ${Matricula}
    Disconnect From Database
    
Validar datos de Embarcacion en BD - Contextual
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Obtener datos de la Embarcacion - Contextual - Default
    Conexion a Base de datos
    @{queryResults}=    Query    select top 1 v.Nombre, v.RNP, v.Matricula, mcp.Latitud, mcp.Longitud, ${Vel}, mcp.Rumbo, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), pti.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' order by mcp.FechaRecepcionUnitrac desc
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
    Obtener datos de la Embarcacion - Contextual - Decimal
    Conexion a Base de datos
    @{queryResults}=    Query    select top 1 v.Nombre, v.RNP, v.Matricula, round(mcp.Latitud, 7), round(mcp.Longitud, 7), CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852)), mcp.Rumbo, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), pti.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' order by mcp.FechaRecepcionUnitrac desc
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} Nudos
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
    
# Desplegar menu contextual de Embarcacion (clic izquierdo)
#     #Click Element    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[3]/div[1]/img
#     Execute JavaScript    document.evaluate('//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[3]/div[1]/img',document.body,null,9,null).singleNodeValue.click();

# Validar etiquetas - Menu contextual (clic izquierdo)
#     Wait Until Element Is Visible    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[1]/td/h2
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[1]/td/h2    ${Embarcacion}[Nombre]
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[2]/td[1]/b    RNP:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[3]/td[1]/b    Matr\u00EDcula:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[4]/td[1]/b    Latitud:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[5]/td[1]/b    Longitud:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[6]/td[1]/b    Velocidad:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[7]/td[1]/b    Rumbo:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[8]/td[1]/b    Ultimo reporte:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[9]/td[1]/b    Puerto base:

# Obtener datos de la Embarcacion - Contextual - Default
#     Wait Until Element Is Visible    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[1]/td/h2
#     ${Nombre}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[1]/td/h2
#     ${RNP}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[2]/td[2]
#     ${Matricula}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[3]/td[2]
#     ${Latitud}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[4]/td[2]
#     ${Longitud}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[5]/td[2]
#     ${Velocidad}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[6]/td[2]
#     ${Rumbo}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[7]/td[2]
#     ${UltimoReporte}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[8]/td[2]
#     ${PuertoBase}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[9]/td[2]
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
#     ${Nombre}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[1]/td/h2
#     ${RNP}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[2]/td[2]
#     ${Matricula}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[3]/td[2]
#     ${Lat}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[4]/td[2]
#     ${Latitud}=    Convert to Number    ${Lat}
#     ${Lon}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[5]/td[2]
#     ${Longitud}=    Convert to Number    ${Lon}
#     ${Velocidad}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[6]/td[2]
#     ${Rumbo}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[7]/td[2]
#     ${UltimoReporte}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[8]/td[2]
#     ${PuertoBase}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[9]/td[2]
#     Set Test Variable    ${Nombre}
#     Set Test Variable    ${RNP}
#     Set Test Variable    ${Matricula}
#     Set Test Variable    ${Latitud}
#     Set Test Variable    ${Longitud}
#     Set Test Variable    ${Velocidad}
#     Set Test Variable    ${Rumbo}
#     Set Test Variable    ${UltimoReporte}
#     Set Test Variable    ${PuertoBase}
    
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
#     ${div}=    Execute JavaScript    return document.querySelector("#map-canvas > div > div > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(3)").childElementCount-1;
#     ${atrDistancia}=    Get Element Attribute    xpath=//*[@id="btnDistancia"]    value
#     Should be equal    ${atrDistancia}    true
#     Execute JavaScript    document.evaluate('//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[3]/div[${div}]/img',document.body,null,9,null).singleNodeValue.click();
#     Wait Until Element Is Visible    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div/div/div/div/div/h3
#     ${etq}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div/div/div/div/div/h3
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
    ${ttExcel}=    Get Element Attribute    xpath=//*[@id="form1"]/div[2]/button    title
    ${ttImprimir}=    Get Element Attribute    xpath=//*[@id="form1"]/div[3]/button    title
    ${ttMapa}=    Get Element Attribute    xpath=//*[@id="form1"]/div[4]/button    title
    Should be equal    ${ttExcel}    Exportar a Excel
    Should be equal    ${ttImprimir}    Imprimir
    Should be equal    ${ttMapa}    Vista Mapa
    ${Embarcacion}=    Catenate    Embarcacion: ${Nombre} ${SPACE}RNP:${RNP} ${SPACE}Matricula:${Matricula}
    ${RazonSocial}=    Catenate    Razon Social: ${RazonSocial}
    ${Rango}=    Catenate    Rango del Reporte: ${fechaini} al ${fechafin}
    ${UserImp}=    Get Text    xpath=//*[@id="VesselInfo"]/p[4]
    ${UsuarioImp}=    Execute Javascript    cadena='${UserImp}'; return cadena.slice(0,-3);
    Element Text Should Be    //*[@id="headerRigth"]/h2/span    conapesca.gob.mx
    Element Text Should Be    //*[@id="banner"]/h3/span    Sistema de Localizaci\u00F3n y Monitoreo de Embarcaciones Pesqueras
    Element Text Should Be    //*[@id="VesselInfo"]/p[1]    ${Embarcacion}
    Element Text Should Be    //*[@id="VesselInfo"]/p[2]    ${RazonSocial}
    Element Text Should Be    //*[@id="VesselInfo"]/p[3]    ${Rango}
    Should be equal    ${UsuarioImp}    Usuario: ${Usuario} Impreso el ${date24h}
    Element Text Should Be    //*[@id="main"]/div[2]/h3/span    Reporte de Distancia Recorrida por Embarcación
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[1]    Orden
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[2]    Fecha
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[3]    Latitud
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[4]    Longitud
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[5]    Rumbo
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[6]    Velocidad
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[7]    Distancia
    Element Text Should Be    //*[@id="pBottom"]/span    Comisi\u00F3n Nacional de Acuacultura y Pesca, M\u00E9xico - Algunos derechos reservados \u00A9 2014
    Element Text Should Be    //*[@id="pTop"]/span    Av. Camar\u00F3n S\u00E1balo S/N Esq. Tibur\u00F3n, Fracc. S\u00E1balo Country Club, C.P. 82100 Mazatl\u00E1n, Sin. Mex. Tel. 01-800-6674-022
    
Validar informacion en BD del Tabular
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Conexion a Base de Datos
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table > tbody").rows.length -1;
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on mcp.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}'
    Should be equal    ${queryRows[0][0]}    ${rows}
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[2]
    ${Latitud}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[3]
    ${Longitud}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[4]
    ${Rumbo}=     Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[6]
    @{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), mcp.Latitud, mcp.Longitud, mcp.Rumbo, ${Vel} from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on mcp.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' order by mcp.FechaRecepcionUnitrac desc
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
    Disconnect From Database
    
Validar informacion en BD del Tabular (posicion Decimal)
    Conexion a Base de Datos
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table > tbody").rows.length -1;
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on mcp.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}'
    Should be equal    ${queryRows[0][0]}    ${rows}
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[2]
    ${Lat}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[3]
    ${Latitud}=    Convert to Number    ${Lat}
    ${Lon}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[4]
    ${Longitud}=    Convert to Number    ${Lon}
    ${Rumbo}=     Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[6]
    @{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), round(mcp.Latitud, 7), round(mcp.Longitud, 7), mcp.Rumbo, CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852)) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on mcp.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' order by mcp.FechaRecepcionUnitrac desc
    ${FechaBD}=    Execute Javascript    cadena='${queryResults[0][1]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3;
    ${RumboBD}=    Catenate    ${queryResults[0][4]}\u00B0
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} Nudos
    Should be equal    ${FechaBD}    ${Fecha}
    Should be equal    ${queryResults[0][2]}    ${Latitud}
    Should be equal    ${queryResults[0][3]}    ${Longitud}
    Should be equal    ${RumboBD}    ${Rumbo}
    Should be equal    ${VelocidadBD}    ${Velocidad}
    Disconnect From Database
    
# Presionar el boton Exportar a Excel
#     Wait Until Element Is Visible    xpath=//*[@id="form1"]/div[2]/button
#     Click Element    xpath=//*[@id="form1"]/div[2]/button

# Validar archivo Excel generado
#     File Should Exist   ${DescargaReporte}

# Presionar boton Imprimir
#     Wait Until Element Is Visible    xpath=//*[@id="form1"]/div[3]/button
#     Click Element    xpath=//*[@id="form1"]/div[3]/button

# Validar ventana de impresion
#     Wait Until Element Is Visible    xpath=//*[@id="sidebar"]//print-preview-button-strip//div/cr-button[1]
#     Element Should Be Visible    xpath=//*[@id="plugin"]

# Seleccionar opcion Vista Mapa
#     Wait Until Element Is Visible    xpath=//*[@id="form1"]/div[4]/button
#     Click Element    xpath=//*[@id="form1"]/div[4]/button
    
# Validar retorno a ventana Vista Mapa
#     Unselect Frame
#     Element Should Be Visible    xpath=//*[@id="toolBar"]
    
# Validar mensaje
#     [Arguments]    ${arg1}
#     Wait Until Element Is Visible    xpath=/html/body/div[7]/div/div
#     Element Text Should Be    xpath=/html/body/div[7]/div/div/div[2]    ${arg1}