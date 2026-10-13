*** Settings ***
Resource    Recursos.Antenas.robot

*** Variables ***
&{AntenaCrear}    Descripcion=RFAntena    Serie=30023401040000    Voltaje=500
${btnGuardar}    /html/body/div[3]/div/div[2]/div/div[6]/div/div[1]

*** Test Cases ***
Crear - Validar etiquetas y tooltips
    [Documentation]    Debe de abrir una ventana con el titulo Nueva Antena.
    [Tags]    Crear - Etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Presionar opcion Nuevo registro    ${btnGuardar}
    Validar etiquetas y tooltips
    [Teardown]    Close Browser
    
Crear - Validar elementos del combo Tipo
    [Documentation]    Debe de mostrar un combo con los tipos de antena: IDP
    [Tags]    Crear - Validar elementos del combo Tipo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Presionar opcion Nuevo registro    ${btnGuardar}
    Sleep    1
    Validar elementos del combo Tipo
    [Teardown]    Close Browser
    
Crear - Validar opcion Cancelar
    [Documentation]    Debe de cerrar la ventana de Nueva Antena sin guardar ningun registro.
    [Tags]    Crear - Validar opcion Cancelar - T200
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Presionar opcion Nuevo registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario
    Obtener los valores del formulario
    Presionar opcion Cancelar
    Consultar registro en BD    0
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser

Crear - Validar opcion Guardar
    [Documentation]    Debe de crear un nuevo registro con los datos ingresados.
    [Tags]    Crear - Validar opcion Guardar - T201
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Presionar opcion Nuevo registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario
    Obtener los valores del formulario
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Validar registro en BD
    [Teardown]    Close Browser

Crear - Validar opcion Guardar - Ver Detalle
    [Documentation]    Debera mostrar la informacion del registro previamente creado.
    [Tags]    Crear - Validar opcion Guardar - Ver Detalle
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Presionar opcion Nuevo registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener los valores del formulario
    Presionar opcion Cancelar
    Sleep    1
    Filtrar por    2    ${descripcion}
    Sleep    1
    Ingresar al detalle del registro
    Validar registro en BD
    [Teardown]    Close Browser

Crear - Maximo de caracteres en campo Descripcion
    [Documentation]    Debe de crear un nuevo registro con la cantidad maxima de caracteres en Descripcion.
    [Tags]    Crear - Maximo de caracteres en campo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Presionar opcion Nuevo registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario    dsc=${caracteres}
    Obtener los valores del formulario
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Validar registro en BD
    [Teardown]    Close Browser

Crear - Maximo de caracteres en campo Serie
    [Documentation]    Debe de crear un nuevo registro con la cantidad maxima de caracteres en Serie.
    [Tags]    Crear - Maximo de caracteres en campo Serie
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Presionar opcion Nuevo registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario    ser=${caracteres}
    Obtener los valores del formulario
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Validar registro en BD
    [Teardown]    Close Browser

Crear - Validar mensaje para Descripcion existente
    [Documentation]    Debe de mandar un mensaje con la leyenda "El registro ya existe." y no generar el registro.
    [Tags]    Crear - Validar mensaje para Descripcion existente
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Presionar opcion Nuevo registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario - Descripcion existente
    Obtener los valores del formulario
    Presionar opcion Guardar
    Validar mensaje    El registro ya existe.
    Consultar registro en BD    0
    [Teardown]    Close Browser
    
Crear - Validar mensaje para Descripcion y Serie existente
    [Documentation]    Debe de mandar un mensaje con la leyenda "El registro ya existe." y no generar el registro.
    [Tags]    Crear - Validar mensaje para Descripcion y Serie existente
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Presionar opcion Nuevo registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario - Descripcion y Serie existente
    Obtener los valores del formulario
    Presionar opcion Guardar
    Validar mensaje    El registro ya existe.
    Consultar registro en BD    1
    [Teardown]    Close Browser
    
Crear - Validar campos requeridos
    [Documentation]    Debera mostrar la leyenda Obligatorio en color rojo sobre los campos requeridos.
    [Tags]    Crear - Validar campos requeridos - T1111
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Presionar opcion Nuevo registro    ${btnGuardar}
    Sleep    1
    Presionar opcion Guardar
    Validar campos obligatorios
    [Teardown]    Close Browser
    
Crear - Tipo requerido
    [Documentation]    No debe de guardar ningun registro sin valor en este campo.
    [Tags]    Crear - Tipo requerido
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Presionar opcion Nuevo registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario - Sin Tipo
    Obtener los valores del formulario
    Presionar opcion Guardar
    Sleep    1
    Consultar registro en BD    0
    [Teardown]    Close Browser
    
Crear - Voltaje requerido
    [Documentation]    No debe de guardar ningun registro sin valor en este campo.
    [Tags]    Crear - Voltaje requerido
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Antenas
    Presionar opcion Nuevo registro    ${btnGuardar}
    Sleep    1
    Capturar datos del formulario - Sin Voltaje
    Obtener los valores del formulario
    Presionar opcion Guardar
    Sleep    1
    Consultar registro en BD    0
    [Teardown]    Close Browser
    
*** Keywords ***
Capturar datos del formulario
    [Arguments]    ${dsc}=${AntenaCrear}[Descripcion]    ${ser}=${AntenaCrear}[Serie]
    Seleccionar Tipo    3
    Validar registro unico    ${dsc}    ${queryAntena}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    Validar registro unico    ${ser}    ${querySerie}
    Input Text    xpath=//*[@id="txtNoSerie"]/div/div[1]/input    ${valorUnico}
    Input Text    xpath=//*[@id="txtVoltaje"]/div/div[1]/input    ${AntenaCrear}[Voltaje]
    
Capturar datos del formulario - Descripcion existente
    Seleccionar Tipo    3
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${AntenaExistente}[Descripcion]
    Validar registro unico    ${AntenaCrear}[Serie]    ${querySerie}
    Input Text    xpath=//*[@id="txtNoSerie"]/div/div[1]/input    ${valorUnico}
    Input Text    xpath=//*[@id="txtVoltaje"]/div/div[1]/input    ${AntenaCrear}[Voltaje]
    
Capturar datos del formulario - Descripcion y Serie existente
    Seleccionar Tipo    3
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${AntenaExistente}[Descripcion]
    Input Text    xpath=//*[@id="txtNoSerie"]/div/div[1]/input    ${AntenaExistente}[Serie]
    Input Text    xpath=//*[@id="txtVoltaje"]/div/div[1]/input    ${AntenaExistente}[Voltaje]
    
Capturar datos del formulario - Sin Tipo
    Validar registro unico    ${AntenaCrear}[Descripcion]    ${queryAntena}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    Validar registro unico    ${AntenaCrear}[Serie]    ${querySerie}
    Input Text    xpath=//*[@id="txtNoSerie"]/div/div[1]/input    ${valorUnico}
    Input Text    xpath=//*[@id="txtVoltaje"]/div/div[1]/input    ${AntenaCrear}[Voltaje]
    
Capturar datos del formulario - Sin Voltaje
    Seleccionar Tipo    3
    Validar registro unico    ${AntenaCrear}[Descripcion]    ${queryAntena}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${valorUnico}
    Validar registro unico    ${AntenaCrear}[Serie]    ${querySerie}
    Input Text    xpath=//*[@id="txtNoSerie"]/div/div[1]/input    ${valorUnico}
    
Consultar registro en BD
    [Arguments]    ${arg1}
    Conexion a Base de Datos
    Row Count Is Equal To X    select m.Descripcion, a.Descripcion, a.IdExterno, a.Voltaje from [Sismep].[TSismepAntenas] a join [Sismep].[TSismepModems] m on a.IdModem=m.IdModem where a.Activo = 1 and m.Descripcion = '${tipo}' and a.Descripcion = '${descripcion}' and a.NoSerie = '${serie}' and a.Voltaje = ${voltaje}    ${arg1}
    Disconnect From Database
        
Validar etiquetas y tooltips
    ${ttGuardar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[6]/div/div[1]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[6]/div/div[2]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Nueva Antena
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[1]    Estatus:
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[1]    Tipo:
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[3]/div[1]    Descripción:
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[4]/div[1]    No. Serie:
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div[1]    Voltaje:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    
Validar campos obligatorios
    ${tipo}=    Get Element Attribute    xpath=//*[@id="cboModems"]    textContent
    ${reqTipo}    Execute Javascript    cadena='${tipo}'; return cadena.substr(length-11);
    ${reqSerie}=    Get Element Attribute    xpath=//*[@id="txtNoSerie"]    textContent
    ${reqVoltaje}=    Get Element Attribute    xpath=//*[@id="txtVoltaje"]    textContent
    Should be equal    ${reqTipo}    Obligatorio
    Should be equal    ${reqSerie}    Obligatorio
    Should be equal    ${reqVoltaje}    Obligatorio