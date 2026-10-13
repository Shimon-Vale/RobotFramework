*** Settings ***
Resource    ../../Recursos.Generales.robot
Resource    Recursos.Filtros.robot

*** Variables ***
${Golfo}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[2]/ul/li[1]/div[1]/div
${Pacifico}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[2]/ul/li[2]/div[1]/div

*** Test Cases ***
Litoral - Golfo - Validar datos en BD
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Litoral Golfo.
    [Tags]    Litoral - Golfo - Validar datos en BD - T357
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Sleep    1
    Filtrar por: ${Golfo}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Golfo
    [Teardown]    Close Browser

Litoral - Pacifico - Validar datos en BD
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Litoral Pacifico.
    [Tags]    Litoral - Pacifico - Validar datos en BD - T358
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Sleep    1
    Filtrar por: ${Pacifico}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Pacifico
    [Teardown]    Close Browser

*** Keywords ***
Validar en BD
    [Arguments]    ${arg1}
    Obtener el numero de registros en el grid
    Conexion a Base de Datos
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepVehiculos v join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo and v.Activo=1 join sismep.TSismepDetalle d on v.IdRegion = d.IdDetalle where d.DescripcionCorta = '${arg1}'
    Should be equal    ${queryRows[0][0]}    ${numemb}
    Disconnect From Database