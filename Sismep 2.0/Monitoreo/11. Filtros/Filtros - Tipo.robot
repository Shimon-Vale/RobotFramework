*** Settings ***
Resource    ../../Recursos.Generales.robot
Resource    Recursos.Filtros.robot

*** Variables ***
${Barco}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[6]/ul/li[1]/div[1]/div
${Panga}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[6]/ul/li[2]/div[1]/div

*** Test Cases ***
Tipo - Barco
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Tipo Barco.
    [Tags]    Tipo - Barco - T365
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Tipo
    Sleep    1
    Filtrar por: ${Barco}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Barco
    [Teardown]    Close Browser

Tipo - Panga
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Tipo Panga.
    [Tags]    Tipo - Panga - T366
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Tipo
    Sleep    1
    Filtrar por: ${Panga}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Panga
    [Teardown]    Close Browser

*** Keywords ***
Validar en BD
    [Arguments]    ${arg1}
    Obtener el numero de registros en el grid
    Conexion a Base de Datos
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepVehiculos v join Sismep.TSismepMensajesMFoto mmf on v.IdVehiculo = mmf.IdVehiculo AND v.Activo=1 where v.Texto5='${arg1}'
    Should be equal    ${queryRows[0][0]}    ${numemb}
    Disconnect From Database
