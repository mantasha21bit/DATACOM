*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome

*** Test Cases ***
Launch browser
    [Documentation]    This testcase verifies the logins scenario with valid credentials
    Open Browser    https://the-internet.herokuapp.com/javascript_alerts    ${browser}
    Maximize Browser Window

    Wait Until Element Is Visible    xpath://button[normalize-space()='Click for JS Alert']
    Click Element    xpath://button[normalize-space()='Click for JS Alert']
    Handle Alert    action=ACCEPT    timeout=3
    Sleep    4s

    Click Element    xpath://button[normalize-space()='Click for JS Confirm']
    Handle Alert    action=DISMISS    timeout=3
    Sleep    4s

    Click Element    xpath://button[normalize-space()='Click for JS Prompt']
    Input Text Into Alert    Hello
    Sleep    4s

    Close Browser
