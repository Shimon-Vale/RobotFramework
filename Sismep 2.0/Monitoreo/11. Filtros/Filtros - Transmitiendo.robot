*** Settings ***
Resource    ../../Recursos.Generales.robot
Resource    Recursos.Filtros.robot

*** Variables ***
${NO}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[5]/ul/li[1]/div[1]/div
${SI}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[5]/ul/li[2]/div[1]/div

*** Test Cases ***
Transmitiendo - No - Validar datos en BD
    [Documentation]    Debera realizar el filtro correctamente por Transmitiendo NO.    
        ...    Pendiente agregar la consulta para validacion en BD
    [Tags]    Transmitiendo - No - Validar datos en BD - T362
    Iniciar sesion
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Transmitiendo
    Sleep    1
    Filtrar por: ${NO}
    Presionar boton Filtrar
    Sleep    5
    #Validar en BD
    [Teardown]    Close Browser

Transmitiendo - Si - Validar datos en BD
    [Documentation]    Debera realizar el filtro correctamente por Transmitiendo SI.      
        ...    Pendiente agregar la consulta para validacion en BD
    [Tags]    Transmitiendo - Si - Validar datos en BD - T361
    Iniciar sesion
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Transmitiendo
    Sleep    1
    Filtrar por: ${SI}
    Presionar boton Filtrar
    Sleep    5
    #Validar en BD
    [Teardown]    Close Browser
    
*** Keywords ***
Validar en BD
    Obtener el numero de registros en el grid
    Conexion a Base de Datos
    @{queryRows}    Query    #select count(v.Nombre) from Sismep.TSismepVehiculos v join Sismep.TSismepMensajesMFoto mmf on v.IdVehiculo = mmf.IdVehiculo AND v.Activo=1 where v.Texto5='${arg1}'
    Should be equal    ${queryRows[0][0]}    ${numemb}
    Disconnect From Database
