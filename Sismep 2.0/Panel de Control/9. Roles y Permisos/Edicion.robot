*** Settings ***
Resource    Recursos.RolesPermisos.robot

*** Variables ***
&{RolEditar}    Nombre=RFRolEditar    Descripcion=RFDescripcionEditar
&{RolExistente}    Nombre=Administrador    Descripcion=Administrador
&{PermisoEditar}    Descripcion=RFPermisoEditar    Etiqueta=RFEtiquetaEditar    Orden=50    Valor=50
${PermisoExistente}    Enviar comando
${RolNombre}    RFRol
${PermisoDescripcion}    RFPermiso

*** Test Cases ***
Editar Rol - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Editar Rol - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Rol - Ingresar al detalle del registro No. 1 en el grid
    Validar etiquetas Editar Rol
    [Teardown]    Close Browser
    
Editar Rol - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente los cambios realizados en el Rol.
    [Tags]    Editar Rol - Validar opcion Guardar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Filtrar por Columna 1 y Campo ${RolNombre}
    Sleep    1
    Rol - Ingresar al detalle del registro No. 1 en el grid
    Rol - Editar datos del formulario    ${RolEditar}[Nombre]    ${RolEditar}[Descripcion]
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Rol - Obtener datos del formulario
    Validar Rol en BD
    Validar mensaje    Registro guardado.
    [Teardown]    Close Browser
    
Editar Rol - Agregar Permiso
    [Documentation]    Debera agregar correctamente un Permiso.
    [Tags]    Editar Rol - Agregar Permiso
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Obtener Rol sin Permisos
    Filtrar por Columna 1 y Campo ${rol}
    Sleep    1
    Rol - Ingresar al detalle del registro No. 1 en el grid
    Rol - Obtener datos del formulario
    Sleep    1
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
    
Editar Rol - Desactivar Permiso
    [Documentation]    Debera desactivar correctamente el Permiso.
    [Tags]    Editar Rol - Desactivar Permiso - T119
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Obtener Rol con Permisos
    Filtrar por Columna 1 y Campo ${rol}
    Sleep    1
    Rol - Ingresar al detalle del registro No. 1 en el grid
    Rol - Obtener datos del formulario
    Sleep    1
    Presionar opcion Permisos
    Sleep    1
    Obtener datos del Grid Permisos
    Sleep    1
    Presionar opcion Activar-Desactivar permiso
    Sleep    1
    Confirmar Accion
    Sleep    2
    Validar Rol-Permiso en BD    0
    Validar mensaje    Registro guardado.
    [Teardown]    Close Browser
    
Editar Rol - Reactivar Permiso
    [Documentation]    Debera reactivar correctamente el Permiso.
    [Tags]    Editar Rol - Reactivar Permiso - T118
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Obtener Rol con Permisos Inactivo
    Filtrar por Columna 1 y Campo ${rol}
    Sleep    1
    Rol - Ingresar al detalle del registro No. 1 en el grid
    Rol - Obtener datos del formulario
    Sleep    1
    Presionar opcion Permisos
    TAB Permisos - Filtrar por Estatus    Inactivo
    Sleep    1
    Obtener datos del Grid Permisos
    Presionar opcion Activar-Desactivar permiso
    Sleep    1
    Confirmar Accion
    Sleep    2
    Validar Rol-Permiso en BD
    Validar mensaje    Registro guardado.
    [Teardown]    Close Browser
    
Editar Rol - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de edicion.
    [Tags]    Editar Rol - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Filtrar por Columna 1 y Campo ${RolNombre}
    Sleep    1
    Rol - Ingresar al detalle del registro No. 1 en el grid
    Rol - Editar datos del formulario    ${RolEditar}[Nombre]    ${RolEditar}[Descripcion]
    Sleep    1
    Rol - Obtener datos del formulario
    Presionar opcion Cancelar
    Sleep    2
    Validar Rol inexistente en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Editar Rol - Nombre duplicado
    [Documentation]    Debera mostrar una validacion indicando que el Nombre esta duplicado.
    [Tags]    Editar Rol - Nombre duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Filtrar por Columna 1 y Campo ${RolNombre}
    Sleep    1
    Rol - Ingresar al detalle del registro No. 1 en el grid
    Rol - Editar datos del formulario Nombre duplicado    ${RolExistente}[Nombre]    ${RolEditar}[Descripcion]
    Sleep    1
    Rol - Obtener datos del formulario
    Presionar opcion Guardar
    Validar mensaje    El registro ya existe.
    Sleep    1
    Validar Rol inexistente en BD
    [Teardown]    Close Browser
    
Editar Rol - Descripcion duplicada
    [Documentation]    Debera mostrar una validacion indicando que la Descripcion esta duplicado.
    [Tags]    Editar Rol - Descripcion duplicada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Filtrar por Columna 1 y Campo ${RolNombre}
    Sleep    1
    Rol - Ingresar al detalle del registro No. 1 en el grid
    Rol - Editar datos del formulario Descripcion duplicada     ${RolEditar}[Nombre]    ${RolExistente}[Descripcion]
    Sleep    1
    Rol - Obtener datos del formulario
    Presionar opcion Guardar
    Validar mensaje    El registro ya existe.
    Sleep    1
    Validar Rol inexistente en BD
    [Teardown]    Close Browser
    
Editar Rol - Validacion de campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Editar Rol - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Rol - Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Rol - Dejar vacio los campos del formulario
    Presionar opcion Guardar
    Sleep    1
    Rol - Validar campos requeridos
    [Teardown]    Close Browser
    
Editar Permiso - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente escritas las etiquetas y tooltips.
    [Tags]    Editar Permiso - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Permiso - Ingresar al detalle del registro No. 1 en el grid
    Validar etiquetas Editar Permiso
    [Teardown]    Close Browser
    
Editar Permiso - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente el Permiso.
    [Tags]    Editar Permiso - Validar opcion Guardar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Filtrar por Columna 1 y Campo ${PermisoDescripcion}
    Sleep    1
    Permiso - Ingresar al detalle del registro No. 1 en el grid
    Permiso - Editar datos del formulario    ${PermisoEditar}[Descripcion]    ${PermisoEditar}[Etiqueta]
    Sleep    1
    Presionar opcion Guardar Permiso
    Sleep    2
    Permiso - Obtener datos del formulario
    Validar Permiso en BD
    Validar mensaje    Registro guardado.
    [Teardown]    Close Browser
    
Editar Permiso - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de edicion sin guardar cambios en la Base de Datos.
    [Tags]    Editar Permiso - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Filtrar por Columna 1 y Campo ${PermisoDescripcion}
    Sleep    1
    Permiso - Ingresar al detalle del registro No. 1 en el grid
    Permiso - Editar datos del formulario    ${PermisoEditar}[Descripcion]    ${PermisoEditar}[Etiqueta]
    Sleep    1
    Permiso - Obtener datos del formulario
    Presionar opcion Cancelar Permiso
    Sleep    2
    Validar Permiso inexistente en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Editar Permiso - Descripcion duplicada
    [Documentation]    Debera mostrar una validacion indicando que la Descripcion esta duplicado.
    [Tags]    Editar Permiso - Descripcion duplicada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Filtrar por Columna 1 y Campo ${PermisoDescripcion}
    Sleep    1
    Permiso - Ingresar al detalle del registro No. 1 en el grid
    Permiso - Editar datos del formulario Descripcion duplicada     ${PermisoEditar}[Etiqueta]
    Sleep    1
    Permiso - Obtener datos del formulario
    Presionar opcion Guardar Permiso
    Validar mensaje    El registro ya existe.
    Sleep    1
    Validar Permiso inexistente en BD
    [Teardown]    Close Browser
    
Editar Permiso - Validar campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Editar Permiso - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Permiso - Ingresar al detalle del registro No. 1 en el grid
    Permiso - Dejar vacio los campos del formulario
    Sleep    1
    Presionar opcion Guardar Permiso
    Sleep    1
    Permiso - Validar campos obligatorios
    [Teardown]    Close Browser

Editar Permiso - Validar campos requeridos ocultos
    [Documentation]    Debera ocultar los campos obligatorios.
    [Tags]    Editar Permiso - Validar campos requeridos ocultos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Roles y Permisos
    Presionar boton Catalogo de Permisos
    Permiso - Ingresar al detalle del registro No. 1 en el grid
    Permiso - Dejar vacio los campos del formulario
    Sleep    1
    Presionar opcion Cancelar Permiso
    Sleep    1
    TAB Permisos - Filtrar por Orden    0
    Sleep    2
    Permiso - Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Permiso - Validacion de campos obligatorios ocultos
    [Teardown]    Close Browser
    
*** Keywords ***
Rol - Ingresar al detalle del registro No. ${arg1} en el grid
    Click Element    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[4]/div
    Wait Until Page Contains Element    xpath=//*[@id="DeleteButton"]
        
Rol - Editar datos del formulario
    [Arguments]    ${arg1}    ${arg2}
    Rol - Validar campo unico Nombre    ${arg1}
    Rol - Validar campo unico Descripcion    ${arg2}
    Sleep    1
    Input Text    xpath=//*[@id="txtNombreRol"]/div/div[1]/input    ${NombreUnico}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${DescripcionUnica}
    
Rol - Editar datos del formulario Nombre duplicado
    [Arguments]    ${arg1}    ${arg2}
    Rol - Validar campo unico Descripcion    ${arg2}
    Sleep    1
    Input Text    xpath=//*[@id="txtNombreRol"]/div/div[1]/input    ${arg1}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${DescripcionUnica}
    
Rol - Editar datos del formulario Descripcion duplicada
    [Arguments]    ${arg1}    ${arg2}
    Rol - Validar campo unico Nombre    ${arg1}
    Sleep    1
    Input Text    xpath=//*[@id="txtNombreRol"]/div/div[1]/input    ${NombreUnico}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${arg2}
    
Rol - Dejar vacio los campos del formulario
    Input Text    xpath=//*[@id="txtNombreRol"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${EMPTY}
    
Permiso - Ingresar al detalle del registro No. ${arg1} en el grid
    ${gridDescripcion}=    Get text    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    Click Element    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[5]/div
    Wait Until Page Contains Element    xpath=//*[@id="DeleteButton"]
    Set Test Variable    ${gridDescripcion}
    
Permiso - Editar datos del formulario
    [Arguments]    ${arg1}    ${arg2}
    Permiso - Validar campo unico Descripcion    ${arg1}
    Permiso - Validar campo unico Etiqueta    ${arg2}
    Sleep    1
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${DescripcionUnica}
    Input Text    xpath=//*[@id="txtEtiqueta"]/div/div[1]/input    ${EtiquetaUnica}
    Input Text    xpath=//*[@id="txtOrden"]/div/div[1]/input    ${PermisoEditar}[Orden]
    Input Text    xpath=//*[@id="txtValor"]/div/div[1]/input    ${PermisoEditar}[Valor]
    
Permiso - Editar datos del formulario Descripcion duplicada
    [Arguments]    ${arg1}
    Permiso - Validar campo unico Etiqueta    ${arg1}
    Sleep    1
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${PermisoExistente}
    Input Text    xpath=//*[@id="txtEtiqueta"]/div/div[1]/input    ${EtiquetaUnica}
    Input Text    xpath=//*[@id="txtOrden"]/div/div[1]/input    ${PermisoEditar}[Orden]
    Input Text    xpath=//*[@id="txtValor"]/div/div[1]/input    ${PermisoEditar}[Valor]
    
Permiso - Dejar vacio los campos del formulario
    Input Text    xpath=//*[@id="txtDescripcion"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtEtiqueta"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtOrden"]/div/div[1]/input    ${EMPTY}
    Input Text    xpath=//*[@id="txtValor"]/div/div[1]/input    ${EMPTY}
    
Permiso - Validar campos obligatorios
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="txtDescripcion"]    textContent
    ${attrOrden}=    Get Element Attribute    xpath=//*[@id="txtOrden"]    textContent
    #${attrValor}=    Get Element Attribute    xpath=//*[@id="txtValor"]    textContent
    Should be equal    ${attrDescripcion}    Obligatorio
    Should be equal    ${attrOrden}    Obligatorio
    #Should be equal    ${attrValor}    Obligatorio

Permiso - Validacion de campos obligatorios ocultos
    ${attrDescripcion}=    Get Element Attribute    xpath=//*[@id="txtDescripcion"]    textContent
    ${attrOrden}=    Get Element Attribute    xpath=//*[@id="txtOrden"]    textContent
    Should Be Empty    ${attrDescripcion}
    Should Be Empty    ${attrOrden}

Validar etiquetas Editar Rol
    ${ttGuardar}=    Get Element Attribute    xpath=//*[@id="tab1"]/div[4]/div/div[1]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=//*[@id="tab1"]/div[4]/div/div[2]    tooltip
    ${ttEliminar}=    Get Element Attribute    xpath=//*[@id="DeleteButton"]    tooltip
    ${ttReactivar}=    Get Element Attribute    xpath=//*[@id="ReactivarButton"]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Editar Rol
    Element Text Should Be    xpath=//*[@id="lnkTab1"]    Rol
    Element Text Should Be    xpath=//*[@id="tab1"]/div[1]/div[1]    Nombre Rol:
    Element Text Should Be    xpath=//*[@id="tab1"]/div[2]/div[1]    Descripci\u00F3n:
    Element Text Should Be    xpath=//*[@id="tab1"]/div[3]/div[1]    Estatus:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    Should be equal    ${ttEliminar}    Eliminar
    Should be equal    ${ttReactivar}    Reactivar
    
Validar etiquetas Editar Permiso
    ${ttGuardar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[7]/div/div[1]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=/html/body/div[3]/div/div[2]/div/div[7]/div/div[2]    tooltip
    ${ttEliminar}=    Get Element Attribute    xpath=//*[@id="DeleteButton"]    tooltip
    ${ttReactivar}=    Get Element Attribute    xpath=//*[@id="ReactivarButton"]    tooltip
    Element Text Should Be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Editar Permiso ${gridDescripcion}
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[1]    Tipo de Permiso:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[1]    Descripci\u00F3n:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[3]/div[1]    Etiqueta:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[4]/div[1]    Orden:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[5]/div[1]    Valor:
    Element Text Should Be    xpath=/html/body/div[3]/div/div[2]/div/div[6]/div[1]    Estatus:
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar
    Should be equal    ${ttEliminar}    Eliminar
    Should be equal    ${ttReactivar}    Reactivar
    
Obtener Rol sin Permisos
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 r.RoleName from aspnet_Roles r left join Sismep.TSismepRolesPermisos rp on r.RoleId = rp.IdRol left join Sismep.TSismepPermisos p on rp.IdPermiso = p.IdPermiso left join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where r.RoleName like '${RolNombre}%' and p.Descripcion is null
    Set Test Variable    ${rol}    ${queryResults[0][0]}
    Disconnect From Database
    
Obtener Rol con Permisos
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 r.RoleName from aspnet_Roles r join Sismep.TSismepRolesPermisos rp on r.RoleId = rp.IdRol join Sismep.TSismepPermisos p on rp.IdPermiso = p.IdPermiso join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where r.RoleName like '${RolNombre}%' and rp.Activo=1
    Set Test Variable    ${rol}    ${queryResults[0][0]}
    Disconnect From Database
    
Obtener Rol con Permisos Inactivo
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 r.RoleName from aspnet_Roles r join Sismep.TSismepRolesPermisos rp on r.RoleId = rp.IdRol join Sismep.TSismepPermisos p on rp.IdPermiso = p.IdPermiso join Sismep.TSismepTiposPermiso tp on p.IdTipoPermiso = tp.IdTipoPermiso where r.RoleName like '${RolNombre}%' and rp.Activo=0
    Set Test Variable    ${rol}    ${queryResults[0][0]}
    Disconnect From Database