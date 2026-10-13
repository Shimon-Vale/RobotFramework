*** Setting ***
Resource    Recursos.Embarcaciones.robot

*** Variables ***
${filtroNombre}    RFEmbarcacion
${NombreEditar}    RFEmbarcacionEdicion
${RNPEditar}    99887
${MatriculaEditar}    665544332
&{CaracteristicasEditar}    Carga=10    Manga=20    TonelajeB=30    PMotor=40    Eslora=50    Puntal=60    TonelajeN=70    Marca=SUZUKI
&{PermisosEditar}    NoPermiso=232323    Descripcion=Permiso de    Inicio=01/01/2022    Fin=31/12/2022

*** Test Cases ***
Editar - TAB Generales - Validar etiquetas y tooltips
    [Documentation]    Debera mostra la ventana de detalle del vehiculo.
    [Tags]    Editar - TAB Generales - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Validar etiquetas y tooltips TAB Generales
    [Teardown]    Close Browser
    
Editar - TAB Generales - Validar informacion
    [Documentation]    Debera mostra la ventana de detalle del vehiculo.
    [Tags]    Editar - TAB Generales - Validar informacion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Validar Generales en BD
    [Teardown]    Close Browser

Editar - TAB Generales - Validar opcion Guardar
    [Documentation]    Debera aplicar las modificaciones correctamente a la embarcacion.
    [Tags]    Editar - TAB Generales - Validar opcion Guardar - T246
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Editar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Validar Generales en BD
    [Teardown]    Close Browser
    
Editar - TAB Generales - Validar opcion Cancelar
    [Documentation]    No debera aplicar las modificaciones en la embarcacion.
    [Tags]    Editar - TAB Generales - Validar opcion Cancelar - T244
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Editar datos del formulario Generales
    Sleep    1
    Obtener datos del formulario - TAB Generales
    Presionar opcion Cancelar
    Sleep    1
    Validar numero de registros en BD    ${Nombre}    ${RNP}    ${Matricula}    0
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Editar - TAB Generales - Validar actualizacion del Grid
    [Documentation]    Debera aplicar las modificaciones correctamente a la embarcacion y ver reflejados los cambios en el GRID.
    [Tags]    Editar - TAB Generales - Validar actualizacion del Grid
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Editar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Validar Generales en BD
    Cerrar ventana de edicion
    Filtrar por Columna 2 y Campo ${Nombre}
    Sleep    1
    Validar informacion en el Grid
    [Teardown]    Close Browser
    
Editar - TAB Generales - Cambiar Antena
    [Documentation]    Debera editar el campo antena correctamente.
    [Tags]    Editar - TAB Generales - Cambiar Antena
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Aplicar cambio de antena
    Presionar opcion Guardar cambio de antena
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Validar Generales en BD
    [Teardown]    Close Browser
    
Editar - TAB Generales - Cambiar Antena - Validar etiquetas
    [Documentation]    Debera editar el campo antena correctamente.
    [Tags]    Editar - TAB Generales - Cambiar Antena - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Seleccionar Antena    5
    Sleep    1
    Validar etiquetas Cambio de Antena
    [Teardown]    Close Browser
    
Editar - TAB Generales - Nombre duplicado
    [Documentation]    No debera de permitir editar el nombre por un nombre ya existente.
    [Tags]    Editar - TAB Generales - Nombre duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Editar datos del formulario Generales Nombre Duplicado
    Sleep    1
    Presionar opcion Guardar
    Obtener datos del formulario - TAB Generales
    Validar mensaje    Ya existe un veh\u00EDculo con el Nombre: \u0027${EmbarcacionExistente}[Nombre]\u0027
    Validar numero de registros en BD    ${EmbarcacionExistente}[Nombre]    ${RNP}    ${Matricula}    0
    [Teardown]    Close Browser
    
Editar - TAB Generales - RNP duplicado
    [Documentation]    No debera de permitir editar el nombre por un nombre ya existente.
    [Tags]    Editar - TAB Generales - RNP duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Editar datos del formulario Generales RNP Duplicado
    Sleep    1
    Obtener datos del formulario - TAB Generales
    Presionar opcion Guardar
    Validar mensaje    Ya existe un veh\u00EDculo con el RNP:${EmbarcacionExistente}[RNP]
    Validar numero de registros en BD    ${Nombre}    ${EmbarcacionExistente}[RNP]    ${Matricula}    0
    [Teardown]    Close Browser
    
Editar - TAB Generales - Matricula duplicado
    [Documentation]    No debera de permitir editar el nombre por un nombre ya existente.
    [Tags]    Editar - TAB Generales - Matricula duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Editar datos del formulario Generales Matricula Duplicada
    Sleep    1
    Obtener datos del formulario - TAB Generales
    Presionar opcion Guardar
    Validar mensaje    Ya existe un veh\u00EDculo con Matricula:${EmbarcacionExistente}[Matricula]
    Validar numero de registros en BD    ${Nombre}    ${RNP}    ${EmbarcacionExistente}[Matricula]    0
    [Teardown]    Close Browser
    
Editar - TAB Generales - INACTIVAR Embarcacion
    [Documentation]    Debera cambiar el estatus de la embarcacion de Activa a Inactiva.
    [Tags]    Editar - TAB Generales - INACTIVAR Embarcacion - T247
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Hacer scroll para ver el Boton Eliminar Generales
    Sleep    1
    Presionar opcion Eliminar
    Sleep    0.5
    Confirmar accion
    Sleep    1
    Validar mensaje    Cambios guardados.
    Validar Generales en BD    0
    [Teardown]    Close Browser
    
Editar - TAB Generales - INACTIVAR Embarcacion - TABS Desactivados
    [Documentation]    Debera cambiar el estatus de la embarcacion de Activa a Inactiva.
    [Tags]    Editar - TAB Generales - INACTIVAR Embarcacion - TABS Desactivados
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Hacer scroll para ver el Boton Eliminar Generales
    Sleep    1
    Presionar opcion Eliminar
    Sleep    0.5
    Confirmar accion
    Sleep    1
    Validar mensaje    Cambios guardados.
    Validar TABs inactivos
    Validar Generales en BD    0
    [Teardown]    Close Browser
    
Editar - TAB Generales - INACTIVAR Embarcacion - Validar etiquetas en ventana de confirmacion
    [Documentation]    Debera cambiar el estatus de la embarcacion de Activa a Inactiva.
    [Tags]    Editar - TAB Generales - INACTIVAR Embarcacion - Validar etiquetas en ventana de confirmacion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Hacer scroll para ver el Boton Eliminar Generales
    Sleep    1
    Presionar opcion Eliminar
    Sleep    1
    Validar etiquetas en ventana de confirmacion
    [Teardown]    Close Browser
    
Editar - TAB Generales - REACTIVAR Embarcacion
    [Documentation]    Debera cambiar el estatus de la embarcacion de Inactiva a Activa
    [Tags]    Editar - TAB Generales - REACTIVAR Embarcacion - T248
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Estatus    1
    Sleep    1
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Hacer scroll para ver el Boton Reactivar Generales
    Sleep    1
    Presionar opcion Reactivar
    Sleep    0.5
    Confirmar accion
    Sleep    1
    Validar mensaje    Cambios guardados.
    Validar Generales en BD
    [Teardown]    Close Browser
    
Editar - TAB Generales - REACTIVAR Embarcacion - TABS Activos
    [Documentation]    Debera cambiar el estatus de la embarcacion de Inactiva a Activa
    [Tags]    Editar - TAB Generales - REACTIVAR Embarcacion - TABS Activos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Estatus    3
    Sleep    1
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Hacer scroll para ver el Boton Reactivar Generales
    Sleep    1
    Presionar opcion Reactivar
    Sleep    0.5
    Confirmar accion
    Sleep    1
    Validar mensaje    Cambios guardados.
    Validar TABs activos
    Validar Generales en BD
    [Teardown]    Close Browser
    
Editar - TAB Caracteristicas - Validar opcion Guardar
    [Documentation]    Debera editar y aplicar los cambios correctamente.
    [Tags]    Editar - TAB Caracteristicas - Validar opcion Guardar - T249
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Obtener datos del formulario - TAB Generales
    Sleep    1
    Ingresar a seccion Caracteristicas
    Sleep    1
    Editar datos del formulario Caracteristicas
    Sleep    1
    Presionar opcion Guardar Caracteristicas
    Validar mensaje    Registro guardado.
    Validar caracteristicas en BD
    [Teardown]    Close Browser
    
Editar - TAB Caracteristicas - Validar campos requeridos
    [Documentation]    Validar que no se puedan guardar campos vacios
    [Tags]    Editar - TAB Caracteristicas - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Ingresar a seccion Caracteristicas
    Sleep    1
    Dejar vacio los campos de la seccion Caracteristicas
    Validar campos obligatorios en TAB Caracteristicas
    [Teardown]    Close Browser

Editar - TAB Caracteristicas - Validacion de solo numeros
    [Documentation]    Validar que muestre la validacion correcta para que solo se puedan ingresar numeros, excepto el campo Marca
    [Tags]    Editar - TAB Caracteristicas - Mostrar validacion de solo numeros
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Ingresar a seccion Caracteristicas
    Sleep    1
    Capturar texto en los campos de la seccion Caracteristicas
    Validar captura de solo numeros en TAB Caracteristicas
    [Teardown]    Close Browser
    
Editar - TAB Caracteristicas - Validar etiquetas y tooltips
    [Documentation]    Validar que muestre la validacion correcta para que solo se puedan ingresar numeros, excepto el campo Marca
    [Tags]    Editar - TAB Caracteristicas - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Ingresar a seccion Caracteristicas
    Sleep    1
    Validar etiquetas y tooltips TAB Caracteristicas
    [Teardown]    Close Browser
    
Editar - TAB Grupos - Agregar Grupo
    [Documentation]    Debera editarse correctamente la pestana Grupo
    [Tags]    Editar - TAB Grupos - Agregar Grupo - T253
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Generales
    Ingresar a seccion Grupos
    Sleep    1
    Seleccionar Grupo    7
    Presionar opcion Agregar Grupo
    Sleep    2
    Obtener datos del Grid Grupos
    Validar grupo en BD
    Validar mensaje    Registro guardado.
    [Teardown]    Close Browser
    
Editar - TAB Grupos - Eliminar Grupo
    [Documentation]    Debera editarse correctamente la pestana Grupo
    [Tags]    Editar - TAB Grupos - Eliminar Grupo - T254
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Generales
    Ingresar a seccion Grupos
    Sleep    1
    Seleccionar Grupo    7
    Presionar opcion Agregar Grupo
    Sleep    2
    Obtener datos del Grid Grupos
    Validar grupo en BD
    Presionar opcion Eliminar Grupo
    Sleep    0.5
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro eliminado.
    Validar grupo eliminado en BD
    [Teardown]    Close Browser
    
Editar - TAB Grupos - Validar etiquetas y tooltips
    [Documentation]    Debera editarse correctamente la pestana Grupo
    [Tags]    Editar - TAB Grupos - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Ingresar a seccion Grupos
    Sleep    1
    Validar etiquetas y tooltips TAB Grupos
    [Teardown]    Close Browser
    
Editar - TAB Permisos - Agregar Permiso
    [Documentation]    Debera modificar correctamente los datos.
    [Tags]    Editar - TAB Permisos - Agregar Permiso - T255
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Obtener Embarcacion sin permisos
    Filtrar por Columna 2 y Campo ${Embarcacion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Generales
    Ingresar a seccion Permisos
    Sleep    1
    Agregar datos del Permiso
    Sleep    1
    Presionar opcion Guardar Permiso
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Permisos
    Validar permiso en BD    1
    [Teardown]    Close Browser
    
Editar - TAB Permisos - Inactivar Permiso
    [Documentation]    Debera modificar correctamente los datos.
    [Tags]    Editar - TAB Permisos - Inactivar Permiso - T258
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Obtener Embarcacion sin permisos
    Filtrar por Columna 2 y Campo ${Embarcacion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Generales
    Ingresar a seccion Permisos
    Sleep    1
    Agregar datos del Permiso
    Sleep    1
    Presionar opcion Guardar Permiso
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Permisos
    Validar permiso en BD    1
    Presionar opcion Detalle de Permiso
    Presionar opcion Eliminar Permiso
    Sleep    0.5
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro guardado.
    Validar permiso en BD    0
    [Teardown]    Close Browser
    
Editar - TAB Permisos - Reactivar Permiso
    [Documentation]    Debera modificar correctamente los datos.
    [Tags]    Editar - TAB Permisos - Reactivar Permiso - T259
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Obtener Embarcacion sin permisos
    Filtrar por Columna 2 y Campo ${Embarcacion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Generales
    Ingresar a seccion Permisos
    Sleep    1
    Agregar datos del Permiso
    Sleep    1
    Presionar opcion Guardar Permiso
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Permisos
    Validar permiso en BD    1
    Presionar opcion Detalle de Permiso
    Presionar opcion Eliminar Permiso
    Sleep    0.5
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro guardado.
    Validar permiso en BD    0
    Filtrar por Permiso    3
    Sleep    1
    Presionar opcion Detalle de Permiso
    Presionar opcion Reactivar Permiso
    Sleep    0.5
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro guardado.
    Validar permiso en BD    1
    [Teardown]    Close Browser
    
Editar - TAB Permisos - Validar etiquetas y tooltips
    [Documentation]    Debera modificar correctamente los datos.
    [Tags]    Editar - TAB Permisos - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Obtener Embarcacion con permisos
    Filtrar por Columna 2 y Campo ${Embarcacion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Ingresar a seccion Permisos
    Sleep    1
    Validar etiquetas y tooltips TAB Permisos
    [Teardown]    Close Browser
    
Editar - TAB Subtipos de Carga - Agregar Subtipo
    [Documentation]    Debera Agregar el subtipo de carga
    [Tags]    Editar - TAB Subtipos de Carga - Agregar Subtipo - T241
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Obtener Embarcacion sin permisos
    Filtrar por Columna 2 y Campo ${Embarcacion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Generales
    Ingresar a seccion Permisos
    Sleep    1
    Agregar datos del Permiso
    Sleep    1
    Presionar opcion Guardar Permiso
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Permisos
    Validar permiso en BD    1
    Ingresar a seccion Subtipos de Carga
    Sleep    1
    Seleccionar Subtipo de Carga
    Sleep    1
    Presionar opcion Agregar Subtipo
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Subtipo
    Validar subtipo en BD
    [Teardown]    Close Browser
    
Editar - TAB Subtipos de Carga - Eliminar Subtipo
    [Documentation]    Debera Agregar el subtipo de carga
    [Tags]    Editar - TAB Subtipos de Carga - Eliminar Subtipo - T242
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Obtener Embarcacion sin permisos
    Filtrar por Columna 2 y Campo ${Embarcacion}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Generales
    Ingresar a seccion Permisos
    Sleep    1
    Agregar datos del Permiso
    Sleep    1
    Presionar opcion Guardar Permiso
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Permisos
    Validar permiso en BD    1
    Ingresar a seccion Subtipos de Carga
    Sleep    1
    Seleccionar Subtipo de Carga
    Sleep    1
    Presionar opcion Agregar Subtipo
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Subtipo
    Validar subtipo en BD
    Presionar opcion Eliminar Subtipo
    Sleep    0.5
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro eliminado.
    Validar subtipo eliminado en BD
    [Teardown]    Close Browser
    
Editar - TAB Subtipos de Carga - Validar etiquetas y tooltips
    [Documentation]    Debera Agregar el subtipo de carga
    [Tags]    Editar - TAB Subtipos de Carga - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Ingresar a seccion Subtipos de Carga
    Sleep    1
    Validar etiquetas y tooltips TAB Subtipos de Carga
    [Teardown]    Close Browser
    
Editar - TAB Artes de Carga - Agregar
    [Documentation]    Debera Agregar el Arte de Carga correctamente.
    [Tags]    Editar - TAB Artes de Carga - Agregar - T261
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Generales
    Ingresar a seccion Artes de carga
    Sleep    1
    Seleccionar Arte de Carga    1
    Sleep    1
    Presionar opcion Agregar Arte de Carga
    Sleep    2
    Obtener datos del Grid Artes de Carga
    Validar arte de carga en BD
    Validar mensaje    Registro guardado.
    [Teardown]    Close Browser
    
Editar - TAB Artes de Carga - Eliminar
    [Documentation]    Debera Agregar el Arte de Carga correctamente.
    [Tags]    Editar - TAB Artes de Carga - Eliminar - T262
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario - TAB Generales
    Ingresar a seccion Artes de carga
    Sleep    1
    Seleccionar Arte de Carga    1
    Sleep    1
    Presionar opcion Agregar Arte de Carga
    Sleep    2
    Obtener datos del Grid Artes de Carga
    Validar arte de carga en BD
    Presionar opcion Eliminar Arte de Carga
    Sleep    0.5
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro guardado.
    Validar arte de carga eliminado en BD
    [Teardown]    Close Browser
    
Editar - TAB Artes de Carga - Validar etiquetas y tooltips
    [Documentation]    Debera Agregar el Arte de Carga correctamente.
    [Tags]    Editar - TAB Artes de Carga - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Filtrar por Columna 2 y Campo ${filtroNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Ingresar a seccion Artes de carga
    Sleep    1
    Validar etiquetas y tooltips TAB Artes de Carga
    [Teardown]    Close Browser
    
*** Keywords ***
Ingresar al detalle del registro No. ${arg1} en el grid
    Click Element    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[5]/div
    Wait Until Element Is Not Visible    xpath=//*[@id="generales"]/div[10]/div/div[2]    timeout=30
    Wait Until Element Is Enabled    xpath=//*[@id="btnVehiculoGuardar"]    timeout=30
    
Editar datos del formulario Generales
    Validar registro unico    ${NombreEditar}    ${queryNombre}
    Input Text    xpath=//*[@id="txtVehiculoNombre"]/div[1]/div[1]/input    ${valorUnico}
    Validar registro unico    ${RNPEditar}    ${queryRNP}
    Input Text    xpath=//*[@id="txtVehiculoRNPBarco"]/div/div[1]/input    ${valorUnico}
    Input Text    xpath=//*[@id="txtVehiculoFolio"]/div/div[1]/input    11223344
    Validar registro unico    ${MatriculaEditar}    ${queryMatricula}
    Input Text    xpath=//*[@id="txtVehiculoMatricula"]/div/div[1]/input    ${valorUnico}
    Input text    xpath=//*[@id="txtVehiculoJustificacion"]/div/div[1]/input    44332211
    Hacer scroll para ver el Boton Guardar Generales
    
Editar datos del formulario Generales Nombre Duplicado
    Input Text    xpath=//*[@id="txtVehiculoNombre"]/div[1]/div[1]/input    ${EmbarcacionExistente}[Nombre]
    Validar registro unico    ${RNPEditar}    ${queryRNP}
    Input Text    xpath=//*[@id="txtVehiculoRNPBarco"]/div/div[1]/input    ${valorUnico}
    Input Text    xpath=//*[@id="txtVehiculoFolio"]/div/div[1]/input    11223344
    Validar registro unico    ${MatriculaEditar}    ${queryMatricula}
    Input Text    xpath=//*[@id="txtVehiculoMatricula"]/div/div[1]/input    ${valorUnico}
    Input text    xpath=//*[@id="txtVehiculoJustificacion"]/div/div[1]/input    44332211
    Hacer scroll para ver el Boton Guardar Generales
    
Editar datos del formulario Generales RNP Duplicado
    Validar registro unico    ${NombreEditar}    ${queryNombre}
    Input Text    xpath=//*[@id="txtVehiculoNombre"]/div[1]/div[1]/input    ${valorUnico}
    Input Text    xpath=//*[@id="txtVehiculoRNPBarco"]/div/div[1]/input    ${EmbarcacionExistente}[RNP]
    Input Text    xpath=//*[@id="txtVehiculoFolio"]/div/div[1]/input    11223344
    Validar registro unico    ${MatriculaEditar}    ${queryMatricula}
    Input Text    xpath=//*[@id="txtVehiculoMatricula"]/div/div[1]/input    ${valorUnico}
    Input text    xpath=//*[@id="txtVehiculoJustificacion"]/div/div[1]/input    44332211
    Hacer scroll para ver el Boton Guardar Generales
    
Editar datos del formulario Generales Matricula Duplicada
    Validar registro unico    ${NombreEditar}    ${queryNombre}
    Input Text    xpath=//*[@id="txtVehiculoNombre"]/div[1]/div[1]/input    ${valorUnico}
    Validar registro unico    ${RNPEditar}    ${queryRNP}
    Input Text    xpath=//*[@id="txtVehiculoRNPBarco"]/div/div[1]/input    ${valorUnico}
    Input Text    xpath=//*[@id="txtVehiculoFolio"]/div/div[1]/input    11223344
    Input Text    xpath=//*[@id="txtVehiculoMatricula"]/div/div[1]/input    ${EmbarcacionExistente}[Matricula]
    Input text    xpath=//*[@id="txtVehiculoJustificacion"]/div/div[1]/input    44332211
    Hacer scroll para ver el Boton Guardar Generales
    
Editar datos del formulario Caracteristicas
    Input Text    xpath=//*[@id="txtCaracteristicasCarga"]/div/div[1]/input    ${CaracteristicasEditar}[Carga]
    Input Text    xpath=//*[@id="txtCaracteristicasManga"]/div/div[1]/input    ${CaracteristicasEditar}[Manga]
    Input Text    xpath=//*[@id="txtCaracteristicasTonelajeB"]/div/div[1]/input    ${CaracteristicasEditar}[TonelajeB]
    Input Text    xpath=//*[@id="txtCaracteristicasPotenciaMotor"]/div/div[1]/input    ${CaracteristicasEditar}[PMotor]
    Input Text    xpath=//*[@id="txtCaracteristicasEslora"]/div/div[1]/input    ${CaracteristicasEditar}[Eslora]
    Input Text    xpath=//*[@id="txtCaracteristicasPuntal"]/div/div[1]/input    ${CaracteristicasEditar}[Puntal]
    Input Text    xpath=//*[@id="txtCaracteristicasTonejaleN"]/div/div[1]/input    ${CaracteristicasEditar}[TonelajeN]
    Input Text    xpath=//*[@id="txtCaracteristicasMarca"]/div/div[1]/input    ${CaracteristicasEditar}[Marca]
    Wait Until Element Is Visible    xpath=//*[@id="btnCaracteristicasGuardar"]
    
Aplicar cambio de antena
    Seleccionar Antena    3
    Sleep    1
    Input Text    xpath=//*[@id="txtAntenaMotivo"]/div/div[1]/input    RF Cambio de Antena
    
Agregar datos del Permiso
    Seleccionar Tipo de Carga    1
    Input Text    xpath=//*[@id="txtPNoPermoso"]/div/div[1]/input    ${PermisosEditar}[NoPermiso]
    Input Text    xpath=//*[@id="txtPDescripcion"]/div/div[1]/input    ${PermisosEditar}[Descripcion]
    Input Text    xpath=//*[@id="dpPFechaInicio"]/div[1]/div/div[1]/input    ${PermisosEditar}[Inicio]
    Input Text    xpath=//*[@id="dpPFechaFin"]/div[1]/div/div[1]/input    ${PermisosEditar}[Fin]
    
Filtrar por Permiso
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="gridPermisos"]/div/div[5]/div/table/tbody/tr[2]/td[7]/div/div/div
    Click Element    xpath=//*[@id="gridPermisos"]/div/div[5]/div/table/tbody/tr[2]/td[7]/div/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Hacer scroll para ver el Boton Eliminar Generales
    Execute JavaScript    window.document.evaluate('//*[@id="btnVehiculoEliminar"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=//*[@id="btnVehiculoEliminar"]
    
Hacer scroll para ver el Boton Reactivar Generales
    Execute JavaScript    window.document.evaluate('//*[@id="btnVehiculoReactivar"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=//*[@id="btnVehiculoReactivar"]
    
Cerrar ventana de edicion
    Click Element    xpath=/html/body/div[3]/div/div[1]/div/div[3]/div/div/div
    
Presionar opcion Guardar cambio de antena
    Click Element    xpath=//*[@id="btnCambioAntenaGuardar"]
    Hacer scroll para ver el Boton Guardar Generales
    
Seleccionar Antena
    [Arguments]    ${arg1}
    Click Element    xpath=//*[@id="cboVehiculoAntena"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]
    
Validar informacion en el Grid
    Element Text Should be    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]    ${RNP}
    Element Text Should be    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]    ${Nombre}
    Element Text Should be    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]    ${Matricula}
    
Validar Generales en BD
    [Arguments]    ${Activo}=1
    Obtener datos del formulario - TAB Generales
    Conexion a Base de Datos
    @{queryResults}    Query    select v.Nombre, rs.Descripcion, a.IdExterno, v.RNP, d.DescripcionCorta, v.Folio, v.Matricula, v.Texto5, edo.Descripcion, mpo.Descripcion, l.Descripcion, pti.Descripcion, v.Texto1, v.Mantenimiento from Sismep.TSismepVehiculos v join Sismep.TSismepAntenas a on v.IdAntena = a.IdAntena join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial join Sismep.TSismepLocalidades l on v.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios mpo on l.IdMunicipio = mpo.IdMunicipio join Sismep.TSismepEstados edo on mpo.IdEstado = edo.IdEstado join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where v.Nombre = '${Nombre}' and v.RNP='${RNP}' and v.Matricula='${Matricula}' and v.Activo=${Activo}
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${RazonSocial}
    Should Be Equal    ${queryResults[0][2]}    ${Antena}
    Should Be Equal    ${queryResults[0][3]}    ${RNP}
    Should Be Equal    ${queryResults[0][4]}    ${Litoral}
    Should Be Equal    ${queryResults[0][5]}    ${Folio}
    Should Be Equal    ${queryResults[0][6]}    ${Matricula}
    Should Be Equal    ${queryResults[0][7]}    ${Tipo}
    Should Be Equal    ${queryResults[0][8]}    ${Estado}
    Should Be Equal    ${queryResults[0][9]}    ${Municipio}
    Should Be Equal    ${queryResults[0][10]}    ${Localidad}
    Should Be Equal    ${queryResults[0][11]}    ${PuertoBase}
    Should Be Equal    ${queryResults[0][12]}    ${Justificacion}
    Should Be Equal    ${queryResults[0][13]}    ${mtto}
    Disconnect From Database
    
Validar caracteristicas en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select Nombre, Carga, Manga, TonelajeB, Potencia, Eslora, Puntal, TonelajeN, MarcaMotor, FotoEmbarcacion from Sismep.TSismepVehiculos where Nombre = '${Nombre}'
    Should be equal    ${Nombre}    ${queryResults[0][0]}
    Should be equal    ${CaracteristicasEditar}[Carga]    ${queryResults[0][1]}
    Should be equal    ${CaracteristicasEditar}[Manga]    ${queryResults[0][2]}
    Should be equal    ${CaracteristicasEditar}[TonelajeB]    ${queryResults[0][3]}
    Should be equal    ${CaracteristicasEditar}[PMotor]    ${queryResults[0][4]}
    Should be equal    ${CaracteristicasEditar}[Eslora]    ${queryResults[0][5]}
    Should be equal    ${CaracteristicasEditar}[Puntal]    ${queryResults[0][6]}
    Should be equal    ${CaracteristicasEditar}[TonelajeN]    ${queryResults[0][7]}
    Should be equal    ${CaracteristicasEditar}[Marca]    ${queryResults[0][8]}
    Disconnect From Database
    
Validar TABs inactivos
    ${Generales}=    Execute Javascript    return document.getElementById("tabGenerales").getAttribute("class")
    ${Caracteristicas}=    Execute Javascript    return document.getElementById("tabCaracteristicas").getAttribute("class")
    ${Grupos}=    Execute Javascript    return document.getElementById("tabGrupos").getAttribute("class")
    ${Permisos}=    Execute Javascript    return document.getElementById("tabPermisos").getAttribute("class")
    ${Subtipos}=    Execute Javascript    return document.getElementById("tabSubTiposCarga").getAttribute("class")
    ${Artes}=    Execute Javascript    return document.getElementById("tabArtesCarga").getAttribute("class")
    ${CambiosAntena}=    Execute Javascript    return document.getElementById("tabCambiosAntena").getAttribute("class")
    Should be equal    ${Generales}    nav-link active
    Should be equal    ${Caracteristicas}    nav-link disabled
    Should be equal    ${Grupos}    nav-link disabled
    Should be equal    ${Permisos}    nav-link disabled
    Should be equal    ${Subtipos}    nav-link disabled
    Should be equal    ${Artes}    nav-link disabled
    Should be equal    ${CambiosAntena}    nav-link disabled
    
Validar TABs activos
    ${Generales}=    Execute Javascript    return document.getElementById("tabGenerales").getAttribute("class")
    ${Caracteristicas}=    Execute Javascript    return document.getElementById("tabCaracteristicas").getAttribute("class")
    ${Grupos}=    Execute Javascript    return document.getElementById("tabGrupos").getAttribute("class")
    ${Permisos}=    Execute Javascript    return document.getElementById("tabPermisos").getAttribute("class")
    ${Subtipos}=    Execute Javascript    return document.getElementById("tabSubTiposCarga").getAttribute("class")
    ${Artes}=    Execute Javascript    return document.getElementById("tabArtesCarga").getAttribute("class")
    ${CambiosAntena}=    Execute Javascript    return document.getElementById("tabCambiosAntena").getAttribute("class")
    Should be equal    ${Generales}    nav-link active
    Should be equal    ${Caracteristicas}    nav-link
    Should be equal    ${Grupos}    nav-link
    Should be equal    ${Permisos}    nav-link
    Should be equal    ${Subtipos}    nav-link
    Should be equal    ${Artes}    nav-link
    Should be equal    ${CambiosAntena}    nav-link
    
Validar etiquetas y tooltips TAB Generales
    ${ttGuardar}=    Get Element Attribute    xpath=//*[@id="btnVehiculoGuardar"]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=//*[@id="btnVehiculoCancelar"]    tooltip
    ${ttEliminar}=    Get Element Attribute    xpath=//*[@id="btnVehiculoEliminar"]    tooltip
    ${ttReactivar}=    Get Element Attribute    xpath=//*[@id="btnVehiculoReactivar"]    tooltip
    Element Text Should be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Editar Embarcación
    Element Text Should be    xpath=//*[@id="tabGenerales"]    Generales
    Element Text Should be    xpath=//*[@id="generales"]/div[2]/label    Nombre:
    Element Text Should be    xpath=//*[@id="generales"]/div[3]/label[1]    Razón Social:
    Element Text Should be    xpath=//*[@id="generales"]/div[4]/label[1]    Antena:
    Element Text Should be    xpath=//*[@id="generales"]/div[5]/label[1]    RNP Barco:
    Element Text Should be    xpath=//*[@id="generales"]/div[6]/label[1]    Litoral:
    Element Text Should be    xpath=//*[@id="generales"]/div[7]/label[1]    Folio:
    Element Text Should be    xpath=//*[@id="generales"]/div[8]/label[1]    Matrícula:
    Element Text Should be    xpath=//*[@id="generales"]/div[3]/label[2]    Tipo:
    Element Text Should be    xpath=//*[@id="generales"]/div[4]/label[2]    Estado:
    Element Text Should be    xpath=//*[@id="generales"]/div[5]/label[2]    Municipio:
    Element Text Should be    xpath=//*[@id="generales"]/div[6]/label[2]    Localidad:
    Element Text Should be    xpath=//*[@id="generales"]/div[7]/label[2]    Puerto Base:
    Element Text Should be    xpath=//*[@id="generales"]/div[8]/label[2]    Justificación:
    Element Text Should be    xpath=//*[@id="generales"]/div[1]/label[1]    En Mantenimiento:
    Element Text Should be    xpath=//*[@id="generales"]/div[1]/label[2]    Estatus:
    
Validar etiquetas Cambio de Antena
    Element Text Should be    xpath=//*[@id="popupCambioAntena"]/div/div/div[1]    Cambio de Antena
    Element Text Should be    xpath=//*[@id="popupCambioAntena"]/div/div/div[2]/div[1]/label    Antena Anterior:
    Element Text Should be    xpath=//*[@id="popupCambioAntena"]/div/div/div[2]/div[2]/label    Antena Nueva:
    Element Text Should be    xpath=//*[@id="popupCambioAntena"]/div/div/div[2]/div[3]/label    Motivo(*):