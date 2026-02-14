*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    Firefox

*** Test Cases ***
Launch browser
    [Documentation]    This testcase verifies the logins scenario with valid credentials
    Open Browser    https://the-internet.herokuapp.com/drag_and_drop    ${browser}
    Maximize Browser Window

    # Drag and drop
    Drag And Drop    xpath://div[@id='column-a']    xpath://div[@id='column-b']
    Sleep    2s

    Close Browser
