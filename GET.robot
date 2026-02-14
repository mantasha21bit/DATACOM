*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://api.restful-api.dev/
${ENDPOINT}    objects

*** Test Cases ***
Verify get request
    Create Session    getreq    ${BASE_URL}
    ${response}=    GET On Session    getreq    ${ENDPOINT}

    Log    ${response.status_code}
    Log    ${response.content}

    # assertion to check the status code is 200
    Should Be Equal As Numbers    ${response.status_code}    200
