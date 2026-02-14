*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://api.restful-api.dev/
${ENDPOINT}    objects

*** Test Cases ***
Verify post request
    Create Session    postreq    ${BASE_URL}

    ${data}=    Create Dictionary
    ...    year=2019
    ...    price=1849.99
    ...    CPU model=Intel Core i9
    ...    Hard disk size=1 TB

    ${product}=    Create Dictionary
    ...    name=Apple MacBook Pro 16
    ...    data=${data}

    ${headers}=    Create Dictionary    Content-Type=application/json

    ${response}=    POST On Session
    ...    postreq
    ...    ${ENDPOINT}
    ...    json=${product}
    ...    headers=${headers}

    Log    ${response.status_code}
    Log    ${response.content}

    Should Be Equal As Numbers    ${response.status_code}    200
