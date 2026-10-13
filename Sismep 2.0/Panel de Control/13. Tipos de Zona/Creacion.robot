*** Settings ***
Resource    Recursos.TiposZona.robot

*** Variables ***
${tipoZonaCrear}    RFTipoZona
${btnGuardar}    /html/body/div[3]/div/div[2]/div/div[9]/div/div[1]

*** Test Cases ***
Creacion: Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Creacion: Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Validar etiquetas y tooltips
    [Teardown]    Close Browser

Creacion: Validar opcion Guardar - Todo SI
    [Documentation]    Debera crear correctamente el registro en la Base de datos.
    [Tags]    Creacion: Validar opcion Guardar - Todo SI - T193
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario - Todo SI
    Sleep    1
    Presionar boton Guardar
    Validar mensaje    Cambios guardados.
    Validar Tipo de Zona en BD
    [Teardown]    Close Browser

Creacion: Validar opcion Guardar - Todo NO
    [Documentation]    Debera guardar correctamente el registro en la Base de datos.
    [Tags]    Creacion: Validar opcion Guardar - Todo NO
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario - Todo NO
    Sleep    1
    Presionar boton Guardar
    Validar mensaje    Cambios guardados.
    Validar Tipo de Zona en BD
    [Teardown]    Close Browser
    
Creacion: Validar opcion Guardar - SINO
    [Documentation]    Debera guardar correctamente el registro en la Base de datos.
    [Tags]    Creacion: Validar opcion Guardar - SINO
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario - SINO
    Sleep    1
    Presionar boton Guardar
    Validar mensaje    Cambios guardados.
    Validar Tipo de Zona en BD
    [Teardown]    Close Browser
    
Creacion: Validar opcion Guardar - NOSI
    [Documentation]    Debera guardar correctamente el registro en la Base de datos.
    [Tags]    Creacion: Validar opcion Guardar - NOSI
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario - NOSI
    Sleep    1
    Presionar boton Guardar
    Validar mensaje    Cambios guardados.
    Validar Tipo de Zona en BD
    [Teardown]    Close Browser
    
Creacion: Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion y no guardar nada en la Base de datos.
    [Tags]    Creacion: Validar opcion Cancelar - T194
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario - SINO
    Obtener datos del formulario
    Sleep    1
    Presionar boton Cancelar
    Validar Tipo de Zona inexistente en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser

Creacion: Descripcion duplicada
    [Documentation]    Debera mostrar una validacion indicando que la descripcion ya existe.
    [Tags]    Creacion: Descripcion duplicada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Descripcion duplicada
    Sleep    1
    Presionar boton Guardar
    Validar mensaje    El registro ya existe.
    [Teardown]    Close Browser

Creacion: Campos obligatorios
    [Documentation]    Debera mostrar en rojo los campos obligatorios
    [Tags]    Creacion: Campos obligatorios
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Zona
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Presionar boton Guardar
    Validar campos requeridos
    [Teardown]    Close Browser

*** Keywords ***
Validar etiquetas y tooltips
    ${ttGuardar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[9]/div/div[1]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[9]/div/div[2]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Nuevo Tipo de Zona
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/label    Estatus:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[2]/label    Descripción:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[3]/label    Zona Informativa:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[4]/label    ¿Valida Proximidad?:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[5]/label    ¿Requiere Punto de Interés?:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[6]/label    ¿Agregar Listas?:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[7]/label    Tipo de Lista:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[8]/label    ¿Mostrar Alerta?:
    Element Text Should Be    xpath=//*[@id="rblZonaInformativa"]/div/div[1]/div[2]    Sí
    Element Text Should Be    xpath=//*[@id="rblZonaInformativa"]/div/div[2]/div[2]    No
    Element Text Should Be    xpath=//*[@id="rblValidaProximidad"]/div/div[1]/div[2]    Sí
    Element Text Should Be    xpath=//*[@id="rblValidaProximidad"]/div/div[2]/div[2]    No
    Element Text Should Be    xpath=//*[@id="rblRequierePI"]/div/div[1]/div[2]    Sí
    Element Text Should Be    xpath=//*[@id="rblRequierePI"]/div/div[2]/div[2]    No
    Element Text Should Be    xpath=//*[@id="rblAgregarListas"]/div/div[1]/div[2]    Sí
    Element Text Should Be    xpath=//*[@id="rblAgregarListas"]/div/div[2]/div[2]    No
    Element Text Should Be    xpath=//*[@id="rblTipoLista"]/div/div[1]/div[2]    Inclusión
    Element Text Should Be    xpath=//*[@id="rblTipoLista"]/div/div[2]/div[2]    Exclusión
    Element Text Should Be    xpath=//*[@id="rblMostrarAlerta"]/div/div[1]/div[2]    Sí
    Element Text Should Be    xpath=//*[@id="rblMostrarAlerta"]/div/div[2]/div[2]    No
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar

Capturar datos del formulario - Todo SI
    Validar registro unico    ${tipoZonaCrear}    ${queryTipoZona}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}

Capturar datos del formulario - Todo NO
    Validar registro unico    ${tipoZonaCrear}    ${queryTipoZona}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    Click Element    xpath=//*[@id="rblZonaInformativa"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblValidaProximidad"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblRequierePI"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblAgregarListas"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblTipoLista"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblMostrarAlerta"]/div/div[2]/div[1]/div
    
Capturar datos del formulario - SINO
    Validar registro unico    ${tipoZonaCrear}    ${queryTipoZona}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    Click Element    xpath=//*[@id="rblValidaProximidad"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblAgregarListas"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblMostrarAlerta"]/div/div[2]/div[1]/div
    
Capturar datos del formulario - NOSI
    Validar registro unico    ${tipoZonaCrear}    ${queryTipoZona}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    Click Element    xpath=//*[@id="rblZonaInformativa"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblRequierePI"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblTipoLista"]/div/div[2]/div[1]/div
    
Capturar datos del formulario Descripcion duplicada
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${RegistroExistente}
    Click Element    xpath=//*[@id="rblValidaProximidad"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblAgregarListas"]/div/div[2]/div[1]/div
    Click Element    xpath=//*[@id="rblMostrarAlerta"]/div/div[2]/div[1]/div