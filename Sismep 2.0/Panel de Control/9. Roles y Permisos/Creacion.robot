*** Settings ***
Resource    Recursos.RolesPermisos.robot

*** Variables ***
&{RolCrear}    Nombre=RFRol    Descripcion=RFDescripcion
&{RolExistente}    Nombre=Administrador    Descripcion=Administrador
&{PermisoCrear}    Descripcion=RFPermiso    Etiqueta=RFEtiqueta    Orden=10    Valor=10
${PermisoExistente}    Enviar comando

*** Test Cases ***
Crear Rol - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Crear Rol - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Nuevo Registro
    Validar etiquetas Nuevo Rol
    [Teardown]    Close Browser
    
Crear Rol - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente el Rol.
    [Tags]    Crear Rol - Validar opcion Guardar - T109
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Nuevo Registro
    Rol - Capturar datos del formulario    ${RolCrear}[Nombre]    ${RolCrear}[Descripcion]
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Rol - Obtener datos del formulario
    Validar Rol en BD
    Validar mensaje    Registro guardado.
    [Teardown]    Close Browser
    
Crear Rol - Agregar Permiso
    [Documentation]    Debera agregar correctamente un permiso al Rol.
    [Tags]    Crear Rol - Agregar Permiso - T114
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Nuevo Registro
    Rol - Capturar datos del formulario    ${RolCrear}[Nombre]    ${RolCrear}[Descripcion]
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Rol - Obtener datos del formulario
    Validar Rol en BD
    Presionar opcion Permisos
    Seleccionar Tipo de Permiso
    Sleep    1
    Seleccionar Permiso
    Presionar opcion Agregar permiso
    Sleep    1
    Obtener datos del Grid Permisos
    Sleep    1
    Validar Rol-Permiso en BD
    Validar mensaje    Registro guardado.
    [Teardown]    Close Browser
    
Crear Rol - Desactivar Permiso
    [Documentation]    Debera desactivar el permiso correctamente.
    [Tags]    Crear Rol - Desactivar Permiso - T113
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Nuevo Registro
    Rol - Capturar datos del formulario    ${RolCrear}[Nombre]    ${RolCrear}[Descripcion]
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Rol - Obtener datos del formulario
    Validar Rol en BD
    Presionar opcion Permisos
    Seleccionar Tipo de Permiso
    Sleep    1
    Seleccionar Permiso
    Presionar opcion Agregar permiso
    Sleep    2
    Obtener datos del Grid Permisos
    Sleep    1
    Validar Rol-Permiso en BD
    Presionar opcion Activar-Desactivar permiso
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar Rol-Permiso en BD    0
    Validar mensaje    Registro guardado.
    [Teardown]    Close Browser
    
Crear Rol - Reactivar Permiso
    [Documentation]    Debera reactivar correctamente el Permiso.
    [Tags]    Crear Rol - Reactivar Permiso - T112
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Nuevo Registro
    Rol - Capturar datos del formulario    ${RolCrear}[Nombre]    ${RolCrear}[Descripcion]
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Rol - Obtener datos del formulario
    Validar Rol en BD
    Presionar opcion Permisos
    Seleccionar Tipo de Permiso
    Sleep    1
    Seleccionar Permiso
    Presionar opcion Agregar permiso
    Sleep    1
    Obtener datos del Grid Permisos
    Sleep    1
    Validar Rol-Permiso en BD
    Presionar opcion Activar-Desactivar permiso
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar Rol-Permiso en BD    0
    TAB Permisos - Filtrar por Estatus    Inactivo
    Sleep    1
    Presionar opcion Activar-Desactivar permiso
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar Rol-Permiso en BD
    Validar mensaje    Registro guardado.
    [Teardown]    Close Browser
    
Crear Rol - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de crear sin guardar nada en la Base de Datos.
    [Tags]    Crear Rol - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Nuevo Registro
    Rol - Capturar datos del formulario    ${RolCrear}[Nombre]    ${RolCrear}[Descripcion]
    Sleep    1
    Rol - Obtener datos del formulario
    Presionar opcion Cancelar
    Sleep    1
    Validar Rol inexistente en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Crear Rol - Nombre duplicado
    [Documentation]    Debera mostrar una validacion indicando que el Nombre esta duplicado.
    [Tags]    Crear Rol - Nombre duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Nuevo Registro
    Rol - Capturar datos del formulario Nombre duplicado    ${RolExistente}[Nombre]    ${RolCrear}[Descripcion]
    Sleep    1
    Rol - Obtener datos del formulario
    Presionar opcion Guardar
    Validar mensaje    El registro ya existe.
    Sleep    1
    Validar Rol inexistente en BD
    [Teardown]    Close Browser
    
Crear Rol - Descripcion duplicada
    [Documentation]    Debera mostrar una validacion indicando que la Descripcion esta duplicada.
    [Tags]    Crear Rol - Descripcion duplicada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Nuevo Registro
    Rol - Capturar datos del formulario Descripcion duplicada     ${RolCrear}[Nombre]    ${RolExistente}[Descripcion]
    Sleep    1
    Rol - Obtener datos del formulario
    Presionar opcion Guardar
    Validar mensaje    El registro ya existe.
    Sleep    1
    Validar Rol inexistente en BD
    [Teardown]    Close Browser
    
Crear Rol - Validacion de campos requeridos
    [Documentation]    Debera mostrar en color rojo los campos obligatorios.
    [Tags]    Crear Rol - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Nuevo Registro
    Sleep    1
    Presionar opcion Guardar
    Sleep    1
    Rol - Validar campos requeridos
    [Teardown]    Close Browser
    
Crear Permiso - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Crear Permiso - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Presionar boton Nuevo Registro
    Validar etiquetas Nuevo Permiso
    [Teardown]    Close Browser
    
Crear Permiso - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente un permiso en la Base de datos.
    [Tags]    Crear Permiso - Validar opcion Guardar -T115
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Presionar boton Nuevo Registro
    Permiso - Capturar datos del formulario    ${PermisoCrear}[Descripcion]    ${PermisoCrear}[Etiqueta]
    Sleep    1
    Presionar opcion Guardar Permiso
    Sleep    2
    Permiso - Obtener datos del formulario
    Validar Permiso en BD
    Validar mensaje    Registro guardado.
    [Teardown]    Close Browser
    
Crear Permiso - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de crear un permiso sin guardar en la Base de datos.
    [Tags]    Crear Permiso - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Presionar boton Nuevo Registro
    Permiso - Capturar datos del formulario    ${PermisoCrear}[Descripcion]    ${PermisoCrear}[Etiqueta]
    Sleep    1
    Permiso - Obtener datos del formulario
    Presionar opcion Cancelar Permiso
    Sleep    1
    Validar Permiso inexistente en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Crear Permiso - Descripcion duplicada
    [Documentation]    Debera mostrar una validacion indicando que la descripcion esta duplicada.
    [Tags]    Crear Permiso - Descripcion duplicada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Presionar boton Nuevo Registro
    Permiso - Capturar datos del formulario Descripcion duplicada     ${PermisoCrear}[Etiqueta]
    Sleep    1
    Permiso - Obtener datos del formulario
    Presionar opcion Guardar Permiso
    Validar mensaje    El registro ya existe.
    Sleep    1
    Validar Permiso inexistente en BD
    [Teardown]    Close Browser
    
Crear Permiso - Validar campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Crear Permiso - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Presionar boton Nuevo Registro
    Sleep    1
    Presionar opcion Guardar Permiso
    Sleep    1
    Permiso - Validar campos obligatorios
    [Teardown]    Close Browser
    
*** Keywords ***
Presionar boton Nuevo Registro
    Click Element    xpath://*[@id="Panelroles"]/div/div[1]/div[2]/div[1]
    
Rol - Capturar datos del formulario
    [Arguments]    ${arg1}    ${arg2}
    Rol - Validar campo unico Nombre    ${arg1}
    Rol - Validar campo unico Descripcion    ${arg2}
    Sleep    1
    Input Text    xpath=//*[@id="txtNombreRol"]/div/div[1]/input    ${NombreUnico}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${DescripcionUnica}
    
Rol - Capturar datos del formulario Nombre duplicado
    [Arguments]    ${arg1}    ${arg2}
    Rol - Validar campo unico Descripcion    ${arg2}
    Sleep    1
    Input Text    xpath=//*[@id="txtNombreRol"]/div/div[1]/input    ${arg1}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${DescripcionUnica}
    
Rol - Capturar datos del formulario Descripcion duplicada
    [Arguments]    ${arg1}    ${arg2}
    Rol - Validar campo unico Nombre    ${arg1}
    Sleep    1
    Input Text    xpath=//*[@id="txtNombreRol"]/div/div[1]/input    ${NombreUnico}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${arg2}
    
Permiso - Capturar datos del formulario
    [Arguments]    ${arg1}    ${arg2}
    Permiso - Validar campo unico Descripcion    ${arg1}
    Permiso - Validar campo unico Etiqueta    ${arg2}
    Sleep    1
    Permiso - Seleccionar Tipo de Permiso
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${DescripcionUnica}
    Input Text    xpath=//*[@id="txtEtiqueta"]/div/div[1]/input    ${EtiquetaUnica}
    Input Text    xpath=//*[@id="txtOrden"]/div/div[1]/input    ${PermisoCrear}[Orden]
    Input Text    xpath=//*[@id="txtValor"]/div/div[1]/input    ${PermisoCrear}[Valor]
    
Permiso - Capturar datos del formulario Descripcion duplicada
    [Arguments]    ${arg1}
    Permiso - Validar campo unico Etiqueta    ${arg1}
    Sleep    1
    Permiso - Seleccionar Tipo de Permiso
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${PermisoExistente}
    Input Text    xpath=//*[@id="txtEtiqueta"]/div/div[1]/input    ${EtiquetaUnica}
    Input Text    xpath=//*[@id="txtOrden"]/div/div[1]/input    ${PermisoCrear}[Orden]
    Input Text    xpath=//*[@id="txtValor"]/div/div[1]/input    ${PermisoCrear}[Valor]
    
Permiso - Seleccionar Tipo de Permiso
    Execute JavaScript    document.evaluate('//*[@id="cbTipoPermiso"]/div[1]/div/div[2]/div[2]',document.body,null,9,null).singleNodeValue.click();
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]/div
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[2]/div
    
Permiso - Validar campos obligatorios
    ${Tipo}    Execute Javascript    return document.getElementsByClassName("sismep-selectbox dx-selectbox dx-textbox dx-texteditor dx-dropdowneditor-button-visible dx-editor-outlined dx-texteditor-empty dx-widget dx-dropdowneditor dx-dropdowneditor-field-clickable dx-validator dx-visibility-change-handler dx-invalid")[0].textContent;
    ${attrTipo}    Execute Javascript    cadena='${Tipo}'; return cadena.substr(length-11);
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="txtDescripcion"]    textContent
    ${attrOrden}=    Get Element Attribute    xpath=//*[@id="txtOrden"]    textContent
    #${attrValor}=    Get Element Attribute    xpath=//*[@id="txtValor"]    textContent
    Should be equal    ${attrTipo}    Obligatorio
    Should be equal    ${attrDescripcion}    Obligatorio
    Should be equal    ${attrOrden}    Obligatorio
    #Should be equal    ${attrValor}    Obligatorio
    
Validar etiquetas Nuevo Rol
    ${ttGuardar}=    Get Element Attribute    xpath=//*[@id="tab1"]/div[4]/div/div[1]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=//*[@id="tab1"]/div[4]/div/div[2]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Nuevo Rol
    Element Text Should Be    xpath=//*[@id="lnkTab1"]    Rol
    Element Text Should Be    xpath=//*[@id="tab1"]/div[1]/div[1]    Nombre Rol:
    Element Text Should Be    xpath=//*[@id="tab1"]/div[2]/div[1]    Descripci\u00F3n:
    Element Text Should Be    xpath=//*[@id="tab1"]/div[3]/div[1]    Estatus:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    
Validar etiquetas Nuevo Permiso
    ${ttGuardar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[7]/div/div[1]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[7]/div/div[2]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Nuevo Permiso
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[1]    Tipo de Permiso:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[1]    Descripci\u00F3n:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[3]/div[1]    Etiqueta:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[4]/div[1]    Orden:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div[1]    Valor:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[6]/div[1]    Estatus:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar