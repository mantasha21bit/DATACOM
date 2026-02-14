*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    Firefox

*** Test Cases ***
Launch browser
    [Documentation]    This testcase verifies the logins scenario with valid credentials
    Open Browser    https://the-internet.herokuapp.com/    ${browser}
    Maximize Browser Window

    # Right click
    Open Context Menu    xpath://a[normalize-space()='A/B Testing']
    Sleep    2s

    # Double click
    Double Click Element    xpath://a[normalize-space()='Dynamic Loading']
    Sleep    2s

    Wait Until Element Is Visible    xpath://h3[normalize-space()='Dynamically Loaded Page Elements']
    Close Browser
