*** Settings ***
Resource    Recursos.Reportes.robot

*** Variables ***
&{Embarcacion}    Nombre=PUERTO SAN CARLOS    RNP=00046557    Matricula=25033692232
&{EmbarcacionSD}    Nombre=BALAM II    RNP=00021147    Matricula=2602051123-7
${titReporteRuta}    title=Sismep - Reporte de Ruta
${fechaini}    14/10/2022 00:00:00
${fechafin}    14/10/2022 23:59:59
${fechainiUTC}    20221014 07:00:00
${fechafinUTC}    20221015 07:00:00
${DescargaReporte}    C:/Users/mmorales/Downloads/ReporteRuta.xlsx

*** Test Cases ***
Reporte de Ruta: Validar etiquetas
    [Documentation]    Valida que se muestren correctamente escritas las etiquetas.
    [Tags]    Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser

Reporte de Ruta: Filtro Embarcacion Obligatorio
    [Documentation]    Al no seleccionar una embarcacion debera de mostrar una validacion.
    [Tags]    Filtro Embarcacion Obligatorio - T1065
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    6    Favor de seleccionar Embarcaci\u00F3n
    [Teardown]    Close Browser

Reporte de Ruta: Validacion rango de fechas
    [Documentation]    Valida que la fecha inicial no sea mayor que la fecha final.
    [Tags]    Validacion rango de fechas - T1066
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas    ${fechafin}    ${fechaini}
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    6    Fecha Inicial debe ser menor a la Fecha Final.
    [Teardown]    Close Browser
    
Reporte de Ruta: Validacion Fecha Inicial y Final en blanco
    [Documentation]    Al dejar los campos de fecha inicial y fecha final en blanco debera de mostrar una validacion.
    [Tags]    Validacion Fecha Inicial y Final en blanco
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas    ${EMPTY}    ${EMPTY}
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    6    Favor de completar los campos Fecha Inicial y Fecha Final.
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta sin resultados - Validar mensaje
    [Documentation]    Al realizar una consulta y esta no contenga resultados debera de mostrar una validacion indicando lo anterior.
    [Tags]    Consulta sin resultados - Validar mensaje - T1064
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionSD}[Nombre]
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    6    No se encontraron resultados.
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre
    [Documentation]    Valida que se haga correctamentemente la busqueda por Nombre de una embarcacion.
    [Tags]    Consulta por Nombre - T1068
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Validar etiquetas y tooltips
    [Documentation]    Valida que las etiquetas se muestren correctamente escritas.
    [Tags]    Consulta por Nombre - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Validar resultado de la consulta - Etiquetas y tooltips
    [Teardown]    Close Browser

Reporte de Ruta: Consulta por Nombre - Validar datos de Embarcacion en BD
    [Documentation]    Valida que los resultados mostrados sean correctos y correspondan a los almacenados en la Base de datos.
    [Tags]    Consulta por Nombre - Validar datos de Embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    1
    Validar datos de Embarcacion en BD
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Menu contextual izquierdo - Validar etiquetas
    [Documentation]    Valida que se encuentren correctamente escritas las etiquetas mostradas en el Menu contextual.
    [Tags]    Consulta por Nombre - Menu contextual izquierdo - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar etiquetas - Menu contextual (clic izquierdo)   ${Embarcacion}[Nombre]
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Menu contextual izquierdo - Validar datos de embarcacion en BD
    [Documentation]    Valida que la informacion mostrada en el Menu contextual sea correcta y coincida con la almacenada en la Base de datos.
    [Tags]    Consulta por Nombre - Menu contextual izquierdo - Validar datos de embarcacion en BD - T470
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Nueva Consulta
    [Documentation]    Valida que permite realizar una Nueva Consulta.
    [Tags]    Consulta por Nombre - Nueva Consulta - T479
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    1
    Seleccionar opcion Nueva Consulta
    Validar retorno a ventana de Consulta
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Mostrar Zonas
    [Documentation]    Valida que al activar la opción Zonas se muestren en el mapa.
    [Tags]    Consulta por Nombre - Mostrar Zonas - T471
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    1
    Seleccionar opcion Zonas
    Sleep    5
    Validar zonas activadas
    [Teardown]    Close Browser
    
#Reporte de Ruta: Consulta por Nombre - Mostrar Nautica
    #[Documentation]    Valida que al activar la opcion Nautica se muestre en el mapa la capa nautica.
    #[Tags]    Consulta por Nombre - Mostrar Nautica - T473
    #Iniciar sesion
    #Sleep    1
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte de Ruta
    #Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    #Sleep    1
    #Seleccionar rango de fechas
    #Sleep    1
    #Presionar boton Consultar
    #Sleep    1
    #Seleccionar opcion Nautica
    #Sleep    5
    #Validar nautica activada
    #[Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Mostrar Distancia
    [Documentation]    Valida que al activar la opcion Distancia se muestre los iconos para poder calcular la distancia.
    [Tags]    Consulta por Nombre - Mostrar Distancia - T475
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Distancia
    Sleep    1
    Validar distancia activada    mn
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Mostrar Tabular
    [Documentation]    Valida que se muestre correctamente la informacion tabulada.
    [Tags]    Consulta por Nombre - Mostrar Tabular - T477
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Tabular - Validar etiquetas
    [Documentation]    Valida que se muestre correctamente escritas las etiquetas del tabular.
    [Tags]    Consulta por Nombre - Tabular - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    Validar etiquetas en Tabular
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Tabular - Validar informacion en BD
    [Documentation]    Valida que la informacion mostrada en el tabular coincida con la informacion almacenada en la Base de datos.
    [Tags]    Consulta por Nombre - Tabular - Validar informacion en BD - T1061
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    Sleep    1
    Validar informacion en BD del Tabular
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Tabular - Posicion Decimal
    [Documentation]    Valida que al cambiar la configuracion de Posicion a Decimal se muestre correctamente en el tabular.
    [Tags]    Consulta por Nombre - Tabular - Posicion Decimal - T478
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar posicion    ${Decimal}
    Sleep    1
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular (posicion Decimal)
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Tabular - Velocidad KPH
    [Documentation]    VValida que al cambiar la configuracion de Velocidad a KPH se muestre correctamente en el tabular.
    [Tags]    Consulta por Nombre - Tabular - Velocidad KPH - T478
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${KPH}
    Sleep    1
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular    CONVERT(DECIMAL(5,2),(mcp.Velocidad))    KPH
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Tabular - Velocidad MPH
    [Documentation]    Valida que al cambiar la configuracion de Velocidad a MPH se muestre correctamente en el tabular.
    [Tags]    Consulta por Nombre - Tabular - Velocidad MPH - T478
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${MPH}
    Sleep    1
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular    CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.609))    MPH
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Tabular - Exportar a Excel
    [Documentation]    Valida que se exporte correctamente la informacion en formato Excel.
    [Tags]    Consulta por Nombre - Tabular - Exportar a Excel - T482
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    Presionar boton Exportar a Excel
    Sleep    5
    Validar archivo de Excel generado    ${DescargaReporte}
    [Teardown]    Close Browser
    
#Reporte de Ruta: Consulta por Nombre - Tabular - Imprimir
    #[Documentation]    Valida que se imprima correctamente la informacion en formato Excel. 
	#...    Por actualizar, el caso no finaliza al lanzar la ventana de impresion
    #[Tags]    Consulta por Nombre - Tabular - Imprimir - T1062
    #Iniciar sesion
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte de Ruta
    #Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    #Sleep    1
    #Seleccionar rango de fechas
    #Sleep    1
    #Presionar boton Consultar
    #Seleccionar opcion Tabular
    #Presionar boton Imprimir
    #Sleep    2
    #Validar ventana de impresion
    #[Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Tabular - Vista Mapa
    [Documentation]    Valida que al oprimir el boton Vista Mapa desde el tabular te retorne a la vista del mapa de resultados.
    [Tags]    Consulta por Nombre - Tabular - Vista Mapa - T1063
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Seleccionar opcion Tabular
    Presionar boton Regresar
    Sleep    2
    Validar retorno a ventana Vista Mapa
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Incluir posiciones manuales
    [Documentation]    Al realizar una consulta con el check activado de posiciones manuales debera de incluirlas en el resultado.
	...    Por actualizar, pendiente validacion de posiciones manuales en el resultado
    [Tags]    Consulta por Nombre - Incluir posiciones manuales - T468
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar Incluir posiciones manuales
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    [Teardown]    Close Browser

Reporte de Ruta: Consulta por Nombre - Configuracion (contextual) - Posicion Decimal
    [Documentation]    Debera mostrar el cambio de la posicion en decimal
    ...    en el contextual de la embarcacion
    [Tags]    Consulta por Nombre - Configuracion (contextual) - Posicion Decimal
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar posicion    ${Decimal}
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual - Posicion Decimal
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Configuracion (contextual) - Velocidad KPH
    [Documentation]    Debera mostrar el cambio de la velocidad en KPH
    ...    en el contextual de la embarcacion
    [Tags]    Consulta por Nombre - Configuracion (contextual) - Velocidad KPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${KPH}
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual    CONVERT(DECIMAL(5,2),(mcp.Velocidad))    KPH
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Configuracion (contextual) - Velocidad MPH
    [Documentation]    Debera mostrar el cambio de la velocidad en MPH
    ...    en el contextual de la embarcacion
    [Tags]    Consulta por Nombre - Configuracion (contextual) - Velocidad MPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${MPH}
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual    CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.609))    MPH
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Configuracion - Distancia Km
    [Documentation]    Debera mostrar el cambio para el calculo de distancia en Km
    [Tags]    Consulta por Nombre - Configuracion - Distancia Km
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Distancia    ${DstKilometros}
    Seleccionar opcion Distancia
    Sleep    1
    Validar distancia activada    km
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por Nombre - Configuracion - Distancia Mi
    [Documentation]    Debera mostrar el cambio para el calculo de distancia en Mi
    [Tags]    Consulta por Nombre - Configuracion - Distancia Mi
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Configurar Distancia    ${DstMillas}
    Seleccionar opcion Distancia
    Sleep    1
    Validar distancia activada    mi
    [Teardown]    Close Browser
    
Reporte de Ruta: Consulta por RNP - Validar datos de Embarcacion en BD
    [Documentation]    Valida que haga correctamente la consulta por RNP y los datos mostrados coincidan con los almacenados en la Base de datos.
    [Tags]    Consulta por RNP - Validar datos de Embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 2, Campo ${Embarcacion}[RNP]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    1
    Validar datos de Embarcacion en BD
    [Teardown]    Close Browser

Reporte de Ruta: Consulta por RNP - Incluir posiciones manuales
    [Documentation]    Valida que al realizar la consulta por RNP y active el check de posiciones manuales se realice correctamente.
	...    Por actualizar, pendiente validacion de posiciones manuales en el resultado
    [Tags]    Consulta por RNP - Incluir posiciones manuales
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 2, Campo ${Embarcacion}[RNP]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar Incluir posiciones manuales
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    [Teardown]    Close Browser

Reporte de Ruta: Consulta por Matricula - Validar datos de Embarcacion en BD
    [Documentation]    Valida que haga correctamente la consulta por Matricula y los datos mostrados coincidan con los almacenados en la Base de datos.
    [Tags]    Consulta por Matricula - Validar datos de Embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 3, Campo ${Embarcacion}[Matricula]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar boton Consultar
    Sleep    1
    Validar datos de Embarcacion en BD
    [Teardown]    Close Browser

Reporte de Ruta: Consulta por Matricula - Incluir posiciones manuales
    [Documentation]    Valida que al realizar la consulta por Matricula y active el check de posiciones manuales se realice correctamente.
	...		Por actualizar, pendiente validacion de posiciones manuales en el resultado
    [Tags]    Consulta por Matricula - Incluir posiciones manuales
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Ruta
    Filtrar Embarcacion por Columna 3, Campo ${Embarcacion}[Matricula]
    Sleep    1
    Seleccionar rango de fechas
    Sleep    1
    Presionar Incluir posiciones manuales
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    [Teardown]    Close Browser
    
*** Keywords ***
Presionar opcion Reporte de Ruta
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/div[3]/div/a[1]
    Click Element    xpath=//*[@id="divPanelControles"]/div[3]/div/a[1]
    Sleep    1
    Switch Window    ${titReporteRuta}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="dropDownBoxContainer"]/div[1]/div/div[1]/input    timeout=60
    
Validar etiquetas
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/h3    Reporte de Ruta:
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[1]/label    Incluir posiciones manuales:
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[2]/label    Embarcación
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[3]/div[1]/label    Fecha Inicial:
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[3]/div[2]/label    Fecha Final:
    Element Text Should Be    xpath=//*[@id="validate"]/div/span    Consultar

Presionar Incluir posiciones manuales
    Wait Until Element Is Visible    xpath=//*[@id="checkBoxContainer"]/div/span
    Click Element    xpath=//*[@id="checkBoxContainer"]/div/span
    
Filtrar Embarcacion por Columna ${COL}, Campo ${CAMPO}
    Click Element    xpath=//*[@id="dropDownBoxContainer"]/div[1]/div/div[1]/input
    Sleep    1
    Input Text    xpath=//*[@id="dropDownBoxContainer_template"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    Sleep    1
    Click Element    xpath=//*[@id="dropDownBoxContainer_template"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[${COL}]
    
Seleccionar rango de fechas
    [Arguments]    ${inicial}=${fechaini}    ${final}=${fechafin}
    Input Text    xpath=//*[@id="date-time-inicial"]/div[1]/div/div[1]/input    ${inicial}
    Input Text    xpath=//*[@id="date-time-final"]/div[1]/div/div[1]/input    ${final}
    
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
    Element Text Should Be    //*[@id="toolBarData"]/div/div[1]/div/h4    Reporte de Ruta
    Element Text Should Be    //*[@id="toolBarData"]/div/div[2]/div[1]    Nombre:
    Element Text Should Be    //*[@id="toolBarData"]/div/div[3]/div[1]    RNP:
    Element Text Should Be    //*[@id="toolBarData"]/div/div[4]/div[1]    Matricula:
    Should be equal    ${ttConsulta}    Nueva Consulta
    Should be equal    ${ttZonas}    Zonas
    Should be equal    ${ttNautica}    Nautica
    Should be equal    ${ttDistancia}    Distancia
    Should be equal    ${ttTabular}    Tabular
    Should be equal    ${ttConfiguracion}    Configuraci\u00F3n

# Obtener datos de la Embarcacion
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
    Obtener datos de la Embarcacion - Contextual - Decimal
    Conexion a Base de datos
    @{queryResults}=    Query    select top 1 v.Nombre, v.RNP, v.Matricula, round(mcp.Latitud, 7), round(mcp.Longitud, 7), CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852)), mcp.Rumbo, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), pti.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' order by mcp.FechaRecepcionUnitrac
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
#     Execute JavaScript    document.evaluate('//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[3]/div[1]/img',document.body,null,9,null).singleNodeValue.click();
    
# Validar etiquetas - Menu contextual (clic izquierdo)
#     Wait Until Element Is Visible    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2    ${Embarcacion}[Nombre]
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[2]/td[1]/b    RNP:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[3]/td[1]/b    Matr\u00EDcula:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[4]/td[1]/b    Latitud:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[5]/td[1]/b    Longitud:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[6]/td[1]/b    Velocidad:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[7]/td[1]/b    Rumbo:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[8]/td[1]/b    Ultimo reporte:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[9]/td[1]/b    Puerto base:
    
# Obtener datos de la Embarcacion - Contextual - Default
#     ${Nombre}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2
#     ${RNP}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[2]/td[2]
#     ${Matricula}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[3]/td[2]
#     ${Latitud}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[4]/td[2]
#     ${Longitud}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[5]/td[2]
#     ${Velocidad}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[6]/td[2]
#     ${Rumbo}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[7]/td[2]
#     ${UltimoReporte}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[8]/td[2]
#     ${PuertoBase}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[9]/td[2]
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
#     ${Nombre}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2
#     ${RNP}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[2]/td[2]
#     ${Matricula}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[3]/td[2]
#     ${Lat}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[4]/td[2]
#     ${Latitud}=    Convert to Number    ${Lat}
#     ${Lon}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[5]/td[2]
#     ${Longitud}=    Convert to Number    ${Lon}
#     ${Velocidad}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[6]/td[2]
#     ${Rumbo}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[7]/td[2]
#     ${UltimoReporte}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[8]/td[2]
#     ${PuertoBase}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[9]/td[2]
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
#     Wait Until Element Is Visible    xpath=//*[@id="validate"]/div/span
#     Element Should Be Visible    xpath=//*[@id="validate"]/div/span
    
# Seleccionar opcion Zonas
#     Click Element    //*[@id="btnZonas"]
    
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
#     Wait Until Element Is Visible    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[1]/div[2]/div[2]/span
#     ${etq}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[1]/div[2]/div[2]/span
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
    Element Text Should Be    //*[@id="headerRigth"]/h2/span    conapesca.gob.mx
    Element Text Should Be    //*[@id="banner"]/h3/span    Sistema de Localizaci\u00F3n y Monitoreo de Embarcaciones Pesqueras
    Element Text Should Be    //*[@id="VesselInfo"]/p[1]    ${Embarcacion}
    Element Text Should Be    //*[@id="VesselInfo"]/p[2]    ${RazonSocial}
    Element Text Should Be    //*[@id="VesselInfo"]/p[3]    ${Rango}
    Should be equal    ${UsuarioImp}    Usuario: ${Usuario} Impreso el ${date24h}
    Element Text Should Be    //*[@id="main"]/div[2]/h3/span    Reporte de Ruta
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[1]    Orden
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[2]    Fecha
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[3]    Latitud
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[4]    Longitud
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[5]    Rumbo
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[6]    Velocidad
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[7]    Referencia
    Element Text Should Be    //*[@id="divtable"]/table/tbody/tr[1]/td[8]    Origen
    Element Text Should Be    //*[@id="pBottom"]/span    Comisi\u00F3n Nacional de Acuacultura y Pesca, M\u00E9xico - Algunos derechos reservados \u00A9 2014
    Element Text Should Be    //*[@id="pTop"]/span    Av. Camar\u00F3n S\u00E1balo S/N Esq. Tibur\u00F3n, Fracc. S\u00E1balo Country Club, C.P. 82100 Mazatl\u00E1n, Sin. Mex. Tel. 01-800-6674-022
    
Validar informacion en BD del Tabular
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Conexion a Base de Datos
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table > tbody").rows.length -1;
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on mcp.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]' and FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}'
    Should be equal    ${queryRows[0][0]}    ${rows}
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[2]
    ${Latitud}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[3]
    ${Longitud}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[4]
    ${Rumbo}=     Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[6]
    ${Referencia}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[7]
    ${Origen}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[8]
    @{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), mcp.Latitud, mcp.Longitud, mcp.Rumbo, ${Vel}, round((mcp.DistanciaPuntoInteres / 1.852),1), pti.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on mcp.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]' and FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' order by FechaRecepcionUnitrac
    ${FechaBD}=    Execute Javascript    cadena='${queryResults[0][1]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3;
    ${LatitudBD}=    Execute Javascript    ${JSLatitudDMS} return LatitudDMS(${queryResults[0][2]});
    ${LongitudBD}=    Execute Javascript    ${JSLongitudDMS} return LongitudDMS(${queryResults[0][3]});
    ${RumboBD}=    Catenate    ${queryResults[0][4]}\u00B0
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} ${etqVel}
    ${RefereciaBD}=    Catenate    a ${queryResults[0][6]} Mn de ${queryResults[0][7]}
    Should be equal    ${FechaBD}    ${Fecha}
    Should be equal    ${LatitudBD}    ${Latitud}
    Should be equal    ${LongitudBD}    ${Longitud}
    Should be equal    ${RumboBD}    ${Rumbo}
    Should be equal    ${VelocidadBD}    ${Velocidad}
    Should be equal    ${RefereciaBD}    ${Referencia}
    Disconnect From Database
    
Validar informacion en BD del Tabular (posicion Decimal)
    Conexion a Base de Datos
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table > tbody").rows.length -1;
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on mcp.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]' and FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}'
    Should be equal    ${queryRows[0][0]}    ${rows}
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[2]
    ${Lat}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[3]
    ${Latitud}=    Convert to Number    ${Lat}
    ${Lon}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[4]
    ${Longitud}=    Convert to Number    ${Lon}
    ${Rumbo}=     Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[6]
    ${Referencia}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[7]
    ${Origen}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[8]
    #@{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), round(mcp.Latitud, 7), round(mcp.Longitud, 7), mcp.Rumbo, round((mcp.Velocidad / 1.852),2), round((mcp.DistanciaPuntoInteres / 1.852),1), pti.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on mcp.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]' and FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' order by FechaRecepcionUnitrac
    @{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), round(mcp.Latitud, 7), round(mcp.Longitud, 7), mcp.Rumbo, CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852)), round((mcp.DistanciaPuntoInteres / 1.852),1), pti.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on mcp.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]' and FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' order by FechaRecepcionUnitrac
    ${FechaBD}=    Execute Javascript    cadena='${queryResults[0][1]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3;
    ${RumboBD}=    Catenate    ${queryResults[0][4]}\u00B0
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} Nudos
    ${RefereciaBD}=    Catenate    a ${queryResults[0][6]} Mn de ${queryResults[0][7]}
    Should be equal    ${FechaBD}    ${Fecha}
    Should be equal    ${queryResults[0][2]}    ${Latitud}
    Should be equal    ${queryResults[0][3]}    ${Longitud}
    Should be equal    ${RumboBD}    ${Rumbo}
    Should be equal    ${VelocidadBD}    ${Velocidad}
    Should be equal    ${RefereciaBD}    ${Referencia}
    Disconnect From Database
    
# Presionar boton Exportar a Excel
#     Wait Until Element Is Visible    xpath=//*[@id="menu"]/div[2]/button
#     Click Element    xpath=//*[@id="menu"]/div[2]/button
    
# Validar archivo de Excel generado
#     File Should Exist   ${DescargaReporte}
    
# Presionar boton Imprimir
#     Wait Until Element Is Visible    xpath=//*[@id="menu"]/div[3]/button
#     Click Element    xpath=//*[@id="menu"]/div[3]/button
    
# Validar ventana de impresion
#     Wait Until Element Is Visible    xpath=//*[@id="sidebar"]//print-preview-button-strip//div/cr-button[1]
#     Element Should Be Visible    xpath=//*[@id="plugin"]
    
# Seleccionar opcion Vista Mapa
#     Wait Until Element Is Visible    xpath=//*[@id="menu"]/div[4]/button
#     Click Element    xpath=//*[@id="menu"]/div[4]/button
    
# Validar retorno a ventana Vista Mapa
#     Unselect Frame
#     Element Should Be Visible    xpath=//*[@id="toolBarData"]/div/div[1]/div/h4
    
# Validar mensaje
#     [Arguments]    ${arg1}
#     Wait Until Element Is Visible    xpath=/html/body/div[6]/div/div
#     Element Text Should Be    xpath=/html/body/div[6]/div/div/div[2]    ${arg1}