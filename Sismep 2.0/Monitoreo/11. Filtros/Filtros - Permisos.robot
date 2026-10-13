*** Settings ***
Resource    ../../Recursos.Generales.robot
Resource    Recursos.Filtros.robot

*** Variables ***
${Anchoveta}      xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[1]/div[1]/div
${Calamar}        xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[2]/div[1]/div
${Calamar2}       xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[3]/div[1]/div
${CamarondeAltamar}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[4]/div[1]/div
${CamarondeAltamar2}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[5]/div[1]/div
${CamaronAltamarMenores}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[6]/div[1]/div
${Cangrejo}       xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[7]/div[1]/div
${EscamaMarina}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[8]/div[1]/div
${EscamaMarina2}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[9]/div[1]/div
${EscamaMarinaMenores}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[10]/div[1]/div
${Fomento}        xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[11]/div[1]/div
${Fomento2}       xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[12]/div[1]/div
${Jaiba}          xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[13]/div[1]/div
${JaibaMenores}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[14]/div[1]/div
${Langosta}       xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[15]/div[1]/div
${Merluza}        xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[16]/div[1]/div
${OstionMenores}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[17]/div[1]/div
${PelagicosMenores}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[18]/div[1]/div
${PezEspada}      xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[19]/div[1]/div
${Pulpo}          xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[20]/div[1]/div
${Sardina}        xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[21]/div[1]/div
${Tiburon}        xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[22]/div[1]/div
${TiburonMenores}    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[23]/div[1]/div
${Tunidos}        xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[24]/div[1]/div
${Tunidos2}       xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[25]/div[1]/div
${Tunidos3}       xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[26]/div[1]/div
${Tunidos4}       xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[27]/div[1]/div

*** Test Cases ***
Permisos - Anchoveta
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Anchoveta.
    [Tags]    Permisos - Anchoveta
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Filtrar por: ${Anchoveta}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    ANCHOVETA
    [Teardown]    Close Browser

Permisos - Calamar
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Calamar.
    [Tags]    Permisos - Calamar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Filtrar por: ${Calamar}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    CALAMAR
    [Teardown]    Close Browser

Permisos - Calamar 2
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Calamar 2.
    [Tags]    Permisos - Calamar 2
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Filtrar por: ${Calamar2}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    CALAMAR 2
    [Teardown]    Close Browser

Permisos - Camaron de Altamar
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Camaron de Altamar.
    [Tags]    Permisos - Camaron de Altamar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Filtrar por: ${CamarondeAltamar}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    CAMARON DE ALTAMAR
    [Teardown]    Close Browser
    
Permisos - Camaron de Altamar 2
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Camaron de Altamar 2.
    [Tags]    Permisos - Camaron de Altamar 2
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Filtrar por: ${CamarondeAltamar2}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    CAMARON DE ALTAMAR 2
    [Teardown]    Close Browser

Permisos - Camaron de Altamar Menores
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Altamar Menores.
    [Tags]    Permisos - Camaron de Altamar Menores
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Filtrar por: ${CamaronAltamarMenores}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    CAMARON DE ALTAMAR MENORES
    [Teardown]    Close Browser

Permisos - Cangrejo
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Cangrejo.
    [Tags]    Permisos - Cangrejo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Filtrar por: ${Cangrejo}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    CANGREJO
    [Teardown]    Close Browser

Permisos - Escama Marina
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Escama Marina.
    [Tags]    Permisos - Escama Marina
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Filtrar por: ${EscamaMarina}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    ESCAMA MARINA
    [Teardown]    Close Browser

Permisos - Escama Marina 2
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Escama Marina 2.
    [Tags]    Permisos - Escama Marina 2
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Filtrar por: ${EscamaMarina2}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    ESCAMA MARINA 2
    [Teardown]    Close Browser

Permisos - Escama Marina Menores
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Escama Marina Menores.
    [Tags]    Permisos - Escama Marina Menores
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Filtrar por: ${EscamaMarinaMenores}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    ESCAMA MARINA MENORES
    [Teardown]    Close Browser

Permisos - Fomento
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Fomento.
    [Tags]    Permisos - Fomento
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Filtrar por: ${Fomento}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    FOMENTO
    [Teardown]    Close Browser

Permisos - Fomento 2
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Fomento 2.
    [Tags]    Permisos - Fomento 2
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Filtrar por: ${Fomento2}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    FOMENTO 2
    [Teardown]    Close Browser

Permisos - Jaiba
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Jaiba.
    [Tags]    Permisos - Jaiba
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Filtrar por: ${Jaiba}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    JAIBA
    [Teardown]    Close Browser

Permisos - Jaiba Menores
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Jaiba Menores.
    [Tags]    Permisos - Jaiba Menores
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Deslizar scroll
    Filtrar por: ${JaibaMenores}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    JAIBA MENORES
    [Teardown]    Close Browser

Permisos - Langosta
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Langosta.
    [Tags]    Permisos - Langosta
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Deslizar scroll
    Filtrar por: ${Langosta}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    LANGOSTA
    [Teardown]    Close Browser

Permisos - Merluza
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Merluza.
    [Tags]    Permisos - Merluza
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Deslizar scroll
    Filtrar por: ${Merluza}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    MERLUZA
    [Teardown]    Close Browser
    
Permisos - Ostion Menores
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Ostion Menores.
    [Tags]    Permisos - Ostion Menores
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Deslizar scroll
    Filtrar por: ${OstionMenores}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    OSTION MENORES
    [Teardown]    Close Browser

Permisos - Pelagicos Menores
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Pelagicos Menores.
    [Tags]    Permisos - Pelagicos Menores
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Deslizar scroll
    Filtrar por: ${PelagicosMenores}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    PELAGICOS MENORES
    [Teardown]    Close Browser

Permisos - Pez Espada
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Pez Espada.
    [Tags]    Permisos - Pez Espada
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Deslizar scroll
    Filtrar por: ${PezEspada}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    PEZ ESPADA
    [Teardown]    Close Browser

Permisos - Pulpo
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Pulpo.
    [Tags]    Permisos - Pulpo
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Deslizar scroll
    Filtrar por: ${Pulpo}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    PULPO
    [Teardown]    Close Browser

Permisos - Sardina
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Sardina.
    [Tags]    Permisos - Sardina
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Deslizar scroll
    Filtrar por: ${Sardina}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    SARDINA
    [Teardown]    Close Browser

Permisos - Tiburon
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Tiburon.
    [Tags]    Permisos - Tiburon
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Deslizar scroll
    Filtrar por: ${Tiburon}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    TIBURON
    [Teardown]    Close Browser

Permisos - Tiburon Menores
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Tiburon Menores.
    [Tags]    Permisos - Tiburon Menores
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Deslizar scroll
    Filtrar por: ${TiburonMenores}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    TIBURON MENORES
    [Teardown]    Close Browser

Permisos - Tunidos
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Tunidos.
    [Tags]    Permisos - Tunidos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Deslizar scroll
    Filtrar por: ${Tunidos}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    TUNIDOS
    [Teardown]    Close Browser

Permisos - Tunidos 2
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Tunidos 2.
    [Tags]    Permisos - Tunidos 2
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Deslizar scroll
    Filtrar por: ${Tunidos2}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    TUNIDOS 2
    [Teardown]    Close Browser

Permisos - Tunidos 3
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Tunidos 3.
    [Tags]    Permisos - Tunidos 3
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Deslizar scroll
    Filtrar por: ${Tunidos3}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    TUNIDOS 3
    [Teardown]    Close Browser

Permisos - Tunidos 4
    [Documentation]    Debera realizar el filtro correctamente 
        ...    por el Permisos Tunidos 4.
    [Tags]    Permisos - Tunidos 4
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Monitoreo
    Presionar opcion Filtros
    Desplegar la opcion Permisos
    Sleep    1
    Deslizar scroll
    Filtrar por: ${Tunidos4}
    Presionar boton Filtrar
    Sleep    5
    Validar en BD    TUNIDOS 4
    [Teardown]    Close Browser

*** Keywords ***
Desplegar la opcion Permisos
    Desplegar opcion Litoral
    Sleep    1
    Desplegar opcion Permisos

Validar en BD
    [Arguments]    ${arg1}
    Obtener el numero de registros en el grid
    Conexion a Base de Datos
    #@{queryRows}    Query    select count(v.Nombre) from Sismep.TSismepVehiculos v join Sismep.TSismepVehiculosPermisos vp on v.IdVehiculo=vp.IdVehiculo AND v.Activo=1 join Sismep.TSismepTiposCarga tc on vp.IdTipoCarga = tc.IdTipoCarga join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo AND vp.Activo=1 where tc.Descripcion = '${arg1}'
    @{queryRows}    Query    select count(distinct(v.IdVehiculo)) from Sismep.TSismepVehiculos v join Sismep.TSismepVehiculosPermisos vp on v.IdVehiculo=vp.IdVehiculo AND v.Activo=1 join Sismep.TSismepTiposCarga tc on vp.IdTipoCarga = tc.IdTipoCarga join Sismep.TSismepMensajesMFoto mf on v.IdVehiculo = mf.IdVehiculo AND vp.Activo=1 where tc.Descripcion = '${arg1}'
    Should be equal    ${queryRows[0][0]}    ${numemb}
    Disconnect From Database
    
Deslizar scroll
    Execute JavaScript    window.document.evaluate('/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[13]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/nav[2]/div[2]/div/div/div/div[1]/ul/li[4]/ul/li[13]
    
