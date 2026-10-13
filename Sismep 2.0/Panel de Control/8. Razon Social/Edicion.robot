*** Settings ***
Resource    Recursos.RazonSocial.robot

*** Variables ***
&{RSEditar}    Nombre=RFRazonSocialEditar    RNP=76543
&{RSExistente}    Nombre=ABEL TAPIA ESQUIVEL    RNP=2607003916
&{RSContactoEditar}    Nombre=RFEditarNombreCto    Direccion=RFEditarDireccionCto    Comentarios=RFEditarComentariosCto    Telefono=88190909090
${RSFiltro}    RFRazon

*** Test Cases ***
Editar - TAB Datos de Razon Social - Validar etiquetas
    [Documentation]    Debera mostrar correctamente escritas las etiquetas.
    [Tags]    Editar - TAB Datos de Razon Social - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Validar etiquetas
    [Teardown]    Close Browser
    
Editar - TAB Datos de Razon Social - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente los cambios en la Base de datos.
    [Tags]    Editar - TAB Datos de Razon Social - Validar opcion Guardar - T100
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Columna 1 y Campo ${RSFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del formulario    ${RSEditar}[Nombre]    ${RSEditar}[RNP]
    Sleep    1
    Presionar opcion Guardar
    Sleep    2
    Validar mensaje    Cambios guardados.
    Obtener datos del formulario
    Validar Razon Social en BD
    [Teardown]    Close Browser
    
Editar - TAB Datos de Razon Social - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de edicion y no guardar en la Base de datos.
    [Tags]    Editar - TAB Datos de Razon Social - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Columna 1 y Campo ${RSFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del formulario    ${RSEditar}[Nombre]    ${RSEditar}[RNP]
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Cancelar
    Sleep    2
    Validar Razon Social inexistente en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Editar - TAB Datos de Razon Social - Nombre duplicado
    [Documentation]    Debera mostrar una validacion indicando que el Nombre esta duplicado.
    [Tags]    Editar - TAB Datos de Razon Social - Nombre duplicado - T101
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Columna 1 y Campo ${RSFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del formulario Nombre duplicado    ${RSEditar}[RNP]
    Sleep    1
    Presionar opcion Guardar
    Obtener datos del formulario
    Sleep    2
    Validar mensaje    Nombre o RNP de Raz\u00F3n Social ya existe, favor de verificarlo.
    Validar Razon Social inexistente en BD
    [Teardown]    Close Browser
    
Editar - TAB Datos de Razon Social - RNP duplicado
    [Documentation]    Debera mostrar una validacion indicando que el RNP esta duplicado.
    [Tags]    Editar - TAB Datos de Razon Social - RNP duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Columna 1 y Campo ${RSFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Editar datos del formulario RNP duplicado    ${RSEditar}[Nombre]
    Sleep    1
    Presionar opcion Guardar
    Obtener datos del formulario
    Sleep    2
    Validar mensaje    Nombre o RNP de Raz\u00F3n Social ya existe, favor de verificarlo.
    Validar Razon Social inexistente en BD
    [Teardown]    Close Browser
    
Editar - TAB Datos de Razon Social - Mostrar validacion de campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Editar - TAB Datos de Razon Social - Mostrar validacion de campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Columna 1 y Campo ${RSFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Dejar vacio los campos Nombre y RNP Titular
    Presionar opcion Guardar
    Sleep    1
    Mostrar campos obligatorios
    [Teardown]    Close Browser
    
Editar - TAB Datos de Razon Social - Validar opcion Eliminar
    [Documentation]    Debera inactivar la razon social correctamente.
    [Tags]    Editar - TAB Datos de Razon Social - Validar opcion Eliminar - T105
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Columna 1 y Campo ${RSFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Eliminar
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar Razon Social en BD    0
    [Teardown]    Close Browser
    
Editar - TAB Datos de Razon Social - Validar opcion Reactivar
    [Documentation]    Debera reactivar correctamente la razon social correctamente.
    [Tags]    Editar - TAB Datos de Razon Social - Validar opcion Reactivar - T104
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Filtrar por Estatus    ${Inactivo}
    Filtrar por Columna 1 y Campo ${RSFiltro}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Reactivar
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar Razon Social en BD
    [Teardown]    Close Browser
    
Editar - TAB Contactos - Validar etiquetas
    [Documentation]    Debera mostrar correctamente escritas las etiquetas.
    [Tags]    Editar - TAB Contactos - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Ingresar a opcion Contactos
    Validar etiquetas TAB Contactos
    [Teardown]    Close Browser
    
Editar - TAB Contactos - Validar opcion Guardar
    [Documentation]    Debera editar correctamente el contacto y guardarlo en la Base de datos.
    [Tags]    Editar - TAB Contactos - Validar opcion Guardar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Obtener Razon Social con Contacto
    Filtrar por Columna 1 y Campo ${RSNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario
    Ingresar a opcion Contactos
    Sleep    1
    Presionar opcion Detalle de contacto
    Editar datos del contacto    ${RSContactoEditar}[Nombre]    ${RSContactoEditar}[Direccion]    ${RSContactoEditar}[Comentarios]
    Presionar opcion Guardar Contacto
    Sleep    2
    Obtener datos del Grid Contacto
    Validar contacto en BD
    [Teardown]    Close Browser
    
Editar - TAB Contactos - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de edicion de contactos y no guardar en la BD.
    [Tags]    Editar - TAB Contactos - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Obtener Razon Social con Contacto
    Filtrar por Columna 1 y Campo ${RSNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario
    Ingresar a opcion Contactos
    Sleep    1
    Presionar opcion Detalle de contacto
    Editar datos del contacto    ${RSContactoEditar}[Nombre]    ${RSContactoEditar}[Direccion]    ${RSContactoEditar}[Comentarios]
    Presionar opcion Cancelar Contacto
    Validar campos vacios
    [Teardown]    Close Browser
    
Editar - TAB Contactos - Agregar Telefono
    [Documentation]    Debera agregar correctamente un telefono y guardar en la Base de Datos.
    [Tags]    Editar - TAB Contactos - Agregar Telefono
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Obtener Razon Social con Contacto
    Filtrar por Columna 1 y Campo ${RSNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario
    Ingresar a opcion Contactos
    Sleep    1
    Obtener datos del Grid Contacto
    Presionar opcion Detalle de contacto
    Sleep    1
    Capturar telefono    ${RSContactoEditar}[Telefono]
    Presionar opcion Agregar Telefono
    Sleep    2
    Obtener datos del Grid Telefono
    Validar telefono en BD
    [Teardown]    Close Browser
    
Editar - TAB Contactos - Eliminar Telefono
    [Documentation]    Debera eliminar correctamente el telefono.
    [Tags]    Editar - TAB Contactos - Eliminar Telefono
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Obtener Razon Social con Contacto y Telefono
    Filtrar por Columna 1 y Campo ${RSNombre}
    Sleep    1
    Ingresar al detalle del registro No. 1 en el grid
    Sleep    1
    Obtener datos del formulario
    Ingresar a opcion Contactos
    Sleep    1
    Obtener datos del Grid Contacto
    Presionar opcion Detalle de contacto
    Sleep    1
    Obtener datos del Grid Telefono
    Presionar opcion Eliminar Telefono
    Sleep    1
    Confirmar accion
    Sleep    1
    Validar telefono eliminado en BD
    [Teardown]    Close Browser
    
*** Keywords ***
Ingresar al detalle del registro No. ${arg1} en el grid
    Click Element    xpath=//*[@id="dataGrid"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[${arg1}]/td[7]/div
    Wait Until Page Contains Element    xpath=//*[@id="btnEliminar"]
    
Editar datos del formulario
    [Arguments]    ${arg1}    ${arg2}
    Validar campo unico Nombre    ${arg1}
    Validar campo unico RNP    ${arg2}
    Sleep    0.5
    Input Text    xpath=//*[@id="txtNombre"]/div/div[1]/input     ${NombreUnico}
    Input Text    xpath=//*[@id="txtRnpTitular"]/div/div[1]/input    ${RNPUnico}
    Sleep    0.5
    Seleccionar Estado
    Sleep    0.5
    Seleccionar Municipio
    Sleep    0.5
    Seleccionar Localidad
    
Editar datos del formulario Nombre duplicado
    [Arguments]    ${arg1}
    Validar campo unico RNP    ${arg1}
    Sleep    0.5
    Input Text    xpath=//*[@id="txtNombre"]/div/div[1]/input    ${RSExistente}[Nombre]
    Input Text    xpath=//*[@id="txtRnpTitular"]/div/div[1]/input    ${RNPUnico}
    Sleep    0.5
    Seleccionar Estado
    Sleep    0.5
    Seleccionar Municipio
    Sleep    0.5
    Seleccionar Localidad
    
Editar datos del formulario RNP duplicado
    [Arguments]    ${arg1}
    Validar campo unico Nombre    ${arg1}
    Sleep    0.5
    Input Text    xpath=//*[@id="txtNombre"]/div/div[1]/input     ${NombreUnico}
    Input Text    xpath=//*[@id="txtRnpTitular"]/div/div[1]/input    ${RSExistente}[RNP]
    Sleep    0.5
    Seleccionar Estado
    Sleep    0.5
    Seleccionar Municipio
    Sleep    0.5
    Seleccionar Localidad
        
Seleccionar Estado
    Click Element    xpath=//*[@id="cboEstado"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    #Sleep    0.5
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[3]
    
Seleccionar Municipio
    Click Element    xpath=//*[@id="cboMunicipio"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    #Sleep    0.5
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[12]
    
Seleccionar Localidad
    Click Element    xpath=//*[@id="cboLocalidad"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    #Sleep    0.5
    Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    
Dejar vacio los campos Nombre y RNP Titular
    Clear Element Text    xpath=//*[@id="txtNombre"]/div/div[1]/input
    Clear Element Text    xpath=//*[@id="txtRnpTitular"]/div/div[1]/input
    
Obtener Razon Social con Contacto
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 rs.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepRazonSocialContactos rsc on rs.IdRazonSocial = rsc.IdRazonSocial where rs.Descripcion like '%${RSFiltro}%' order by NEWID()
    Set Test Variable    ${RSNombre}    ${queryResults[0][0]}
    Disconnect From Database
    
Obtener Razon Social con Contacto y Telefono
    Conexion a Base de Datos
    @{queryResults}    Query    select top 1 rs.Descripcion from Sismep.TSismepRazonSocial rs join Sismep.TSismepRazonSocialContactos rsc on rs.IdRazonSocial = rsc.IdRazonSocial join Sismep.TSismepRazonSocialReferencias rsr on rsc.IdRazonSocialContacto = rsr.IdRazonSocialContacto where rs.Descripcion like '%${RSFiltro}%' order by NEWID()
    Set Test Variable    ${RSNombre}    ${queryResults[0][0]}
    Disconnect From Database
    
Mostrar campos obligatorios
    ${attrNombre}=    Get Element Attribute    xpath=//*[@id="txtNombre"]    textContent
    ${attrRNP}    Get Element Attribute    xpath=//*[@id="txtRnpTitular"]    textContent
    Should be equal    ${attrNombre}    Obligatorio
    Should be equal    ${attrRNP}    Obligatorio
    
Editar datos del contacto
    [Arguments]    ${arg1}    ${arg2}    ${arg3}
    Input Text    xpath=//*[@id="txtNombreContacto"]/div/div[1]/input    ${arg1}
    Input Text    xpath=//*[@id="txtDireccion"]/div/div[1]/input    ${arg2}
    Input Text    xpath=//*[@id="txtComentarios"]/div/div[1]/textarea    ${arg3}
    
Validar etiquetas
    ${Titulo}=    Get text    xpath:/html/body/div[3]/div/div[1]/div/div[1]/div/div/div
    ${TabRS}=    Get text    xpath://*[@id="tabRazonSocial"]
    ${Estatus}=    Get text    xpath://*[@id="razonSocial"]/div/div[1]/div[1]
    ${Nombre}=    Get text    xpath://*[@id="razonSocial"]/div/div[2]/div[1]
    ${RNPTitular}=    Get text    xpath://*[@id="razonSocial"]/div/div[3]/div[1]
    ${Estado}=    Get text    xpath://*[@id="razonSocial"]/div/div[1]/div[3]
    ${Municipio}=    Get text    xpath://*[@id="razonSocial"]/div/div[2]/div[3]
    ${Localidad}=    Get text    xpath://*[@id="razonSocial"]/div/div[3]/div[3]
    Should Be Equal As Strings    ${Titulo}    Editar Raz\u00F3n Social
    Should Be Equal As Strings    ${TabRS}    Datos de Raz\u00F3n Social
    Should Be Equal As Strings    ${Estatus}    Estatus:
    Should Be Equal As Strings    ${Nombre}    Nombre:
    Should Be Equal As Strings    ${RNPTitular}    RNP Titular:
    Should Be Equal As Strings    ${Estado}    Estado:
    Should Be Equal As Strings    ${Municipio}    Municipio:
    Should Be Equal As Strings    ${Localidad}    Localidad:
    
Validar etiquetas TAB Contactos
    Element Text Should Be    xpath=//*[@id="tabContactos"]    Contactos
    Element Text Should Be    xpath=//*[@id="contactos"]/div/div[1]/div[1]/h6    Datos de contacto:
    Element Text Should Be    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[1]/div[1]     Nombre: 
    Element Text Should Be    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[2]/div[1]     Direcci\u00F3n: 
    Element Text Should Be    xpath=//*[@id="contactos"]/div/div[1]/div[1]/div[3]/div[1]     Comentarios: 
    Element Text Should Be    xpath=//*[@id="contactos"]/div/div[1]/div[2]/div[1]/div[1]    Tel\u00E9fono:
    #Element Text Should Be    xpath=//*[@id="dx-col-23"]/div[2]    Nombre
    #Element Text Should Be    xpath=//*[@id="dx-col-24"]/div[2]    Direcci\u00F3n
    #Element Text Should Be    xpath=//*[@id="dx-col-25"]/div[3]    Estatus
    #Element Text Should Be    xpath=//*[@id="gridContactos"]/div/div[5]/div/table/tbody/tr[1]/td[4]/div    Detalle