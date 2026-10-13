*** Settings ***
Resource    Recursos.Zonas.robot

*** Variables ***
&{zonaactiva}    descripcion=Agua    tipozona=INFORMATIVA
&{zonainactiva}    descripcion=Exclu    tipozona=ZONA RESTRINGIDA
${countDescripcion}    select count(z.Descripcion) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Descripcion like '%${zonaactiva}[descripcion]%' and z.Activo = 1
${selectDescripcion}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Descripcion like '%${zonaactiva}[descripcion]%' and z.Activo = 1
${countTipoZona}    select count(tz.Descripcion) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.Descripcion like '%${zonaactiva}[tipozona]%' and z.Activo = 1
${selectTipoZona}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.Descripcion like '%${zonaactiva}[tipozona]%' and z.Activo = 1 order by z.Descripcion
${countListaInclusionSI}    select count(z.Inclusion) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Inclusion = 1 and z.Activo = 1
${selectListaInclusionSI}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Inclusion = 1 and z.Activo = 1 order by z.Descripcion
${countListaInclusionNO}    select count(z.Inclusion) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Inclusion = 0 and z.Activo = 1
${selectListaInclusionNO}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Inclusion = 0 and z.Activo = 1 order by z.Descripcion
${countAlertaSI}    select count(tz.GeneraAlerta) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.GeneraAlerta = 1 and z.Activo = 1
${selectAlertaSI}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.GeneraAlerta = 1 and z.Activo = 1 order by z.Descripcion
${countAlertaNO}    select count(tz.GeneraAlerta) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.GeneraAlerta = 0 and z.Activo = 1
${selectAlertaNO}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.GeneraAlerta = 0 and z.Activo = 1 order by z.Descripcion
${countEstatus}    select count(z.Activo) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Activo = 1
${selectEstatus}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Activo = 1 order by z.Descripcion

${countDescripcion0}    select count(z.Descripcion) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Descripcion like '%${zonainactiva}[descripcion]%' and z.Activo = 0
${selectDescripcion0}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Descripcion like '%${zonainactiva}[descripcion]%' and z.Activo = 0 order by z.Descripcion
${countTipoZona0}    select count(tz.Descripcion) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.Descripcion like '%${zonainactiva}[tipozona]%' and z.Activo = 0
${selectTipoZona0}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.Descripcion like '%${zonainactiva}[tipozona]%' and z.Activo = 0 order by z.Descripcion
${countListaInclusionSI0}    select count(z.Inclusion) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Inclusion = 1 and z.Activo = 0
${selectListaInclusionSI0}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Inclusion = 1 and z.Activo = 0 order by z.Descripcion
${countListaInclusionNO0}    select count(z.Inclusion) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Inclusion = 0 and z.Activo = 0
${selectListaInclusionNO0}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Inclusion = 0 and z.Activo = 0 order by z.Descripcion
${countAlertaSI0}    select count(tz.GeneraAlerta) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.GeneraAlerta = 1 and z.Activo = 0
${selectAlertaSI0}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.GeneraAlerta = 1 and z.Activo = 0 order by z.Descripcion
${countAlertaNO0}    select count(tz.GeneraAlerta) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.GeneraAlerta = 0 and z.Activo = 0
${selectAlertaNO0}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.GeneraAlerta = 0 and z.Activo = 0 order by z.Descripcion
${countEstatus0}    select count(z.Activo) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Activo = 0
${selectEstatus0}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Activo = 0 order by z.Descripcion

${countDescripcionTodos}    select count(z.Descripcion) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Descripcion like '%${zonaactiva}[descripcion]%'
${selectDescripcionTodos}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Descripcion like '%${zonaactiva}[descripcion]%' order by z.Descripcion
${countTipoZonaTodos}    select count(tz.Descripcion) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.Descripcion like '%${zonaactiva}[tipozona]%'
${selectTipoZonaTodos}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.Descripcion like '%${zonaactiva}[tipozona]%' order by z.Descripcion
${countListaInclusionSITodos}    select count(z.Inclusion) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Inclusion = 1
${selectListaInclusionSITodos}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Inclusion = 1 order by z.Descripcion
${countListaInclusionNOTodos}    select count(z.Inclusion) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Inclusion = 0
${selectListaInclusionNOTodos}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where z.Inclusion = 0 order by z.Descripcion
${countAlertaSITodos}    select count(tz.GeneraAlerta) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.GeneraAlerta = 1
${selectAlertaSITodos}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.GeneraAlerta = 1 order by z.Descripcion
${countAlertaNOTodos}    select count(tz.GeneraAlerta) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.GeneraAlerta = 0
${selectAlertaNOTodos}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona where tz.GeneraAlerta = 0 order by z.Descripcion
${countEstatusTodos}    select count(z.Activo) from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona
${selectEstatusTodos}    select top 1 z.Descripcion, tz.Descripcion, z.Inclusion, tz.GeneraAlerta from Sismep.TSismepZonas z join Sismep.TSismepTiposZonas tz on z.IdTipoZona = tz.IdTipoZona order by z.Descripcion

${xpathGrid}    //*[@id="gridZonas"]/div/div[11]/div/div[1]

*** Test Cases ***
Grid - Validar etiquetas y tooltips
    [Documentation]    Valida las etiquetas en pantalla.
    [Tags]    Grid - Validar etiquetas y tooltips
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Validar etiquetas y tooltips
    [Teardown]    Close Browser
    
Filtro - Activo Descripcion
    [Documentation]    Valida la busqueda a traves del campo Descripcion con estatus Activo.
    [Tags]    Filtro - Activo Descripcion - T264
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    1    ${zonaactiva}[descripcion]
    Sleep    2
    Validar busqueda en base de datos    ${countDescripcion}    ${selectDescripcion}
    [Teardown]    Close Browser

Filtro - Activo Tipos de Zona
    [Documentation]    Valida la busqueda a traves del campo Tipos de Zona con estatus Activo.
    [Tags]    Filtro - Activo Tipos de Zona - T267
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por    2    ${zonaactiva}[tipozona]
    Sleep    2
    Validar busqueda en base de datos    ${countTipoZona}    ${selectTipoZona}
    [Teardown]    Close Browser
    
Filtro - Activo Lista de Inclusion SI
    [Documentation]    Valida la busqueda a traves del campo Lista Inclusion con estatus Activo.
    [Tags]    Filtro - Activo Lista de Inclusion SI - T266
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por Lista de Inclusion    2    #No. de elemento DIV
    Sleep    2
    Validar busqueda en base de datos    ${countListaInclusionSI}    ${selectListaInclusionSI}
    [Teardown]    Close Browser
    
Filtro - Activo Lista de Inclusion NO
    [Documentation]    Valida la busqueda a traves del campo Lista Inclusion con estatus Activo.
    [Tags]    Filtro - Activo Lista de Inclusion NO - T266
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por Lista de Inclusion    3    #No. de elemento DIV
    Sleep    2
    Validar busqueda en base de datos    ${countListaInclusionNO}    ${selectListaInclusionNO}
    [Teardown]    Close Browser
    
Filtro - Activo Alerta SI
    [Documentation]    Valida la busqueda a traves del campo Alerta con estatus Activo.
    [Tags]    Filtro - Activo Alerta SI 
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por Alerta    2    #No. de elemento DIV
    Sleep    2
    Validar busqueda en base de datos    ${countAlertaSI}    ${selectAlertaSI}
    [Teardown]    Close Browser
    
Filtro - Activo Alerta NO
    [Documentation]    Valida la busqueda a traves del campo Alerta con estatus Activo.
    [Tags]    Filtro - Activo Alerta NO
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por Alerta    3    #No. de elemento DIV
    Sleep    2
    Validar busqueda en base de datos    ${countAlertaNO}    ${selectAlertaNO}
    [Teardown]    Close Browser
    
Filtro - Activo Estatus
    [Documentation]    Valida la busqueda a traves del campo Estatus.
    [Tags]    Filtro - Activo Estatus - T265
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Sleep    2
    Validar busqueda en base de datos    ${countEstatus}    ${selectEstatus}
    [Teardown]    Close Browser
    
Filtro - Inactivo Descripcion
    [Documentation]    Valida la busqueda a traves del campo Descripcion con estatus Inactivo.
    [Tags]    Filtro - Inactivo Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    3    #No. de elemento DIV
    Filtrar por    1    ${zonainactiva}[descripcion]
    Sleep    2
    Validar busqueda en base de datos    ${countDescripcion0}    ${selectDescripcion0}
    [Teardown]    Close Browser

Filtro - Inactivo Tipos de Zona
    [Documentation]    Valida la busqueda a traves del campo Tipos de Zona con estatus Inactivo.
	[Tags]    Filtro - Inactivo Tipos de Zona
	Iniciar sesion
	Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    3    #No. de elemento DIV
    Filtrar por    2    ${zonainactiva}[tipozona]
    Sleep    2
    Validar busqueda en base de datos    ${countTipoZona0}    ${selectTipoZona0}
    [Teardown]    Close Browser
    
Filtro - Inactivo Lista de Inclusion SI
    [Documentation]    Valida la busqueda a traves del campo Lista Inclusion con estatus Inactivo.
	[Tags]    Filtro - Inactivo Lista de Inclusion SI
	Iniciar sesion
	Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    3    #No. de elemento DIV
    Sleep    1
    Filtrar por Lista de Inclusion    2    #No. de elemento DIV
    Sleep    1
    Validar busqueda en base de datos    ${countListaInclusionSI0}    ${selectListaInclusionSI0}
    [Teardown]    Close Browser
    
Filtro - Inactivo Lista de Inclusion NO
    [Documentation]    Valida la busqueda a traves del campo Lista Inclusion con estatus Inactivo.
	[Tags]    Filtro - Inactivo Lista de Inclusion NO
	Iniciar sesion
	Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    3    #No. de elemento DIV
    Sleep    1
    Filtrar por Lista de Inclusion    3    #No. de elemento DIV
    Sleep    1
    Validar busqueda en base de datos    ${countListaInclusionNO0}    ${selectListaInclusionNO0}
    [Teardown]    Close Browser
    
Filtro - Inactivo Alerta SI
    [Documentation]    Valida la busqueda a traves del campo Alerta con estatus Inactivo.
	[Tags]    Filtro - Inactivo Alerta SI
	Iniciar sesion
	Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    3    #No. de elemento DIV
    Sleep    1
    Filtrar por Alerta    2    #No. de elemento DIV
    Sleep    1
    Validar busqueda en base de datos    ${countAlertaSI0}    ${selectAlertaSI0}
    [Teardown]    Close Browser
    
Filtro - Inactivo Alerta NO
    [Documentation]    Valida la busqueda a traves del campo Alerta con estatus Inactivo.
	[Tags]    Filtro - Inactivo Alerta NO
	Iniciar sesion
	Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    3    #No. de elemento DIV
    Sleep    1
    Filtrar por Alerta    3    #No. de elemento DIV
    Sleep    1
    Validar busqueda en base de datos    ${countAlertaNO0}    ${selectAlertaNO0}
    [Teardown]    Close Browser
    
Filtro - Inactivo Estatus
    [Documentation]    Valida la busqueda a traves del campo Estatus.
	[Tags]    Filtro - Inactivo Estatus
	Iniciar sesion
	Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    3    #No. de elemento DIV
    Sleep    1
    Validar busqueda en base de datos    ${countEstatus0}    ${selectEstatus0}
    [Teardown]    Close Browser
    
Filtro - Todos Descripcion
    [Documentation]    Valida la busqueda a traves del campo Descripcion.
    [Tags]    Filtro - Todos Descripcion
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    1    #No. de elemento DIV
    Filtrar por    1    ${zonaactiva}[descripcion]
    Sleep    2
    Validar busqueda en base de datos    ${countDescripcionTodos}    ${selectDescripcionTodos}
    [Teardown]    Close Browser

Filtro - Todos Tipos de Zona
    [Documentation]    Valida la busqueda a traves del campo Tipos de Zona.
	[Tags]    Filtro - Todos Tipos de Zona
	Iniciar sesion
	Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    1    #No. de elemento DIV
    Filtrar por    2    ${zonaactiva}[tipozona]
    Sleep    2
    Validar busqueda en base de datos    ${countTipoZonaTodos}    ${selectTipoZonaTodos}
    [Teardown]    Close Browser
    
Filtro - Todos Lista de Inclusion SI
    [Documentation]    Valida la busqueda a traves del campo Lista Inclusion.
	[Tags]    Filtro - Todos Lista de Inclusion SI
	Iniciar sesion
	Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    1    #No. de elemento DIV
    Sleep    1
    Filtrar por Lista de Inclusion    2    #No. de elemento DIV
    Sleep    1
    Validar busqueda en base de datos    ${countListaInclusionSITodos}    ${selectListaInclusionSITodos}
    [Teardown]    Close Browser
    
Filtro - Todos Lista de Inclusion NO
    [Documentation]    Valida la busqueda a traves del campo Lista Inclusion.
	[Tags]    Filtro - Todos Lista de Inclusion NO
	Iniciar sesion
	Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    1    #No. de elemento DIV
    Sleep    1
    Filtrar por Lista de Inclusion    3    #No. de elemento DIV
    Sleep    1
    Validar busqueda en base de datos    ${countListaInclusionNOTodos}    ${selectListaInclusionNOTodos}
    [Teardown]    Close Browser
    
Filtro - Todos Alerta SI
    [Documentation]    Valida la busqueda a traves del campo Alerta.
	[Tags]    Filtro - Todos Alerta SI
	Iniciar sesion
	Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    1    #No. de elemento DIV
    Sleep    1
    Filtrar por Alerta    2    #No. de elemento DIV
    Sleep    1
    Validar busqueda en base de datos    ${countAlertaSITodos}    ${selectAlertaSITodos}
    [Teardown]    Close Browser
    
Filtro - Todos Alerta NO
    [Documentation]    Valida la busqueda a traves del campo Alerta.
	[Tags]    Filtro - Todos Alerta NO
	Iniciar sesion
	Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    1    #No. de elemento DIV
    Sleep    1
    Filtrar por Alerta    3    #No. de elemento DIV
    Sleep    1
    Validar busqueda en base de datos    ${countAlertaNOTodos}    ${selectAlertaNOTodos}
    [Teardown]    Close Browser
    
Filtro - Todos Estatus
    [Documentation]    Valida la busqueda a traves del campo Estatus.
	[Tags]    Filtro - Todos Estatus
	Iniciar sesion
	Sleep    1
    Ingresar a opcion Zona
    Filtrar por Estatus    1    #No. de elemento DIV
    Sleep    1
    Validar busqueda en base de datos    ${countEstatusTodos}    ${selectEstatusTodos}
    [Teardown]    Close Browser
    
*** Keywords ***
Filtrar por
    [Arguments]    ${arg1}    ${arg2}
    Wait Until Element Is Enabled    xpath=//*[@id="gridZonas"]/div/div[5]/div/table/tbody/tr[2]/td[1]/div/div[2]/div/div/div[1]/input
    Input Text    xpath=//*[@id="gridZonas"]/div/div[5]/div/table/tbody/tr[2]/td[${arg1}]/div/div[2]/div/div/div[1]/input    ${arg2}

Filtrar por Lista de Inclusion
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="gridZonas"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div/div[1]/div/div[2]/div[2]/div/div
    Click Element    xpath=//*[@id="gridZonas"]/div/div[5]/div/table/tbody/tr[2]/td[3]/div/div/div/div[1]/div/div[2]/div[2]/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]/div
    
Filtrar por Alerta
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="gridZonas"]/div/div[5]/div/table/tbody/tr[2]/td[4]/div/div/div/div[1]/div/div[2]/div[2]/div/div
    Click Element    xpath=//*[@id="gridZonas"]/div/div[5]/div/table/tbody/tr[2]/td[4]/div/div/div/div[1]/div/div[2]/div[2]/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]/div
    
Filtrar por Estatus
    [Arguments]    ${arg1}
    Wait Until Element Is Enabled    xpath=//*[@id="gridZonas"]/div/div[5]/div/table/tbody/tr[2]/td[5]/div/div/div/div[1]/div/div[2]/div[2]/div/div
    Click Element    xpath=//*[@id="gridZonas"]/div/div[5]/div/table/tbody/tr[2]/td[5]/div/div/div/div[1]/div/div[2]/div[2]/div/div
    Sleep    1
    Click Element    xpath=/html/body/div[3]/div/div/div/div[1]/div/div[1]/div[2]/div[${arg1}]/div
    
Validar busqueda en base de datos
    [Arguments]    ${arg1}    ${arg2}
    Obtener el numero de registros en el grid    ${xpathGrid}
    Conexion a Base de Datos
    @{queryRows}    Query    ${arg1}
    Should Be Equal    ${queryRows[0][0]}    ${noReg}
    @{queryResults}    Query    ${arg2}
    ${Descripcion}=    Get Text    xpath=//*[@id="gridZonas"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[1]
    ${TipodeZona}=    Get Text    xpath=//*[@id="gridZonas"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[2]
    Should Be Equal    ${queryResults[0][0]}    ${Descripcion}
    Should Be Equal    ${queryResults[0][1]}    ${TipodeZona}
    Disconnect From Database
    
Validar etiquetas y tooltips
    ${ttNR}=    Get Element Attribute    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div    tooltip
    ${ttVD}=    Get Element Attribute    xpath=//*[@id="gridZonas"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[6]/div    title
    Element Text Should Be    //*[@id="divContainer"]/div[1]/div[1]/div[1]/h4    Catálogo de Zonas
    Element Text Should Be    //*[@id="dx-col-18"]/div[2]    Descripción
    Element Text Should Be    //*[@id="dx-col-19"]/div[2]    Tipos de Zona
    Element Text Should Be    //*[@id="dx-col-20"]/div[3]    Lista Inclusión
    Element Text Should Be    //*[@id="dx-col-21"]/div[3]    Alerta
    Element Text Should Be    //*[@id="dx-col-22"]/div[3]    Estatus
    Element Text Should Be    //*[@id="gridZonas"]/div/div[5]/div/table/tbody/tr[1]/td[6]/div    Detalle
    Should be equal    ${ttNR}    Nuevo Registro
    Should be equal    ${ttVD}    Ver Detalle