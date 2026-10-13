*** Settings ***
Resource    Recursos.EML.robot

*** Variables ***
&{Editar}    Estado=RFEditarEstado    Municipio=RFEditarMunicipio    Localidad=RFEditarLocalidad
${EstadoExistente}    AGUASCALIENTES
&{Filtro}    Descripcion=RFEs    TotalMpo=0

*** Test Cases ***
Estado Editar - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Editar - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Ingresar al detalle del registro No. 1 en el grid
    Validar etiquetas
    [Teardown]    Close Browser

Estado Editar - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente los cambios realizados en la BD.
    [Tags]    Estado Editar - Validar opcion Guardar - T38
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Editar datos del formulario    ${Editar}[Estado]
    Sleep    1
    Estado - Presionar boton Guardar
    Validar mensaje    Registro guardado.
    Validar Estado en BD
    [Teardown]    Close Browser

Estado Editar - Validar opcion Guardar - Ver Detalle
    [Documentation]    Debera guardar correctamente los cambios realizados en la BD.
    [Tags]    Estado Editar - Validar opcion Guardar . Ver Detalle
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Editar datos del formulario    ${Editar}[Estado]
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

Estado Editar - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de editar y no guardar los cambios en BD.
    [Tags]    Estado Editar - Validar opcion Cancelar - T39
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Editar datos del formulario    ${Editar}[Estado]
    Sleep    1
    Estado - Presionar boton Cancelar
    Sleep    1
    Validar Estado inexistente en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser

Estado Editar - Validar opcion Eliminar
    [Documentation]    Debera eliminar el Estado seleccionado correctamente de la BD.
    [Tags]    Estado Editar - Validar opcion Eliminar - T42
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 2 y Campo ${Filtro}[TotalMpo]
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Estado - Obtener datos del formulario
    Estado - Presionar boton Eliminar
    Sleep    1
    Confirmar accion
    Validar mensaje    Registro eliminado.    3  
    Validar Estado inexistente en BD    ${Estado}
    [Teardown]    Close Browser

Estado Editar - Validar mensaje de confirmación al Eliminar Estado con Municipios
    [Documentation]    Debera mostrar un mensaje indicando que no es posible realizar la accion.
    [Tags]    Estado Editar - Validar mensaje de confirmación al Eliminar Estado con Municipios
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 2 y Campo 1
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Estado - Obtener datos del formulario
    Estado - Presionar boton Eliminar
    Sleep    1
    Confirmar accion
    Validar mensaje    No se puede Borrar, se encuentra referenciado por otro registro(s).
    [Teardown]    Close Browser

Estado Editar - Descripcion duplicada
    [Documentation]    Debera mostrar una validacion indicando que el registro ya existe.
    [Tags]    Estado Editar - Descripcion duplicada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Editar datos del formulario Descripcion duplicada    ${EstadoExistente}
    Sleep    1
    Estado - Presionar boton Guardar
    Validar mensaje    El registro ya existe.
    [Teardown]    Close Browser

Estado Editar - Mostrar campos obligatorios
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Estado Editar - Mostrar campos obligatorios
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Estado - Dejar vacio el formulario
    Estado - Presionar boton Guardar
    Estado - Mostrar campos obligatorios
    [Teardown]    Close Browser

Municipio Editar - Validar opcion Guardar
    [Documentation]    Debera guardar los cambios realizados al Municipio en la BD.
    [Tags]    Municipio Editar - Validar opcion Guardar - t43
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 2 y Campo 1
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Municipio - Editar datos del formulario    ${Editar}[Municipio]
    Sleep    1
    Municipio - Presionar boton Guardar
    Validar mensaje    Registro guardado.
    Validar Municipio en BD    ${Estado}
    [Teardown]    Close Browser

Municipio Editar - Validar opcion Guardar - Ver Detalle
    [Documentation]    Debera guardar los cambios realizados al Municipio en la BD.
    [Tags]    Municipio Editar - Validar opcion Guardar - Ver Detalle
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 2 y Campo 1
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Municipio - Editar datos del formulario    ${Editar}[Municipio]
    Sleep    1
    Municipio - Presionar boton Guardar
    Sleep    1
    Cerrar modal del formulario
    Sleep    1
    Filtrar por Columna 1 y Campo ${Estado}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar TAB Municipios
    Sleep    1
    Municipio - Obtener datos del formulario
    Validar Municipio en BD    ${Estado}
    [Teardown]    Close Browser

Municipio Editar - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de editar sin guardar ningun cambio en la BD.
    [Tags]    Municipio Editar - Validar opcion Cancelar - T44
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 2 y Campo 1
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Municipio - Editar datos del formulario    ${Editar}[Municipio]
    Sleep    1
    Municipio - Presionar boton Cancelar
    Sleep    1
    Validar Municipio inexistente en BD    ${Estado}
    Validar campo vacio    //*[@id="mpo_txtDescripcion"]
    [Teardown]    Close Browser

Municipio Editar - Validar opcion Eliminar
    [Documentation]    Debera eliminar el Municipio de la BD correctamente.
    [Tags]    Municipio Editar - Validar opcion Eliminar - T47
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 2 y Campo 1
    Filtrar por Columna 3 y Campo 0
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Municipios
    Validar boton Eliminar desactivado    //*[@id="mpo_btnEliminar"]
    Municipio - Presionar ver detalle
    Municipio - Obtener datos del formulario
    Sleep    1
    Municipio - Presionar boton Eliminar
    Sleep    1
    Confirmar accion
    Validar mensaje    Registro eliminado.
    Validar Municipio inexistente en BD    ${Estado}    ${Municipio}
    [Teardown]    Close Browser
    
Municipio Editar - Validar mensaje de confirmación al Eliminar Municipio con Localidades
    [Documentation]    Debera eliminar el Municipio de la BD correctamente.
    [Tags]    Municipio Editar - Validar mensaje de confirmación al Eliminar Municipio con Localidades
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 3 y Campo 1
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Municipio - Obtener datos del formulario
    Sleep    1
    Municipio - Presionar boton Eliminar
    Sleep    1
    Confirmar accion
    Validar mensaje    No se puede Borrar, se encuentra referenciado por otro registro(s).
    [Teardown]    Close Browser

Municipio Editar - Mostrar campos obligatorios
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Municipio Editar - Mostrar campos obligatorios
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 2 y Campo 1
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Sleep    1
    Municipio - Dejar vacio el formulario
    Municipio - Presionar boton Guardar
    Sleep    1
    Municipio - Mostrar campos obligatorios
    [Teardown]    Close Browser

Municipio Editar - Validar campo Municipio vacio
    [Documentation]    Al cerrar el modal debera de limpiar el campo de municipio.
    [Tags]    Municipio Editar - Validar campo Municipio vacio
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 2 y Campo 1
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Cerrar modal del formulario
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 2 y Campo 1
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Seleccionar TAB Municipios
    Validar campo vacio    //*[@id="mpo_txtDescripcion"]
    [Teardown]    Close Browser

Localidad Editar - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente los cambios realizados en la BD.
    [Tags]    Localidad Editar - Validar opcion Guardar - T48
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 3 y Campo 1
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Municipio - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Localidades
    Localidad - Presionar ver detalle
    Localidad - Editar datos del formulario    ${Editar}[Localidad]
    Sleep    1
    Localidad - Presionar boton Guardar
    Validar mensaje    Registro guardado.
    Validar Localidad en BD    ${Estado}    ${Municipio}
    [Teardown]    Close Browser

Localidad Editar - Validar opcion Guardar - Ver Detalle
    [Documentation]    Debera guardar correctamente los cambios realizados en la BD.
    [Tags]    Localidad Editar - Validar opcion Guardar - Ver Detalle
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 3 y Campo 1
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Municipio - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Localidades
    Localidad - Presionar ver detalle
    Localidad - Editar datos del formulario    ${Editar}[Localidad]
    Sleep    1
    Localidad - Presionar boton Guardar
    Sleep    1
    Cerrar modal del formulario
    Sleep    1
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
    Validar Localidad en BD    ${Estado}    ${Municipio}
    [Teardown]    Close Browser

Localidad Editar - Validar opcion Editar 2 Localidades.
    [Documentation]    Debera permitir editar dos localidades seguidas.
    [Tags]    Localidad Editar - Validar opcion Guardar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 3 y Campo 2
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Municipio - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Localidades
    Sleep    2
    Localidad - Presionar ver detalle
    Localidad - Editar datos del formulario    ${Editar}[Localidad]
    Sleep    1
    Localidad - Presionar boton Guardar
    Validar mensaje    Registro guardado.
    Validar Localidad en BD    ${Estado}    ${Municipio}
    Localidad - Presionar ver detalle
    Localidad - Editar datos del formulario    ${Editar}[Localidad]
    Sleep    1
    Localidad - Presionar boton Guardar
    Validar mensaje    Registro guardado.
    Validar Localidad en BD    ${Estado}    ${Municipio}
    [Teardown]    Close Browser

Localidad Editar - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de editar y no guardar cambios en la BD.
    [Tags]    Localidad Editar - Validar opcion Cancelar - T49
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 3 y Campo 1
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Municipio - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Localidades
    Localidad - Presionar ver detalle
    Localidad - Editar datos del formulario    ${Editar}[Localidad]
    Sleep    1
    Localidad - Presionar boton Cancelar
    Sleep    1
    Validar Localidad inexistente en BD    ${Estado}    ${Municipio}
    Validar campo vacio    //*[@id="loc_txtDescripcion"]
    [Teardown]    Close Browser

Localidad Editar - Mostrar campos obligatorios
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Localidad Editar - Mostrar campos obligatorios
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 3 y Campo 1
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Sleep    1
    Seleccionar TAB Localidades
    Localidad - Presionar ver detalle
    Sleep    1
    Localidad - Dejar vacio el formulario
    Localidad - Presionar boton Guardar
    Localidad - Mostrar campos obligatorios
    [Teardown]    Close Browser
    
Localidad Editar - Validar opcion Eliminar
    [Documentation]    Debera eliminar correctamente la Localidad de la BD.
    [Tags]    Localidad Editar - Validar opcion Eliminar - T51
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 3 y Campo 1
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Estado - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Municipio - Obtener datos del formulario
    Sleep    1
    Seleccionar TAB Localidades
    Validar boton Eliminar desactivado    //*[@id="loc_btnEliminar"]
    Localidad - Presionar ver detalle
    Localidad - Obtener datos del formulario
    Sleep    1
    Localidad - Presionar boton Eliminar
    Sleep    1
    Confirmar accion
    Validar mensaje    Registro eliminado.
    Validar Localidad inexistente en BD    ${Estado}    ${Municipio}    ${Localidad}
    [Teardown]    Close Browser

Localidad Editar - Validar campo Localidad vacio
    [Documentation]    Al cerrar el modal debera limpiar el campo de Localidad.
    [Tags]    Localidad Editar - Validar campo Localidad vacio
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Estados, Municipios y Localidades
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 3 y Campo 2
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Sleep    1
    Seleccionar TAB Localidades
    Sleep    1
    Localidad - Presionar ver detalle
    Cerrar modal del formulario
    Filtrar por Columna 1 y Campo ${Filtro}[Descripcion]
    Filtrar por Columna 3 y Campo 2
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar TAB Municipios
    Municipio - Presionar ver detalle
    Sleep    1
    Seleccionar TAB Localidades
    Validar campo vacio    //*[@id="loc_txtDescripcion"]
    [Teardown]    Close Browser

*** Keywords ***
Validar etiquetas
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div
    Estado - Obtener datos del formulario
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Estado de ${Estado}
    Element Text Should Be    xpath=//*[@id="lnkTabGeneral"]    General
    Element Text Should Be    xpath=//*[@id="tabControl"]/div[1]/div/div[1]/div[2]/ul/li[2]    Municipios de ${Estado}
    Element Text Should Be    xpath=//*[@id="tabControl"]/div[1]/div/div[1]/div[2]/ul/li[3]    Localidades
    Element Text Should Be    xpath=//*[@id="tabGeneral"]/div[1]/div[1]    Estado:
    ${ttEdoGuardar}=    Get Element Attribute    xpath=//*[@id="gen_btnGaurdar"]    tooltip
    ${ttEdoCancelar}=    Get Element Attribute    xpath=//*[@id="tabGeneral"]/div[2]/div/div[2]    tooltip
    ${ttEdoEliminar}=    Get Element Attribute    xpath=//*[@id="gen_btnEliminar"]    tooltip
    Should be equal    ${ttEdoGuardar}    Guardar
    Should be equal    ${ttEdoCancelar}    Cancelar
    Should be equal    ${ttEdoEliminar}    Eliminar
    Seleccionar TAB Municipios
    Wait Until Element Is Visible    xpath=//*[@id="dx-col-13"]/div[2]
    Element Text Should Be    xpath=//*[@id="dx-col-13"]/div[2]    Descripción
    Element Text Should Be    xpath=//*[@id="dx-col-14"]/div[2]    Total de Localidades
    Element Text Should Be    xpath=//*[@id="dataGridMunicipios"]/div/div[5]/div/table/tbody/tr[1]/td[3]/div    Detalle
    Element Text Should Be    xpath=//*[@id="tabGridMunicipio"]/div/div[2]/div[1]/div[1]    Municipio:
    ${ttMpoGuardar}=    Get Element Attribute    xpath=//*[@id="mpo_btnGaurdar"]    tooltip
    ${ttMpoCancelar}=    Get Element Attribute    xpath=//*[@id="tabGridMunicipio"]/div/div[2]/div[2]/div/div[2]    tooltip
    ${ttMpoEliminar}=    Get Element Attribute    xpath=//*[@id="mpo_btnEliminar"]    tooltip
    Should be equal    ${ttMpoGuardar}    Guardar
    Should be equal    ${ttMpoCancelar}    Cancelar
    Should be equal    ${ttMpoEliminar}    Eliminar
    Seleccionar TAB Localidades
    Municipio - Obtener datos del formulario
    Wait Until Element Is Visible    xpath=//*[@id="dx-col-15"]/div[2]
    Element Text Should Be    xpath=//*[@id="lnkTabGridLocalidad"]    Localidades de ${Municipio}
    Element Text Should Be    xpath=//*[@id="dx-col-15"]/div[2]    Descripción
    Element Text Should Be    xpath=//*[@id="dataGridLocalidad"]/div/div[5]/div/table/tbody/tr[1]/td[2]/div    Detalle
    Element Text Should Be    xpath=//*[@id="tabGridLocalidad"]/div/div[2]/div[1]/div[1]    Localidad:
    ${ttLocGuardar}=    Get Element Attribute    xpath=//*[@id="loc_btnGaurdar"]    tooltip
    ${ttLocCancelar}=    Get Element Attribute    xpath=//*[@id="tabGridLocalidad"]/div/div[2]/div[2]/div/div[2]    tooltip
    ${ttLocEliminar}=    Get Element Attribute    xpath=//*[@id="loc_btnEliminar"]    tooltip
    Should be equal    ${ttLocGuardar}    Guardar
    Should be equal    ${ttLocCancelar}    Cancelar
    Should be equal    ${ttLocEliminar}    Eliminar

Estado - Editar datos del formulario
    [Arguments]    ${arg1}
    Estado - Validar campo unico Descripcion    ${arg1}
    Input Text    xpath=//*[@id="gen_txtDescripcion"]/div/div[1]/input    ${EstadoUnico}

Estado - Editar datos del formulario Descripcion duplicada
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="gen_txtDescripcion"]/div/div[1]/input    ${arg1}

Estado - Dejar vacio el formulario
    Input Text    xpath=//*[@id="gen_txtDescripcion"]/div/div[1]/input    ${EMPTY}

Municipio - Presionar ver detalle
    Wait Until Element Is Visible    xpath=//*[@id="dataGridMunicipios"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div/div
    Click Element    xpath=//*[@id="dataGridMunicipios"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div/div
    
Municipio - Editar datos del formulario
    [Arguments]    ${arg1}
    Municipio - Validar campo unico Descripcion    ${arg1}
    Input Text    xpath=//*[@id="mpo_txtDescripcion"]/div[1]/div[1]/input    ${MunicipioUnico}

Municipio - Editar datos del formulario Descripcion duplicada
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="mpo_txtDescripcion"]/div[1]/div[1]/input    ${arg1}
        
Municipio - Dejar vacio el formulario
    Input Text    xpath=//*[@id="mpo_txtDescripcion"]/div/div[1]/input    ${EMPTY}
    
Localidad - Editar datos del formulario
    [Arguments]    ${arg1}
    Localidad - Validar campo unico Descripcion    ${arg1}
    Input Text    xpath=//*[@id="loc_txtDescripcion"]/div/div[1]/input    ${LocalidadUnica}

Localidad - Editar datos del formulario Descripcion duplicada
    [Arguments]    ${arg1}
    Input Text    xpath=//*[@id="loc_txtDescripcion"]/div/div[1]/input    ${arg1}
    
Localidad - Dejar vacio el formulario
    Input Text    xpath=//*[@id="loc_txtDescripcion"]/div/div[1]/input    ${EMPTY}
    
Confirmar accion
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div[2]/div/div
    Click Element    xpath=/html/body/div[4]/div/div/div[3]/div/div[2]/div[2]/div/div