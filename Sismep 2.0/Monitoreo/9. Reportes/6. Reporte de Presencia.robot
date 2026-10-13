*** Settings ***
Resource    Recursos.Reportes.robot

*** Variables ***
&{EmbarcacionG}    Nombre=DON NENE    RNP=00079913    Matricula=2702282123-7
&{EmbarcacionP}    Nombre=DON ESTEBAN    RNP=00025049    Matricula=26010187233
${titReportePresencia}    title=Sismep - Alertas
${fechaini}    29/09/2022 00:00:00
${fechafin}    29/09/2022 23:59:59
${fechainiUTC}    20220929 07:00:00
${fechafinUTC}    20220930 07:00:00
${fechainiY}    01/01/2022 00:00:00
${fechafinY}    31/12/2022 23:59:59
${fechainiUTCY}    20220101 07:00:00
${fechafinUTCY}    20230101 07:00:00
${Golfo}    xpath=//*[@id="rdoGpoDevExTipoBusqueda"]/div/div[1]/div[1]/div
${Pacifico}    xpath=//*[@id="rdoGpoDevExTipoBusqueda"]/div/div[2]/div[1]/div
&{TipoAlerta}    app=Aviso Pesca Prohibida    azp=Aviso Zona Prohibida
${AvisoPescaProhibida}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[1]/div
${AvisoZonaProhibida}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div
${ZonaGolfo}    Zona de Seguridad I
${ZonaPacifico}    Norte del Golfo de California (Acuerdo regulatorio Art. Primero)
${Zona}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[75]/div
${VedaPicudosA}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[131]/div
${Barco}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[1]/div
${Panga}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div
${Todos}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[3]/div
${DMS}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[1]/div
${Decimal}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div
${Nudos}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[1]/div
${MPH}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div
${KPH}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[3]/div
${DescargaReporteDetalle}    C:/Users/mmorales/Downloads/ReportePresenciaDetalle.xlsx
${DescargaReporteResumen}    C:/Users/mmorales/Downloads/ReportePresenciaResumen.xlsx
${elemento}    0

*** Test Cases ***
Reporte de Presencia: Validar etiquetas
    [Documentation]    Valida que se muestre correctamente escritas las etiquetas.
    [Tags]    Reporte de Presencia: Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser

Reporte de Presencia: Filtros obligatorios
    [Documentation]    Valida que se muestren correctamente los campos obligatorios en la consulta.
    [Tags]    Reporte de Presencia: Filtros obligatorios
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar campos requeridos
    [Teardown]    Close Browser

Reporte de Presencia: Validacion rango de fechas
    [Documentation]    Valida que se muestre una validacion cuando la fecha inicial
        ...    sea mayor a la fecha final.
    [Tags]    Reporte de Presencia: Validacion rango de fechas - T1099
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    Seleccionar rango de fechas    ${fechafin}    ${fechaini}
    Seleccionar Tipo de Alerta    ${AvisoZonaProhibida}
    Seleccionar Zona    ${Zona}
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    3    Fecha Inicial debe ser menor a la Fecha Final.
    [Teardown]    Close Browser

Reporte de Presencia: Detalle - Consulta por TODAS las embarcaciones
    [Documentation]    Valida que se realice correctamente la consulta por Todas las embarcaciones.
    [Tags]    Reporte de Presencia: Detalle - Consulta por TODAS las embarcaciones
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD (TODAS)    Litoral=Pacifico    TipoA=${TipoAlerta}[app]    NomZona=${ZonaPacifico}
    [Teardown]    Close Browser
    
Reporte de Presencia: Detalle - Consulta por Nombre
    [Documentation]    Valida que se realice correctamente la consulta por Nombre.
    [Tags]    Reporte de Presencia: Detalle - Consulta por Nombre - T603
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Sleep    1
    Presionar opcion Consultar
    [Teardown]    Close Browser

Reporte de Presencia: Detalle - Consulta por Nombre - Validar etiquetas en Tabular
    [Documentation]    Valida que se muestren correctamente escritas las etiquetas.
    [Tags]    Reporte de Presencia: Detalle - Consulta por Nombre - Validar etiquetas en Tabular
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Sleep    1
    Presionar opcion Consultar
    Validar etiquetas en Tabular    ${EmbarcacionP}[Nombre]
    [Teardown]    Close Browser

Reporte de Presencia: Detalle - Consulta por Nombre - Validar resultado en BD
    [Documentation]    Valida que los resultados de la consulta se muestren 
        ...    correctamente contra la Base de datos.
    [Tags]    Reporte de Presencia: Detalle - Consulta por Nombre - Validar resultado en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD    Embarcacion=${EmbarcacionP}[Nombre]    TipoA=${TipoAlerta}[app]    NomZona=${ZonaPacifico}
    [Teardown]    Close Browser

Reporte de Presencia: Detalle - Consulta por Nombre - Posicion Decimal
    [Documentation]    Valida que se muestre correctamente la configuracion
        ...    de Posicion en Decimal al realiza una consulta por Nombre.
    [Tags]    Reporte de Presencia: Detalle - Consulta por Nombre - Posicion Decimal
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Seleccionar Posicion    ${Decimal}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD (posicion Decimal)    Embarcacion=${EmbarcacionP}[Nombre]    TipoA=${TipoAlerta}[app]    NomZona=${ZonaPacifico}
    [Teardown]    Close Browser

Reporte de Presencia: Detalle - Consulta por Nombre - Velocidad MPH
    [Documentation]    Valida que se muestre correctamente la configuracion
        ...    de Velocidad en MPH al realiza una consulta por Nombre.
    [Tags]    Reporte de Presencia: Detalle - Consulta por Nombre - Velocidad MPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Seleccionar Velocidad    ${MPH}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD    Embarcacion=${EmbarcacionP}[Nombre]    TipoA=${TipoAlerta}[app]    NomZona=${ZonaPacifico}    Vel=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.609))    etqVel=MPH
    [Teardown]    Close Browser

Reporte de Presencia: Detalle - Consulta por Nombre - Velocidad KPH
    [Documentation]    Valida que se muestre correctamente la configuracion
        ...    de Velocidad en KPH al realiza una consulta por Nombre.
    [Tags]    Reporte de Presencia: Detalle - Consulta por Nombre - Velocidad KPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Seleccionar Velocidad    ${KPH}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD    Embarcacion=${EmbarcacionP}[Nombre]    TipoA=${TipoAlerta}[app]    NomZona=${ZonaPacifico}    Vel=CONVERT(DECIMAL(5,2),(mcp.Velocidad))    etqVel=KPH
    [Teardown]    Close Browser

Reporte de Presencia: Detalle - Consulta por Nombre - Exportar a Excel
    [Documentation]    Valida que se exporte correctamente el archivo Excel.
    [Tags]    Reporte de Presencia: Detalle - Consulta por Nombre - Exportar a Excel - T599
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Sleep    1
    Presionar opcion Consultar
    Presionar boton Exportar a Excel
    Sleep    5
    Validar archivo de Excel generado    ${DescargaReporteDetalle}
    [Teardown]    Close Browser

#Reporte de Presencia: Detalle - Golfo - Consulta por Nombre - Imprimir
    #[Documentation]    Valida que se imprima correctamente los resultados.
    # ...    Por actualizar, el caso no finaliza al lanzar la ventana de impresion
    #Iniciar sesion
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte Presencia
    #Seleccionar Tipo de Vehiculo    ${Barco}
    #Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    #Seleccionar rango de fechas
    #Seleccionar Tipo de Alerta    ${AvisoZonaProhibida}
    #Seleccionar Zona    ${ZonadeSeguridadI}
    #Sleep    1
    #Presionar opcion Consultar
    #Presionar boton Imprimir
    #Sleep    2
    #Validar ventana de impresion
    #[Teardown]    Close Browser

Reporte de Presencia: Detalle - Consulta por Nombre - Nueva Consulta
    [Documentation]    Valida que permita regresar a la ventana de parametros
        ...    para realizar una Nueva Consulta.
    [Tags]    Reporte de Presencia: Detalle - Consulta por Nombre - Nueva Consulta - 
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Sleep    1
    Presionar opcion Consultar
    Presionar boton Regresar
    Sleep    2
    Validar retorno a ventana de Consulta
    [Teardown]    Close Browser

Reporte de Presencia: Detalle - Consulta por RNP - Validar resultado en BD
    [Documentation]    Valida que se muestre correctamente los resultados 
        ...    de la consulta por RNP contra la Base de datos.
    [Tags]    Reporte de Presencia: Detalle - Consulta por RNP - Validar resultado en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 2, Campo ${EmbarcacionP}[RNP]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD    Embarcacion=${EmbarcacionP}[Nombre]    TipoA=${TipoAlerta}[app]    NomZona=${ZonaPacifico}
    [Teardown]    Close Browser
    
Reporte de Presencia: Detalle - Consulta por Matricula - Validar resultado en BD
    [Documentation]    Valida que se muestre correctamente los resultados 
        ...    de la consulta por Matricula contra la Base de datos.
    [Tags]    Reporte de Presencia: Detalle - Consulta por Matricula - Validar resultado en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 3, Campo ${EmbarcacionP}[Matricula]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD    Embarcacion=${EmbarcacionP}[Nombre]    TipoA=${TipoAlerta}[app]    NomZona=${ZonaPacifico}
    [Teardown]    Close Browser

Reporte de Presencia: Resumen - Consulta por Nombre
    [Documentation]    Valida que se realice correctamente la consulta por Nombre
        ...    seleccionando el Tipo Resumen.
    [Tags]    Reporte de Presencia: Resumen - Consulta por Nombre - T600
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Seleccionar opcion Resumen
    Sleep    1
    Presionar opcion Consultar
    [Teardown]    Close Browser

Reporte de Presencia: Resumen - Consulta por Nombre - Validar etiquetas
    [Documentation]    Valida que se muestren correctamente escritas las etiquetas.
    [Tags]    Reporte de Presencia: Resumen - Consulta por Nombre - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Seleccionar opcion Resumen
    Sleep    1
    Presionar opcion Consultar
    Validar etiquetas - Resumen    ${EmbarcacionP}[Nombre]
    [Teardown]    Close Browser

Reporte de Presencia: Resumen - Consulta por Nombre - Validar resultado en BD
    [Documentation]    Valida que se muestren correctamente los resultados de 
        ...    la consulta por Resumen contra la Base de datos.
    [Tags]    Reporte de Presencia: Resumen - Consulta por Nombre - Validar resultado en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas    ${fechainiY}    ${fechafinY}
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Seleccionar opcion Resumen
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD (Resumen)    Embarcacion=${EmbarcacionP}[Nombre]    TipoA=${TipoAlerta}[app]    NomZona=${ZonaPacifico}
    [Teardown]    Close Browser
        
Reporte de Presencia: Resumen - Consulta por Nombre - Nueva Consulta
    [Documentation]    Valida que permita regresar a la ventana de parametros
        ...    para realizar una Nueva Consulta.
    [Tags]    Reporte de Presencia: Resumen - Consulta por Nombre - Nueva Consulta
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Seleccionar opcion Resumen
    Sleep    1
    Presionar opcion Consultar
    Presionar boton Regresar (resumen)
    Sleep    1
    Validar retorno a ventana de Consulta
    [Teardown]    Close Browser

Reporte de Presencia: Resumen - Consulta por Nombre - Exportar a Excel
    [Documentation]    Valida que exporte correctamente el archivo Excel.
    [Tags]    Reporte de Presencia: Resumen - Consulta por Nombre - Exportar a Excel - T601
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte Presencia
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo    ${Barco}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Zona    ${Zona}
    Seleccionar opcion Resumen
    Sleep    1
    Presionar opcion Consultar
    Presionar boton Exportar a Excel (resumen)
    Sleep    5
    Validar archivo de Excel generado    ${DescargaReporteResumen}
    [Teardown]    Close Browser

#Reporte de Presencia: Resumen - Golfo - Consulta por Nombre - Imprimir
    #Iniciar sesion
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte Presencia
    #Seleccionar Tipo de Vehiculo    ${Barco}
    #Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    #Seleccionar rango de fechas
    #Seleccionar Tipo de Alerta    ${AvisoZonaProhibida}
    #Seleccionar Zona    ${ZonadeSeguridadI}
    #Seleccionar opcion Resumen
    #Sleep    1
    #Presionar opcion Consultar
    #Presionar boton Imprimir (resumen)
    #Sleep    2
    #Validar ventana de impresion
    #[Teardown]    Close Browser

#Reporte de Presencia: Detalle - Pacifico - Consulta por Nombre - Validar resultado en BD
    #[Documentation]    Valida que se muestre correctamente los resultados
    #    ...    contra la Base de datos.
    #[Tags]    Detalle - Pacifico - Consulta por Nombre - Validar resultado en BD
    #Iniciar sesion
    #Sleep    1
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte Presencia
    #Seleccionar Litoral    ${Pacifico}
    #Seleccionar Tipo de Vehiculo    ${Barco}
    #Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    #Seleccionar rango de fechas
    #Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    #Seleccionar Zona    ${VedaPicudosA}
    #Sleep    1
    #Presionar opcion Consultar
    #Sleep    1
    #Validar resultado en BD    Nom=${EmbarcacionP}[Nombre]    TipoA=${TipoAlerta}[app]    Zona=${ZonaPacifico}
    #[Teardown]    Close Browser

#Reporte de Presencia: Detalle - Pacifico - Consulta por RNP - Validar resultado en BD
    #[Documentation]    Valida que se muestre correctamente los resultados de
    #    ...    la consulta por RNP contra la Base de datos.
    #[Tags]    Detalle - Pacifico - Consulta por RNP - Validar resultado en BD
    #Iniciar sesion
    #Sleep    1
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte Presencia
    #Seleccionar Litoral    ${Pacifico}
    #Seleccionar Tipo de Vehiculo    ${Barco}
    #Filtrar Embarcacion por Columna 2, Campo ${EmbarcacionP}[RNP]
    #Seleccionar rango de fechas
    #Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    #Seleccionar Zona    ${VedaPicudosA}
    #Sleep    1
    #Presionar opcion Consultar
    #Sleep    1
    #Validar resultado en BD    Nom=${EmbarcacionP}[Nombre]    TipoA=${TipoAlerta}[app]    Zona=${ZonaPacifico}
    #[Teardown]    Close Browser

#Reporte de Presencia: Detalle - Pacifico - Consulta por Matricula - Validar resultado en BD
    #[Documentation]    Valida que se muestre correctamente los resultados de
    #    ...    la consulta por Matricula contra la Base de datos.
    #[Tags]    Detalle - Pacifico - Consulta por Matricula - Validar resultado en BD
    #Iniciar sesion
    #Sleep    1
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte Presencia
    #Seleccionar Litoral    ${Pacifico}
    #Seleccionar Tipo de Vehiculo    ${Barco}
    #Filtrar Embarcacion por Columna 3, Campo ${EmbarcacionP}[Matricula]
    #Seleccionar rango de fechas
    #Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    #Seleccionar Zona    ${VedaPicudosA}
    #Sleep    1
    #Presionar opcion Consultar
    #Sleep    1
    #Validar resultado en BD    Nom=${EmbarcacionP}[Nombre]    TipoA=${TipoAlerta}[app]    Zona=${ZonaPacifico}
    #[Teardown]    Close Browser

*** Keywords ***
Presionar opcion Reporte Presencia
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/div[3]/div/a[8]
    Click Element    xpath=//*[@id="divPanelControles"]/div[3]/div/a[8]
    Sleep    1
    Switch Window    ${titReportePresencia}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="cboDevExEmbarques"]/div[1]/div/div[1]/input    timeout=60

Validar etiquetas
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/h3    Reporte de Presencia:
    Element Text Should Be    xpath=//*[@id="rdoGpoDevExTipoBusqueda"]/div/div[1]/div[2]    Golfo
    Element Text Should Be    xpath=//*[@id="rdoGpoDevExTipoBusqueda"]/div/div[2]/div[2]    Pacifico
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[2]/div/div[1]/label    Tipo Vehículo
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[3]/div/div[1]/label    Embarcación
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[4]/div/div[1]/label    Fecha Inicial:
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[5]/div/div[1]/label    Fecha Final:
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[6]/div/div[1]/label    Tipo de Alerta
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[7]/div/div[1]/label    Zona
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[8]/div/div[1]/label    Posición
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[9]/div/div[1]/label    Velocidad
    Element Text Should Be    xpath=//*[@id="rdgTipoReporte"]/div/div[1]/div[2]    Detalle
    Element Text Should Be    xpath=//*[@id="rdgTipoReporte"]/div/div[2]/div[2]    Resumen
    Element Text Should Be    xpath=//*[@id="btnAceptar2"]/div/span    Consultar
    
Seleccionar Tipo de Vehiculo
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="cboDevExTipoVehiculo"]/div[1]/div/div[1]/input
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}
    
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

Seleccionar Tipo de Alerta
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="cboTipoAlerta"]/div[1]/div/div[1]/input
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}

Seleccionar Zona
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="cboZona"]/div[1]/div/div[1]/input
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[1]/div    timeout=60
    Deslizar scroll zonas    ${arg1}
    Sleep    1
    Click Element    ${arg1}
    
Deslizar scroll zonas
    [Arguments]    ${arg1}
    ${elemento}=    Evaluate    ${elemento}+14
    Set Test Variable    ${elemento}    ${elemento}
    Sleep    1
    Execute JavaScript    window.document.evaluate('/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${elemento}]/div', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    #${ifExist}=    Run Keyword And Return Status    Element Should Be Visible    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[137]/div
    ${ifExist}=    Run Keyword And Return Status    Element Should Be Visible    ${arg1}
    Run Keyword If    ${ifExist} == False    Deslizar scroll zonas    ${arg1}
    
Seleccionar Posicion
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="cboPosicion"]/div/div/div[1]/input
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}
    
Seleccionar Velocidad
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="cboVelocidad"]/div[1]/div/div[1]/input
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}
    
Presionar opcion Consultar
    Click Element    xpath=//*[@id="btnAceptar2"]/div
    Sleep    2
    Select Frame    xpath=//*[@id="frmTabular"]
    Wait Until Element Is Visible    xpath=//*[@id="divtable"]    timeout=90
    ${date24h}    Get Current Date    result_format=%d/%m/%Y %H:%M
    Set Test Variable    ${date24h}
    
Validar etiquetas en Tabular
    [Arguments]    ${NombreEmb}
    Obtener datos de Embarcacion y Usuario en BD    ${NombreEmb}
    Sleep    1
    ${ttExcel}=    Get Element Attribute    xpath=//*[@id="menu"]/div[2]/button    title
    ${ttImprimir}=    Get Element Attribute    xpath=//*[@id="menu"]/div[3]/button    title
    ${ttRegresar}=    Get Element Attribute    xpath=//*[@id="menu"]/div[4]/button    title
    Should be equal    ${ttExcel}    Exportar a Excel
    Should be equal    ${ttImprimir}    Imprimir
    Should be equal    ${ttRegresar}    Regresar
    ${Rango}=    Catenate    Rango del Reporte: ${fechaini} al ${fechafin}
    ${UserImp}=    Get Text    xpath=//*[@id="divRango"]/p[2]
    ${UsuarioImp}=    Execute Javascript    cadena='${UserImp}'; return cadena.slice(0,-3);
    ${Embarcacion}=    Catenate    Embarcaci\u00F3n: ${Nombre} Matr\u00EDcula: ${Matricula}
    ${RazonSocial}=    Catenate    Raz\u00F3n Social: ${RazonSocial}
    Element Text Should Be    //*[@id="headerRigth"]/h2    conapesca.gob.mx
    Element Text Should Be    //*[@id="banner"]/h3    Sistema de Localizaci\u00F3n y Monitoreo de Embarcaciones Pesqueras
    Element Text Should Be    //*[@id="divRango"]/p[1]    ${Rango}
    Should be equal    ${UsuarioImp}    Usuario: ${credenciales}[usuario]. Impreso el ${date24h}
    Element Text Should Be    //*[@id="divRango"]/h3    Reporte de Presencia y Reincidencia de Zona
    Element Text Should Be    //*[@id="divtable"]/p[1]    ${Embarcacion}
    Element Text Should Be    //*[@id="divtable"]/p[2]    ${RazonSocial}
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tr[1]/td[1]    Orden
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tr[1]/td[2]    Fecha
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tr[1]/td[3]    Latitud
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tr[1]/td[4]    Longitud
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tr[1]/td[5]    Rumbo
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tr[1]/td[6]    Velocidad
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tr[1]/td[7]    Estatus
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tr[1]/td[8]    Referencia
    Element Text Should Be    //*[@id="pBottom"]    Comisi\u00F3n Nacional de Acuacultura y Pesca, M\u00E9xico - Algunos derechos reservados \u00A9 2014
    Element Text Should Be    //*[@id="pTop"]    Av. Camar\u00F3n S\u00E1balo S/N Esq. Tibur\u00F3n, Fracc. S\u00E1balo Country Club, C.P. 82100 Mazatl\u00E1n, Sin. Mex. Tel. 01-800-6674-022

Obtener datos de Embarcacion y Usuario en BD
    [Arguments]    ${Embarcacion}
    Conexion a Base de datos
    @{queryResults}=    Query    select v.Nombre, v.RNP, v.Matricula, rs.Descripcion from Sismep.TSismepVehiculos v join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial where v.Nombre = '${Embarcacion}'
    @{queryUsuario}=    Query    select Nombre from aspnet_Users where UserName = '${credenciales}[usuario]'
    Set Test Variable    ${Nombre}    ${queryResults[0][0]}
    Set Test Variable    ${RNP}    ${queryResults[0][1]}
    Set Test Variable    ${Matricula}    ${queryResults[0][2]}
    Set Test Variable    ${RazonSocial}    ${queryResults[0][3]}
    Set Test Variable    ${Usuario}    ${queryUsuario[0][0]}
    Disconnect From Database

Validar resultado en BD
    [Arguments]    ${Embarcacion}    ${TipoA}    ${NomZona}    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Conexion a Base de Datos
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table").rows.length -1;
    #@{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' CROSS APPLY dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona join Sismep.TSismepEstatusMensajes em on mcp.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${Embarcacion}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' and z.Descripcion='${NomZona}'
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' CROSS APPLY dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona join Sismep.TSismepEstatusMensajes em on mcp.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepAlertasConfirmadas ac on mcp.IdMensajeM = ac.IdMensaje where v.Nombre = '${Embarcacion}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' and z.Descripcion='${NomZona}'
    Should be equal    ${queryRows[0][0]}    ${rows}
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table/tr[2]/td[2]
    ${Latitud}=    Get text    xpath=//*[@id="divtable"]/table/tr[2]/td[3]
    ${Longitud}=    Get text    xpath=//*[@id="divtable"]/table/tr[2]/td[4]
    ${Rumbo}=    Get text    xpath=//*[@id="divtable"]/table/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table/tr[2]/td[6]
    ${Estatus}=    Get text    xpath=//*[@id="divtable"]/table/tr[2]/td[7]
    ${Referencia}=    Get text    xpath=//*[@id="divtable"]/table/tr[2]/td[8]
    #@{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), mcp.Latitud, mcp.Longitud, mcp.Rumbo, ${Vel}, em.Descripcion, z.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' CROSS APPLY dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona join Sismep.TSismepEstatusMensajes em on mcp.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${Embarcacion}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' and z.Descripcion='${NomZona}' order by mcp.FechaRecepcionUnitrac desc
    @{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), mcp.Latitud, mcp.Longitud, mcp.Rumbo, ${Vel}, em.Descripcion, z.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' CROSS APPLY dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona join Sismep.TSismepEstatusMensajes em on mcp.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepAlertasConfirmadas ac on mcp.IdMensajeM = ac.IdMensaje where v.Nombre = '${Embarcacion}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' and z.Descripcion='${NomZona}' order by mcp.FechaRecepcionUnitrac
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
    Should be equal    ${queryResults[0][6]}    ${Estatus}
    Should be equal    ${queryResults[0][7]}    ${Referencia}
    Disconnect From Database

Validar resultado en BD (posicion Decimal)
    [Arguments]    ${Embarcacion}    ${TipoA}    ${NomZona}    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Conexion a Base de Datos
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table").rows.length -1;
    #@{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' CROSS APPLY dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona join Sismep.TSismepEstatusMensajes em on mcp.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${Embarcacion}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' and z.Descripcion='${NomZona}'
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' CROSS APPLY dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona join Sismep.TSismepEstatusMensajes em on mcp.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepAlertasConfirmadas ac on mcp.IdMensajeM = ac.IdMensaje where v.Nombre = '${Embarcacion}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' and z.Descripcion='${NomZona}'
    Should be equal    ${queryRows[0][0]}    ${rows}
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table/tr[2]/td[2]
    ${Lat}=    Get text    xpath=//*[@id="divtable"]/table/tr[2]/td[3]
    ${Latitud}=    Convert to Number    ${Lat}
    ${Lon}=    Get text    xpath=//*[@id="divtable"]/table/tr[2]/td[4]
    ${Longitud}=    Convert to Number    ${Lon}
    ${Rumbo}=    Get text    xpath=//*[@id="divtable"]/table/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table/tr[2]/td[6]
    ${Estatus}=    Get text    xpath=//*[@id="divtable"]/table/tr[2]/td[7]
    ${Referencia}=    Get text    xpath=//*[@id="divtable"]/table/tr[2]/td[8]
    #@{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), round(mcp.Latitud, 7), round(mcp.Longitud, 7), mcp.Rumbo, ${Vel}, em.Descripcion, z.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' CROSS APPLY dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona join Sismep.TSismepEstatusMensajes em on mcp.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo where v.Nombre = '${Embarcacion}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' and z.Descripcion='${NomZona}' order by mcp.FechaRecepcionUnitrac desc
    @{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), round(mcp.Latitud, 7), round(mcp.Longitud, 7), mcp.Rumbo, ${Vel}, em.Descripcion, z.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' CROSS APPLY dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona join Sismep.TSismepEstatusMensajes em on mcp.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepAlertasConfirmadas ac on mcp.IdMensajeM = ac.IdMensaje where v.Nombre = '${Embarcacion}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' and z.Descripcion='${NomZona}' order by mcp.FechaRecepcionUnitrac
    ${FechaBD}=    Execute Javascript    cadena='${queryResults[0][1]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3;
    ${RumboBD}=    Catenate    ${queryResults[0][4]}\u00B0
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} ${etqVel}
    Should be equal    ${FechaBD}    ${Fecha}
    Should be equal    ${queryResults[0][2]}    ${Latitud}
    Should be equal    ${queryResults[0][3]}    ${Longitud}
    Should be equal    ${RumboBD}    ${Rumbo}
    Should be equal    ${VelocidadBD}    ${Velocidad}
    Should be equal    ${queryResults[0][6]}    ${Estatus}
    Should be equal    ${queryResults[0][7]}    ${Referencia}
    Disconnect From Database

Validar resultado en BD (TODAS)
    [Arguments]    ${Litoral}    ${TipoA}    ${NomZona}    ${Vel}=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.852))    ${etqVel}=Nudos
    Obtener el nombre de la primer embarcacion en el tabular
    Conexion a Base de Datos
    ${totalEmb}=    Execute JavaScript    return document.getElementsByClassName("CSSTableGenerator").length;
    #@{totalEmbBD}    Query    select count(distinct(v.Nombre)) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' CROSS APPLY dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona join Sismep.TSismepEstatusMensajes em on mcp.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and d.DescripcionCorta = '${Litoral}' and em.Descripcion = '${TipoA}' and z.Descripcion = '${NomZona}'
    @{totalEmbBD}    Query    select count(distinct(v.Nombre)) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' CROSS APPLY dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona join Sismep.TSismepEstatusMensajes em on mcp.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle join Sismep.TSismepAlertasConfirmadas ac on mcp.IdMensajeM = ac.IdMensaje where mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and d.DescripcionCorta = '${Litoral}' and em.Descripcion = '${TipoA}' and z.Descripcion = '${NomZona}'
    Should be equal    ${totalEmbBD[0][0]}    ${totalEmb}
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table:nth-child(3)").rows.length -1;
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' CROSS APPLY dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona join Sismep.TSismepEstatusMensajes em on mcp.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepAlertasConfirmadas ac on mcp.IdMensajeM = ac.IdMensaje where v.Nombre = '${NombreEmb}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' and z.Descripcion='${NomZona}'
    Should be equal    ${queryRows[0][0]}    ${rows}
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table[1]/tr[2]/td[2]
    ${Latitud}=    Get text    xpath=//*[@id="divtable"]/table[1]/tr[2]/td[3]
    ${Longitud}=    Get text    xpath=//*[@id="divtable"]/table[1]/tr[2]/td[4]
    ${Rumbo}=    Get text    xpath=//*[@id="divtable"]/table[1]/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table[1]/tr[2]/td[6]
    ${Estatus}=    Get text    xpath=//*[@id="divtable"]/table[1]/tr[2]/td[7]
    ${Referencia}=    Get text    xpath=//*[@id="divtable"]/table[1]/tr[2]/td[8]
    @{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, mcp.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), mcp.Latitud, mcp.Longitud, mcp.Rumbo, ${Vel}, em.Descripcion, z.Descripcion from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' CROSS APPLY dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona join Sismep.TSismepEstatusMensajes em on mcp.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepAlertasConfirmadas ac on mcp.IdMensajeM = ac.IdMensaje where v.Nombre = '${NombreEmb}' and mcp.FechaRecepcionUnitrac between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' and z.Descripcion='${NomZona}' order by mcp.FechaRecepcionUnitrac desc
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
    Should be equal    ${queryResults[0][6]}    ${Estatus}
    Should be equal    ${queryResults[0][7]}    ${Referencia}
    Disconnect From Database
    
Validar resultado en BD (Resumen)
    [Arguments]    ${Embarcacion}    ${TipoA}    ${NomZona}
    Conexion a Base de Datos
    ${Nombre}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[1]
    ${PuertoBase}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[2]
    ${RNP}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[3]
    ${Ene}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[4]
    ${Enero}=    Convert To Integer    ${Ene}
    ${Feb}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[5]
    ${Febrero}=    Convert To Integer    ${Feb}
    ${Mar}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[6]
    ${Marzo}=    Convert To Integer    ${Mar}
    ${Abr}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[7]
    ${Abril}=    Convert To Integer    ${Abr}
    ${May}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[8]
    ${Mayo}=    Convert To Integer    ${May}
    ${Jun}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[9]
    ${Junio}=    Convert To Integer    ${Jun}
    ${Jul}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[10]
    ${Julio}=    Convert To Integer    ${Jul}
    ${Ago}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[11]
    ${Agosto}=    Convert To Integer    ${Ago}
    ${Sep}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[12]
    ${Septiembre}=    Convert To Integer    ${Sep}
    ${Oct}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[13]
    ${Octubre}=    Convert To Integer    ${Oct}
    ${Nov}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[14]
    ${Noviembre}=    Convert To Integer    ${Nov}
    ${Dic}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[15]
    ${Diciembre}=    Convert To Integer    ${Dic}
    ${Tot}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[16]
    ${Total}=    Convert To Integer    ${Tot}
    #@{queryResults}    Query    SET LANGUAGE Spanish; select Nombre, Descripcion, RNP, isnull(Enero,0) [Enero], isnull(Febrero,0) [Febrero], isnull(Marzo,0) [Marzo], isnull(Abril,0) [Abril], isnull(Mayo,0) [Mayo], isnull(Junio,0) [Junio], isnull(Julio,0) [Julio], isnull(Agosto,0) [Agosto], isnull(Septiembre,0) [Septiembre], isnull(Octubre,0) [Octubre], isnull(Noviembre,0) [Noviembre], isnull(Diciembre,0) [Diciembre] from (select v.Nombre, l.Descripcion, v.RNP, datename(month, mcp.FechaRecepcionUnitrac) [Mes], count(1) [Registros] from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' CROSS APPLY dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona join Sismep.TSismepEstatusMensajes em on mcp.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepLocalidades l on v.IdLocalidad = l.IdLocalidad where v.Nombre='${Embarcacion}' and mcp.FechaRecepcionUnitrac between '${fechainiUTCY}' and '${fechafinUTCY}' and em.Descripcion = '${TipoA}' and z.Descripcion='${NomZona}' group by v.Nombre, l.Descripcion, v.RNP, datename(month, mcp.FechaRecepcionUnitrac)) as RegistrosxMes pivot (sum([Registros]) FOR Mes IN ([Enero],[Febrero],[Marzo],[Abril],[Mayo],[Junio],[Julio],[Agosto],[Septiembre],[Octubre],[Noviembre],[Diciembre])) as PivotRegistrosxMes
    @{queryResults}    Query    SET LANGUAGE Spanish; select Nombre, Descripcion, RNP, isnull(Enero,0) [Enero], isnull(Febrero,0) [Febrero], isnull(Marzo,0) [Marzo], isnull(Abril,0) [Abril], isnull(Mayo,0) [Mayo], isnull(Junio,0) [Junio], isnull(Julio,0) [Julio], isnull(Agosto,0) [Agosto], isnull(Septiembre,0) [Septiembre], isnull(Octubre,0) [Octubre], isnull(Noviembre,0) [Noviembre], isnull(Diciembre,0) [Diciembre] from (select v.Nombre, l.Descripcion, v.RNP, datename(month, DATEADD(HH, -6, mcp.FechaRecepcionUnitrac)) [Mes], count(1) [Registros] from Sismep.TSismepMensajesMCortoPlazo mcp join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' CROSS APPLY dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona join Sismep.TSismepEstatusMensajes em on mcp.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepVehiculos v on mcp.IdVehiculo = v.IdVehiculo join Sismep.TSismepLocalidades l on v.IdLocalidad = l.IdLocalidad join Sismep.TSismepAlertasConfirmadas ac on mcp.IdMensajeM = ac.IdMensaje where v.Nombre='${Embarcacion}' and mcp.FechaRecepcionUnitrac between '${fechainiUTCY}' and '${fechafinUTCY}' and em.Descripcion = '${TipoA}' and z.Descripcion='${NomZona}' group by v.Nombre, l.Descripcion, v.RNP, datename(month, DATEADD(HH, -6, mcp.FechaRecepcionUnitrac))) as RegistrosxMes pivot (sum([Registros]) FOR Mes IN ([Enero],[Febrero],[Marzo],[Abril],[Mayo],[Junio],[Julio],[Agosto],[Septiembre],[Octubre],[Noviembre],[Diciembre])) as PivotRegistrosxMes
    ${TotalBD}=    Evaluate    ${queryResults[0][3]}+${queryResults[0][4]}+${queryResults[0][5]}+${queryResults[0][6]}+${queryResults[0][7]}+${queryResults[0][8]}+${queryResults[0][9]}+${queryResults[0][10]}+${queryResults[0][11]}+${queryResults[0][12]}+${queryResults[0][13]}+${queryResults[0][14]}
    Should be equal    ${queryResults[0][0]}    ${Nombre}
    Should be equal    ${queryResults[0][1]}    ${PuertoBase}
    Should be equal    ${queryResults[0][2]}    ${RNP}
    Should be equal    ${queryResults[0][3]}    ${Enero}
    Should be equal    ${queryResults[0][4]}    ${Febrero}
    Should be equal    ${queryResults[0][5]}    ${Marzo}
    Should be equal    ${queryResults[0][6]}    ${Abril}
    Should be equal    ${queryResults[0][7]}    ${Mayo}
    Should be equal    ${queryResults[0][8]}    ${Junio}
    Should be equal    ${queryResults[0][9]}    ${Julio}
    Should be equal    ${queryResults[0][10]}    ${Agosto}
    Should be equal    ${queryResults[0][11]}    ${Septiembre}
    Should be equal    ${queryResults[0][12]}    ${Octubre}
    Should be equal    ${queryResults[0][13]}    ${Noviembre}
    Should be equal    ${queryResults[0][14]}    ${Diciembre}
    Should be equal    ${TotalBD}    ${Total}
    Disconnect From Database
    
# Presionar boton Exportar a Excel
#     Wait Until Element Is Visible    xpath=//*[@id="menu"]/div[2]/button
#     Click Element    xpath=//*[@id="menu"]/div[2]/button

# Validar archivo Excel generado
#     [Arguments]    ${arg1}
#     File Should Exist   ${arg1}
    
# Presionar boton Imprimir
#     Wait Until Element Is Visible    xpath=//*[@id="menu"]/div[3]/button
#     Click Element    xpath=//*[@id="menu"]/div[3]/button

# Validar ventana de impresion
#     Wait Until Element Is Visible    xpath=//*[@id="sidebar"]//print-preview-button-strip//div/cr-button[1]
#     Element Should Be Visible    xpath=//*[@id="plugin"]
    
# Presionar boton Nueva Consulta
#     Wait Until Element Is Visible    xpath=//*[@id="menu"]/div[4]/button
#     Click Element    xpath=//*[@id="menu"]/div[4]/button

Validar retorno a ventana de Consulta
    Unselect Frame
    Element Should Be Visible    xpath=//*[@id="btnAceptar2"]/div

Seleccionar opcion Resumen
    Click Element    xpath=//*[@id="rdgTipoReporte"]/div/div[2]/div[1]/div

Validar etiquetas - Resumen
    [Arguments]    ${NombreEmb}
    Obtener datos de Embarcacion y Usuario en BD    ${NombreEmb}
    Sleep    1
    ${ttExcel}=    Get Element Attribute    xpath=//*[@id="menu"]/div[2]/button    title
    ${ttImprimir}=    Get Element Attribute    xpath=//*[@id="menu"]/div[3]/button    title
    ${ttRegresar}=    Get Element Attribute    xpath=//*[@id="menu"]/div[4]/button    title
    Should be equal    ${ttExcel}    Exportar a Excel
    Should be equal    ${ttImprimir}    Imprimir
    Should be equal    ${ttRegresar}    Regresar
    ${Rango}=    Catenate    Rango del Reporte: ${fechaini} al ${fechafin}
    ${UserImp}=    Get Text    xpath=//*[@id="divRango"]/p[2]
    ${UsuarioImp}=    Execute Javascript    cadena='${UserImp}'; return cadena.slice(0,-3);
    Element Text Should Be    //*[@id="headerRigth"]/h2    conapesca.gob.mx
    Element Text Should Be    //*[@id="banner"]/h3    Sistema de Localizaci\u00F3n y Monitoreo de Embarcaciones Pesqueras
    Element Text Should Be    //*[@id="divRango"]/p[1]    ${Rango}
    Should be equal    ${UsuarioImp}    Usuario: ${credenciales}[usuario]. Impreso el ${date24h}
    Element Text Should Be    //*[@id="divRango"]/h3    Reporte de Presencia en Zona
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[1]    Nombre
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[2]    Puerto Base
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[3]    RNP
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[4]    Enero
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[5]    Febrero
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[6]    Marzo
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[7]    Abril
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[8]    Mayo
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[9]    Junio
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[10]    Julio
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[11]    Agosto
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[12]    Septiembre
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[13]    Octubre
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[14]    Noviembre
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[15]    Diciembre
    Element Text Should Be    xpath=//*[@id="divtable"]/table/tbody/tr[1]/td[16]    Total
    Element Text Should Be    //*[@id="pBottom"]    Comisi\u00F3n Nacional de Acuacultura y Pesca, M\u00E9xico - Algunos derechos reservados \u00A9 2014
    Element Text Should Be    //*[@id="pTop"]    Av. Camar\u00F3n S\u00E1balo S/N Esq. Tibur\u00F3n, Fracc. S\u00E1balo Country Club, C.P. 82100 Mazatl\u00E1n, Sin. Mex. Tel. 01-800-6674-022

Presionar boton Exportar a Excel (resumen)
    Wait Until Element Is Visible    xpath=//*[@id="menu"]/div[2]/button
    Click Element     xpath=//*[@id="menu"]/div[2]/button

Presionar boton Imprimir (resumen)
    Wait Until Element Is Visible    xpath=//*[@id="menu"]/div[3]/button
    Click Element     xpath=//*[@id="menu"]/div[3]/button

Presionar boton Regresar (resumen)
    Wait Until Element Is Visible    xpath=//*[@id="menu"]/div[4]/button
    Click Element     xpath=//*[@id="menu"]/div[4]/button
    
Seleccionar Litoral
    [Arguments]    ${arg1}
    Click Element    ${arg1}

Validar campos requeridos
    Validar mensaje    3    Favor de ingresar los filtros del reporte.
    ${TipoAlerta}=    Get Element Attribute    xpath=//*[@id="cboTipoAlerta"]    textContent
    ${attrTipoAlerta}    Execute Javascript    cadena='${TipoAlerta}'; return cadena.substr(length-12);
    Should be equal    ${attrTipoAlerta}    Obligatorio
    ${Zona}=    Get Element Attribute    xpath=//*[@id="cboZona"]    textContent
    ${attrZona}    Execute Javascript    cadena='${Zona}'; return cadena.substr(length-12);
    Should be equal    ${attrZona}    Obligatorio

# Validar mensaje
#     [Arguments]    ${arg1}
#     Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div
#     Element Text Should Be    xpath=/html/body/div[3]/div/div/div[2]    ${arg1}

Presionar opcion Consultar (obligatorios)
    Click Element    xpath=//*[@id="btnAceptar2"]/div
    
Obtener el nombre de la primer embarcacion en el tabular
    ${NombreEmb}    Get text    xpath=//*[@id="divtable"]/p[1]/b[1]
    Set Test Variable    ${NombreEmb}