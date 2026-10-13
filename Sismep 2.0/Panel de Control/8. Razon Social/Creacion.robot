*** Settings ***
Resource    Recursos.RazonSocial.robot

*** Variables ***
&{RSCrear}    Nombre=RFRazonSocial    RNP=34567
&{RSExistente}    Nombre=ABEL TAPIA ESQUIVEL    RNP=2607003916
&{RSContactoCrear}    Nombre=RFNombreContacto    Direccion=RFDireccionContacto    Comentarios=RFComentariosContacto    Telefono=88180808080

*** Test Cases ***
Crear - TAB Datos de Razon Social - Validar etiquetas
    [Documentation]    Debera mostrar correctamente escritas las etiquetas.
    [Tags]    Crear - TAB Datos de Razon Social - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Sleep    2
    Presionar opcion Nuevo Registro
    Validar etiquetas
    [Teardown]    Close Browser
    
Crear - TAB Datos de Razon Social - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente la Razón Social en la Base de datos.
    [Tags]    Crear - TAB Datos de Razon Social - Validar opcion Guardar - T106
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Sleep    2
    Presionar opcion Nuevo Registro
    Capturar datos del formulario    ${RSCrear}[Nombre]    ${RSCrear}[RNP]
    Sleep    1
    Presionar opcion Guardar
    Sleep    1
    Validar mensaje    Cambios guardados.
    Obtener datos del formulario
    Validar Razon Social en BD
    [Teardown]    Close Browser
    
Crear - TAB Datos de Razon Social - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de crear y no guardar nada en la Base de datos.
    [Tags]    Crear - TAB Datos de Razon Social - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Sleep    2
    Presionar opcion Nuevo Registro
    Capturar datos del formulario    ${RSCrear}[Nombre]    ${RSCrear}[RNP]
    Sleep    1
    Obtener datos del formulario
    Presionar opcion Cancelar
    Sleep    1
    Validar Razon Social inexistente en BD
    Validar retorno a Grid de Resultados    ${xpathGridBody}
    [Teardown]    Close Browser
    
Crear - TAB Datos de Razon Social - Nombre duplicado
    [Documentation]    Debera mostrar una validacion indicando que el registro esta duplicado.
    [Tags]    Crear - TAB Datos de Razon Social - Nombre duplicado - T107
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Sleep    2
    Presionar opcion Nuevo Registro
    Capturar datos del formulario Nombre duplicado    ${RSCrear}[RNP]
    Sleep    1
    Presionar opcion Guardar
    Obtener datos del formulario
    Validar mensaje    Nombre o RNP de Raz\u00F3n Social ya existe, favor de verificarlo.
    Validar Razon Social inexistente en BD
    [Teardown]    Close Browser
    
Crear - TAB Datos de Razon Social - RNP duplicado
    [Documentation]    Debera mostrar una validacion indicando que el RNP esta duplicado.
    [Tags]    Crear - TAB Datos de Razon Social - RNP duplicado
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Sleep    2
    Presionar opcion Nuevo Registro
    Capturar datos del formulario RNP duplicado    ${RSCrear}[Nombre]
    Sleep    1
    Presionar opcion Guardar
    Obtener datos del formulario
    Validar mensaje    Nombre o RNP de Raz\u00F3n Social ya existe, favor de verificarlo.
    Validar Razon Social inexistente en BD
    [Teardown]    Close Browser
    
Crear - TAB Datos de Razon Social - Validar campos requeridos
    [Documentation]    Debera mostrar en rojo los campos obligatorios.
    [Tags]    Crear - TAB Datos de Razon Social - Validar campos requeridos
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Sleep    2
    Presionar opcion Nuevo Registro
    Sleep    1
    Presionar opcion Guardar
    Sleep    1
    Validar campos obligatorios
    [Teardown]    Close Browser
    
Crear - TAB Contactos - Validar etiquetas
    [Documentation]    Debera mostrar correctamente escritas las etiquetas.
    [Tags]    Crear - TAB Contactos - Validar etiquetas
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Sleep    2
    Presionar opcion Nuevo Registro
    Capturar datos del formulario    ${RSCrear}[Nombre]    ${RSCrear}[RNP]
    Sleep    1
    Presionar opcion Guardar
    Sleep    1
    Obtener datos del formulario
    Validar Razon Social en BD
    Ingresar a opcion Contactos
    Validar etiquetas TAB Contactos
    [Teardown]    Close Browser
    
Crear - TAB Contactos - Validar opcion Guardar
    [Documentation]    Debera guardar correctamente el contacto en la Base de datos.
    [Tags]    Crear - TAB Contactos - Validar opcion Guardar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Sleep    2
    Presionar opcion Nuevo Registro
    Capturar datos del formulario    ${RSCrear}[Nombre]    ${RSCrear}[RNP]
    Sleep    1
    Presionar opcion Guardar
    Sleep    1
    Obtener datos del formulario
    Validar Razon Social en BD
    Ingresar a opcion Contactos
    Sleep    1
    Capturar datos del contacto    ${RSContactoCrear}[Nombre]    ${RSContactoCrear}[Direccion]    ${RSContactoCrear}[Comentarios]
    Presionar opcion Guardar Contacto
    Sleep    1
    Obtener datos del Grid Contacto
    Validar contacto en BD
    [Teardown]    Close Browser
    
Crear - TAB Contactos - Validar opcion Cancelar
    [Documentation]    Debera cancelar la accion de agregar contacto sin guardar en la Base de datos.
    [Tags]    Crear - TAB Contactos - Validar opcion Cancelar
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Sleep    2
    Presionar opcion Nuevo Registro
    Capturar datos del formulario    ${RSCrear}[Nombre]    ${RSCrear}[RNP]
    Sleep    1
    Presionar opcion Guardar
    Sleep    1
    Obtener datos del formulario
    Validar Razon Social en BD
    Ingresar a opcion Contactos
    Sleep    1
    Capturar datos del contacto    ${RSContactoCrear}[Nombre]    ${RSContactoCrear}[Direccion]    ${RSContactoCrear}[Comentarios]
    Presionar opcion Cancelar Contacto
    Validar campos vacios
    [Teardown]    Close Browser
    
Crear - TAB Contactos - Agregar Telefono
    [Documentation]    Debera guardar correctamente un telefono en la Base de datos.
    [Tags]    Crear - TAB Contactos - Agregar Telefono
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Sleep    2
    Presionar opcion Nuevo Registro
    Capturar datos del formulario    ${RSCrear}[Nombre]    ${RSCrear}[RNP]
    Sleep    1
    Presionar opcion Guardar
    Sleep    1
    Obtener datos del formulario
    Validar Razon Social en BD
    Ingresar a opcion Contactos
    Sleep    1
    Capturar datos del contacto    ${RSContactoCrear}[Nombre]    ${RSContactoCrear}[Direccion]    ${RSContactoCrear}[Comentarios]
    Presionar opcion Guardar Contacto
    Sleep    1
    Obtener datos del Grid Contacto
    Validar contacto en BD
    Presionar opcion Detalle de contacto
    Sleep    1
    Capturar telefono    ${RSContactoCrear}[Telefono]
    Presionar opcion Agregar Telefono
    Sleep    1
    Obtener datos del Grid Telefono
    Validar telefono en BD
    [Teardown]    Close Browser
    
Crear - TAB Contactos - Eliminar Telefono
    [Documentation]    Debera eliminar el telefono correctamente.
    [Tags]    Crear - TAB Contactos - Eliminar Telefono
    Iniciar sesion
    Sleep    1
    Ingresar a opcion Razon Social
    Sleep    2
    Presionar opcion Nuevo Registro
    Capturar datos del formulario    ${RSCrear}[Nombre]    ${RSCrear}[RNP]
    Sleep    1
    Presionar opcion Guardar
    Sleep    1
    Obtener datos del formulario
    Validar Razon Social en BD
    Ingresar a opcion Contactos
    Sleep    1
    Capturar datos del contacto    ${RSContactoCrear}[Nombre]    ${RSContactoCrear}[Direccion]    ${RSContactoCrear}[Comentarios]
    Presionar opcion Guardar Contacto
    Sleep    1
    Obtener datos del Grid Contacto
    Validar contacto en BD
    Presionar opcion Detalle de contacto
    Sleep    1
    Capturar telefono    ${RSContactoCrear}[Telefono]
    Presionar opcion Agregar Telefono
    Sleep    1
    Obtener datos del Grid Telefono
    Validar telefono en BD
    Presionar opcion Eliminar Telefono
    Sleep    1
    Confirmar accion    div=5
    Sleep    1
    Validar telefono eliminado en BD
    [Teardown]    Close Browser
    
*** Keywords ***
Presionar opcion Nuevo Registro
    Click Element    xpath=//*[@id="divContainer"]/div[1]/div[1]/div[2]/div/div
    Wait Until Element Is Visible    xpath=//*[@id="razonSocial"]/div/div[4]/div/div[2]
    
Capturar datos del formulario
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
    
Capturar datos del formulario Nombre duplicado
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
    
Capturar datos del formulario RNP duplicado
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
    #FOR    ${INDEX}    IN RANGE    1    9
    #    Press Keys    xpath=//*[@id="cboEstado"]/div[1]/div/div[1]/input    ARROW_DOWN
    #    Exit For Loop If    ${INDEX} == 8
    #END
    Click Element    id=cboEstado
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    #Sleep    0.5
    #Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[4]
    Execute Javascript    document.evaluate('/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[4]',document.body,null,9,null).singleNodeValue.click();
    
Seleccionar Municipio
    #Wait Until Element Is Visible    xpath=//*[@id="cboMunicipio"]/div[1]/div/div[1]/input
    #FOR    ${INDEX}    IN RANGE    1    7
    #    Press Keys    xpath=//*[@id="cboMunicipio"]/div[1]/div/div[1]/input    ARROW_DOWN
    #    Exit For Loop If    ${INDEX} == 6
    #END
    Click Element    id=cboMunicipio
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    #Sleep    0.5
    #Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[3]
    Execute Javascript    document.evaluate('/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[3]',document.body,null,9,null).singleNodeValue.click();
    
Seleccionar Localidad
    #Wait Until Element Is Visible    xpath=//*[@id="cboLocalidad"]/div[1]/div/div[1]/input
    #FOR    ${INDEX}    IN RANGE    1    47
    #    Press Keys    xpath=//*[@id="cboLocalidad"]/div[1]/div/div[1]/input    ARROW_DOWN
    #    Exit For Loop If    ${INDEX} == 46
    #END
    Click Element    id=cboLocalidad
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[1]
    #Sleep    0.5
    #Click Element    xpath=/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[6]
    Execute Javascript    document.evaluate('/html/body/div[4]/div/div/div/div[1]/div/div[1]/div[2]/div[6]',document.body,null,9,null).singleNodeValue.click();
    
Capturar datos del contacto
    [Arguments]    ${arg1}    ${arg2}    ${arg3}
    Input Text    xpath=//*[@id="txtNombreContacto"]/div/div[1]/input    ${arg1}
    Input Text    xpath=//*[@id="txtDireccion"]/div/div[1]/input    ${arg2}
    Input Text    xpath=//*[@id="txtComentarios"]/div/div[1]/textarea    ${arg3}
    
Validar campos obligatorios
    ${attrNombre}=    Get Element Attribute    xpath=//*[@id="txtNombre"]    textContent
    ${attrRNP}    Get Element Attribute    xpath=//*[@id="txtRnpTitular"]    textContent
    ${Estado}    Execute Javascript    return document.getElementsByClassName("sismep-selectbox dx-selectbox dx-textbox dx-texteditor dx-dropdowneditor-button-visible dx-editor-outlined dx-widget dx-dropdowneditor dx-dropdowneditor-field-clickable dx-validator dx-visibility-change-handler dx-texteditor-empty dx-invalid")[0].textContent;
    ${attrEstado}    Execute Javascript    cadena='${Estado}'; return cadena.substr(length-11);
    ${Municipio}    Execute Javascript    return document.getElementsByClassName("sismep-selectbox dx-selectbox dx-textbox dx-texteditor dx-dropdowneditor-button-visible dx-editor-outlined dx-widget dx-dropdowneditor dx-dropdowneditor-field-clickable dx-validator dx-visibility-change-handler dx-texteditor-empty dx-invalid")[0].textContent;
    ${attrMunicipio}=    Execute Javascript    cadena='${Municipio}'; return cadena.substr(length-11);
    ${Localidad}    Execute Javascript    return document.getElementsByClassName("sismep-selectbox dx-selectbox dx-textbox dx-texteditor dx-dropdowneditor-button-visible dx-editor-outlined dx-widget dx-dropdowneditor dx-dropdowneditor-field-clickable dx-validator dx-visibility-change-handler dx-texteditor-empty dx-invalid")[0].textContent;
    ${attrLocalidad}=    Execute Javascript    cadena='${Localidad}'; return cadena.substr(length-11);
    Should be equal    ${attrNombre}    Obligatorio
    Should be equal    ${attrRNP}    Obligatorio
    Should be equal    ${attrEstado}    Obligatorio
    Should be equal    ${attrMunicipio}    Obligatorio
    Should be equal    ${attrLocalidad}    Obligatorio
    
Validar etiquetas
    ${Titulo}=    Get text    xpath:/html/body/div[3]/div/div[1]/div/div[1]/div/div/div
    ${TabRS}=    Get text    xpath://*[@id="tabRazonSocial"]
    ${Estatus}=    Get text    xpath://*[@id="razonSocial"]/div/div[1]/div[1]
    ${Nombre}=    Get text    xpath://*[@id="razonSocial"]/div/div[2]/div[1]
    ${RNPTitular}=    Get text    xpath://*[@id="razonSocial"]/div/div[3]/div[1]
    ${Estado}=    Get text    xpath://*[@id="razonSocial"]/div/div[1]/div[3]
    ${Municipio}=    Get text    xpath://*[@id="razonSocial"]/div/div[2]/div[3]
    ${Localidad}=    Get text    xpath://*[@id="razonSocial"]/div/div[3]/div[3]
    Should Be Equal As Strings    ${Titulo}    Nueva Raz\u00F3n Social
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
    Element Text Should Be    xpath=//*[@id="dx-col-23"]/div[2]    Nombre
    Element Text Should Be    xpath=//*[@id="dx-col-24"]/div[2]    Direcci\u00F3n
    Element Text Should Be    xpath=//*[@id="dx-col-25"]/div[3]    Estatus
    Element Text Should Be    xpath=//*[@id="gridContactos"]/div/div[5]/div/table/tbody/tr[1]/td[4]/div    Detalle