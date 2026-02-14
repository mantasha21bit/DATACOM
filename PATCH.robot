*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://api.restful-api.dev
${ENDPOINT}    /objects/ff8081819782e69e019bc56ad1335956

*** Test Cases ***
Patch Object
    Create Session    patchreq    ${BASE_URL}

    ${body}=    Create Dictionary
    ...    name=Apple MacBook Pro 16 (updated name harsha)

    ${response}=    PATCH On Session
    ...    patchreq
    ...    ${ENDPOINT}
    ...    json=${body}

    Log    ${response.status_code}
    Log    ${response.content}

    Should Be Equal As Numbers    ${response.status_code}    200
