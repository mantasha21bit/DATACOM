*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome

*** Test Cases ***
Launch browser
    [Documentation]    This testcase verifies the logins scenario with valid credentials
    Open Browser    https://the-internet.herokuapp.com/    ${browser}
    Maximize Browser Window
    Go Back
    Sleep    3s
    Go To    https://the-internet.herokuapp.com/
    Sleep    3s
    Reload Page
    Sleep    3s
    Close Browser
