*** Settings ***
Resource    Recursos.Reportes.robot

*** Variables ***
&{EmbarcacionG}       Nombre=DON NENE    RNP=00079913    Matricula=2702282123-7
&{EmbarcacionP}    Nombre=LELY I    RNP=00100891    Matricula=26013179237
${titAlertas}     title=Sismep - Alertas
${fechaini}       30/09/2022 00:00:00
${fechafin}       30/09/2022 23:59:59
${fechainiUTC}    20220930 07:00:00
${fechafinUTC}    20221001 07:00:00
${Golfo}    xpath=//*[@id="rdoGpoDevExTipoBusqueda"]/div/div[1]/div[1]/div
${Pacifico}    xpath=//*[@id="rdoGpoDevExTipoBusqueda"]/div/div[2]/div[1]/div
&{TipoAlerta}    app=Aviso Pesca Prohibida    azp=Aviso Zona Prohibida
${AvisoPescaProhibida}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[1]/div
${AvisoZonaProhibida}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div
${Emergencia}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[3]/div
${PescaProhibida}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[4]/div
${ZonaDecreto}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[5]/div
${ZonaProhibida}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[6]/div
${DMS}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[1]/div
${Decimal}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div
${Nudos}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[1]/div
${MPH}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div
${KPH}    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[3]/div
${DescargaReporte}    C:/Users/mmorales/Downloads/ReporteAlertas.xlsx

*** Test Cases ***
Reporte de Alertas: Validar etiquetas
    [Documentation]    Valida que se muestre correctamente escritas las etiquetas.
    [Tags]    Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser

Reporte de Alertas: Filtro Tipo de Alerta Obligatorio
    [Documentation]    Al no seleccionar un tipo de Alerta debera de mostrar un mensaje de validacion.
    [Tags]    Filtro Tipo de Alerta Obligatorio - T1071
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar filtros requeridos
    [Teardown]    Close Browser
    
Reporte de Alertas: Validacion rango de fechas
    [Documentation]    Valida que la fecha inicial sea menor a la fecha final.
    [Tags]    Validacion rango de fechas - T1146
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar rango de fechas    ${fechafin}    ${fechaini}
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    3    Fecha Inicial debe ser menor a la Fecha Final.
    [Teardown]    Close Browser
    
Reporte de Alertas: Validacion Fecha Inicial y Final en blanco
    [Documentation]    Validar que muestre una validacion al dejar los campos de Fecha inicial y final en blanco.
    [Tags]    Validacion Fecha Inicial y Final en blanco
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar rango de fechas    ${EMPTY}    ${EMPTY}
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    3    Favor de completar los campos Fecha Inicial y Fecha Final.
    [Teardown]    Close Browser
    
Reporte de Alertas: Consulta sin resultados - Validar mensaje
    [Documentation]    Valida que muestre una validacion cuando la consulta no tenga resultados.
    [Tags]    Consulta sin resultados - Validar mensaje - T545
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar Tipo de Alerta    ${ZonaProhibida}
    Sleep    1
    Presionar opcion Consultar (obligatorios)
    Validar mensaje    3    La consulta no produjo resultados
    [Teardown]    Close Browser
    
Reporte de Alertas: Validar combo de embarcaciones
    [Documentation]    Valida que al estar activo el check de litoral Golfo el combo de embarcaciones no muestra embarcaciones del Pacifico
    ...    Pendiente validar por IRLANDA
    [Tags]    Reporte de Alertas: Validar combo de embarcaciones
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    #Seleccionar Litoral    ${Pacifico}
    #Seleccionar Litoral    ${Golfo}
    Filtrar Embarcacion Sin resultado    ${EmbarcacionP}[Nombre]
    Sleep    1
    Validar Embarcacion Sin Resultado
    [Teardown]    Close Browser

Reporte de Alertas: - Consulta por TODAS las embarcaciones
    [Documentation]    Valida que se realice correctamente la consulta por todas las embarcaciones.
    [Tags]    Reporte de Alertas: - Consulta por TODAS las embarcaciones
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar Litoral    ${Pacifico}
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD (TODAS)    Pacifico    ${TipoAlerta}[app]
    [Teardown]    Close Browser
    
Reporte de Alertas: - Consulta por Nombre
    [Documentation]    Valida que se realice correctamente la cosnulta por Nombre.
    [Tags]    Reporte de Alertas: - Consulta por Nombre - T553
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Sleep    1
    Presionar opcion Consultar
    [Teardown]    Close Browser

Reporte de Alertas: - Consulta por Nombre - Validar etiquetas en tabular
    [Documentation]    Valida que las etiquetas se muestre correctamente escritas en el tabular.
    ...    Pendiente definir si se utiliza el username o el nombre
    [Tags]    Reporte de Alertas: - Consulta por Nombre - Validar etiquetas en tabular
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar etiquetas en Tabular    ${EmbarcacionP}[Nombre]
    [Teardown]    Close Browser

Reporte de Alertas: - Consulta por Nombre - Validar etiquetas en tabular - Orden de los filtros
    [Documentation]    Valida que las etiquetas se muestre correctamente escritas en el tabular.
    ...    Pendiente validar por IRLANDA
    [Tags]    Reporte de Alertas: - Consulta por Nombre - Validar etiquetas en tabular
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar Litoral    ${Pacifico}
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar Tipo de Vehiculo
    Validar campo Embarcacion restablecido
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar etiquetas en Tabular    ${EmbarcacionP}[Nombre]
    [Teardown]    Close Browser

Reporte de Alertas: - Consulta por Nombre - Validar resultado en BD
    [Documentation]    Valida que los resultados mostrados en la consulta sean correctos.
    [Tags]    Reporte de Alertas: - Consulta por Nombre - Validar resultado en BD - T559
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD    ${EmbarcacionP}[Nombre]    ${TipoAlerta}[app]
    [Teardown]    Close Browser
    
Reporte de Alertas: - Consulta por Nombre - Posicion Decimal
    [Documentation]    Valida que respete correctamente la configuracion mostrando la Posicion en Decimal.
    [Tags]    Reporte de Alertas: - Consulta por Nombre - Posicion Decimal
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Posicion    ${Decimal}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD (posicion Decimal)    ${EmbarcacionP}[Nombre]    ${TipoAlerta}[app]
    [Teardown]    Close Browser
    
Reporte de Alertas: - Consulta por Nombre - Velocidad MPH
    [Documentation]    Valida que respete correctamente la configuracion mostrando la Velocidad en MPH. 
    [Tags]    Reporte de Alertas: - Consulta por Nombre - Velocidad MPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Velocidad    ${MPH}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD    ${EmbarcacionP}[Nombre]    ${TipoAlerta}[app]    Vel=CONVERT(DECIMAL(5,2),(mcp.Velocidad / 1.609))    etqVel=MPH
    [Teardown]    Close Browser
    
Reporte de Alertas: - Consulta por Nombre - Velocidad KPH
    [Documentation]    Valida que respete correctamente la configuracion mostrando la Velocidad en KPH.
    [Tags]    Reporte de Alertas: - Consulta por Nombre - Velocidad KPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Seleccionar Velocidad    ${KPH}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD    ${EmbarcacionP}[Nombre]    ${TipoAlerta}[app]    Vel=CONVERT(DECIMAL(5,2),(mcp.Velocidad))    etqVel=KPH
    [Teardown]    Close Browser
    
Reporte de Alertas: - Consulta por Nombre - Exportar a Excel
    [Documentation]    Valida que se exporte correctamente el archivo Excel.
    [Tags]    Reporte de Alertas: - Consulta por Nombre - Exportar a Excel - T560
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Sleep    1
    Presionar opcion Consultar
    Presionar boton Exportar a Excel
    Sleep    5
    Validar archivo de Excel generado    ${DescargaReporte}
    [Teardown]    Close Browser

#Reporte de Alertas: Golfo - Consulta por Nombre - Imprimir
    #[Documentation]    Valida que se imprima correctamente el tabular.
    #...    Por actualizar, el caso no finaliza al lanzar la ventana de impresion
    #[Tags]    Golfo - Consulta por Nombre - Imprimir
    #Iniciar sesion
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte de Alertas
    #Seleccionar Tipo de Vehiculo
    #Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionG}[Nombre]
    #Seleccionar rango de fechas
    #Seleccionar Tipo de Alerta    ${AvisoZonaProhibida}
    #Sleep    1
    #Presionar opcion Consultar
    #Presionar boton Imprimir
    #Sleep    2
    #Validar ventana de impresion
    #[Teardown]    Close Browser

Reporte de Alertas: - Consulta por Nombre - Nueva consulta
    [Documentation]    Valida que al realizar una consulta, permita regresar a la ventana para realizar una Nueva Consulta.
    [Tags]    Reporte de Alertas: - Consulta por Nombre - Nueva consulta
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo
    Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Sleep    1
    Presionar opcion Consultar
    Presionar boton Regresar
    Sleep    2
    Validar retorno a ventana de Consulta
    [Teardown]    Close Browser

Reporte de Alertas: - Consulta por RNP - Validar resultado en BD
    [Documentation]    Valida que los resultados mostrados coincidan con los almacenados en la Base de datos.
    [Tags]    Reporte de Alertas: - Consulta por RNP - Validar resultado en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo
    Filtrar Embarcacion por Columna 2, Campo ${EmbarcacionP}[RNP]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD    ${EmbarcacionP}[Nombre]    ${TipoAlerta}[app]
    [Teardown]    Close Browser

Reporte de Alertas: - Consulta por Matricula - Validar resultado en BD
    [Documentation]    Valida que los resultados mostrados coincidan con los almacenados en la Base de datos.
    [Tags]    Reporte de Alertas: - Consulta por Matricula - Validar resultado en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Reportes
    Presionar opcion Reporte de Alertas
    Seleccionar Litoral    ${Pacifico}
    Seleccionar Tipo de Vehiculo
    Filtrar Embarcacion por Columna 3, Campo ${EmbarcacionP}[Matricula]
    Seleccionar rango de fechas
    Seleccionar Tipo de Alerta    ${AvisoPescaProhibida}
    Sleep    1
    Presionar opcion Consultar
    Sleep    1
    Validar resultado en BD    ${EmbarcacionP}[Nombre]    ${TipoAlerta}[app]
    [Teardown]    Close Browser

#Reporte de Alertas: Pacifico - Consulta por TODAS las embarcaciones
    #[Documentation]    Validar...
    #[Tags]    Pacifico - Consulta por TODAS las embarcaciones
    #Iniciar sesion
    #Sleep    1
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte de Alertas
    #Seleccionar Litoral Pacifico
    #Seleccionar rango de fechas
    #Seleccionar Tipo de Alerta    ${AvisoZonaProhibida}
    #Sleep    1
    #Presionar opcion Consultar
    #Sleep    1
    #Validar resultado en BD (TODAS)    Litoral=Pacifico    TipoA=${TipoAlerta}[azp]
    #[Teardown]    Close Browser
    
#Reporte de Alertas: Pacifico - Consulta por Nombre - Validar resultado en BD
    #[Documentation]    Valida ...
    #[Tags]    Pacifico - Consulta por Nombre - Validar resultado en BD
    #Iniciar sesion
    #Sleep    1
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte de Alertas
    #Seleccionar Litoral Pacifico
    #Seleccionar Tipo de Vehiculo
    #Filtrar Embarcacion por Columna 1, Campo ${EmbarcacionP}[Nombre]
    #Seleccionar rango de fechas
    #Seleccionar Tipo de Alerta    ${AvisoZonaProhibida}
    #Sleep    1
    #Presionar opcion Consultar
    #Sleep    1
    #Validar resultado en BD    Nom=${EmbarcacionP}[Nombre]    TipoA=${TipoAlerta}[azp]
    #[Teardown]    Close Browser

#Reporte de Alertas: Pacifico - Consulta por RNP - Validar resultado en BD
    #[Documentation]    Valida ...
    #[Tags]    Pacifico - Consulta por RNP - Validar resultado en BD
    #Iniciar sesion
    #Sleep    1
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte de Alertas
    #Seleccionar Litoral Pacifico
    #Seleccionar Tipo de Vehiculo
    #Filtrar Embarcacion por Columna 2, Campo ${EmbarcacionP}[RNP]
    #Seleccionar rango de fechas
    #Seleccionar Tipo de Alerta    ${AvisoZonaProhibida}
    #Sleep    1
    #Presionar opcion Consultar
    #Sleep    1
    #Validar resultado en BD    Nom=${EmbarcacionP}[Nombre]    TipoA=${TipoAlerta}[azp]
    #[Teardown]    Close Browser

#Reporte de Alertas: Pacifico - Consulta por Matricula - Validar resultado en BD
    #[Documentation]    Valida ...
    #[Tags]    Pacifico - Consulta por Matricula - Validar resultado en BD
    #Iniciar sesion
    #Sleep    1
    #Ingresar a opcion Monitoreo
    #Presionar opcion Reportes
    #Presionar opcion Reporte de Alertas
    #Seleccionar Litoral Pacifico
    #Seleccionar Tipo de Vehiculo
    #Filtrar Embarcacion por Columna 3, Campo ${EmbarcacionP}[Matricula]
    #Seleccionar rango de fechas
    #Seleccionar Tipo de Alerta    ${AvisoZonaProhibida}
    #Sleep    1
    #Presionar opcion Consultar
    #Sleep    1
    #Validar resultado en BD    Nom=${EmbarcacionP}[Nombre]    TipoA=${TipoAlerta}[azp]
    #[Teardown]    Close Browser
    
*** Keywords ***
Presionar opcion Reporte de Alertas
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/div[3]/div/a[3]
    Click Element    xpath=//*[@id="divPanelControles"]/div[3]/div/a[3]
    Sleep    1
    Switch Window    ${titAlertas}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="cboDevExEmbarques"]/div[1]/div/div[1]/input    timeout=60

Seleccionar Tipo de Vehiculo
    Click Element    xpath=//*[@id="cboDevExTipoVehiculo"]/div[1]/div/div[1]/input
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[1]/div
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[1]/div

Filtrar Embarcacion por Columna ${COL}, Campo ${CAMPO}
    Click Element    xpath=//*[@id="cboDevExEmbarques"]/div[1]/div/div[1]/input
    Sleep    1
    Input Text    xpath=//*[@id="cboDevExEmbarques_template"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    Sleep    1
    Click Element    xpath=//*[@id="cboDevExEmbarques_template"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[${COL}]

Filtrar Embarcacion Sin resultado
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="cboDevExEmbarques"]/div[1]/div/div[1]/input
    Sleep    1
    Input Text    xpath=//*[@id="cboDevExEmbarques_template"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input    ${arg1}

Seleccionar Tipo de Alerta
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="cboTipoAlerta"]/div[1]/div/div[1]/input
    Sleep    1
    Click Element    ${arg1}

Seleccionar Posicion
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="cboPosicion"]/div[1]/div/div[1]/input
    Sleep    1
    Click Element    ${arg1}
    
Seleccionar Velocidad
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="cboVelocidad"]/div[1]/div/div[1]/input
    Sleep    1
    Click Element    ${arg1}
    
Presionar opcion Consultar
    Click Element    xpath=//*[@id="btnAceptar"]/div
    Sleep    1
    Select Frame    xpath=//*[@id="frmTabular"]
    Wait Until Element Is Visible    xpath=//*[@id="divtable"]    timeout=60
    ${date24h}    Get Current Date    result_format=%d/%m/%Y %H:%M
    Set Test Variable    ${date24h}
    
Presionar opcion Consultar (obligatorios)
    Click Element    xpath=//*[@id="btnAceptar"]/div
    
Seleccionar Litoral
    [Arguments]    ${arg1}
    Click Element    ${arg1}

Validar etiquetas
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/h3    Reporte de Alertas Confirmadas:
    Element Text Should Be    xpath=//*[@id="rdoGpoDevExTipoBusqueda"]/div/div[1]/div[2]    Golfo
    Element Text Should Be    xpath=//*[@id="rdoGpoDevExTipoBusqueda"]/div/div[2]/div[2]    Pacifico
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[2]/div/div[1]/label    Tipo Vehículo
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[3]/div/div[1]/label    Embarcación
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[4]/div/div[1]/label    Fecha Inicial:
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[5]/div/div[1]/label    Fecha Final:
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[6]/div/div[1]/label    Tipo de Alerta
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[7]/div/div[1]/label    Posición
    Element Text Should Be    xpath=//*[@id="form"]/div/div[2]/div[2]/div/div[8]/div/div[1]/label    Velocidad
    Element Text Should Be    xpath=//*[@id="btnAceptar"]/div/span    Consultar

Seleccionar rango de fechas
    [Arguments]    ${inicial}=${fechaini}    ${final}=${fechafin}
    Input Text    xpath=//*[@id="date-time-inicial"]/div/div/div[1]/input    ${inicial}
    Input Text    xpath=//*[@id="date-time-final"]/div/div/div[1]/input    ${final}

Validar etiquetas en Tabular
    [Arguments]    ${NomEmb}
    Obtener datos de Embarcacion y Usuario en BD    ${NomEmb}
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
    Element Text Should Be    //*[@id="divRango"]/h3    Reporte de Alertas Confirmadas
    Element Text Should Be    //*[@id="divtable"]/p[1]    ${Embarcacion}
    Element Text Should Be    //*[@id="divtable"]/p[2]    ${RazonSocial}
    Element Text Should Be    xpath=//*[@id="divtable"]/table[1]/tbody/tr[1]/td[1]    Orden
    Element Text Should Be    xpath=//*[@id="divtable"]/table[1]/tbody/tr[1]/td[2]    Fecha
    Element Text Should Be    xpath=//*[@id="divtable"]/table[1]/tbody/tr[1]/td[3]    Latitud
    Element Text Should Be    xpath=//*[@id="divtable"]/table[1]/tbody/tr[1]/td[4]    Longitud
    Element Text Should Be    xpath=//*[@id="divtable"]/table[1]/tbody/tr[1]/td[5]    Rumbo
    Element Text Should Be    xpath=//*[@id="divtable"]/table[1]/tbody/tr[1]/td[6]    Velocidad
    Element Text Should Be    xpath=//*[@id="divtable"]/table[1]/tbody/tr[1]/td[7]    Estatus
    Element Text Should Be    xpath=//*[@id="divtable"]/table[1]/tbody/tr[1]/td[8]    Referencia
    Element Text Should Be    //*[@id="pBottom"]    Comisi\u00F3n Nacional de Acuacultura y Pesca, M\u00E9xico - Algunos derechos reservados \u00A9 2014
    Element Text Should Be    //*[@id="pTop"]    Av. Camar\u00F3n S\u00E1balo S/N Esq. Tibur\u00F3n, Fracc. S\u00E1balo Country Club, C.P. 82100 Mazatl\u00E1n, Sin. Mex. Tel. 01-800-6674-022
    
Validar resultado en BD
    [Arguments]    ${Embarcacion}    ${TipoA}    ${Vel}=CONVERT(DECIMAL(5,2),(ac.Velocidad / 1.852))    ${etqVel}=Nudos
    Conexion a Base de Datos
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table > tbody").rows.length -1;
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepAlertasConfirmadas ac join Sismep.TSismepVehiculos v on ac.IdVehiculo = v.IdVehiculo join Sismep.TSismepEstatusMensajes em on ac.IdEstatusMensaje = em.IdEstatusMensaje left join Sismep.TSismepMensajesMCortoPlazo mcp on ac.IdMensaje = mcp.IdMensajeM left join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and (ac.IdEstatusMensaje=dcp.IdEstatusMensaje or dcp.IdEstatusMensaje IS NULL) outer apply dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) left join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona where v.Nombre = '${Embarcacion}' and ac.FechaAlerta between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}'
    Should be equal    ${queryRows[0][0]}    ${rows}
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[2]
    ${Latitud}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[3]
    ${Longitud}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[4]
    ${Rumbo}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[6]
    ${Estatus}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[7]
    ${Ref}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[8]
    ${Referencia}=    Execute JavaScript    if('${Ref}'=='') {return ${EMPTY}} else {return '${Ref}'};
    #@{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, ac.FechaAlerta),'dd/MMMM/yyyy HH:mm', 'es-mx'), ac.Latitud, ac.Longitud, ac.Rumbo, ${Vel}, em.Descripcion, z.Descripcion from Sismep.TSismepAlertasConfirmadas ac join Sismep.TSismepVehiculos v on ac.IdVehiculo = v.IdVehiculo join Sismep.TSismepEstatusMensajes em on ac.IdEstatusMensaje = em.IdEstatusMensaje left join Sismep.TSismepMensajesMCortoPlazo mcp on ac.IdMensaje = mcp.IdMensajeM left join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and (ac.IdEstatusMensaje=dcp.IdEstatusMensaje or dcp.IdEstatusMensaje IS NULL) outer apply dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) left join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona where v.Nombre = '${Embarcacion}' and ac.FechaAlerta between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' order by ac.FechaAlerta
    @{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, ac.FechaAlerta),'dd/MMMM/yyyy HH:mm', 'es-mx'), ac.Latitud, ac.Longitud, ac.Rumbo, ${Vel}, em.Descripcion, z.Descripcion from Sismep.TSismepAlertasConfirmadas ac join Sismep.TSismepVehiculos v on ac.IdVehiculo = v.IdVehiculo join Sismep.TSismepEstatusMensajes em on ac.IdEstatusMensaje = em.IdEstatusMensaje left join Sismep.TSismepMensajesMCortoPlazo mcp on ac.IdMensaje = mcp.IdMensajeM left join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' outer apply dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) left join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona where v.Nombre = '${Embarcacion}' and ac.FechaAlerta between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' order by ac.FechaAlerta
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
    [Arguments]    ${Embarcacion}    ${TipoA}    ${Vel}=CONVERT(DECIMAL(5,2),(ac.Velocidad / 1.852))    ${etqVel}=Nudos
    Conexion a Base de Datos
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table > tbody").rows.length -1;
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepAlertasConfirmadas ac join Sismep.TSismepVehiculos v on ac.IdVehiculo = v.IdVehiculo join Sismep.TSismepEstatusMensajes em on ac.IdEstatusMensaje = em.IdEstatusMensaje left join Sismep.TSismepMensajesMCortoPlazo mcp on ac.IdMensaje = mcp.IdMensajeM left join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and (ac.IdEstatusMensaje=dcp.IdEstatusMensaje or dcp.IdEstatusMensaje IS NULL) outer apply dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) left join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona where v.Nombre = '${Embarcacion}' and ac.FechaAlerta between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}'
    Should be equal    ${queryRows[0][0]}    ${rows}
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[2]
    ${Lat}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[3]
    ${Latitud}=    Convert to Number    ${Lat}
    ${Lon}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[4]
    ${Longitud}=    Convert to Number    ${Lon}
    ${Rumbo}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[6]
    ${Estatus}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[7]
    ${Ref}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[8]
    ${Referencia}=    Execute JavaScript    if('${Ref}'=='') {return ${EMPTY}} else {return '${Ref}'};
    #@{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, ac.FechaAlerta),'dd/MMMM/yyyy HH:mm', 'es-mx'), round(ac.Latitud, 7), round(ac.Longitud, 7), ac.Rumbo, ${Vel}, em.Descripcion, z.Descripcion from Sismep.TSismepAlertasConfirmadas ac join Sismep.TSismepVehiculos v on ac.IdVehiculo = v.IdVehiculo join Sismep.TSismepEstatusMensajes em on ac.IdEstatusMensaje = em.IdEstatusMensaje left join Sismep.TSismepMensajesMCortoPlazo mcp on ac.IdMensaje = mcp.IdMensajeM left join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and (ac.IdEstatusMensaje=dcp.IdEstatusMensaje or dcp.IdEstatusMensaje IS NULL) outer apply dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) left join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona where v.Nombre = '${Embarcacion}' and ac.FechaAlerta between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' order by ac.FechaAlerta
    @{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, ac.FechaAlerta),'dd/MMMM/yyyy HH:mm', 'es-mx'), round(ac.Latitud, 7), round(ac.Longitud, 7), ac.Rumbo, ${Vel}, em.Descripcion, z.Descripcion from Sismep.TSismepAlertasConfirmadas ac join Sismep.TSismepVehiculos v on ac.IdVehiculo = v.IdVehiculo join Sismep.TSismepEstatusMensajes em on ac.IdEstatusMensaje = em.IdEstatusMensaje left join Sismep.TSismepMensajesMCortoPlazo mcp on ac.IdMensaje = mcp.IdMensajeM left join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' outer apply dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) left join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona where v.Nombre = '${Embarcacion}' and ac.FechaAlerta between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' order by ac.FechaAlerta
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
    [Arguments]    ${Litoral}    ${TipoA}    ${Vel}=CONVERT(DECIMAL(5,2),(ac.Velocidad / 1.852))    ${etqVel}=Nudos
    Obtener el nombre de la primer embarcacion en el tabular
    Conexion a Base de Datos
    ${totalEmb}=    Execute JavaScript    return document.getElementsByClassName("CSSTableGenerator").length;
    @{totalEmbBD}    Query    select count(distinct(v.Nombre)) from Sismep.TSismepAlertasConfirmadas ac join Sismep.TSismepVehiculos v on ac.IdVehiculo = v.IdVehiculo join Sismep.TSismepEstatusMensajes em on ac.IdEstatusMensaje = em.IdEstatusMensaje join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle left join Sismep.TSismepMensajesMCortoPlazo mcp on ac.IdMensaje = mcp.IdMensajeM left join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and (ac.IdEstatusMensaje=dcp.IdEstatusMensaje or dcp.IdEstatusMensaje IS NULL) outer apply dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) left join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona where ac.FechaAlerta between '${fechainiUTC}' and '${fechafinUTC}' and d.DescripcionCorta = '${Litoral}' and em.Descripcion = '${TipoA}'
    Should be equal    ${totalEmbBD[0][0]}    ${totalEmb}
    ${rows}=    Execute JavaScript    return document.querySelector("#divtable > table > tbody").rows.length -1;
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepAlertasConfirmadas ac join Sismep.TSismepVehiculos v on ac.IdVehiculo = v.IdVehiculo join Sismep.TSismepEstatusMensajes em on ac.IdEstatusMensaje = em.IdEstatusMensaje left join Sismep.TSismepMensajesMCortoPlazo mcp on ac.IdMensaje = mcp.IdMensajeM left join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and (ac.IdEstatusMensaje=dcp.IdEstatusMensaje or dcp.IdEstatusMensaje IS NULL) outer apply dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) left join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona where v.Nombre = '${NombreEmb}' and ac.FechaAlerta between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}'
    Should be equal    ${queryRows[0][0]}    ${rows}
    ${Fecha}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[2]
    ${Latitud}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[3]
    ${Longitud}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[4]
    ${Rumbo}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[5]
    ${Velocidad}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[6]
    ${Estatus}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[7]
    ${Ref}=    Get text    xpath=//*[@id="divtable"]/table/tbody/tr[2]/td[8]
    ${Referencia}=    Execute JavaScript    if('${Ref}'=='') {return ${EMPTY}} else {return '${Ref}'};
    #@{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, ac.FechaAlerta),'dd/MMMM/yyyy HH:mm', 'es-mx'), ac.Latitud, ac.Longitud, ac.Rumbo, ${Vel}, em.Descripcion, z.Descripcion from Sismep.TSismepAlertasConfirmadas ac join Sismep.TSismepVehiculos v on ac.IdVehiculo = v.IdVehiculo join Sismep.TSismepEstatusMensajes em on ac.IdEstatusMensaje = em.IdEstatusMensaje left join Sismep.TSismepMensajesMCortoPlazo mcp on ac.IdMensaje = mcp.IdMensajeM left join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and (ac.IdEstatusMensaje=dcp.IdEstatusMensaje or dcp.IdEstatusMensaje IS NULL) outer apply dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) left join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona where v.Nombre = '${NombreEmb}' and ac.FechaAlerta between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' order by ac.FechaAlerta
    @{queryResults}    Query    select top 1 v.Nombre, FORMAT(DATEADD(HH, -${horasUTC}, ac.FechaAlerta),'dd/MMMM/yyyy HH:mm', 'es-mx'), ac.Latitud, ac.Longitud, ac.Rumbo, ${Vel}, em.Descripcion, z.Descripcion from Sismep.TSismepAlertasConfirmadas ac join Sismep.TSismepVehiculos v on ac.IdVehiculo = v.IdVehiculo join Sismep.TSismepEstatusMensajes em on ac.IdEstatusMensaje = em.IdEstatusMensaje left join Sismep.TSismepMensajesMCortoPlazo mcp on ac.IdMensaje = mcp.IdMensajeM left join Sismep.TSismepMensajesDCortoPlazo dcp on mcp.IdMensajeM = dcp.IdMensaje and dcp.IdEstatusMensaje='D55FE03A-7A1A-413D-B048-E421230D6A1E' outer apply dcp.ComentariosAccion.nodes('/Detail/Element') AS c(d) left join Sismep.TSismepZonas z on c.d.value('.','UNIQUEIDENTIFIER') = z.IdZona where v.Nombre = '${NombreEmb}' and ac.FechaAlerta between '${fechainiUTC}' and '${fechafinUTC}' and em.Descripcion = '${TipoA}' order by ac.FechaAlerta
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
    
# Presionar boton Exportar a Excel
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
    
# Presionar boton Regresar
#     Wait Until Element Is Visible    xpath=//*[@id="menu"]/div[4]/button
#     Click Element    xpath=//*[@id="menu"]/div[4]/button
    
Obtener datos de Embarcacion y Usuario en BD
    [Arguments]    ${arg1}
    Conexion a Base de datos
    @{queryResults}=    Query    select v.Nombre, v.RNP, v.Matricula, rs.Descripcion from Sismep.TSismepVehiculos v join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial where v.Nombre = '${arg1}'
    @{queryUsuario}=    Query    select Nombre from aspnet_Users where UserName = '${credenciales}[usuario]'
    Set Test Variable    ${Nombre}    ${queryResults[0][0]}
    Set Test Variable    ${RNP}    ${queryResults[0][1]}
    Set Test Variable    ${Matricula}    ${queryResults[0][2]}
    Set Test Variable    ${RazonSocial}    ${queryResults[0][3]}
    Set Test Variable    ${Usuario}    ${queryUsuario[0][0]}
    Disconnect From Database
    
Validar retorno a ventana de Consulta
    Unselect Frame
    Element Should Be Visible    xpath=//*[@id="btnAceptar"]
    
Validar filtros requeridos
    Validar mensaje    3    Seleccione un valor correcto.
    ${TipoAlerta}=    Get Element Attribute    xpath=//*[@id="cboTipoAlerta"]    textContent
    ${attrTipoAlerta}    Execute Javascript    cadena='${TipoAlerta}'; return cadena.substr(length-12);
    Should be equal    ${attrTipoAlerta}    Obligatorio
    
# Validar mensaje
#     [Arguments]    ${arg1}
#     Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div
#     Element Text Should Be    xpath=/html/body/div[3]/div/div/div[2]    ${arg1}
    
Obtener el nombre de la primer embarcacion en el tabular
    ${NombreEmb}    Get text    xpath=//*[@id="divtable"]/p[1]/b[1]
    Set Test Variable    ${NombreEmb}

Validar Embarcacion Sin Resultado
    Element Text Should Be    //*[@id="cboDevExEmbarques_template"]/div/div[6]/div/div/div[1]/span    Sin datos

Validar campo Embarcacion restablecido
    Element Text Should Be    //*[@id="cboDevExEmbarques"]/div[1]/div/div[1]/input    ${EMPTY}