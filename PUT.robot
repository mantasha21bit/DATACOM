*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://api.restful-api.dev
${ENDPOINT}    /objects/ff8081819782e69e019bc56ad1335956

*** Test Cases ***
Put Object
    Create Session    putreq    ${BASE_URL}

    ${data}=    Create Dictionary
    ...    year=2024
    ...    price=1999.99
    ...    CPU model=Intel Core i9
    ...    Hard disk size=2 TB

    ${body}=    Create Dictionary
    ...    name=Apple MacBook Pro 16 PUT Updated
    ...    data=${data}

    ${response}=    PUT On Session
    ...    putreq
    ...    ${ENDPOINT}
    ...    json=${body}

    Log    ${response.status_code}
    Log    ${response.content}

    Should Be Equal As Numbers    ${response.status_code}    200
