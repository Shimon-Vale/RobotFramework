*** Settings ***
Resource          Recursos.Busqueda.robot

*** Variables ***
${RegistroVMS}    xpath=//*[@id="titRegistro"]
${Contactos}      xpath=//*[@id="titContactos"]
${Permisos}       xpath=//*[@id="titPermisos"]
${DMS}            xpath=//*[@id="rdP_DMS"]
${Decimal}        xpath=//*[@id="rdP_Decimal"]
${KPH}            xpath=//*[@id="rdV_KPH"]
${MPH}            xpath=//*[@id="rdV_MPH"]
${Nudos}          xpath=//*[@id="rdV_Nudos"]
${DstKilometros}    xpath=//*[@id="rdD_Km"]
${DstMillas}      xpath=//*[@id="rdD_Mi"]
${DstNudos}       xpath=//*[@id="rdD_Nu"]
${DescargaReporte}    C:/Users/mmorales/Downloads/DetalleVehiculo.xlsx

*** Test Cases ***
Validar etiquetas - Menu contextual (clic derecho)
    [Documentation]    Valida que se muestre correctamente escritas las etiquetas del Menu contextual.
    [Tags]    Validar etiquetas - Menu contextual (clic derecho)
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Sleep    1
    Validar etiquetas - Menu contextual (clic derecho)
    [Teardown]    Close Browser

Validar informacion de embarcacion en BD
    [Documentation]    Valida que la informacion mostrada en pantalla coincida con la almacenada en la Base de datos.
    [Tags]    Validar informacion de embarcacion en BD - T321
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Sleep    1
    Validar datos de Embarcacion en BD - Contextual
    [Teardown]    Close Browser

Ver detalle embarcacion - Validar etiquetas y tooltips
    [Documentation]    Valida que se muestren correctamente escritas las etiquetas y tooltips del Ver detalle.
    [Tags]    Ver detalle embarcacion - Validar etiquetas y tooltips - T330
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Ver detalle embarcacion
    Sleep    1
    Ver detalle embarcacion - Validar etiquetas
    [Teardown]    Close Browser

Ver detalle embarcacion - Exportar a Excel
    [Documentation]    Valida que se exporte correctamente el archivo Excel con la información de la embarcacion.
    [Tags]    Ver detalle embarcacion - Exportar a Excel - T331
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Ver detalle embarcacion
    Sleep    1
    Presionar opcion Exportar detalle de Vehiculo
    Sleep    5
    Validar archivo de Excel generado
    [Teardown]    Close Browser

Ver detalle embarcacion - Validar Registro VMS
    [Documentation]    Valida que la informacion mostrada en la seccion corresponda a la registrada en la Base de datos.
    [Tags]    Ver detalle embarcacion - Validar Registro VMS
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Ver detalle embarcacion
    Sleep    1
    Presionar opcion: ${RegistroVMS}
    Sleep    1
    Validar registros en BD - Seccion Registro VMS    ${Embarcacion}[Nombre]
    [Teardown]    Close Browser

Ver detalle embarcacion - Validar Embarcacion
    [Documentation]    Valida que la informacion mostrada en la seccion corresponda a la registrada en la Base de datos.
    [Tags]    Ver detalle embarcacion - Validar Embarcacion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Ver detalle embarcacion
    Sleep    1
    Validar registros en BD - Seccion Embarcacion    ${Embarcacion}[Nombre]
    [Teardown]    Close Browser

Ver detalle embarcacion - Validar Permisionario
    [Documentation]    Valida que la informacion mostrada en la seccion corresponda a la registrada en la Base de datos.
    [Tags]    Ver detalle embarcacion - Validar Permisionario
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Ver detalle embarcacion
    Sleep    1
    Validar registros en BD - Seccion Permisionario    ${Embarcacion}[Nombre]
    [Teardown]    Close Browser

Ver detalle embarcacion - Validar Contactos
    [Documentation]    Valida que la informacion mostrada en la seccion corresponda a la registrada en la Base de datos.
    [Tags]    Ver detalle embarcacion - Validar Contactos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Ver detalle embarcacion
    Sleep    1
    Presionar opcion: ${Contactos}
    Sleep    1
    Validar registros en BD - Seccion Contactos    ${Embarcacion}[Nombre]
    [Teardown]    Close Browser

Ver detalle embarcacion - Validar Permisos
    [Documentation]    Valida que la informacion mostrada en la seccion corresponda a la registrada en la Base de datos.
    [Tags]    Ver detalle embarcacion - Validar Permisos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Ver detalle embarcacion
    Sleep    1
    Presionar opcion: ${Permisos}
    Sleep    1
    Validar registros en BD - Seccion Permisos    ${Embarcacion}[Nombre]
    [Teardown]    Close Browser
    
#Ver detalle embarcacion - Validar Datos Transmision
    #[Documentation]    Valida que la informacion mostrada en la seccion corresponda a la registrada en la Base de datos.
    #[Tags]    Ver detalle embarcacion - Validar Datos Transmision
    #Iniciar sesion
    #Ingresar a opcion Monitoreo
    #Presionar opcion Buscar Embarcacion
    #Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    #Sleep    1
    #Desplegar menu contextual de Embarcacion (clic derecho)
    #Seleccionar opcion Ver detalle embarcacion
    #Sleep    1
    #Validar registros en BD - Seccion Datos transmision    ${Embarcacion}[Nombre]
    #[Teardown]    Close Browser
    
Ver detalle embarcacion - Validar Ubicacion de transmision
    [Documentation]    Valida que la informacion mostrada en la seccion corresponda a la registrada en la Base de datos.
    [Tags]    Ver detalle embarcacion - Validar Ubicacion de transmision
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Ver detalle embarcacion
    Sleep    1
    Validar registros en BD - Seccion Ubicacion de transmision    ${Embarcacion}[Nombre]
    [Teardown]    Close Browser

Ver detalle embarcacion - Validar Ubicacion de transmision - Posicion Decimal
    [Documentation]    Valida que al modificar la configuracion de posicion a Decimal se muestre correctamente en el Ver detalle.
    [Tags]    Ver detalle embarcacion - Validar Ubicacion de transmision - Posicion Decimal
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Monitoreo - Configurar posicion    ${M_Decimal}
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Ver detalle embarcacion
    Sleep    1
    Validar registros en BD - Seccion Ubicacion de transmision - Posicion Decimal    ${Embarcacion}[Nombre]
    [Teardown]    Close Browser

Ver detalle embarcacion - Validar Ubicacion de transmision - Velocidad KPH
    [Documentation]    Valida que al modificar la configuracion de Velocidad a KPH se muestre correctamente en el Ver detalle.
    [Tags]    Ver detalle embarcacion - Validar Ubicacion de transmision - Posicion Decimal
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Monitoreo - Configurar Velocidad    ${M_KPH}
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Ver detalle embarcacion
    Sleep    1
    Validar registros en BD - Seccion Ubicacion de transmision    ${Embarcacion}[Nombre]    CONVERT(DECIMAL(5,2),(mf.Velocidad))    KPH
    [Teardown]    Close Browser

Ver detalle embarcacion - Validar Ubicacion de transmision - Velocidad MPH
    [Documentation]    Valida que al modificar la configuracion de Velocidad a MPH se muestre correctamente en el Ver detalle..
    [Tags]    Ver detalle embarcacion - Validar Ubicacion de transmision - Velocidad MPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Monitoreo - Configurar Velocidad    ${M_MPH}
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Ver detalle embarcacion
    Sleep    1
    Validar registros en BD - Seccion Ubicacion de transmision    ${Embarcacion}[Nombre]    CONVERT(DECIMAL(5,2),(mf.Velocidad / 1.609))    MPH
    [Teardown]    Close Browser

Seguimiento especial - Validar etiquetas y tooltips
    [Documentation]    Valida que se muestren correctamente escritas las etiquetas y tooltips en seguimiento especial.
    [Tags]    Seguimiento especial - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Seguimiento especial
    Sleep    1
    Seguimiento especial - Validar etiquetas y tooltips
    [Teardown]    Close Browser

Seguimiento especial - Validar datos de embarcacion en BD
    [Documentation]    Valida que los datos mostrados en seguimiento especial coincidan con los registrados en la Base de datos.
    [Tags]    Seguimiento especial - Validar datos de embarcacion en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Seguimiento especial
    Sleep    1
    Seguimiento especial - Validar datos de Embarcacion en BD    ${Embarcacion}[Nombre]
    [Teardown]    Close Browser

Seguimiento especial - Validar etiquetas - Menu contextual (clic izquierdo)
    [Documentation]    Valida que las etiquetas del Menu contextual de la opcion Seguimiento especial se muestren correctamente escritas.
    [Tags]    Seguimiento especial - Validar etiquetas - Menu contextual (clic izquierdo)
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Seguimiento especial
    Sleep    1
    Seguimiento especial - Desplegar menu contextual de Embarcacion (clic izquierdo)
    Seguimiento especial - Validar etiquetas - Menu contextual (clic izquierdo)
    [Teardown]    Close Browser

Seguimiento especial - Validar datos de embarcacion en BD - Menu contextual (clic izquierdo)
    [Documentation]    Valida que la informacion mostrada en pantalla coincida con la almacenada en la Base de datos.
    [Tags]    Seguimiento especial - Validar datos de embarcacion en BD - Menu contextual (clic izquierdo)
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Seguimiento especial
    Sleep    1
    Seguimiento especial - Desplegar menu contextual de Embarcacion (clic izquierdo)
    Sleep    1
    Seguimiento especial - Validar datos de Embarcacion en BD - Contextual
    [Teardown]    Close Browser

Seguimiento especial - Mostrar Zonas
    [Documentation]    Valida que al seleccionar la opcion zonas se muestren pintadas en el mapa correctamente.
    [Tags]    Seguimiento especial - Mostrar Zonas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Seguimiento especial
    Sleep    1
    Seleccionar opcion Zonas
    Sleep    5
    Validar zonas activadas
    [Teardown]    Close Browser

#Seguimiento especial - Mostrar Nautica
    #[Documentation]    Valida que al seleccionar la opcion Nautica se muestre en el mapa correctamente.
    #[Tags]    Seguimiento especial - Mostrar Nautica
    #Iniciar sesion
    #Sleep    1
    #Ingresar a opcion Monitoreo
    #Presionar opcion Buscar Embarcacion
    #Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    #Sleep    1
    #Desplegar menu contextual de Embarcacion (clic derecho)
    #Seleccionar opcion Seguimiento especial
    #Sleep    1
    #Seleccionar opcion Nautica
    #Sleep    5
    #Validar nautica activada
    #[Teardown]    Close Browser

Seguimiento especial - Mostrar Distancia
    [Documentation]    Valida que al seleccionar la opcion Distancia permita calcular la distancia de un punto a otro.
    [Tags]    Seguimiento especial - Mostrar Distancia
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Seguimiento especial
    Zoom IN
    Sleep    1
    Seleccionar opcion Distancia
    Sleep    1
    Validar distancia activada    mn
    [Teardown]    Close Browser

Seguimiento especial - Configuracion (contextual) - Posicion Decimal
    [Documentation]    Valida que al cambiar la configuracion de Posicion a Decimal se cambie correctamente en el Menú contextual.
    [Tags]    Seguimiento especial - Configuracion (contextual) - Posicion Decimal
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Seguimiento especial
    Configurar posicion    ${Decimal}
    Sleep    1
    Seguimiento especial - Desplegar menu contextual de Embarcacion (clic izquierdo)
    Seguimiento especial - Validar datos de Embarcacion en BD - Contextual - Posicion Decimal
    [Teardown]    Close Browser

Seguimiento especial - Configuracion (contextual) - Velocidad KPH
    [Documentation]    Valida que al cambiar la configuracion de Velocidad a KPH se cambie correctamente en el Menú contextual.
    [Tags]    Seguimiento especial - Configuracion (contextual) - Velocidad KPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Seguimiento especial
    Configurar Velocidad    ${KPH}
    Sleep    1
    Seguimiento especial - Desplegar menu contextual de Embarcacion (clic izquierdo)
    Seguimiento especial - Validar datos de Embarcacion en BD - Contextual    CONVERT(DECIMAL(5,2),(mf.Velocidad))    KPH
    [Teardown]    Close Browser

Seguimiento especial - Configuracion (contextual) - Velocidad MPH
    [Documentation]    Valida que al cambiar la configuracion de Velocidad a MPH se cambie correctamente en el Menú contextual.
    [Tags]    Seguimiento especial - Configuracion (contextual) - Velocidad MPH
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Seguimiento especial
    Configurar Velocidad    ${MPH}
    Sleep    1
    Seguimiento especial - Desplegar menu contextual de Embarcacion (clic izquierdo)
    Seguimiento especial - Validar datos de Embarcacion en BD - Contextual    CONVERT(DECIMAL(5,2),(mf.Velocidad / 1.609))    MPH
    [Teardown]    Close Browser

Seguimiento especial - Configuracion - Distancia Km
    [Documentation]    Valida que al cambiar la configuracion de Distancia a Km se cambie correctamente al activar la opcion Distancia.
    [Tags]    Seguimiento especial - Configuracion - Distancia Km
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Seguimiento especial
    Configurar Distancia    ${DstKilometros}
    Seleccionar opcion Distancia
    Sleep    1
    Validar distancia activada    km
    [Teardown]    Close Browser

Seguimiento especial - Configuracion - Distancia Mi
    [Documentation]    Valida que al cambiar la configuracion de Distancia a Mi se cambie correctamente al activar la opcion Distancia.
    [Tags]    Seguimiento especial - Configuracion - Distancia Mi
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Seguimiento especial
    Configurar Distancia    ${DstMillas}
    Seleccionar opcion Distancia
    Sleep    1
    Validar distancia activada    mi
    [Teardown]    Close Browser

Cambiar frecuencia del reporte de posicion - Validar etiquetas
    [Documentation]    Valida que se muestren correctamente las etiquetas en la opcion de cambiar frecuencia.
    [Tags]    Cambiar frecuencia del reporte de posicion - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Cambiar frecuencia del reporte de posicion
    Sleep    1
    Cambiar frecuencia del reporte de posicion - Validar etiquetas
    [Teardown]    Close Browser

Cambiar frecuencia del reporte de posicion - Enviar - Validar comando en BD
    [Documentation]    Valida que al enviar un comando de cambio de frecuencia llegue correctamente a la Base de datos.
    [Tags]    Cambiar frecuencia del reporte de posicion - Enviar - Validar comando en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Cambiar frecuencia del reporte de posicion
    Sleep    1
    Seleccionar Nueva frecuencia
    Presionar boton Enviar
    Sleep    1
    Cambiar frecuencia del reporte de posicion - Validar comando en BD
    [Teardown]    Close Browser

Cambiar frecuencia del reporte de posicion - Enviar - Validar mensaje
    [Documentation]    Valida que al enviar un comando de Cambio de frecuencia se muestre correctamente el mensaje informativo.
    [Tags]    Cambiar frecuencia del reporte de posicion - Enviar - Validar mensaje
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Cambiar frecuencia del reporte de posicion
    Sleep    1
    Seleccionar Nueva frecuencia
    Presionar boton Enviar
    Cambiar frecuencia del reporte de posicion - Validar mensaje    El comando ha sido enviado    div=3
    [Teardown]    Close Browser

Cambiar frecuencia del reporte de posicion - Sin Embarcacion - Validar mensaje
    [Documentation]    Valida que se muestre un mensaje de validacion al no seleccionar una embarcacion.
    [Tags]    Cambiar frecuencia del reporte de posicion - Sin Embarcacion - Validar mensaje
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Cambiar frecuencia del reporte de posicion
    Sleep    1
    Cambiar frecuencia del reporte de posicion - Limpiar campo Nombre
    Seleccionar Nueva frecuencia
    Presionar boton Enviar
    Cambiar frecuencia del reporte de posicion - Validar mensaje    Favor de seleccionar una Embarcación.
    [Teardown]    Close Browser

Cambiar frecuencia del reporte de posicion - Frecuencia = 0 - Validar mensaje
    [Documentation]    Valida que se muestre un mensaje de validacion si la frecuencia es menor o igual a 0.
    [Tags]    Cambiar frecuencia del reporte de posicion - Frecuencia = 0 - Validar mensaje
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Cambiar frecuencia del reporte de posicion
    Sleep    1
    Presionar boton Enviar
    Cambiar frecuencia del reporte de posicion - Validar mensaje    Favor de seleccionar una frecuencia mayor a 0.
    [Teardown]    Close Browser

Cambiar frecuencia del reporte de posicion - Vigencia fuera de rango - Validar mensaje
    [Documentation]    Valida que se muestre un mensaje de validacion cuando la fecha elegida se encuentra fuera de rango.
    [Tags]    Cambiar frecuencia del reporte de posicion - Vigencia fuera de rango - Validar mensaje
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Cambiar frecuencia del reporte de posicion
    Sleep    1
    Seleccionar Nueva frecuencia
    Seleccionar Vigencia fuera de rango
    Verificar Mensaje de Validacion Fuera de Rango    Valor fuera de rango
    [Teardown]    Close Browser

Solicitar posicion actual: Validar etiquetas
    [Documentation]    Valida que se muestre correctamente escritas las etiquetas mostradas en pantalla.
    [Tags]    Solicitar posicion actual: Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Solicitar posicion actual
    Sleep    1
    Solicitar posicion actual - Validar etiquetas
    [Teardown]    Close Browser

Solicitar posicion actual: Enviar - Validar comando en BD
    [Documentation]    Valida al enviar un comando de Solicitud de posicion se guarde correctamente en la Base de datos.
    [Tags]    Solicitar posicion actual: Enviar - Validar comando en BD
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Solicitar posicion actual
    Sleep    1
    Solicitar posicion actual - Presionar boton Enviar
    Sleep    1
    Solicitar posicion actual - Validar en BD
    [Teardown]    Close Browser

Solicitar posicion actual: Enviar - Validar mensaje
    [Documentation]    Valida que se muestre un mensaje confirmando que se haya enviado correctamente el comando.
    [Tags]    Solicitar posicion actual: Enviar - Validar mensaje
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Solicitar posicion actual
    Sleep    1
    Solicitar posicion actual - Presionar boton Enviar
    Sleep    1
    Solicitar posicion actual - Validar mensaje    El comando ha sido enviado    div=3
    [Teardown]    Close Browser

Solicitar posicion actual: Sin embarcacion - Validar mensaje
    [Documentation]    Valida que se muestre un mensaje de validacion cuando no se haya seleccionado una embarcacion.
    [Tags]    Solicitar posicion actual: Sin embarcacion - Validar mensaje
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Esperar advertencia de alertas no visible
    Presionar opcion Buscar Embarcacion
    Filtrar Embarcacion por Columna 1, Campo ${Embarcacion}[Nombre]
    Sleep    1
    Desplegar menu contextual de Embarcacion (clic derecho)
    Seleccionar opcion Solicitar posicion actual
    Sleep    1
    Solicitar posicion actual - Limpiar campo Nombre
    Solicitar posicion actual - Presionar boton Enviar
    Solicitar posicion actual - Validar mensaje    Favor de seleccionar una Embarcación.    div=4
    [Teardown]    Close Browser

*** Keywords ***
Desplegar menu contextual de Embarcacion (clic derecho)
    Open Context Menu    //div[@id='map']//div[3]//div[1]//img[1]

Validar etiquetas - Menu contextual (clic derecho)
    Element Text Should Be    //*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[2]/td[1]/b    Embarcaci\u00F3n:
    Element Text Should Be    //*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[3]/td[1]/b    RNP:
    Element Text Should Be    //*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[4]/td[1]/b    Matr\u00EDcula:
    Element Text Should Be    //*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[5]/td[1]/b    Raz\u00F3n Social:
    Element Text Should Be    //*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[6]/td[1]/b    Tipo:
    Element Text Should Be    //*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/ul/li[1]/a/div/div[2]/span    Ver detalle embarcacion
    Element Text Should Be    //*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/ul/li[2]/a/div/div[2]/span    Seguimiento especial
    Element Text Should Be    //*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/ul/li[3]/a/div/div[2]/span    Cambiar frecuencia del reporte de posicion
    Element Text Should Be    //*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/ul/li[4]/a/div/div[2]/span    Enviar comando
    Element Text Should Be    //*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/ul/li[5]/a/div/div[2]/span    Solicitar posici\u00F3n actual

Presionar opcion Exportar detalle de Vehiculo
    Wait Until Element Is Visible    xpath=//*[@id="cardDescargaDetalleVehiculo"]
    Click Element    xpath=//*[@id="cardDescargaDetalleVehiculo"]

Validar archivo de Excel generado
    File Should Exist    ${DescargaReporte}

Obtener datos de la Embarcacion - Contextual
    ${Nombre}=    Get Text       xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[2]/td[2]
    ${RNP}=    Get Text          xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[3]/td[2]
    ${Matricula}=    Get Text    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[4]/td[2]
    ${RS}=    Get Text           xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[5]/td[2]
    ${Tipo}=    Get Text         xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[6]/td[2]
    Set Test Variable    ${Nombre}
    Set Test Variable    ${RNP}
    Set Test Variable    ${Matricula}
    Set Test Variable    ${RS}
    Set Test Variable    ${Tipo}

Validar datos de Embarcacion en BD - Contextual
    Obtener datos de la Embarcacion - Contextual
    Conexion a Base de datos
    @{queryResults}=    Query    select v.Nombre, v.RNP, v.Matricula, rs.Descripcion, v.Texto5 from Sismep.TSismepVehiculos v join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial where v.Nombre = '${Embarcacion}[Nombre]'
    ${TipoBD}    Convert To Upper Case    ${queryResults[0][4]}
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${RNP}
    Should Be Equal    ${queryResults[0][2]}    ${Matricula}
    Should Be Equal    ${queryResults[0][3]}    ${RS}
    Should Be Equal    ${TipoBD}    ${Tipo}
    Disconnect From Database

Seleccionar opcion Ver detalle embarcacion
    Wait Until Element Is Visible    //*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/ul/li[1]/a/div/div[2]/span
    Click Element    //*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/ul/li[1]/a/div/div[2]/span

Ver detalle embarcacion - Validar etiquetas
    Element Text Should Be    xpath=//*[@id="cardDescargaDetalleVehiculo"]/span    Exportar detalle de Vehículo
    Click Element    xpath=//*[@id="titRegistro"]
    Sleep    1
    Element Text Should Be    xpath=//*[@id="titRegistro"]/span    Registro VMS
    Element Text Should Be    xpath=//*[@id="dvAntena"]/div[1]    Antena
    Element Text Should Be    xpath=//*[@id="dvFolio"]/div[1]    Folio
    Element Text Should Be    xpath=//*[@id="dvTipo"]/div[1]    Tipo
    Click Element    xpath=//*[@id="titRegistro"]
    Sleep    1
    Element Text Should Be    xpath=//*[@id="titEmbarcacion"]/span    Embarcación
    Element Text Should Be    xpath=//*[@id="dvNombreEmbarcacion"]/div[1]    Nombre embarcación
    Element Text Should Be    xpath=//*[@id="dvRNP"]/div[1]    RNP
    Element Text Should Be    xpath=//*[@id="dvMatricula"]/div[1]    Matrícula
    Element Text Should Be    xpath=//*[@id="dvEslora"]/div[1]    Eslora
    Element Text Should Be    xpath=//*[@id="dvMarca"]/div[1]    Marca
    Element Text Should Be    xpath=//*[@id="dvPotenciaHP"]/div[1]    Potencia HP
    Element Text Should Be    xpath=//*[@id="dvPuertoBase"]/div[1]    Puerto Base
    Element Text Should Be    xpath=//*[@id="dvLitoral"]/div[1]    Litoral
    Click Element    xpath=//*[@id="titEmbarcacion"]
    Sleep    1
    Element Text Should Be    xpath=//*[@id="titPermisionario"]/span    Permisionario
    Element Text Should Be    xpath=//*[@id="dvRazonSocial"]/div[1]    Razón Social1
    Element Text Should Be    xpath=//*[@id="dvRazonSocial2"]/div[1]    Razón Social2
    Element Text Should Be    xpath=//*[@id="dvRNPTitular"]/div[1]    RNP Titular
    Element Text Should Be    xpath=//*[@id="dvLocalidad"]/div[1]    Localidad
    Element Text Should Be    xpath=//*[@id="dvMunicipio"]/div[1]    Municipio
    Element Text Should Be    xpath=//*[@id="dvEstado"]/div[1]    Estado
    #Element Text Should Be    xpath=//*[@id="dvDomicilio"]/div[1]    Domicilio
    Click Element    xpath=//*[@id="titPermisionario"]
    Sleep    1
    Click Element    xpath=//*[@id="titContactos"]
    Sleep    1
    Element Text Should Be    xpath=//*[@id="contactosBody"]/table/thead/tr/th[1]    Nombre
    Element Text Should Be    xpath=//*[@id="contactosBody"]/table/thead/tr/th[2]    Puesto
    Element Text Should Be    xpath=//*[@id="contactosBody"]/table/thead/tr/th[3]    Telefono
    Click Element    xpath=//*[@id="titContactos"]
    Sleep    1
    Click Element    xpath=//*[@id="titPermisos"]
    Sleep    1
    Element Text Should Be    xpath=//*[@id="titPermisos"]/span    Permisos
    Element Text Should Be    xpath=//*[@id="permisosBody"]/div[1]/div[1]    No.Permiso
    Element Text Should Be    xpath=//*[@id="permisosBody"]/div[2]/div[1]    Pesquería
    Element Text Should Be    xpath=//*[@id="permisosBody"]/div[3]/div[1]    Vigencia inicio
    Element Text Should Be    xpath=//*[@id="permisosBody"]/div[4]/div[1]    Vigencia conclusión
    Element Text Should Be    xpath=//*[@id="permisosBody"]/div[5]/div[1]    Velocidad de operación
    Element Text Should Be    xpath=//*[@id="permisosBody"]/div[6]/div[1]    Velocidad de crucero
    #Element Text Should Be    xpath=//*[@id="permisosBody"]/div[7]/div[1]    Múltiples permisos
    Click Element    xpath=//*[@id="titPermisos"]
    Sleep    1
    Element Text Should Be    xpath=//*[@id="titDatosTransmision"]/span    Datos Transmisión
    Element Text Should Be    xpath=//*[@id="dvTransmitiendo"]/div[1]    Transmitiendo
    Element Text Should Be    xpath=//*[@id="dvUltimoReporte"]/div[1]    Ultimo Reporte
    Element Text Should Be    xpath=//*[@id="dvEnPuerto"]/div[1]    En Puerto
    Element Text Should Be    xpath=//*[@id="dvTxIrregular"]/div[1]    Tx Irregular
    Element Text Should Be    xpath=//*[@id="dvBateriaRespaldo"]/div[1]    Bateria de Respaldo
    Element Text Should Be    xpath=//*[@id="dvIngZonaRestringida"]/div[1]    Ingreso de Zona Restringida
    Element Text Should Be    xpath=//*[@id="dvIngZonaProhibida"]/div[1]    Ingreso de Zona de Pesca Prohibida
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[3]/div[8]/div[2]/div/div[8]/div[1]    Operacion Zona Restringida
    Element Text Should Be    xpath=/html/body/div[1]/div/nav[3]/div[8]/div[2]/div/div[9]/div[1]    Operacion Zona de Pesca Prohibida
    Element Text Should Be    xpath=//*[@id="dvPermisoVencido"]/div[1]    Permiso Vencido
    Element Text Should Be    xpath=//*[@id="datosTransmision"]/div/div[11]/div[1]    Proximidad
    Click Element    xpath=//*[@id="titDatosTransmision"]
    Sleep    1
    Click Element    xpath=//*[@id="titJustificacion"]
    Sleep    1
    Element Text Should Be    xpath=//*[@id="titJustificacion"]/span    Justificacion de No Transmision
    Element Text Should Be    xpath=//*[@id="dvCantidadLlamadas"]/div[1]    Cantidad de llamadas realizadas
    Element Text Should Be    xpath=//*[@id="dvPersonaAtenioLlamada"]/div[1]    Persona que atendio la llamada
    Element Text Should Be    xpath=//*[@id="dvFechaHora"]/div[1]    Fecha-Hora
    Click Element    xpath=//*[@id="titJustificacion"]
    Sleep    1
    Element Text Should Be    xpath=//*[@id="titUbicacion"]/span    Ubicacion de Transmisión
    Element Text Should Be    xpath=//*[@id="dvLatitud"]/div[1]    Latitud
    Element Text Should Be    xpath=//*[@id="dvLongitud"]/div[1]    Longitud
    Element Text Should Be    xpath=//*[@id="dvVelocidad"]/div[1]    Velocidad
    Element Text Should Be    xpath=//*[@id="dvRumbo"]/div[1]    Rumbo
    Element Text Should Be    xpath=//*[@id="dvEmbarcacionProxima"]/div[1]    Embarcación Próxima
    Element Text Should Be    xpath=//*[@id="dvPuntoCercano"]/div[1]    Punto más cercano
    Element Text Should Be    xpath=//*[@id="dvDistanciaBase"]/div[1]    Distancia a base

Presionar opcion: ${OPC}
    Wait Until Element Is Visible    ${OPC}
    Click Element    ${OPC}

Obtener datos de la seccion Registro VMS
    ${Antena}=    Get Text    xpath=//*[@id="divAntena"]
    ${Folio}=    Get Text    xpath=//*[@id="divFolio"]
    ${Tipo}=    Get Text    xpath=//*[@id="divTipo"]
    Set Test Variable    ${Antena}
    Set Test Variable    ${Folio}
    Set Test Variable    ${Tipo}

Validar registros en BD - Seccion Registro VMS
    [Arguments]    ${arg1}
    Obtener datos de la seccion Registro VMS
    Conexion a Base de datos
    @{queryResults}=    Query    select a.IdExterno,v.Folio,v.Texto5 from Sismep.TSismepVehiculos v join Sismep.TSismepAntenas a on v.IdAntena = a.IdAntena where v.Nombre = '${arg1}'
    Should Be Equal    ${queryResults[0][0]}    ${Antena}
    Should Be Equal    ${queryResults[0][1]}    ${Folio}
    Should Be Equal    ${queryResults[0][2]}    ${Tipo}
    Disconnect From Database

Obtener datos de la seccion Embarcacion
    ${NombreEmbarcacion}=    Get Text    xpath=//*[@id="divNombre"]
    ${RNP}=    Get Text    xpath=//*[@id="divRnp"]
    ${Matricula}=    Get Text    xpath=//*[@id="divMatricula"]
    ${Eslora}=    Get Text    xpath=//*[@id="divEslora"]
    ${Marca}=    Get Text    xpath=//*[@id="divMarca"]
    ${PotenciaHP}=    Get Text    xpath=//*[@id="divPotencia"]
    ${PuertoBase}=    Get Text    xpath=//*[@id="divPuertoBase"]
    ${Litoral}=    Get Text    xpath=//*[@id="divLitoral"]
    Set Test Variable    ${NombreEmbarcacion}
    Set Test Variable    ${RNP}
    Set Test Variable    ${Matricula}
    Set Test Variable    ${Eslora}
    Set Test Variable    ${Marca}
    Set Test Variable    ${PotenciaHP}
    Set Test Variable    ${PuertoBase}
    Set Test Variable    ${Litoral}

Validar registros en BD - Seccion Embarcacion
    [Arguments]    ${arg1}
    Obtener datos de la seccion Embarcacion
    Conexion a Base de datos
    @{queryResults}=    Query    select v.Nombre,v.RNP,v.Matricula,v.Eslora,v.MarcaMotor,v.Potencia ,pti.Descripcion,d.DescripcionCorta from Sismep.TSismepVehiculos v join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres join Sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where v.Nombre = '${arg1}'
    Should Be Equal    ${queryResults[0][0]}    ${NombreEmbarcacion}
    Should Be Equal    ${queryResults[0][1]}    ${RNP}
    Should Be Equal    ${queryResults[0][2]}    ${Matricula}
    Should Be Equal    ${queryResults[0][3]}    ${Eslora}
    Should Be Equal    ${queryResults[0][4]}    ${Marca}
    Should Be Equal    ${queryResults[0][5]}    ${PotenciaHP}
    Should Be Equal    ${queryResults[0][6]}    ${PuertoBase}
    Should Be Equal    ${queryResults[0][7]}    ${Litoral}
    Disconnect From Database

Obtener datos de la seccion Permisionario
    ${RazonSocial1}=    Get Text    xpath=//*[@id="divRazonSocial1"]
    ${RazonSocial2}=    Get Text    xpath=//*[@id="divRazonSocial2"]
    ${RNPTitular}=    Get Text    xpath=//*[@id="divRnpTitular"]
    ${Localidad}=    Get Text    xpath=//*[@id="divLocalidad"]
    ${Municipio}=    Get Text    xpath=//*[@id="divMunicipio"]
    ${Estado}=    Get Text    xpath=//*[@id="divEstado"]
    #${Domicilio}=    Get Text    xpath=//*[@id="divDomicilio"]
    Set Test Variable    ${RazonSocial1}
    Set Test Variable    ${RazonSocial2}
    Set Test Variable    ${RNPTitular}
    Set Test Variable    ${Localidad}
    Set Test Variable    ${Municipio}
    Set Test Variable    ${Estado}
    #Set Test Variable    ${Domicilio}

Validar registros en BD - Seccion Permisionario
    [Arguments]    ${arg1}
    Obtener datos de la seccion Permisionario
    Conexion a Base de datos
    @{queryResults}=    Query    select rs1.Descripcion, isnull(rs2.Descripcion, 'NO APLICA'), rs1.RNPTitular, loc.Descripcion, mpo.Descripcion, edo.Descripcion, isnull(rs1.Domicilio, 'SIN DATOS') from Sismep.TSismepVehiculos v join Sismep.TSismepRazonSocial rs1 on v.IdRazonSocial = rs1.IdRazonSocial left join Sismep.TSismepRazonSocial rs2 on v.IdRazonSocial2 = rs2.IdRazonSocial join Sismep.TSismepLocalidades loc on v.IdLocalidad = loc.IdLocalidad join Sismep.TSismepMunicipios mpo on loc.IdMunicipio = mpo.IdMunicipio join Sismep.TSismepEstados edo on mpo.IdEstado = edo.IdEstado where v.Nombre = '${arg1}'
    Should Be Equal    ${queryResults[0][0]}    ${RazonSocial1}
    Should Be Equal    ${queryResults[0][1]}    ${RazonSocial2}
    Should Be Equal    ${queryResults[0][2]}    ${RNPTitular}
    Should Be Equal    ${queryResults[0][3]}    ${Localidad}
    Should Be Equal    ${queryResults[0][4]}    ${Municipio}
    Should Be Equal    ${queryResults[0][5]}    ${Estado}
    #Should Be Equal    ${queryResults[0][6]}    ${Domicilio}
    Disconnect From Database

Obtener datos de la seccion Contactos
    Click Element    xpath=//*[@id="titEmbarcacion"]
    Sleep    1
    Click Element    xpath=//*[@id="titPermisionario"]
    Sleep    1
    ${Contacto1}=    Get Text    xpath=//*[@id="contactosBody"]/table/tbody/tr[1]/td[1]
    ${Puesto1}=    Get Text    xpath=//*[@id="contactosBody"]/table/tbody/tr[1]/td[2]
    ${Telefono1}=    Get Text    xpath=//*[@id="contactosBody"]/table/tbody/tr[1]/td[3]
    Set Test Variable    ${Contacto1}
    Set Test Variable    ${Puesto1}
    Set Test Variable    ${Telefono1}

Validar registros en BD - Seccion Contactos
    [Arguments]    ${arg1}
    Obtener datos de la seccion Contactos
    Conexion a Base de datos
    @{queryResults}=    Query    select rsc.Nombre, rsr.Referencia, rsr.Telefono from Sismep.TSismepVehiculos v join Sismep.TSismepRazonSocial rs on v.IdRazonSocial = rs.IdRazonSocial join Sismep.TSismepRazonSocialContactos rsc on rs.IdRazonSocial = rsc.IdRazonSocial join Sismep.TSismepRazonSocialReferencias rsr on rsc.IdRazonSocialContacto = rsr.IdRazonSocialContacto where v.Nombre = '${arg1}'
    Should Be Equal    ${queryResults[0][0]}    ${Contacto1}
    Should Be Equal    ${queryResults[0][1]}    ${Puesto1}
    Should Be Equal    ${queryResults[0][2]}    ${Telefono1}
    Disconnect From Database

Obtener datos de la seccion Permisos
    Click Element    xpath=//*[@id="titEmbarcacion"]
    Sleep    1
    Click Element    xpath=//*[@id="titPermisionario"]
    Sleep    1
    ${NoPermiso}=    Get Text    xpath=//*[@id="permisosBody"]/div[1]/div[2]
    ${Pesqueria}=    Get Text    xpath=//*[@id="permisosBody"]/div[2]/div[2]
    ${VigenciaInicio}=    Get Text    xpath=//*[@id="permisosBody"]/div[3]/div[2]
    ${VigenciaConclusion}=    Get Text    xpath=//*[@id="permisosBody"]/div[4]/div[2]
    ${VelocidadOperacion}=    Get Text    xpath=//*[@id="permisosBody"]/div[5]/div[2]
    ${VelocidadCrucero}=    Get Text    xpath=//*[@id="permisosBody"]/div[6]/div[2]
    Set Test Variable    ${NoPermiso}
    Set Test Variable    ${Pesqueria}
    Set Test Variable    ${VigenciaInicio}
    Set Test Variable    ${VigenciaConclusion}
    Set Test Variable    ${VelocidadOperacion}
    Set Test Variable    ${VelocidadCrucero}

Validar registros en BD - Seccion Permisos
    [Arguments]    ${arg1}
    Obtener datos de la seccion Permisos
    Conexion a Base de datos
    @{queryResults}=    Query    select vp.NumeroPermiso, vp.Descripcion, convert(varchar, vp.FechaInicial, 103), convert(varchar, vp.FechaFinal, 103), tc.VelocidadMin * 1 / 1.852, tc.VelocidadMax * 1 / 1.852, tc.CruceroMin * 1 / 1.852, tc.CruceroMax * 1 / 1.852 from Sismep.TSismepVehiculos v join Sismep.TSismepVehiculosPermisos vp on v.IdVehiculo = vp.IdVehiculo join Sismep.TSismepTiposCarga tc on vp.IdTipoCarga = tc.IdTipoCarga where v.Nombre = '${arg1}' and vp.Descripcion = '${Pesqueria}'
    ${velmin}=    Convert To Number    ${queryResults[0][4]}
    ${velmax}=    Convert To Number    ${queryResults[0][5]}
    ${crumin}=    Convert To Number    ${queryResults[0][6]}
    ${crumax}=    Convert To Number    ${queryResults[0][7]}
    ${vopeBD}=    Catenate    ${velmin}0    Nudos a    ${velmax}0    Nudos
    ${vcruBD}=    Catenate    ${crumin}0    Nudos a    ${crumax}0    Nudos
    Should Be Equal    ${queryResults[0][0]}    ${NoPermiso.strip()}    #Se remueven espacios en blanco de la cadena
    Should Be Equal    ${queryResults[0][1]}    ${Pesqueria}
    Should Be Equal    ${queryResults[0][2]}    ${VigenciaInicio}
    Should Be Equal    ${queryResults[0][3]}    ${VigenciaConclusion}
    Should Be Equal    ${vopeBD}    ${VelocidadOperacion}
    Should Be Equal    ${vcruBD}    ${VelocidadCrucero}
    Disconnect From Database

Obtener datos de la seccion Datos transmision
    Click Element    xpath=//*[@id="titEmbarcacion"]
    Sleep    1
    Click Element    xpath=//*[@id="titPermisionario"]
    Sleep    1
    ${Transmitiendo}=    Get Text    xpath=//*[@id="divTransmitiendo"]
    ${UltimoReporte}=    Get Text    xpath=//*[@id="divUltimoReporte"]
    ${EnPuerto}=    Get Text    xpath=//*[@id="divEnPuerto"]
    ${TxIrregular}=    Get Text    xpath=//*[@id="divTxIrregular"]
    ${BateriaRespaldo}=    Get Text    xpath=//*[@id="divBateriaRespaldo"]
    ${ZonaRestringida}=    Get Text    xpath=//*[@id="divZonaRestringida"]
    ${ZonaPescaProhibida}=    Get Text    xpath=//*[@id="divZonaPesca"]
    ${OperacionRestringida}=    Get Text    xpath=//*[@id="divOperacionRestringida"]
    ${OperacionPescaProhibida}=    Get Text    xpath=//*[@id="divOperacionPesca"]
    ${PermisoVencido}=    Get Text    xpath=//*[@id="divPermisoVencido"]
    ${Proximidad}=    Get Text    xpath=//*[@id="divProximidad"]
    Set Test Variable    ${Transmitiendo}
    Set Test Variable    ${UltimoReporte}
    Set Test Variable    ${EnPuerto}
    Set Test Variable    ${TxIrregular}
    Set Test Variable    ${BateriaRespaldo}
    Set Test Variable    ${ZonaRestringida}
    Set Test Variable    ${ZonaPescaProhibida}
    Set Test Variable    ${OperacionRestringida}
    Set Test Variable    ${OperacionPescaProhibida}
    Set Test Variable    ${PermisoVencido}
    Set Test Variable    ${Proximidad}

Validar registros en BD - Seccion Datos transmision
    [Arguments]    ${arg1}
    Obtener datos de la seccion Datos transmision
    Conexion a Base de datos
    @{queryResults}=    Query    select \ an.Descripcion, ve.Folio, ve.Texto5 \ \ from TSismepVehiculos ve join TSismepAntenas an on ve.IdAntena=an.IdAntena where ve.Nombre='${arg1}'
    Should Be Equal    ${queryResults[0][0]}    ${Transmitiendo}
    Should Be Equal    ${queryResults[0][1]}    ${UltimoReporte}
    Should Be Equal    ${queryResults[0][2]}    ${EnPuerto}
    Should Be Equal    ${queryResults[0][3]}    ${TxIrregular}
    Should Be Equal    ${queryResults[0][4]}    ${BateriaRespaldo}
    Should Be Equal    ${queryResults[0][5]}    ${ZonaRestringida}
    Should Be Equal    ${queryResults[0][6]}    ${ZonaPescaProhibida}
    Should Be Equal    ${queryResults[0][7]}    ${OperacionRestringida}
    Should Be Equal    ${queryResults[0][8]}    ${OperacionPescaProhibida}
    Should Be Equal    ${queryResults[0][9]}    ${PermisoVencido}
    Should Be Equal    ${queryResults[0][10]}    ${Proximidad}
    Disconnect From Database

Obtener datos de la seccion Ubicacion de transmision - Default
    Click Element    xpath=//*[@id="titEmbarcacion"]
    Sleep    1s
    Click Element    xpath=//*[@id="titPermisionario"]
    Sleep    1s
    Click Element    xpath=//*[@id="titDatosTransmision"]
    Sleep    1s
    ${Latitud}=    Get Text    xpath=//*[@id="divLatitud"]
    ${Longitud}=    Get Text    xpath=//*[@id="divLongitud"]
    ${Velocidad}=    Get Text    xpath=//*[@id="divVelocidad"]
    ${Rumbo}=    Get Text    xpath=//*[@id="divRumbo"]
    ${EmbarcacionProxima}=    Get Text    xpath=//*[@id="divEnProximidad"]
    ${PuntoCercano}=    Get Text    xpath=//*[@id="divPuntoMasCercano"]
    ${DistanciaBase}=    Get Text    xpath=//*[@id="divDistanciaPuerto"]
    #${DistanciaBase}=    Convert to Number    ${DBase}
    Set Test Variable    ${Latitud}
    Set Test Variable    ${Longitud}
    Set Test Variable    ${Velocidad}
    Set Test Variable    ${Rumbo}
    Set Test Variable    ${EmbarcacionProxima}
    Set Test Variable    ${PuntoCercano}
    Set Test Variable    ${DistanciaBase}

Validar registros en BD - Seccion Ubicacion de transmision
    [Arguments]    ${Embarcacion}    ${Vel}=CONVERT(DECIMAL(5,2),(mf.Velocidad / 1.852))    ${etqVel}=Nudos
    Obtener datos de la seccion Ubicacion de transmision - Default
    Conexion a Base de datos
    #@{queryResults}=    Query    select mf.Latitud, mf.Longitud, ${Vel}, mf.Rumbo, vc.Nombre, pti.Descripcion, CONVERT(DECIMAL(5,2),(mf.DistanciaBase)) from Sismep.TSismepVehiculos v join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo join Sismep.TSismepVehiculos vc on mf.IdVehiculoProximo = vc.IdVehiculo join Sismep.TSismepPuntosInteres pti on mf.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}'
    #@{queryResults}=    Query    select mf.Latitud, mf.Longitud, ${Vel}, mf.Rumbo, vc.Nombre, pti.Descripcion, round(mf.DistanciaBase, 2) from Sismep.TSismepVehiculos v join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo join Sismep.TSismepVehiculos vc on mf.IdVehiculoProximo = vc.IdVehiculo join Sismep.TSismepPuntosInteres pti on mf.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}'
    @{queryResults}=    Query    select mf.Latitud, mf.Longitud, ${Vel}, mf.Rumbo, vc.Nombre, pti.Descripcion, CAST(mf.DistanciaBase AS DECIMAL(5, 2)) from Sismep.TSismepVehiculos v join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo join Sismep.TSismepVehiculos vc on mf.IdVehiculoProximo = vc.IdVehiculo join Sismep.TSismepPuntosInteres pti on mf.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}'
    ${LatitudBD}=    Execute Javascript    ${JSLatitudDMS} return LatitudDMS(${queryResults[0][0]});
    ${LongitudBD}=    Execute Javascript    ${JSLongitudDMS} return LongitudDMS(${queryResults[0][1]});
    ${VelocidadBD}=    Catenate    ${queryResults[0][2]} ${etqVel}
    ${RumboBD}=    Catenate    ${queryResults[0][3]}\u00B0
    Should Be Equal    ${LatitudBD}    ${Latitud}
    Should Be Equal    ${LongitudBD}    ${Longitud}
    Should Be Equal    ${VelocidadBD}    ${Velocidad}
    Should Be Equal    ${RumboBD}    ${Rumbo}
    Should Be Equal    ${queryResults[0][4]}    ${EmbarcacionProxima}
    Should Be Equal    ${queryResults[0][5]}    ${PuntoCercano}
    Should Be Equal    ${queryResults[0][6]}Mn    ${DistanciaBase}
    Disconnect From Database

Obtener datos de la seccion Ubicacion de transmision - Posicion decimal
    Click Element    xpath=//*[@id="titEmbarcacion"]
    Sleep    1s
    Click Element    xpath=//*[@id="titPermisionario"]
    Sleep    1s
    Click Element    xpath=//*[@id="titDatosTransmision"]
    Sleep    1s
    ${Lat}=    Get Text    xpath=//*[@id="divLatitud"]
    ${Latitud}=    Convert to Number    ${Lat}
    ${Lon}=    Get Text    xpath=//*[@id="divLongitud"]
    ${Longitud}=    Convert to Number    ${Lon}
    ${Velocidad}=    Get Text    xpath=//*[@id="divVelocidad"]
    ${Rumbo}=    Get Text    xpath=//*[@id="divRumbo"]
    ${EmbarcacionProxima}=    Get Text    xpath=//*[@id="divEnProximidad"]
    ${PuntoCercano}=    Get Text    xpath=//*[@id="divPuntoMasCercano"]
    ${DistanciaBase}=    Get Text    xpath=//*[@id="divDistanciaPuerto"]
    #${DistanciaBase}=    Convert to Number    ${DBase}
    Set Test Variable    ${Latitud}
    Set Test Variable    ${Longitud}
    Set Test Variable    ${Velocidad}
    Set Test Variable    ${Rumbo}
    Set Test Variable    ${EmbarcacionProxima}
    Set Test Variable    ${PuntoCercano}
    Set Test Variable    ${DistanciaBase}

Validar registros en BD - Seccion Ubicacion de transmision - Posicion decimal
    [Arguments]    ${Embarcacion}    ${Vel}=CONVERT(DECIMAL(5,2),(mf.Velocidad / 1.852))    ${etqVel}=Nudos
    Obtener datos de la seccion Ubicacion de transmision - Posicion decimal
    Conexion a Base de datos
    #@{queryResults}=    Query    select round(mf.Latitud, 7), round(mf.Longitud, 7), ${Vel}, mf.Rumbo, vc.Nombre, pti.Descripcion, CONVERT(DECIMAL(5,2),(mf.DistanciaBase)) from Sismep.TSismepVehiculos v join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo join Sismep.TSismepVehiculos vc on mf.IdVehiculoProximo = vc.IdVehiculo join Sismep.TSismepPuntosInteres pti on mf.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}'
    #@{queryResults}=    Query    select round(mf.Latitud, 7), round(mf.Longitud, 7), ${Vel}, mf.Rumbo, vc.Nombre, pti.Descripcion, round(mf.DistanciaBase, 2) from Sismep.TSismepVehiculos v join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo join Sismep.TSismepVehiculos vc on mf.IdVehiculoProximo = vc.IdVehiculo join Sismep.TSismepPuntosInteres pti on mf.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}'
    @{queryResults}=    Query    select round(mf.Latitud, 7), round(mf.Longitud, 7), ${Vel}, mf.Rumbo, vc.Nombre, pti.Descripcion, CAST(mf.DistanciaBase AS DECIMAL(5, 2)) from Sismep.TSismepVehiculos v join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo join Sismep.TSismepVehiculos vc on mf.IdVehiculoProximo = vc.IdVehiculo join Sismep.TSismepPuntosInteres pti on mf.IdPuntoInteresProximo = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}'
    ${VelocidadBD}=    Catenate    ${queryResults[0][2]} ${etqVel}
    ${RumboBD}=    Catenate    ${queryResults[0][3]}\u00B0
    Should Be Equal    ${queryResults[0][0]}    ${Latitud}
    Should Be Equal    ${queryResults[0][1]}    ${Longitud}
    Should Be Equal    ${VelocidadBD}    ${Velocidad}
    Should Be Equal    ${RumboBD}    ${Rumbo}
    Should Be Equal    ${queryResults[0][4]}    ${EmbarcacionProxima}
    Should Be Equal    ${queryResults[0][5]}    ${PuntoCercano}
    Should Be Equal    ${queryResults[0][6]}Mn    ${DistanciaBase}
    Disconnect From Database

Seleccionar opcion Seguimiento especial
    Wait Until Element Is Visible    //*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/ul/li[2]
    Click Element    //*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/ul/li[2]
    Sleep    1
    #Select Window    title=Sismep - Seguimiento Especial
    Switch Window    title=Sismep - Seguimiento Especial
    Maximize Browser Window
    Wait Until Element Is Visible    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[3]/div/img    timeout=15

Seguimiento especial - Validar etiquetas y tooltips
    ${ttZonas}=    Get Element Attribute    xpath=//*[@id="btnZonas"]    title
    ${ttNautica}=    Get Element Attribute    xpath=//*[@id="btnNautica"]    title
    ${ttDistancia}=    Get Element Attribute    xpath=//*[@id="btnDistancia"]    title
    ${ttConfiguracion}=    Get Element Attribute    xpath=//*[@id="btnConfiguracion"]/span    title
    Element Text Should Be    //*[@id="toolBarData"]/div/div[2]/div[1]    Nombre:
    Element Text Should Be    //*[@id="toolBarData"]/div/div[3]/div[1]    RNP:
    Element Text Should Be    //*[@id="toolBarData"]/div/div[4]/div[1]    Matricula:
    Should be equal    ${ttZonas}    Zonas
    Should be equal    ${ttNautica}    Nautica
    Should be equal    ${ttDistancia}    Distancia
    Should be equal    ${ttConfiguracion}    Configuraci\u00F3n

Seguimiento especial - Obtener datos de la Embarcacion
    ${Nombre}=    Get Text    xpath=//*[@id="toolBarData"]/div/div[2]/div[2]/span
    ${RNP}=    Get Text    xpath=//*[@id="toolBarData"]/div/div[3]/div[2]/span
    ${Matricula}=    Get Text    xpath=//*[@id="toolBarData"]/div/div[4]/div[2]/span
    Set Test Variable    ${Nombre}
    Set Test Variable    ${RNP}
    Set Test Variable    ${Matricula}

Seguimiento especial - Validar datos de Embarcacion en BD
    [Arguments]    ${arg1}
    Seguimiento especial - Obtener datos de la Embarcacion
    Conexion a Base de datos
    @{queryResults}=    Query    select Nombre, RNP, Matricula from Sismep.TSismepVehiculos where Nombre = '${arg1}'
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${RNP}
    Should Be Equal    ${queryResults[0][2]}    ${Matricula}
    Disconnect From Database

Seguimiento especial - Desplegar menu contextual de Embarcacion (clic izquierdo)
    Click Element    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[3]/div/img

Seguimiento especial - Validar etiquetas - Menu contextual (clic izquierdo)
    Wait Until Element Is Visible    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2    ${Embarcacion}[Nombre]
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[2]/td[1]/b    RNP:
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[3]/td[1]/b    Matr\u00EDcula:
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[4]/td[1]/b    Latitud:
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[5]/td[1]/b    Longitud:
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[6]/td[1]/b    Velocidad:
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[7]/td[1]/b    Rumbo:
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[8]/td[1]/b    Ultimo reporte:
    Element Text Should Be    //*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[9]/td[1]/b    Puerto base:

Seguimiento especial - Obtener datos de la Embarcacion - Contextual - Default
    Wait Until Element Is Visible     xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2
    ${Nombre}=    Get Text            xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2
    ${RNP}=    Get Text               xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[2]/td[2]
    ${Matricula}=    Get Text         xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[3]/td[2]
    ${Latitud}=    Get Text           xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[4]/td[2]
    ${Longitud}=    Get Text          xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[5]/td[2]
    ${Velocidad}=    Get Text         xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[6]/td[2]
    ${Rum}=    Get Text               xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[7]/td[2]
    ${Rumbo}=    Convert to Number    ${Rum}
    ${UltimoReporte}=    Get Text     xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[8]/td[2]
    ${PuertoBase}=    Get Text        xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[9]/td[2]
    Set Test Variable    ${Nombre}
    Set Test Variable    ${RNP}
    Set Test Variable    ${Matricula}
    Set Test Variable    ${Latitud}
    Set Test Variable    ${Longitud}
    Set Test Variable    ${Velocidad}
    Set Test Variable    ${Rumbo}
    Set Test Variable    ${UltimoReporte}
    Set Test Variable    ${PuertoBase}

Seguimiento especial - Validar datos de Embarcacion en BD - Contextual
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mf.Velocidad / 1.852))    ${etqVel}=Nudos
    Seguimiento especial - Obtener datos de la Embarcacion - Contextual - Default
    Conexion a Base de datos
    @{queryResults}=    Query    select v.Nombre, v.RNP, v.Matricula, mf.Latitud, mf.Longitud, ${Vel}, mf.Rumbo, FORMAT(DATEADD(HH, -${horasUTC}, mf.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), pti.Descripcion from Sismep.TSismepMensajesMFoto mf join Sismep.TSismepVehiculos v on mf.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]'
    ${LatitudBD}=    Execute Javascript    ${JSLatitudDMS} return LatitudDMS(${queryResults[0][3]});
    ${LongitudBD}=    Execute Javascript    ${JSLongitudDMS} return LongitudDMS(${queryResults[0][4]});
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} ${etqVel}
    #${RumboBD}=    Catenate    ${queryResults[0][6]}\u00B0 N
    ${UltimoRBD}=    Execute Javascript    cadena='${queryResults[0][7]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3 + ' horas';
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${RNP}
    Should Be Equal    ${queryResults[0][2]}    ${Matricula}
    Should Be Equal    ${LatitudBD}    ${Latitud}
    Should Be Equal    ${LongitudBD}    ${Longitud}
    Should Be Equal    ${VelocidadBD}    ${Velocidad}
    Should Be Equal    ${queryResults[0][6]}    ${Rumbo}
    Should Be Equal    ${UltimoRBD}    ${UltimoReporte}
    Should Be Equal    ${queryResults[0][8]}    ${PuertoBase}
    Disconnect From Database

Seguimiento especial - Obtener datos de la Embarcacion - Contextual - Decimal
    Wait Until Element Is Visible    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2
    ${Nombre}=    Get Text           xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[1]/td/h2
    ${RNP}=    Get Text              xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[2]/td[2]
    ${Matricula}=    Get Text        xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[3]/td[2]
    ${Lat}=    Get Text              xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[4]/td[2]
    ${Latitud}=    Convert to Number    ${Lat}
    ${Lon}=    Get Text              xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[5]/td[2]
    ${Longitud}=    Convert to Number    ${Lon}
    ${Velocidad}=    Get Text        xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[6]/td[2]
    ${Rum}=    Get Text              xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[7]/td[2]
    ${Rumbo}=    Convert to Number    ${Rum}
    ${UltimoReporte}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[8]/td[2]
    ${PuertoBase}=    Get Text       xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/table/tbody/tr[9]/td[2]
    Set Test Variable    ${Nombre}
    Set Test Variable    ${RNP}
    Set Test Variable    ${Matricula}
    Set Test Variable    ${Latitud}
    Set Test Variable    ${Longitud}
    Set Test Variable    ${Velocidad}
    Set Test Variable    ${Rumbo}
    Set Test Variable    ${UltimoReporte}
    Set Test Variable    ${PuertoBase}

Seguimiento especial - Validar datos de Embarcacion en BD - Contextual - Posicion Decimal
    [Arguments]    ${Vel}=CONVERT(DECIMAL(5,2),(mf.Velocidad / 1.852))    ${etqVel}=Nudos
    Seguimiento especial - Obtener datos de la Embarcacion - Contextual - Decimal
    Conexion a Base de datos
    @{queryResults}=    Query    select v.Nombre, v.RNP, v.Matricula, round(mf.Latitud, 7), round(mf.Longitud, 7), ${Vel}, mf.Rumbo, FORMAT(DATEADD(HH, -${horasUTC}, mf.FechaRecepcionUnitrac),'dd/MMMM/yyyy HH:mm', 'es-mx'), pti.Descripcion from Sismep.TSismepMensajesMFoto mf join Sismep.TSismepVehiculos v on mf.IdVehiculo = v.IdVehiculo join Sismep.TSismepPuntosInteres pti on v.IdPuntoInteres = pti.IdPuntoInteres where v.Nombre = '${Embarcacion}[Nombre]'
    ${VelocidadBD}=    Catenate    ${queryResults[0][5]} ${etqVel}
    #${RumboBD}=    Catenate    ${queryResults[0][6]}\u00B0 N
    ${UltimoRBD}=    Execute Javascript    cadena='${queryResults[0][7]}'; fechaparte1 = cadena.substr(0,3); fechaparte2 = cadena.substr(3).charAt(0).toUpperCase() + cadena.slice(4,6); fechaparte3 = cadena.substr(-11); return fecha = fechaparte1 + fechaparte2 + fechaparte3 + ' horas';
    Should Be Equal    ${queryResults[0][0]}    ${Nombre}
    Should Be Equal    ${queryResults[0][1]}    ${RNP}
    Should Be Equal    ${queryResults[0][2]}    ${Matricula}
    Should Be Equal    ${queryResults[0][3]}    ${Latitud}
    Should Be Equal    ${queryResults[0][4]}    ${Longitud}
    Should Be Equal    ${VelocidadBD}    ${Velocidad}
    Should Be Equal    ${queryResults[0][6]}    ${Rumbo}
    Should Be Equal    ${UltimoRBD}    ${UltimoReporte}
    Should Be Equal    ${queryResults[0][8]}    ${PuertoBase}
    Disconnect From Database

Seleccionar opcion Zonas
    Click Element    //*[@id="btnZonas"]

Validar zonas activadas
    ${atrZonas}=    Get Element Attribute    xpath=//*[@id="btnZonas"]    value
    Should be equal    ${atrZonas}    true

Seleccionar opcion Nautica
    Click Element    //*[@id="btnNautica"]

Validar nautica activada
    ${atrNautica}=    Get Element Attribute    xpath=//*[@id="btnNautica"]    value
    Should be equal    ${atrNautica}    true

Seleccionar opcion Distancia
    Wait Until Element Is Visible    //*[@id="btnDistancia"]
    Click Element    //*[@id="btnDistancia"]

Validar distancia activada
    [Arguments]    ${arg1}
    ${atrDistancia}=    Get Element Attribute    xpath=//*[@id="btnDistancia"]    value
    Should be equal    ${atrDistancia}    true
    Execute JavaScript    document.evaluate('//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[3]/div[2]/img',document.body,null,9,null).singleNodeValue.click();
    #Wait Until Element Is Visible    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div/div/div/div/div/h3
    #${etq}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[2]/div/div[4]/div[2]/div/div/div/div/div/div/h3
    Wait Until Element Is Visible    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[1]/div[2]/div[1]/span
    ${etq}=    Get Text    xpath=//*[@id="map-canvas"]/div/div/div[2]/div[1]/div[2]/div[1]/span
    Should Contain    ${etq}    ${arg1}

Zoom IN
    Execute JavaScript    map.setZoom(10);

Configurar posicion
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    //*[@id="btnConfiguracion"]/span
    Click Element    //*[@id="btnConfiguracion"]/span
    Wait Until Element Is Visible    xpath=//*[@id="btnConfiguracion"]/ul/li[1]
    Mouse Over    xpath=//*[@id="btnConfiguracion"]/ul/li[1]
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}
    Click Element    //*[@id="btnConfiguracion"]/span

Configurar Velocidad
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    //*[@id="btnConfiguracion"]/span
    Click Element    //*[@id="btnConfiguracion"]/span
    Wait Until Element Is Visible    xpath=//*[@id="btnConfiguracion"]/ul/li[2]
    Mouse Over    xpath=//*[@id="btnConfiguracion"]/ul/li[2]
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}
    Click Element    //*[@id="btnConfiguracion"]/span

Configurar Distancia
    [Arguments]    ${arg1}
    Wait Until Element Is Visible    //*[@id="btnConfiguracion"]/span
    Click Element    //*[@id="btnConfiguracion"]/span
    Wait Until Element Is Visible    xpath=//*[@id="btnConfiguracion"]/ul/li[3]
    Mouse Over    xpath=//*[@id="btnConfiguracion"]/ul/li[3]
    Wait Until Element Is Visible    ${arg1}
    Click Element    ${arg1}
    Click Element    //*[@id="btnConfiguracion"]/span

Seleccionar opcion Cambiar frecuencia del reporte de posicion
    Wait Until Element Is Visible    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/ul/li[3]/a/div/div[2]
    Click Element    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/ul/li[3]/a/div/div[2]

Cambiar frecuencia del reporte de posicion - Validar etiquetas
    Wait Until Element Is Visible    xpath=//*[@id="modalFrecuenciaTitulo"]
    Element Text Should Be    xpath=//*[@id="modalFrecuenciaTitulo"]    Módulo de Frecuencia
    Element Text Should Be    xpath=//*[@id="fgFrecuenciaNombre"]/label    Nombre:
    Element Text Should Be    xpath=//*[@id="modalFrecuencia"]/div/div/div[2]/div[5]/label    Nueva Frecuencia:
    Element Text Should Be    xpath=//*[@id="modalFrecuencia"]/div/div/div[2]/div[6]/label    Vigencia:
    Element Text Should Be    xpath=//*[@id="btnFrecuenciaAceptar"]/div/span    Enviar
    
Seleccionar Nueva Frecuencia
    Click Element    //*[@id="ddlFrecuenciaNueva"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[6]
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[6]
    
Presionar boton Enviar
    Click Element    xpath=//*[@id="btnFrecuenciaAceptar"]/div
    
Cambiar frecuencia del reporte de posicion - Limpiar campo Nombre
    Click Element    xpath=//*[@id="ddlFrecuenciaVehiculo"]/div[1]/div/div[2]/span

Cambiar frecuencia del reporte de posicion - Validar mensaje
    [Arguments]    ${msj}    ${div}=4
    Wait Until Element Is Visible    xpath=/html/body/div[${div}]/div/div/div[2]
    Element Text Should Be    xpath=/html/body/div[${div}]/div/div/div[2]    ${msj}

Seleccionar Vigencia fuera de rango
    Input Text    xpath=//*[@id="dpFrecuenciaVigencia"]/div[1]/div/div[1]/input    25-06-2020 16:51
    Press Keys    xpath=//*[@id="dpFrecuenciaVigencia"]/div[1]/div/div[1]/input    ENTER
        
Verificar Mensaje de Validacion Fuera de Rango
    [Arguments]    ${arg1}
    ${Msj}=    Get Element Attribute    xpath=//*[@id="dpFrecuenciaVigencia"]    textContent
    Should be equal    ${Msj}    ${arg1}
    
Cambiar frecuencia del reporte de posicion- Validar comando en BD
    Conexion a Base de Datos
    @{query1}    Query    select count(Nombre) from Sismep.TSismepVehiculos where Nombre = '${Embarcacion}[Nombre]'
    @{query2}    Query    select count(v.Nombre) from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena where v.Nombre = '${Embarcacion}[Nombre]' and c.IdTipoComando = '4C2BE91E-5B9C-4EE3-AC54-F515A65567A4' and c.FechaModificacion > DATEADD(mi,-1,GETDATE())
    Should be equal    ${query1[0][0]}    ${query2[0][0]}
    @{query3}    Query    select v.Nombre from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena where v.Nombre = '${Embarcacion}[Nombre]' and c.IdTipoComando = '4C2BE91E-5B9C-4EE3-AC54-F515A65567A4' and c.FechaModificacion > DATEADD(mi,-1,GETDATE())
    Should be equal    ${Embarcacion}[Nombre]    ${query3[0][0]}
    Disconnect From Database

Seleccionar opcion Solicitar posicion actual
    Wait Until Element Is Visible    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/ul/li[5]/a/div/div[2]
    Click Element    xpath=//*[@id="map"]/div/div/div[2]/div[2]/div/div[4]/div/div/div[2]/div/div/ul/li[5]/a/div/div[2]

Solicitar posicion actual - Validar etiquetas
    Wait Until Element Is Visible    xpath=//*[@id="modalPoleoTitulo"]
    Element Text Should Be    xpath=//*[@id="modalPoleoTitulo"]    Módulo de Poleo
    Element Text Should Be    xpath=//*[@id="fgPoleoNombre"]/label    Nombre:
    Element Text Should Be    xpath=//*[@id="btnPoleoAceptar"]/div/span    Enviar

Solicitar posicion actual - Presionar boton Enviar
    Click Element    xpath=//*[@id="btnPoleoAceptar"]/div

Solicitar posicion actual - Validar en BD
    Conexion a Base de Datos
    @{query1}    Query    select count(Nombre) from Sismep.TSismepVehiculos where Nombre = '${Embarcacion}[Nombre]'
    @{query2}    Query    select count(v.Nombre) from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena where v.Nombre = '${Embarcacion}[Nombre]' and c.IdTipoComando = 'D4108A90-4EDA-4BD4-AED4-3351BA31CC38' and c.FechaModificacion > DATEADD(mi,-1,GETDATE())
    Should be equal    ${query1[0][0]}    ${query2[0][0]}
    @{query3}    Query    select v.Nombre from Sismep.TSismepComandosP c join Sismep.TSismepAntenas a on c.IdAntena = a.IdAntena join Sismep.TSismepVehiculos v on a.IdAntena = v.IdAntena where v.Nombre = '${Embarcacion}[Nombre]' and c.IdTipoComando = 'D4108A90-4EDA-4BD4-AED4-3351BA31CC38' and c.FechaModificacion > DATEADD(mi,-1,GETDATE())
    Should be equal    ${Embarcacion}[Nombre]    ${query3[0][0]}
    Disconnect From Database

Solicitar posicion actual - Validar mensaje
    [Arguments]    ${msj}    ${div}=4
    Wait Until Element Is Visible    xpath=/html/body/div[${div}]/div/div/div[2]
    Element Text Should Be    xpath=/html/body/div[${div}]/div/div/div[2]    ${msj}

Solicitar posicion actual - Limpiar campo Nombre
    Click Element    xpath=//*[@id="ddlPoleoVehiculo"]/div[1]/div/div[2]/span/span