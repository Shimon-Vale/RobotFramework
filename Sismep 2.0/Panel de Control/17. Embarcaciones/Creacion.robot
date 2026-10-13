*** Setting ***
Resource    Recursos.Embarcaciones.robot

*** Variables ***
${NombreCrear}    RFEmbarcacion
${RNPCrear}    11223
${MatriculaCrear}    990011223
&{CaracteristicasCrear}    Carga=1    Manga=2    TonelajeB=3    PMotor=4    Eslora=5    Puntal=6    TonelajeN=7    Marca=CATERPILAR
&{PermisosCrear}    NoPermiso=545454    Descripcion=Permiso de    Inicio=01/01/2021    Fin=31/12/2021
${xpathElemento}    //*[@id="generales"]/div[8]/label[2]

*** Test Cases ***
Crear - TAB Generales - Validar etiquetas y tooltips
    [Documentation]    Debera mostrar correctamente las etiquetas de la pantalla Nuevo Registro - Pestana Generales
    [Tags]    Crear - TAB Generales - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Validar etiquetas y tooltips TAB Generales
    [Teardown]    Close Browser
    
Crear - TAB Generales - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente una embarcacion
    [Tags]    Crear - TAB Generales - Validar opcion Guardar - T224
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    [Teardown]    Close Browser
    
Crear - TAB Generales - Guardar como Mantenimiento
    [Documentation]    Debera guardar correctamente una embarcacion
    [Tags]    Crear - TAB Generales - Guardar como Mantenimiento
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Presionar opcion En Mantenimiento
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD    ${TRUE}
    [Teardown]    Close Browser
    
Crear - TAB Generales - Nombre duplicado
    [Documentation]    No debera guardar la embarcacion y se debera de mostrar un mensaje de validacion
    [Tags]    Crear - TAB Generales - Nombre duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales Nombre Duplicado
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Ya existe un veh\u00EDculo con el Nombre: \u0027${EmbarcacionExistente}[Nombre]\u0027
    Obtener datos del formulario - TAB Generales
    Validar numero de registros en BD    ${EmbarcacionExistente}[Nombre]    ${RNP}    ${Matricula}    0
    [Teardown]    Close Browser
    
Crear - TAB Generales - RNP duplicado
    [Documentation]    No debera guardar la embarcacion y se debera de mostrar un mensaje de validacion
    [Tags]    Crear - TAB Generales - RNP duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales RNP Duplicado
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Ya existe un veh\u00EDculo con el RNP: \u0027${EmbarcacionExistente}[RNP]\u0027
    Obtener datos del formulario - TAB Generales
    Validar numero de registros en BD    ${Nombre}    ${EmbarcacionExistente}[RNP]    ${Matricula}    0
    [Teardown]    Close Browser
    
Crear - TAB Generales - Matricula duplicada
    [Documentation]    No debera guardar la embarcacion y se debera de mostrar un mensaje de validacion
    [Tags]    Crear - TAB Generales - Matricula duplicada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales Matricula Duplicada
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Ya existe un veh\u00EDculo con la Matricula: \u0027${EmbarcacionExistente}[Matricula]\u0027
    Obtener datos del formulario - TAB Generales
    Validar numero de registros en BD    ${Nombre}    ${RNP}    ${EmbarcacionExistente}[Matricula]    0
    [Teardown]    Close Browser
    
Crear - TAB Generales - Validar opcion Cancelar
    [Documentation]    Debera descartar la informacion capturada y NO guardar la embarcacion
    [Tags]    Crear - TAB Generales - Validar opcion Cancelar - T220
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Cancelar
    Sleep    2
    Obtener datos del formulario - TAB Generales
    Validar numero de registros en BD    ${Nombre}    ${RNP}    ${Matricula}    0
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Crear - TAB Generales - Validar campos requeridos
    [Documentation]    Debera indicar todos los campos requeridos del formulario
    [Tags]    Crear - TAB Generales - Validar campos requeridos 
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Hacer scroll para ver el Boton Guardar Generales
    Sleep    1
    Presionar opcion Guardar
    Sleep    1
    Validar campos obligatorios de TAB Generales
    [Teardown]    Close Browser
    
Crear - TAB Caracteristicas - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente la informacion de la seccion caracteristicas
    [Tags]    Crear - TAB Caracteristicas - Validar opcion Guardar - T226
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    Hacer scroll para ver el TAB Caracteristicas
    Ingresar a seccion Caracteristicas
    Sleep    1
    Capturar datos del formulario Caracteristicas
    Sleep    1
    Presionar opcion Guardar Caracteristicas
    Validar mensaje    Registro guardado.
    Validar caracteristicas en BD
    [Teardown]    Close Browser
    
Crear - TAB Caracteristicas - Validar campos requeridos
    [Documentation]    Debera resaltar los campos requeridos
    [Tags]    Crear - TAB Caracteristicas - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    Hacer scroll para ver el TAB Caracteristicas
    Ingresar a seccion Caracteristicas
    Sleep    1
    Dejar vacio los campos de la seccion Caracteristicas
    Validar campos obligatorios en TAB Caracteristicas
    [Teardown]    Close Browser
    
Crear - TAB Caracteristicas - Validacion de solo numeros
    [Documentation]    Debera mostrar en cada campo la validacion para capturar numeros
    [Tags]    Crear - TAB Caracteristicas - Mostrar validacion de solo numeros
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    Hacer scroll para ver el TAB Caracteristicas
    Ingresar a seccion Caracteristicas
    Sleep    1
    Capturar texto en los campos de la seccion Caracteristicas
    Validar captura de solo numeros en TAB Caracteristicas
    [Teardown]    Close Browser
    
Crear - TAB Grupos - Agregar Grupo
    [Documentation]    Debera agregar correctamente un grupo
    [Tags]    Crear - TAB Grupos - Agregar Grupo - T230
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    Hacer scroll para ver el TAB Grupos
    Ingresar a seccion Grupos
    Sleep    1
    Seleccionar Grupo    2
    Sleep    1
    Presionar opcion Agregar Grupo
    Validar mensaje    Registro guardado.
    Validacion de campo obligatorio oculto    ${xpathGrupo}
    Obtener datos del Grid Grupos
    Validar grupo en BD
    [Teardown]    Close Browser
    
Crear - TAB Grupos - Eliminar Grupo
    [Documentation]    Debera elimnar correctamente un grupo
    [Tags]    Crear - TAB Grupos - Eliminar Grupo - T231
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    Hacer scroll para ver el TAB Grupos
    Ingresar a seccion Grupos
    Sleep    1
    Seleccionar Grupo    2
    Sleep    1
    Presionar opcion Agregar Grupo
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Grupos
    Validar grupo en BD
    Presionar opcion Eliminar Grupo
    Sleep    0.5
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro eliminado.
    Validar grupo eliminado en BD
    [Teardown]    Close Browser
    
Crear - TAB Permisos - Agregar Permiso - Validar campos requeridos
    [Documentation]    Debera agregar correctamente un permiso
    [Tags]    Crear - TAB Permisos - Agregar Permiso - T234
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    Hacer scroll para ver el TAB Permisos
    Ingresar a seccion Permisos
    Sleep    1
    Dejar vacio los campos de la seccion Permisos
    Sleep    1
    Presionar opcion Guardar Permiso
    Sleep    1
    Validar campos obligatorios en TAB Permisos
    [Teardown]    Close Browser

Crear - TAB Permisos - Agregar Permiso - Validar campos requeridos ocultos
    [Documentation]    Debera agregar correctamente un permiso
    [Tags]    Crear - TAB Permisos - Agregar Permiso - T234
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    Hacer scroll para ver el TAB Permisos
    Ingresar a seccion Permisos
    Sleep    1
    Dejar vacio los campos de la seccion Permisos
    Sleep    1
    Presionar opcion Guardar Permiso
    Sleep    1
    Cerrar modal del formulario
    Sleep    1
    Filtrar por Columna 2 y Campo ${Nombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Ingresar a seccion Permisos
    Sleep    0.5
    Validar campos obligatorios en TAB Permisos ocultos
    [Teardown]    Close Browser

Crear - TAB Permisos - Agregar Permiso - Validar Fechas
    [Documentation]    Debera agregar correctamente un permiso
    [Tags]    Crear - TAB Permisos - Agregar Permiso - T234
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    Hacer scroll para ver el TAB Permisos
    Ingresar a seccion Permisos
    Sleep    1
    Capturar datos del Permiso - Fechas incorrectas
    Sleep    1
    Presionar opcion Guardar Permiso
    Validar mensaje    Fecha Inicio debe ser menor a Fecha Fin.
    [Teardown]    Close Browser

Crear - TAB Permisos - Agregar Permiso
    [Documentation]    Debera agregar correctamente un permiso
    [Tags]    Crear - TAB Permisos - Agregar Permiso - T234
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    Hacer scroll para ver el TAB Permisos
    Ingresar a seccion Permisos
    Sleep    1
    Capturar datos del Permiso
    Sleep    1
    Presionar opcion Guardar Permiso
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Permisos
    Validar permiso en BD    1
    [Teardown]    Close Browser
    
Crear - TAB Permisos - Eliminar Permiso
    [Documentation]    Debera eliminar correctamente un permiso
    [Tags]    Crear - TAB Permisos - Eliminar Permiso - T232
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    Hacer scroll para ver el TAB Permisos
    Ingresar a seccion Permisos
    Sleep    1
    Capturar datos del Permiso
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
    
Crear - TAB Subtipos de Carga - Agregar Subtipo
    [Documentation]    Debera agregar correctamente un subtipo de carga
    [Tags]    Crear - TAB Subtipos de Carga - Agregar Subtipo - T236
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    Hacer scroll para ver el TAB Permisos
    Ingresar a seccion Permisos
    Sleep    1
    Capturar datos del Permiso
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
    Validacion de campo obligatorio oculto    ${xpathSubTipo}
    Obtener datos del Grid Subtipo
    Validar subtipo en BD
    [Teardown]    Close Browser
    
Crear - TAB Subtipos de Carga - Eliminar Subtipo
    [Documentation]    Debera eliminar correctamente un subtipo de carga
    [Tags]    Crear - TAB Subtipos de Carga - Eliminar Subtipo - T237
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    Hacer scroll para ver el TAB Permisos
    Ingresar a seccion Permisos
    Sleep    1
    Capturar datos del Permiso
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
    
Crear - TAB Artes de Carga - Agregar
    [Documentation]    Debera agregar correctamente un arte de carga
    [Tags]    Crear - TAB Artes de Carga - Agregar - T238
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    Hacer scroll para ver el TAB Artes de Carga
    Ingresar a seccion Artes de carga
    Sleep    1
    Seleccionar Arte de Carga    2
    Sleep    1
    Presionar opcion Agregar Arte de Carga
    Validar mensaje    Registro guardado.
    Validacion de campo obligatorio oculto    ${xpathArte}
    Obtener datos del Grid Artes de Carga
    Validar arte de carga en BD
    [Teardown]    Close Browser
    
Crear - TAB Artes de Carga - Eliminar
    [Documentation]    Debera eliminar correctamente un arte de carga
    [Tags]    Crear - TAB Artes de Carga - Eliminar - T239
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Embarcaciones
    Presionar opcion Nuevo Registro    ${xpathElemento}
    Sleep    1
    Capturar datos del formulario Generales
    Sleep    1
    Presionar opcion Guardar
    Validar mensaje    Registro guardado.
    Obtener datos del formulario - TAB Generales
    Validar generales en BD
    Hacer scroll para ver el TAB Artes de Carga
    Ingresar a seccion Artes de carga
    Sleep    1
    Seleccionar Arte de Carga    2
    Sleep    1
    Presionar opcion Agregar Arte de Carga
    Validar mensaje    Registro guardado.
    Obtener datos del Grid Artes de Carga
    Validar arte de carga en BD
    Presionar opcion Eliminar Arte de Carga
    Sleep    0.5
    Confirmar accion
    Sleep    1
    Validar mensaje    Registro guardado.
    Validar arte de carga eliminado en BD
    [Teardown]    Close Browser
    
*** Keywords ***
Ingresar al detalle del registro No. ${arg1} en el grid
    Click Element    xpath=//*[@id="grid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[5]/div
    Wait Until Element Is Not Visible    xpath=//*[@id="generales"]/div[10]/div/div[2]    timeout=30
    Wait Until Element Is Enabled    xpath=//*[@id="btnVehiculoGuardar"]    timeout=30

Presionar opcion En Mantenimiento
    Wait Until Element Is Visible    xpath=//*[@id="switchEnMantenimiento"]/div/div
    Execute JavaScript    document.evaluate('//*[@id="switchEnMantenimiento"]/div/div/div/div[3]',document.body,null,9,null).singleNodeValue.click();
    
Capturar datos del formulario Generales
    Validar registro unico    ${NombreCrear}    ${queryNombre}
    Input Text    xpath=//*[@id="txtVehiculoNombre"]/div[1]/div[1]/input    ${valorUnico}
    Seleccionar Razon Social
    Sleep    1
    Seleccionar Antena
    Validar registro unico    ${RNPCrear}    ${queryRNP}
    Input Text    xpath=//*[@id="txtVehiculoRNPBarco"]/div/div[1]/input    ${valorUnico}
    Sleep    1
    Seleccionar Litoral
    Input Text    xpath=//*[@id="txtVehiculoFolio"]/div/div[1]/input    55667788
    Validar registro unico    ${MatriculaCrear}    ${queryMatricula}
    Input Text    xpath=//*[@id="txtVehiculoMatricula"]/div/div[1]/input    ${valorUnico}
    Sleep    1
    Seleccionar Tipo de Embarcacion
    Sleep    1
    Seleccionar Estado
    Sleep    1
    Seleccionar Municipio
    Sleep    1
    Seleccionar Localidad
    Sleep    1
    Seleccionar Puerto Base
    Input text    xpath=//*[@id="txtVehiculoJustificacion"]/div/div[1]/input    33445566
    Hacer scroll para ver el Boton Guardar Generales
    
Capturar datos del formulario Generales Nombre Duplicado
    Input Text    xpath=//*[@id="txtVehiculoNombre"]/div[1]/div[1]/input    ${EmbarcacionExistente}[Nombre]
    Seleccionar Razon Social
    Sleep    1
    Seleccionar Antena
    Validar registro unico    ${RNPCrear}    ${queryRNP}
    Input Text    xpath=//*[@id="txtVehiculoRNPBarco"]/div/div[1]/input    ${valorUnico}
    Sleep    1
    Seleccionar Litoral
    Input Text    xpath=//*[@id="txtVehiculoFolio"]/div/div[1]/input    55667788
    Validar registro unico    ${MatriculaCrear}    ${queryMatricula}
    Input Text    xpath=//*[@id="txtVehiculoMatricula"]/div/div[1]/input    ${valorUnico}
    Sleep    1
    Seleccionar Tipo de Embarcacion
    Sleep    1
    Seleccionar Estado
    Sleep    1
    Seleccionar Municipio
    Sleep    1
    Seleccionar Localidad
    Sleep    1
    Seleccionar Puerto Base
    Input text    xpath=//*[@id="txtVehiculoJustificacion"]/div/div[1]/input    33445566
    Hacer scroll para ver el Boton Guardar Generales
    
Capturar datos del formulario Generales RNP Duplicado
    Validar registro unico    ${NombreCrear}    ${queryNombre}
    Input Text    xpath=//*[@id="txtVehiculoNombre"]/div[1]/div[1]/input    ${valorUnico}
    Seleccionar Razon Social
    Sleep    1
    Seleccionar Antena
    Input Text    xpath=//*[@id="txtVehiculoRNPBarco"]/div/div[1]/input    ${EmbarcacionExistente}[RNP]
    Sleep    1
    Seleccionar Litoral
    Input Text    xpath=//*[@id="txtVehiculoFolio"]/div/div[1]/input    55667788
    Validar registro unico    ${MatriculaCrear}    ${queryMatricula}
    Input Text    xpath=//*[@id="txtVehiculoMatricula"]/div/div[1]/input    ${valorUnico}
    Sleep    1
    Seleccionar Tipo de Embarcacion
    Sleep    1
    Seleccionar Estado
    Sleep    1
    Seleccionar Municipio
    Sleep    1
    Seleccionar Localidad
    Sleep    1
    Seleccionar Puerto Base
    Input text    xpath=//*[@id="txtVehiculoJustificacion"]/div/div[1]/input    33445566
    Hacer scroll para ver el Boton Guardar Generales
    
Capturar datos del formulario Generales Matricula Duplicada
    Validar registro unico    ${NombreCrear}    ${queryNombre}
    Input Text    xpath=//*[@id="txtVehiculoNombre"]/div[1]/div[1]/input    ${valorUnico}
    Seleccionar Razon Social
    Sleep    1
    Seleccionar Antena
    Validar registro unico    ${RNPCrear}    ${queryRNP}
    Input Text    xpath=//*[@id="txtVehiculoRNPBarco"]/div/div[1]/input    ${valorUnico}
    Sleep    1
    Seleccionar Litoral
    Input Text    xpath=//*[@id="txtVehiculoFolio"]/div/div[1]/input    55667788
    Input Text    xpath=//*[@id="txtVehiculoMatricula"]/div/div[1]/input    ${EmbarcacionExistente}[Matricula]
    Sleep    1
    Seleccionar Tipo de Embarcacion
    Sleep    1
    Seleccionar Estado
    Sleep    1
    Seleccionar Municipio
    Sleep    1
    Seleccionar Localidad
    Sleep    1
    Seleccionar Puerto Base
    Input text    xpath=//*[@id="txtVehiculoJustificacion"]/div/div[1]/input    33445566
    Hacer scroll para ver el Boton Guardar Generales
    
Capturar datos del formulario Caracteristicas
    Input Text    xpath=//*[@id="txtCaracteristicasCarga"]/div/div[1]/input    ${CaracteristicasCrear}[Carga]
    Input Text    xpath=//*[@id="txtCaracteristicasManga"]/div/div[1]/input    ${CaracteristicasCrear}[Manga]
    Input Text    xpath=//*[@id="txtCaracteristicasTonelajeB"]/div/div[1]/input    ${CaracteristicasCrear}[TonelajeB]
    Input Text    xpath=//*[@id="txtCaracteristicasPotenciaMotor"]/div/div[1]/input    ${CaracteristicasCrear}[PMotor]
    Input Text    xpath=//*[@id="txtCaracteristicasEslora"]/div/div[1]/input    ${CaracteristicasCrear}[Eslora]
    Input Text    xpath=//*[@id="txtCaracteristicasPuntal"]/div/div[1]/input    ${CaracteristicasCrear}[Puntal]
    Input Text    xpath=//*[@id="txtCaracteristicasTonejaleN"]/div/div[1]/input    ${CaracteristicasCrear}[TonelajeN]
    Input Text    xpath=//*[@id="txtCaracteristicasMarca"]/div/div[1]/input    ${CaracteristicasCrear}[Marca]
    Wait Until Element Is Visible    xpath=//*[@id="btnCaracteristicasGuardar"]
    
Capturar datos del Permiso
    Seleccionar Tipo de Carga    4
    Input Text    xpath=//*[@id="txtPNoPermoso"]/div/div[1]/input    ${PermisosCrear}[NoPermiso]
    Input Text    xpath=//*[@id="txtPDescripcion"]/div/div[1]/input    ${PermisosCrear}[Descripcion]
    Input Text    xpath=//*[@id="dpPFechaInicio"]/div[1]/div/div[1]/input    ${PermisosCrear}[Inicio]
    Input Text    xpath=//*[@id="dpPFechaFin"]/div[1]/div/div[1]/input    ${PermisosCrear}[Fin]
    
Capturar datos del Permiso - Fechas incorrectas
    Seleccionar Tipo de Carga    4
    Input Text    xpath=//*[@id="txtPNoPermoso"]/div/div[1]/input    ${PermisosCrear}[NoPermiso]
    Input Text    xpath=//*[@id="txtPDescripcion"]/div/div[1]/input    ${PermisosCrear}[Descripcion]
    Input Text    xpath=//*[@id="dpPFechaInicio"]/div[1]/div/div[1]/input    ${PermisosCrear}[Fin]
    Input Text    xpath=//*[@id="dpPFechaFin"]/div[1]/div/div[1]/input    ${PermisosCrear}[Inicio]
    
Seleccionar Razon Social
    Click Element    xpath=//*[@id="cboVehiculoRazonSocial"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[8]
    
Seleccionar Antena
    Click Element    xpath=//*[@id="cboVehiculoAntena"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    
Seleccionar Litoral
    Click Element    xpath=//*[@id="cboVehiculoLitoral"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    
Seleccionar Tipo de Embarcacion
    Click Element    xpath=//*[@id="cboVehiculoTipo"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    
Seleccionar Estado
    Click Element    xpath=//*[@id="cboVehiculoEstado"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[3]
    
Seleccionar Municipio
    Click Element    xpath=//*[@id="cboVehiculoMunicipio"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[12]
    
Seleccionar Localidad
    Click Element    xpath=//*[@id="cboVehiculoLocalidad"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div
    
Seleccionar Puerto Base
    Click Element    xpath=//*[@id="cboVehiculoPuertoBase"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[3]
    
Hacer scroll para ver el TAB Caracteristicas
    Execute JavaScript    window.document.evaluate('//*[@id="tabCaracteristicas"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    
Hacer scroll para ver el TAB Grupos
    Execute JavaScript    window.document.evaluate('//*[@id="tabGrupos"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    
Hacer scroll para ver el TAB Permisos
    Execute JavaScript    window.document.evaluate('//*[@id="tabPermisos"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    
Hacer scroll para ver el TAB Artes de Carga
    Execute JavaScript    window.document.evaluate('//*[@id="tabArtesCarga"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    
Hacer scroll para ver el TAB Cambios de Antena
    Execute JavaScript    window.document.evaluate('//*[@id="tabCambiosAntena"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    
Validar campos obligatorios de TAB Generales
    ${ValNombre}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[0].textContent;
    ${ValRazon}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[1].textContent;
    ${ValTipo}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[2].textContent;
    ${Valantena}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[3].textContent;
    ${ValEstado}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[4].textContent;
    ${ValRNP}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[5].textContent;
    ${ValMuni}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[6].textContent;
    ${ValLit}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[7].textContent;
    ${ValLoc}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[8].textContent;
    ${ValFolio}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[9].textContent;
    ${ValPuerto}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[10].textContent;
    ${ValMat}    Execute Javascript    return document.getElementsByClassName("dx-overlay-wrapper dx-invalid-message")[11].textContent;
    Should be equal    ${ValNombre}    Obligatorio
    Should be equal    ${ValRazon}    Obligatorio
    Should be equal    ${ValTipo}    Obligatorio
    Should be equal    ${Valantena}    Obligatorio
    Should be equal    ${ValEstado}    Obligatorio
    Should be equal    ${ValRNP}    Obligatorio
    Should be equal    ${ValMuni}    Obligatorio
    Should be equal    ${ValLit}    Obligatorio
    Should be equal    ${ValLoc}    Obligatorio
    Should be equal    ${ValFolio}    Obligatorio
    Should be equal    ${ValPuerto}    Obligatorio
    Should be equal    ${ValMat}    Obligatorio
    
Validar generales en BD
    [Arguments]    ${MTTO}=${FALSE}
    Conexion a Base de Datos
    @{queryResults}    Query    select v.Nombre, rs.Descripcion, a.IdExterno, v.RNP, d.DescripcionCorta, v.Folio, v.Matricula, v.Texto5, edo.Descripcion, mpo.Descripcion, l.Descripcion, pti.Descripcion, v.Texto1, v.Mantenimiento from Sismep.TSismepVehiculos v join Sismep.TSismepAntenas a on v.IdAntena = a.IdAntena join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial join Sismep.TSismepLocalidades l on v.IdLocalidad = l.IdLocalidad join Sismep.TSismepMunicipios mpo on l.IdMunicipio = mpo.IdMunicipio join Sismep.TSismepEstados edo on mpo.IdEstado = edo.IdEstado join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where v.Nombre = '${Nombre}' and v.RNP='${RNP}' and v.Matricula='${Matricula}'
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
    Should Be Equal    ${queryResults[0][13]}    ${MTTO}
    Disconnect From Database
    
Validar caracteristicas en BD
    Conexion a Base de Datos
    @{queryResults}    Query    select Nombre, Carga, Manga, TonelajeB, Potencia, Eslora, Puntal, TonelajeN, MarcaMotor, FotoEmbarcacion from Sismep.TSismepVehiculos where Nombre = '${Nombre}'
    Should be equal    ${Nombre}    ${queryResults[0][0]}
    Should be equal    ${CaracteristicasCrear}[Carga]    ${queryResults[0][1]}
    Should be equal    ${CaracteristicasCrear}[Manga]    ${queryResults[0][2]}
    Should be equal    ${CaracteristicasCrear}[TonelajeB]    ${queryResults[0][3]}
    Should be equal    ${CaracteristicasCrear}[PMotor]    ${queryResults[0][4]}
    Should be equal    ${CaracteristicasCrear}[Eslora]    ${queryResults[0][5]}
    Should be equal    ${CaracteristicasCrear}[Puntal]    ${queryResults[0][6]}
    Should be equal    ${CaracteristicasCrear}[TonelajeN]    ${queryResults[0][7]}
    Should be equal    ${CaracteristicasCrear}[Marca]    ${queryResults[0][8]}
    Disconnect From Database
    
Validar etiquetas y tooltips TAB Generales
    ${ttGuardar}=    Get Element Attribute    xpath=//*[@id="btnVehiculoGuardar"]    tooltip
    ${ttCancelar}=    Get Element Attribute    xpath=//*[@id="btnVehiculoCancelar"]    tooltip
    Element Text Should be    xpath=/html/body/div[3]/div/div[1]/div/div[1]/div/div/div    Nueva Embarcación
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
    Should be equal    ${ttGuardar}    Guardar
    Should be equal    ${ttCancelar}    Cancelar