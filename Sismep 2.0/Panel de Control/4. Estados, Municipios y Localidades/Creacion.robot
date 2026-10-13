*** Settings ***
Resource    Recursos.EML.robot

*** Variables ***
&{Crear}    Estado=RFEstado    Municipio=RFMunicipio    Localidad=RFLocalidad
${EstadoExistente}    AGUASCALIENTES
${btnGuardar}    //*[@id="gen_btnGaurdar"]

*** Test Cases ***
Estado Crear - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Estado Crear - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Validar etiquetas
    [Teardown]    Close Browser

Estado Crear - Validar opcion Guardar
    [Documentation]    Debera permitir crear un Estado correctamente.
    [Tags]    Estado Crear - Validar opcion Guardar - T31
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Presionar boton Guardar
    Validar mensaje    Registro guardado.
    Validar Estado en BD
    [Teardown]    Close Browser

Estado Crear - Validar opcion Guardar - Ver Detalle
    [Documentation]    Debera mostrar correctamente la informacion del registro.
    [Tags]    Estado Crear - Validar opcion Guardar - Ver Detalle
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Obtener datos del formulario
    Estado - Presionar boton Guardar
    Sleep    1
    Cerrar modal del formulario
    Sleep    1
    Filtrar por Columna 1 y Campo ${Estado}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Estado - Obtener datos del formulario
    Validar Estado en BD
    [Teardown]    Close Browser

Estado Crear - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de crear un nuevo registro 
        ...    y no debera de guardar en la BD.
    [Tags]    Estado Crear - Validar opcion Cancelar - T32
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Presionar boton Cancelar
    Sleep    1
    Validar Estado inexistente en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser

Estado Crear - Descripcion duplicada
    [Documentation]    Debera mostrar una validacion indicando que el registro ya existe.
    [Tags]    Estado Crear - Descripcion duplicada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario Descripcion duplicada    ${EstadoExistente}
    Sleep    1
    Estado - Presionar boton Guardar
    Validar mensaje    El registro ya existe.
    [Teardown]    Close Browser

Estado Crear - Mostrar campos obligatorios
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Estado Crear - Mostrar campos obligatorios
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Sleep    1
    Estado - Presionar boton Guardar
    Sleep    1
    Estado - Mostrar campos obligatorios
    [Teardown]    Close Browser

Municipio Crear - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Municipio Crear - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Presionar boton Guardar
    Sleep    1
    Validar Estado en BD
    Seleccionar TAB Municipios
    Sleep    1
    Municipio - Validar etiquetas
    Sleep    1
    Validar boton Eliminar desactivado    //*[@id="mpo_btnEliminar"]
    [Teardown]    Close Browser

Municipio Crear - Validar opcion Guardar
    [Documentation]    Debera permitir guardar correctamente un Municipio.
    [Tags]    Municipio Crear - Validar opcion Guardar - T33
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Presionar boton Guardar
    Sleep    1
    Validar Estado en BD
    Seleccionar TAB Municipios
    Sleep    1
    Municipio - Capturar datos del formulario    ${Crear}[Municipio]
    Sleep    1
    Municipio - Presionar boton Guardar
    Validar mensaje    Registro guardado.
    Validacion de campo obligatorio oculto    //*[@id="mpo_txtDescripcion"]
    Validar Municipio en BD
    [Teardown]    Close Browser

Municipio Crear - Validar opcion Guardar - Ver Detalle
    [Documentation]    Debera permitir guardar correctamente un Municipio.
    [Tags]    Municipio Crear - Validar opcion Guardar - Ver Detalle
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Obtener datos del formulario
    Sleep    1
    Estado - Presionar boton Guardar
    Sleep    1
    Seleccionar TAB Municipios
    Sleep    1
    Municipio - Capturar datos del formulario    ${Crear}[Municipio]
    Sleep    1
    Municipio - Obtener datos del formulario
    Municipio - Presionar boton Guardar
    Sleep    1
    Cerrar modal del formulario
    Sleep    1
    Filtrar por Columna 1 y Campo ${Estado}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Validar Municipio en BD    ${Estado}    ${Municipio}
    [Teardown]    Close Browser

Municipio Crear - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de crear un nuevo registro 
        ...    y no debera de guardar en la BD.
    [Tags]    Municipio Crear - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Presionar boton Guardar
    Sleep    1
    Validar Estado en BD
    Seleccionar TAB Municipios
    Municipio - Capturar datos del formulario    ${Crear}[Municipio]
    Sleep    1
    Municipio - Presionar boton Cancelar
    Sleep    1
    Validar Municipio inexistente en BD
    Validar campo vacio    //*[@id="mpo_txtDescripcion"]
    [Teardown]    Close Browser

Municipio Crear - Mostrar campos obligatorios
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Municipio Crear - Mostrar campos obligatorios
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
   Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Presionar boton Guardar
    Sleep    1
    Validar Estado en BD
    Seleccionar TAB Municipios
    Sleep    1
    Municipio - Presionar boton Guardar
    Sleep    1
    Municipio - Mostrar campos obligatorios
    [Teardown]    Close Browser

Municipio Crear - Validar campos obligatorios ocultos
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Municipio Crear - Validar campos obligatorios ocultos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Presionar boton Guardar
    Sleep    1
    Validar Estado en BD
    Seleccionar TAB Municipios
    Sleep    1
    Municipio - Presionar boton Guardar
    Sleep    1
    Cerrar modal del formulario
    Filtrar por Columna 1 y Campo ${EstadoUnico}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar TAB Municipios
    Validacion de campo obligatorio oculto    //*[@id="mpo_txtDescripcion"]
    [Teardown]    Close Browser

Localidad Crear - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Localidad Crear - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Presionar boton Guardar
    Sleep    1
    Validar Estado en BD
    Seleccionar TAB Municipios
    Municipio - Capturar datos del formulario    ${Crear}[Municipio]
    Sleep    1
    Municipio - Presionar boton Guardar
    Sleep    1
    Validar Municipio en BD
    Seleccionar TAB Localidades
    Localidad - Validar etiquetas
    Sleep    1
    Validar boton Eliminar desactivado    //*[@id="loc_btnEliminar"]
    [Teardown]    Close Browser

Localidad Crear - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente una Localidad.
    [Tags]    Localidad Crear - Validar opcion Guardar - T36
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Presionar boton Guardar
    Sleep    1
    Validar Estado en BD
    Seleccionar TAB Municipios
    Municipio - Capturar datos del formulario    ${Crear}[Municipio]
    Sleep    1
    Municipio - Presionar boton Guardar
    Sleep    1
    Validar Municipio en BD
    Seleccionar TAB Localidades
    Sleep    1
    Localidad - Capturar datos del formulario    ${Crear}[Localidad]
    Sleep    1
    Localidad - Presionar boton Guardar
    Validar mensaje    Registro guardado.
    Validar Localidad en BD
    [Teardown]    Close Browser

Localidad Crear - Validar opcion Guardar - Ver Detalle
    [Documentation]    Debera permitir guardar correctamente un Municipio.
    [Tags]    Localidad Crear - Validar opcion Guardar - Ver Detalle
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Obtener datos del formulario
    Sleep    1
    Estado - Presionar boton Guardar
    Sleep    1
    Seleccionar TAB Municipios
    Sleep    1
    Municipio - Capturar datos del formulario    ${Crear}[Municipio]
    Sleep    1
    Municipio - Presionar boton Guardar
    Sleep    1
    Seleccionar TAB Localidades
    Sleep    1
    Localidad - Capturar datos del formulario    ${Crear}[Localidad]
    Sleep    1
    Localidad - Presionar boton Guardar
    Sleep    1
    Cerrar modal del formulario
    Filtrar por Columna 1 y Campo ${Estado}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar TAB Municipios
    Sleep    1
    Municipio - Presionar ver detalle
    Sleep    1
    Seleccionar TAB Localidades
    Sleep    1
    Localidad - Presionar ver detalle
    Validar Municipio en BD    ${Estado}
    [Teardown]    Close Browser


Localidad Crear - Validar opcion Guardar 2 Localidades.
    [Documentation]    Debera guardar correctamente una Localidad.
    [Tags]    Localidad Crear - Validar opcion Guardar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Presionar boton Guardar
    Validar Estado en BD
    Seleccionar TAB Municipios
    Municipio - Capturar datos del formulario    ${Crear}[Municipio]
    Sleep    1
    Municipio - Presionar boton Guardar
    Validar Municipio en BD
    Seleccionar TAB Localidades
    Localidad - Capturar datos del formulario    ${Crear}[Localidad]
    Sleep    1
    Localidad - Presionar boton Guardar
    Validar Localidad en BD
    Sleep    1
    Localidad - Capturar datos del formulario    ${Crear}[Localidad]
    Sleep    1
    Localidad - Presionar boton Guardar
    Validar Localidad en BD
    [Teardown]    Close Browser

Localidad Crear - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de crear un nuevo registro 
        ...    y no debera de guardar en la BD.
    [Tags]    Localidad Crear - Validar opcion Cancelar - T37
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Presionar boton Guardar
    Validar Estado en BD
    Seleccionar TAB Municipios
    Municipio - Capturar datos del formulario    ${Crear}[Municipio]
    Sleep    1
    Municipio - Presionar boton Guardar
    Validar Municipio en BD
    Seleccionar TAB Localidades
    Localidad - Capturar datos del formulario    ${Crear}[Localidad]
    Sleep    1
    Localidad - Presionar boton Cancelar
    Validar Localidad inexistente en BD
    Validar campo vacio    //*[@id="loc_txtDescripcion"]
    [Teardown]    Close Browser

Localidad Crear - Mostrar campos obligatorios
    [Documentation]    Debera mostrar en color rojo los campos obligatorios.
    [Tags]    Localidad Crear - Mostrar campos obligatorios
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Presionar opcion Nuevo Registro    ${btnGuardar}
    Estado - Capturar datos del formulario    ${Crear}[Estado]
    Sleep    1
    Estado - Presionar boton Guardar
    Validar Estado en BD
    Seleccionar TAB Municipios
    Municipio - Capturar datos del formulario    ${Crear}[Municipio]
    Sleep    1
    Municipio - Presionar boton Guardar
    Validar Municipio en BD
    Seleccionar TAB Localidades
    Sleep    1
    Localidad - Presionar boton Guardar
    Localidad - Mostrar campos obligatorios
    [Teardown]    Close Browser

*** Keywords ***
Estado - Validar etiquetas
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Nuevo Estado
    Element Text Should Be    xpath=//*[@id="lnkTabGeneral"]    General
    Element Text Should Be    xpath=//*[@id="tabControl"]/div[1]/div/div[1]/div[2]/ul/li[2]    Municipios
    Element Text Should Be    xpath=//*[@id="tabControl"]/div[1]/div/div[1]/div[2]/ul/li[3]    Localidades
    Element Text Should Be    xpath=//*[@id="tabGeneral"]/div[1]/div[1]    Estado:
    ${ttGuardar}=    Get Element Attribute    xpath=//*[@id="gen_btnGaurdar"]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=//*[@id="tabGeneral"]/div[2]/div/div[2]    tooltip
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar

Estado - Capturar datos del formulario
    [Arguments]    ${arg1}
    Estado - Validar campo unico Descripcion    ${arg1}
    Input Text    xpath=//*[@id="gen_txtDescripcion"]/div/div[1]/input    ${EstadoUnico}

Estado - Capturar datos del formulario Descripcion duplicada
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="gen_txtDescripcion"]/div/div[1]/input    ${arg1}

Municipio - Validar etiquetas
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Estado de ${EstadoUnico}
    Element Text Should Be    xpath=//*[@id="lnkTabGridMunicipio"]    Municipios de ${EstadoUnico}
    Element Text Should Be    xpath=//*[@id="dx-col-13"]/div[2]    Descripción
    Element Text Should Be    xpath=//*[@id="dx-col-14"]/div[2]    Total de Localidades
    Element Text Should Be    xpath=//*[@id="dataGridMunicipios"]/div/div[5]/div/table/tbody/tr[1]/td[3]/div    Detalle
    Element Text Should Be    xpath=//*[@id="tabGridMunicipio"]/div/div[2]/div[1]/div[1]    Municipio:
    ${ttGuardar}=    Get Element Attribute    xpath=//*[@id="mpo_btnGaurdar"]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=//*[@id="tabGridMunicipio"]/div/div[2]/div[2]/div/div[2]    tooltip
    ${ttEliminar}=    Get Element Attribute    xpath=//*[@id="mpo_btnEliminar"]    tooltip
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    Should be equal    ${ttEliminar}    Eliminar

Municipio - Capturar datos del formulario
    [Arguments]    ${arg1}
    Municipio - Validar campo unico Descripcion    ${arg1}
    Input Text    xpath=//*[@id="mpo_txtDescripcion"]/div[1]/div[1]/input    ${MunicipioUnico}

Municipio - Capturar datos del formulario Descripcion duplicada
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="mpo_txtDescripcion"]/div[1]/div[1]/input    ${arg1}
    
Localidad - Validar etiquetas
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Estado de ${EstadoUnico}
    Element Text Should Be    xpath=//*[@id="lnkTabGridLocalidad"]    Localidades de ${MunicipioUnico}
    Element Text Should Be    xpath=//*[@id="dx-col-15"]/div[2]    Descripción
    Element Text Should Be    xpath=//*[@id="dataGridLocalidad"]/div/div[5]/div/table/tbody/tr[1]/td[2]/div    Detalle
    Element Text Should Be    xpath=//*[@id="tabGridLocalidad"]/div/div[2]/div[1]/div[1]    Localidad:
    ${ttGuardar}=    Get Element Attribute    xpath=//*[@id="loc_btnGaurdar"]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=//*[@id="tabGridLocalidad"]/div/div[2]/div[2]/div/div[2]    tooltip
    ${ttEliminar}=    Get Element Attribute    xpath=//*[@id="loc_btnEliminar"]    tooltip
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    Should be equal    ${ttEliminar}    Eliminar

Localidad - Capturar datos del formulario
    [Arguments]    ${arg1}
    Localidad - Validar campo unico Descripcion    ${arg1}
    Input Text    xpath=//*[@id="loc_txtDescripcion"]/div/div[1]/input    ${LocalidadUnica}

Localidad - Capturar datos del formulario Descripcion duplicada
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="loc_txtDescripcion"]/div/div[1]/input    ${arg1}