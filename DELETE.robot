 *** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://api.restful-api.dev
${ENDPOINT}    /objects/ff8081819782e69e019bc56ad1335956

*** Test Cases ***
Delete Object
    Create Session    deletereq    ${BASE_URL}

    ${response}=    DELETE On Session
    ...    deletereq
    ...    ${ENDPOINT}

    Log    ${response.status_code}
    Log    ${response.content}

    Should Be Equal As Numbers    ${response.status_code}    200
