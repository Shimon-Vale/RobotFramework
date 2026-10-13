*** Settings ***
Resource    Recursos.TiposReporte.robot

*** Variables ***
${TRCrear}    RFTipoReporte
${btnGuardar}    //*[@id="gen_btnGuardar"]

*** Test Cases ***
Crear - TAB Generales - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Crear - TAB Generales - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Validar etiquetas TAB Generales
    [Teardown]    Close Browser
    
Crear - TAB Generales - Validar opcion Guardar (Todos los campos)
    [Documentation]    Debera guardar correctamente el registro.
    [Tags]    Crear - TAB Generales - Validar opcion Guardar (Todos los campos) - T149
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Generales TODOS los campos    ${TRCrear}
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Obtener datos del formulario - TAB Generales
    Validar mensaje    Registro guardado.
    Sleep    2
    Validar Tipo de Reporte en BD
    [Teardown]    Close Browser
    
Crear - TAB Generales - Validar opcion Guardar (solo Descripcion)
    [Documentation]    Debera guardar correctamente el registro.
    [Tags]    Crear - TAB Generales - Validar opcion Guardar (solo Descripcion)
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Generales SOLO Descripcion    ${TRCrear}
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Obtener datos del formulario - TAB Generales
    Validar mensaje    Registro guardado.
    Sleep    2
    Validar Tipo de Reporte en BD
    [Teardown]    Close Browser
    
Crear - TAB Generales - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion y no guardar en la Base de datos.
    [Tags]    Crear - TAB Generales - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Presionar opcion Nuevo Registro    ${btnGuardar}   
    Capturar datos del formulario Generales TODOS los campos    ${TRCrear}
    Sleep    1
    Obtener datos del formulario - TAB Generales
    Presionar opcion Cancelar
    Sleep    2
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    Sleep    2
    Validar Tipo de Reporte inexistente en BD
    [Teardown]    Close Browser
    
Crear - TAB Acciones - Validar etiquetas
    [Documentation]    Debera mostrar correctamente escritas las etiquetas.
    [Tags]    Crear - TAB Acciones - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Generales TODOS los campos    ${TRCrear}
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Obtener datos del formulario - TAB Generales
    Validar Tipo de Reporte en BD
    Ingresar a opcion Acciones
    Sleep    1
    Validar etiquetas TAB Acciones
    [Teardown]    Close Browser
    
Crear - TAB Acciones - Agregar Accion
    [Documentation]    Debera agregar correctamente una accion.
    [Tags]    Crear - TAB Acciones - Agregar Accion - T148
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Generales TODOS los campos    ${TRCrear}
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Obtener datos del formulario - TAB Generales
    Validar Tipo de Reporte en BD
    Ingresar a opcion Acciones
    Sleep    1
    Seleccionar Accion    Verifica Distancias
    Capturar Orden    1
    Presionar opcion Guardar Accion
    Sleep    1
    Obtener datos del Grid Acciones
    Validar Accion en BD
    [Teardown]    Close Browser
    
Crear - TAB Acciones - Eliminar Accion
    [Documentation]    Debera eliminar correctamente la accion.
    [Tags]    Crear - TAB Acciones - Eliminar Accion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Tipos de Reporte
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Capturar datos del formulario Generales TODOS los campos    ${TRCrear}
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Obtener datos del formulario - TAB Generales
    Validar Tipo de Reporte en BD
    Ingresar a opcion Acciones
    Sleep    1
    Seleccionar Accion    Verifica Distancias
    Capturar Orden    1
    Presionar opcion Guardar Accion
    Sleep    1
    Obtener datos del Grid Acciones
    Validar Accion en BD
    Presionar opcion Ver Detalle
    Presionar opcion Eliminar
    Sleep    2
    Confirma Accion
    Sleep    2
    Validar Accion inexistente en BD
    [Teardown]    Close Browser
    
*** Keywords ***
Capturar datos del formulario Generales SOLO Descripcion
    [Arguments]    ${arg1}
    Validar campo unico Descripcion    ${arg1}
    Sleep    1
    Input Text    xpath=//*[@id="gen_txtDescripcion"]/div/div[1]/input    ${DescripcionUnica}
    
Validar etiquetas TAB Generales
    ${ttGuardar}    Get Element Attribute    xpath=//*[@id="gen_btnGuardar"]    tooltip
    ${ttCancelar}    Get Element Attribute    xpath=//*[@id="tabGenerales"]/div[5]/div/div[2]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Nuevo Tipo de Reporte
    Element Text Should Be    xpath=//*[@id="lnkTabGenerales"]    Generales
    Element Text Should Be    xpath=//*[@id="tabGenerales"]/div[1]/div[1]    Estatus:
    Element Text Should Be    xpath=//*[@id="tabGenerales"]/div[2]/div[1]    Descripción:
    Element Text Should Be    xpath=//*[@id="tabGenerales"]/div[3]/div[1]    Validar Cuadrante:
    Element Text Should Be    xpath=//*[@id="tabGenerales"]/div[4]/div[1]    Registrar Estatus:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar