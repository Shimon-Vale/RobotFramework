*** Settings ***
Resource    Recursos.ArtePesca.robot

*** Variables ***
${artedepesca}    RFArtedePescaEditar
${filtro}    RF
${querySQL}    SELECT Descripcion FROM [Sismep].[TSismepArtesCarga] WHERE Descripcion=

*** Test Cases ***
Editar - Ingresar al detalle de un registro
    [Documentation]    Debe de abrir una ventana con con la informacion del registro seleccionado.
    [Tags]    Editar - Ingresar al detalle de un registro
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Ingresar al detalle del primer registro en el grid
    Obtener Descripcion del formulario
    Validar registro en BD    ${dscripcion}    1
    [Teardown]    Close Browser
    
Editar - Etiquetas y tooltips
    [Documentation]    Validar etiquetas en ventana de edicion.
    [Tags]    Editar - Etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Ingresar al detalle del primer registro en el grid
    Validar etiquetas y tooltips
    [Teardown]    Close Browser
    
Editar - Validar opcion Guardar
    [Documentation]    Debe de guardar correctamente la modificacion al arte de pesca seleccionado.
    [Tags]    Editar - Validar opcion Guardar - T26
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Filtrar por Descripcion    ${filtro}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Capturar datos del formulario    ${artedepesca}    ${querySQL}
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Validar registro en BD    ${valorUnico}    1
    [Teardown]    Close Browser
    
Editar - Validar opcion Cancelar
    [Documentation]    Debe de cerrar la ventana sin guardar modificacion del arte de pesca seleccionado.
    [Tags]    Editar - Validar opcion Cancelar 
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Ingresar al detalle del primer registro en el grid
    Capturar datos del formulario    ${artedepesca}    ${querySQL}
    Presionar opcion Cancelar
    Validar numero de registros en BD    ${valorUnico}    0
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Editar - Confirmar Desactivar
    [Documentation]    Debe desactivar el registro seleccionado.
    [Tags]    Editar - Confirmar Desactivar - T24
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Filtrar por Descripcion    ${filtro}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Obtener Descripcion del formulario
    Sleep    1
    Presionar opcion Desactivar
    Sleep    1
    Confirmar accion
    Validar mensaje    Registro guardado.
    Validar registro en BD    ${dscripcion}    0
    [Teardown]    Close Browser

Editar - Cancelar Desactivar
    [Documentation]    Debe de cerrar la ventana sin guardar ningun cambio.
    [Tags]    Editar - Cancelar Desactivar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Ingresar al detalle del primer registro en el grid
    Obtener Descripcion del formulario
    Sleep    1
    Presionar opcion Desactivar
    Cancelar accion
    Validar registro en BD    ${dscripcion}    1
    [Teardown]    Close Browser

Editar - Validar mensaje de Desactivacion
    [Documentation]    Debe de monstrar un mensaje con la leyenda "El registro será desactivado".
    [Tags]    Editar - Validar mensaje de Desactivacion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Ingresar al detalle del primer registro en el grid
    Sleep    1
    Presionar opcion Desactivar
    Validar mensaje de confirmacion    El registro será desactivado.
    [Teardown]    Close Browser

Editar - Confirmar Reactivar
    [Documentation]    Debe de reactivar el registro seleccionado.
    [Tags]    Editar - Confirmar Reactivar - T25
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Filtrar por estatus    3
    Filtrar por Descripcion    ${filtro}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Obtener Descripcion del formulario
    Sleep    1
    Presionar opcion Reactivar
    Sleep    1
    Confirmar accion
    Validar mensaje    Registro guardado.
    Validar registro en BD    ${dscripcion}    1
    [Teardown]    Close Browser

Editar - Cancelar Reactivar
    [Documentation]    Debe de cerrar la ventana sin guarnar ningun cambio.
    [Tags]    Editar - Cancelar Reactivar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Filtrar por estatus    3
    Ingresar al detalle del primer registro en el grid
    Obtener Descripcion del formulario
    Sleep    1
    Presionar opcion Reactivar
    Cancelar accion
    Validar registro en BD    ${dscripcion}    0
    [Teardown]    Close Browser

Editar - Validar mensaje de Reactivacion
    [Documentation]    Debe de monstrar un mensaje con la leyenda "El registro será reactivado".
    [Tags]    Editar - Validar mensaje de Reactivacion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Filtrar por estatus    3
    Ingresar al detalle del primer registro en el grid
    Sleep    1
    Presionar opcion Reactivar
    Validar mensaje de confirmacion    El registro será reactivado.
    [Teardown]    Close Browser
    
Editar - Descripcion requerida
    [Documentation]    No debe de guardar modificaciones en el registro sin este campo.
    [Tags]    Editar - Descripcion requerida
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Ingresar al detalle del primer registro en el grid
    Obtener Descripcion del formulario
    Dejar vacio el campo Descripcion
    Sleep    1
    Presionar opcion Guardar
    Validar numero de registros en BD    ${dscripcion}    1
    [Teardown]    Close Browser

Editar - Maximo de caracteres en campo Descripcion
    [Documentation]    Debe de editar correctamente la descripcion de la antena seleccionada con el maximo de caracteres permitidos.
    [Tags]    Editar - Maximo de caracteres en campo Descripcion - T28
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Filtrar por Descripcion    ${filtro}
    Sleep    1
    Ingresar al detalle del primer registro en el grid
    Capturar datos del formulario    ${artedepesca}    ${querySQL}
    Obtener solo los caracteres soportados por el campo    ${valorUnico}
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Validar registro en BD    ${campo}    1
    [Teardown]    Close Browser

Editar - Validar Descripcion existente
    [Documentation]    No debe guardar modificaciones que dupliquen el registro de este campo.
    [Tags]    Editar - Validar Descripcion existente 
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Artes de Pesca
    Ingresar al detalle del primer registro en el grid
    Capturar Descripcion existente
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    El registro ya existe.
    Validar numero de registros en BD    ${artedepescaexistente}    1
    [Teardown]    Close Browser
    
*** Keywords ***
Ingresar al detalle del primer registro en el grid
    Wait Until Element Is Enabled    xpath=//*[@id="gridArtesCarga"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div/div
    Click Element    xpath=//*[@id="gridArtesCarga"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div/div

Validar etiquetas y tooltips
    ${guardar}=    Get Element Attribute    xpath=//*[@id="gen_btnGaurdar"]    tooltip
    ${cancelar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[3]/div/div[2]    tooltip
    ${desactivar}=    Get Element Attribute    xpath=//*[@id="btnDesactivar"]    tooltip
    ${reactivar}=    Get Element Attribute    xpath=//*[@id="btnReactivar"]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div    Editar Arte de Pesca
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[1]    Estatus:
    Element Should Contain    xpath=/html/body/div[3]/div/div[2]/div/div[2]    Descripción:
    Should be equal    ${guardar}    Guardar
    Should be equal    ${cancelar}    Cancelar
    Should be equal    ${desactivar}    Desactivar
    Should be equal    ${reactivar}    Reactivar
    
Obtener Descripcion del formulario
    ${dscripcion}=    Get Value    xpath=//*[@id="txtDescripcion"]/div/div[1]/input
    Set Test Variable    ${dscripcion}