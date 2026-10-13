*** Settings ***
Resource    Recursos.Reportes.robot

*** Variables ***
&{EmbarcacionG}    Nombre=JAIME I    RNP=00009845    Matricula=2804291023-2
&{EmbarcacionP}    Nombre=NAVEGANTE    RNP=00034116    Matricula=25030237235
${titReporteArea}    title=Sismep - Reporte de \u00C1rea
${fechaini}    14/10/2022 00:00:00
${fechafin}    14/10/2022 23:59:59
${fechainiUTC}    20221014 07:00:00
${fechafinUTC}    20221015 07:00:00
${DescargaReporte}    C:/Users/mmorales/Downloads/ReporteZonas.xlsx
${Golfo}    xpath=//*[@id="rdoGpoDevExTipoBusqueda"]/div/div[1]/div/div
${Pacifico}    xpath=//*[@id="rdoGpoDevExTipoBusqueda"]/div/div[2]/div/div
${Embarcacion}    xpath=//*[@id="rdoGpoDevExTipoBusqueda"]/div/div[3]/div/div
${Barco}    xpath=/html/body/div[9]/div/div/div/div[1]/div/div[1]/div[2]/div[1]/div
${Panga}    xpath=/html/body/div[9]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div
${Fomento}    xpath=/html/body/div[9]/div/div/div/div[1]/div/div[1]/div[2]/div[16]/div
${CamaronAltamar}    xpath=/html/body/div[9]/div/div/div/div[1]/div/div[1]/div[2]/div[25]/div
${ZonaG}    21.102850016193955|-97.77459534175334,22.246295434078043|-95.44549377925334,20.32186223241097|-94.08318909175334,19.080706166263663|-96.63201721675334
${ZonaP}    27.81760628000713|-115.53534033125,27.81760628000713|-110.39373876875,22.733531079609847|-110.26190283125,22.774056363035577|-115.53534033125
${SQLGolfo}    POLYGON ((-97.77459534175334 21.102850016193955, -95.44549377925334 22.246295434078043, -94.08318909175334 20.32186223241097, -96.63201721675334 19.080706166263663, -97.77459534175334 21.102850016193955))
${SQLPacifico}    POLYGON ((-115.53534033125 27.81760628000713,-110.39373876875 27.81760628000713,-110.26190283125 22.733531079609847,-115.53534033125 22.774056363035577,-115.53534033125 27.81760628000713))

*** Test Cases ***
Reporte de Area: Validar etiquetas
    [Documentation]    Valida que se muestren correctamente escritas las etiquetas.
    [Tags]    Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Sleep    1
    Presionar opcion Reporte de Area
    Sleep    2
    Validar etiquetas
    [Teardown]    Close Browser

Reporte de Area: Validacion rango de fechas
    [Documentation]    Valida que la fecha inicial sea menor que la fecha final.
    [Tags]    Validacion rango de fechas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas    ${fechafin}    ${fechaini}
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    9    Fecha Inicial debe ser menor a la Fecha Final.
    [Teardown]    Close Browser

Reporte de Area: Validacion Fecha Inicial y Fecha Final en blanco
    [Documentation]    Valida que al dejar el campo vacio de fecha inicio y fecha fin se muestre una validacion.
    [Tags]    Validacion Fecha Inicial y Fecha Final en blanco
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas    ${EMPTY}    ${EMPTY}
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    9    Favor de completar los campos Fecha Inicial y Fecha Final.
    [Teardown]    Close Browser

Reporte de Area: Consulta sin resultados - Validar mensaje
    [Documentation]    Cuando se realiza una consulta sin informacion debe de mostrarse una validacion.
    [Tags]    Consulta sin resultados - Validar mensaje
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Sleep    1
    Seleccionar Permiso    ${Fomento}
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    9    No se encontraron resultados.
    [Teardown]    Close Browser

Reporte de Area: Filtro Embarcacion - Obligatorio
    [Documentation]    Al dejar vacio el campo embarcacion debera de mostrar una validacion.
    [Tags]    Filtro Embarcacion - Obligatorio -T492
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar tipo de busqueda: ${Embarcacion}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    9    Favor de seleccionar Embarcación
    [Teardown]    Close Browser
    
Reporte de Area: Consulta por litoral Golfo
    [Documentation]    Valida que se muestre la pantalla con los resultados de la consulta
    [Tags]    Consulta por litoral Golfo - T503
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    [Teardown]    Close Browser

Reporte de Area: Consulta por litoral Golfo - Validar etiquetas y tooltips
    [Documentation]    Valida etiquetas de la pantalla con los resultados de la consulta
    [Tags]    Consulta por litoral Golfo - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Validar resultado de la consulta - Validar etiquetas y tooltips
    [Teardown]    Close Browser

Reporte de Area: Consulta por litoral Golfo - Seleccionar Embarcacion
    [Documentation]    Valida seleccion de embarcacion en el resultado de la consulta
    [Tags]    Consulta por litoral Golfo - Seleccionar Embarcacion 
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    [Teardown]    Close Browser
    
Reporte de Area: Consulta por litoral Golfo - Seleccionar Embarcacion - Validar etiquetas
    [Documentation]    Valida las etiquetas al seleccionar una embarcacion en el resultado de la consulta
    [Tags]    Consulta por litoral Golfo - Seleccionar Embarcacion - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    Validar etiquetas - Seleccionar embarcacion
    [Teardown]    Close Browser
    
Reporte de Area: Consulta por litoral Golfo - Seleccionar Embarcacion - Validar datos de Embarcacion en BD
    [Documentation]    Valida los datos de la embarcacion seleccionada contra la Base de datos
    [Tags]    Consulta por litoral Golfo - Seleccionar Embarcacion - Validar datos de Embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    Validar datos de Embarcacion en BD
    [Teardown]    Close Browser
    
Reporte de Area: Consulta por litoral Golfo - Seleccionar Embarcacion - Menu contextual izquierdo - Validar etiquetas
    [Documentation]    Valida las etiquetas del menu contextual para la embarcacion seleccionada
    [Tags]    Consulta por litoral Golfo - Seleccionar Embarcacion - Menu contextual izquierdo - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar etiquetas - Menu contextual (clic izquierdo)    ${EmbarcacionG}[Nombre]
    [Teardown]    Close Browser
    
Reporte de Area: Consulta por litoral Golfo - Seleccionar Embarcacion - Menu contextual izquierdo - Validar datos de embarcacion en BD
    [Documentation]    Valida las etiquetas del menu contextual para la embarcacion seleccionada
    [Tags]    Consulta por litoral Golfo - Seleccionar Embarcacion - Menu contextual izquierdo - Validar datos de embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual
    [Teardown]    Close Browser
    
Reporte de Area: Consulta por litoral Golfo - Nueva Consulta
    [Documentation]    Debera de permitir realizar correctamente una Nueva Consulta.
    [Tags]    Consulta por litoral Golfo - Nueva Consulta - T519
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar opcion Nueva Consulta
    Sleep    2
    Validar retorno a ventana de Consulta
    [Teardown]    Close Browser

Reporte de Area: Consulta por litoral Golfo - Mostrar Zonas
    [Documentation]    Al activar la opcion de Zonas debera de pintar las zonas en el mapa.
    [Tags]    Consulta por litoral Golfo - Mostrar Zonas - T512
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar opcion Zonas
    Sleep    5
    Validar zonas activadas
    [Teardown]    Close Browser

#Reporte de Area: Consulta por litoral Golfo - Mostrar Nautica
    #[Documentation]    Al activar la opcion Nautica debera de pintar la capa nautica en el mapa.
	#...		Pendiente documentar
    #[Tags]    Consulta por litoral Golfo - Mostrar Nautica - T514
    #Iniciar sesion
    #Sleep    1
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte de Area
    #Sleep    1
    #Seleccionar Tipo de busqueda: ${Golfo}
    #Seleccionar Tipo de Vehiculo    ${Barco}
    #Seleccionar rango de fechas
    #Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    #Sleep    1
    #Presionar boton Consultar
    #Sleep    2
    #Seleccionar opcion Nautica
    #Sleep    5
    #Validar nautica activada
    #[Teardown]    Close Browser

Reporte de Area: Consulta por litoral Golfo - Mostrar Distancia
    [Documentation]    Al activar la distancia debera de mostrarse correctamente los iconos para calcular la distancia.
    [Tags]    Consulta por litoral Golfo - Mostrar Distancia - T516
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar opcion Distancia
    Sleep    2
    Validar distancia activada    mn
    [Teardown]    Close Browser

Reporte de Area: Consulta por litoral Golfo - Mostrar Tabular
    [Documentation]    Debera de mostrar los resultados tabulados.
    [Tags]    Consulta por litoral Golfo - Mostrar Tabular - T520
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar opcion Tabular
    [Teardown]    Close Browser

Reporte de Area: Consulta por litoral Golfo - Tabular - Validar etiquetas
    [Documentation]    Debera de mostrar correctamente las etiquetas escritas.
    [Tags]    Consulta por litoral Golfo - Tabular - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar opcion Tabular
    Validar etiquetas en Tabular
    [Teardown]    Close Browser

Reporte de Area: Consulta por litoral Golfo - Tabular - Validar informacion en BD
    [Documentation]    Validar que la informacion que se muestra en el tabular coincida con la de la Base de datos.
    [Tags]    Consulta por litoral Golfo - Tabular - Validar informacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular (TODAS Golfo)
    [Teardown]    Close Browser

Reporte de Area: Consulta por litoral Golfo - Tabular - Posicion Decimal
    [Documentation]    Debera de mostrar la configuracion en Posicion en decimal en el tabular.
    [Tags]    Consulta por litoral Golfo - Tabular - Posicion Decimal
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Configurar posicion    ${Decimal}
    Sleep    2
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular (TODAS Golfo posicion Decimal)
    [Teardown]    Close Browser

Reporte de Area: Consulta por litoral Golfo - Tabular - Velocidad KPH
    [Documentation]    Debera de mostrar la configuracion en Velocidad en KPH en el tabular.
    [Tags]    Consulta por litoral Golfo - Tabular - Velocidad KPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${KPH}
    Sleep    2
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular (TODAS Golfo)    CONVERT(DECIMAL(5,2),(mcp.Velocidad))    KPH
    [Teardown]    Close Browser

Reporte de Area: Consulta por litoral Golfo - Tabular - Velocidad MPH
    [Documentation]    Debera de mostrar la configuracion en Velocidad en MPH en el tabular.
    [Tags]    Consulta por litoral Golfo - Tabular - Velocidad MPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${MPH}
    Sleep    2
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular (TODAS Golfo)    CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.609))    MPH
    [Teardown]    Close Browser

Reporte de Area: Consulta por litoral Golfo - Tabular - Exportar a Excel
    [Documentation]    Debera de exportar correctamente a formato Excel los resultados del tabular.
    [Tags]    Consulta por litoral Golfo - Tabular - Exportar a Excel - T535
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar opcion Tabular
    Presionar boton Exportar a Excel
    Sleep    5
    Validar archivo de Excel generado    ${DescargaReporte}
    [Teardown]    Close Browser

#Reporte de Area: Consulta por litoral Golfo - Tabular - Imprimir
    #[Documentation]	Debera de imprimir correctamente la informacion del tabular.   
	##...		Por actualizar, el caso no finaliza al lanzar la ventana de impresion
    #[Tags]    Consulta por litoral Golfo - Tabular - Imprimir
    #Iniciar sesion
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte de Area
    #Seleccionar Tipo de busqueda: ${Golfo}
    #Seleccionar Tipo de Vehiculo    ${Barco}
    #Seleccionar rango de fechas
    #Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    #Sleep    1
    #Presionar boton Consultar
    #Sleep    2
    #Seleccionar opcion Tabular
    #Presionar boton Imprimir
    #Validar ventana de impresion
    #[Teardown]    Close Browser

Reporte de Area: Consulta por litoral Golfo - Tabular - Vista Mapa
    [Documentation]    Debera de regresar a la vista de resultados en el mapa cuando se oprima el botón Vista Mapa.
    [Tags]    Consulta por litoral Golfo - Tabular - Vista Mapa
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar opcion Tabular
    Presionar boton Regresar
    Sleep    2
    Validar retorno a ventana Vista Mapa
    [Teardown]    Close Browser

Reporte de Area: Consulta por litoral Golfo - Configuracion (contextual) - Posicion Decimal
    [Documentation]    Debera de mostrar correctamente la configuracion Posicion en Decimal en el Menu contextual
    [Tags]    Consulta por litoral Golfo - Configuracion (contextual) - Posicion Decimal
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Configurar posicion    ${Decimal}
    Sleep    1
    Seleccionar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Sleep    1
    Validar datos de Embarcacion en BD - Contextual - Posicion Decimal
    [Teardown]    Close Browser

Reporte de Area: Consulta por Golfo - Configuracion (contextual) - Velocidad KPH
    [Documentation]    Debera de mostrar correctamente la configuracion Velocidad en KPH en el Menu contextual.
    [Tags]    Consulta por Golfo - Configuracion (contextual) - Velocidad KPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${KPH}
    Sleep    1
    Seleccionar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Sleep    1
    Validar datos de Embarcacion en BD - Contextual    Vel=CONVERT(DECIMAL(5,2),(mcp.Velocidad))    etqVel=KPH
    [Teardown]    Close Browser

Reporte de Area: Consulta por Golfo - Configuracion (contextual) - Velocidad MPH
    [Documentation]    Debera de mostrar correctamente la configuracion Velocidad en MPH en el Menu contextual
    [Tags]    Consulta por Golfo - Configuracion (contextual) - Velocidad MPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Configurar Velocidad    ${MPH}
    Sleep    1
    Seleccionar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Sleep    1
    Validar datos de Embarcacion en BD - Contextual    Vel=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.609))    etqVel=MPH
    [Teardown]    Close Browser

Reporte de Area: Consulta por Golfo - Configuracion - Distancia Km
    [Documentation]    Debera de mostrar correctamente la configuracion Distancia en Km al calcular la distancia.
    [Tags]    Consulta por Golfo - Configuracion - Distancia Km
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Configurar Distancia    ${DstKilometros}
    Seleccionar opcion Distancia
    Sleep    1
    Validar distancia activada    km
    [Teardown]    Close Browser

Reporte de Area: Consulta por Golfo - Configuracion - Distancia Mi
    [Documentation]    Debera de mostrar correctamente la configuracion Distancia en Mi al calcular la distancia.
    [Tags]    Consulta por Golfo - Configuracion - Distancia Mi
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Golfo}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Configurar Distancia    ${DstMillas}
    Seleccionar opcion Distancia
    Sleep    1
    Validar distancia activada    mi
    [Teardown]    Close Browser
    
Reporte de Area: Consulta por litoral Pacifico
    [Documentation]    Valida que se muestre la pantalla con los resultados de la consulta
    [Tags]    Consulta por litoral Pacifico
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Pacifico}
    Seleccionar Permiso    ${CamaronAltamar}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaP}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    [Teardown]    Close Browser

Reporte de Area: Consulta por litoral Pacifico - Seleccionar Embarcacion - Validar datos de Embarcacion en BD
    [Documentation]    Valida los datos de la embarcacion seleccionada contra la Base de datos
    [Tags]    Consulta por litoral Pacifico - Seleccionar Embarcacion - Validar datos de Embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Pacifico}
    Seleccionar Permiso    ${CamaronAltamar}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaP}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Validar datos de Embarcacion en BD    ${EmbarcacionP}[RNP]    ${SQLPacifico}    Pacifico
    [Teardown]    Close Browser
    
Reporte de Area: Consulta por litoral Pacifico - Seleccionar Embarcacion - Menu contextual izquierdo - Validar datos de embarcacion en BD
    [Documentation]    Valida las etiquetas del menu contextual para la embarcacion seleccionada
    [Tags]    Consulta por litoral Pacifico - Seleccionar Embarcacion - Menu contextual izquierdo - Validar datos de embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Pacifico}
    Seleccionar Permiso    ${CamaronAltamar}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaP}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Sleep    2
    Zoom IN
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual    ${SQLPacifico}    Embarcacion=${EmbarcacionP}[Nombre]
    [Teardown]    Close Browser
    
Reporte de Area: Consulta por litoral Pacifico - Tabular - Validar informacion en BD
    [Documentation]		Valida la informacion mostrada en el tabular contra la Base de datos.    
    [Tags]    Consulta por litoral Pacifico - Tabular - Validar informacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar Tipo de busqueda: ${Pacifico}
    Seleccionar Permiso    ${CamaronAltamar}
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaP}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular (TODAS Pacifico)
    [Teardown]    Close Browser
    
Reporte de Area: Consulta por Embarcacion - Nombre
    [Documentation]		Valida que permita realizar una consulta por embarcacion sin ningun problema.    
    [Tags]    Consulta por Embarcacion - Nombre - T508
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar tipo de busqueda: ${Embarcacion}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    [Teardown]    Close Browser

Reporte de Area: Consulta por Embarcacion - Nombre - Validar datos de Embarcacion en BD
    [Documentation]    Valida los datos de la embarcacion seleccionada contra la Base de datos
    [Tags]    Consulta por Embarcacion - Nombre - Validar datos de Embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar tipo de busqueda: ${Embarcacion}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Validar datos de Embarcacion en BD
    [Teardown]    Close Browser
    
Reporte de Area: Consulta por Embarcacion - Nombre - Menu contextual izquierdo - Validar datos de embarcacion en BD
    [Documentation]    Valida que la informacion mostrada en el menu contextual sea correcta contra la de Base de datos.
    [Tags]    Consulta por Embarcacion - Nombre - Menu contextual izquierdo - Validar datos de embarcacion en BD - T531
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar tipo de busqueda: ${Embarcacion}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Desplegar menu contextual de Embarcacion (clic izquierdo)
    Validar datos de Embarcacion en BD - Contextual
    [Teardown]    Close Browser
    
Reporte de Area: Consulta por Embarcacion - Nombre - Tabular - Validar informacion en BD
    [Documentation]    Valida que la informacion en el tabular sea correcta contra la de Base de datos.
    [Tags]    Consulta por Embarcacion - Nombre - Tabular - Validar informacion en BD - T532
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar tipo de busqueda: ${Embarcacion}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    Seleccionar opcion Tabular
    Validar informacion en BD del Tabular Golfo
    [Teardown]    Close Browser
    
Reporte de Area: Consulta por Embarcacion - RNP
    [Documentation]    Valida que permita realizar una consulta ingresado un RNP en la busqueda por embarcacion.
    [Tags]    Consulta por Embarcacion - RNP
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar tipo de busqueda: ${Embarcacion}
    Filtrar Embarcacion por Columna 2, Campo ${EmbarcacionG}[RNP]
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    [Teardown]    Close Browser

Reporte de Area: Consulta por Embarcacion - Matricula
    [Documentation]    Valida que permita realizar una consulta ingresado un Matricula en la busqueda por embarcacion.
    [Tags]    Consulta por Embarcacion - Matricula
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Area
    Sleep    1
    Seleccionar tipo de busqueda: ${Embarcacion}
    Filtrar Embarcacion por Columna 3, Campo ${EmbarcacionG}[Matricula]
    Seleccionar rango de fechas
    Presionar opcion Puntos e ingresar coordenadas    ${ZonaG}
    Sleep    1
    Presionar boton Consultar
    Sleep    2
    [Teardown]    Close Browser

*** Keywords ***
Presionar opcion Reporte de Area
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/div[3]/div/a[2]
    Click Element    xpath=//*[@id="divPanelControles"]/div[3]/div/a[2]
    Sleep    1
    Switch Window    ${titReporteArea}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="validate"]/div/span    timeout=30

Validar etiquetas
    Wait Until Element Is Visible    xpath=//*[@id="form"]/div/div[2]/div[2]/h3
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/h3    Reporte de Area:
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[1]/label    Tipo de búsqueda:
    Element Text Should Be    xpath=//*[@id="rdoGpoDevExTipoBusqueda"]/div/div[1]    Golfo
    Element Text Should Be    xpath=//*[@id="rdoGpoDevExTipoBusqueda"]/div/div[2]    Pacifico
    Element Text Should Be    xpath=//*[@id="rdoGpoDevExTipoBusqueda"]/div/div[3]    Embarcación
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[2]/div/div[1]/label    Tipo Vehículo
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[3]/div/div[1]/label    Permiso
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[4]/label    Embarcación
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[5]/div[1]/label    Fecha Inicial:
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[5]/div[2]/label    Fecha Final:
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[6]/div[1]/label    Crear Zona
    Element Text Should Be    xpath=//*[@id="validate"]/div/span    Consultar
    
Seleccionar Tipo de busqueda: ${OPC}
    Wait Until Element Is Visible    ${OPC}
    Click Element    ${OPC}

Seleccionar Tipo de Vehiculo
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="chkDevExTipoVehiculo"]/div/span
    Sleep    1
    Click Element    xpath=//*[@id="cboDevExTipoVehiculo"]/div[1]/div/div[1]/input
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}

Seleccionar rango de fechas
    [Arguments]    ${inicial}=${fechaini}    ${final}=${fechafin}
    Input Text    xpath=//*[@id="date-time-inicial"]/div[1]/div/div[1]/input    ${inicial}
    Input Text    xpath=//*[@id="date-time-final"]/div[1]/div/div[1]/input    ${final}
    
Presionar opcion Puntos e ingresar coordenadas
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="btnCuadrante"]
    Sleep    1
    Input Text    xpath=//*[@id="form2"]/div/div/div[1]/div[2]/div/div[1]/input    ${arg1}
    Sleep    1
    Click Element    xpath=//*[@id="form2"]/div/div/div[1]/div[2]/div/div[2]/button
    Sleep    1
    Click Element    xpath=//*[@id="form2"]/div/div/div[3]/div[3]/button

Presionar boton Consultar
    Click Element    xpath=//*[@id="validate"]/div
    Wait Until Element Is Visible    xpath=//*[@id="map-canvas"]/div/div/div[1]    timeout=30

Presionar opcion Consultar (obligatorios)
    Click Element    xpath=//*[@id="validate"]/div
    
Validar resultado de la consulta - Validar etiquetas y tooltips
    ${ttConsulta}=    Get Element Attribute    xpath=//*[@id="btnBack"]    title
    ${ttZonas}=    Get Element Attribute    xpath=//*[@id="btnZonas"]    title
    ${ttNautica}=    Get Element Attribute    xpath=//*[@id="btnNautica"]    title
    ${ttDistancia}=    Get Element Attribute    xpath=//*[@id="btnDistancia"]    title
    ${ttTabular}=    Get Element Attribute    xpath=//*[@id="btnTabular"]    title
    ${ttConfiguracion}=    Get Element Attribute    xpath=//*[@id="btnConfiguracion"]/span    title
    ${ttLimpiar}=    Get Element Attribute    xpath=/html/body/div[1]/div/button[6]    title
    Should be equal    ${ttConsulta}    Nueva Consulta
    Should be equal    ${ttZonas}    Zonas
    Should be equal    ${ttNautica}    Nautica
    Should be equal    ${ttDistancia}    Distancia
    Should be equal    ${ttTabular}    Tabular
    Should be equal    ${ttConfiguracion}    Configuraci\u00F3n
    Should be equal    ${ttLimpiar}    Limpiar
    
# Seleccionar opcion Nueva Consulta
#     Click Element    //*[@id="btnBack"]

# Validar retorno a ventana de Consulta
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
#     Wait Until Element Is Visible    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div/div/div/div/div/h3
#     ${etq}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div/div/div/div/div/h3
#     Should Contain    ${etq}    ${arg1}

# Seleccionar opcion Tabular
#     Click Element    xpath=//*[@id="btnTabular"]
#     Sleep    2
#     Select Frame    xpath=//*[@id="iRepTabular"]
#     Wait Until Element Is Visible    xpath=//*[@id="divtable"]/table    timeout=90
#     ${date24h}    Get Current Date    result_format=%d/%m/%Y %H:%M
#     Set Test Variable    ${date24h}

Validar etiquetas en Tabular
    Obtener numero de embarcaciones y datos de primer embarcacion en el tabular
    Sleep    1
    ${ttExcel}=    Get Element Attribute    xpath=//*[@id="menu"]/div[2]/button    title
    ${ttImprimir}=    Get Element Attribute    xpath=//*[@id="menu"]/div[3]/button    title
    ${ttMapa}=    Get Element Attribute    xpath=//*[@id="menu"]/div[4]/button    title
    Should be equal    ${ttExcel}    Exportar a Excel
    Should be equal    ${ttImprimir}    Imprimir
    Should be equal    ${ttMapa}    Vista Mapa
    ${Rango}=    Catenate    Rango del Reporte: ${fechaini} al ${fechafin}
    ${UserImp}=    Get Text    xpath=//*[@id="divRango"]/p[2]
    ${UsuarioImp}=    Execute Javascript    cadena='${UserImp}'; return cadena.slice(0,-3);
    ${Embarcacion}=    Catenate    Embarcaci\u00F3n: ${Nombre} RNP: ${RNP}
    ${RazonSocial}=    Catenate    Raz\u00F3n Social: ${RazonSocial}
    Element Text Should Be    //*[@id="headerRigth"]/h2    conapesca.gob.mx
    Element Text Should Be    //*[@id="banner"]/h3    Sistema de Localizaci\u00F3n y Monitoreo de Embarcaciones Pesqueras
    Element Text Should Be    //*[@id="main"]/div[1]/h3    Reporte de \u00C1rea
    Element Text Should Be    //*[@id="divRango"]/p[1]    ${Rango}
    Should be equal    ${UsuarioImp}    Usuario: ${credenciales}[usuario]. Impreso el ${date24h}
    Element Text Should Be    //*[@id="divRango"]/p[3]    Total Embarcaciones: ${NoEmb}
    Element Text Should Be    //*[@id="divtable"]/p[1]    Registro 1 de ${NoEmb}
    Element Text Should Be    //*[@id="divtable"]/p[2]    ${Embarcacion}
    Element Text Should Be    //*[@id="divtable"]/p[3]    ${RazonSocial}
    Element Text Should Be    //*[@id="divtable"]/table[1]/tbody/tr[1]/td[1]    Orden
    Element Text Should Be    //*[@id="divtable"]/table[1]/tbody/tr[1]/td[2]    Fecha
    Element Text Should Be    //*[@id="divtable"]/table[1]/tbody/tr[1]/td[3]    Latitud
    Element Text Should Be    //*[@id="divtable"]/table[1]/tbody/tr[1]/td[4]    Longitud
    Element Text Should Be    //*[@id="divtable"]/table[1]/tbody/tr[1]/td[5]    Rumbo
    Element Text Should Be    //*[@id="divtable"]/table[1]/tbody/tr[1]/td[6]    Velocidad
    Element Text Should Be    //*[@id="divtable"]/table[1]/tbody/tr[1]/td[7]    Referencia
    Element Text Should Be    //*[@id="pBottom"]    Comisi\u00F3n Nacional de Acuacultura y Pesca, M\u00E9xico - Algunos derechos reservados \u00A9 2014
    Element Text Should Be    //*[@id="pTop"]    Av. Camar\u00F3n S\u00E1balo S/N Esq. Tibur\u00F3n, Fracc. S\u00E1balo Country Club, C.P. 82100 Mazatl\u00E1n, Sin. Mex. Tel. 01-800-6674-022

Obtener numero de embarcaciones y datos de primer embarcacion en el tabular
    Conexion a Base de datos
    ${NombreEmb}    Get text    xpath=//*[@id="divtable"]/p[2]/b[1]
    @{queryResults}=    Query    select v.Nombre, v.RNP, v.Matricula, rs.Descripcion from Sismep.TSismepVehiculos v join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial where v.Nombre = '${NombreEmb}'
    @{queryCount}=    Query    DECLARE @zoneGCOUNT geometry; SET @zoneGCOUNT = geometry::Parse('${SQLGolfo}'); select count(distinct(v.Nombre)) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where d.DescripcionCorta = 'Golfo' and v.Texto5 = 'Barco' and FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zoneGCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1
    @{queryUsuario}=    Query    select Nombre from aspnet_Users where UserName = '${credenciales}[usuario]'
    Set Test Variable    ${Nombre}    ${queryResults[0][0]}
    Set Test Variable    ${RNP}    ${queryResults[0][1]}
    Set Test Variable    ${Matricula}    ${queryResults[0][2]}
    Set Test Variable    ${RazonSocial}    ${queryResults[0][3]}
    Set Test Variable    ${Usuario}    ${queryUsuario[0][0]}
    Set Test Variable    ${NoEmb}    ${queryCount[0][0]}
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
#     Element Should Be Visible    xpath=//*[@id="toolBar"]
    
Seleccionar Embarcacion por Columna ${COL}, Campo ${CAMPO}
    Wait Until Element Is Visible    xpath=//*[@id="cboDevExVehiclesList"]/div[1]/div/div[1]/input
    Click Element    xpath=//*[@id="cboDevExVehiclesList"]/div[1]/div/div[1]/input
    Sleep    2
    Input Text    xpath=/html/body/div[9]/div/div/div/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    Sleep    1
    Click Element    xpath=/html/body/div[9]/div/div/div/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    Sleep    1
    Wait Until Element Is Visible    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[3]/div[1]/img    timeout=15
    
Validar etiquetas - Seleccionar embarcacion
    Wait Until Element Is Visible    //*[@id="toolBarData"]/div/div[1]/div/h4
    Element Text Should Be    //*[@id="toolBarData"]/div/div[1]/div/h4    Reporte de \u00C1rea
    Element Text Should Be    //*[@id="toolBarData"]/div/div[2]/div[1]    Nombre:
    Element Text Should Be    //*[@id="toolBarData"]/div/div[3]/div[1]    RNP:
    Element Text Should Be    //*[@id="toolBarData"]/div/div[4]/div[1]    Matricula:
    
# Obtener datos de la Embarcacion
#     ${Nombre}=    Get Text    xpath=//*[@id="toolBarData"]/div/div[2]/div[2]/span
#     ${RNP}=    Get Text    xpath=//*[@id="toolBarData"]/div/div[3]/div[2]/span
#     ${Matricula}=    Get Text    xpath=//*[@id="toolBarData"]/div/div[4]/div[2]/span
#     Set Test Variable    ${Nombre}
#     Set Test Variable    ${RNP}
#     Set Test Variable    ${Matricula}
    
Validar datos de Embarcacion en BD
    [Arguments]    ${arg1}=${EmbarcacionG}[RNP]    ${puntos}=${SQLGolfo}    ${zona}=Golfo
    Obtener datos de la Embarcacion
    Conexion a Base de datos
    ${countmapa}=    Execute JavaScript    return document.querySelector("#map-canvas > div > div > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(3)").childElementCount-1;
    #@{countDB}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${arg1}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}'
    @{countDB}    Query    DECLARE @zoneGCOUNT geometry; SET @zoneGCOUNT = geometry::Parse('${puntos}'); select count(mcp.IdMensajeM) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where d.DescripcionCorta = '${zona}' and v.Texto5 = 'Barco' and FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zoneGCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1 and v.RNP = '${arg1}'
    Should be equal    ${countDB[0][0]}    ${countmapa}
    @{queryResults}=    Query    select Nombre, RNP, Matricula from Sismep.TSismepVehiculos where RNP = '${arg1}'
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${RNP}
    Should Be Equal    ${queryResults[0][2]}    ${Matricula}
    Disconnect From Database
    
# Desplegar menu contextual de Embarcacion (clic izquierdo)
#     #Click Element    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[3]/div[1]/img
#     Execute Javascript    document.evaluate('//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[3]/div[1]/img',document.body,null,9,null).singleNodeValue.click();
    
# Validar etiquetas - Menu contextual (clic izquierdo)
#     Wait Until Element Is Visible    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[1]/td/h2    timeout=15
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[1]/td/h2    ${EmbarcacionG}[Nombre]
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[2]/td[1]/b    RNP:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[3]/td[1]/b    Matr\u00EDcula:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[4]/td[1]/b    Latitud:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[5]/td[1]/b    Longitud:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[6]/td[1]/b    Velocidad:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[7]/td[1]/b    Rumbo:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[8]/td[1]/b    Ultimo reporte:
#     Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div[2]/div/div/table/tbody/tr[9]/td[1]/b    Puerto base:
    
# Obtener datos de la Embarcacion - Contextual - Default
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
    
Validar datos de Embarcacion en BD - Contextual
    [Arguments]    ${puntos}=${SQLGolfo}    ${Embarcacion}=${EmbarcacionG}[Nombre]    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Obtener datos de la Embarcacion - Contextual - Default
    Conexion a Base de datos
    @{queryResults}=    Query    DECLARE @zoneGCOUNT geometry; SET @zoneGCOUNT = geometry::Parse('${puntos}'); select top 1 v.Nombre, v.RNP, v.Matricula, mcp.Latitud, mcp.Longitud, ${Vel}, mcp.Rumbo, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), pti.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zoneGCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1 order by mcp.FechaRecepcionUnitrac
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
    [Arguments]    ${puntos}=${SQLGolfo}    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Obtener datos de la Embarcacion - Contextual - Decimal
    Conexion a Base de datos
    @{queryResults}=    Query    DECLARE @zoneGCOUNT geometry; SET @zoneGCOUNT = geometry::Parse('${puntos}'); select top 1 v.Nombre, v.RNP, v.Matricula, round(mcp.Latitud, 7), round(mcp.Longitud, 7), ${Vel}, mcp.Rumbo, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), pti.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres where v.Nombre = '${EmbarcacionG}[Nombre]' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zoneGCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1 order by mcp.FechaRecepcionUnitrac
    ${LatitudBD}=    Convert to Number    ${queryResults[0][3]}    7
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} ${etqVel}
    ${RumboBD}=    Catenate    ${queryResults[0][6]}\u00B0
    ${UltimoRBD}=    Execute Javascript    cadena='${queryResults[0][7]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3;
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${RNP}
    Should Be Equal    ${queryResults[0][2]}    ${Matricula}
    Should Be Equal    ${LatitudBD}    ${Latitud}
    Should Be Equal    ${queryResults[0][4]}    ${Longitud}
    Should Be Equal    ${VelocidadBD}    ${Velocidad}
    Should Be Equal    ${RumboBD}    ${Rumbo}
    Should Be Equal    ${UltimoRBD}    ${UltimoReporte}
    Should Be Equal    ${queryResults[0][8]}    ${PuertoBase}
    Disconnect From Database
    
Seleccionar Permiso
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="chkDevExPermiso"]/div/span
    Sleep    1
    Click Element    xpath=//*[@id="cboDevExPermiso"]/div[1]/div/div[1]/input
    Sleep    1
    Deslizar scroll permisos abajo
    Click Element    ${arg1}

Filtrar Embarcacion por Columna ${COL}, Campo ${CAMPO}
    Wait Until Element Is Visible    xpath=//*[@id="dropDownBoxContainerEmbarcacion"]/div[1]/div/div[1]/input    timeout=60
    Click Element    xpath=//*[@id="dropDownBoxContainerEmbarcacion"]/div[1]/div/div[1]/input
    Sleep    1
    Input Text    xpath=//*[@id="dropDownBoxContainerEmbarcacion_template"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    Sleep    1
    Click Element    xpath=//*[@id="dropDownBoxContainerEmbarcacion_template"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[${COL}]

# Validar mensaje
#     [Arguments]    ${arg1}
#     Wait Until Element Is Visible    xpath=/html/body/div[9]/div/div
#     Element Text Should Be    xpath=/html/body/div[9]/div/div/div[2]    ${arg1}

Validar informacion en BD del Tabular Golfo
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Conexion a Base de Datos
    ${NombreEmb}    Get text    xpath=//*[@id="divtable"]/p[2]/b[1]
    #Valida la cantidad de registros en el tabular de la primer embarcacion
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table:nth-child(4) > tbody").rows.length -1;
    #@{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${NombreEmb}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}'
    @{queryRows}    Query    DECLARE @zoneGCOUNT geometry; SET @zoneGCOUNT = geometry::Parse('${SQLGolfo}'); select count(mcp.IdMensajeM) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where d.DescripcionCorta = 'Golfo' and v.Texto5 = 'Barco' and FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zoneGCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1 and v.Nombre = '${NombreEmb}'
    Should be equal    ${queryRows[0][0]}    ${rows}
    #Valida los datos del primer registro en el tabular de la primer embarcacion
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[2]
    ${Latitud}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[3]
    ${Longitud}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[4]
    ${Rumbo}=     Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[6]
    ${Referencia}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[7]
    @{queryResults}    Query    DECLARE @zoneGCOUNT geometry; SET @zoneGCOUNT = geometry::Parse('${SQLGolfo}'); select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), mcp.Latitud, mcp.Longitud, mcp.Rumbo, ${Vel}, 'Zona establecida por usuario' from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${NombreEmb}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zoneGCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1 order by mcp.FechaRecepcionUnitrac
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
    Should be equal    ${queryResults[0][6]}    ${Referencia}
    Disconnect From Database
    
Validar informacion en BD del Tabular (TODAS Golfo)
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Conexion a Base de Datos
    ${NombreEmb}    Get text    xpath=//*[@id="divtable"]/p[2]/b[1]
    #Valida el total de embarcaciones en el tabular
    ${totalEmb}=    Execute JavaScript    return document.getElementsByClassName("CSSTableGenerator").length;
    @{queryCount}=    Query    DECLARE @zoneGCOUNT geometry; SET @zoneGCOUNT = geometry::Parse('${SQLGolfo}'); select count(distinct(v.Nombre)) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where d.DescripcionCorta = 'Golfo' and v.Texto5 = 'Barco' and FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zoneGCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1
    Should be equal    ${queryCount[0][0]}    ${totalEmb}
    #Valida la cantidad de registros en el tabular de la primer embarcacion
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table:nth-child(4) > tbody").rows.length -1;
    @{queryRows}    Query    DECLARE @zoneGCOUNT geometry; SET @zoneGCOUNT = geometry::Parse('${SQLGolfo}'); select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${NombreEmb}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zoneGCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1
    Should be equal    ${queryRows[0][0]}    ${rows}
    #Valida los datos del primer registro en el tabular de la primer embarcacion
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[2]
    ${Latitud}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[3]
    ${Longitud}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[4]
    ${Rumbo}=     Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[6]
    ${Referencia}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[7]
    @{queryResults}    Query    DECLARE @zoneGCOUNT geometry; SET @zoneGCOUNT = geometry::Parse('${SQLGolfo}'); select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), mcp.Latitud, mcp.Longitud, mcp.Rumbo, ${Vel}, 'Zona establecida por usuario' from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${NombreEmb}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zoneGCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1 order by mcp.FechaRecepcionUnitrac
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
    Should be equal    ${queryResults[0][6]}    ${Referencia}
    Disconnect From Database

Validar informacion en BD del Tabular (TODAS Pacifico)
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Conexion a Base de Datos
    ${NombreEmb}    Get text    xpath=//*[@id="divtable"]/p[2]/b[1]
    #Valida el total de embarcaciones en el tabular
    ${totalEmb}=    Execute JavaScript    return document.getElementsByClassName("CSSTableGenerator").length;
    @{queryCount}=    Query    DECLARE @zonePCOUNT geometry; SET @zonePCOUNT = geometry::Parse('${SQLPacifico}'); select count(distinct(v.Nombre)) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle join Sismep.TSismepVehiculosPermisos vp on v.IdVehiculo = vp.IdVehiculo and vp.Activo = 1 join Sismep.TSismepTiposCarga tc on vp.IdTipoCarga = tc.IdTipoCarga where d.DescripcionCorta = 'Pacifico' and tc.Descripcion = 'CAMARON DE ALTAMAR' and FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zonePCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1
    Should be equal    ${queryCount[0][0]}    ${totalEmb}
    #Valida la cantidad de registros en el tabular de la primer embarcacion
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table:nth-child(4) > tbody").rows.length -1;
    #@{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${NombreEmb}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}'
    @{queryRows}    Query    DECLARE @zonePCOUNT geometry; SET @zonePCOUNT = geometry::Parse('${SQLPacifico}'); select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle join Sismep.TSismepVehiculosPermisos vp on v.IdVehiculo = vp.IdVehiculo and vp.Activo = 1 join Sismep.TSismepTiposCarga tc on vp.IdTipoCarga = tc.IdTipoCarga where d.DescripcionCorta = 'Pacifico' and tc.Descripcion = 'CAMARON DE ALTAMAR' and FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zonePCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1 and v.Nombre = '${NombreEmb}'
    Should be equal    ${queryRows[0][0]}    ${rows}
    #Valida los datos del primer registro en el tabular de la primer embarcacion
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[2]
    ${Latitud}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[3]
    ${Longitud}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[4]
    ${Rumbo}=     Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[6]
    ${Referencia}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[7]
    #@{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), mcp.Latitud, mcp.Longitud, mcp.Rumbo, ${Vel}, 'Zona establecida por usuario' from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${NombreEmb}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' order by mcp.FechaRecepcionUnitrac
    @{queryResults}    Query    DECLARE @zonePCOUNT geometry; SET @zonePCOUNT = geometry::Parse('${SQLPacifico}'); select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), mcp.Latitud, mcp.Longitud, mcp.Rumbo, ${Vel}, 'Zona establecida por usuario' from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle join Sismep.TSismepVehiculosPermisos vp on v.IdVehiculo = vp.IdVehiculo and vp.Activo = 1 join Sismep.TSismepTiposCarga tc on vp.IdTipoCarga = tc.IdTipoCarga where d.DescripcionCorta = 'Pacifico' and tc.Descripcion = 'CAMARON DE ALTAMAR' and FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zonePCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1 and v.Nombre = '${NombreEmb}' order by mcp.FechaRecepcionUnitrac
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
    Should be equal    ${queryResults[0][6]}    ${Referencia}
    Disconnect From Database
    
Validar informacion en BD del Tabular (TODAS Golfo posicion Decimal)
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Conexion a Base de Datos
    ${NombreEmb}    Get text    xpath=//*[@id="divtable"]/p[2]/b[1]
    #Valida el total de embarcaciones en el tabular
    ${totalEmb}=    Execute JavaScript    return document.getElementsByClassName("CSSTableGenerator").length;
    @{queryCount}=    Query    DECLARE @zoneGCOUNT geometry; SET @zoneGCOUNT = geometry::Parse('${SQLGolfo}'); select count(distinct(v.Nombre)) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where d.DescripcionCorta = 'Golfo' and v.Texto5 = 'Barco' and FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zoneGCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1
    Should be equal    ${queryCount[0][0]}    ${totalEmb}
    #Valida la cantidad de registros en el tabular de la primer embarcacion
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table:nth-child(4) > tbody").rows.length -1;
    @{queryRows}    Query    DECLARE @zoneGCOUNT geometry; SET @zoneGCOUNT = geometry::Parse('${SQLGolfo}'); select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${NombreEmb}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zoneGCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1
    Should be equal    ${queryRows[0][0]}    ${rows}
    #Valida los datos del primer registro en el tabular de la primer embarcacion
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[2]
    ${Lat}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[3]
    ${Latitud}=    Convert to Number    ${Lat}
    ${Lon}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[4]
    ${Longitud}=    Convert to Number    ${Lon}
    ${Rumbo}=     Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[6]
    ${Referencia}=    Get text    xpath=//*[@id="divtable"]/table[1]/tbody/tr[2]/td[7]
    @{queryResults}    Query    DECLARE @zoneGCOUNT geometry; SET @zoneGCOUNT = geometry::Parse('${SQLGolfo}'); select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), round(mcp.Latitud, 7), round(mcp.Longitud, 7), mcp.Rumbo, ${Vel}, 'Zona establecida por usuario' from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${NombreEmb}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and case when @zoneGCOUNT.STContains(geometry::Parse('POINT(' + CAST(mcp.Longitud as varchar) + ' ' + CAST(mcp.Latitud as varchar) + ')')) = 1 then 1 end = 1 order by mcp.FechaRecepcionUnitrac
    ${FechaBD}=    Execute Javascript    cadena='${queryResults[0][1]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3;
    ${RumboBD}=    Catenate    ${queryResults[0][4]}\u00B0
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} ${etqVel}
    Should be equal    ${FechaBD}    ${Fecha}
    Should be equal    ${queryResults[0][2]}    ${Latitud}
    Should be equal    ${queryResults[0][3]}    ${Longitud}
    Should be equal    ${RumboBD}    ${Rumbo}
    Should be equal    ${VelocidadBD}    ${Velocidad}
    Should be equal    ${queryResults[0][6]}    ${Referencia}
    Disconnect From Database
    
Deslizar scroll permisos abajo
    Execute JavaScript    window.document.evaluate('/html/body/div[9]/div/div/div/div[1]/div/div[1]/div[2]/div[15]/div', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=/html/body/div[9]/div/div/div/div[1]/div/div[1]/div[2]/div[25]/div    timeout=15
    
Zoom IN
    Execute JavaScript    map.setZoom(12);
