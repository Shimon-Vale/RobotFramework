*** Settings ***
Resource    ../../Recursos.Generales.robot
Resource    Recursos.Filtros.robot

*** Variables ***
${BasesMarinas}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[1]/div[1]/div
${Control}        xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[2]/div[1]/div
${Cuba}           xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[3]/div[1]/div
${CargaInicial}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[4]/div[1]/div
${DGIV}           xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[5]/div[1]/div
${GolfodeMexico}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[6]/div[1]/div
${Nuevos}         xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[7]/div[1]/div
${Pacifico}       xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[8]/div[1]/div
${PescaDidactica}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[3]/ul/li[9]/div[1]/div

*** Test Cases ***
Grupos - Bases Marinas
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Grupo Bases Marinas.
    [Tags]    Grupos - Bases Marinas - T359
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Grupos
    Sleep    1
    Filtrar por: ${BasesMarinas}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    BASES MARINAS
    [Teardown]    Close Browser

Grupos - Control
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Grupo Control.
    [Tags]    Grupos - Control
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Grupos
    Sleep    1
    Filtrar por: ${Control}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    CONTROL
    [Teardown]    Close Browser

Grupos - Cuba
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Grupo Cuba.
    [Tags]    Grupos - Cuba
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Grupos
    Sleep    1
    Filtrar por: ${Cuba}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    CUBA
    [Teardown]    Close Browser

Grupos - Carga Inicial
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Grupo Carga Inicial.
    [Tags]    Grupos - Carga Inicial
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Grupos
    Sleep    1
    Filtrar por: ${CargaInicial}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    Carga Inicial
    [Teardown]    Close Browser

Grupos - DGIV
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Grupo DGIV.
    [Tags]    Grupos - DGIV
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Grupos
    Sleep    1
    Filtrar por: ${DGIV}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    DGIV
    [Teardown]    Close Browser

Grupos - Golfo de Mexico
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Grupo Golfo de Mexico.
    [Tags]    Grupos - Golfo de Mexico
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Grupos
    Sleep    1
    Filtrar por: ${GolfodeMexico}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    GOLFO DE MEXICO
    [Teardown]    Close Browser

Grupos - Nuevos
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Grupo Nuevos.
    [Tags]    Grupos - Nuevos - T360
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Grupos
    Sleep    1
    Filtrar por: ${Nuevos}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    NUEVOS
    [Teardown]    Close Browser

Grupos - Pacifico
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Grupo Pacifico.
    [Tags]    Grupos - Pacifico
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Grupos
    Sleep    1
    Filtrar por: ${Pacifico}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    PACIFICO
    [Teardown]    Close Browser

Grupos - Pesca Didactica
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Grupo Pesca Didactica.
    [Tags]    Grupos - Pesca Didactica
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar opcion Grupos
    Sleep    1
    Filtrar por: ${PescaDidactica}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    PESCA DIDACTICA
    [Teardown]    Close Browser

*** Keywords ***
Validar en BD
    [Arguments]    ${arg1}
    Obtener el numero de registros en el grid
    Conexion a Base de Datos
    @{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepVehiculos v join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo and v.Activo=1 join Sismep.TSismepVehiculosGrupos vg on v.IdVehiculo = vg.IdVehiculo join Sismep.TSismepDetalle d on vg.IdGrupo = d.IdDetalle where d.DescripcionCorta = '${arg1}'
    Should be equal    ${queryRows[0][0]}    ${numemb}
    Disconnect From Database
