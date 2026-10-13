*** Settings ***
Resource          ../../Recursos.Generales.robot

*** Variables ***
${horasUTC}    6
&{Embarcacion}    Nombre=AZTECA 8    RNP=00045930    Matricula=2503036133-5
${JSLatitudDMS}    function LatitudDMS(latitud) {var absoluto = Math.abs(latitud); var grados = Math.floor(absoluto); var minutosnotruncados = (absoluto - grados) * 60; var minutos = Math.floor(minutosnotruncados); var segundos = Math.round((minutosnotruncados - minutos) * 60); var direccion = latitud >= 0 ? "N" : "S"; return grados + "\u00B0 " + minutos + "' " + segundos + '\u0022 ' + direccion;};
${JSLongitudDMS}    function LongitudDMS(longitud) {var absoluto = Math.abs(longitud); var grados = Math.floor(absoluto); var minutosnotruncados = (absoluto - grados) * 60; var minutos = Math.floor(minutosnotruncados); var segundos = Math.round((minutosnotruncados - minutos) * 60); var direccion = longitud >= 0 ? "E" : "W"; return grados + "\u00B0 " + minutos + "' " + segundos + '\u0022 ' + direccion;};

*** Keywords ***
Presionar opcion Buscar Embarcacion
    Wait Until Element Is Visible    xpath=//*[@id="divPanelControles"]/button[4]
    Click Element    xpath=//*[@id="divPanelControles"]/button[4]
    
Filtrar Embarcacion por Columna ${COL}, Campo ${CAMPO}
    Wait Until Element Is Visible    xpath=//*[@id="ddblBuscarVehiculo"]/div[1]/div/div[2]/div/div/div    timeout=15
    Click Element    xpath=//*[@id="ddblBuscarVehiculo"]/div[1]/div/div[2]/div/div/div
    Wait Until Element Is Visible    xpath=//*[@id="ddblBuscarVehiculo_template"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    timeout=15
    Input Text    xpath=//*[@id="ddblBuscarVehiculo_template"]/div/div[5]/div/table/tbody/tr[2]/td[${COL}]/div/div[2]/div/div/div[1]/input    ${CAMPO}
    Sleep    1
    Click Element    xpath=//*[@id="ddblBuscarVehiculo_template"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]