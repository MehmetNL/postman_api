Language: Dutch

*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           String
Library           OperatingSystem
Library           file_service.py

*** Variables ***
${BASE_URL}       https://postman-echo.com/

*** Test Cases ***
Get Yunus auto info
    ${params}=    Create Dictionary    kenteken=71KRX7
    ${response}=    GET     https://opendata.rdw.nl/resource/m9d7-ebf2.json     params=${params}
    ${json_string}=    Convert To String    ${response.json()}    # Convert list to string
    write to file       ${response.json()}
    ${file_data}=   read file
    Log    ${file_data}
#    Append To File    Temp\\test.txt    ${json_string}
    Should Be Equal As Strings    ${json_string}    ${file_data}
    Should Be Equal As Strings    ${response.json()[0]["merk"]}    MAZDA

Get auto's info
    ${response}=    Get From Dictionary     https://opendata.rdw.nl/resource/m9d7-ebf2.json    key
    Should Be Equal As Strings    ${response.json()[0]["merk"]}    CITROEN
